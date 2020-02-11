-- 0. Checking data import:
-- SELECT COUNT(*) FROM likes;

-- 1. Who are 5 oldest users?
-- SELECT * FROM users ORDER BY created_at ASC LIMIT 5;

-- 2. What day of the week do most users register on?
-- SELECT DAYNAME(created_at) AS day, COUNT(*) as total FROM users GROUP BY day ORDER BY total DESC LIMIT 2;

-- 3. Find users who never posted a photo.
-- SELECT users.username, users.id FROM users LEFT JOIN photos ON users.id = photos.user_id WHERE photos.id IS NULL;

-- 4. Who won the contest for most likes on a single photo?
/* SELECT 
	users.username AS Winners,
    photos.id AS Photo_ID,
	photos.image_url AS Image_URL,
    COUNT(*) AS Total
FROM photos 
JOIN likes 
	ON likes.photo_id = photos.id 
JOIN users
	ON users.id = photos.user_id
GROUP BY photos.id
ORDER BY total DESC
LIMIT 5; */

-- 5. How many photos does the average user post?
-- SELECT ((SELECT COUNT(*) FROM photos) / (SELECT COUNT(*) FROM users)) AS AvgPhotoPerUser;

-- 6. What are 5 most popular hashtags?
/* SELECT 
	tags.tag_name, 
    COUNT(*) AS total 
FROM photo_tags 
JOIN tags 
	ON photo_tags.tag_id = tags.id 
GROUP BY tags.id
ORDER BY total DESC
LIMIT 8;

-- Note to exe.6: There is 3 different tags with total of 24 uses. 
-- This is why depending on LIMIT number we're getting different results until limit count reaches 8 (where next hashtag has 23 uses) */

-- 7. Who have liked every single photo on the site?
/* SELECT
	username,
    COUNT(*) AS likes_num
FROM users
JOIN likes
	ON users.id = likes.user_id
GROUP BY likes.user_id
HAVING likes_num = (SELECT COUNT(*) FROM photos); */












