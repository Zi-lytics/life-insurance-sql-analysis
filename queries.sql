-- ============================================
-- Project: Life Insurance Policy Performance Analysis
-- Database: Life_Insurance_1
-- Table: kaggle
-- ============================================


-- 1. Sanity check: view sample records
SELECT *
FROM kaggle
LIMIT 5;


-- 2. Total number of policies
SELECT COUNT(*) AS total_policies
FROM kaggle;


-- 3. Inspect column structure
PRAGMA table_info(kaggle);


-- 4. Check ENTRY AGE distribution (raw)
SELECT
    MIN("ENTRY AGE") AS min_age,
    MAX("ENTRY AGE") AS max_age,
    AVG("ENTRY AGE") AS avg_age
FROM kaggle;


-- 5. Count zero entry ages (data validation)
SELECT
    COUNT(*) AS zero_age_rows
FROM kaggle
WHERE "ENTRY AGE" = 0;


-- 6. ENTRY AGE stats excluding zero values
SELECT
    MIN("ENTRY AGE") AS min_age,
    MAX("ENTRY AGE") AS max_age,
    AVG("ENTRY AGE") AS avg_age
FROM kaggle
WHERE "ENTRY AGE" > 0;


-- 7. ENTRY AGE stats for adult population (18–70)
SELECT
    MIN("ENTRY AGE") AS min_age,
    MAX("ENTRY AGE") AS max_age,
    AVG("ENTRY AGE") AS avg_age
FROM kaggle
WHERE "ENTRY AGE" BETWEEN 18 AND 70;


-- 8. Distinct policy status values
SELECT DISTINCT
    "POLICY STATUS"
FROM kaggle;


-- 9. Portfolio composition by policy status
SELECT
    "POLICY STATUS",
    COUNT(*) AS policy_count
FROM kaggle
GROUP BY "POLICY STATUS"
ORDER BY policy_count DESC;


-- 10. Overall underperforming policy rate
-- Underperforming = Lapse + Surrender
SELECT
    COUNT(*) AS total_policies,
    SUM(CASE
            WHEN "POLICY STATUS" IN ('Lapse', 'Surrender')
            THEN 1 ELSE 0
        END) AS underperforming_policies,
    ROUND(
        100.0 * SUM(CASE
                        WHEN "POLICY STATUS" IN ('Lapse', 'Surrender')
                        THEN 1 ELSE 0
                    END) / COUNT(*),
        2
    ) AS underperforming_pct
FROM kaggle;


-- 11. Underperformance by policy duration (Early vs Later)
SELECT
    CASE
        WHEN "Policy Year" <= 5 THEN 'Early Duration (≤5)'
        ELSE 'Later Duration (>5)'
    END AS policy_duration_group,
    COUNT(*) AS total_policies,
    SUM(CASE
            WHEN "POLICY STATUS" IN ('Lapse', 'Surrender')
            THEN 1 ELSE 0
        END) AS underperforming_policies,
    ROUND(
        100.0 * SUM(CASE
                        WHEN "POLICY STATUS
