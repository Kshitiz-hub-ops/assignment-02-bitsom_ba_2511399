## Storage Systems

For this hospital network, I chose specialized storage systems tailored to each of the four goals to ensure maximum performance and scalability:

1. **Predict Patient Readmission (Historical Data):** I chose a **Data Warehouse** (e.g., Google BigQuery or Snowflake). It excels at storing massive amounts of structured historical data from the EHR. Since machine learning models require large datasets for batch training, a Data Warehouse is perfect for running fast, large-scale SQL queries to extract training features.
2. **Plain English Patient Queries (NLP):** I selected a **Vector Database** (e.g., Pinecone or Milvus). Standard databases can't easily process the "meaning" behind unstructured text (like doctor's notes). A Vector DB stores patient history as mathematical embeddings, allowing our Generative AI (via a RAG pipeline) to perform semantic searches and answer questions accurately based on context.
3. **Monthly Management Reports:** I utilized the same **Data Warehouse** used for Goal 1. BI tools like Tableau or PowerBI connect seamlessly to data warehouses. Because the warehouse stores historical data in a columnar format, it is highly optimized for the heavy mathematical aggregations required to calculate department-wise costs and bed occupancy.
4. **Real-time ICU Vitals:** I chose a **Time-Series Database** (e.g., InfluxDB or TimescaleDB). ICU monitors generate thousands of data points per second. Traditional relational databases would choke under this continuous write-load. A TSDB is specifically engineered for high-speed, timestamp-heavy data ingestion, allowing doctors to view real-time vital trends without lag.

---

## OLTP vs OLAP Boundary

In this architecture, I established a strict boundary between operational systems and analytical systems to ensure that heavy AI workloads never crash critical hospital operations. 

The **OLTP (Online Transaction Processing)** side consists of the source systems: the EHR, the Hospital ERP, and the ICU monitoring devices. These systems handle everyday, low-latency transactional workloads like registering a new patient, updating a medical bill, or logging a heartbeat.

The boundary is physically enforced at the **Ingestion Layer** (using Apache Kafka for streaming and Airflow/dbt for batch processing). 

Once data crosses this ingestion bridge and lands in our Storage Layer (Data Warehouse, Vector DB, TSDB), it enters the **OLAP (Online Analytical Processing)** zone. All the heavy lifting—training the predictive readmission model, running LLM queries, and generating complex monthly reports—happens strictly in this OLAP environment. This guarantees the hospital's live systems remain fast and uninterrupted.

---

## Trade-offs

**Trade-off: High System Complexity vs. Optimized Performance**
By using multiple specialized storage systems (a Data Warehouse, a Time-Series DB, a Vector DB, and a Data Lake), the architecture achieves incredible performance for each specific goal. However, the significant trade-off is **increased architectural complexity and higher maintenance costs**. Managing data pipelines across four different systems increases the risk of data synchronization failures and requires a specialized data engineering team to maintain.

**Mitigation:** To mitigate this, I would rely on **Fully Managed Cloud Services** (like AWS or GCP). By using managed databases, we offload the server maintenance, patching, and backups to the cloud provider, reducing our team's operational overhead. Furthermore, I would implement **Tiered Data Retention Policies**. For example, high-speed ICU vitals would only stay in the expensive Time-Series DB for 7 to 30 days for real-time monitoring. After that, an automated script would archive them into cheap, cold storage (like Amazon S3) in the Data Lake, perfectly balancing high performance with budget constraints.
