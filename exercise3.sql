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