-- purchasesテーブルから、nameカラムのデータを取得してください

SELECT name
FROM purchases;

-- purchasesテーブルから、「nameカラム」と「priceカラム」のデータを取得してください

SELECT name,price
FROM purchases;

-- 「FROM purchases」のあとにコードを追加し、categoryカラムが「食費」であるデータを取得してください

SELECT *
FROM purchases
WHERE category = "食費";

-- 「FROM purchases」のあとにコードを追加し、priceカラムが「1000」のデータを取得してください

SELECT *
FROM purchases
WHERE price = 1000;

-- 「FROM purchases」のあとにコードを追加し、priceカラムが「1000以上」のデータを取得してください

SELECT *
FROM purchases
WHERE price >= 1000 ;

-- 「FROM purchases」のあとにコードを追加し、nameカラムが「プリン」を含むデータを取得してください

SELECT *
FROM purchases
WHERE name LIKE "%プリン%" ;

-- 「FROM purchases」のあとにコードを追加し、nameカラムが「プリン」で始まるデータを取得してください

SELECT *
FROM purchases
WHERE name LIKE "プリン%";

-- 「FROM purchases」のあとにコードを追加し、character_nameカラムが「にんじゃわんこ」でないデータを取得してください

SELECT *
FROM purchases
WHERE NOT character_name = "にんじゃわんこ";

-- 「FROM purchases」のあとにコードを追加し、priceカラムがNULLであるデータを取得してください

SELECT *
FROM purchases
WHERE price is NULL ;

-- 「FROM purchases」のあとにコードを追加し、categoryカラムが「食費」かつcharacter_nameカラムが「ひつじ仙人」であるデータを取得してください

SELECT *
FROM purchases
WHERE category = "食費" AND character_name = "ひつじ仙人";

-- 「FROM purchases」のあとにコードを追加し、priceカラムを基準に降順に並び替えたデータを取得してください

SELECT *
FROM purchases
ORDER BY price DESC ;

-- 「FROM purchases」のあとにコードを追加し、取得結果が「最大5件」となるようにデータを取得してください。

SELECT *
FROM purchases
LIMIT 5 ;

-- 「FROM purchases」のあとにコードを追加し、purchased_atカラムが「2017-08-01以前」のデータを取得してください

SELECT *
FROM purchases
WHERE purchased_at <= "2017-08-01";

-- 「FROM purchases」のあとにコードを追加し、nameカラムが「プリン」を含むデータを取得してください

SELECT *
FROM purchases
WHERE name LIKE "%プリン%" ;

/*
「FROM purchases」のあとにコードを追加し、
NOT演算子を用いてcharacter_nameカラムが「にんじゃわんこ」でないデータを取得してください。
*/

SELECT *
FROM purchases
WHERE NOT character_name = "にんじゃわんこ" ;

-- 実行ボタンを押し、重複を除かない状態でcharacter_nameカラムのデータを取得してみましょう。

SELECT character_name
FROM purchases;

-- 「SELECT name, price, 」に追加し、消費税を含んだpriceカラムのデータを取得してください

SELECT name, price, price*1.08
FROM purchases;

-- priceカラムのデータの合計を取得してください

SELECT SUM(price)
FROM purchases;

-- priceカラムの平均を取得してください

SELECT AVG(price)
FROM purchases;

-- purchasesテーブルのnameカラムのデータの数を取得してください

SELECT COUNT(name)
FROM purchases

-- もっとも大きいpriceカラムの値を取得してください

SELECT MAX(price)
FROM purchases;

-- purchased_atごとの合計金額を取得してください

SELECT SUM(price),purchased_at
FROM purchases
GROUP BY purchased_at
;

-- purchased_atとcharacter_nameごとの合計金額を取得してください

SELECT SUM(price),purchased_at,character_name
FROM purchases
GROUP BY purchased_at,character_name
;


-- WHEREに条件を付け足してcharacter_nameがにんじゃわんこであるデータを取得し、
-- グループ化してください

SELECT SUM(price),purchased_at
FROM purchases
WHERE character_name = "にんじゃわんこ"
GROUP BY purchased_at
;

-- 日付ごとの合計金額のうち、2000円を超えるデータのみを取得してください

SELECT SUM(price),purchased_at
FROM purchases
GROUP BY purchased_at
HAVING SUM(price)>2000
;

-- categoryでグループ化し、各カテゴリーごとにpriceカラムの合計とcategoryカラムのデータを取得してください

SELECT SUM (price),category
FROM purchases
GROUP BY category
;

SELECT goals
FROM players
WHERE name = "ウィル";

SELECT name
FROM players
WHERE goals > (
  -- この下にウィルの得点数を取得するクエリを書いてください
  SELECT goals
  FROM players
  WHERE name = "ウィル"
)
;

--ASを使って、取得したカラム名を"身長180cm以上の選手"としてください
SELECT name AS "身長180cm以上の選手"
FROM players
WHERE height >= 180 ;


SELECT *
FROM countries
WHERE rank < (
  SELECT rank
  FROM countries
  WHERE name = "日本"
)
;

SELECT SUM(goals),country_id
FROM players
GROUP BY country_id;

SELECT *
FROM players
--結合するテーブル名を追加してください
JOIN countries
--結合条件を追加してください
ON players.country_id = countries.id ;

SELECT players.name,countries.name
FROM players
JOIN countries
ON players.country_id = countries.id ;

SELECT *
FROM players
JOIN teams
ON players.previous_team_id = teams.id ;

SELECT *
FROM players
LEFT JOIN teams
ON players.previous_team_id = teams.id;

SELECT *
FROM players
JOIN countries
ON players.country_id = countries.id
LEFT JOIN teams
ON players.previous_team_id = teams.id;

SELECT name AS "選手名" , height AS "身長"
FROM players
WHERE height>(
SELECT AVG(height)
FROM players
);