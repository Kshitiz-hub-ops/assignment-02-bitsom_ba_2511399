## ETL Decisions

### Decision 1 — Standardizing Date Formats
Problem: The raw dataset contained inconsistent date formats such as DD-MM-YYYY, MM/DD/YYYY, and some textual formats. This could cause issues while grouping data by month or year during analysis.

Resolution: I converted all date values into a standard format (YYYY-MM-DD) before loading them into the data warehouse. This ensured consistency and made it easier to perform time-based aggregations using the dim_date table.

---

### Decision 2 — Handling Missing (NULL) Values
Problem: Some records in the dataset had missing values, especially in fields like quantity or product category. This could lead to incorrect aggregations or errors in reporting.

Resolution: I removed or corrected records with NULL values by either filling them with appropriate default values (where possible) or excluding them from the cleaned dataset. This ensured that all fact table entries had valid and usable data.

---

### Decision 3 — Standardizing Category Names
Problem: Product categories in the raw data were inconsistent, for example, "electronics", "Electronics", and "ELECTRONICS" were used interchangeably. This would lead to incorrect grouping and duplicate categories in reports.

Resolution: I standardized all category values into a consistent format (e.g., "Electronics", "Clothing", "Groceries") before inserting them into the dim_product table. This ensured accurate aggregation and cleaner reporting.
