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

-- ユーザーの年齢ごとの人数と、その年齢を取得してください
SELECT age,count(*)
FROM users
GROUP BY age ;

-- 名前の一部に「シャツ」を含む商品の、全てのカラムの値を取得してください
SELECT *
FROM items
WHERE name LIKE "%シャツ%" ;

-- 各商品あたりの利益が上位5件の商品の名前と利益を取得してください

SELECT name, price - cost
FROM items
ORDER BY price - cost DESC 
LIMIT 5 ;