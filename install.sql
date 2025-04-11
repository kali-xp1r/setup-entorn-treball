-- Crea la base de dades testproject
CREATE DATABASE IF NOT EXISTS testproject;

-- Crea la base de dades testproject2
CREATE DATABASE IF NOT EXISTS testproject2;

-- Crea l'usuari skill17 amb la contrasenya 'cendrassos' i restringeix la connexió a localhost
CREATE USER IF NOT EXISTS 'skill17'@'localhost' IDENTIFIED BY 'cendrassos';

-- Dona tots els permisos a skill17 a la base de dades testproject des de localhost
GRANT ALL PRIVILEGES ON testproject.* TO 'skill17'@'localhost';

-- Dona tots els permisos a skill17 a la base de dades testproject2 des de localhost
GRANT ALL PRIVILEGES ON testproject2.* TO 'skill17'@'localhost';

-- Actualitza els privilegis
FLUSH PRIVILEGES;
