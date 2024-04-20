SELECT * FROM `adta5240grp.nyc_noise_complaints.nyc` LIMIT 1000 

#Count the number of noise complaints by type
SELECT complaint_type, COUNT(*) AS count
FROM `adta5240grp.nyc_noise_complaints.nyc`
GROUP BY complaint_type
ORDER BY count DESC;

#Count the number of noise complaints by descriptor
SELECT descriptor, COUNT(*) AS count
FROM `adta5240grp.nyc_noise_complaints.nyc`
GROUP BY descriptor
ORDER BY count DESC;

#Count the number of noise complaints by location type
SELECT location_type, COUNT(*) AS count
FROM `adta5240grp.nyc_noise_complaints.nyc`
GROUP BY location_type
ORDER BY count DESC;

#Count the number of noise complaints by open data channel type
SELECT open_data_channel_type, COUNT(*) AS count
FROM `adta5240grp.nyc_noise_complaints.nyc`
GROUP BY open_data_channel_type
ORDER BY count DESC;

#Count the number of noise complaints by status
SELECT status, COUNT(*) AS count
FROM `adta5240grp.nyc_noise_complaints.nyc`
GROUP BY status
ORDER BY count DESC;

#Count the number of noise complaints by city
SELECT city, COUNT(*) AS count
FROM `adta5240grp.nyc_noise_complaints.nyc`
GROUP BY city
ORDER BY count DESC;

#Count the number of noise complaints by borough
SELECT borough, COUNT(*) AS count
FROM `adta5240grp.nyc_noise_complaints.nyc`
GROUP BY borough
ORDER BY count DESC;

#Average Resolution Time by Complaint Type
SELECT complaint_type, AVG(TIMESTAMP_DIFF(closed_date, created_date, MINUTE)) AS avg_resolution_time_minutes
FROM `adta5240grp.nyc_noise_complaints.nyc`
GROUP BY complaint_type
ORDER BY avg_resolution_time_minutes;