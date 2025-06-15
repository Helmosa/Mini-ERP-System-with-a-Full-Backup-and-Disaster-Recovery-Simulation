# Mini ERP System with a Full Backup and Disaster Recovery Simulation.

A SQL Server-based ERP system designed to manage to manage a business's financial operations, including inventory, sales, suppliers, employees and financial records with full audit logging and backup capabilities.

## Features

- Inventory management with quantity tracking.
- Automatic total calculation for each sale and purchase.
- Audit logging to record inventory changes and user actions.
- Product history tracking upon updates.
- Reporting views for recent sales and current stock summary.
- Database backup and disaster recovery scripts.

## Database Schema

### Tables:
- Users: Stores login details, user role and creation timestamp.
- Employees: Links users to employee records with position info.
- Customers: Stores customer info with registration timestamp.
- Suppliers: Contains supplier details and contact.
- Products: Product catalog with price and supplier link.
- Inventory: Tracks current product quantities and last update.
- Sales: Records product sales with quantity and selling date.
- Purchases: Records product purchases with quantity and purchase date.
- AuditLog: Captures changes in the Inventory table including what was changed, who changed it and when.
- Product History: Tracks every change in product data (name or price).


### Views:
- Recent Sales Report: Shows all sales from the last 30 days including customer name, product, quantity and date.
- Inventory Summary: Displays current inventory status with product name and quantity.


### Triggers & Views:

Implemented DML triggers to:
- Calculate Total Amount: Automatically calculates TotalAmount for sales.
- Inventory AuditLog: Logs updates to inventory with user and timestamp.
- Product History: Captures any product updates to a history table.
- Finance AutoLog: Inserts a finance record when a sale occurs.



## Backup & Restore:

- Full backup script included.
- Point-in-time recovery script provided to restore database to a specific moment.


## Technologies Used

- SQL Server RDBMS (T-SQL syntax).
 
## Setup Instructions

1. Clone this repository
2. Run the SQL scripts in your SQL Server preferably with the numerical order provided.
3. Execute triggers, views and backup scripts as needed.