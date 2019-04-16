import os

import logging

# This is a minimal configuration to get you started with the Text mode.
# If you want to connect Errbot to chat services, checkout
# the options in the more complete config-template.py from here:
# https://raw.githubusercontent.com/errbotio/errbot/master/errbot/config-template.py

ROOT_DIR = os.path.dirname(__file__)

# BACKEND = 'Text'  # Errbot will start in text mode (console only mode) and will answer commands from there.
BACKEND = 'Slack'

BOT_ADMIN = ('gbin@localhost',)
BOT_IDENTITY = {
    'token': os.environ.get('BOT_TOKEN', None),
}

BOT_DATA_DIR = os.path.join(ROOT_DIR, 'data')
BOT_EXTRA_PLUGIN_DIR = os.path.join(ROOT_DIR, 'plugins')

BOT_LOG_FILE = os.path.join(ROOT_DIR, 'errbot.log')
BOT_LOG_LEVEL = logging.DEBUG

BOT_ADMINS = ('CHANGE ME', )  # !! Don't leave that to "CHANGE ME" if you connect your errbot to a chat system !!
