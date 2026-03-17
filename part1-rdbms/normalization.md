## Anomaly Analysis

### Insert Anomaly
In the orders_flat.csv table, a new product cannot be inserted unless an order exists. 
For example, if a new product like "Tablet" needs to be added but no order has been placed yet, there is no way to insert it without creating a fake order.

Columns involved: product_id, product_name, category, order_id

----

### Update Anomaly
If a sales representative changes their email or office address, it must be updated in every row where they appear.

Example:
sales_rep_id = SR01 appears multiple times.

Columns involved:
sales_rep_id, sales_rep_name, sales_rep_email, office_address

If one row is updated and others are not, inconsistent data will appear.

----

### Delete Anomaly
If the last order of a product is deleted, the product information is also lost.

Example:
If the only order containing product_id = P004 (Notebook) is deleted, then the product information disappears completely.

Columns involved:
product_id, product_name, category
