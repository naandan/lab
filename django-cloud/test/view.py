# import requests
# from requests.auth import HTTPBasicAuth

# # Konfigurasi
# base_url = 'http://172.16.14.145:8080/remote.php/dav/files/nandan/hello/foto.jpg'
# username = 'nandan'
# password = 'Tahun2024,-'

# headers = {
#     'Depth': '1'
# }

# response = requests.request('PROPFIND', base_url, auth=HTTPBasicAuth(username, password), headers=headers)

# if response.status_code == 207:
#     print(response.text)
# else:
#     print(f'Gagal mendapatkan daftar file: {response.status_code} - {response.text}')








import requests
from requests.auth import HTTPBasicAuth
from xml.etree import ElementTree as ET

def get_file_metadata():
    base_url = 'http://172.16.14.145:8080/remote.php/dav/files/nandan/hello/foto.jpg'  # URL direktori atau file yang ingin diperiksa
    username = 'nandan'
    password = 'Tahun2024,-'
    
    headers = {
        'Depth': '1',
        'Content-Type': 'application/xml'
    }

    data = '''<?xml version="1.0"?>
    <d:propfind xmlns:d="DAV:">
      <d:prop>
        <d:displayname />
        <d:getcontentlength />
        <d:getlastmodified />
      </d:prop>
    </d:propfind>'''

    response = requests.request('PROPFIND', base_url, auth=HTTPBasicAuth(username, password), headers=headers, data=data)

    if response.status_code == 207:
        root = ET.fromstring(response.content)
        files = []
        for response_elem in root.findall('{DAV:}response'):
            href = response_elem.find('{DAV:}href').text
            displayname = response_elem.find('{DAV:}propstat/{DAV:}prop/{DAV:}displayname').text
            contentlength = response_elem.find('{DAV:}propstat/{DAV:}prop/{DAV:}getcontentlength').text
            lastmodified = response_elem.find('{DAV:}propstat/{DAV:}prop/{DAV:}getlastmodified').text
            files.append({
                'href': href,
                'displayname': displayname,
                'contentlength': contentlength,
                'lastmodified': lastmodified
            })
        return files
    else:
        return []

print(get_file_metadata())