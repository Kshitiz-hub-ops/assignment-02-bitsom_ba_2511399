## Vector DB Use Case

In my opinion, a traditional keyword-based database search would not be sufficient for this use case. Keyword search mainly works by matching exact words or phrases, which can be limiting when dealing with large and complex legal documents like 500-page contracts. In legal language, the same concept can be expressed in different ways, so if the exact keyword is not present, relevant information might be missed.

For example, if a lawyer searches for “termination clauses,” but the document uses a different phrase like “contract cancellation conditions,” a keyword-based system may fail to retrieve the correct results. This makes keyword search less reliable for understanding the actual meaning or context of the content.

A vector database, on the other hand, uses embeddings to capture the semantic meaning of text. Instead of matching exact words, it understands the intent behind the query. In this system, the contracts can be broken into smaller chunks and converted into embeddings. When a lawyer asks a question in plain English, the system converts the query into an embedding and finds the most similar sections of the contract based on meaning.

This allows the system to return more accurate and relevant results, even if the wording is different. Therefore, a vector database plays a key role in enabling semantic search, making it much more suitable for searching large legal documents compared to traditional keyword-based methods.

Regarding embeddings_demo.ipynb

Note: The notebook preview may not render correctly on GitHub due to a known metadata issue.  
However, the notebook runs correctly in Google Colab with all outputs visible.
