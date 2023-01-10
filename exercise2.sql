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