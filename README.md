# 🏦 Bank Loan Report Analysis Project

## 📌 Overview
This project focuses on analyzing a bank's loan data using SQL for data cleaning and transformation, followed by interactive visualization in Power BI to derive key business insights.

## 🛠 Tools & Technologies
- **MySQL**: Data Cleaning, Transformation, and SQL-based Analysis
- **Power BI**: Dashboard Design, KPIs & Visualizations

## 📊 Key Metrics Analyzed
- **Total Loan Applications**: 38.6K (MTD: 4.3K | MOM Growth: 6.9%)
- **Total Funded Amount**: $435.8M (MTD: $54M | MOM Growth: 13%)
- **Total Amount Received**: $473.1M (MTD: $58.1M | MOM Growth: 15.8%)
- **Avg Interest Rate**: 12%
- **Avg Debt-to-Income Ratio (DTI)**: 13.3%

## 📈 Dashboard Features
- **Loan Trends by Month & State**
- **Good vs Bad Loans**:
  - Good Loans: 86.2% ($370.2M funded)
  - Bad Loans: 13.8% ($65.5M funded)
- **Loan Distribution by**:
  - Employee Length
  - Purpose (e.g., debt consolidation, credit card, home improvement)
  - Term (36 vs 60 months)
  - Home Ownership (Rent, Mortgage, Own)
- **Loan Status Overview** (Fully Paid, Charged Off, Current)

## 📌 SQL Highlights
- Cleaned date columns using `STR_TO_DATE()` and casted them to proper types.
- Calculated MTD & MOM KPIs for loan applications, funded amounts, and repayments.
- Segmented loans by status, purpose, term, home ownership, and state.
- Identified trends and anomalies in funding and interest rates.

## 📊 Business Insights
- **Debt consolidation** was the leading purpose with 18K+ applications.
- **Applicants with 10+ years of experience** applied for the highest number of loans.
- Most loans were issued for **60-month terms** and to **renters or mortgage holders**.
- **Bad loans had higher average interest and DTI ratios** compared to good loans.

---

✅ **Outcome**: This project demonstrates strong command over SQL for business reporting and storytelling through dynamic dashboards in Power BI.
