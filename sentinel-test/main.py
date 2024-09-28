from redis.sentinel import Sentinel

# Konfigurasi Sentinel dan Redis
sentinel_hosts = [('172.16.14.145', 26379)]
sentinel = Sentinel(sentinel_hosts, socket_timeout=0.1)

# Menghubungkan ke master Redis melalui Sentinel
master = sentinel.master_for('mymaster', socket_timeout=0.1)

# Menambahkan data ke Redis
def add_data_to_redis(key, value):
    try:
        master.set(key, value)
        print(f'Data berhasil ditambahkan: {key} -> {value}')
    except Exception as e:
        print(f'Gagal menambahkan data: {e}')

# Pengujian koneksi dan penambahan data
if __name__ == "__main__":
    test_key = 'example_key'
    test_value = 'example_value'
    add_data_to_redis(test_key, test_value)
