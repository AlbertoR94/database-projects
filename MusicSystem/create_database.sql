DROP SCHEMA IF EXISTS `musical_system`;

CREATE SCHEMA IF NOT EXISTS `musical_system`;

DROP TABLE IF EXISTS `musical_system`.`compact_disks`;
CREATE TABLE IF NOT EXISTS `musical_system`.`compact_disks` (
  `disk_id` CHAR(3) NOT NULL,
  `title` VARCHAR(45) NULL,
  `year` YEAR(4) NULL,
  PRIMARY KEY (`disk_id`))
ENGINE = InnoDB;

DROP TABLE IF EXISTS `musical_system`.`pieces_of_music`;
CREATE TABLE IF NOT EXISTS `musical_system`.`pieces_of_music` (
  `track_id` INT NOT NULL,
  `title` VARCHAR(45) NULL,
  PRIMARY KEY (`track_id`))
ENGINE = InnoDB;

DROP TABLE IF EXISTS `musical_system`.`recorded_disks`;
CREATE TABLE IF NOT EXISTS `musical_system`.`recorded_disks` (
  `disk_id` CHAR(3) NOT NULL,
  `no_track` SMALLINT(6) NULL,
  `track_id` INT NOT NULL,
  PRIMARY KEY (`disk_id`, `track_id`),
  INDEX `fk_compact_disks_has_pieces_of_music_pieces_of_music1_idx` (`track_id` ASC) VISIBLE,
  INDEX `fk_compact_disks_has_pieces_of_music_compact_disks_idx` (`disk_id` ASC) VISIBLE,
  CONSTRAINT `fk_compact_disks_has_pieces_of_music_compact_disks`
    FOREIGN KEY (`disk_id`)
    REFERENCES `musical_system`.`compact_disks` (`disk_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_compact_disks_has_pieces_of_music_pieces_of_music1`
    FOREIGN KEY (`track_id`)
    REFERENCES `musical_system`.`pieces_of_music` (`track_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `musical_system`.`persons`;
CREATE TABLE IF NOT EXISTS `musical_system`.`persons` (
  `person_id` CHAR(6) NOT NULL,
  `name` VARCHAR(30) NULL,
  `nationality` VARCHAR(10) NULL,
  PRIMARY KEY (`person_id`))
ENGINE = InnoDB;

DROP TABLE IF EXISTS `musical_system`.`authorships`;
CREATE TABLE IF NOT EXISTS `musical_system`.`authorships` (
  `authorship_id` CHAR(6) NOT NULL,
  `type` VARCHAR(10) NULL,
  PRIMARY KEY (`authorship_id`))
ENGINE = InnoDB;

DROP TABLE IF EXISTS `musical_system`.`author_of`;
CREATE TABLE IF NOT EXISTS `musical_system`.`author_of` (
  `track_id` INT NOT NULL,
  `person_id` CHAR(6) NOT NULL,
  `authorship_id` CHAR(6) NOT NULL,
  PRIMARY KEY (`track_id`, `person_id`, `authorship_id`),
  INDEX `fk_pieces_of_music_has_authorships_authorships1_idx` (`authorship_id` ASC) VISIBLE,
  INDEX `fk_pieces_of_music_has_authorships_pieces_of_music1_idx` (`track_id` ASC) VISIBLE,
  INDEX `fk_pieces_of_music_has_authorships_persons1_idx` (`person_id` ASC) VISIBLE,
  CONSTRAINT `fk_pieces_of_music_has_authorships_pieces_of_music1`
    FOREIGN KEY (`track_id`)
    REFERENCES `musical_system`.`pieces_of_music` (`track_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pieces_of_music_has_authorships_authorships1`
    FOREIGN KEY (`authorship_id`)
    REFERENCES `musical_system`.`authorships` (`authorship_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pieces_of_music_has_authorships_persons1`
    FOREIGN KEY (`person_id`)
    REFERENCES `musical_system`.`persons` (`person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `musical_system`.`instruments`;
CREATE TABLE IF NOT EXISTS `musical_system`.`instruments` (
  `instrument_id` CHAR(7) NOT NULL,
  `name` VARCHAR(10) NULL,
  PRIMARY KEY (`instrument_id`))
ENGINE = InnoDB;

DROP TABLE IF EXISTS `musical_system`.`plays`;
CREATE TABLE IF NOT EXISTS `musical_system`.`plays` (
  `person_id` CHAR(6) NOT NULL,
  `track_id` INT NOT NULL,
  `instrument_id` CHAR(7) NOT NULL,
  PRIMARY KEY (`person_id`, `track_id`, `instrument_id`),
  INDEX `fk_pieces_of_music_has_persons_persons1_idx` (`person_id` ASC) VISIBLE,
  INDEX `fk_pieces_of_music_has_persons_pieces_of_music1_idx` (`track_id` ASC) VISIBLE,
  INDEX `fk_pieces_of_music_has_persons_instruments1_idx` (`instrument_id` ASC) VISIBLE,
  CONSTRAINT `fk_pieces_of_music_has_persons_pieces_of_music1`
    FOREIGN KEY (`track_id`)
    REFERENCES `musical_system`.`pieces_of_music` (`track_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pieces_of_music_has_persons_persons1`
    FOREIGN KEY (`person_id`)
    REFERENCES `musical_system`.`persons` (`person_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pieces_of_music_has_persons_instruments1`
    FOREIGN KEY (`instrument_id`)
    REFERENCES `musical_system`.`instruments` (`instrument_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
