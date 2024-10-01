import os
import sys
import logging

required_env_vars = [
    "GITHUB_REPO_URL", "GITHUB_TOKEN", "GIT_EMAIL", "GIT_USERNAME", 
    "DB_TYPE", "DB_NAME", "DB_HOST", "DB_PORT", "DB_USER", "DB_PASSWORD",
    "OPTION"
]

root_logger = logging.getLogger()
root_logger.setLevel(logging.INFO)
handler = logging.StreamHandler(sys.stdout)
handler.setLevel(logging.INFO)
formatter = logging.Formatter('%(asctime)s - %(levelname)s - %(message)s')
handler.setFormatter(formatter)
root_logger.addHandler(handler)

def log(message):
    root_logger.info(message)

def check_env_vars():
    for var in required_env_vars:
        if not os.getenv(var):
            log(f"Error: Environment variable {var} is not set.")
            sys.exit(1)

REPO_DIR = "/app/repo"
BACKUP_DIR = "/app/backup"

GITHUB_REPO_URL = os.getenv("GITHUB_REPO_URL")
GITHUB_TOKEN = os.getenv("GITHUB_TOKEN")
GIT_EMAIL = os.getenv("GIT_EMAIL")
GIT_USERNAME = os.getenv("GIT_USERNAME")
DB_TYPE = os.getenv("DB_TYPE")
DB_NAME = os.getenv("DB_NAME")
DB_HOST = os.getenv("DB_HOST")
DB_PORT = os.getenv("DB_PORT")
DB_USER = os.getenv("DB_USER")
DB_PASSWORD = os.getenv("DB_PASSWORD")
OPTION = os.getenv("OPTION")
RESTORE_FILE_NAME = os.getenv("RESTORE_FILE_NAME")

BACKUP_OPTION = "backup"
RESTORE_OPTION = "restore"

PGSQL_TYPE = "pgsql"
MYSQL_TYPE = "mysql"

def check_option():
    if OPTION == BACKUP_OPTION:
        log("Backup database")
    elif OPTION == RESTORE_OPTION:
        log("Restore database")
        if not RESTORE_FILE_NAME:
            log("Error: Environment variable RESTORE_FILE_NAME is not set.")
            sys.exit(1)
    else:
        log("Error: Environment variable OPTION is not set.")
        sys.exit(1)