# Churning-Rates

This project looks into subscription churn rates for Codeflix Four months into launching. It’s early on in the business and people are excited to know how the company is doing.

The marketing department is particularly interested in how the churn compares between two segments of users. They provided a dataset containing subscription data for users who were acquired through two distinct channels. The dataset provided contains one SQL table, subscriptions. Within the table, there are 4 columns:
* id - the subscription id
* subscription_start - the start date of the subscription
* subscription_end - the end date of the subscription
* segment - this identifies which segment the subscription owner belongs to
  
Codeflix requires a minimum subscription length of 31 days, so a user can never start and end their subscription in the same month.
