#  Customer Shopping Behavior & Revenue Insights Dashboard

### Tools: SQL Server, Power BI, DAX

### Project Overview
This project analyzes customer demographics, purchasing behavior, and promotional effectiveness to identify key drivers of revenue and customer satisfaction. The goal is to provide actionable insights that support merchandising, marketing, and customer strategy decisions in a retail or ecommerce context.

The analysis focuses on understanding who the customers are, how they purchase, and which behaviors and promotions contribute most to overall performance.

#### Data & Modeling
Source: https://www.kaggle.com/datasets/iamsouravbanerjee/customer-shopping-trends-dataset

Records: ~3,900 transactions

Environment: SQL Server for data modeling, Power BI for visualization

#### Data Modeling Approach

Raw CSV ingested into a staging table

Cleaned and structured into a star schema optimized for analytics

#### Schema Overview

<img width="1536" height="1024" alt="ChatGPT Image Jan 21, 2026, 10_03_53 AM" src="https://github.com/user-attachments/assets/72075820-2668-41e5-a69a-31422e09bc21" />

### Power BI Report Structure

The Power BI report is organized into three pages, each answering a distinct business question:

#### Page 1 – Executive KPI Overview
<img width="2320" height="1281" alt="KPI Page 1" src="https://github.com/user-attachments/assets/73736c58-eaa6-42ab-bc6f-fa58bd737f4c" />

Includes dynamic slicers for date and product category.



#### Page 2 – Sales & Product Performance
<img width="2326" height="1312" alt="KPI Page 2" src="https://github.com/user-attachments/assets/6342964d-c884-4f18-a74b-f086d69acf22" />

This page explains what is driving overall performance.



#### Page 3 – Customer Insights
<img width="2318" height="1310" alt="Kpi Page 3" src="https://github.com/user-attachments/assets/89eeeacd-e1cb-4603-8f97-435218d23b48" />

This page focuses on customer behavior and value.


### Key DAX Measures

-Total Revenue

-Total Orders

-Unique Customers

-Average Order Value

-Revenue per Customer

-Orders per Customer

-Subscription Customer %


### Key Insights

Non-subscription customers generate higher revenue per customer compared to subscribers.

No female subscribers.

Clothing generates the most revenue while outerwear generates the least.

Females spend more per order than males.
