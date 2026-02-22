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