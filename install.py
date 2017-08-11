#!/usr/bin/env python2
import logging
import os
import subprocess
from time import sleep

home_dir = os.environ['HOME']
errors = []
for filename in ('.vimrc', '.aliases', 'tmux.conf', '.zshrc', '.gitconfig'):
	command = ['ln', '-s', '%s/configs/%s' % (home_dir, filename), '%s/%s' % (home_dir, filename)]
	try:
		subprocess.check_output(command)
	except subprocess.CalledProcessError as e:
		pass


try:
	subprocess.check_output(['i3', '-v'])
except subprocess.CalledProcessError:
	logging.warning('i3 doesn\'t seem to be installed')
	sys.exit()

i3_config_filename = '%s/.i3/config' % home_dir
startup_scripts_filename = '%s/configs/.startup_scripts' % home_dir
with open(i3_config_filename, 'r') as i3_config:
	i3_config_updated = any('configs/.startup_scripts' in l for l in i3_config.readlines())
if not i3_config_updated:
	with open(i3_config_filename, 'a') as i3_config:
		i3_config.write('\n# Added by configs/install.py\nexec --no-startup-id bash %s\n' % startup_scripts_filename)


for line in open('.startup_scripts'):
	if line.startswith('#'):
		continue
	line = line.strip()
	line = line.replace('&', '')
	line = line.split(' ')
	process = None
	try:
		process = subprocess.Popen(line)

		sleep(0.001)
		return_code = process.poll()
		if return_code < 0 and return_code is not None:
			logging.error('Is something wrong with "%s"? Return code: %s', line, return_code)
	except OSError:
		logging.exception('%s in startup_scripts didn\'t run, it it installed?', line)
	finally:
		if process is not None:
			process.terminate()
