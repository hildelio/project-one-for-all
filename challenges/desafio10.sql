CREATE TABLE IF NOT EXISTS favorite_songs (
  `users_id` INT NOT NULL,
  `songs_id` INT NOT NULL,
  PRIMARY KEY (`users_id`, `songs_id`),
  INDEX `fk_users_has_songs_songs2_idx` (`songs_id` ASC) VISIBLE,
  INDEX `fk_users_has_songs_users2_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_has_songs_users2`
    FOREIGN KEY (`users_id`)
    REFERENCES users (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_songs_songs2`
    FOREIGN KEY (`songs_id`)
    REFERENCES songs (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
INSERT INTO favorite_songs(`users_id`, `songs_id`)
VALUES
	('1', '3'),
	('1', '6'),
	('1', '10'),
	('2', '4'),
	('3', '1'),
	('3', '3'),
	('4', '7'),
	('4', '4'),
	('5', '10'),
	('5', '2'),
	('8', '4'),
	('9', '7'),
	('10', '3');