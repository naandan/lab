import os
import google.generativeai as genai
from config import GEMINI_API_KEY, SYSTEM_PROMPT

genai.configure(api_key=GEMINI_API_KEY)

generation_config = {
  "temperature": 1,
  "top_p": 0.95,
  "top_k": 64,
  "max_output_tokens": 8192,
  "response_mime_type": "text/plain"
}

model = genai.GenerativeModel(
  model_name="gemini-1.5-flash",
  generation_config=generation_config,
  system_instruction=SYSTEM_PROMPT,
)
messages = []
chat_session = model.start_chat(
  history=messages
)
def chat(message):
  response = chat_session.send_message(message)
  messages.append({"role": "user", "parts": [message]})
  messages.append({"role": "model", "parts": [response.text]})
  return response.text

def clear():
  messages.clear()