# Data_Cleaning

# Bakery Sales Data Cleaning

Welcome to the **Bakery Sales Data Cleaning** repository! This project documents the process of cleaning and preparing a dataset related to bakery sales. Below are the detailed steps undertaken to ensure the dataset is ready for analysis.

---

## Table of Contents

1. [Database Setup](#database-setup)
2. [Importing Datafile](#importing-datafile)
3. [Data Cleaning Process](#data-cleaning-process)
   - [Deleting Duplicate Rows](#deleting-duplicate-rows)
   - [Handling Missing Values or Nulls](#handling-missing-values-or-nulls)
   - [Dropping Columns](#dropping-columns)
   - [Adding and Splitting Columns](#adding-and-splitting-columns)

---

## Database Setup

The initial step involves setting up the database to store and manage the bakery sales data. Key actions included:

- Creating a structured schema to accommodate sales records.
- Ensuring the database supports efficient querying and indexing for large datasets.

---

## Importing Datafile

The dataset was imported into the database using standard import tools or scripts. The datafile contained raw records of bakery sales, including item names, quantities, prices, and timestamps.

Steps followed:

1. Loaded the raw dataset into the staging table for initial inspection.
2. Verified data integrity and checked for any immediate issues (e.g., unsupported formats).

---

## Data Cleaning Process

### Deleting Duplicate Rows

Duplicate rows were identified and removed to ensure the dataset contains only unique sales records.

- Used SQL queries to identify duplicate entries based on all columns or a subset of key columns.
- Applied the `DELETE` statement to remove duplicates while keeping the first occurrence.

### Handling Missing Values or Nulls

Missing values in critical columns were addressed:

- **Numeric Columns**: Replaced nulls with appropriate default values based on the column's context.

### Dropping Columns

Irrelevant or redundant columns were removed to streamline the dataset:

- Identified columns with minimal variance or no analytical value.
- Dropped these columns using SQL or data manipulation scripts.

### Adding and Splitting Columns

New columns were added, and existing ones were split to enhance data usability:

- **Adding Columns**: From datetime was derived into new fields named date and time.
- **Splitting Columns**: Extracted information from composite fields (e.g., splitting a `datetime` field into `date` and `time` components).

---

## Conclusion

This repository serves as a comprehensive guide for setting up, importing, and cleaning bakery sales data. The outlined process ensures the dataset is reliable, consistent, and ready for further analysis or visualization.

---
