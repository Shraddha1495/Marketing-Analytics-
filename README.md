# Marketing-Analytics-
CROSS-CHANNEL MARKETING PERFORMANCE DASHBOARD
Analyzing spend efficiency, engagement, and conversions across channels to optimize marketing performance.

# Overview
This dashboard presents an integrated view of cross-channel marketing performance across TikTok, Google, and Facebook. It tracks spend, engagement, and acquisition efficiency to help identify optimization opportunities and support data-driven budget decisions.
## Link to live dashboard
https://app.powerbi.com/view?r=eyJrIjoiOTk1ZGRmOWQtZGUyNC00NTQzLWIyZDAtM2RiOTg4YzA3NDAwIiwidCI6IjRiNGM1YWRkLTJjZWItNDIwYi1iYzZmLTRmOGU1YjI5NDdiZCJ9

# Data Architecture & Integration
1) Snowflake was used as the cloud data warehouse to store and prepare the marketing datasets before visualization.
2) A database named MK_DB was created in Snowflake.
3) Within this database, a schema named MK_SCHEMA was created.
4) Three CSV datasets (Facebook Ads, Google Ads, TikTok Ads) were uploaded into Snowflake and loaded into separate tables under this schema.
5) The datasets were standardized and combined using SQL transformations to create a unified view that aligns metrics across all channels.
6) This unified view served as the single source of truth and was connected to Power BI for reporting and dashboard creation.
<img width="1918" height="915" alt="image" src="https://github.com/user-attachments/assets/185ff2f9-6e83-4f69-b8bc-71128ccd92ae" />

# SQL script used for data transformation and unified model creation:
Create or replace view MK_DB.MK_SCHEMA.UNIFIED_ADS_VIEW (
DATE,
CAMPAIGN_NAME,
IMPRESSIONS,
CLICKS,
SPEND,
CONVERSIONS,
SOURCE
) as
WITH facebook AS (
SELECT
date,
campaign_name,
impressions,
clicks,
spend,
conversions,
'Facebook' AS source
FROM facebook_ads
),
google AS (
SELECT
date,
campaign_name,
impressions,
clicks,
cost AS spend,
conversions,
'Google' AS source
FROM google_ads
),
tiktok AS (
SELECT
date,
campaign_name,
impressions,
clicks,
cost AS spend,
conversions,
'TikTok' AS source
FROM tiktok_ads
)
SELECT * FROM facebook
UNION ALL
SELECT * FROM google
UNION ALL
SELECT * FROM tiktok;

# Interactive Filters (Slicers)
The report includes three slicers to enable dynamic analysis:
1. Date slicer – allows users to filter performance by custom date range.
2. Day-type slicer – toggle between Weekday and Weekend performance.
3. Channel slicer – filter metrics by advertising platform (TikTok, Google, Facebook).
These controls allow users to quickly explore performance trends across time, channels, and day types.

# Key Performance Metrics
• Total Spend: $130.24K
• Total Impressions: 40.47M
• Total Clicks: 688.33K
• Total Conversions: 13.36K
• CTR: 1.70%
• CPC: $0.19
• Conversion Rate: 1.94%
• CPA: $9.75
Overall, the campaigns generate strong reach and engagement at a relatively low cost per click, with opportunities to further optimize acquisition efficiency.

# Channel-Level Insights
• TikTok drives the highest spend (~$74K) but has the highest CPA ($11) and lowest CTR (1.61%), indicating lower efficiency.
• Facebook is the most cost-efficient channel with the lowest CPA ($7.64) and highest CTR (1.96%) on ~$18K spend.
• Google shows balanced performance with ~$38K spend and a moderate CPA of $8.93.

# Campaign-Level Insights
• Retargeting and branded search campaigns deliver the lowest CPA (~$5–$6) and highest conversion rates.
• High-spend campaigns such as influencer collaborations generate strong reach but higher CPA, suggesting optimization opportunities.
• A small number of campaigns contribute disproportionately to conversions, indicating strong scaling potential.

# Weekday vs Weekend Performance Insight
Weekday campaigns generate higher conversions and slightly better cost efficiency compared to weekends. Weekends show lower overall spend (~$33K vs ~$97K on weekdays) and fewer conversions (~3.36K), with a marginally higher CPA ($9.83 vs ~$9.72). This indicates that acquisition efficiency is slightly stronger during weekdays, suggesting potential for budget prioritization on working days.

# Trend Analysis
• Spend and conversions show steady growth across the selected period.
• CPA fluctuates slightly but remains within a stable range, suggesting relatively consistent acquisition efficiency.
• Performance trends indicate opportunities to refine budget allocation by day type and campaign.

# Strategic Recommendations
• Reallocate a portion of TikTok budget toward lower-CPA channels like Facebook.
• Scale retargeting and branded search campaigns that deliver the best conversion efficiency.
• Optimize high-spend campaigns with higher CPA to improve conversion rates.
• Use the weekday/weekend slicer to identify optimal spend timing and improve acquisition efficiency.

# Conclusion
The dashboard provides a comprehensive cross-channel performance view, highlighting that while TikTok drives reach and spend, Facebook and select search campaigns deliver the strongest acquisition efficiency. Leveraging the interactive slicers enables users to quickly identify trends, compare performance segments, and make informed budget optimization decisions.

# Key Metric Definitions
• Impressions: Total number of times an ad was shown to users.
• Clicks: Number of times users clicked on an ad.
• Conversions: Number of users who completed a desired action (e.g., purchase, signup, form submission) after clicking an ad.
• Conversion Rate: Percentage of clicks that resulted in conversions.
• Spend: Total amount of money spent on advertising across campaigns or channels.
• CTR (Click-Through Rate): Percentage of users who clicked an ad after seeing it.
• CPC (Cost Per Click): Average cost paid for each ad click.
• CPA (Cost Per Acquisition): Average cost to generate one conversion.
