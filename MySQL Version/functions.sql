/*
Kody dodające funkcje do bazy danych
dodatkowo są dodane przykłady wywołania ich
!!!!!! Uruchom plik bez przykładowych wywołań tylko same deklaracje funkcji !!!!!!
*/

#############################################################################
## Funkcja liczaca klientow w kazdym miescie 

DELIMITER $$
CREATE FUNCTION client_company_count(city VARCHAR(100)) 
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
	DECLARE liczba VARCHAR(10);
	SELECT COUNT(*) INTO liczba FROM client_company_view WHERE company_city = city;
	RETURN liczba;	
END$$
DELIMITER ;

#############################################################################
## Funckja zwracajaca sume wyplat dla pracownikow w poszczegolnej placowce

DELIMITER $$
CREATE FUNCTION company_salary(city VARCHAR(100)) 
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
	DECLARE suma VARCHAR(10);
	SELECT SUM(position_salary) INTO suma FROM detailed_employee WHERE company_city = "Rzeszów";
	RETURN suma;	
END$$
DELIMITER ;

#############################################################################
## Przykłady wywołania
SELECT client_company_count("Rzeszów")
SELECT company_salary("Warszawa")
