--STORE

INSERT INTO arcade.Store([store_id],[store_location]) VALUES(01000,'Ap #772-6372 Blandit Rd.');
INSERT INTO arcade.Store([store_id],[store_location]) VALUES(01001,'Ap #633-2998 Vitae Street');
INSERT INTO arcade.Store([store_id],[store_location]) VALUES(01002,'P.O. Box 296, 7332 Amet, Street');
INSERT INTO arcade.Store([store_id],[store_location]) VALUES(01003,'P.O. Box 360, 1094 Mauris Ave');
--INSERT INTO Store([store_id],[store_location]) VALUES(01004,'3599 Tellus Street');
--INSERT INTO Store([store_id],[store_location]) VALUES(01005,'Ap #859-1115 Sem Av.');


--Deleted References
INSERT INTO arcade.Employee([emp_no],[emp_name],[emp_address],[email],[salary],[phone_no],[NIF],[schedule],[store]) VALUES(12999,'DELETED EMPLOYEE',null,null,null,null,'000000000',' 08999','01999');
INSERT INTO arcade.Schedule([schedule_code],[start_time],[end_time]) VALUES(08999,null,null);
INSERT INTO arcade.Store([store_id],[store_location]) VALUES(01999,"DELETED STORE");
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06999,'DELETED CLIENT',0,0);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(000000000,null ,'000000000',04999,01999);
INSERT INTO arcade.Supplier ([NIF],[email],[phone_no],[sup_address],[sup_name]) VALUES ('000000000',null,'000000000',null,null);
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04999,null,'03999','0','0','1'); -- 1 player due to CHECK constraints
INSERT INTO arcade.Publisher([pub_id],[pub_name],[pub_location],[is_indie]) VALUES(03999,'DELETED PUBLISHER',null,null);
INSERT INTO arcade.Cli
--GAME

INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04000,'Donkey Kong','03005','1','1','1');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04001,'Mortal Kombat ','03020','2','1','1');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04002,'Mortal Kombat II','03020','3','2','1');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04003,'Space Invaders','03006','0','2','2');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04004,'Asteroids','03006','4','3','1');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04005,'Pong','03007','5','3','3');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04006,'Street Fighter 2','03007','6','1','1');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04007,'Tetris','03007','7','1','2');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04008,'Galaga','03007','10','2','1');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04009,'Astro','03008','1','2','1');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04010,'Guitar Hero Arcade','03008','2','3','1');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04011,'Mario Bros.','03008','3','3','2');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04012,'Joust','03009','4','1','1');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04013,'Fix-It Ralph','03009','1','1','3');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04014,'Tron','03010','1','2','1');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04015,'Punch-Out!','03010','0','2','2');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04016,'WarioWare','03011','2','3','1');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04017,'Q*Bert','03012','1','3','1');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04018,'Broforce','03013','2','1','1');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04019,'Duck Hunt','03014','3','1','2');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04020,'SEGA Racing','03015','0','2','1');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04021,'OutRun','03016','4','2','3');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04022,'Moon Patrol','03017','5','3','1');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04023,'Gauntlet Legends','03018','6','3','2');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04024,'Golden Axe','03019','7','1','1');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04025,'Bad Dudes vs Dragon Ninja','03001','10','1','1');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04026,'Dance Dance Revolution','03001','1','2','1');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04027,'Friday Night Funkin','03001','2','2','2');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04028,'Space Duel','03002','3','3','1');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04029,'Super Smash Bros Melee','03002','4','3','3');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04030,'Fix-It Felix Jr','03002','1','1','1');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04031,'Stellaris','03002','1','1','2');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04032,'PaperBoy','03003','0','2','1');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04033,'Waterboy and Firegirl','03003','2','2','1');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04034,'Streets of Rage 2','03003','1','3','1');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04035,'ToeJam & Earl','03004','2','3','2');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04036,'Puyo Puyo','03004','3','1','1');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04037,'モンスターハンター','03004','0','1','3');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04038,'ジョジョの奇妙な冒険','03004','0','1','2');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04039,'Mario Kart Arcade','03005','0','1','2');
INSERT INTO arcade.Game([game_id],[game_name],[publisher_id],[point_value],[credit_cost],[no_players]) VALUES(04040,'The Elder Scrolls V: Skyrim Arcade Ver.','03005','0','1','2');

--Prizes0

INSERT INTO  arcade.Prize([pri_id],[pri_name],[pri_price],[no_available],[store_id]) VALUES(07000,'Branded Snack','15','53','01001');
INSERT INTO  arcade.Prize([pri_id],[pri_name],[pri_price],[no_available],[store_id]) VALUES(07001,'Funko Pop','25','22','01003');
INSERT INTO  arcade.Prize([pri_id],[pri_name],[pri_price],[no_available],[store_id]) VALUES(07002,'Nintendo Plushie','50','20','01002');
INSERT INTO  arcade.Prize([pri_id],[pri_name],[pri_price],[no_available],[store_id]) VALUES(07003,'Lifesize Snorlax Plushie','100','3','01004');
INSERT INTO  arcade.Prize([pri_id],[pri_name],[pri_price],[no_available],[store_id]) VALUES(07004,'Random Pocky Box','15','30','01003');
INSERT INTO  arcade.Prize([pri_id],[pri_name],[pri_price],[no_available],[store_id]) VALUES(07005,'Round Pins','15','50','01002');
INSERT INTO  arcade.Prize([pri_id],[pri_name],[pri_price],[no_available],[store_id]) VALUES(07006,'Pikachu Hat','25','10','01000');
INSERT INTO  arcade.Prize([pri_id],[pri_name],[pri_price],[no_available],[store_id]) VALUES(07007,'Anime figurine','50','15','01001');
INSERT INTO  arcade.Prize([pri_id],[pri_name],[pri_price],[no_available],[store_id]) VALUES(07008,'Bargain Bin Videogame','100','10','01001');
INSERT INTO  arcade.Prize([pri_id],[pri_name],[pri_price],[no_available],[store_id]) VALUES(07009,'Funky Keyring','15','30','01002');
INSERT INTO  arcade.Prize([pri_id],[pri_name],[pri_price],[no_available],[store_id]) VALUES(07010,'Colorful Phone Charm','15','32','01004');

--Employees

INSERT INTO  arcade.Employee([emp_no],[emp_name],[emp_address],[email],[salary],[phone_no],[NIF],[schedule],[store]) VALUES(12000,'Constance Rios','733 Non, Street','a@lacuspedesagittis.net',852,'(+351) 933293077','102137183',' 08001','01001');
INSERT INTO  arcade.Employee([emp_no],[emp_name],[emp_address],[email],[salary],[phone_no],[NIF],[schedule],[store]) VALUES(12001,'Yardley Lowe','P.O. Box 350, 7819 Pede Road','sollicitudin.commodo.ipsum@sedturpisnec.org',1256,'(+351) 941979762','273679664',' 08001','01002');
INSERT INTO  arcade.Employee([emp_no],[emp_name],[emp_address],[email],[salary],[phone_no],[NIF],[schedule],[store]) VALUES(12002,'Jolene Mcdowell','4031 Magna St.','Cras.lorem.lorem@viverra.co.uk',1376,'(+351) 935020574','092082933',' 08002','01003');
INSERT INTO  arcade.Employee([emp_no],[emp_name],[emp_address],[email],[salary],[phone_no],[NIF],[schedule],[store]) VALUES(12003,'Eric Chang','929-3629 Pede, Street','amet@laciniaat.ca',989,'(+351) 901099988','150955761',' 08002','01003');
INSERT INTO  arcade.Employee([emp_no],[emp_name],[emp_address],[email],[salary],[phone_no],[NIF],[schedule],[store]) VALUES(12004,'Octavia Warner','P.O. Box 918, 3955 Eget St.','luctus.vulputate.nisi@convallisconvallisdolor.com',1233,'(+351) 976324186','707161515',' 08003','01002');
INSERT INTO  arcade.Employee([emp_no],[emp_name],[emp_address],[email],[salary],[phone_no],[NIF],[schedule],[store]) VALUES(12005,'Orson C. Cross','Ap #795-1440 Nunc Rd.','magna.a@aliquet.edu',1309,'(+351) 976537034','020068229',' 08003','01002');
INSERT INTO  arcade.Employee([emp_no],[emp_name],[emp_address],[email],[salary],[phone_no],[NIF],[schedule],[store]) VALUES(12006,'Maisie T. Blevins','P.O. Box 174, 1371 Risus, Rd.','amet.consectetuer.adipiscing@metus.com',920,'(+351) 930827635','485396276',' 08004','01001');
INSERT INTO  arcade.Employee([emp_no],[emp_name],[emp_address],[email],[salary],[phone_no],[NIF],[schedule],[store]) VALUES(12007,'Alika N. Baldwin','Ap #270-3314 Iaculis, Rd.','libero@egestasadui.org',907,'(+351) 934558784','788963219',' 08004','01001');
INSERT INTO  arcade.Employee([emp_no],[emp_name],[emp_address],[email],[salary],[phone_no],[NIF],[schedule],[store]) VALUES(12008,'Sylvia F. Ortiz','2839 Mauris St.','sem@vitae.ca',1458,'(+351) 920598080','969621015',' 08005','01000');
INSERT INTO  arcade.Employee([emp_no],[emp_name],[emp_address],[email],[salary],[phone_no],[NIF],[schedule],[store]) VALUES(12009,'Kay N. Burris','595-829 Torquent Street','velit.Sed.malesuada@nequetellus.co.uk',859,'(+351) 914370147','115576100',' 08005','01000');
INSERT INTO  arcade.Employee([emp_no],[emp_name],[emp_address],[email],[salary],[phone_no],[NIF],[schedule],[store]) VALUES(12010,'Shafira D. Roberts','Ap #394-4826 Arcu St.','a.auctor.non@risus.co.uk',1413,'(+351) 944543604','782981013',' 08006','01000');
INSERT INTO  arcade.Employee([emp_no],[emp_name],[emp_address],[email],[salary],[phone_no],[NIF],[schedule],[store]) VALUES(12011,'Acton I. Macdonald','Ap #120-9361 Phasellus Avenue','augue.porttitor.interdum@elitpellentesque.edu',1229,'(+351) 993610796','485368428',' 08006','01003');
INSERT INTO  arcade.Employee([emp_no],[emp_name],[emp_address],[email],[salary],[phone_no],[NIF],[schedule],[store]) VALUES(12012,'Beck Boone','594-4120 Elit. Road','vulputate.posuere.vulputate@vulputatevelit.ca',1369,'(+351) 975327458','881451846',' 08007','01002');
INSERT INTO  arcade.Employee([emp_no],[emp_name],[emp_address],[email],[salary],[phone_no],[NIF],[schedule],[store]) VALUES(12013,'Alan O. Alston','P.O. Box 775, 5699 Eget Street','Quisque.varius@interdumfeugiatSed.net',1257,'(+351) 977636129','207101169',' 08007','01003');
INSERT INTO  arcade.Employee([emp_no],[emp_name],[emp_address],[email],[salary],[phone_no],[NIF],[schedule],[store]) VALUES(12014,'Rama Weaver','565-7138 Malesuada Street','lectus@torquentperconubia.org',1265,'(+351) 987687711','148536013',' 08001','01003');
INSERT INTO  arcade.Employee([emp_no],[emp_name],[emp_address],[email],[salary],[phone_no],[NIF],[schedule],[store]) VALUES(12015,'Lee U. Melendez','P.O. Box 895, 2086 Magna. Rd.','sit.amet.ante@Pellentesque.ca',1452,'(+351) 959231038','026625226',' 08001','01002');
INSERT INTO  arcade.Employee([emp_no],[emp_name],[emp_address],[email],[salary],[phone_no],[NIF],[schedule],[store]) VALUES(12016,'Autumn Y. Meyer','Ap #303-7153 Luctus Street','malesuada@Crassed.net',1231,'(+351) 949733160','264064926',' 08001','01001');
INSERT INTO  arcade.Employee([emp_no],[emp_name],[emp_address],[email],[salary],[phone_no],[NIF],[schedule],[store]) VALUES(12017,'Roary V. Santana','1805 Dis St.','risus@egestasblanditNam.co.uk',902,'(+351) 976572163','746123218',' 08002','01001');
INSERT INTO  arcade.Employee([emp_no],[emp_name],[emp_address],[email],[salary],[phone_no],[NIF],[schedule],[store]) VALUES(12018,'Colt Cruz','881-5605 Vivamus Street','Phasellus.dolor.elit@nullaInteger.edu',1093,'(+351) 934688478','700622671',' 08002','01002');
INSERT INTO  arcade.Employee([emp_no],[emp_name],[emp_address],[email],[salary],[phone_no],[NIF],[schedule],[store]) VALUES(12019,'Quinn S. Calderon','P.O. Box 183, 9993 Placerat. Avenue','tempor@malesuadaiderat.edu',1367,'(+351) 922921661','364681056',' 08003','01002');
INSERT INTO  arcade.Employee([emp_no],[emp_name],[emp_address],[email],[salary],[phone_no],[NIF],[schedule],[store]) VALUES(12020,'Madaline Valencia','Ap #193-8022 Odio Road','pede.Praesent@Cras.edu',977,'(+351) 937053317','143495753',' 08006','01003');
INSERT INTO  arcade.Employee([emp_no],[emp_name],[emp_address],[email],[salary],[phone_no],[NIF],[schedule],[store]) VALUES(12021,'Callum Fuentes','Ap #259-7358 Porta Avenue','dignissim@enimSednulla.net',813,'(+351) 985355244','714201683',' 08007','01003');


--Maintained Logs
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12000','253212405','2005-08-18 08:42:15');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12001','360965952','2020-08-28 00:37:16');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12002','422888264','2010-10-06 20:51:01');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12003','422888264','2005-06-26 08:12:37');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12004','208263705','2006-08-19 12:02:43');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12005','322613989','2007-03-02 20:00:05');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12021','465604519','2011-11-12 06:47:14');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12020','292077525','2016-09-21 10:25:52');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12004','153153424','2011-09-03 05:27:11');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12003','421281692','2003-09-22 06:46:46');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12001','182466789','2013-07-02 13:53:09');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12007','435497536','2021-05-23 02:32:50');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12003','308786566','2021-04-21 04:41:17');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12014','492927498','2009-01-20 23:29:03');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12015','221052678','2012-10-05 14:25:18');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12014','483813013','2021-09-15 13:52:13');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12014','432817043','2009-10-07 02:34:39');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12016','399445347','2022-02-17 18:21:32');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12017','165629876','2014-06-28 12:43:39');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12020','236830375','2015-01-16 17:11:11');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12021','353984426','2018-04-14 22:27:49');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12022','424465273','2007-01-19 20:48:21');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12020','111429151','2016-08-11 11:02:37');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12018','335544551','2016-03-06 05:31:18');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12018','283246237','2009-07-01 12:28:38');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12018','498051513','2020-12-30 04:59:17');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12014','113184899','2011-07-25 14:45:33');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12014','495561483','2010-11-24 19:51:00');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12014','95368365','2013-12-03 12:17:25');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12015','95368365','2007-01-18 04:16:11');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12015','92135354','2009-04-01 02:12:00');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12015','92135354','2008-05-04 19:11:31');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12015','295938870','2003-08-10 15:31:57');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12012','280413769','2015-08-22 20:00:07');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12012','161078173','2006-05-19 00:22:21');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12012','389985358','2007-02-02 22:29:53');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12000','299218440','2018-10-20 00:27:17');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12000','97309502','2004-08-29 13:07:40');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12000','97309502','2016-04-13 16:55:50');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12001','315500456','2009-08-16 17:37:59');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12001','320349665','2007-03-12 21:29:58');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12001','277852054','2018-05-19 20:19:26');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12001','456365008','2003-12-24 05:54:09');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12002','306836027','2008-02-29 17:34:18');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12002','427757008','2017-12-19 16:45:50');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12002','239183217','2005-07-03 11:06:42');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12002','109463639','2022-03-28 21:49:29');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12003','417341091','2005-12-30 19:48:19');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12003','128170507','2017-09-12 13:00:30');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12003','343137819','2011-02-19 12:44:24');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12003','118546459','2019-08-24 05:10:46');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12004','118546459','2008-11-17 12:18:51');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12004','457461479','2012-04-15 01:10:24');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12004','457461479','2014-03-27 16:54:01');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12004','211243292','2019-09-23 01:06:53');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12007','211243292','2007-12-20 01:36:57');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12007','315500456','2017-12-11 17:02:35');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12007','315500456','2018-01-13 11:00:15');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12007','95368365','2011-10-01 15:49:07');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12007','95368365','2009-11-14 11:49:31');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12007','188419737','2014-05-13 22:45:38');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12005','188419737','2011-12-23 06:24:57');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12005','188419737','2015-02-18 05:37:28');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12005','188419737','2012-07-01 00:21:26');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12005','188419737','2020-11-18 20:14:46');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12005','188419737','2013-01-14 23:43:53');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12005','188419737','2006-06-05 07:46:15');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12006','188419737','2008-08-25 14:29:52');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12006','174623275','2022-01-20 22:35:30');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12006','174623275','2020-03-11 19:38:24');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12006','174623275','2007-03-17 17:29:55');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12006','174623275','2021-04-02 00:54:10');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12007','174623275','2006-01-09 15:20:02');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12007','174623275','2019-03-18 12:39:43');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12007','174623275','2004-01-07 07:47:48');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12007','174623275','2002-05-02 21:59:06');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12008','174623275','2011-11-03 23:14:37');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12008','174623275','2013-04-11 20:36:08');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12008','174623275','2007-05-14 14:21:22');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12008','174623275','2019-09-12 10:55:12');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12008','398017351','2009-01-21 04:58:51');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12008','398017351','2021-08-23 07:43:59');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12009','398017351','2022-02-02 22:01:39');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12009','398017351','2019-11-12 07:45:59');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12009','398017351','2011-10-17 07:56:39');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12009','215164872','2016-03-14 13:51:14');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12009','215164872','2011-06-30 21:55:40');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12009','215164872','2005-11-06 05:09:39');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12010','215164872','2020-02-28 00:09:54');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12010','115946588','2005-07-02 10:20:09');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12010','115946588','2013-10-22 01:16:46');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12010','115946588','2013-12-26 18:26:10');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12010','115946588','2005-03-03 21:47:14');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12011','115946588','2014-11-04 07:54:13');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12011','115946588','2010-12-25 07:48:01');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12011','115946588','2015-01-28 13:24:19');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12011','409665197','2004-02-28 11:02:53');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12011','409665197','2021-02-08 22:39:52');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12011','283722419','2019-12-30 09:40:17');
INSERT INTO  arcade.Maintained([employee],[machine_no],[time_stamp]) VALUES('12013','455970625','2017-12-18 05:51:38');

--ToppedUp arcade.

INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(150,'12015','06005','0.50','2021-10-05 04:27:24','1');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(151,'12015','06005','0.50','2021-06-15 06:58:49','1');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(152,'12015','06005','1','2021-01-25 13:16:31','2');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(153,'12015','06005','1','2022-04-23 09:05:48','2');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(154,'12015','06006','1.50','2021-04-27 14:04:53','3');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(155,'12016','06006','1.50','2020-08-01 21:24:33','3');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(156,'12016','06003','2','2020-11-08 11:45:43','4');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(157,'12016','06003','2','2020-10-29 12:13:52','4');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(158,'12016','06003','2.50','2021-08-03 22:52:57','5');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(159,'12001','06004','2.50','2021-06-11 02:56:16','5');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1510,'12001','06004','5','2021-03-11 21:40:46','10');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1511,'12001','06004','5','2022-01-10 11:08:17','10');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1512,'12001','06002','7.50','2020-07-10 19:37:46','15');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1513,'12002','06002','7.50','2021-06-03 08:53:35','15');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1514,'12002','06002','10','2021-05-27 16:50:25','20');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1515,'12002','06005','10','2020-05-31 07:26:48','20');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1516,'12022','06005','25','2021-02-22 04:07:22','50');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1517,'12022','06005','25','2020-12-16 18:12:15','50');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1518,'12022','06003','0.50','2022-02-22 00:58:34','1');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1519,'12022','06003','0.50','2020-07-05 20:17:13','1');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1520,'12020','06003','1','2021-06-11 20:45:52','2');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1521,'12020','06003','1','2020-11-28 11:43:00','2');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1522,'12020','06007','1.50','2021-04-01 16:38:21','3');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1523,'12020','06007','1.50','2021-07-09 17:07:37','3');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1524,'12020','06007','2','2021-02-28 04:59:09','4');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1525,'12020','06007','2','2021-12-28 14:59:53','4');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1526,'12020','06007','2.50','2020-10-25 17:31:04','5');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1527,'12021','06008','2.50','2021-12-16 07:42:41','5');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1528,'12021','06008','5','2020-07-29 12:06:17','10');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1529,'12021','06008','5','2021-11-03 08:08:16','10');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1530,'12021','06008','7.50','2021-01-31 20:31:23','15');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1531,'12021','06008','7.50','2022-05-14 00:33:47','15');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1532,'12020','06008','10','2020-12-12 14:46:55','20');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1533,'12020','06009','10','2021-10-12 19:07:25','20');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1534,'12020','06009','25','2020-07-08 11:06:11','50');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1535,'12020','06009','25','2021-11-16 08:08:04','50');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1536,'12020','06009','0.50','2021-05-13 10:46:39','1');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1537,'12019','06009','0.50','2022-04-03 12:19:18','1');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1538,'12019','06009','1','2022-02-13 19:37:53','2');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1539,'12019','06010','1','2020-06-22 14:59:54','2');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1540,'12019','06010','1.50','2021-08-21 12:13:54','3');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1541,'12019','06010','1.50','2020-10-17 07:51:17','3');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1542,'12018','06010','2','2021-03-10 07:00:05','4');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1543,'12018','06010','2','2020-10-18 21:01:06','4');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1544,'12014','06001','2.50','2022-02-06 21:45:49','5');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1545,'12004','06001','2.50','2021-02-01 22:48:35','5');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1546,'12004','06001','5','2021-03-26 02:32:46','10');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1547,'12004','06001','5','2021-12-09 08:08:42','10');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1548,'12005','06001','7.50','2021-05-14 11:10:54','15');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1549,'12005','06004','7.50','2021-01-10 22:54:20','15');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1550,'12005','06004','10','2020-08-26 01:59:40','20');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1551,'12007','06004','10','2021-12-13 14:23:41','20');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1552,'12007','06004','25','2020-08-02 04:48:37','50');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1553,'12007','06003','25','2020-11-13 09:58:54','50');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1554,'12009','06003','0.50','2022-03-03 13:52:15','1');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1555,'12009','06003','0.50','2021-09-19 21:28:13','1');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1556,'12019','06003','1','2021-12-19 19:26:51','2');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1557,'12019','06003','1','2021-03-10 21:19:58','2');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1558,'12019','06003','1.50','2022-04-05 06:24:14','3');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1559,'12019','06002','1.50','2020-10-23 12:55:04','3');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1560,'12016','06002','2','2021-04-18 23:41:53','4');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1561,'12016','06002','2','2021-01-01 18:39:51','4');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1562,'12016','06002','2.50','2020-11-03 12:04:15','5');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1563,'12016','06002','2.50','2021-02-04 10:21:49','5');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1564,'12016','06007','5','2020-07-23 08:15:40','10');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1565,'12017','06007','5','2021-04-11 12:37:29','10');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1566,'12017','06007','7.50','2021-04-26 00:53:38','15');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1567,'12017','06007','7.50','2021-09-07 00:48:37','15');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1568,'12017','06007','10','2021-04-04 03:18:49','20');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1569,'12017','06008','10','2020-09-28 06:08:51','20');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1570,'12017','06008','25','2021-10-09 20:34:49','50');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1571,'12014','06008','25','2021-01-12 19:18:04','50');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1572,'12014','06008','0.50','2020-08-04 03:30:21','1');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1573,'12014','06008','0.50','2021-11-15 13:17:11','1');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1574,'12014','06004','1','2021-06-28 13:53:32','2');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1575,'12012','06004','1','2020-08-28 21:31:58','2');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1576,'12012','06010','1.50','2020-06-05 02:14:50','3');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1577,'12012','06005','1.50','2021-01-19 23:26:49','3');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1578,'12012','06005','2','2021-07-30 05:12:46','4');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1579,'12011','06007','2','2021-07-16 14:00:41','4');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1580,'12011','06007','2.50','2021-10-09 04:10:09','5');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1581,'12011','06007','2.50','2021-06-20 01:41:33','5');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1582,'12011','06007','5','2021-11-09 10:50:31','10');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1583,'12011','06008','5','2021-01-03 07:05:42','10');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1584,'12011','06005','7.50','2020-12-01 10:03:19','15');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1585,'12015','06004','7.50','2021-10-02 16:29:43','15');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1586,'12015','06002','10','2020-07-07 12:57:36','20');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1587,'12015','06006','10','2020-11-21 19:32:18','20');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1588,'12015','06001','25','2021-06-01 00:08:16','50');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1589,'12017','06006','25','2021-11-13 22:56:26','50');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1590,'12013','06010','0.50','2021-03-18 11:13:59','1');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1591,'12000','06010','0.50','2021-01-20 08:00:11','1');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1592,'12002','06004','1','2021-10-05 14:54:30','2');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1593,'12002','06006','1','2020-07-23 13:25:28','2');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1594,'12002','06008','1.50','2022-05-10 06:50:55','3');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1595,'12002','06000','1.50','2022-01-30 04:47:01','3');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1596,'12002','06002','2','2021-06-24 20:07:17','4');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1597,'12002','06002','2','2021-07-07 11:50:59','4');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1598,'12002','06010','2.50','2021-12-18 19:02:08','5');
INSERT INTO  arcade.ToppedUp([op_id],[employee],[client],[cost],[time_stamp],[credits]) VALUES(1599,'12002','06010','2.50','2021-05-07 12:46:30','5')



INSERT INTO arcade.Supplier ([NIF],[email],[phone_no],[sup_address],[sup_name]) VALUES ('125076882','et@accumsanlaoreetipsum.net','549320730','8266 Suspendisse St.','Sit Ltd');
INSERT INTO arcade.Supplier ([NIF],[email],[phone_no],[sup_address],[sup_name]) VALUES ('439365663','sem@faucibusMorbi.net','927376061','8339 Aliquam Road','Faucibus Ut Nulla Limited');
INSERT INTO arcade.Supplier ([NIF],[email],[phone_no],[sup_address],[sup_name]) VALUES ('393823584','pede.Praesent@dignissim.ca','324394445','P.O. Box 612, 6593 Tincidunt St.','Nascetur LLC');
INSERT INTO arcade.Supplier ([NIF],[email],[phone_no],[sup_address],[sup_name]) VALUES ('126091548','non.ante.bibendum@mollis.org','341806742','P.O. Box 860, 3542 In, St.','Ac Mattis Ornare Limited');
INSERT INTO arcade.Supplier ([NIF],[email],[phone_no],[sup_address],[sup_name]) VALUES ('110135969','lectus@anteiaculis.com','216045983','476-8094 Dui. St.','Sollicitudin Orci Sem PC');
INSERT INTO arcade.Supplier ([NIF],[email],[phone_no],[sup_address],[sup_name]) VALUES ('394782747','volutpat@pharetra.org','127351502','P.O. Box 508, 1779 Mollis Street','Ante Lectus Ltd');
INSERT INTO arcade.Supplier ([NIF],[email],[phone_no],[sup_address],[sup_name]) VALUES ('266480856','interdum.ligula@acrisus.edu','431190846','2912 Pellentesque Av.','Nonummy Inc.');
INSERT INTO arcade.Supplier ([NIF],[email],[phone_no],[sup_address],[sup_name]) VALUES ('325268594','faucibus.leo@sapienimperdiet.org','167602298','P.O. Box 763, 216 Sem Street','Id Blandit Corp.');
INSERT INTO arcade.Supplier ([NIF],[email],[phone_no],[sup_address],[sup_name]) VALUES ('138323702','accumsan@miac.com','949401351','5794 Lacus. Street','Cum Sociis Ltd');
INSERT INTO arcade.Supplier ([NIF],[email],[phone_no],[sup_address],[sup_name]) VALUES ('246286056','montes@Mauris.org','675849370','512-5982 A, Avenue','Eget Dictum LLP');

--===================

INSERT INTO arcade.Publisher([pub_id],[pub_name],[pub_location],[is_indie]) VALUES(03001,'Nintendo','562-8762 Arcu. Ave',1);
INSERT INTO arcade.Publisher([pub_id],[pub_name],[pub_location],[is_indie]) VALUES(03002,'Ubisoft','Ap #467-5307 Ornare, St.',0);
INSERT INTO arcade.Publisher([pub_id],[pub_name],[pub_location],[is_indie]) VALUES(03003,'Sony Interactive Entertainment','Ap #325-6247 Ipsum Rd.',1);
INSERT INTO arcade.Publisher([pub_id],[pub_name],[pub_location],[is_indie]) VALUES(03004,'Gearbox Inc.','P.O. Box 841, 729 Vestibulum Road',0);
INSERT INTO arcade.Publisher([pub_id],[pub_name],[pub_location],[is_indie]) VALUES(03005,'Bethesda Softworks','Ap #199-1713 Nunc Street',1);
INSERT INTO arcade.Publisher([pub_id],[pub_name],[pub_location],[is_indie]) VALUES(03006,'Devolver Digital','P.O. Box 256, 7292 Sit St.',0);
INSERT INTO arcade.Publisher([pub_id],[pub_name],[pub_location],[is_indie]) VALUES(03007,'Capcom','6208 Dignissim. St.',0);
INSERT INTO arcade.Publisher([pub_id],[pub_name],[pub_location],[is_indie]) VALUES(03008,'Activision','P.O. Box 713, 4265 Quis Ave',0);
INSERT INTO arcade.Publisher([pub_id],[pub_name],[pub_location],[is_indie]) VALUES(03009,'SEGA','540-8609 Auctor St.',0);
INSERT INTO arcade.Publisher([pub_id],[pub_name],[pub_location],[is_indie]) VALUES(03010,'Arc System Works','P.O. Box 900, 7538 Tincidunt, Rd.',1);
INSERT INTO arcade.Publisher([pub_id],[pub_name],[pub_location],[is_indie]) VALUES(03011,'Bandai Namco','Ap #832-5574 Lorem St.',0);
INSERT INTO arcade.Publisher([pub_id],[pub_name],[pub_location],[is_indie]) VALUES(03012,'Konami','Ap #455-4721 Proin Avenue',1);
INSERT INTO arcade.Publisher([pub_id],[pub_name],[pub_location],[is_indie]) VALUES(03013,'Koei Tecmo','Ap #364-9669 Nam Road',0);
INSERT INTO arcade.Publisher([pub_id],[pub_name],[pub_location],[is_indie]) VALUES(03014,'SNK','P.O. Box 716, 5240 Donec Street',0);
INSERT INTO arcade.Publisher([pub_id],[pub_name],[pub_location],[is_indie]) VALUES(03015,'Square Enix','131-7022 Nulla St.',1);
INSERT INTO arcade.Publisher([pub_id],[pub_name],[pub_location],[is_indie]) VALUES(03016,'Nutting Associates','724-837 Odio. Ave',0);
INSERT INTO arcade.Publisher([pub_id],[pub_name],[pub_location],[is_indie]) VALUES(03017,'Mindscape','5967 Nunc St.',0);
INSERT INTO arcade.Publisher([pub_id],[pub_name],[pub_location],[is_indie]) VALUES(03018,'Matrix Games','P.O. Box 626, 7970 Nullam Av.',1);
INSERT INTO arcade.Publisher([pub_id],[pub_name],[pub_location],[is_indie]) VALUES(03019,'LucasArts','P.O. Box 829, 2314 Vestibulum Avenue',0);
INSERT INTO arcade.Publisher([pub_id],[pub_name],[pub_location],[is_indie]) VALUES(03020,'id Software','P.O. Box 110, 7725 Nec Street',0);




--================












INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(188419737,'Cubilia Curae; Industries'                 ,'125076882'                           ,04029,01002);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(174623275,'Nunc Associates'                           ,'125076882'                           ,04040,01000);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(398017351,'Nunc Associates'                           ,'125076882'                           ,04026,01002);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(215164872,'Lobortis Corporation'                      ,'125076882'                           ,04001,01003);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(115946588,'Interdum Libero Company'                   ,'125076882'                           ,04039,01003);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(409665197,'Magna LLC'                                 ,'439365663'                           ,04035,01002);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(283722419,'Lobortis Nisi LLP'                         ,'439365663'                           ,04004,01003);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(455970625,'Magna LLC'                                 ,'439365663'                           ,04003,01001);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(253212405,'Urna Incorporated'                         ,'439365663'                           ,04006,01001);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(360965952,'Nunc Associates'                           ,'439365663'                           ,04027,01002);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(422888264,'Pellentesque Sed Industries'               ,'439365663'                           ,04016,01002);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(208263705,'Quam Corp.'                                ,'439365663'                           ,04037,01000);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(322613989,'Non Dapibus Ltd'                           ,'393823584'                           ,04014,01000);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(465604519,'Vitae Semper Ltd'                          ,'393823584'                           ,04036,01003);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(292077525,'Tincidunt Nunc Ac Institute'               ,'393823584'                           ,04031,01003);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(153153424,'Pellentesque Sed Industries'               ,'393823584'                           ,04021,01002);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(421281692,'Magna LLC'                                 ,'393823584'                           ,04007,01003);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(182466789,'Tellus Faucibus Institute'                 ,'393823584'                           ,04000,01000);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(435497536,'Interdum Libero Company'                   ,'393823584'                           ,04005,01000);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(308786566,'Interdum Libero Company            '       ,'393823584'                           ,04034,01003);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(492927498,'Cursus Integer Mollis LLC'                 ,'393823584'                           ,04022,01001);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(221052678,'Arcu Morbi Sit Foundation'                 ,'126091548'                           ,04020,01000);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(358460515,'Fames Ac Industries'                       ,'126091548'                           ,04032,01000);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(464200035,'Ac Corporation'                            ,'126091548'                           ,04028,01002);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(483813013,'Enim Commodo Industries'                   ,'126091548'                           ,04009,01002);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(432817043,'Quam Corp.'                                ,'126091548'                           ,04038,01001);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(399445347,'Venenatis Ltd'                             ,'126091548'                           ,04008,01003);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(165629876,'Blandit Mattis Cras Consulting'            ,'126091548'                           ,04011,01000);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(236830375,'Eget Corp.'                                ,'110135969'                           ,04015,01003);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(353984426,'Quam Corp.'                                ,'110135969'                           ,04019,01003);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(424465273,'Interdum Libero Company'                   ,'110135969'                           ,04010,01000);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(111429151,'Interdum Libero Company'                   ,'110135969'                           ,04012,01000);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(335544551,'Et Risus Quisque Corporation'              ,'110135969'                           ,04017,01002);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(283246237,'Quam Corp.'                                ,'110135969'                           ,04025,01003);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(498051513,'Non Dapibus Ltd'                           ,'394782747'                           ,04030,01002);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(113184899,'Mauris Nulla Associates'                   ,'394782747'                           ,04018,01001);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(495561483,'Pellentesque Sed Industries'               ,'394782747'                           ,04024,01003);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(489274709,'Ultricies Company'                         ,'394782747'                           ,04013,01000);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(95368365,'Elit Pellentesque Company'                  ,'394782747'                           ,04002,01001);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(92135354,'Magna LLC'                                  ,'394782747'                           ,04033,01003);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(295938870,'Sed Et Libero PC'                          ,'394782747'                           ,04023,01001);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(280413769,'Tincidunt Adipiscing Mauris Company'       ,'266480856'                           ,04036,01000);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(161078173,'Id Erat Institute'                         ,'266480856'                           ,04008,01001);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(389985358,'Magna A Tortor Consulting'                 ,'266480856'                           ,04023,01003);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(299218440,'Et Ltd'                                    ,'266480856'                           ,04024,01002);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(97309502,'Consequat Corporation'                      ,'266480856'                           ,04027,01002);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(315500456,'Velit Associates'                          ,'266480856'                           ,04040,01003);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(320349665,'Ligula Eu Enim LLP'                        ,'325268594'                           ,04028,01000);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(277852054,'Vulputate Posuere Foundation'              ,'325268594'                           ,04014,01001);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(456365008,'Lobortis Nisi LLP'                         ,'325268594'                           ,04018,01002);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(306836027,'Orci LLC'                                  ,'325268594'                           ,04025,01002);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(427757008,'Pellentesque Sed Industries'               ,'325268594'                           ,04020,01002);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(239183217,'Sit Institute'                             ,'325268594'                           ,04022,01003);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(109463639,'Non Dapibus Ltd'                           ,'325268594'                           ,04013,01001);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(417341091,'Lobortis Nisi LLP'                         ,'138323702'                           ,04026,01001);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(128170507,'Integer Mollis Corp.'                      ,'138323702'                           ,04031,01000);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(343137819,'Neque Industries'                          ,'138323702'                           ,04034,01000);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(118546459,'Pellentesque Sed Industries'               ,'246286056'                           ,04017,01001);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(457461479,'Ipsum Ac LLP'                              ,'246286056'                           ,04012,01003);
INSERT INTO arcade.ArcadeMachine([serial_no],[manufacturer],[NIF],[code],[store_id]) VALUES(211243292,'Pellentesque Sed Industries'               ,'246286056'                           ,04011,01001);




INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(188419737,'138323702',309.45,'2021/08/22');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(174623275,'393823584',791.77,'2021/10/16');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(398017351,'325268594',444.62,'2022/05/07');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(215164872,'325268594',665.02,'2020/12/07');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(115946588,'138323702',979.50,'2020/12/29');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(409665197,'110135969',674.82,'2021/07/02');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(283722419,'439365663',641.84,'2021/02/27');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(455970625,'138323702',508.08,'2021/02/07');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(253212405,'138323702',310.54,'2021/03/27');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(360965952,'394782747',690.12,'2020/11/18');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(422888264,'266480856',381.39,'2020/07/18');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(208263705,'126091548',718.15,'2020/12/31');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(322613989,'110135969',401.38,'2022/02/08');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(465604519,'394782747',389.56,'2022/04/09');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(292077525,'266480856',477.96,'2021/07/22');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(153153424,'266480856',267.50,'2020/07/02');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(421281692,'125076882',429.76,'2021/04/27');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(182466789,'138323702',998.59,'2020/10/05');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(435497536,'393823584',580.76,'2021/04/26');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(308786566,'138323702',632.86,'2021/06/20');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(492927498,'126091548',709.93,'2020/06/29');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(221052678,'246286056',860.52,'2021/08/04');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(358460515,'125076882',670.07,'2020/06/21');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(464200035,'439365663',960.15,'2020/08/03');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(483813013,'125076882',909.57,'2021/04/06');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(432817043,'325268594',386.86,'2021/01/19');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(399445347,'110135969',122.81,'2021/11/14');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(165629876,'138323702',100.94,'2022/02/05');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(236830375,'266480856',109.87,'2020/07/19');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(353984426,'246286056',835.79,'2021/04/27');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(424465273,'393823584',535.54,'2020/11/18');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(111429151,'266480856',556.63,'2020/07/03');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(335544551,'138323702',460.44,'2021/01/28');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(283246237,'394782747',644.16,'2022/04/16');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(498051513,'439365663',150.48,'2021/09/20');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(113184899,'125076882',179.19,'2020/06/20');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(495561483,'266480856',401.04,'2021/07/25');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(489274709,'138323702',708.84,'2020/12/29');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(95368365,'393823584' ,556.75,'2020/08/02');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(92135354,'325268594' ,837.63,'2022/05/21');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(295938870,'394782747',316.46,'2020/09/20');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(280413769,'246286056',720.81,'2020/11/27');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(161078173,'393823584',645.63,'2022/04/16');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(389985358,'439365663',643.19,'2022/03/14');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(299218440,'138323702',364.03,'2022/04/24');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(97309502, '125076882',584.76,'2020/08/08');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(315500456,'439365663',804.61,'2020/08/08');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(320349665,'325268594',785.57,'2021/07/29');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(277852054,'138323702',732.88,'2020/12/24');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(456365008,'138323702',549.04,'2022/04/28');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(306836027,'266480856',754.50,'2022/05/18');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(427757008,'394782747',166.90,'2022/02/05');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(239183217,'138323702',371.09,'2021/10/19');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(109463639,'125076882',640.81,'2021/05/29');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(417341091,'125076882',609.89,'2020/12/28');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(128170507,'110135969',249.69,'2021/04/27');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(343137819,'246286056',557.43,'2020/12/20');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(118546459,'394782747',708.34,'2020/06/04');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(457461479,'393823584',243.13,'2020/06/21');
INSERT INTO arcade.Rents([machine_no],[supplier],[rent_cost],[rent_duration]) VALUES(211243292,'246286056',260.12,'2021/07/23');



INSERT INTO arcade.Schedule([schedule_code],[start_time],[end_time]) VALUES(08001,'08:00:00','17:00:00');
INSERT INTO arcade.Schedule([schedule_code],[start_time],[end_time]) VALUES(08002,'08:00:00','17:00:00');
INSERT INTO arcade.Schedule([schedule_code],[start_time],[end_time]) VALUES(08003,'13:00:00','17:00:00');
INSERT INTO arcade.Schedule([schedule_code],[start_time],[end_time]) VALUES(08004,'17:00:00','02:00:00');
INSERT INTO arcade.Schedule([schedule_code],[start_time],[end_time]) VALUES(08005,'17:00:00','02:00:00');
INSERT INTO arcade.Schedule([schedule_code],[start_time],[end_time]) VALUES(08006,'07:00:00','12:00:00');
INSERT INTO arcade.Schedule([schedule_code],[start_time],[end_time]) VALUES(08007,'07:00:00','12:00:00');



INSERT INTO arcade.ScheduleFunction([schedule_code],[task]) VALUES(08001,'service');
INSERT INTO arcade.ScheduleFunction([schedule_code],[task]) VALUES(08001,'maintenance');
INSERT INTO arcade.ScheduleFunction([schedule_code],[task]) VALUES(08001,'cleaning');
INSERT INTO arcade.ScheduleFunction([schedule_code],[task]) VALUES(08002,'service');
INSERT INTO arcade.ScheduleFunction([schedule_code],[task]) VALUES(08002,'cleaning');
INSERT INTO arcade.ScheduleFunction([schedule_code],[task]) VALUES(08003,'service');
INSERT INTO arcade.ScheduleFunction([schedule_code],[task]) VALUES(08003,'cleaning');
INSERT INTO arcade.ScheduleFunction([schedule_code],[task]) VALUES(08004,'service');
INSERT INTO arcade.ScheduleFunction([schedule_code],[task]) VALUES(08004,'cleaning');
INSERT INTO arcade.ScheduleFunction([schedule_code],[task]) VALUES(08004,'maintenance');
INSERT INTO arcade.ScheduleFunction([schedule_code],[task]) VALUES(08005,'service');
INSERT INTO arcade.ScheduleFunction([schedule_code],[task]) VALUES(08005,'cleaning');
INSERT INTO arcade.ScheduleFunction([schedule_code],[task]) VALUES(08006,'maintenance');
INSERT INTO arcade.ScheduleFunction([schedule_code],[task]) VALUES(08007,'cleaning');





INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06000,'Paloma J. Montoya',893,7);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06001,'Philip Mckay',122,16);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06002,'Ann A. Brennan',487,15);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06003,'Keelie Y. Osborn',180,12);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06004,'Joan Watson',347,5);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06005,'Carol Ruiz',362,20);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06006,'Leigh Drake',584,13);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06007,'Amos Oneil',176,4);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06008,'Louis Guthrie',978,20);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06009,'Shannon Curry',488,3);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06010,'Victoria P. Payne',186,14);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06011,'Heidi Hobbs',244,13);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06012,'Mercedes Randall',222,2);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06013,'Kane Fernandez',584,2);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06014,'Troy O. Chaney',563,15);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06015,'Herman Mcknight',809,2);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06016,'Chantale T. Christensen',555,6);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06017,'Zahir Valentine',838,7);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06018,'Blaze M. Petersen',613,7);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06019,'Vincent Delacruz',755,10);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06020,'Leilani Carr',560,19);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06021,'Jamal Mullen',407,1);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06022,'John O. Compton',581,2);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06023,'Kareem J. Glass',417,14);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06024,'Raya R. Meyers',34,16);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06025,'Vladimir R. Tate',354,1);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06026,'Mary D. Weaver',427,18);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06027,'Cadman Guzman',1,9);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06028,'Kimberley Collier',755,11);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06029,'Marshall Luna',879,17);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06030,'Oscar A. Huff',373,14);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06031,'Iris Rosales',115,12);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06032,'Nola Y. Olson',712,3);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06033,'Daquan Duke',637,10);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06034,'Ian E. Riley',101,3);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06035,'Mollie Gentry',367,20);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06036,'Jonas Blevins',308,0);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06037,'Brock A. Griffith',43,3);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06038,'Lev F. Medina',933,16);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06039,'Jemima Olson',417,11);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06040,'Blaze P. Snyder',974,16);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06041,'Georgia Mccall',546,7);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06042,'Zelenia N. Dotson',739,15);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06043,'Sophia Garrison',996,8);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06044,'Octavius O. Larsen',818,13);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06045,'Jesse Crane',228,0);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06046,'Deanna Hicks',672,6);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06047,'Leilani S. Salazar',523,18);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06048,'Hayes Ward',527,18);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06049,'Jennifer Hubbard',499,4);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06050,'Wang U. Nguyen',451,18);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06051,'Wang W. Dalton',22,6);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06052,'Barrett Wise',874,7);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06053,'Unity Hatfield',700,7);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06054,'Melanie M. Hogan',920,8);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06055,'Whitney A. Roberts',689,0);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06056,'Winifred C. Guerra',675,5);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06057,'Maia Hendrix',206,5);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06058,'Stephen Bowers',990,12);
INSERT INTO arcade.Client([client_no],[cli_name],[points],[credits]) VALUES(06059,'Shoshana B. Merrill',263,17);


update arcade.Client set credits = 7 where client_no=06000
update arcade.Client set credits = 16 where client_no=06001
update arcade.Client set credits = 15 where client_no=06002
update arcade.Client set credits = 12 where client_no=06003
update arcade.Client set credits = 5 where client_no=06004
update arcade.Client set credits = 20 where client_no=06005
update arcade.Client set credits = 3 where client_no=06006
update arcade.Client set credits = 14 where client_no=06007
update arcade.Client set credits = 2 where client_no=06008
update arcade.Client set credits = 2 where client_no=06009
update arcade.Client set credits = 15 where client_no=06010
update arcade.Client set credits = 2 where client_no=06011
update arcade.Client set credits = 6 where client_no=06012
update arcade.Client set credits = 7 where client_no=06013
update arcade.Client set credits = 7 where client_no=06014
update arcade.Client set credits = 10 where client_no=06016
update arcade.Client set credits = 19 where client_no=06017
update arcade.Client set credits = 1 where client_no=06018
update arcade.Client set credits = 2 where client_no=06019
update arcade.Client set credits = 14 where client_no=06020
update arcade.Client set credits = 16 where client_no=06021
update arcade.Client set credits = 1 where client_no=06022
update arcade.Client set credits = 18 where client_no=06023
update arcade.Client set credits = 9 where client_no=06024
update arcade.Client set credits = 11 where client_no=06025
update arcade.Client set credits = 17 where client_no=06026
update arcade.Client set credits = 14 where client_no=06027
update arcade.Client set credits = 16 where client_no=06029
update arcade.Client set credits = 1 where client_no=06030
update arcade.Client set credits = 18 where client_no=06031
update arcade.Client set credits = 9 where client_no=06032
update arcade.Client set credits = 1 where client_no=06033
update arcade.Client set credits = 11 where client_no=06034
update arcade.Client set credits = 17 where client_no=06035
update arcade.Client set credits = 14 where client_no=06037
update arcade.Client set credits = 12 where client_no=06038
update arcade.Client set credits = 3 where client_no=06039
update arcade.Client set credits = 10 where client_no=06040
update arcade.Client set credits = 3 where client_no=06041
update arcade.Client set credits = 20 where client_no=06042
update arcade.Client set credits = 0 where client_no=06043
update arcade.Client set credits = 3 where client_no=06044
update arcade.Client set credits = 16 where client_no=06045
update arcade.Client set credits = 1 where client_no=06047
update arcade.Client set credits = 1 where client_no=06048
update arcade.Client set credits = 11 where client_no=06049
update arcade.Client set credits = 16 where client_no=06050
update arcade.Client set credits = 7 where client_no=06051
update arcade.Client set credits = 15 where client_no=06052
update arcade.Client set credits = 8 where client_no=06053
update arcade.Client set credits = 13 where client_no=06054
update arcade.Client set credits = 0 where client_no=06055
update arcade.Client set credits = 6 where client_no=06056
update arcade.Client set credits = 18 where client_no=06057
update arcade.Client set credits = 18 where client_no=06058
update arcade.Client set credits = 4 where client_no=06059
update arcade.Client set credits = 18 where client_no=06060
update arcade.Client set credits = 6 where client_no=06061
update arcade.Client set credits = 7 where client_no=06062
update arcade.Client set credits = 7 where client_no=06063
update arcade.Client set credits = 8 where client_no=06064
update arcade.Client set credits = 0 where client_no=06065
update arcade.Client set credits = 5 where client_no=06066
update arcade.Client set credits = 5 where client_no=06067
update arcade.Client set credits = 12 where client_no=06068
update arcade.Client set credits = 17 where client_no=06069


INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(3,'2020-01-01 09:11:42',06039,12004,07001);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(3,'2020-09-08 02:44:48',06007,12005,07004);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(10,'2019-12-31 00:47:19',06015,12002,07010);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(8,'2020-08-24 05:50:21',06047,12020,07001);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(6,'2020-02-25 22:40:15',06035,12003,07006);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(10,'2021-02-24 08:26:29',06018,12020,07004);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(8,'2019-05-26 03:46:26',06050,12009,07003);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(3,'2020-02-28 10:47:37',06006,12019,07007);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(9,'2020-04-15 14:51:05',06049,12014,07006);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(7,'2020-03-24 20:26:25',06018,12016,07005);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(6,'2020-11-06 01:44:56',06049,12017,07010);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(4,'2020-09-02 22:57:00',06025,12002,07004);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(10,'2020-06-26 12:36:55',06035,12009,07010);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(5,'2020-07-28 20:04:07',06023,12001,07010);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(5,'2019-07-29 15:02:49',06059,12003,07005);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(9,'2021-03-29 06:16:54',06053,12000,07008);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(1,'2020-02-14 06:42:21',06017,12012,07003);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(2,'2021-02-14 01:55:53',06000,12001,07008);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(4,'2020-03-25 11:05:52',06014,12018,07000);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(9,'2020-04-20 11:59:59',06025,12007,07007);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(5,'2020-02-12 10:22:29',06055,12002,07000);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(2,'2020-12-30 03:36:00',06012,12007,07006);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(5,'2020-11-19 09:09:00',06040,12003,07002);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(5,'2020-03-30 21:06:40',06011,12009,07000);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(9,'2020-05-09 06:13:13',06041,12013,07006);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(6,'2020-06-12 21:23:46',06031,12016,07008);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(2,'2020-11-01 02:23:45',06008,12008,07006);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(3,'2020-01-29 13:08:02',06041,12004,07006);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(10,'2019-05-22 17:14:43',06038,12014,07004);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(4,'2020-10-19 13:26:56',06054,12011,07000);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(8,'2020-09-04 19:50:42',06009,12019,07007);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(6,'2019-09-11 03:56:31',06025,12006,07001);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(7,'2019-09-26 21:55:41',06051,12010,07010);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(2,'2020-08-03 00:08:03',06033,12021,07004);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(6,'2021-03-25 01:44:38',06018,12019,07005);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(9,'2020-03-07 19:54:20',06056,12017,07006);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(4,'2019-07-05 18:52:42',06016,12018,07001);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(7,'2020-01-24 19:35:36',06057,12001,07002);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(5,'2020-03-24 05:06:46',06038,12020,07005);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(5,'2020-09-02 08:22:00',06007,12014,07000);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(4,'2021-05-12 08:08:47',06042,12007,07008);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(2,'2020-10-08 13:16:07',06036,12003,07003);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(3,'2020-10-26 14:58:58',06010,12002,07004);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(3,'2021-01-03 23:56:19',06026,12012,07001);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(5,'2019-09-03 18:45:31',06030,12008,07005);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(4,'2021-02-25 08:16:35',06007,12009,07001);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(4,'2021-02-25 17:44:54',06059,12001,07005);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(9,'2020-01-14 09:15:36',06052,12016,07004);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(3,'2020-09-23 06:56:25',06040,12021,07003);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(4,'2020-12-04 09:38:38',06059,12011,07004);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(5,'2021-03-24 17:39:05',06035,12001,07004);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(8,'2020-02-20 16:16:06',06034,12012,07001);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(3,'2021-01-22 16:05:14',06015,12017,07010);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(9,'2020-10-30 00:43:47',06006,12014,07004);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(2,'2021-03-08 23:33:20',06049,12018,07004);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(10,'2020-06-20 04:57:50',06010,12005,07004);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(2,'2021-05-21 19:22:25',06027,12009,07002);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(5,'2019-11-04 20:02:09',06006,12015,07005);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(10,'2020-10-18 10:17:08',06026,12005,07003);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(4,'2019-10-24 02:10:43',06050,12016,07004);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(4,'2021-05-20 13:34:19',06004,12011,07006);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(4,'2020-07-11 17:49:59',06046,12006,07002);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(8,'2020-02-08 16:13:32',06027,12006,07010);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(8,'2019-08-30 13:28:26',06025,12001,07005);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(5,'2020-11-21 15:30:02',06002,12000,07002);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(8,'2019-11-23 07:03:53',06039,12010,07003);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(10,'2019-11-20 23:44:12',06009,12015,07007);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(7,'2020-02-17 12:08:35',06042,12003,07003);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(5,'2021-04-30 00:06:46',06040,12019,07001);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(8,'2019-06-14 16:46:16',06033,12020,07002);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(2,'2020-12-25 07:42:28',06056,12013,07001);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(2,'2020-04-10 19:11:05',06015,12013,07001);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(2,'2020-07-16 08:52:54',06006,12015,07010);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(1,'2021-05-01 13:33:54',06031,12011,07009);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(1,'2021-01-26 08:35:45',06035,12014,07003);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(7,'2021-05-01 18:24:45',06011,12021,07006);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(7,'2019-06-27 13:31:46',06049,12008,07008);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(9,'2020-05-04 00:16:02',06016,12021,07007);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(1,'2020-01-10 07:13:49',06038,12004,07002);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(3,'2020-04-21 09:39:42',06009,12001,07005);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(3,'2019-07-31 17:26:31',06020,12011,07006);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(2,'2020-07-15 11:51:04',06022,12008,07003);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(8,'2019-05-29 18:06:42',06021,12001,07007);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(5,'2020-05-05 14:24:27',06019,12003,07004);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(7,'2020-02-22 15:45:23',06051,12021,07007);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(2,'2020-07-30 18:46:58',06051,12021,07006);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(7,'2020-08-01 08:24:57',06054,12012,07004);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(7,'2020-08-09 23:50:19',06051,12019,07002);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(10,'2021-02-05 08:54:12',06021,12019,07010);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(7,'2020-08-18 02:54:06',06017,12021,07005);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(8,'2020-05-14 23:26:11',06016,12008,07002);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(10,'2021-01-12 01:41:18',06015,12016,07003);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(5,'2020-02-13 03:41:36',06047,12014,07005);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(2,'2019-08-19 23:55:44',06042,12010,07005);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(9,'2019-11-20 23:12:35',06005,12018,07007);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(4,'2020-01-29 11:03:56',06010,12014,07003);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(7,'2021-04-09 09:21:23',06031,12000,07001);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(8,'2021-05-14 03:57:56',06050,12014,07009);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(4,'2020-04-18 08:17:28',06030,12003,07002);
INSERT INTO arcade.Redeemed([quantity],[time_stamp],[client_no],[emp_no],[pri_id]) VALUES(2,'2021-05-09 13:19:27',06030,12015,07010);


INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2021-05-21 19:13:09','00:43:40',122,06048,495561483);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-05-11 10:46:36','00:00:54',103,06038,236830375);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2021-03-24 21:38:19','00:33:53',77,06042,239183217);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-04-11 13:22:52','00:01:56',68,06049,492927498);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-07-29 17:39:32','00:25:33',86,06016,455970625);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2021-04-30 01:24:43','00:06:30',50,06018,118546459);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-04-05 12:47:31','00:10:11',139,06009,360965952);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2019-08-19 06:04:18','00:24:26',118,06028,432817043);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-11-02 17:36:54','00:03:52',160,06032,389985358);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-12-18 17:42:26','00:43:30',110,06025,253212405);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-07-01 20:04:01','00:26:22',48,06060,464200035);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-04-21 15:05:34','00:06:15',65,06054,358460515);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2021-04-02 15:57:29','00:33:28',97,06050,389985358);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2021-04-16 01:25:47','00:55:19',27,06029,92135354);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2021-02-21 18:40:46','00:56:30',74,06046,239183217);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2019-11-26 03:59:47','00:25:12',76,06040,153153424);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2021-01-20 02:25:58','00:03:46',161,06019,165629876);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2019-07-06 02:17:12','00:02:09',61,06020,292077525);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2021-04-06 19:10:39','00:42:01',24,06008,417341091);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-11-08 09:56:13','00:59:26',96,06048,498051513);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-04-12 13:38:19','00:59:59',16,06042,457461479);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2021-01-30 16:56:12','00:30:25',35,06043,417341091);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2019-11-26 21:15:13','00:53:35',87,06016,295938870);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2021-02-18 23:19:19','01:20:57',52,06002,427757008);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2019-06-08 01:28:09','00:30:48',172,06057,   );
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-07-05 19:43:28','00:33:55',15,06051,165629876);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2019-06-30 21:50:24','00:59:45',40,06051,239183217);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2021-05-15 15:18:35','00:10:47',79,06038,153153424);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-05-30 01:57:06','00:23:35',64,06037,335544551);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-06-10 04:48:14','01:35:50',46,06020,322613989);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-07-03 00:39:35','00:27:38',132,06054,306836027);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2021-03-27 10:59:36','00:11:03',28,06026,236830375);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-08-11 02:20:52','00:19:09',17,06014,464200035);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-12-27 05:46:52','00:33:29',70,06059,335544551);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2021-03-20 10:35:58','00:17:26',48,06003,492927498);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-11-23 00:42:56','00:17:39',25,06035,182466789);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2019-11-08 14:59:10','00:03:13',77,06013,208263705);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2021-05-17 23:21:14','00:16:25',34,06023,427757008);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2019-11-13 05:14:28','00:12:13',134,06043,109463639);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2021-02-22 15:10:09','00:09:36',138,06054,188419737);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-07-23 13:48:38','00:35:14',85,06008,253212405);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2019-06-27 17:58:41','00:12:11',165,06041,236830375);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-06-25 18:08:42','00:13:38',55,06020,221052678);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-06-11 02:17:31','00:32:22',36,06052,421281692);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2021-04-24 06:09:14','00:07:53',92,06028,322613989);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2021-02-01 09:57:26','00:18:46',113,06008,182466789);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2021-03-21 11:35:45','00:12:28',62,06049,456365008);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2019-09-07 07:59:13','00:59:57',148,06018,208263705);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-08-07 06:15:11','00:50:26',38,06023,128170507);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2021-03-13 13:36:37','00:40:09',35,06033,174623275);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-12-24 08:45:06','00:47:00',78,06010,489274709);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2019-11-19 12:10:17','00:25:14',153,06052,498051513);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2019-09-12 21:39:00','01:27:13',11,06046,456365008);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-04-11 19:31:41','00:31:09',105,06026,182466789);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2019-11-16 19:25:20','01:28:58',108,06022,335544551);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-05-27 08:40:00','00:07:30',39,06051,118546459);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-12-30 08:27:46','01:04:33',121,06041,343137819);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2021-05-11 19:45:00','00:52:12',71,06024,182466789);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-03-01 10:58:40','00:33:33',84,06031,115946588);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2019-07-31 10:56:43','00:35:54',69,06015,424465273);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2019-07-20 02:39:05','00:03:34',172,06041,421281692);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2021-05-07 07:44:04','00:00:23',99,06021,358460515);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2019-06-25 19:05:40','00:30:15',61,06002,417341091);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-05-29 07:01:48','01:30:40',98,06038,455970625);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-09-22 23:05:18','02:23:44',95,06047,153153424);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2019-09-18 08:30:55','00:23:17',132,06013,358460515);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-10-29 01:23:25','00:45:29',62,06012,239183217);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2021-03-30 07:02:32','00:57:29',55,06050,161078173);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-11-19 05:20:09','01:41:22',111,06027,465604519);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-05-04 02:02:17','00:33:47',26,06034,221052678);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-04-11 17:47:47','00:14:15',90,06046,295938870);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-05-31 06:26:16','00:45:37',77,06019,128170507);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-11-02 04:02:54','01:52:22',26,06049,239183217);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-07-10 21:46:24','02:37:00',30,06016,188419737);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-04-30 07:30:10','01:49:24',72,06015,432817043);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2021-04-23 22:50:08','00:08:27',50,06045,280413769);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-08-28 12:37:34','00:19:43',176,06047,95368365);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-01-25 07:38:54','00:41:54',179,06014,424465273);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-06-23 12:10:51','00:29:38',175,06036,97309502);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2019-12-30 22:43:52','00:57:48',177,06038,457461479);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2019-10-02 15:16:05','00:53:41',57,06026,421281692);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-01-16 04:39:12','00:24:38',60,06002,111429151);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2019-05-29 17:13:01','00:51:51',23,06049,456365008);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-08-09 11:39:16','00:13:09',38,06058,489274709);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-04-30 04:10:19','00:10:08',48,06002,409665197);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2019-08-29 05:10:22','00:59:01',55,06018,97309502);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2019-06-30 19:52:08','00:18:28',179,06059,353984426);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-08-05 06:31:44','00:25:43',71,06056,299218440);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2019-11-15 04:34:33','00:11:58',113,06031,188419737);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-05-22 23:53:57','00:55:30',116,06050,432817043);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-03-11 00:13:45','00:25:38',73,06058,153153424);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2021-05-21 09:45:31','00:12:26',18,06057,239183217);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-09-14 10:50:12','00:14:58',127,06055,111429151);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-01-09 19:12:16','00:44:13',129,06019,455970625);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-01-28 18:17:19','00:23:25',47,06043,92135354);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-10-04 06:59:05','00:20:37',17,06036,115946588);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2019-11-15 14:00:14','00:05:04',107,06058,335544551);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2019-12-12 00:37:38','00:33:09',123,06020,322613989);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2020-09-27 10:36:49','00:18:54',155,06008,113184899);
INSERT INTO arcade.Played([time_stamp],[playtime],[points_recv],[client],[machine_no]) VALUES('2021-02-15 10:56:19','00:20:47',16,06033,417341091);
