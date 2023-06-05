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
CREATE PROCEDURE add_employee (IN pesel varchar(11),IN email varchar(50),IN fname varchar(50),IN lname varchar(50),IN posn varchar(50),IN company INT)
BEGIN
    insert into employee values (pesel, email, fname, lname, posn, company);
END$$
DELIMITER ;

#############################################################################
## procedura dodajaca nowego klienta
DELIMITER $$
$$
CREATE PROCEDURE add_client (IN nr varchar(6),IN passwd varchar(50),IN fname varchar(50),IN lname varchar(50))
BEGIN
    insert into client values (nr, passwd, fname, lname);
END$$
DELIMITER ;

#############################################################################
## procedura dodajaca nowa karte
DELIMITER $$
$$
CREATE PROCEDURE add_card (IN nr varchar(16),IN term_data DATE,IN cvc varchar(3),IN card_type ENUM('Debetowa', 'Kredytowa'),IN balance FLOAT, IN client VARCHAR(6))
BEGIN
    insert into card values (nr, term_data, cvc, card_type, balance, client);
END$$
DELIMITER ;

#############################################################################
## procedura dodajaca nowa pozycje
DELIMITER $$
$$
CREATE PROCEDURE add_position (IN name varchar(16),IN salary FLOAT)
BEGIN
    insert into positions values (name, salary);
END$$
DELIMITER ;


#############################################################################
## procedura pokazujaca karty w przedziale pienieznym
DELIMITER $$
$$
CREATE PROCEDURE indebted(IN c_type ENUM('Debetowa', 'Kredytowa'), in balance DECIMAL(11,2))
BEGIN
	select client_nr, card_nr, client_fname, client_lname, card_type, card_balance from card_client cc 
	where card_type = c_type and card_balance < balance
	order by card_balance;
END$$
DELIMITER ;

#############################################################################
## procedura pokazujaca tabele przelewow klienta w danym okresie czasu
DELIMITER $$
$$
CREATE PROCEDURE send_overflows_by_client(IN client VARCHAR(6), in first_date DATE, in second_date DATE)
BEGIN
	select client_nr, overflow_send_number, card_type, card_balance, overflow_recipent_number, overflow_data, overflow_amount
	from send_overflows 
	where client_nr = client and overflow_data >= first_date and overflow_data <= second_date
	order by overflow_data;
END$$
DELIMITER ;

#############################################################################
## procedura wyświetlająca zarobki pozycji w firmie netto i brutto
DELIMITER $$
$$
CREATE PROCEDURE position_salary_brutto(tax FLOAT) 
BEGIN
	SELECT position_name, position_salary AS 'netto', brutto(position_salary, tax) AS 'brutto'
	FROM positions
	ORDER BY position_salary;
END$$
DELIMITER ; 

#############################################################################
## procedura wyświetlająca zadłużonych klinetów w konkretnej placówce
DELIMITER $$
$$
CREATE PROCEDURE indebted_city(city VARCHAR(100), street VARCHAR(100), nr VARCHAR(5), post_code VARCHAR(6))
BEGIN
	SELECT client.client_nr, company_city, company_street, company_nr, company_post_code, card_nr, card_balance
	FROM client_company
	LEFT JOIN company USING(company_id)
	LEFT JOIN client USING(client_nr)
	LEFT JOIN card ON card.client_nr = client.client_nr 
	WHERE card_balance < 0 
	AND company_city = city
	AND company_street = street
	AND company_nr = nr
	AND company_post_code = post_code
	ORDER BY card_balance;
END$$
DELIMITER ;

## przykładowe wywołania procedury
CALL company_employee  ('Rzeszów', @emp);
SELECT @emp;

CALL client_overflow ('654321', @emp);
SELECT @emp;

CALL employ('sprzedawca', @emp);
SELECT @emp;

CALL indebted('Kredytowa', 0.0);

CALL send_overflows_by_client('123456', '2022-01-01', '2023-01-01');

CALL add_employee('61931237410', 'testtest@bankapp.com', 'Test', 'Test', 'CEO', 4);
CALL add_client('111111', 'trudnehaslo', 'testowe', 'konto');
CALL add_card('1111111111111111', '2025-03-03', '420', 'Debetowa', 0.0, '111111'); 
CALL add_position('kurier', '2345.00') ;
CALL position_salary_brutto(0.17);
CALL indebted_city("Rzeszów", "Dąbrowskiego", "21", "35-018");
