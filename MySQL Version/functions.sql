/*
Kody dodające funkcje do bazy danych
dodatkowo są dodane przykłady wywołania ich
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

## Przykłady wywołania
SELECT client_company_count("Rzeszów")
