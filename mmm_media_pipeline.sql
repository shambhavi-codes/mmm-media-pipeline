

--           TOTAL SPEND BY CHANNEL TYPE               --
-- How much did we spend on each channel over 2 years? --
SELECT
    channel_type,
    COUNT(*)              AS weeks_of_data,
    SUM(spend)            AS total_spend,
    ROUND(AVG(spend), 2)  AS avg_weekly_spend
FROM unified_media_data
GROUP BY channel_type
ORDER BY total_spend DESC;


 --                MONTHLY SPEND TREND                 --
 -- How did total media spend change month over month? --
 SELECT
	date_format(week_start, '%Y-%m'),
    sum(spend)
FROM unified_media_data
GROUP by date_format(week_start, '%Y-%m')
ORDER BY date_format(week_start, '%Y-%m');

--                  PLATFORM COMPARISON WITHIN PAID SOCIAL                 --
-- Between Facebook and Instagram, who got more impressions for the spend? --
SELECT
    platform,
    SUM(impressions) AS total_impressions,
    SUM(spend) AS total_spend,
    ROUND(SUM(spend)/ SUM(impressions) * 1000,2) AS cpm
FROM unified_media_data
WHERE channel_type = 'Paid Social'
GROUP BY platform
ORDER BY cpm ASC;

--                    YOUTUBE R&F OVERTIME                             --
-- Was our YouTube audience being reached consistently week over week? --
SELECT
    week_start,
    reach,
    frequency,
    spend
FROM unified_media_data
WHERE platform = 'YouTube'
ORDER BY week_start ASC;
