-- Създаване на таблиците и данните за assignment-5 (база gradebook).
-- Изпълни в Query Tool, свързан към базата gradebook.

CREATE TABLE students (
    id           SERIAL PRIMARY KEY,
    first_name   VARCHAR(50) NOT NULL,
    last_name    VARCHAR(50) NOT NULL,
    class_number SMALLINT    NOT NULL UNIQUE CHECK (class_number BETWEEN 1 AND 40)
);

CREATE TABLE subjects (
    id   SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE grades (
    id         SERIAL PRIMARY KEY,
    student_id INTEGER  NOT NULL REFERENCES students(id),
    subject_id INTEGER  NOT NULL REFERENCES subjects(id),
    grade      SMALLINT NOT NULL CHECK (grade BETWEEN 2 AND 6),
    graded_on  DATE     NOT NULL
);

-- Двама ученици с име Иван: заявка, която търси само по първо име, ще сгреши.
INSERT INTO students (first_name, last_name, class_number) VALUES
    ('Иван',   'Петров',    1),
    ('Мария',  'Георгиева', 2),
    ('Иван',   'Димитров',  3),
    ('Елена',  'Николова',  4),
    ('Георги', 'Стоянов',   5),
    ('Никола', 'Тодоров',   6);

-- Физика още няма оценки: с обикновен JOIN изчезва от средния успех.
INSERT INTO subjects (name) VALUES
    ('Математика'),
    ('Български език'),
    ('Английски език'),
    ('Информатика'),
    ('Физика');

INSERT INTO grades (student_id, subject_id, grade, graded_on) VALUES
    -- Математика: Иван Петров има 4 оценки, въведени не по ред на датата
    (1, 1, 5, '2026-10-20'),
    (1, 1, 3, '2026-09-22'),
    (1, 1, 6, '2026-11-02'),
    (1, 1, 4, '2026-10-06'),
    (3, 1, 2, '2026-09-22'),
    (3, 1, 4, '2026-10-20'),
    (2, 1, 6, '2026-10-06'),
    (4, 1, 5, '2026-10-20'),
    (5, 1, 3, '2026-11-02'),
    -- Български език
    (1, 2, 4, '2026-10-06'),
    (2, 2, 6, '2026-09-29'),
    (2, 2, 5, '2026-10-13'),
    (4, 2, 6, '2026-10-13'),
    (6, 2, 3, '2026-09-29'),
    -- Английски език
    (3, 3, 5, '2026-10-01'),
    (5, 3, 4, '2026-10-01'),
    (6, 3, 6, '2026-10-15'),
    (1, 3, 5, '2026-10-15'),
    -- Информатика (Иван Петров има оценка и на 2026-10-06, същия ден като по математика)
    (1, 4, 6, '2026-10-06'),
    (2, 4, 6, '2026-10-08'),
    (3, 4, 3, '2026-10-08'),
    (4, 4, 4, '2026-10-22'),
    (5, 4, 5, '2026-10-22'),
    (6, 4, 2, '2026-10-29');
