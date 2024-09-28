import requests

# URL API
url = "https://ollama-api.dev-sti-group.biz.id/api/generate"

# Payload data
payload = {
    "model": "llama3",
    "prompt": "Why is the sky blue?",
    "stream": False
}

# Mengirim permintaan POST
response = requests.post(url, json=payload)

# Menampilkan respon dari server
if response.status_code == 200:
    print("Response:", response.json())
else:
    print("Failed to get response. Status code:", response.status_code)
    print("Response text:", response.text)
