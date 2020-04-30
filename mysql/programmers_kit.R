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

# https://programmers.co.kr/learn/courses/30/lessons/59405 ----
dbSendQuery(con,
            'SELECT NAME FROM ANIMAL_INS ORDER BY DATETIME LIMIT 1')

