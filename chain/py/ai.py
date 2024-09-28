from langchain_google_genai import GoogleGenerativeAIEmbeddings, ChatGoogleGenerativeAI
from langchain_core.prompts import PromptTemplate
import config


embeddings = GoogleGenerativeAIEmbeddings(
    model="models/embedding-001", google_api_key=config.GEMINI_API_KEY
)

llm = ChatGoogleGenerativeAI(
    model="gemini-1.5-pro",
    temperature=0,
    max_tokens=None,
    timeout=None,
    max_retries=2,
    api_key=config.GEMINI_API_KEY
)

prompt = PromptTemplate(
    input_variables=["context", "question"],
    template="""
Gunakan konteks berikut untuk menjawab pertanyaan:
{context}

Pertanyaan: {question}

Jawaban:
""",
)