import os
import subprocess
from datetime import datetime
import sys
import config

def push_to_repo():
    config.log("Pushing changes to repository...")
    subprocess.run(["git", "add", "."])
    commit_message = f"Backup database on {datetime.now().strftime('%Y-%m-%d')}"
    subprocess.run(["git", "commit", "-m", commit_message])
    subprocess.run(["git", "push", f"https://{config.GITHUB_TOKEN}@{config.GITHUB_REPO_URL}"])

def backup_database_pgsql():
    config.log("Creating database backup...")
    backup_file = f"{config.BACKUP_DIR}/{config.DB_NAME}_{datetime.now().strftime('%Y%m%d_%H%M%S')}.sql"
    with open(backup_file, "w") as f:
        result = subprocess.run([
            "pg_dump", "-h", config.DB_HOST, "-U", config.DB_USER, "-d", config.DB_NAME
        ], env={"PGPASSWORD": config.DB_PASSWORD}, stdout=f)

        if result.returncode != 0:
            config.log("Error: Database backup failed.")
            sys.exit(1)

    # Move backup to repo
    subprocess.run(["mv", backup_file, config.REPO_DIR])

    # Add, commit, and push changes
    push_to_repo()

    config.log("Backup process completed successfully.")

# Function to perform restore
def restore_database_pgsql(backup_file_name):
    backup_file = os.path.join(config.REPO_DIR, backup_file_name)

    if not os.path.isfile(backup_file):
        config.log(f"Error: Backup file {backup_file} not found.")
        sys.exit(1)

    # Check if database exists
    config.log(f"Checking if database {config.DB_NAME} exists...")
    db_exists = subprocess.run([
        "psql", "-h", config.DB_HOST, "-U", config.DB_USER, "-d", "postgres",
        "-tAc", f"SELECT 1 FROM pg_database WHERE datname='{config.DB_NAME}'"
    ], env={"PGPASSWORD": config.DB_PASSWORD}, capture_output=True, text=True).stdout.strip()

    if db_exists != "1":
        config.log(f"Database {config.DB_NAME} does not exist, creating database...")
        subprocess.run([
            "psql", "-h", config.DB_HOST, "-U", config.DB_USER, "-d", "postgres",
            "-c", f"CREATE DATABASE {config.DB_NAME}"
        ], env={"PGPASSWORD": config.DB_PASSWORD})
        config.log(f"Database {config.DB_NAME} created successfully.")
    else:
        config.log(f"Database {config.DB_NAME} already exists.")

    # Restore database from backup file
    config.log(f"Restoring database from backup {backup_file}...")
    with open(backup_file, "r") as f:
        subprocess.run([
            "psql", "-h", config.DB_HOST, "-U", config.DB_USER, "-d", config.DB_NAME
        ], env={"PGPASSWORD": config.DB_PASSWORD}, stdin=f)

    config.log("Restore process completed successfully.")

def backup_database_mysql():
    os.environ['MYSQL_PWD'] = config.DB_PASSWORD
    config.log("Creating database backup...")
    backup_file = f"{config.BACKUP_DIR}/{config.DB_NAME}_{datetime.now().strftime('%Y%m%d_%H%M%S')}.sql"
    with open(backup_file, "w") as f:
        result = subprocess.run([
            "mysqldump", "-h", config.DB_HOST, "-u", config.DB_USER, config.DB_NAME
        ], stdout=f)

        if result.returncode != 0:
            config.log("Error: Database backup failed.")
            sys.exit(1)

    # Move backup to repo
    subprocess.run(["mv", backup_file, config.REPO_DIR])

    # Add, commit, and push changes
    push_to_repo()

    config.log("Backup process completed successfully.")

def restore_database_mysql(backup_file_name):
    os.environ['MYSQL_PWD'] = config.DB_PASSWORD
    backup_file = os.path.join(config.REPO_DIR, backup_file_name)
    
    if not os.path.isfile(backup_file):
        config.log(f"Error: Backup file {backup_file} not found.")
        sys.exit(1)

    # Check if database exists
    config.log(f"Checking if database {config.DB_NAME} exists...")
    db_exists = subprocess.run([
        "mysql", "-h", config.DB_HOST, "-u", config.DB_USER,
        "-e", f"SHOW DATABASES LIKE '{config.DB_NAME}'"
    ], capture_output=True, text=True).stdout.strip()

    if db_exists != config.DB_NAME:
        config.log(f"Database {config.DB_NAME} does not exist, creating database...")
        subprocess.run([
            "mysql", "-h", config.DB_HOST, "-u", config.DB_USER,
            "-e", f"CREATE DATABASE {config.DB_NAME}"
        ])
        config.log(f"Database {config.DB_NAME} created successfully.")
    else:
        config.log(f"Database {config.DB_NAME} already exists.")

    # Restore database from backup file
    config.log(f"Restoring database from backup {backup_file}...")
    with open(backup_file, "r") as f:
        subprocess.run([
            "mysql", "-h", config.DB_HOST, "-u", config.DB_USER,
            config.DB_NAME
        ], stdin=f)

    config.log("Restore process completed successfully.")
