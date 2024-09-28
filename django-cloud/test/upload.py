import requests
from requests.auth import HTTPBasicAuth

url = 'http://172.16.14.145:8080/remote.php/dav/files/nandan'
folder_name = 'hello'
file_name = 'foto.jpg'
file_path = './foto.jpg'
username = 'nandan'
password = 'Tahun2024,-'

folder_url = f'{url}/{folder_name}'

response = requests.request('MKCOL', folder_url, auth=HTTPBasicAuth(username, password))

if response.status_code == 201:
    print(f'Folder "{folder_name}" berhasil dibuat!')
elif response.status_code == 409:
    print(f'Folder "{folder_name}" sudah ada.')
else:
    print(f'Gagal membuat folder: {response.status_code} - {response.text}')

file_url = f'{folder_url}/{file_name}'

with open(file_path, 'rb') as file:
    response = requests.put(file_url, data=file, auth=HTTPBasicAuth(username, password))
    
if response.status_code == 201:
    print('File berhasil diunggah!')
else:
    print(f'Gagal mengunggah file: {response.status_code} - {response.text}')

