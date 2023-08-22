# Gerenciamento de Funcionários

## Introdução

Este projeto visa demonstrar o uso de consultas SQL para gerenciamento de funcionários, incluindo informações sobre departamentos e salários.

## Consulta 1: Quantos funcionários de cada genero existem na tabela
```sql
SELECT
    count(*) AS 'total',
    CASE
        WHEN gender = 'M' THEN 'Masculino'
        WHEN gender = 'F' THEN 'Feminino'
    END AS "genero"
FROM
    employees
GROUP BY
    gender;
```

## Consulta 2: Exibindo o nome, salário e departamento de todos os funcionários ordenando pelas utimas contratacoes:
```sql
SELECT
    *
FROM
    departments;

SELECT
    empl.name as "nome",
    dpt.name as "departamento",
    DATE_FORMAT(dpt_empl.hired_at, '%m/%Y') AS "dt contratacao"
FROM
    departments dpt
    INNER JOIN department_employees dpt_empl ON dpt.id = dpt_empl.department_id
    JOIN employees empl ON empl.id = dpt_empl.employee_id
order by
    dpt_empl.hired_at DESC;
```

## Consulta 3: Exibindo o nome, salário e departamento de todos os funcionários que recebem mais que 60 mil de salário:

```sql
SELECT
    dpt.name "departamento",
    empl.name as "funcionario",
    s.salary as "salario"
FROM
    employees empl
JOIN 
	department_employees dpt_empl on dpt_empl.employee_id = empl.id
JOIN
    departments dpt ON dpt_empl.department_id = dpt.id
JOIN 
	salaries s on s.employee_id = empl.id
WHERE
    s.salary > 60000
GROUP BY
    dpt.name, empl.name, s.salary;
```

## Consulta 4: Exibindo os departamentos com mais de 1 funcionário:
```sql
SELECT
    dpt.name as "departamento",
    COUNT(*) AS "funcionarios"
FROM
    department_employees dpt_empl
JOIN
    departments dpt ON dpt_empl.department_id = dpt.id
GROUP BY
    dpt.name
HAVING
    funcionarios > 1;
```