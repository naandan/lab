import { PromptTemplate } from "@langchain/core/prompts";
import { ChatGoogleGenerativeAI, GoogleGenerativeAIEmbeddings } from "@langchain/google-genai";
import dotenv from "dotenv";
dotenv.config();

export const baseAI = new ChatGoogleGenerativeAI({
    model: "gemini-1.5-pro",
    temperature: 0,
    maxRetries: 2,
    apiKey: process.env.GEMINI_API_KEY,
});

// Model Embedding
export const EmbedModel = new GoogleGenerativeAIEmbeddings({
    model: "text-embedding-004",
    apiKey: process.env.GEMINI_API_KEY
  });

// Template Prompt
export const prompt = PromptTemplate.fromTemplate(`
Gunakan konteks berikut untuk menjawab pertanyaan:
{context}

Pertanyaan: {question}

Jawaban:
`);