# Assignment 5 – Електронен дневник

## Решения, които взех, и защо

Имам три таблици: `students`, `subjects` и `grades`. Всяка оценка е отделен ред в `grades`, защото един ученик има много оценки по един предмет и не знам предварително колко ще са. Всяка таблица има `id SERIAL PRIMARY KEY`, а `grades` сочи към ученика и предмета със `student_id` и `subject_id` с `REFERENCES`, за да не може да има оценка на несъществуващ ученик или предмет. Оценката е `SMALLINT` с `CHECK (grade BETWEEN 2 AND 6)`, защото оценките са цели числа и базата сама трябва да спира грешна стойност, а датата е `DATE`, защото ми трябва само денят, не часът. Нарочно не пазя средния успех, защото той се изчислява от оценките със заявка и ако го пазя отделно, може да се разминава с тях; не пазя и името на класа, защото дневникът е само за един клас.

## Опит за оценка 7

```sql
INSERT INTO grades (student_id, subject_id, grade, graded_on) VALUES (1, 1, 7, '2026-11-02');
```

Базата отказва:

```
ERROR:  new row for relation "grades" violates check constraint "grades_grade_check"
DETAIL:  Failing row contains (25, 1, 1, 7, 2026-11-02).
```

Опитах и оценка към ученик, който не съществува (`student_id = 99`). Базата отказва и нея:

```
ERROR:  insert or update on table "grades" violates foreign key constraint "grades_student_id_fkey"
DETAIL:  Key (student_id)=(99) is not present in table "students".
```
