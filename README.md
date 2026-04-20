# Life Insurance Policy Performance Analysis (SQL)

## Overview
This project analyzes life insurance policy data to identify drivers of underperformance and provide insights that can support retention and portfolio management strategies.

## Business Problem
Insurance portfolios often experience policy lapses and surrenders, which reduce profitability. Understanding the drivers behind these outcomes is critical for improving policyholder retention and long-term performance.

## Approach
- Defined underperforming policies as **Lapse** or **Surrender**
- Analyzed portfolio composition and policy status distribution
- Segmented policies by:
  - Policy duration (early vs later years)
  - Entry age
  - Premium behavior
- Used SQL aggregation and conditional logic to calculate key performance metrics

## Key Insights
- Lapse is the primary contributor to policy underperformance
- Later-duration policies show higher lapse/surrender rates
- Premium discontinuity is a strong indicator of elevated risk
- Underwriting class alone is not a strong predictor of policy lapse

## Files
- `queries.sql` – SQL queries used for policy performance analysis

## Tools Used
- SQLite
- SQL
- DB Browser for SQLite

## Business Relevance
This type of analysis can support retention strategy, risk monitoring, and portfolio management by identifying patterns associated with policy lapse and surrender.

## Sample Output

### Policy Status Distribution
<img src="screenshots/policy_status_distribution.jpg" width="600"/>
![Policy Status](screenshots/policy_status_distribution.png)

### Underperforming Policy Rate
![Underperformance](screenshots/underperformance_rate.png)

## Example Analysis
```sql
SELECT
    "POLICY STATUS",
    COUNT(*) AS policy_count
FROM kaggle
GROUP BY "POLICY STATUS"
ORDER BY policy_count DESC;

