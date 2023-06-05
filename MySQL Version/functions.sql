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
CREATE FUNCTION city_salary(city VARCHAR(100)) 
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
	DECLARE suma VARCHAR(10);
	SELECT SUM(position_salary) INTO suma FROM detailed_employee WHERE company_city = "Rzeszów";
	RETURN suma;	
END$$
DELIMITER ;

#############################################################################
## Funckja logujaca pracownika

DELIMITER $$
CREATE FUNCTION log_in(email VARCHAR(100), passwd VARCHAR(100)) 
RETURNS VARCHAR(1)
DETERMINISTIC
BEGIN
	DECLARE temp VARCHAR(1);
	SELECT COUNT(*) INTO temp FROM employee WHERE employee_email = email AND employee_pesel = passwd;
	RETURN temp;
END$$
DELIMITER ;

#############################################################################
## Funckja obliczajace wartosc brutto

DELIMITER $$
CREATE FUNCTION brutto(balance DECIMAL(11,2), tax FLOAT) 
RETURNS DECIMAL(11,2)
DETERMINISTIC
BEGIN
	DECLARE temp DECIMAL(7,2);
	set temp = balance + (balance * cast(tax as decimal(7,2)));
	RETURN temp;
END$$
DELIMITER ;

## wplace pracownikow
CREATE view salaries AS
SELECT employee_email, employee_fname, employee_lname, position_salary as placa_netto, brutto(position_salary, 0.17) as placa_brutto, position_name
FROM employee
LEFT JOIN positions 
ON employee_position = position_name
order by placa_brutto;

#############################################################################
## Funckja obliczajace sume wynagrodzen w konkretnym budynku

DELIMITER $$
CREATE FUNCTION company_salary(city VARCHAR(100), street VARCHAR(100), nr VARCHAR(5), post_code VARCHAR(6)) 
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
	DECLARE suma VARCHAR(10);
	SELECT SUM(position_salary) INTO suma 
	FROM detailed_employee 
	WHERE company_city = city AND company_street = street AND company_nr = nr AND company_post_code = post_code;
	RETURN suma;	
END$$
DELIMITER ; 

## wplace pracownikow
CREATE view salaries AS
SELECT employee_email, employee_fname, employee_lname, position_salary as placa_netto, brutto(position_salary, 0.17) as placa_brutto, position_name
FROM employee
LEFT JOIN positions 
ON employee_position = position_name
order by placa_brutto;

#############################################################################
## Przykłady wywołania
SELECT client_company_count("Rzeszów")
SELECT city_salary("Warszawa")
SELECT log_in("rzaoczny@bankapp.com", "61939237410")
SELECT brutto(1000.0, 0.17)
SELECT company_salary("Warszawa", "Polna", "2", "43-023")
