import express from "express";
import cors from "cors";
import fs from "fs";
import { setDocument } from "./document.js";

const PORT = 4321;
const app = express()
  .use(express.json())
  .use(express.urlencoded({ extended: true }))
  .use(cors());

let fileContent = '';


fs.readFile('./products.txt', 'utf8', async (err, data) => {
  if (err) {
    console.error("Error loading file:", err);
    return;
  }
  fileContent = data;
  const prompt = "Stock yang paling banyak?"
  const reply = await setDocument(prompt, fileContent);

  console.log(reply);

});

// app.post("/api/analyze", (req, res) => {
//   console.log("analyzing data...");
//   try {
//     const input = req.body.input;
    
//     const reply = fileContent;
    
//     res.status(200).json({ isError: false, reply });
//   } catch (error) {
//     console.error("Error in processing request:", error);
//     res.status(500).json({ isError: true, errorMessage: "Request tidak dapat diproses, coba lagi nanti!" });
//   }
// });

// app.listen(PORT, () => {
//   console.log(`Server is listening at http://localhost:${PORT}`);
// });
