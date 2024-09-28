import { baseAI, EmbedModel, prompt } from './config.js';
import { StringOutputParser } from "@langchain/core/output_parsers";
import { HNSWLib } from "@langchain/community/vectorstores/hnswlib";
import { RunnablePassthrough, RunnableSequence } from '@langchain/core/runnables';
import { formatDocumentsAsString } from 'langchain/util/document';
import { RecursiveCharacterTextSplitter } from 'langchain/text_splitter';

export const setDocument = async (input, document) => {
  try {
    const textSplitter = new RecursiveCharacterTextSplitter(
      { chunkSize: 1000 });
    const docs = await textSplitter.createDocuments([document])
    const vectorStore = await HNSWLib.fromDocuments(docs, EmbedModel)
    const vectorStoreRetrivier = vectorStore.asRetriever({ k: 2 })
    const chain = RunnableSequence.from([
      {
        context: vectorStoreRetrivier.pipe(formatDocumentsAsString),
        question: new RunnablePassthrough(),
      },
      prompt,
      baseAI,
      new StringOutputParser()
    ])
    const answer = await chain.invoke(input)
    return answer
  } catch (error) {
    console.log('embeding query error', error);
  }
}