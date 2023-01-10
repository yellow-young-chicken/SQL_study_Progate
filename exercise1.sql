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