import requests

# URL API
url = "https://chat.dev-sti-group.biz.id/ollama/api/chat"

# Payload data
payload = {
    "stream": False,
    "model": "llama3:latest",
    "messages": [
        {"role": "user", "content": "Hello"},
        {"role": "assistant", "content": "Hello! It's nice to meet you. Is there something I can help you with, or would you like to chat?"},
        {"role": "user", "content": "Siapa kamu"},
        {"role": "assistant", "content": "Saya adalah seorang AI (Artificial Intelligence) yang diprogram untuk berbicara dengan manusia. Saya tidak memiliki nama atau identitas fisik, tapi saya disebut dengan beberapa nama oleh pengguna. Saya dapat berdiskusi tentang topik apa saja, termasuk budaya, teknologi, kehidupan sehari-hari, dan lain-lain. Bagaimana kalau kita berbicara tentang apapun?"},
        {"role": "user", "content": "Hai"},
        {"role": "assistant", "content": "Hai! Bagaimana hari ini dengan Anda?"},
        {"role": "user", "content": "Hello"}
    ],
    "options": {},
    "session_id": "EyphxsDUyvzi-WDlAABM",
    "chat_id": "ba167619-2ce0-4f76-9d39-6aa0a7aae39b",
    "id": "11b8b499-d4f5-4e21-8142-d0ec3f62dc0e"
}

# Mengirim permintaan POST
response = requests.post(url, json=payload)

# Menampilkan respon dari server
if response.status_code == 200:
    print("Response:", response.json())
else:
    print("Failed to get response. Status code:", response.status_code)
    print("Response text:", response.text)
