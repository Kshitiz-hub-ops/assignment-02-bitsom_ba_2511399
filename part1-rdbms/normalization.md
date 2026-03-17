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


## Normalization Justification

Keeping all the data in a single table might look simple at first, but it creates several problems when the dataset grows. In the given orders dataset, many fields such as customer information, product details, and sales representative details are repeated in multiple rows. For example, the same customer like “Rohan Mehta” appears in multiple orders, and his email and city are repeated every time. If the customer’s email needs to be updated, it would have to be changed in every row where that customer appears. If one row is missed, the database will contain inconsistent information. This is known as an update anomaly.

Another issue is insertion anomaly. In a single large table, it may not be possible to add information about a new product or a new sales representative unless there is an order associated with it. For instance, if a new product is introduced but no order has been placed yet, we still should be able to store its details. A normalized design allows this by keeping products in a separate table.

Deletion anomaly is also a concern. If the only order containing a particular product is deleted, the product information could be lost as well. By separating the data into different tables such as customers, products, sales representatives, orders, and order items, each type of information is stored only once and linked using keys.

Therefore, normalization helps reduce redundancy, prevents data inconsistencies, and makes the database easier to maintain and update.
