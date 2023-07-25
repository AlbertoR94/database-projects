DROP SCHEMA IF EXISTS `bookstore`;

CREATE SCHEMA IF NOT EXISTS `bookstore`;

DROP TABLE IF EXISTS `bookstore`.`customer`;
CREATE TABLE IF NOT EXISTS `bookstore`.`customer` (
  `customer_email` VARCHAR(45) NOT NULL,
  `customer_name` VARCHAR(45) NULL,
  `customer_phone` INT NULL,
  `customer_address` VARCHAR(45) NULL,
  PRIMARY KEY (`customer_email`))
ENGINE = InnoDB;

DROP TABLE IF EXISTS `bookstore`.`shopping_basket`;
CREATE TABLE IF NOT EXISTS `bookstore`.`shopping_basket` (
  `basket_id` INT NOT NULL,
  `customer_email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`basket_id`, `customer_email`),
  INDEX `fk_shopping_basket_customer1_idx` (`customer_email` ASC) VISIBLE,
  CONSTRAINT `fk_shopping_basket_customer1`
    FOREIGN KEY (`customer_email`)
    REFERENCES `bookstore`.`customer` (`customer_email`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `bookstore`.`publisher`;
CREATE TABLE IF NOT EXISTS `bookstore`.`publisher` (
  `publisher_id` INT NOT NULL,
  `publisher_name` VARCHAR(45) NULL,
  `publisher_address` VARCHAR(45) NULL,
  `publisher_phone` INT NULL,
  `publisher_url` VARCHAR(45) NULL,
  PRIMARY KEY (`publisher_id`))
ENGINE = InnoDB;

DROP TABLE IF EXISTS `bookstore`.`author`;
CREATE TABLE IF NOT EXISTS `bookstore`.`author` (
  `author_id` INT NOT NULL,
  `author_name` VARCHAR(45) NULL,
  `author_address` VARCHAR(45) NULL,
  PRIMARY KEY (`author_id`))
ENGINE = InnoDB;

DROP TABLE IF EXISTS `bookstore`.`book`;
CREATE TABLE IF NOT EXISTS `bookstore`.`book` (
  `ISBN` VARCHAR(20) NOT NULL,
  `book_title` VARCHAR(45) NULL,
  `book_year` YEAR(4) NULL,
  `book_price` FLOAT NULL,
  `publisher_id` INT NOT NULL,
  `author_id` INT NOT NULL,
  PRIMARY KEY (`ISBN`, `publisher_id`, `author_id`),
  INDEX `fk_book_publisher1_idx` (`publisher_id` ASC) VISIBLE,
  INDEX `fk_book_author1_idx` (`author_id` ASC) VISIBLE,
  CONSTRAINT `fk_book_publisher1`
    FOREIGN KEY (`publisher_id`)
    REFERENCES `bookstore`.`publisher` (`publisher_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_book_author1`
    FOREIGN KEY (`author_id`)
    REFERENCES `bookstore`.`author` (`author_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `bookstore`.`warehouse`;
CREATE TABLE IF NOT EXISTS `bookstore`.`warehouse` (
  `warehouse_id` INT NOT NULL,
  `warehouse_phone` INT NULL,
  `warehouse_address` VARCHAR(45) NULL,
  PRIMARY KEY (`warehouse_id`))
ENGINE = InnoDB;

DROP TABLE IF EXISTS `bookstore`.`stores`;
CREATE TABLE IF NOT EXISTS `bookstore`.`stores` (
  `warehouse_id` INT NOT NULL,
  `book_ISBN` VARCHAR(20) NOT NULL,
  `count` INT NULL,
  PRIMARY KEY (`warehouse_id`, `book_ISBN`),
  INDEX `fk_warehouse_has_book_book1_idx` (`book_ISBN` ASC) VISIBLE,
  INDEX `fk_warehouse_has_book_warehouse_idx` (`warehouse_id` ASC) VISIBLE,
  CONSTRAINT `fk_warehouse_has_book_warehouse`
    FOREIGN KEY (`warehouse_id`)
    REFERENCES `bookstore`.`warehouse` (`warehouse_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_warehouse_has_book_book1`
    FOREIGN KEY (`book_ISBN`)
    REFERENCES `bookstore`.`book` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `bookstore`.`shopping_basket_has_book`;
CREATE TABLE IF NOT EXISTS `bookstore`.`shopping_basket_has_book` (
  `book_ISBN` VARCHAR(20) NOT NULL,
  `basket_id` INT NOT NULL,
  `count` INT NULL,
  PRIMARY KEY (`book_ISBN`, `basket_id`),
  INDEX `fk_shopping_basket_has_book_book1_idx` (`book_ISBN` ASC) VISIBLE,
  INDEX `fk_shopping_basket_has_book_shopping_basket1_idx` (`basket_id` ASC) VISIBLE,
  CONSTRAINT `fk_shopping_basket_has_book_shopping_basket1`
    FOREIGN KEY (`basket_id`)
    REFERENCES `bookstore`.`shopping_basket` (`basket_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_shopping_basket_has_book_book1`
    FOREIGN KEY (`book_ISBN`)
    REFERENCES `bookstore`.`book` (`ISBN`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;



