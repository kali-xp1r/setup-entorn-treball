CREATE DATABASE IF NOT EXISTS testproject;
CREATE DATABASE IF NOT EXISTS testproject2;
CREATE USER IF NOT EXISTS 'user'@'localhost' IDENTIFIED BY 'skill17';

GRANT ALL PRIVILEGES ON testproject.* TO 'user'@'localhost';
GRANT ALL PRIVILEGES ON testproject2.* TO 'user'@'localhost';
FLUSH PRIVILEGES;
