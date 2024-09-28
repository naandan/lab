from langchain_text_splitters import RecursiveCharacterTextSplitter
from langchain_community.vectorstores import FAISS
from ai import embeddings, llm, prompt
from langchain_core.runnables import Runnable, RunnablePassthrough, RunnableSequence
from langchain_core.output_parsers import StrOutputParser
import config
from langchain_community.vectorstores.pgvecto_rs import PGVecto_rs

def format_documents_as_string(docs):
    return '\n'.join([doc.page_content for doc in docs])

def document(input, file):
    vectorstore = PGVecto_rs.from_collection_name(
        embedding=embeddings,
        db_url=config.POSTGRES_URL,
        collection_name="vouchers_voucher",
    )
    retriever = vectorstore.as_retriever()
    chain = (
        {
            'context': retriever.pipe(format_documents_as_string),
            'question': RunnablePassthrough(),
        }
        |prompt
        |llm
        |StrOutputParser()
    )
    return chain.invoke(input)


with open("./products.txt") as f:
    file = f.read()

while True:
    query = input("Ask a question: ")
    if query == "exit":
        break
    print(document(query, file))