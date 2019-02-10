INSERT INTO `addon_account` (`name`, `label`, `shared`) VALUES
	('society_cnn','CNN',1)
;

INSERT INTO `addon_inventory` (`name`, `label`, `shared`) VALUES
	('society_cnn','CNN', 1)
;
INSERT INTO `datastore` (`name`, `label`, `shared`) VALUES
	('society_cnn', 'CNN', 1)
;

INSERT INTO `jobs`(`name`, `label`, `whitelisted`) VALUES
	('cnn', 'CNN', 1)
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary) VALUES
	('cnn',0,'employe','Stagiaire', 1500,),
	('cnn',1,'novice','Journaliste', 2000,),
	('cnn',2,'viceboss','Co-Rédacteur en chef', 3500,),
	('cnn',3,'boss','Rédacteur en chef', 4000,)
;