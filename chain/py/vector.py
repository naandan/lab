from langchain_text_splitters import RecursiveCharacterTextSplitter
from langchain_community.vectorstores import FAISS
from langchain_core.runnables import RunnablePassthrough
from langchain_core.output_parsers import StrOutputParser
from ai import embeddings, llm, prompt

def format_documents_as_string(docs):
    return '\n'.join([doc.page_content for doc in docs])

def document(input, file):
    text_splitter = RecursiveCharacterTextSplitter(
        chunk_size=1000,
    )
    docs = text_splitter.create_documents([file])
    vectorstore = FAISS.from_documents(docs, embeddings)
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