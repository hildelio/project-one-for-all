DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone ;

CREATE TABLE IF NOT EXISTS subscription_plan (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    type VARCHAR(45) NOT NULL,
    value DOUBLE NOT NULL
)  ENGINE=INNODB;
INSERT INTO subscription_plan (`type`, `value`)
VALUES
('gratuito', '0'),
('familiar', '7.99'),
('universitário', '5.99'),
('pessoal', '6.99');


CREATE TABLE IF NOT EXISTS users (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL,
  age INT NOT NULL,
  signing_date DATE NOT NULL,
  subscription_plan_id INT NOT NULL,
  INDEX `fk_users_subscription_plan1_idx` (`subscription_plan_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_subscription_plan1`
    FOREIGN KEY (`subscription_plan_id`)
    REFERENCES `subscription_plan` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
INSERT INTO users (`name`, `age`, `signing_date`, `subscription_plan_id`)
VALUES
	('Barbara Liskov', '82', '2019-10-20', '1'),
	('Robert Cecil Martin', '58', '2017-01-06', '1'),
	('Ada Lovelace', '37', '2017-12-30', '2'),
	('Martin Fowler', '46', '2017-01-17', '2'),
	('Sandi Metz', '58', '2018-04-29', '2'),
	('Paulo Freire', '19', '2018-02-14', '3'),
	('Bell Hooks', '26', '2018-01-05', '3'),
	('Christopher Alexander', '85', '2019-06-05', '4'),
	('Judith Butler', '45', '2020-05-13', '4'),
	('Jorge Amado', '58', '2017-02-17', '4');
    
CREATE TABLE IF NOT EXISTS artists (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  name VARCHAR(45) NOT NULL)
ENGINE = InnoDB;
INSERT INTO artists (`name`)
VALUES
	('Beyoncé'),
	('Queen'),
	('Elis Regina'),
	('Baco Exu do Blues'),
	('Blind Guardian'),
	('Nina Simone');

CREATE TABLE IF NOT EXISTS album (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(45) NOT NULL,
	`artists_id` INT NOT NULL,
    INDEX `fk_album_artists1_idx` (`artists_id` ASC) VISIBLE,
    CONSTRAINT `fk_album_artists1`
    FOREIGN KEY (`artists_id`)
    REFERENCES `artists` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION) 
ENGINE=INNODB;
INSERT INTO album (`name`, `artists_id`)
VALUES
	('Renaissance', '1'),
	('Jazz', '2'),
	('Hot Space', '2'),
	('Falso Brilhante', '3'),
	('Vento de Maio', '3'),
	('QVVJFA?', '4'),
	('Somewhere Far Beyond', '5'),
	('I Put A Spell On You', '6');

CREATE TABLE IF NOT EXISTS songs (
  id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  album_id INT NOT NULL,
  track VARCHAR(200) NOT NULL,
  release_year YEAR NOT NULL,
  duration INT NOT NULL,
  INDEX `fk_songs_album1_idx` (`album_id` ASC) VISIBLE,
  CONSTRAINT `fk_songs_album1`
    FOREIGN KEY (`album_id`)
    REFERENCES album (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
INSERT INTO `songs` (`album_id`, `track`, `release_year`, `duration`) VALUES
	('1', '"BREAK MY SOUL"', '2022', '279'),
	('1', '"VIRGO\'S GROOVE"', '2022', '369'),
	('1', '"ALIEN SUPERSTAR"', '2022', '116'),
	('2', '"Don\'t Stop Me Now"', '1978', '203'),
	('3', '"Under Pressure"', '1982', '152'),
	('4', '"Como Nossos Pais"', '1998', '105'),
	('5', '"O Medo de Amar é o Medo de Ser Livre"', '2001', '207'),
	('6', '"Samba em Paris"', '2003', '267'),
	('7', '"The Bard\'s Song"', '2007', '244'),
	('8', '"Feeling Good"', '2012', '100');

CREATE TABLE IF NOT EXISTS following (
  artists_id INT NOT NULL,
  users_id INT NOT NULL,
  PRIMARY KEY (`artists_id`, `users_id`),
  INDEX `fk_artists_has_users_users1_idx` (`users_id` ASC) VISIBLE,
  INDEX `fk_artists_has_users_artists1_idx` (`artists_id` ASC) VISIBLE,
  CONSTRAINT `fk_artists_has_users_artists1`
    FOREIGN KEY (`artists_id`)
    REFERENCES artists (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_artists_has_users_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES users (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
INSERT INTO following (`users_id`, `artists_id`)
VALUES
  ('1','1'),
  ('1','2'),
  ('1','3'),
  ('2','1'),
  ('2','3'),
  ('3','2'),
  ('4','4'),
  ('5','5'),
  ('5','6'),
  ('6','6'),
  ('6','1'),
  ('7','6'),
  ('9','3'),
  ('10','2');

CREATE TABLE IF NOT EXISTS play_history (
  users_id INT NOT NULL,
  songs_id INT NOT NULL,
  date DATETIME NOT NULL,
  PRIMARY KEY (`users_id`, `songs_id`),
  INDEX `fk_users_has_songs_songs1_idx` (`songs_id` ASC) VISIBLE,
  INDEX `fk_users_has_songs_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_has_songs_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES users (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_songs_songs1`
    FOREIGN KEY (`songs_id`)
    REFERENCES songs (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
INSERT INTO play_history (`users_id`, `songs_id`, `date`)
VALUES
  ('1','8','2022-02-28 10:45:55'),
  ('1','2','2022-02-28 05:30:35'),
  ('1','3','2020-03-06 11:22:33'),
  ('2','10','2022-08-05 08:05:17'),
  ('2','7','2020-01-02 07:40:33'),
  ('3','10','2020-11-13 16:55:13'),
  ('3','2','2020-12-05 18:38:30'),
  ('4','8','2021-08-15 17:10:10'),
  ('5','8','2022-01-09 01:44:33'),
  ('5','5','2020-08-06 15:23:43'),
  ('6','7','2017-01-24 00:31:17'),
  ('6','1','2017-10-12 12:35:20'),
  ('7','4','2011-12-15 22:30:49'),
  ('8','4','2012-03-17 14:56:41'),
  ('9','9','2022-02-24 21:14:22'),
  ('10','3','2015-12-13 08:30:22');

