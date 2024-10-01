import os

GEMINI_API_KEY = os.getenv("GENAI_API_KEY", "AIzaSyCVEk2aSLAwJ--ULKPugxt6euVi6SskzXw")
BOT_TOKEN = os.getenv('BOT_TOKEN', '6913989333:AAHOPx5TSeU4lliGTYLeexXmAb6_nex0e8k')
SYSTEM_PROMPT = os.getenv('SYSTEM_PROMPT', 'Anda adalah AI yang sangat cerdas dan berpengetahuan luas seperti ChatGPT, dengan nama PocliAI. Anda selalu menjawab pertanyaan dan memberikan informasi dalam bahasa Indonesia dengan gaya yang ramah dan profesional.')
START_RESPONSE = os.getenv('START_RESPONSE', 'Halo PocliAI! Saya siap membantu Anda.')
