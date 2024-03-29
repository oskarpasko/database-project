# Kody dodające widoki do bazy danych

##  card_client view
CREATE VIEW card_client AS
SELECT *
FROM card c
LEFT JOIN client c2 
USING(client_nr)
ORDER BY client_nr ;

## pracownik view
CREATE VIEW pracownik AS
SELECT *
FROM employee e 
WHERE employee_position = 'pracownik'
ORDER BY employee_lname;

## CEO view
CREATE VIEW ceo AS
SELECT *
FROM employee e 
WHERE employee_position = 'CEO'
ORDER BY employee_lname;

## kierownik view
CREATE VIEW kierownik AS
SELECT *
FROM employee e 
WHERE employee_position = 'kierownik'
ORDER BY employee_lname;

## menager view
CREATE VIEW menager AS
SELECT *
FROM employee e 
WHERE employee_position = 'menager'
ORDER BY employee_lname;

## sprzedawca view
CREATE VIEW sprzedawca AS
SELECT *
FROM employee e 
WHERE employee_position = 'sprzedawca'
ORDER BY employee_lname;

## ochroniarz view
CREATE VIEW ochroniarz AS
SELECT *
FROM employee e 
WHERE employee_position = 'ochroniarz'
ORDER BY employee_lname;

## ksiegowy view
CREATE VIEW ksiegowy AS
SELECT *
FROM employee e 
WHERE employee_position = 'ksiegowy'
ORDER BY employee_lname;

## klienci z kartami kredytowymi 
CREATE VIEW credit_cards AS
SELECT * 
FROM card c 
LEFT JOIN client
USING(client_nr)
WHERE card_type = 'Kredytowa'
ORDER BY client_lname;

## zarzad view
CREATE VIEW zarzad AS
SELECT *
FROM employee e 
WHERE employee_position = 'CEO' OR employee_position = 'kierownik' OR employee_position = 'menager'
ORDER BY employee_lname;

## szczegółowe przelewy
CREATE VIEW detailed_overflow AS
SELECT *
FROM overflow  
LEFT JOIN card  
ON overflow.overflow_send_number = card.card_nr 
LEFT JOIN client
USING(client_nr);

## dane klientów i placówek do którychnależą
CREATE VIEW client_company_view AS
SELECT *
FROM client_company 
LEFT JOIN client USING(client_nr)
LEFT JOIN company USING(company_id)
ORDER BY company_city;

## wysłane przelewy
create view send_overflows as
select *
from overflow
left join card 
on overflow_send_number = card_nr
left join client;

## detailed employee
CREATE VIEW detailed_employee AS 
SELECT *
FROM company
LEFT JOIN employee 
ON employee_company = company_id
LEFT JOIN positions
ON position_name = employee_position
using(client_nr);

## detailed company_client
CREATE VIEW detailed_company_client AS
SELECT client.client_nr, company_city, company_street, company_nr, company_post_code, card_nr, card_balance
FROM client_company
LEFT JOIN company USING(company_id)
LEFT JOIN client USING(client_nr)
LEFT JOIN card ON card.client_nr = client.client_nr 
ORDER BY card_balance;
