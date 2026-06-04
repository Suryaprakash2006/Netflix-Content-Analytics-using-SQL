# Netflix Content Analytics using SQL

## 📌 Project Overview

This project focuses on analyzing Netflix Movies and TV Shows data using PostgreSQL.

The goal of this project is to solve real-world business problems using SQL and extract meaningful insights from Netflix's content catalog.

Through this project, I demonstrate:

- Data Exploration
- Data Cleaning
- Aggregations
- Window Functions
- Common Table Expressions (CTEs)
- Date Functions
- String Manipulation
- Ranking Functions
- Business-Oriented Analysis

---

## 🎯 Objectives

- Analyze Netflix content distribution.
- Compare Movies and TV Shows.
- Explore content trends across countries and years.
- Identify top-performing genres, actors, and directors.
- Apply SQL to solve business-oriented analytical problems.
- Practice intermediate and advanced SQL concepts.

---

## 🛠 Technologies Used

- PostgreSQL
- SQL
- Git
- GitHub

---

## 📂 Dataset

Dataset Source:

https://www.kaggle.com/datasets/shivamb/netflix-shows

Dataset contains:

- Show ID
- Content Type
- Title
- Director
- Cast
- Country
- Date Added
- Release Year
- Rating
- Duration
- Genre
- Description

---

## 🗄 Database Schema

```sql
DROP TABLE IF EXISTS netflix;

CREATE TABLE netflix
(
    show_id VARCHAR(6),
    type VARCHAR(10),
    title VARCHAR(150),
    director VARCHAR(250),
    casts VARCHAR(1000),
    country VARCHAR(150),
    date_added VARCHAR(50),
    release_year INT,
    rating VARCHAR(10),
    duration VARCHAR(15),
    listed_in VARCHAR(100),
    description VARCHAR(250)
);
```

---

## 📊 Business Problems Solved

### Basic Analysis

1. Count the number of Movies vs TV Shows.
2. Find the most common rating for Movies and TV Shows.
3. List all Movies released in a specific year.
4. Find the Top 5 countries with the most content.
5. Identify the longest Movie.
6. Find content added in the last 5 years.
7. Find all Movies/TV Shows by Director Rajiv Chilaka.
8. List all TV Shows with more than 5 seasons.
9. Count the number of content items in each genre.
10. Find the Top 5 years with the highest percentage of content releases from India.
11. List all Movies that are Documentaries.
12. Find all content without a director.
13. Find how many titles Salman Khan appeared in during the last 10 years.
14. Find the Top 10 actors appearing in Indian-produced content.
15. Categorize content based on keywords such as "kill" and "violence".

---

### Intermediate Analysis

16. Find the number of titles added each year.
17. Find the Top 10 countries producing Movies.
18. Find the Top 10 countries producing TV Shows.
19. Find the Top 10 directors with the most content.
20. Find the director with the highest number of Movies.
21. Find the most dominant Movie genres.
22. Find the most dominant TV Show genres.
23. Identify the highest-rated content categories.
24. Rank countries based on total content production.
25. Calculate the average Movie duration.

---

### Advanced Analysis

26. Find the longest Movie released in each year using Window Functions.
27. Identify the month with the highest content additions.
28. Calculate the percentage distribution of Movies vs TV Shows.

---

## 🧠 SQL Concepts Used

### Aggregate Functions

- COUNT()
- AVG()
- ROUND()

### String Functions

- STRING_TO_ARRAY()
- UNNEST()
- SPLIT_PART()
- TRIM()

### Date Functions

- CURRENT_DATE
- TO_DATE()
- EXTRACT()

### Window Functions

- RANK()
- PARTITION BY

### Conditional Logic

- CASE WHEN

### Advanced SQL Concepts

- CTEs
- Subqueries
- Type Casting
- Nested Queries

---

## 📁 Project Structure

```text
Netflix-Content-Analytics-SQL/
│
├── dataset/
│   └── netflix_titles.csv
│
├── sql/
│   ├── schema.sql
│   └── business_problems.sql
│
├── screenshots/
│   ├── query_01.png
│   ├── query_02.png
│   └── ...
│
├── README.md
│
└── LICENSE
```

---

## 🔍 Key Analysis Areas

- Content Distribution Analysis
- Country-wise Analysis
- Director Analysis
- Actor Analysis
- Genre Analysis
- Duration Analysis
- Rating Analysis
- Time-based Analysis
- Content Classification

---

## 🚀 Skills Demonstrated

- SQL Query Writing
- Data Exploration
- Data Analysis
- Business Problem Solving
- Window Functions
- CTEs
- Analytical Thinking

