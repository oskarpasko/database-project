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


#############################################################################
## procedura dodajaca nowego pracownika
DELIMITER $$
$$
CREATE PROCEDURE add_employee (IN pesel varchar(50),IN email varchar(50),IN fname varchar(50),IN lname varchar(50),IN posn varchar(50),IN company INT)
BEGIN
    insert into employee values (pesel, email, fname, lname, posn, company);
END$$
DELIMITER ;

#############################################################################
## procedura dodajaca nowego pracownika
DELIMITER $$
$$
CREATE PROCEDURE add_client (IN nr varchar(50),IN passwd varchar(50),IN fname varchar(50),IN lname varchar(50))
BEGIN
    insert into client values (nr, passwd, fname, lname);
END$$
DELIMITER ;

## przykładowe wywołania procedury
CALL company_employee  ('Rzeszów', @emp);
SELECT @emp;

CALL company_employee  ('Warszawa', @emp);
SELECT @emp;

CALL add_employee('61931237410', 'testtest@bankapp.com', 'Test', 'Test', 'CEO', 4);
CALL add_client('111111', 'trudnehaslo', 'testowe', 'konto') 

CALL company_employee  ('Kraków', @emp);
SELECT @emp;


#############################################################################
## Funkcja liczaca ilosc zadluzonych osob 
#############################################################################
## Procedury CRUDowe
## Funkcja logujaca klienta
## Funkcja wyswietlja czy klient jest zadluzony czy nie 
