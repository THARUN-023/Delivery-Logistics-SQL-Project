# 🚚 Delivery & Logistics Management System – SQL Project

## 📌 Project Overview

This project is a SQL-based Delivery and Logistics Management System designed to analyze delivery operations, driver performance, vehicle information, customer reviews, payments, revenue, and delivery efficiency.

The project demonstrates how SQL can be used to transform raw operational data into meaningful business insights that can support data-driven decision making.

The project follows a complete data analysis workflow:

- Database creation
- Raw data loading
- Data cleaning
- Data validation
- Table relationships
- Business analysis
- Advanced SQL analysis
- Performance analysis
- Business insights

---

## 🎯 Business Problem

A delivery and logistics company needs to understand:

- Which drivers are performing best?
- Which drivers generate the most revenue?
- Which cities have the highest delivery volume?
- Which routes generate the most revenue?
- Which drivers have high cancellation rates?
- How efficient are deliveries?
- How satisfied are customers?
- Which payment methods generate the most revenue?
- How does driver revenue change over time?
- Which drivers are performing above or below their city average?

The objective of this project is to answer these questions using SQL and convert the results into actionable business insights.

---

# 🗄️ Database Structure

The project contains five main operational tables and one combined analytical table.

### 1. Drivers

Contains driver information.

Important columns:

- driver_id
- driver_name
- gender
- age
- city
- joining_date
- rating

### 2. Vehicles

Contains vehicle information assigned to drivers.

Important columns:

- vehicle_id
- driver_id
- vehicle_type
- vehicle_model
- fuel_type
- capacity

### 3. Deliveries

Contains delivery transaction information.

Important columns:

- delivery_id
- driver_id
- vehicle_id
- customer_id
- pickup_city
- delivery_city
- delivery_date
- distance_km
- delivery_time_minutes
- delivery_status

### 4. Delivery Payments

Contains payment and revenue information.

Important columns:

- payment_id
- delivery_id
- delivery_charge
- driver_payment
- company_commission
- payment_method

### 5. Delivery Reviews

Contains customer review information.

Important columns:

- review_id
- delivery_id
- customer_id
- rating
- review_date
- feedback

### 6. Combined Delivery Data

A consolidated table created by joining the operational tables for analytical purposes.

---

# 🧹 Data Cleaning

The raw datasets contained several data-quality issues.

The following cleaning activities were performed:

### Duplicate Records

Duplicate records were identified and removed from the datasets.

### Missing Values

Missing values were identified using SQL conditions.

Important missing values were retained where replacing them would create false information.

### Invalid Values

Invalid values were identified and corrected.

Examples include:

- Negative driver ages
- Invalid driver ratings
- Negative vehicle capacity
- Negative delivery distance
- Invalid delivery status
- Negative delivery charges
- Invalid payment methods
- Invalid customer review ratings

### Business Validation

Additional validation rules were applied across related tables.

Examples:

- Delivery driver should exist in the Drivers table.
- Delivery vehicle should exist in the Vehicles table.
- Payment should be linked to a valid delivery.
- Review should be linked to a valid delivery.
- Driver payment and company commission should be logically consistent with delivery charge.

---

# 🔗 Table Relationships

The tables are connected using logical relationships through SQL JOIN operations.

Main relationships:

```text
Drivers
   |
   | driver_id
   |
Deliveries
   |
   +------------------+
   |                  |
vehicle_id        delivery_id
   |                  |
Vehicles        +-----+------+
                |            |
        Delivery Payments   Delivery Reviews
