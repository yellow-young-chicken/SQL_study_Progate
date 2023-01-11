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