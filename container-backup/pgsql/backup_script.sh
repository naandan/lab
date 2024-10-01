#!/bin/bash

# Configuration variables from environment variables
REPO_DIR="/app/repo"
BACKUP_DIR="/app/backup"

# Function for logging
log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1"
}

# Check if required variables are set
if [ -z "$GITHUB_REPO_URL" ] || [ -z "$GITHUB_TOKEN" ] || [ -z "$GIT_EMAIL" ] || [ -z "$GIT_USERNAME" ] || [ -z "$POSTGRES_DB" ] || [ -z "$POSTGRES_HOST" ] || [ -z "$POSTGRES_PORT" ] || [ -z "$POSTGRES_USER" ] || [ -z "$POSTGRES_PASSWORD" ] || [ -z "$OPTIONS" ]; then
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

# Function to perform backup
backup_database() {
    log "Creating database backup..."
    PGPASSWORD=$POSTGRES_PASSWORD pg_dump -h $POSTGRES_HOST -U $POSTGRES_USER -d $POSTGRES_DB -f "$BACKUP_DIR/${POSTGRES_DB}_$(date +%Y%m%d_%H%M%S).sql"

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
    log "Checking if database $POSTGRES_DB exists..."
    DB_EXISTS=$(PGPASSWORD=$POSTGRES_PASSWORD psql -h $POSTGRES_HOST -U $POSTGRES_USER -d postgres -tAc "SELECT 1 FROM pg_database WHERE datname='$POSTGRES_DB'")
    
    if [ "$DB_EXISTS" != "1" ]; then
        log "Database $POSTGRES_DB does not exist, creating database..."
        PGPASSWORD=$POSTGRES_PASSWORD psql -h $POSTGRES_HOST -U $POSTGRES_USER -d postgres -c "CREATE DATABASE $POSTGRES_DB"
        log "Database $POSTGRES_DB created successfully."
    else
        log "Database $POSTGRES_DB already exists."
    fi

    log "Restoring database from backup $BACKUP_FILE..."
    PGPASSWORD=$POSTGRES_PASSWORD psql -h $POSTGRES_HOST -U $POSTGRES_USER -d $POSTGRES_DB < $BACKUP_FILE

    log "Restore process completed successfully."
}


# Run backup or restore based on the variable value
if [ "$OPTIONS" == "backup" ]; then
    backup_database
elif [ "$OPTIONS" == "restore" ]; then
    if [ -z "$RESTORE_FILE_NAME" ]; then
        log "Error: Backup file name must be provided with RESTORE_FILE_NAME variable for restore."
        exit 1
    fi
    restore_database "$RESTORE_FILE_NAME"
else
    log "Error: No action selected. Set OPTIONS=backup for backup or OPTIONS=restore for restore."
    exit 1
fi