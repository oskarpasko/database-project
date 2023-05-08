/*

Kod generujący bazę danych aplikacji BankApp

Tabele: Client, Card, Overflow, Company, Positions, Employee, Client_Company

Dodatkowo kod wprowadza dane do bazy

*/

CREATE SCHEMA bankapp;

USE bankapp;

CREATE TABLE client
(
	client_nr VARCHAR(6) PRIMARY KEY NOT NULL UNIQUE CHECK(char_length(client_nr) = 6),
    client_password VARCHAR(100) NOT NULL,
    client_fname VARCHAR(100) NOT NULL,
    client_lname VARCHAR(100) NOT NULL
);

INSERT INTO client values('123456', 'adminadmin', 'Admin', 'Admin');
INSERT INTO client values('654321', 'testtest', 'Test', 'Test');
INSERT INTO client values('923860', 'oskarpasko', 'Oskar', 'Paśko');
INSERT INTO client values('015348', 'elizatworkowska', 'Eliza', 'Tworkowska');

CREATE TABLE card
(
    card_nr VARCHAR(16) PRIMARY KEY NOT NULL UNIQUE CHECK(char_length(card_nr)=16),
    card_term_data DATE NOT NULL,
    card_cvc_number VARCHAR(3) NOT NULL CHECK(char_length(card_cvc_number)=3),
    card_type ENUM('Debetowa', 'Kredytowa'),
    card_balance FLOAT NOT NULL,
    client_nr VARCHAR(6) NOT NULL,
    FOREIGN KEY (client_nr) REFERENCES client (client_nr)
);

INSERT INTO card values('1234567890123456', '2026-03-02', '123', 'Debetowa', 128.0, '123456');
INSERT INTO card values('6543210987654321', '2023-02-02', '321', 'Kredytowa', -105.34,  '123456');
INSERT INTO card values('1957463518203058', '2023-12-12', '000', 'Kredytowa', 0.0,  '123456');
INSERT INTO card values('3947561056372946', '2025-12-11', '789', 'Debetowa', 53.43,  '923860');
INSERT INTO card values('2635000016253729', '2023-09-12', '946', 'Kredytowa', -5000.0, '654321');
INSERT INTO card values('1221344345545665', '2024-06-01', '734', 'Debetowa', 300.23, '654321');
INSERT INTO card values('0192837465657489', '2024-05-05', '667', 'Debetowa', 27.4, '923860');
INSERT INTO card values('0293650142399990', '2023-11-11', '912', 'Debetowa', 18.35, '015348');
INSERT INTO card values('1122334455667788', '2027-02-02', '112', 'Kredytowa', -2520.0,  '015348');
INSERT INTO card values('9102910291029102', '2026-02-08', '520', 'Kredytowa', -10.0, '015348');

CREATE TABLE overflow
(
	overflow_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    overflow_send_number VARCHAR(16) NOT NULL CHECK(char_length(overflow_send_number)=16),
    overflow_recipent_number VARCHAR(16) NOT NULL CHECK(char_length(overflow_recipent_number)=16),
    overflow_data DATE NOT NULL,
    overflow_amount FLOAT NOT NULL,
    
    FOREIGN KEY (overflow_send_number) REFERENCES card (card_nr),
    FOREIGN KEY (overflow_recipent_number) REFERENCES card (card_nr)
);

INSERT INTO overflow values(null, '1234567890123456', '6543210987654321', '2022-06-21', 293.00);
INSERT INTO overflow values(null, '6543210987654321', '1957463518203058', '2022-02-11', -12.93);
INSERT INTO overflow values(null, '1957463518203058', '6543210987654321', '2022-11-11', 234.65);
INSERT INTO overflow values(null, '1957463518203058', '3947561056372946', '2021-02-12', -242.00);
INSERT INTO overflow values(null, '1221344345545665', '2635000016253729', '2022-12-12', 648.56);
INSERT INTO overflow values(null, '1221344345545665', '3947561056372946', '2019-01-29', -552.85);
INSERT INTO overflow values(null, '2635000016253729', '0192837465657489', '2019-06-03', -402.68);
INSERT INTO overflow values(null, '3947561056372946', '2635000016253729', '2019-11-23', 94.75);
INSERT INTO overflow values(null, '0293650142399990', '0192837465657489', '2020-07-10', 990.00);
INSERT INTO overflow values(null, '1122334455667788', '0192837465657489', '2021-12-20', 188.26);
INSERT INTO overflow values(null, '0192837465657489', '0293650142399990', '2021-12-24', -670.34);
INSERT INTO overflow values(null, '9102910291029102', '1957463518203058', '2020-03-14', 163.73);
INSERT INTO overflow values(null, '1122334455667788', '1957463518203058', '2019-12-03', -152.00);
INSERT INTO overflow values(null, '1234567890123456', '1221344345545665', '2022-12-06', 23.75);
INSERT INTO overflow values(null, '1234567890123456', '0293650142399990', '2022-09-07', -12.09);
INSERT INTO overflow values(null, '6543210987654321', '0293650142399990', '2021-12-20', 159.44);
INSERT INTO overflow values(null, '2635000016253729', '3947561056372946', '2021-06-23', -789.98);
INSERT INTO overflow values(null, '2635000016253729', '1221344345545665', '2020-12-18', 200.00);
INSERT INTO overflow values(null, '0293650142399990', '1221344345545665', '2020-04-15', 500.00);
INSERT INTO overflow values(null, '1122334455667788', '1234567890123456', '2022-07-26', -700.98);
INSERT INTO overflow values(null, '3947561056372946', '1122334455667788', '2021-10-01', -76.12);
INSERT INTO overflow values(null, '9102910291029102', '0293650142399990', '2020-04-15', 234.54);
INSERT INTO overflow values(null, '0192837465657489', '0293650142399990', '2019-01-25', -123.23);
INSERT INTO overflow values(null, '9102910291029102', '1234567890123456', '2022-12-10', 678.09);
INSERT INTO overflow values(null, '9102910291029102', '1122334455667788', '2021-10-08', 435.23);
INSERT INTO overflow values(null, '1957463518203058', '1234567890123456', '2020-06-18', -574.00);
INSERT INTO overflow values(null, '1221344345545665', '1122334455667788', '2020-03-12', 9.99);
INSERT INTO overflow values(null, '0192837465657489', '3947561056372946', '2019-10-21', 12.09);
INSERT INTO overflow values(null, '0293650142399990', '6543210987654321', '2021-10-01', -74.89);
INSERT INTO overflow values(null, '1122334455667788', '9102910291029102', '2021-10-20', 639.75);
INSERT INTO overflow values(null, '9102910291029102', '0192837465657489', '2019-12-04', -300.00);
INSERT INTO overflow values(null, '1234567890123456', '0192837465657489', '2022-05-04', 999.99);
INSERT INTO overflow values(null, '2635000016253729', '3947561056372946', '2021-06-06', -1000.00);
INSERT INTO overflow values(null, '2635000016253729', '9102910291029102', '2019-12-04', 123.12);
INSERT INTO overflow values(null, '1957463518203058', '1234567890123456', '2019-11-07', -658.98);
INSERT INTO overflow values(null, '0293650142399990', '2635000016253729', '2022-09-22', 297.00);
INSERT INTO overflow values(null, '6543210987654321', '1221344345545665', '2019-01-24', 56.23);
INSERT INTO overflow values(null, '1221344345545665', '1122334455667788', '2022-11-11', -98.89);
INSERT INTO overflow values(null, '3947561056372946', '6543210987654321', '2019-10-23', 654.00);
INSERT INTO overflow values(null, '1221344345545665', '9102910291029102', '2019-01-03', 1.00);
INSERT INTO overflow values(null, '0192837465657489', '6543210987654321', '2022-11-11', 0.00);
INSERT INTO overflow values(null, '1234567890123456', '2635000016253729', '2022-08-05', 23.65);
INSERT INTO overflow values(null, '3947561056372946', '2635000016253729', '2019-08-13', -75.23);
INSERT INTO overflow values(null, '3947561056372946', '1957463518203058', '2022-04-14', 123.98);
INSERT INTO overflow values(null, '1957463518203058', '1221344345545665', '2019-10-23', -76.35);
INSERT INTO overflow values(null, '1122334455667788', '9102910291029102', '2020-07-27', 674.15);
INSERT INTO overflow values(null, '0192837465657489', '1234567890123456', '2022-03-20', -889.54);
INSERT INTO overflow values(null, '0293650142399990', '9102910291029102', '2019-05-19', 879.00);
INSERT INTO overflow values(null, '6543210987654321', '1122334455667788', '2021-06-20', -536.00);
INSERT INTO overflow values(null, '6543210987654321', '1957463518203058', '2019-09-21', 100.00);
INSERT INTO overflow values(null, '1234567890123456', '6543210987654321', '2022-07-21', 23.00);
INSERT INTO overflow values(null, '6543210987654321', '1957463518203058', '2019-02-04', 673.86);
INSERT INTO overflow values(null, '1957463518203058', '6543210987654321', '2020-02-23', 12.76);
INSERT INTO overflow values(null, '1957463518203058', '3947561056372946', '2021-06-08', -768.46);
INSERT INTO overflow values(null, '1221344345545665', '2635000016253729', '2020-04-07', -746.11);
INSERT INTO overflow values(null, '1221344345545665', '3947561056372946', '2019-03-27', 10.00);
INSERT INTO overflow values(null, '2635000016253729', '0192837465657489', '2021-03-24', 0.00);
INSERT INTO overflow values(null, '3947561056372946', '2635000016253729', '2019-03-27', 97.64);
INSERT INTO overflow values(null, '0293650142399990', '0192837465657489', '2020-12-01', -64.12);
INSERT INTO overflow values(null, '1122334455667788', '0192837465657489', '2019-02-04', 96.46);
INSERT INTO overflow values(null, '0192837465657489', '0293650142399990', '2022-06-20', 12.09);
INSERT INTO overflow values(null, '9102910291029102', '1957463518203058', '2019-06-20', 87.45);
INSERT INTO overflow values(null, '1122334455667788', '1957463518203058', '2020-11-18', 34.87);
INSERT INTO overflow values(null, '1234567890123456', '1221344345545665', '2019-01-14', -129.34);
INSERT INTO overflow values(null, '1234567890123456', '0293650142399990', '2022-12-15', 90.00);
INSERT INTO overflow values(null, '6543210987654321', '0293650142399990', '2022-12-10', -100.00);
INSERT INTO overflow values(null, '2635000016253729', '3947561056372946', '2020-04-11', 12.12);
INSERT INTO overflow values(null, '2635000016253729', '1221344345545665', '2019-05-22', 76.92);
INSERT INTO overflow values(null, '0293650142399990', '1221344345545665', '2022-07-23', -75.53);
INSERT INTO overflow values(null, '1122334455667788', '1234567890123456', '2019-05-22', 869.09);
INSERT INTO overflow values(null, '3947561056372946', '1122334455667788', '2019-01-19', -67.34);
INSERT INTO overflow values(null, '9102910291029102', '0293650142399990', '2022-12-10', 93.76);
INSERT INTO overflow values(null, '0192837465657489', '0293650142399990', '2019-05-22', -64.12);
INSERT INTO overflow values(null, '9102910291029102', '1234567890123456', '2022-06-26', 86.43);
INSERT INTO overflow values(null, '9102910291029102', '1122334455667788', '2022-12-09', -34.65);
INSERT INTO overflow values(null, '1957463518203058', '1234567890123456', '2019-03-02', -98.65);
INSERT INTO overflow values(null, '1221344345545665', '1122334455667788', '2021-04-30', 756.54);
INSERT INTO overflow values(null, '0192837465657489', '3947561056372946', '2019-01-26', 1000.00);
INSERT INTO overflow values(null, '0293650142399990', '6543210987654321', '2022-12-07', -197.43);
INSERT INTO overflow values(null, '1122334455667788', '9102910291029102', '2020-04-06', -769.09);
INSERT INTO overflow values(null, '9102910291029102', '0192837465657489', '2022-10-19', 67.09);
INSERT INTO overflow values(null, '1234567890123456', '0192837465657489', '2020-10-20', 648.08);
INSERT INTO overflow values(null, '2635000016253729', '3947561056372946', '2021-08-15', -756.22);
INSERT INTO overflow values(null, '2635000016253729', '9102910291029102', '2020-10-20', -9.09);
INSERT INTO overflow values(null, '1957463518203058', '1234567890123456', '2021-12-20', 29.76);
INSERT INTO overflow values(null, '0293650142399990', '2635000016253729', '2020-10-20', 76.98);
INSERT INTO overflow values(null, '6543210987654321', '1221344345545665', '2020-04-13', 34.64);
INSERT INTO overflow values(null, '1221344345545665', '1122334455667788', '2019-04-05', -867.98);
INSERT INTO overflow values(null, '3947561056372946', '6543210987654321', '2022-12-27', -645.53);
INSERT INTO overflow values(null, '1221344345545665', '9102910291029102', '2019-09-09', 657.66);
INSERT INTO overflow values(null, '0192837465657489', '6543210987654321', '2020-12-27', -657.23);
INSERT INTO overflow values(null, '1234567890123456', '2635000016253729', '2020-03-03', 925.98);
INSERT INTO overflow values(null, '3947561056372946', '2635000016253729', '2021-04-16', -746.97);
INSERT INTO overflow values(null, '3947561056372946', '1957463518203058', '2020-03-11', 746.98);
INSERT INTO overflow values(null, '1957463518203058', '1221344345545665', '2021-05-25', -725.12);
INSERT INTO overflow values(null, '1122334455667788', '9102910291029102', '2019-09-09', 853.98);
INSERT INTO overflow values(null, '0192837465657489', '1234567890123456', '2021-02-20', -642.87);
INSERT INTO overflow values(null, '0293650142399990', '9102910291029102', '2021-11-14', 305.64);
INSERT INTO overflow values(null, '6543210987654321', '1122334455667788', '2022-12-13', -538.57);
INSERT INTO overflow values(null, '6543210987654321', '1957463518203058', '2022-10-16', 476.67);

CREATE TABLE company
(
    company_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    company_city VARCHAR(100) NOT NULL,
    company_street VARCHAR(255) NOT NULL,
    company_nr VARCHAR(5) NOT NULL,
    company_post_code VARCHAR(6) NOT NULL CHECK(char_length(company_post_code)=6)
);

INSERT INTO company values(null, 'Rzeszów', 'Dąbrowskiego', '21', '35-018');
INSERT INTO company values(null, 'Warszawa', 'Polna', '2', '43-023');
INSERT INTO company values(null, 'Radom', 'Miastowa', '21/1', '57-925');
INSERT INTO company values(null, 'Gdańsk', 'Nieznana', '21B', '77-925');
INSERT INTO company values(null, 'Rzeszów', 'Wykwintna', '867', '21-582');
INSERT INTO company values(null, 'Wrocław', 'Wiedźminowa', '45', '45-278');
INSERT INTO company values(null, 'Wrocław', 'Beskidzka', '12', '32-364');
INSERT INTO company values(null, 'Kraków', 'Niebiańska', '76', '86-875');
INSERT INTO company values(null, 'Berlin', 'Nazwana', '13', '23-153');

CREATE TABLE positions
(
    position_name VARCHAR(100) UNIQUE PRIMARY KEY NOT NULL,
    position_salary FLOAT NOT NULL CHECK(position_salary >= 2200.0)
);

INSERT INTO positions values('pracownik', 2200.0);
INSERT INTO positions values('kierownik', 5600.0);
INSERT INTO positions values('menager', 3200.0);
INSERT INTO positions values('CEO', 12200.0);
INSERT INTO positions values('sprzedawca', 2500.0);
INSERT INTO positions values('księgowy', 4100.0);
INSERT INTO positions values('ochroniarz', 3800.0);

CREATE TABLE employee
(
    employee_pesel VARCHAR(11) UNIQUE PRIMARY KEY NOT NULL CHECK(char_length(employee_pesel)=11),
    employee_fname VARCHAR(100) NOT NULL,
    employee_lname VARCHAR(100) NOT NULL,
    employee_position VARCHAR(100) NOT NULL,
    employee_company INT NOT NULL,

    FOREIGN KEY (employee_position) REFERENCES positions(position_name),
    FOREIGN KEY (employee_company) REFERENCES company(company_id)
);

INSERT INTO employee values('61939237410', 'Rafał', 'Zaoczny', 'CEO', 4);
INSERT INTO employee values('23784671911', 'Tomasz', 'Kowalski', 'pracownik', 9);
INSERT INTO employee values('74382941824', 'Oskar', 'Nieznany', 'pracownik', 4);
INSERT INTO employee values('53247182311', 'Magdalena', 'Zaciemna', 'menager', 1);
INSERT INTO employee values('65262457412', 'Monika', 'Naruszona', 'pracownik', 2);
INSERT INTO employee values('51436141414', 'Andrzej', 'Wylewny', 'menager', 3);
INSERT INTO employee values('54316346513', 'Zbigniew', 'Odrobiony', 'pracownik', 4);
INSERT INTO employee values('52167637614', 'Gerwazy', 'Zegarmistrz', 'sprzedawca', 5);
INSERT INTO employee values('64275471243', 'Ala', 'Kowalska', 'sprzedawca', 6);
INSERT INTO employee values('76735133245', 'Ala', 'Nowakowska', 'pracownik', 7);
INSERT INTO employee values('83423432223', 'Tomasz', 'Nieznaczący', 'sprzedawca', 8);
INSERT INTO employee values('24724534145', 'Jakub', 'Koło', 'sprzedawca', 9);
INSERT INTO employee values('65275472524', 'Sebastian', 'Deska', 'sprzedawca', 1);
INSERT INTO employee values('63253413131', 'Paulina', 'Wilczyca', 'sprzedawca', 2);
INSERT INTO employee values('15346346316', 'Ewelina', 'Odlotowa', 'pracownik', 3);
INSERT INTO employee values('72452154353', 'Karol', 'Wykwit', 'sprzedawca', 4);
INSERT INTO employee values('62754123144', 'Amadeusz', 'Ptak', 'menager', 5);
INSERT INTO employee values('16146352244', 'Malina', 'Kwiat', 'sprzedawca', 6);
INSERT INTO employee values('16154353252', 'Stanisław', 'Domeradzki', 'sprzedawca', 7);
INSERT INTO employee values('76736452423', 'Krzysztof', 'Lubiany', 'pracownik', 8);
INSERT INTO employee values('72454424232', 'Wioletta', 'Ostrozna', 'sprzedawca', 9);
INSERT INTO employee values('89244535255', 'Natalia', 'Elitkna', 'menager', 1);
INSERT INTO employee values('98753523525', 'Weronika', 'Antyczna', 'sprzedawca', 2);
INSERT INTO employee values('27257837589', 'Michał', 'Ucziny', 'sprzedawca', 3);
INSERT INTO employee values('79821179085', 'Ewa', 'Uczona', 'sprzedawca', 4);
INSERT INTO employee values('79184658551', 'Aleksandra', 'Królweska', 'sprzedawca', 5);

CREATE TABLE client_company
(
    client_nr VARCHAR(16) NOT NULL,
    company_id INT NOT NULL,
    
    PRIMARY KEY (client_nr, company_id),

    FOREIGN KEY (client_nr) REFERENCES client (client_nr),
    FOREIGN KEY (company_id) REFERENCES company (company_id)
);

INSERT INTO client_company values('123456', 1);
INSERT INTO client_company values('654321', 3);
INSERT INTO client_company values('923860', 6);
INSERT INTO client_company values('015348', 4);
