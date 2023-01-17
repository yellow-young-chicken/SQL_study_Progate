-- purchasesテーブルから、priceカラムのデータを取得してください

SELECT price
FROM purchases;

-- purchasesテーブルから、全てのカラムのデータを取得してください

SELECT *
FROM purchases;

-- 「FROM purchases」のあとにコードを追加し、purchased_atカラムが「2017-07-01」のデータを取得してください

SELECT *
FROM purchases
WHERE purchased_at = "2017-07-01";

-- 「FROM purchases」のあとにコードを追加し、purchased_atカラムが「2017-08-01以前」のデータを取得してください

SELECT *
FROM purchases
WHERE purchased_at <= "2017-08-01";

-- 「FROM purchases」のあとにコードを追加し、nameカラムが「プリン」で終わるデータを取得してください

SELECT *
FROM purchases
WHERE name LIKE "%プリン";

-- 「FROM purchases」のあとにコードを追加し、nameカラムが「プリン」を含まないデータを取得してください

SELECT *
FROM purchases
WHERE NOT name LIKE "%プリン%";

-- 「FROM purchases」のあとにコードを追加し、priceカラムがNULLでないデータを取得してください

SELECT *
FROM purchases
WHERE price is NOT NULL ;

-- 「FROM purchases」のあとにコードを追加し、categoryカラムが「食費」またはcharacter_nameカラムが「にんじゃわんこ」であるデータを取得してください

SELECT *
FROM purchases
WHERE category = "食費" OR character_name = "にんじゃわんこ";

-- 「WHERE character_name = "にんじゃわんこ"」のあとにコードを追加し、priceカラムを基準に昇順に並び替えたデータを取得してください

SELECT *
FROM purchases
WHERE character_name = "にんじゃわんこ"
ORDER BY PRICE ASC ;

-- 「WHERE character_name = "にんじゃわんこ"」のあとにコードを追加し、取得結果が「最大10件」となるようにデータを取得してください。

SELECT *
FROM purchases
WHERE character_name = "にんじゃわんこ"
LIMIT 10 ;

-- 「FROM purchases」のあとにコードを追加し、priceカラムがNULLであるデータを取得してください

SELECT *
FROM purchases
WHERE price IS NULL ;

-- 「FROM purchases」のあとにコードを追加し、categoryカラムが「食費」かつcharacter_nameカラムが「ひつじ仙人」であるデータを取得してください

SELECT *
FROM purchases
WHERE category = "食費" AND character_name = "ひつじ仙人" ;

-- 「FROM purchases」のあとにコードを追加し、priceカラムを基準に「降順に並び替えた」データを、最大で「5件」取得してください

SELECT *
FROM purchases
ORDER BY price DESC
LIMIT 5 ;

-- 重複するデータを除いたcharacter_nameカラムのデータを取得してください

SELECT DISTINCT character_name
FROM purchases;

-- character_nameが「にんじゃわんこ」であるpriceカラムのデータの合計を取得してください

SELECT SUM(price)
FROM purchases
WHERE character_name = "にんじゃわんこ" ;

-- character_nameが「にんじゃわんこ」であるpriceカラムのデータの平均を取得してください

SELECT AVG(price)
FROM purchases
WHERE character_name = "にんじゃわんこ"
;

-- purchasesテーブルのデータの数を取得してください

SELECT COUNT(*)
FROM purchases;

-- もっとも小さいpriceカラムの値を取得してください

SELECT MIN(price)
FROM purchases;

-- purchased_atごとのお金を使った数を取得してください

SELECT COUNT(price),purchased_at
FROM purchases
GROUP BY purchased_at
;

-- purchased_atとcharacter_nameごとにお金を使った回数を取得してください

SELECT COUNT(*),purchased_at,character_name
FROM purchases
GROUP BY purchased_at,character_name
;

-- WHEREに条件を付け足してcategoryが食費であるデータを
-- purchased_atとcharacter_nameでグループ化してください

SELECT SUM(price),purchased_at,character_name
FROM purchases
WHERE category = "食費"
GROUP BY purchased_at,character_name
;

-- 日付とキャラクターごとの合計金額のうち、3000円を超えるデータのみを取得してください

SELECT SUM(price),purchased_at,character_name
FROM purchases
GROUP BY purchased_at,character_name
HAVING SUM(price)>3000

;
-- キャラクターごとにグループ化し、priceカラムの合計と、character_nameを取得してください
-- ただし、WHEREでcategoryが「雑費」であるレコードから集計してください

SELECT SUM(price),character_name
FROM purchases
WHERE category = "雑費"
GROUP BY character_name
;

SELECT *
FROM players
WHERE goals > 14 ;

SELECT name,goals
FROM players
WHERE goals > (
SELECT  AVG(goals)
FROM players
);

--ASを使って、取得したカラム名を"チームの合計得点"としてください
SELECT SUM(goals) AS "チームの合計得点"
FROM players ;


SELECT countries.name, SUM(goals)
FROM players
JOIN countries
ON players.country_id = countries.id
GROUP BY countries.name
;

SELECT players.name AS "選手名",teams.name AS "前年所属していたチーム"
FROM players
JOIN teams
ON players.previous_team_id = teams.id ;

SELECT players.name AS "選手名" , teams.name AS "前年所属していたチーム"
FROM players
LEFT JOIN teams
ON players.previous_team_id = teams.id;

SELECT *
FROM players
JOIN countries
ON players.country_id = countries.id
WHERE countries.name = "日本"
AND height >= 180 ;

-- 20歳未満の男性ユーザーの、全てのカラムの値を取得してください。
SELECT *
FROM users
WHERE age < 20 AND gender = 0;


-- 全商品の名前と値段を、値段が高い順に並べてください

SELECT name,price
FROM items
ORDER BY price DESC ;

-- 全商品の利益の平均を取得してください

SELECT AVG(price - cost)
FROM items ;

-- 7000円以下で「グレーパーカー」より利益が高い商品を取得してください

SELECT name, price - cost
FROM items
WHERE price <= 7000 AND price - cost > (
SELECT price - cost
FROM items
WHERE name = "グレーパーカー");


-- 売れた数が多い上位5商品のidと個数を取得してください

SELECT item_id,count(*)
FROM sales_records
GROUP BY item_id
ORDER BY count(*) DESC 
LIMIT 5 ;

-- このサイトの総売上と総利益を取得してください
SELECT SUM(items.price) AS "総売上", SUM(items.price - items.cost) AS "総利益"
FROM sales_records
JOIN items
ON sales_records.item_id = items.id;


-- 日ごとの売上額とその日付を取得してください
SELECT sales_records.purchased_at, SUM(items.price) AS "売上額"
FROM sales_records
JOIN items
ON sales_records.item_id = items.id
GROUP BY purchased_at
ORDER BY purchased_at ASC ;

-- 「サンダル」を購入したユーザーのidと名前を重複無く取得してください
SELECT users.id, users.name
FROM sales_records
JOIN users
ON sales_records.user_id = users.id
WHERE sales_records.item_id = (
SELECT id 
FROM items
WHERE name = "サンダル"
)
GROUP BY users.id, users.name ;

-- 売上額が上位5位の商品の指定されたデータを取得してください
SELECT items.id, items.name, SUM(items.price) AS "売上額"
FROM sales_records
JOIN items
ON sales_records.item_id = items.id
GROUP BY items.id, items.name , items.price
ORDER BY SUM (items.price) DESC
LIMIT 5 ;
