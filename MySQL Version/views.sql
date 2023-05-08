# Kody dodające widoki do bazy danych

##  card_client view
CREATE VIEW card_client AS
SELECT *
FROM card c
LEFT JOIN client c2 
USING(client_nr)
ORDER BY client_nr 

## pracownik view
CREATE VIEW pracownik AS
SELECT *
FROM employee e 
WHERE employee_position = 'pracownik'
ORDER BY employee_lname

## CEO view
CREATE VIEW ceo AS
SELECT *
FROM employee e 
WHERE employee_position = 'CEO'
ORDER BY employee_lname

## kierownik view
CREATE VIEW kierownik AS
SELECT *
FROM employee e 
WHERE employee_position = 'kierownik'
ORDER BY employee_lname

## menager view
CREATE VIEW menager AS
SELECT *
FROM employee e 
WHERE employee_position = 'menager'
ORDER BY employee_lname

## sprzedawca view
CREATE VIEW sprzedawca AS
SELECT *
FROM employee e 
WHERE employee_position = 'sprzedawca'
ORDER BY employee_lname

## ochroniarz view
CREATE VIEW ochroniarz AS
SELECT *
FROM employee e 
WHERE employee_position = 'ochroniarz'
ORDER BY employee_lname

## ksiegowy view
CREATE VIEW ksiegowy AS
SELECT *
FROM employee e 
WHERE employee_position = 'ksiegowy'
ORDER BY employee_lname

## klienci z kartami kredytowymi 
CREATE VIEW credit_cards AS
SELECT * 
FROM card c 
LEFT JOIN client
USING(client_nr)
WHERE card_type = 'Kredytowa'
ORDER BY client_lname

## zarzad view
CREATE VIEW zarzad AS
SELECT *
FROM employee e 
WHERE employee_position = 'CEO' OR employee_position = 'kierownik' OR employee_position = 'menager'
ORDER BY employee_lname
## klienci z miesiacem do konca karty

