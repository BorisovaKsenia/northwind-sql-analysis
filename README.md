**Аналитический проект на основе базы данных Northwind** — учебной БД, имитирующей торговую компанию (клиенты, заказы, товары, сотрудники).



Цель проекта: продемонстрировать навыки SQL: сложные `JOIN`, CTE, оконные функции, агрегации и фильтрацию данных.



Стек:



\- PostgreSQL 18

\- DBeaver (клиент)

\- Northwind Database (14 таблиц)



Структура базы данных
<img width="680" height="710" alt="er_diagram" src="https://github.com/user-attachments/assets/fe01558e-2698-4c89-9fd2-5d43dcf5fe65" />



Аналитические запросы



| № | Файл | Что показывает | Техники |

|---|------|----------------|---------|

| 01 | `01\_revenue\_by\_year.sql` | Выручка по годам | JOIN, GROUP BY, EXTRACT |

| 02 | `02\_top\_products.sql` | Топ-10 товаров по выручке | Множественные JOIN |

| 03 | `03\_revenue\_by\_country.sql` | Выручка по странам | COUNT(DISTINCT), GROUP BY |

| 04 | `04\_top\_customers.sql` | Топ-5 клиентов | JOIN трёх таблиц, LIMIT |

| 05 | `05\_monthly\_growth.sql` | Динамика по месяцам | CTE, LAG, оконные функции |

| 06 | `06\_top\_employees.sql` | Топ-5 сотрудников | Конкатенация строк, GROUP BY |

| 07 | `07\_customers\_without\_orders.sql` | Клиенты без заказов | LEFT JOIN, IS NULL |



Примеры результатов:



*Топ-10 товаров по выручке*

<img width="798" height="631" alt="query_02_top_products" src="https://github.com/user-attachments/assets/41bee7a9-570a-4859-a475-6f119963aa7d" />



Топ-5 клиентов по сумме покупок

<img width="897" height="503" alt="query_04_top_customers" src="https://github.com/user-attachments/assets/e2bfe3d5-cf42-41ad-8f92-ebfda902a721" />


Динамика выручки по месяцам (CTE + LAG)

<img width="888" height="831" alt="query_05_monthly_growth" src="https://github.com/user-attachments/assets/36182adc-9310-4ef2-9bb4-e84be35a200f" />



Ключевые выводы:



Выручка в течение 3 лет ведет себя по разному: увеличивается с \~208K (1996) до \~617K (1997),затем падает \~440K (1998). Промежуток времени мал, нужно отслеживать изменения дальше.



USA — лидер по выручке (13 клиентов), но Австрия дает крупнейших клиентов с большими чеками



QUICK-Stop (Германия) — топ-клиент с наибольшей суммой покупок



Margaret Peacock — топ-продавец с 156 заказами



Из всех зарегистрированных клиентов только двое не совершили заказ.







