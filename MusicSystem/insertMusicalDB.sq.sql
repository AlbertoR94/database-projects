USE `musical_system`;

INSERT INTO `compact_disks` VALUES('X01','BOY',1980);
INSERT INTO `compact_disks` VALUES('X02','TARZAN',2006);

INSERT INTO `pieces_of_music` VALUES(01,'I will follow');
INSERT INTO `pieces_of_music` VALUES(02,'Twilight');
INSERT INTO `pieces_of_music` VALUES(03,'An cat Bubh');
INSERT INTO `pieces_of_music` VALUES(04,'into the heart');
INSERT INTO `pieces_of_music` VALUES(05,'Out of control');
INSERT INTO `pieces_of_music` VALUES(06,'Youll be in my heart');
INSERT INTO `pieces_of_music` VALUES(07,'Who better than me');

INSERT INTO `persons` VALUES('PER_01','LAWRENCE MULLEN','BRITISH');
INSERT INTO `persons` VALUES('PER_02','DAVID HOWELL','BRITISH');
INSERT INTO `persons` VALUES('PER_03','ADAM CLAYTON','BRITISH');
INSERT INTO `persons` VALUES('PER_04','PAUL DAVIDSON','BRITISH');
INSERT INTO `persons` VALUES('PER_05','PHIL COLLINS','AMERICAN');

INSERT INTO `authorships` VALUES('AUT_01', 'COMPOSER');
INSERT INTO `authorships` VALUES('AUT_02', 'WRITER');
INSERT INTO `authorships` VALUES('AUT_03', 'ARRENGER');

INSERT INTO `instruments` VALUES('INST_01','GUITAR');
INSERT INTO `instruments` VALUES('INST_02','BASS');
INSERT INTO `instruments` VALUES('INST_03','KEYBOARD');

INSERT INTO `recorded_disks` VALUES('X01',01,01);
INSERT INTO `recorded_disks` VALUES('X01',02,02);
INSERT INTO `recorded_disks` VALUES('X01',03,03);
INSERT INTO `recorded_disks` VALUES('X01',04,04);
INSERT INTO `recorded_disks` VALUES('X01',05,05);
INSERT INTO `recorded_disks` VALUES('X02',01,06);
INSERT INTO `recorded_disks` VALUES('X02',02,07);

INSERT INTO `plays` VALUES('PER_02',01,'INST_01');
INSERT INTO `plays` VALUES('PER_02',02,'INST_02');
INSERT INTO `plays` VALUES('PER_03',03,'INST_03');
INSERT INTO `plays` VALUES('PER_04',04,'INST_01');
INSERT INTO `plays` VALUES('PER_05',05,'INST_01');

INSERT INTO `author_of` VALUES (01,'PER_01','AUT_01');
INSERT INTO `author_of` VALUES (02,'PER_01','AUT_01');
INSERT INTO `author_of` VALUES (03,'PER_01','AUT_02');
INSERT INTO `author_of` VALUES (04,'PER_03','AUT_03');
INSERT INTO `author_of` VALUES (05,'PER_02','AUT_02');