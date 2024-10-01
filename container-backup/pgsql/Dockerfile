FROM postgres:16

# Install git
RUN apt-get update && apt-get install -y git

# Copy script ke dalam container
COPY backup_script.sh /app/backup_script.sh

# Buat direktori kerja
WORKDIR /app

# Buat script dapat dieksekusi
RUN chmod +x /app/backup_script.sh

# Jalankan script saat container dimulai
CMD ["/app/backup_script.sh"]