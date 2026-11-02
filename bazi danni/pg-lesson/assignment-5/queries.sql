-- Въпрос 1: Всички оценки на даден ученик по даден предмет, подредени по дата.
-- Връща: ученик, предмет, дата и оценка; по един ред за всяка оценка, от най-старата към най-новата.
-- Ученикът се избира по id, защото имената се повтарят (в класа има двама Ивана).
-- Пример: ученик с id 1 (Иван Петров) по Математика.
SELECT st.first_name || ' ' || st.last_name AS student,
       su.name                              AS subject,
       g.graded_on,
       g.grade
FROM grades g
JOIN students st ON st.id = g.student_id
JOIN subjects su ON su.id = g.subject_id
WHERE g.student_id = 1
  AND su.name = 'Математика'
ORDER BY g.graded_on;


-- Въпрос 2: Среден успех на класа по всеки предмет (с два знака след запетаята) и брой оценки.
-- Връща: предмет, среден успех, брой оценки; по един ред за всеки предмет.
-- LEFT JOIN, за да се покаже и предмет без оценки (Физика: average е NULL, брой 0).
SELECT su.name                  AS subject,
       ROUND(AVG(g.grade), 2)   AS average,
       COUNT(g.id)              AS grades_count
FROM subjects su
LEFT JOIN grades g ON g.subject_id = su.id
GROUP BY su.id, su.name
ORDER BY su.name;
