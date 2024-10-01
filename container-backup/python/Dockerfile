FROM python:3.10-slim

# Install dependencies and repositories for PostgreSQL 16 and MySQL 8
RUN apt-get update && apt-get install -y git lsb-release gnupg2 wget curl \
    # Setup PostgreSQL repository
    && mkdir -p /etc/apt/keyrings \
    && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | gpg --dearmor -o /etc/apt/keyrings/pgdg.gpg \
    && echo "deb [signed-by=/etc/apt/keyrings/pgdg.gpg] http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
    # Setup MySQL repository
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B7B3B788A8D3785C \
    && wget https://dev.mysql.com/get/mysql-apt-config_0.8.24-1_all.deb \
    && DEBIAN_FRONTEND=noninteractive dpkg -i mysql-apt-config_0.8.24-1_all.deb \
    # Update and install PostgreSQL and MySQL clients
    && apt-get update \
    && apt-get install -y postgresql-client-16 mysql-client \
    # Clean up
    && rm -rf /var/lib/apt/lists/* \
    && rm mysql-apt-config_0.8.24-1_all.deb

WORKDIR /app

COPY app .

CMD ["python3", "/app/main.py"]
