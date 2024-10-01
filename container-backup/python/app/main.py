#!/usr/bin/env python3

import os
import subprocess
import sys
import time

import config
import utils

config.check_env_vars()
config.check_option()

# Ensure backup directory exists
os.makedirs(config.BACKUP_DIR, exist_ok=True)

# Clone repo
config.log("Cloning repository...")
subprocess.run(["git", "clone", f"https://{config.GITHUB_TOKEN}@{config.GITHUB_REPO_URL}", config.REPO_DIR])

# Change to repo directory
os.chdir(config.REPO_DIR)

# Configure git
subprocess.run(["git", "config", "--global", "user.email", config.GIT_EMAIL])
subprocess.run(["git", "config", "--global", "user.name", config.GIT_USERNAME])


# Run backup or restore based on variable values
if config.OPTION == config.BACKUP_OPTION and config.DB_TYPE == config.PGSQL_TYPE:
    utils.backup_database_pgsql()
elif config.OPTION == config.RESTORE_OPTION and config.DB_TYPE == config.PGSQL_TYPE:
    utils.restore_database_pgsql(config.RESTORE_FILE_NAME)
elif config.OPTION == config.BACKUP_OPTION and config.DB_TYPE == config.MYSQL_TYPE:
    utils.backup_database_mysql()
elif config.OPTION == config.RESTORE_OPTION and config.DB_TYPE == config.MYSQL_TYPE:
    utils.restore_database_mysql(config.RESTORE_FILE_NAME)
else:
    config.log("Error: OPTION or DB_TYPE is incorrect. OPTION = [backup/restore], DB_TYPE = [pgsql/mysql]")
    sys.exit(1)
