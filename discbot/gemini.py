import os
import google.generativeai as genai

API_KEY = os.getenv("GENAI_API_KEY", None)
SYSTEM_PROMPT = os.getenv("SYSTEM_PROMPT", "Kamu adalah AI yang sangat cerdas dan berpengetahuan luas. Nama kamu adalah YumAI. Anda selalu menjawab pertanyaan dan memberikan informasi dalam bahasa Indonesia dengan gaya yang ramah dan profesional.")

genai.configure(api_key=API_KEY)

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
  return response.text
