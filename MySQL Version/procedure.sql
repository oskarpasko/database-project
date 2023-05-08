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
## procedura liczaca ilosc otrzymanych przelewow 
## procedura liczaca ilosc pracownikow w kazdym miescie
## procedura liczaca klientow w kazdym miescie 
## procedura liczaca ilosc zadluzonych osob 
## procedura liczaca ilosc odzialow ogolnie
## procedura wyswietlja czy klient jest zadluzony czy nie 

