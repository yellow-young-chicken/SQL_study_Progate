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