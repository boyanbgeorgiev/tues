-- Домашно: изпълнявай заявките една по една в Query Tool (F5) и прави screenshot на всяка.

-- 1) UPDATE ... WHERE
UPDATE snowboards SET price = 1099.00 WHERE model = 'Custom Camber';

-- 2) DELETE ... WHERE
DELETE FROM snowboards WHERE in_stock = false;

-- 3) Всички редове с ORDER BY
SELECT * FROM snowboards ORDER BY length_cm DESC;

-- 4) WHERE по текст
SELECT * FROM snowboards WHERE brand = 'Burton';

-- 5) WHERE по число
SELECT * FROM snowboards WHERE price < 1200;

-- 5б) WHERE по дата (алтернатива)
SELECT * FROM snowboards WHERE release_date >= '2024-01-01';

-- 6) Таблица 2: каращи (riders)
CREATE TABLE riders (
    id            SERIAL PRIMARY KEY,
    nickname      VARCHAR(50) NOT NULL,
    days_on_snow  INTEGER,
    joined        DATE
);

INSERT INTO riders (nickname, days_on_snow, joined) VALUES
    ('PowderHound', 120, '2022-12-10'),
    ('Боро Банско',  45, '2024-01-05'),
    ('JibKing',      80, '2023-02-18');

SELECT * FROM riders ORDER BY days_on_snow DESC;

-- 7) DROP TABLE
DROP TABLE riders;
