# Subscription Analytics and Churn Rate Analysis

This project looks into subscription churn rates for Codeflix Four months into launching. It’s early on in the business and people are excited to know how the company is doing. I utilized SQL to analyze subscription data, focusing on user activity, subscription status, and churn rates across different customer segments. The analysis spans multiple months and aims to uncover insights into customer retention and subscription cancellations, enabling data-driven strategies for improving subscription services. 

The marketing department is particularly interested in how the churn compares between two segments of users. They provided a dataset containing subscription data for users who were acquired through two distinct channels. The dataset provided contains one SQL table, subscriptions. Within the table, there are 4 columns:
* id - the subscription id
* subscription_start - the start date of the subscription
* subscription_end - the end date of the subscription
* segment - this identifies which segment the subscription owner belongs to
  
Codeflix requires a minimum subscription length of 31 days, so a user can never start and end their subscription in the same month.

The key components of the project include:
 1. **Data Exploration**
  - **Preview Subscription Data:** The project begins by inspecting the `subscriptions` table, exploring up to 100 rows for an overview of the dataset.
  - **Identify Data Range:** Minimum and maximum subscription start dates are calculated to understand the timeframe of the data.
2. **Monthly Subscription Status Tracking**
  - **Timeframe Generation:** A set of months is defined, including the first and last day of each month for the analysis period.
  - **Cross-Join with Subscriptions:** Each subscription is cross-joined with the defined months to analyze its status on a monthly basis.
  - **Subscription Status Identification:** For each subscription and segment:
    - `is_active`: Identifies subscriptions active at the beginning of the month.
    - `is_canceled`: Tracks cancellations occurring within each month.
3. **Segment-Specific Aggregates**
- **Customer Segments:** Distinct customer segments are identified from the `subscriptions` data for targeted analysis.
- **Status Aggregation:** Subscription activity and cancellation counts are aggregated by month and segment:
  - `sum_active`: Total active subscriptions per segment.
  - `sum_canceled`: Total cancellations per segment.
4. **Churn Rate Analysis**
  - **Churn Rate Calculation:** The project computes the churn rate for each segment by dividing the number of cancellations by the active subscriptions for a given month:
    \[
    \text{Churn Rate} = \frac{\text{Cancellations}}{\text{Active Subscriptions}}
    \]
  - **Segment Comparison:** Churn rates are analyzed across segments and months to identify trends and segments with higher cancellation risks.

### Goals and Outcomes:
The project delivers:
1. **Subscription Activity Insights:** Understanding of monthly activity patterns across customer segments.
2. **Churn Rate Trends:** Identification of segments with higher churn rates, enabling targeted retention strategies.
3. **Segment-Specific Retention Analysis:** A scalable approach for monitoring subscription metrics, supporting the addition of new segments over time.

This analysis equips stakeholders with actionable insights for improving customer retention and optimizing subscription-based business models.
