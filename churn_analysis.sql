SELECT *
FROM ['Telco-Customer-Churn$']

-- 1. Overall churn rate
SELECT 
    AVG(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churn_rate
FROM ['Telco-Customer-Churn$']

-- 2. Contractual Churn
SELECT 
    Contract,
    COUNT(*) AS total_clients,
    SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned_clients,
    AVG(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churn_rate
FROM ['Telco-Customer-Churn$']
GROUP BY Contract
ORDER BY churn_rate DESC;

-- 3. Estimated lost revenue
SELECT 
    SUM(MonthlyCharges * tenure) AS revenue_lost
FROM ['Telco-Customer-Churn$']
WHERE Churn='Yes';
