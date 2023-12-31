use bookstore;

INSERT INTO publisher (publisher_id, publisher_name, publisher_address, publisher_phone, publisher_url)
VALUES(01, 'Penguin Random House', 'Luchana 23 Madrid Spain',535819,'http://www.penguinrandomhouse.com/');
INSERT INTO publisher (publisher_id, publisher_name, publisher_address, publisher_phone, publisher_url)
VALUES(02, 'Hachette Livre','50 Victoria Embankment',227000, 'https://www.hachette.com');
INSERT INTO publisher (publisher_id, publisher_name, publisher_address, publisher_phone, publisher_url)
VALUES(03, 'HarperCollins','The News Building London Bridge Street',2427737,'https://www.harpercollins.com/');

INSERT INTO author VALUES (01,'Cat Sebastian','9296 Henry St. Auburndale FL 33823');
INSERT INTO author VALUES (02,'Lorraine Heath','974 Broad Dr. Marcus Hook PA 19061');
INSERT INTO author VALUES (03,'Jill Shalvis','187 Cherry Rd. Reston VA 20191');
INSERT INTO author VALUES (04,'Kevin Kwan','13 Locust St. Round Lake IL 60073');
INSERT INTO author VALUES (05,'Elisabeth Noreback','26 Rock Creek Dr. Tuscaloosa AL 35405');
INSERT INTO author VALUES (06,'Pamela Brown', '409 Santa Clara Ave. Cedar Rapids IA 52402');

INSERT INTO book (ISBN, book_title, book_year, book_price, publisher_id, author_id) VALUES ('9706279318','A Gentleman Never Keeps Score',2018,384.00,03,01);
INSERT INTO book (ISBN, book_title, book_year, book_price, publisher_id, author_id) VALUES ('9728304828','Texas Glory',2015,94.50,03,02);
INSERT INTO book (ISBN, book_title, book_year, book_price, publisher_id, author_id) VALUES ('9702833373','Rainy day friends',2017,45.00,03,03);
INSERT INTO book (ISBN, book_title, book_year, book_price, publisher_id, author_id) VALUES ('9703859383','Crazy Rich Asians',2018,234.50,01,04);
INSERT INTO book (ISBN, book_title, book_year, book_price, publisher_id, author_id) VALUES ('9793937483','Tell me you are mine',2015,23.60,01,05);
INSERT INTO book (ISBN, book_title, book_year, book_price, publisher_id, author_id) VALUES ('9729473047','The spy and the traitor', 2010,200.00,01, 05);
INSERT INTO book (ISBN, book_title, book_year, book_price, publisher_id, author_id) VALUES ('9703746264','Paradise Sky by Joe Lansdale',2016,145.00,02,06);
INSERT INTO book (ISBN, book_title, book_year, book_price, publisher_id, author_id) VALUES ('9739482733','Meet Camaro from The Night Charter',2010,165.99,02,06);

INSERT INTO customer VALUES ('emkw@mail.com','Karol Wilson', 115099561, '75 Poplar Court Eugene OR 97402');
INSERT INTO customer VALUES ('rior@mail.com','Richard Orson', 45528305, '33 Richardson Dr. Chandler AZ 85224');
INSERT INTO customer VALUES ('lowi@mail.com','Loraine Williams', 2211600,'8 Market St. Portsmouth VA 23703');
INSERT INTO customer VALUES ('sclu@mail.com','Scott Luka', 649373,'412 Pawnee Lane Kenosha, WI 53140');

INSERT INTO warehouse VALUES (01, 5393544,'530 Roosevelt Lane Hopewell Junction NY 12533');
INSERT INTO warehouse VALUES (02, 9759583,'9592 Applegate Road Bedford OH 44146');
INSERT INTO warehouse VALUES (03, 9958484,'21 Arch Ave. Grand Haven MI 49417');

INSERT INTO shopping_basket VALUES (01,'emkw@mail.com');
INSERT INTO shopping_basket VALUES (02,'rior@mail.com');
INSERT INTO shopping_basket VALUES (03,'lowi@mail.com');
INSERT INTO shopping_basket VALUES (04,'sclu@mail.com');

INSERT INTO shopping_basket_has_book VALUES('9706279318',01,1);
INSERT INTO shopping_basket_has_book VALUES('9703746264',01,1);
INSERT INTO shopping_basket_has_book VALUES('9729473047',01,1);
INSERT INTO shopping_basket_has_book VALUES('9739482733',02,1);
INSERT INTO shopping_basket_has_book VALUES('9728304828',02,1);
INSERT INTO shopping_basket_has_book VALUES('9702833373',02,2);
INSERT INTO shopping_basket_has_book VALUES('9703859383',02,1);
INSERT INTO shopping_basket_has_book VALUES('9793937483',03,1);
INSERT INTO shopping_basket_has_book VALUES('9703859383',03,1);
INSERT INTO shopping_basket_has_book VALUES('9702833373',03,1);
INSERT INTO shopping_basket_has_book VALUES('9739482733',04,1);
INSERT INTO shopping_basket_has_book VALUES('9702833373',04,1);
INSERT INTO shopping_basket_has_book VALUES('9729473047',04,1);
INSERT INTO shopping_basket_has_book VALUES('9793937483',04,1);

INSERT INTO stores (warehouse_id,book_ISBN,count)
VALUES(01,'9728304828',15);
INSERT INTO stores (warehouse_id,book_ISBN,count)
VALUES(01,'9739482733',29);
INSERT INTO stores (warehouse_id,book_ISBN,count)
VALUES(01,'9729473047',151);
INSERT INTO stores (warehouse_id,book_ISBN,count)
VALUES(02,'9703859383',20);
