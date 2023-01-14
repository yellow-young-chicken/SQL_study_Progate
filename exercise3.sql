-- 重複するデータを除いたnameカラムのデータを取得してください

SELECT DISTINCT name
FROM purchases;

-- character_nameが「にんじゃわんこ」であるデータの数を取得してください

SELECT COUNT(*)
FROM purchases
WHERE character_name = "にんじゃわんこ"
;

-- character_nameが「にんじゃわんこ」であるレコードの中で、
-- もっとも大きいpriceカラムの値を取得してください

SELECT MAX(price)
FROM purchases
WHERE character_name = "にんじゃわんこ"
;

SELECT countries.name AS "国名" , AVG(goals) AS "平均得点"
FROM players
JOIN countries
ON players.country_id = countries.id
GROUP BY countries.name ;