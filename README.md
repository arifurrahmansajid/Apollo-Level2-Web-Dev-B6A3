# Vehicle Booking System – SQL Project

## Overview
This repository contains SQL queries for a **Vehicle Booking System** database.  
The project demonstrates how SQL can be used to retrieve meaningful information from a relational database that manages users, vehicles, and booking records.

The queries apply essential SQL concepts such as `JOIN`, `WHERE`, `GROUP BY`, `HAVING`, and subqueries to solve practical data-retrieval problems.

All final SQL queries are stored in the **`Assignmentqueries.sql`** file.

---

## Database Tables

- **Users** – stores customer-related information  
- **Vehicles** – contains details about each vehicle  
- **Bookings** – records vehicle reservations and links users with vehicles  

---

## queries.sql – Query Breakdown

### 1. Booking Details with User and Vehicle Information
This query retrieves booking records along with the corresponding user and vehicle details.  
It uses SQL `JOIN` operations to combine data from the `bookings`, `users`, and `vehicles` tables.

**Purpose:**  
To display a complete view of all bookings, including customer and vehicle details.

---

### 2. Vehicles Without Any Bookings
This query identifies vehicles that have never been booked.  
A `NOT EXISTS` subquery is used to exclude vehicles that appear in the `bookings` table.

**Purpose:**  
To find unused or inactive vehicles in the system.

---

### 3. Available Vehicles by Type
This query retrieves all available vehicles of a specific type, such as `car`.  
It uses `SELECT` and `WHERE` conditions to filter the results.

**Purpose:**  
To list vehicles that are currently available for booking based on type.

---

### 4. Vehicles with Multiple Bookings
This query counts how many times each vehicle has been booked.  
Using `GROUP BY` and `HAVING`, it returns only vehicles that have been booked more than two times.

**Purpose:**  
To identify frequently booked vehicles.

---

## Conclusion
This project demonstrates practical use of SQL to analyze and manage data in a relational database.  
By applying joins, filtering, aggregation, and subqueries, the queries provide valuable insights into vehicle usage and booking patterns.
