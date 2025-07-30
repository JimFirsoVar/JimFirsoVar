-- Тест 1: Сотрудники, родившиеся с 1977 по 1983 годы
SELECT *
FROM SOTR
WHERE BirthDate BETWEEN '1977-01-01' AND '1983-12-31';

-- Тест 2: Все сотрудницы
SELECT *
FROM SOTR
WHERE Sex = 'W';

-- Тест 3: Данные о сотруднике Фёдоре (Имя, Адрес, Зарплата)
SELECT S.Name, S.Address, Z.Zarp
FROM SOTR S
JOIN ZARP Z ON S.Name = Z.Name
WHERE S.Name = 'Федор';

-- Тест 4: Данные по всем сотрудникам + зарплата, если есть (иначе — 0)
SELECT S.Name, S.Address, COALESCE(Z.Zarp, 0) AS Zarp
FROM SOTR S
LEFT JOIN ZARP Z ON S.Name = Z.Name;

-- Тест 5: Общая сумма выплат по каждому сотруднику
SELECT S.Name, COALESCE(SUM(P.Amount), 0) AS TotalAmount
FROM SOTR S
LEFT JOIN PAYMENTS P ON S.Name = P.Name
GROUP BY S.Name;
