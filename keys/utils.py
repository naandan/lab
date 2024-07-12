from cryptography.hazmat.primitives import serialization, hashes
from cryptography.hazmat.primitives.asymmetric import rsa, padding
import base64
from dotenv import load_dotenv
import os
load_dotenv()

def generate_private_key(filename = 'private-key.pem'):
    private_key = rsa.generate_private_key(
        public_exponent=65537,
        key_size=2048
    )

    pem_private_key = private_key.private_bytes(
        encoding=serialization.Encoding.PEM,
        format=serialization.PrivateFormat.PKCS8,
        encryption_algorithm=serialization.NoEncryption()
    )

    print(pem_private_key.decode('utf-8'))

    with open(f'./results/{filename}', 'wb') as file:
        file.write(pem_private_key)

    print("Private key telah disimpan.")

def encrypt_private_key(private_key, password, filename = 'encrypted-private-key.pem'):
    with open(private_key, 'rb') as file:
        private_key = serialization.load_pem_private_key(
            file.read(),
            password=None
        )
    
    encrypted_pem = private_key.private_bytes(
        encoding=serialization.Encoding.PEM,
        format=serialization.PrivateFormat.PKCS8,
        encryption_algorithm=serialization.BestAvailableEncryption(password.encode('utf-8'))
    )

    print(encrypted_pem.decode('utf-8'))

    with open(f'./results/{filename}', 'wb') as file:
        file.write(encrypted_pem)

    print("Private key telah dikunci dan disimpan.")

def read_locked_private_key(path, password, filename = 'decrypted-private-key.pem'):
    try:
        with open(path, 'rb') as file:
            private_key = serialization.load_pem_private_key(
                file.read(),
                password=password.encode('utf-8')
            )
    except ValueError:
        print("Private key gagal didekripsi. Pastikan password yang Anda masukkan benar.")
        return
    
    pem_private_key = private_key.private_bytes(
        encoding=serialization.Encoding.PEM,
        format=serialization.PrivateFormat.PKCS8,
        encryption_algorithm=serialization.NoEncryption()
    )

    print(pem_private_key.decode('utf-8'))

    with open(f'./results/{filename}', 'wb') as file:
        file.write(pem_private_key)

    print("Private key telah didekripsi dan disimpan.")

def read_private_key(path, filename = 'read-private-key.pem'):
    with open(path, 'rb') as file:
        private_key = serialization.load_pem_private_key(
            file.read(),
            password=None
        )
    pem_private_key = private_key.private_bytes(
        encoding=serialization.Encoding.PEM,
        format=serialization.PrivateFormat.PKCS8,
        encryption_algorithm=serialization.NoEncryption()
    )

    print(pem_private_key.decode('utf-8'))

    with open(f'./results/{filename}', 'wb') as file:
        file.write(pem_private_key)

    print("Private key telah didekripsi dan disimpan.")

def private_key_to_single_line(path):
    with open(path, 'rb') as file:
        private_key = file.read()

    private_key = private_key.decode('utf-8')

    private_key = private_key.replace('\n', '\\n')

    print(private_key)

    with open(f'./results/private-key.txt', 'w') as file:
        file.write(private_key)
    
    print("Private key satu baris telah disimpan.")

def read_from_env(password=None, filename = 'from-env-private-key.pem'):
    load_dotenv()
    PRIVATE_KEY = os.getenv('PRIVATE_KEY')
    private_key_pem = PRIVATE_KEY.replace('\\n', '\n').encode('utf-8')

    if password:
        password = password.encode('utf-8')
    
    private_key = serialization.load_pem_private_key(
        private_key_pem,
        password=password
    )

    pem_private_key = private_key.private_bytes(
        encoding=serialization.Encoding.PEM,
        format=serialization.PrivateFormat.PKCS8,
        encryption_algorithm=serialization.NoEncryption()
    )

    print(pem_private_key.decode('utf-8'))

    with open(f'./results/{filename}', 'wb') as file:
        file.write(pem_private_key)

    print("Private key telah didekripsi dan disimpan.")

# generate_private_key('created-private-key.pem')
# encrypt_private_key('./results/created-private-key.pem', 'Tahun2024,-')
# read_locked_private_key('./results/encrypted-private-key.pem', 'Tahun2024,-')
# read_private_key('./results/decrypted-private-key.pem')
# private_key_to_single_line('./results/encrypted-private-key.pem')
# read_from_env('Tahun2024,-')


def create_private_and_public_keys():
    private_key = rsa.generate_private_key(
        public_exponent=65537,
        key_size=2048
    )

    public_key = private_key.public_key()

    with open('./results/private-key.pem', 'wb') as file:
        file.write(private_key.private_bytes(
            encoding=serialization.Encoding.PEM,
            format=serialization.PrivateFormat.PKCS8,
            encryption_algorithm=serialization.NoEncryption()
        ))

    with open('./results/public-key.pem', 'wb') as file:
        file.write(public_key.public_bytes(
            encoding=serialization.Encoding.PEM,
            format=serialization.PublicFormat.SubjectPublicKeyInfo
        ))

    print("Private key dan public key telah disimpan.")

def encrypt_something(message: str):
    with open("./results/public-key.pem", "rb") as f:
        public_key = serialization.load_pem_public_key(
            f.read()
        )

    encrypted_message = public_key.encrypt(
        message.encode("utf-8"),
        padding.PKCS1v15()
    )

    encrypted_message = base64.b64encode(encrypted_message).decode("utf-8")
    print("Pesan terenkripsi:", encrypted_message)

    return encrypted_message

def decrypt_something(encrypted_message):
    with open("./results/private-key.pem", "rb") as f:
        private_key = serialization.load_pem_private_key(
            f.read(),
            password=None
        )

    encrypted_message = base64.b64decode(encrypted_message.encode("utf-8"))

    decrypted_message = private_key.decrypt(
        encrypted_message,
        padding.PKCS1v15()
    )

    print("Pesan terdekripsi:", decrypted_message.decode("utf-8"))

# create_private_and_public_keys()
# encrypted = encrypt_something("Hello, World!")
# decrypt_something(encrypted)

