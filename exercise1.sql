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

-- ユーザー全体の平均年齢を取得してください
SELECT AVG(age)
FROM users ;

-- 全商品の名前を重複無く取得してください

SELECT DISTINCT(name)
FROM items ;

-- 全商品の名前、値段、利益を取得してください
SELECT name,price,price - cost
FROM items ;

-- 「グレーパーカー」より値段が高い商品の名前と値段を取得してください

SELECT name,price
FROM items
WHERE price > (
SELECT price
FROM items
WHERE name = "グレーパーカー");

-- 商品ごとに商品のid、売れた個数を取得してください

SELECT item_id,count(*)
FROM sales_records
GROUP BY item_id ;

-- 売れた数が多い上位5商品のIDと名前、個数を取得してください
SELECT items.id, items.name, COUNT(*)
FROM sales_records
JOIN items
ON sales_records.item_id = items.id
GROUP BY items.id, items.name
ORDER BY COUNT(*) DESC
LIMIT 5;

-- 日ごとの販売個数とその日付を取得してください
SELECT purchased_at , COUNT(*) AS "販売個数"
FROM sales_records
GROUP BY purchased_at 
ORDER BY purchased_at ASC ;

-- 10個以上購入したユーザーIDとユーザー名、購入した商品の数を取得してください
SELECT users.id, users.name, COUNT(*) AS "購入数"
FROM sales_records
JOIN users
ON sales_records.user_id = users.id
GROUP BY users.id,users.name
HAVING COUNT(*) >= 10;


-- 男性向け、女性向け、男女兼用商品ごとに指定されたデータを取得してください
SELECT items.gender, SUM(items.price) AS "売上額"
FROM sales_records
JOIN items
ON sales_records.item_id = items.id
GROUP BY items.gender;

-- studentsテーブルにデータを追加してください。

INSERT INTO students( name,course)
VALUES ( "Kate","Java");

-- 下記のクエリは消さないでください。
select * from students;


-- studentsテーブルのidカラムの値が6のレコードをnameをJordanに、courseをHTMLに変更してください。

UPDATE students
SET name= "Jordan",course= "HTML"
WHERE id = 6;

-- 下記のクエリは消さないでください。
SELECT * FROM students WHERE id=6;


-- studentsテーブルからidカラムの値が7のレコードを削除してください。

DELETE FROM students
WHERE id = 7 ;

-- 下記のクエリは消さないでください。
SELECT * FROM students;

-- studentsテーブルにnameをKaty、courseをHTMLとしたレコードを追加してください。

INSERT INTO students ( name,course)
VALUES ( "Katy","HTML");

-- studentsテーブルのidカラムの値が6のレコードのnameをJuliet、courseをRubyに更新してください。

UPDATE students
SET name = "Juliet", course = "Ruby" 
WHERE id = 6 ;

-- studentsテーブルのidカラムの値が2のレコードを削除してください。

DELETE FROM students
WHERE id = 2 ;

-- 下記のクエリは消さないでください。
SELECT * FROM students;
