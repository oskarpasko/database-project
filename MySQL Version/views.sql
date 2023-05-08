# Kody dodające widoki do bazy danych

# Oskar

# Eliza

# Michał

# Inne

##  card_client view
CREATE VIEW card_client AS
SELECT *
FROM card c
LEFT JOIN client c2 
USING(client_nr)
ORDER BY client_nr 
