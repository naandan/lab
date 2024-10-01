#!/bin/bash

# Configuration variables from environment variables
REPO_DIR="/app/repo"
BACKUP_DIR="/app/backup"

# Function for logging
log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1"
}

# Check if required variables are set
if [ -z "$GITHUB_REPO_URL" ] || [ -z "$GITHUB_TOKEN" ] || [ -z "$GIT_EMAIL" ] || [ -z "$GIT_USERNAME" ] || [ -z "$MYSQL_DB" ] || [ -z "$MYSQL_HOST" ] || [ -z "$MYSQL_PORT" ] || [ -z "$MYSQL_USER" ] || [ -z "$MYSQL_PASSWORD" ] || [ -z "$OPTIONS" ]; then
    log "Error: One or more required environment variables are not set."
    exit 1
fi

# Ensure backup directory exists
mkdir -p $BACKUP_DIR

# Clone repo
log "Cloning repository..."
git clone https://${GITHUB_TOKEN}@${GITHUB_REPO_URL} $REPO_DIR

# Enter repo directory
cd $REPO_DIR

# Configure git
git config user.email "$GIT_EMAIL"
git config user.name "$GIT_USERNAME"

export MYSQL_PWD=$MYSQL_PASSWORD

# Function to perform backup
backup_database() {
    log "Creating database backup..."
    mysqldump -h $MYSQL_HOST -P $MYSQL_PORT -u $MYSQL_USER $MYSQL_DB > "$BACKUP_DIR/${MYSQL_DB}_$(date +%Y%m%d_%H%M%S).sql"

    # Move backup to repo
    mv $BACKUP_DIR/*.sql $REPO_DIR/

    # Add, commit, and push changes
    log "Pushing changes to repository..."
    git add .
    git commit -m "Backup database on $(date +%Y-%m-%d)"
    git push https://${GITHUB_TOKEN}@${GITHUB_REPO_URL}

    log "Backup process completed successfully."
}

# Function to perform restore
restore_database() {
    if [ -z "$1" ]; then
        log "Error: Backup file name must be provided for restore."
        exit 1
    fi

    BACKUP_FILE="$REPO_DIR/$1"

    if [ ! -f "$BACKUP_FILE" ]; then
        log "Error: Backup file $BACKUP_FILE not found."
        exit 1
    fi

    # Create database if it doesn't exist
    log "Checking if database $MYSQL_DB exists..."
    DB_EXISTS=$(mysql -h $MYSQL_HOST -P $MYSQL_PORT -u $MYSQL_USER -e "SHOW DATABASES LIKE '$MYSQL_DB';" | grep "$MYSQL_DB")

    if [ -z "$DB_EXISTS" ]; then
        log "Database $MYSQL_DB does not exist, creating database..."
        mysql -h $MYSQL_HOST -P $MYSQL_PORT -u $MYSQL_USER -e "CREATE DATABASE $MYSQL_DB;"
        log "Database $MYSQL_DB created successfully."
    else
        log "Database $MYSQL_DB already exists."
    fi

    log "Restoring database from backup $BACKUP_FILE..."
    mysql -h $MYSQL_HOST -P $MYSQL_PORT -u $MYSQL_USER $MYSQL_DB < $BACKUP_FILE

    log "Restore process completed successfully."
}

# Main logic to handle backup or restore based on OPTIONS
if [ "$OPTIONS" == "backup" ]; then
    backup_database
elif [ "$OPTIONS" == "restore" ]; then
    if [ -z "$RESTORE_FILE_NAME" ]; then
        log "Error: Backup file name must be provided with RESTORE_FILE_NAME variable for restore."
        exit 1
    fi
    restore_database "$RESTORE_FILE_NAME"
else
    log "Error: Invalid option provided. Set OPTIONS=backup for backup or OPTIONS=restore for restore."
    exit 1
fi
