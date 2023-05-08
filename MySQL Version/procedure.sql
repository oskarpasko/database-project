/*
Kody dodające procedury do bazy danych
dodatkowo są dodane przykłady wywołania procedur
*/

#############################################################################
## procedura licząca pracowników na konkretnych stanowiskach
DELIMITER $$
$$
CREATE PROCEDURE bankapp.employ(IN employy VARCHAR(20), OUT emp INT)
BEGIN
	SELECT COUNT(*) INTO emp FROM bankapp.employee
	WHERE employee_position  = employy;
END$$
DELIMITER ;

## przykładowe wywołania procedury
CALL employ('sprzedawca', @emp);
SELECT @emp;

CALL employ('kierownik', @emp);
SELECT @emp;

CALL employ('ceo', @emp);
SELECT @emp;

CALL employ('menager', @emp);
SELECT @emp;

#############################################################################
## procedura liczaca ilosc wykonanych przelewow przez danego klienta
DELIMITER $$
$$
CREATE PROCEDURE bankapp.client_overflow(IN cli CHAR(6), OUT emp INT)
BEGIN
	SELECT COUNT(*) INTO emp FROM detailed_overflow
	WHERE client_nr  = cli;
END$$
DELIMITER ;

## przykładowe wywołania procedury
CALL client_overflow ('123456', @emp);
SELECT @emp;

CALL client_overflow ('654321', @emp);
SELECT @emp;

#############################################################################
## procedura liczaca ilosc pracownikow w kazdym miescie
DELIMITER $$
$$
CREATE PROCEDURE bankapp.company_employee(IN city VARCHAR(20), OUT emp INT)
BEGIN
	SELECT COUNT(*) INTO emp FROM company
	JOIN employee
	ON employee.employee_company = company.company_id 
	WHERE company_city = city;
END$$
DELIMITER ;

## przykładowe wywołania procedury
CALL company_employee  ('Rzeszów', @emp);
SELECT @emp;

CALL company_employee  ('Warszawa', @emp);
SELECT @emp;

CALL company_employee  ('Kraków', @emp);
SELECT @emp;

#############################################################################
## procedura liczaca klientow w kazdym miescie 
#############################################################################
## procedura liczaca ilosc zadluzonych osob 
#############################################################################
## procedura liczaca ilosc odzialow ogolnie
#############################################################################
## procedura wyswietlja czy klient jest zadluzony czy nie 

