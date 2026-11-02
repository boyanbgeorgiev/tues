-- Тема: сноубордове
-- Изпълни първо (в база postgres): CREATE DATABASE snowboards_db;
-- После се свържи към snowboards_db и изпълни останалото.

CREATE TABLE snowboards (
    id           SERIAL PRIMARY KEY,
    brand        VARCHAR(50)  NOT NULL,   -- текст
    model        VARCHAR(100) NOT NULL,   -- текст
    length_cm    INTEGER      NOT NULL,   -- число
    price        NUMERIC(8,2) NOT NULL,   -- число
    release_date DATE,                    -- дата
    in_stock     BOOLEAN      DEFAULT true -- boolean
);

-- 3 реда с INSERT (останалите ≥ 3 се добавят с + във View/Edit Data)
INSERT INTO snowboards (brand, model, length_cm, price, release_date, in_stock) VALUES
    ('Burton',  'Custom Camber',      158, 1199.00, '2024-09-01', true),
    ('Lib Tech','Orca',               153, 1349.50, '2023-10-15', false),
    ('Капита',  'Дефендърс на Самото', 156,  999.99, '2025-01-20', true);

SELECT * FROM snowboards ORDER BY price DESC;
