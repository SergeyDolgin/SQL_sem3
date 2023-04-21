CREATE DATABASE sem3_company;

USE sem3_company;

CREATE TABLE sotrudniki (
	id SERIAL AUTO_INCREMENT UNIQUE PRIMARY KEY,
    name VARCHAR (10) NOT NULL,
    surname VARCHAR (10) NOT NULL,
	speciality VARCHAR (10),
    seniority INT,
    salary DECIMAL (8),
    age INT
);

INSERT INTO sotrudniki (name, surname, speciality, seniority, salary, age) 
VALUES
		('Вася', 'Васькин', 'начальник', 40, 100000, 60),
        ('Петя', 'Петькин', 'начальник', 8, 70000, 30),
        ('Катя', 'Каткина', 'инженер', 2, 70000, 25),
        ('Саша', 'Сашкин', 'инженер', 12, 50000, 35),
        ('Иван', 'Иванов', 'рабочий', 40, 30000, 59),
        ('Петр', 'Петров', 'рабочий', 20, 25000, 40),
        ('Сидор', 'Сидоров', 'рабочий', 10, 20000, 35),
        ('Антон', 'Антонов', 'рабочий', 8, 19000, 28),
        ('Юра', 'Юркин', 'рабочий', 5, 15000, 25),
        ('Максим', 'Воронин', 'рабочий', 2, 11000, 22),
        ('Юра', 'Галкин', 'рабочий', 3, 12000, 24),
        ('Люся', 'Люськина', 'уборщик', 10, 10000, 49);
        
# 1. Отсортируйте поле “зарплата” в порядке убывания и возрастания

SELECT name, surname, speciality, seniority, salary, age FROM sotrudniki
ORDER BY salary DESC;

# 2. Отсортируйте по возрастанию поле “Зарплата” и выведите 5 строк с наибольшей заработной платой (возможен подзапрос)

SELECT name, surname, speciality, seniority, salary, age FROM (SELECT * FROM sotrudniki ORDER BY salary DESC LIMIT 5) q ORDER BY q.salary;

# 3. Выполните группировку всех сотрудников по специальности , суммарная зарплата которых превышает 100000

SELECT speciality, COUNT(*) AS count, SUM(salary) AS summa FROM sotrudniki GROUP BY speciality HAVING SUM(salary) > 100000;

