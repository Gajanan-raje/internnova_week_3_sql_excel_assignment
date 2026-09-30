# 📊 Week 3: SQL & Excel for Data Analytics

![SQL](https://img.shields.io/badge/SQL-SQLite-003B57?logo=sqlite&logoColor=white)
![Excel](https://img.shields.io/badge/Excel-Analysis-217346?logo=microsoftexcel&logoColor=white)
![Google Sheets](https://img.shields.io/badge/Google%20Sheets-XLOOKUP-34A853?logo=googlesheets&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

Assignment submission for the **InternNova Data Analytics Internship**, covering practical SQL querying and Excel-based data analysis.

**Author:** Gajanan Harinarayan Raje
**Program:** TYBCA, MGM's College of Computer Science & IT, Nanded (SRTMU University)

---

## 📁 Repository Contents

| File | Description |
|------|-------------|
| `Week3_SQL.sql` | Table setup and all SQL queries (Tasks 1-5) |
| `Week3_Excel.xlsx` | Excel workbook: Sales_Data, Pivot Table 1, Price_List (Tasks 6-9) |
| `Week3_Report.pdf` | Full report with queries, screenshots and explanations |

---

## 🛠️ Tools Used

- **SQLite** via [sqliteonline.com](https://sqliteonline.com) for all SQL tasks
- **Microsoft Excel** for formatting, filtering, conditional formatting and functions
- **Google Sheets** for XLOOKUP, Pivot Table and Chart

---

## 🗄️ Part 1: SQL

### Sample Database

Two related tables linked by `DeptID`:

**Employees**

| EmpID | Name | DeptID | Salary |
|-------|------|--------|--------|
| 1 | Amit | 1 | 50000 |
| 2 | Neha | 1 | 60000 |
| 3 | Ravi | 2 | 40000 |
| 4 | Sneha | 3 | 55000 |
| 5 | Om | NULL | 35000 |

**Departments**

| DeptID | DeptName |
|--------|----------|
| 1 | IT |
| 2 | HR |
| 3 | Sales |
| 4 | Finance |

> Om has no department and Finance has no employees, which makes the LEFT and RIGHT JOIN results different.

### Tasks Covered

| Task | Topic | Concepts |
|------|-------|----------|
| 1 | Introduction & SELECT | `SELECT *`, specific columns, aliases (`AS`) |
| 2 | Filtering & Aggregates | `WHERE`, comparison operators, `ORDER BY`, `COUNT`, `SUM`, `AVG`, `MIN`, `MAX` |
| 3 | Grouping | `GROUP BY`, `HAVING` |
| 4 | Joins | `INNER JOIN`, `LEFT JOIN`, `RIGHT JOIN` |
| 5 | Subqueries | Subquery with `AVG`, subquery with `IN` |

### Sample Queries

**Employees earning above the average salary (subquery)**

```sql
SELECT Name, Salary
FROM Employees
WHERE Salary > (SELECT AVG(Salary) FROM Employees);
```

**Departments with average salary above 45000 (GROUP BY + HAVING)**

```sql
SELECT DeptID, COUNT(*) AS Total_Employees, AVG(Salary) AS Avg_Salary
FROM Employees
GROUP BY DeptID
HAVING AVG(Salary) > 45000;
```

**All employees with their department, including those without one (LEFT JOIN)**

```sql
SELECT e.EmpID, e.Name, d.DeptName, e.Salary
FROM Employees e
LEFT JOIN Departments d ON e.DeptID = d.DeptID;
```

### JOIN Summary

| Join | Returns |
|------|---------|
| `INNER JOIN` | Only rows that match in both tables |
| `LEFT JOIN` | All employees, with NULL department if no match |
| `RIGHT JOIN` | All departments, with NULL employee if no match |

---

## 📈 Part 2: Excel

### Dataset

`Sales_Data` sheet with 12 records: **Date, Region, Product, Qty, Amount**, plus a `Price_List` sheet (Product, Price) used for lookups.

### Tasks Covered

| Task | Topic | What was done |
|------|-------|---------------|
| 6 | Formatting, Sorting, Filtering | Styled headers, borders, currency format, sorted by Amount, filtered `Region = North` |
| 7 | Conditional Formatting & Functions | Highlighted Amount > 20000, used `IF`, `COUNTIF`, `SUMIF` |
| 8 | Lookups | `VLOOKUP` and `XLOOKUP` to fetch Price from `Price_List` |
| 9 | Pivot Table & Chart | Sales by Region, column chart |

### Formulas Used

```excel
=IF(E2>20000,"High","Low")
=COUNTIF(B2:B13,"North")
=SUMIF(B2:B13,"North",E2:E13)
=VLOOKUP(C2,Price_List!$A$2:$B$6,2,FALSE)
=XLOOKUP(C2,Price_List!$A$2:$A$6,Price_List!$B$2:$B$6,"Not Found")
```

### VLOOKUP vs XLOOKUP

| Feature | VLOOKUP | XLOOKUP |
|---------|---------|---------|
| Column index number | Required | Not needed |
| Search direction | Left to right only | Any direction |
| Default if not found | `#N/A` | Custom value (e.g. "Not Found") |
| Availability | All Excel versions | Excel 2021 / Microsoft 365 and Google Sheets |

### Pivot Table Result (Total Amount by Region)

| Region | Sum of Amount |
|--------|---------------|
| North | 128,000 |
| East | 81,500 |
| South | 79,000 |
| West | 52,000 |
| **Grand Total** | **340,500** |

**Insight:** North is the top-performing region, while West has the lowest sales.

> **Note:** XLOOKUP, the Pivot Table and the chart were built in Google Sheets because the locally installed Excel version does not support XLOOKUP.

---

## ▶️ How to Run the SQL

1. Open [sqliteonline.com](https://sqliteonline.com) and select **SQLite**.
2. Paste the setup section of `Week3_SQL.sql` and click **Run**.
3. Run each task's queries one at a time and check the output.

> RIGHT JOIN may not be supported in older SQLite versions. Swapping the table order and using LEFT JOIN gives the same result.

---

## 🎯 Skills Demonstrated

`SQL` · `Joins` · `Subqueries` · `Aggregation` · `Data Cleaning` · `Excel Functions` · `Conditional Formatting` · `Pivot Tables` · `Data Visualization`

---

## 📬 Contact

**Gajanan Raje** · [GitHub](https://github.com/Gajanan-raje)
