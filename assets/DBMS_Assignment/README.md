# 🎓 University Course Management System

> **Database Management System Assignment**
> Department of Computer Science and Engineering — Daffodil International University

---

## 📌 Assignment Overview

| Field | Details |
|-------|---------|
| **Title** | University Course Management System using MySQL |
| **Author** | Student — CSE Department |
| **Institution** | Daffodil International University |
| **Submission Type** | Individual Academic Assignment |

---

## 🛠️ Tools & Environment

| Tool | Purpose | Badge |
|------|---------|-------|
| ![XAMPP](https://img.shields.io/badge/XAMPP-FB7A24?style=flat-square&logo=xampp&logoColor=white) **XAMPP** | MySQL Server for database execution | `v8.x` |
| ![MariaDB](https://img.shields.io/badge/MariaDB-003545?style=flat-square&logo=mariadb&logoColor=white) **MariaDB** | Database engine (via XAMPP) | `bundled` |
| ![VS Code](https://img.shields.io/badge/VS%20Code-007ACC?style=flat-square&logo=visualstudiocode&logoColor=white) **Visual Studio Code** | Writing & managing SQL scripts | `latest` |
| ![PowerShell](https://img.shields.io/badge/PowerShell-5391FE?style=flat-square&logo=powershell&logoColor=white) **Windows PowerShell** | Terminal execution | `Windows` |
| ![GitHub](https://img.shields.io/badge/GitHub-181717?style=flat-square&logo=github&logoColor=white) **GitHub** | Repository & submission | `public` |

---

## ⚙️ Execution Method

All SQL queries were executed **locally** using the **XAMPP MySQL server**. The system was accessed through both the **XAMPP Shell** and the **VS Code integrated terminal**.

```
XAMPP Control Panel → MySQL Start → Shell / VS Code Terminal
& "C:\xampp\mysql\bin\mysql.exe" -u root -p
```

---

## 🔄 Development Process

### Step 1 — Database & Table Creation
```sql
CREATE DATABASE university_db;
USE university_db;
-- Created: Student, Course, Enrollment, Instructor, Teaches
```

### Step 2 — Sample Data Insertion
```sql
INSERT INTO Student VALUES (...);
INSERT INTO Course VALUES (...);
-- Populated all 5 tables with sample records
```

### Step 3 — SQL Query Execution

| # | Feature | Description |
|---|---------|-------------|
| `01` | **JOIN Operations** | Combined data across multiple relational tables |
| `02` | **Aggregation Functions** | `COUNT`, `AVG`, `SUM`, `MAX`, `MIN` analytics |
| `03` | **User-Defined Function** | GPA calculation function |
| `04` | **CASE WHEN** | Conditional output and grade classification |
| `05` | **Stored Procedure** | Cursor and loop-based record processing |

---

## 📷 Screenshot Methodology

- ✅ **VS Code terminal** used to display SQL execution results
- ✅ Terminal theme set to **light/white background** for better screenshot visibility
- ✅ **Full-screen terminal view** used for clean, readable output
- ✅ Outputs copied into **CMD/text view** where necessary to handle Bengali text rendering
- ✅ All screenshots taken from **locally executed queries** — no external outputs used

---
---

## ✅ Notes & Academic Integrity

> - All work completed **individually** for academic submission only
> - No external or copied database outputs were used
> - All screenshots are authentic, captured from local execution
> - Project follows course guidelines and submission requirements

---

## 👤 Author

```
Name    : MD SUZON MIA
Dept    : Computer Science and Engineering
Univ    : Daffodil International University
```

---

*📅 Submitted for Database Management System (DBMS) Course Assignment*
