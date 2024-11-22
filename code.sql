SELECT * FROM subscriptions
LIMIT 100;

SELECT MIN(subscription_start), MAX(subscription_start) FROM subscriptions;

WITH months as
(SELECT
"2017-01-01" AS first_day,
"2017-01-31" AS last_day
UNION
SELECT
"2017-02-01" AS first_day,
"2017-02-28" AS last_day
UNION
SELECT
"2017-03-01" AS first_day,
"2017-03-31" AS last_day),
cross_join as
(SELECT * FROM subscriptions
CROSS JOIN months),
status as 
(SELECT 
  id, 
  first_day as month, 
  CASE
    WHEN (subscription_start < first_day) AND (subscription_end > first_day OR subscription_end IS NULL) AND segment = 87 THEN 1 
    ELSE 0
  END AS is_active_87,
  CASE
    WHEN (subscription_start < first_day) AND (subscription_end > first_day OR subscription_end IS NULL) AND segment = 30 THEN 1
    ELSE 0
  END AS is_active_30,
  CASE
    WHEN segment = 87 AND (subscription_end BETWEEN first_day AND last_day ) THEN 1
    ELSE 0
  END AS is_canceled_87,
  CASE
    WHEN segment = 30 AND (subscription_end BETWEEN first_day AND last_day ) THEN 1
    ELSE 0
  END AS is_canceled_30
FROM cross_join
),
status_aggregate AS
(SELECT 
  month,
  SUM(is_active_87) AS sum_active_87,
  SUM(is_active_30) AS sum_active_30,
  SUM(is_canceled_87) AS sum_canceled_87,
  SUM(is_canceled_30) AS sum_canceled_30
FROM status
GROUP BY month
)

SELECT * FROM status_aggregate;

SELECT
  month,
  1.0 * sum_canceled_87 / sum_active_87 AS churn_rate_87,
  1.0 * sum_canceled_30 / sum_active_30 AS churn_rate_30
FROM status_aggregate;


-- Modifying code to support a large number of segments

WITH months as
(SELECT
"2017-01-01" AS first_day,
"2017-01-31" AS last_day
UNION
SELECT
"2017-02-01" AS first_day,
"2017-02-28" AS last_day
UNION
SELECT
"2017-03-01" AS first_day,
"2017-03-31" AS last_day),
cross_join as
(SELECT * FROM subscriptions
CROSS JOIN months),
segments as
(SELECT DISTINCT segment FROM subscriptions),
status as
(SELECT
  id,
  first_day as month,
  segment,
  CASE
    WHEN (subscription_start < first_day) AND (subscription_end > first_day OR subscription_end IS NULL) THEN 1
    ELSE 0
  END as is_active,
  CASE
    WHEN subscription_end BETWEEN first_day AND last_day THEN 1
    ELSE 0
  END AS is_canceled
FROM cross_join),
status_aggregate as
(SELECT
month,
segment,
SUM(is_active) AS sum_active,
SUM(is_canceled)AS sum_canceled
FROM status
GROUP BY month, segment)

SELECT * FROM status_aggregate;

SELECT month, segment, (1.0 * sum_canceled / sum_active) as churn_rate FROM status_aggregate;

