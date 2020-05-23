# Prerequisite ----
library(RSQLite)
library(readr)

# SELECT ----

# https://programmers.co.kr/learn/courses/30/lessons/59034 ----
con = dbConnect(SQLite(), 'programmers_kit.sqlite')
dbWriteTable(con, 'ANIMAL_INS', read_tsv("./ANIMAL_INS.tsv"))
dbSendQuery(con,
            'SELECT * FROM ANIMAL_INS ORDER BY ANIMAL_ID')

# https://programmers.co.kr/learn/courses/30/lessons/59036 ----
dbSendQuery(con,
            'SELECT NAME, DATETIME FROM ANIMAL_INS ORDER BY ANIMAL_ID DESC')

# https://programmers.co.kr/learn/courses/30/lessons/59036 ----
dbSendQuery(con,
            'SELECT ANIMAL_ID, NAME FROM ANIMAL_INS WHERE INTAKE_CONDITION = "Sick"')

# https://programmers.co.kr/learn/courses/30/lessons/59037 ----
dbSendQuery(con,
            'SELECT ANIMAL_ID, NAME FROM ANIMAL_INS WHERE NOT INTAKE_CONDITION = "Aged"')

# https://programmers.co.kr/learn/courses/30/lessons/59403
dbSendQuery(con,
            'SELECT ANIMAL_ID, NAME FROM ANIMAL_INS')

# https://programmers.co.kr/learn/courses/30/lessons/59404 ----
dbSendQuery(con,
            'SELECT ANIMAL_ID, NAME, DATETIME FROM ANIMAL_INS ORDER BY NAME, DATETIME DESC')

# SUM, MAX, MIN ----

# https://programmers.co.kr/learn/courses/30/lessons/59405 ----
dbSendQuery(con,
            'SELECT NAME FROM ANIMAL_INS ORDER BY DATETIME LIMIT 1')

# https://programmers.co.kr/learn/courses/30/lessons/59415 ----
dbSendQuery(con,
            'SELECT DATETIME FROM ANIMAL_INS ORDER BY DATETIME DESC LIMIT 1')

# https://programmers.co.kr/learn/courses/30/lessons/59038 ----
dbSendQuery(con,
            'SELECT COUNT(*) FROM ANIMAL_INS')

# https://programmers.co.kr/learn/courses/30/lessons/59408 ----
dbSendQuery(con,
            'SELECT COUNT(DISTINCT NAME) FROM ANIMAL_INS')

# GROUP BY ----

# https://programmers.co.kr/learn/courses/30/lessons/59040 ----
dbSendQuery(con,
            'SELECT ANIMAL_TYPE, COUNT(*) FROM ANIMAL_INS WHERE ANIMAL_TYPE = "Cat" OR ANIMAL_TYPE = "Dog" GROUP BY ANIMAL_TYPE')

# https://programmers.co.kr/learn/courses/30/lessons/59040 ----
dbSendQuery(con,
            'SELECT NAME, COUNT(NAME) FROM ANIMAL_INS GROUP BY NAME HAVING COUNT(NAME) > 1 ORDER BY NAME')

dbSendQuery(con,
            'SELECT EXTRACT(HOUR FROM DATETIME), COUNT(*) FROM ANIMAL_OUTS WHERE EXTRACT(HOUR FROM DATETIME) >= 9 AND EXTRACT(HOUR FROM DATETIME) <= 19 GROUP BY EXTRACT(HOUR FROM DATETIME)
')



