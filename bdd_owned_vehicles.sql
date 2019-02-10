-- --------------------------------------------------------
-- Hôte :                        127.0.0.1
-- Version du serveur:           10.1.30-MariaDB - mariadb.org binary distribution
-- SE du serveur:                Win32
-- HeidiSQL Version:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Export de la structure de la table essentialmode. owned_vehicles
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `owner` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `vehicle` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  `state` int(1) DEFAULT '1',
  `idGarage` int(11) DEFAULT '1' COMMENT 'Garage parking',
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Export de données de la table essentialmode.owned_vehicles : ~24 rows (environ)
/*!40000 ALTER TABLE `owned_vehicles` DISABLE KEYS */;
INSERT INTO `owned_vehicles` (`owner`, `plate`, `vehicle`, `state`, `idGarage`) VALUES
	('steam:110000101b78064', '48HJW651', '{"modSuspension":-1,"modAirFilter":-1,"color1":63,"modBrakes":-1,"modFrontBumper":-1,"modGrille":-1,"modSeats":-1,"modArmor":-1,"modWindows":-1,"modVanityPlate":-1,"modSpoilers":-1,"modDial":-1,"neonColor":[255,0,255],"windowTint":-1,"modLivery":-1,"modPlateHolder":-1,"modAPlate":-1,"modHorns":-1,"wheelColor":156,"modTrimB":-1,"modAerials":-1,"health":1000,"modFender":-1,"modFrontWheels":-1,"modTank":-1,"modTrimA":-1,"modArchCover":-1,"modExhaust":-1,"modDashboard":-1,"modHood":-1,"modFrame":-1,"model":767087018,"modRearBumper":-1,"modEngineBlock":-1,"modRoof":-1,"modOrnaments":-1,"modTrunk":-1,"color2":0,"modSteeringWheel":-1,"modRightFender":-1,"modHydrolic":-1,"modBackWheels":-1,"plateIndex":0,"modShifterLeavers":-1,"neonEnabled":[false,false,false,false],"modSmokeEnabled":false,"modEngine":-1,"dirtLevel":7.1139302253723,"modSpeakers":-1,"plate":"48HJW651","tyreSmokeColor":[255,255,255],"modStruts":-1,"modTransmission":-1,"pearlescentColor":5,"modTurbo":false,"modSideSkirt":-1,"wheels":7,"modDoorSpeaker":-1,"modXenon":false}', 1, 1),
	('society:mecano', 'BENNYS1', '{"modTrimA":-1,"modEngine":-1,"modTurbo":false,"modSeats":-1,"modFrontBumper":-1,"plate":"BENNYS1","modBrakes":-1,"color2":70,"neonColor":[255,0,255],"modEngineBlock":-1,"modSideSkirt":-1,"modSmokeEnabled":false,"modArchCover":-1,"neonEnabled":[false,false,false,false],"modAPlate":-1,"modTrunk":-1,"modDoorSpeaker":-1,"modTank":-1,"modHydrolic":-1,"modFender":-1,"modBackWheels":-1,"modVanityPlate":-1,"modExhaust":-1,"modHood":-1,"modPlateHolder":-1,"modSteeringWheel":-1,"modShifterLeavers":-1,"modStruts":-1,"modDashboard":-1,"dirtLevel":14.0,"pearlescentColor":63,"modFrame":-1,"modFrontWheels":-1,"modAirFilter":-1,"modAerials":-1,"modTrimB":-1,"modRightFender":-1,"color1":73,"modSuspension":-1,"modRearBumper":-1,"modOrnaments":-1,"modArmor":-1,"model":1353720154,"health":1000,"modHorns":-1,"modLivery":-1,"wheelColor":156,"modDial":-1,"modSpoilers":-1,"modTransmission":-1,"modWindows":-1,"modGrille":-1,"modSpeakers":-1,"plateIndex":3,"modRoof":-1,"tyreSmokeColor":[255,255,255],"windowTint":-1,"wheels":0,"modXenon":false}', 1, 1),
	('society:mecano', 'BENNYS2', '{"modTrimA":-1,"modEngine":-1,"modTurbo":false,"modSeats":-1,"modFrontBumper":-1,"plate":"BENNYS2","modBrakes":-1,"color2":70,"neonColor":[255,0,255],"modEngineBlock":-1,"modSideSkirt":-1,"modSmokeEnabled":false,"modArchCover":-1,"neonEnabled":[false,false,false,false],"modAPlate":-1,"modTrunk":-1,"modDoorSpeaker":-1,"modTank":-1,"modHydrolic":-1,"modFender":-1,"modBackWheels":-1,"modVanityPlate":-1,"modExhaust":-1,"modHood":-1,"modPlateHolder":-1,"modSteeringWheel":-1,"modShifterLeavers":-1,"modStruts":-1,"modDashboard":-1,"dirtLevel":14.0,"pearlescentColor":63,"modFrame":-1,"modFrontWheels":-1,"modAirFilter":-1,"modAerials":-1,"modTrimB":-1,"modRightFender":-1,"color1":73,"modSuspension":-1,"modRearBumper":-1,"modOrnaments":-1,"modArmor":-1,"model":1353720154,"health":1000,"modHorns":-1,"modLivery":-1,"wheelColor":156,"modDial":-1,"modSpoilers":-1,"modTransmission":-1,"modWindows":-1,"modGrille":-1,"modSpeakers":-1,"plateIndex":3,"modRoof":-1,"tyreSmokeColor":[255,255,255],"windowTint":-1,"wheels":0,"modXenon":false}', 1, 1),
	('society:mecano', 'BENNYS3', '{"modTrimA":-1,"modEngine":-1,"modTurbo":false,"modSeats":-1,"modFrontBumper":-1,"plate":"BENNYS3","modBrakes":-1,"color2":0,"neonColor":[255,0,255],"modEngineBlock":-1,"modSideSkirt":-1,"modSmokeEnabled":false,"modArchCover":-1,"neonEnabled":[false,false,false,false],"modAPlate":-1,"modTrunk":-1,"modDoorSpeaker":-1,"modTank":-1,"modHydrolic":-1,"modFender":-1,"modBackWheels":-1,"modVanityPlate":-1,"modExhaust":-1,"modHood":-1,"modPlateHolder":-1,"modSteeringWheel":-1,"modShifterLeavers":-1,"modStruts":-1,"modDashboard":-1,"dirtLevel":14.0,"pearlescentColor":3,"modFrame":-1,"modFrontWheels":-1,"modAirFilter":-1,"modAerials":-1,"modTrimB":-1,"modRightFender":-1,"color1":47,"modSuspension":-1,"modRearBumper":-1,"modOrnaments":-1,"modArmor":-1,"model":-1323100960,"health":1000,"modHorns":-1,"modLivery":-1,"wheelColor":156,"modDial":-1,"modSpoilers":-1,"modTransmission":-1,"modWindows":-1,"modGrille":-1,"modSpeakers":-1,"plateIndex":3,"modRoof":-1,"tyreSmokeColor":[255,255,255],"windowTint":-1,"wheels":0,"modXenon":false}', 1, 1),
	('society:mecano', 'BENNYS4', '{"modTrimA":-1,"modEngine":-1,"modTurbo":false,"modSeats":-1,"modFrontBumper":-1,"plate":"BENNYS4","modBrakes":-1,"color2":0,"neonColor":[255,0,255],"modEngineBlock":-1,"modSideSkirt":-1,"modSmokeEnabled":false,"modArchCover":-1,"neonEnabled":[false,false,false,false],"modAPlate":-1,"modTrunk":-1,"modDoorSpeaker":-1,"modTank":-1,"modHydrolic":-1,"modFender":-1,"modBackWheels":-1,"modVanityPlate":-1,"modExhaust":-1,"modHood":-1,"modPlateHolder":-1,"modSteeringWheel":-1,"modShifterLeavers":-1,"modStruts":-1,"modDashboard":-1,"dirtLevel":14.0,"pearlescentColor":3,"modFrame":-1,"modFrontWheels":-1,"modAirFilter":-1,"modAerials":-1,"modTrimB":-1,"modRightFender":-1,"color1":47,"modSuspension":-1,"modRearBumper":-1,"modOrnaments":-1,"modArmor":-1,"model":-1323100960,"health":1000,"modHorns":-1,"modLivery":-1,"wheelColor":156,"modDial":-1,"modSpoilers":-1,"modTransmission":-1,"modWindows":-1,"modGrille":-1,"modSpeakers":-1,"plateIndex":3,"modRoof":-1,"tyreSmokeColor":[255,255,255],"windowTint":-1,"wheels":0,"modXenon":false}', 1, 1),
	('society:brinks', 'LSBR1', '{"color2":79,"modTrimB":-1,"modTransmission":-1,"modSpeakers":-1,"modGrille":-1,"modTank":-1,"modSuspension":-1,"modFrame":-1,"modSmokeEnabled":false,"modWindows":-1,"pearlescentColor":106,"modSpoilers":-1,"wheels":0,"modRoof":-1,"modOrnaments":-1,"modXenon":false,"modEngineBlock":-1,"modTrunk":-1,"modRightFender":-1,"modSeats":-1,"modStruts":-1,"neonEnabled":[false,false,false,false],"wheelColor":156,"neonColor":[255,0,255],"modPlateHolder":-1,"modBackWheels":-1,"modAerials":-1,"modLivery":-1,"color1":67,"modDashboard":-1,"modHood":-1,"modEngine":-1,"modAPlate":-1,"modTurbo":false,"modShifterLeavers":-1,"modFender":-1,"modHorns":-1,"modFrontBumper":-1,"modBrakes":-1,"modVanityPlate":-1,"modTrimA":-1,"plateIndex":3,"modRearBumper":-1,"modSideSkirt":-1,"modDial":-1,"modFrontWheels":-1,"plate":"LSBR1","modAirFilter":-1,"tyreSmokeColor":[255,255,255],"health":989,"modArmor":-1,"modExhaust":-1,"windowTint":-1,"modDoorSpeaker":-1,"dirtLevel":9.0059814453125,"modSteeringWheel":-1,"model":1747439474,"modHydrolic":-1,"modArchCover":-1}', 1, 1),
	('society:brinks', 'LSBR2', '{"color2":79,"modTrimB":-1,"modTransmission":-1,"modSpeakers":-1,"modGrille":-1,"modTank":-1,"modSuspension":-1,"modFrame":-1,"modSmokeEnabled":false,"modWindows":-1,"pearlescentColor":106,"modSpoilers":-1,"wheels":0,"modRoof":-1,"modOrnaments":-1,"modXenon":false,"modEngineBlock":-1,"modTrunk":-1,"modRightFender":-1,"modSeats":-1,"modStruts":-1,"neonEnabled":[false,false,false,false],"wheelColor":156,"neonColor":[255,0,255],"modPlateHolder":-1,"modBackWheels":-1,"modAerials":-1,"modLivery":-1,"color1":67,"modDashboard":-1,"modHood":-1,"modEngine":-1,"modAPlate":-1,"modTurbo":false,"modShifterLeavers":-1,"modFender":-1,"modHorns":-1,"modFrontBumper":-1,"modBrakes":-1,"modVanityPlate":-1,"modTrimA":-1,"plateIndex":3,"modRearBumper":-1,"modSideSkirt":-1,"modDial":-1,"modFrontWheels":-1,"plate":"LSBR2","modAirFilter":-1,"tyreSmokeColor":[255,255,255],"health":989,"modArmor":-1,"modExhaust":-1,"windowTint":-1,"modDoorSpeaker":-1,"dirtLevel":9.0059814453125,"modSteeringWheel":-1,"model":1747439474,"modHydrolic":-1,"modArchCover":-1}', 1, 1),
	('society:ambulance', 'LSMC1', '{"color2":28,"modTrimB":-1,"modTransmission":-1,"modSpeakers":-1,"modGrille":-1,"modTank":-1,"modSuspension":-1,"modFrame":-1,"modSmokeEnabled":false,"modWindows":-1,"pearlescentColor":112,"modSpoilers":-1,"wheels":0,"modRoof":-1,"modOrnaments":-1,"modXenon":false,"modEngineBlock":-1,"modTrunk":-1,"modRightFender":-1,"modSeats":-1,"modStruts":-1,"neonEnabled":[false,false,false,false],"wheelColor":156,"neonColor":[255,0,255],"modPlateHolder":-1,"modBackWheels":-1,"modAerials":-1,"modLivery":-1,"color1":112,"modDashboard":-1,"modHood":-1,"modEngine":-1,"modAPlate":-1,"modTurbo":false,"modShifterLeavers":-1,"modFender":-1,"modHorns":-1,"modFrontBumper":-1,"modBrakes":-1,"modVanityPlate":-1,"modTrimA":-1,"plateIndex":4,"modRearBumper":-1,"modSideSkirt":-1,"modDial":-1,"modFrontWheels":-1,"plate":"LSMC1","modAirFilter":-1,"tyreSmokeColor":[255,255,255],"health":1000,"modArmor":-1,"modExhaust":-1,"windowTint":-1,"modDoorSpeaker":-1,"dirtLevel":6.1099791526794,"modSteeringWheel":-1,"model":1171614426,"modHydrolic":-1,"modArchCover":-1}', 1, 1),
	('society:ambulance', 'LSMC2', '{"color2":28,"modTrimB":-1,"modTransmission":-1,"modSpeakers":-1,"modGrille":-1,"modTank":-1,"modSuspension":-1,"modFrame":-1,"modSmokeEnabled":false,"modWindows":-1,"pearlescentColor":112,"modSpoilers":-1,"wheels":0,"modRoof":-1,"modOrnaments":-1,"modXenon":false,"modEngineBlock":-1,"modTrunk":-1,"modRightFender":-1,"modSeats":-1,"modStruts":-1,"neonEnabled":[false,false,false,false],"wheelColor":156,"neonColor":[255,0,255],"modPlateHolder":-1,"modBackWheels":-1,"modAerials":-1,"modLivery":-1,"color1":112,"modDashboard":-1,"modHood":-1,"modEngine":-1,"modAPlate":-1,"modTurbo":false,"modShifterLeavers":-1,"modFender":-1,"modHorns":-1,"modFrontBumper":-1,"modBrakes":-1,"modVanityPlate":-1,"modTrimA":-1,"plateIndex":4,"modRearBumper":-1,"modSideSkirt":-1,"modDial":-1,"modFrontWheels":-1,"plate":"LSMC2","modAirFilter":-1,"tyreSmokeColor":[255,255,255],"health":1000,"modArmor":-1,"modExhaust":-1,"windowTint":-1,"modDoorSpeaker":-1,"dirtLevel":6.1099791526794,"modSteeringWheel":-1,"model":1171614426,"modHydrolic":-1,"modArchCover":-1}', 1, 1),
	('society:ambulance', 'LSMC3', '{"color2":28,"modTrimB":-1,"modTransmission":-1,"modSpeakers":-1,"modGrille":-1,"modTank":-1,"modSuspension":-1,"modFrame":-1,"modSmokeEnabled":false,"modWindows":-1,"pearlescentColor":112,"modSpoilers":-1,"wheels":0,"modRoof":-1,"modOrnaments":-1,"modXenon":false,"modEngineBlock":-1,"modTrunk":-1,"modRightFender":-1,"modSeats":-1,"modStruts":-1,"neonEnabled":[false,false,false,false],"wheelColor":156,"neonColor":[255,0,255],"modPlateHolder":-1,"modBackWheels":-1,"modAerials":-1,"modLivery":-1,"color1":112,"modDashboard":-1,"modHood":-1,"modEngine":-1,"modAPlate":-1,"modTurbo":false,"modShifterLeavers":-1,"modFender":-1,"modHorns":-1,"modFrontBumper":-1,"modBrakes":-1,"modVanityPlate":-1,"modTrimA":-1,"plateIndex":4,"modRearBumper":-1,"modSideSkirt":-1,"modDial":-1,"modFrontWheels":-1,"plate":"LSMC3","modAirFilter":-1,"tyreSmokeColor":[255,255,255],"health":1000,"modArmor":-1,"modExhaust":-1,"windowTint":-1,"modDoorSpeaker":-1,"dirtLevel":6.1099791526794,"modSteeringWheel":-1,"model":1171614426,"modHydrolic":-1,"modArchCover":-1}', 1, 1),
	('society:ambulance', 'LSMC4', '{"neonEnabled":[false,false,false,false],"modBrakes":-1,"modVanityPlate":-1,"modDial":-1,"color2":111,"plate":"LSMC4","modXenon":false,"modAPlate":-1,"modWindows":-1,"modRoof":-1,"modTank":-1,"modSpeakers":-1,"modDoorSpeaker":-1,"model":469291905,"modExhaust":-1,"color1":111,"modAirFilter":-1,"modStruts":-1,"modFrontWheels":-1,"modTrunk":-1,"tyreSmokeColor":[255,255,255],"windowTint":-1,"modFender":-1,"modTrimB":-1,"dirtLevel":10.0,"modTrimA":-1,"modArchCover":-1,"modSideSkirt":-1,"modArmor":-1,"modRearBumper":-1,"modShifterLeavers":-1,"modRightFender":-1,"modFrontBumper":-1,"modHydrolic":-1,"modEngineBlock":-1,"modSpoilers":-1,"pearlescentColor":91,"modEngine":-1,"health":1000,"modTransmission":-1,"modHorns":-1,"modSeats":-1,"modAerials":-1,"modFrame":-1,"modPlateHolder":-1,"modGrille":-1,"plateIndex":4,"modSteeringWheel":-1,"modHood":-1,"modSuspension":-1,"wheelColor":111,"neonColor":[255,0,255],"wheels":3,"modOrnaments":-1,"modDashboard":-1,"modSmokeEnabled":false,"modLivery":-1,"modBackWheels":-1,"modTurbo":false}', 1, 1),
	('society:police', 'LSPD1', '{"modTrimA":-1,"modEngine":-1,"modTurbo":false,"modSeats":-1,"modFrontBumper":-1,"plate":"LSPD1","modBrakes":-1,"color2":134,"neonColor":[255,0,255],"modEngineBlock":-1,"modSideSkirt":-1,"modSmokeEnabled":false,"modArchCover":-1,"neonEnabled":[false,false,false,false],"modAPlate":-1,"modTrunk":-1,"modDoorSpeaker":-1,"modTank":-1,"modHydrolic":-1,"modFender":-1,"modBackWheels":-1,"modVanityPlate":-1,"modExhaust":-1,"modHood":-1,"modPlateHolder":-1,"modSteeringWheel":-1,"modShifterLeavers":-1,"modStruts":-1,"modDashboard":-1,"dirtLevel":6.0,"pearlescentColor":0,"modFrame":-1,"modFrontWheels":-1,"modAirFilter":-1,"modAerials":-1,"modTrimB":-1,"modRightFender":-1,"color1":134,"modSuspension":-1,"modRearBumper":-1,"modOrnaments":-1,"modArmor":-1,"model":2046537925,"health":1000,"modHorns":-1,"modLivery":-1,"wheelColor":156,"modDial":-1,"modSpoilers":-1,"modTransmission":-1,"modWindows":-1,"modGrille":-1,"modSpeakers":-1,"plateIndex":4,"modRoof":-1,"tyreSmokeColor":[255,255,255],"windowTint":-1,"wheels":1,"modXenon":false}', 1, 1),
	('society:police', 'LSPD2', '{"modTrimA":-1,"modEngine":-1,"modTurbo":false,"modSeats":-1,"modFrontBumper":-1,"plate":"LSPD2","modBrakes":-1,"color2":134,"neonColor":[255,0,255],"modEngineBlock":-1,"modSideSkirt":-1,"modSmokeEnabled":false,"modArchCover":-1,"neonEnabled":[false,false,false,false],"modAPlate":-1,"modTrunk":-1,"modDoorSpeaker":-1,"modTank":-1,"modHydrolic":-1,"modFender":-1,"modBackWheels":-1,"modVanityPlate":-1,"modExhaust":-1,"modHood":-1,"modPlateHolder":-1,"modSteeringWheel":-1,"modShifterLeavers":-1,"modStruts":-1,"modDashboard":-1,"dirtLevel":6.0,"pearlescentColor":0,"modFrame":-1,"modFrontWheels":-1,"modAirFilter":-1,"modAerials":-1,"modTrimB":-1,"modRightFender":-1,"color1":134,"modSuspension":-1,"modRearBumper":-1,"modOrnaments":-1,"modArmor":-1,"model":2046537925,"health":1000,"modHorns":-1,"modLivery":-1,"wheelColor":156,"modDial":-1,"modSpoilers":-1,"modTransmission":-1,"modWindows":-1,"modGrille":-1,"modSpeakers":-1,"plateIndex":4,"modRoof":-1,"tyreSmokeColor":[255,255,255],"windowTint":-1,"wheels":1,"modXenon":false}', 1, 1),
	('society:police', 'LSPD3', '{"modTrimA":-1,"modEngine":-1,"modTurbo":false,"modSeats":-1,"modFrontBumper":-1,"plate":"LSPD3","modBrakes":-1,"color2":0,"neonColor":[255,0,255],"modEngineBlock":-1,"modSideSkirt":-1,"modSmokeEnabled":false,"modArchCover":-1,"neonEnabled":[false,false,false,false],"modAPlate":-1,"modTrunk":-1,"modDoorSpeaker":-1,"modTank":-1,"modHydrolic":-1,"modFender":-1,"modBackWheels":-1,"modVanityPlate":-1,"modExhaust":-1,"modHood":-1,"modPlateHolder":-1,"modSteeringWheel":-1,"modShifterLeavers":-1,"modStruts":-1,"modDashboard":-1,"dirtLevel":4.0,"pearlescentColor":1,"modFrame":-1,"modFrontWheels":-1,"modAirFilter":-1,"modAerials":-1,"modTrimB":-1,"modRightFender":-1,"color1":111,"modSuspension":-1,"modRearBumper":-1,"modOrnaments":-1,"modArmor":-1,"model":1912215274,"health":1000,"modHorns":-1,"modLivery":-1,"wheelColor":156,"modDial":-1,"modSpoilers":-1,"modTransmission":-1,"modWindows":-1,"modGrille":-1,"modSpeakers":-1,"plateIndex":4,"modRoof":-1,"tyreSmokeColor":[255,255,255],"windowTint":-1,"wheels":0,"modXenon":false}', 1, 1),
	('society:police', 'LSPD4', '{"modTrimA":-1,"modEngine":-1,"modTurbo":false,"modSeats":-1,"modFrontBumper":-1,"plate":"LSPD4","modBrakes":-1,"color2":0,"neonColor":[255,0,255],"modEngineBlock":-1,"modSideSkirt":-1,"modSmokeEnabled":false,"modArchCover":-1,"neonEnabled":[false,false,false,false],"modAPlate":-1,"modTrunk":-1,"modDoorSpeaker":-1,"modTank":-1,"modHydrolic":-1,"modFender":-1,"modBackWheels":-1,"modVanityPlate":-1,"modExhaust":-1,"modHood":-1,"modPlateHolder":-1,"modSteeringWheel":-1,"modShifterLeavers":-1,"modStruts":-1,"modDashboard":-1,"dirtLevel":4.0,"pearlescentColor":1,"modFrame":-1,"modFrontWheels":-1,"modAirFilter":-1,"modAerials":-1,"modTrimB":-1,"modRightFender":-1,"color1":111,"modSuspension":-1,"modRearBumper":-1,"modOrnaments":-1,"modArmor":-1,"model":1912215274,"health":1000,"modHorns":-1,"modLivery":-1,"wheelColor":156,"modDial":-1,"modSpoilers":-1,"modTransmission":-1,"modWindows":-1,"modGrille":-1,"modSpeakers":-1,"plateIndex":4,"modRoof":-1,"tyreSmokeColor":[255,255,255],"windowTint":-1,"wheels":0,"modXenon":false}', 1, 1),
	('society:police', 'LSPD5', '{"modTrimA":-1,"modEngine":-1,"modTurbo":false,"modSeats":-1,"modFrontBumper":-1,"plate":"76BGW361","modBrakes":-1,"color2":0,"neonColor":[255,0,255],"modEngineBlock":-1,"modSideSkirt":-1,"modSmokeEnabled":false,"modArchCover":-1,"neonEnabled":[false,false,false,false],"modAPlate":-1,"modTrunk":-1,"modDoorSpeaker":-1,"modTank":-1,"modHydrolic":-1,"modFender":-1,"modBackWheels":-1,"modVanityPlate":-1,"modExhaust":-1,"modHood":-1,"modPlateHolder":-1,"modSteeringWheel":-1,"modShifterLeavers":-1,"modStruts":-1,"modDashboard":-1,"dirtLevel":3.0,"pearlescentColor":134,"modFrame":-1,"modFrontWheels":-1,"modAirFilter":-1,"modAerials":-1,"modTrimB":-1,"modRightFender":-1,"color1":7,"modSuspension":-1,"modRearBumper":-1,"modOrnaments":-1,"modArmor":-1,"model":-1973172295,"health":1000,"modHorns":-1,"modLivery":-1,"wheelColor":0,"modDial":-1,"modSpoilers":-1,"modTransmission":-1,"modWindows":-1,"modGrille":-1,"modSpeakers":-1,"plateIndex":4,"modRoof":-1,"tyreSmokeColor":[255,255,255],"windowTint":-1,"wheels":1,"modXenon":false}', 1, 1),
	('society:police', 'LSPD6', '{"modTrimA":-1,"modEngine":-1,"modTurbo":false,"modSeats":-1,"modFrontBumper":-1,"plate":"LSPD6","modBrakes":-1,"color2":1,"neonColor":[255,0,255],"modEngineBlock":-1,"modSideSkirt":-1,"modSmokeEnabled":false,"modArchCover":-1,"neonEnabled":[false,false,false,false],"modAPlate":-1,"modTrunk":-1,"modDoorSpeaker":-1,"modTank":-1,"modHydrolic":-1,"modFender":-1,"modBackWheels":-1,"modVanityPlate":-1,"modExhaust":-1,"modHood":-1,"modPlateHolder":-1,"modSteeringWheel":-1,"modShifterLeavers":-1,"modStruts":-1,"modDashboard":-1,"dirtLevel":8.0,"pearlescentColor":134,"modFrame":-1,"modFrontWheels":-1,"modAirFilter":-1,"modAerials":-1,"modTrimB":-1,"modRightFender":-1,"color1":111,"modSuspension":-1,"modRearBumper":-1,"modOrnaments":-1,"modArmor":-1,"model":-34623805,"health":1000,"modHorns":-1,"modLivery":-1,"wheelColor":156,"modDial":-1,"modSpoilers":-1,"modTransmission":-1,"modWindows":-1,"modGrille":-1,"modSpeakers":-1,"plateIndex":4,"modRoof":-1,"tyreSmokeColor":[255,255,255],"windowTint":-1,"wheels":6,"modXenon":false}', 1, 1),
	('society:police', 'LSPD7', '{"modTrimA":-1,"modEngine":-1,"modTurbo":false,"modSeats":-1,"modFrontBumper":-1,"plate":"LSPD7","modBrakes":-1,"color2":1,"neonColor":[255,0,255],"modEngineBlock":-1,"modSideSkirt":-1,"modSmokeEnabled":false,"modArchCover":-1,"neonEnabled":[false,false,false,false],"modAPlate":-1,"modTrunk":-1,"modDoorSpeaker":-1,"modTank":-1,"modHydrolic":-1,"modFender":-1,"modBackWheels":-1,"modVanityPlate":-1,"modExhaust":-1,"modHood":-1,"modPlateHolder":-1,"modSteeringWheel":-1,"modShifterLeavers":-1,"modStruts":-1,"modDashboard":-1,"dirtLevel":8.0,"pearlescentColor":134,"modFrame":-1,"modFrontWheels":-1,"modAirFilter":-1,"modAerials":-1,"modTrimB":-1,"modRightFender":-1,"color1":111,"modSuspension":-1,"modRearBumper":-1,"modOrnaments":-1,"modArmor":-1,"model":-34623805,"health":1000,"modHorns":-1,"modLivery":-1,"wheelColor":156,"modDial":-1,"modSpoilers":-1,"modTransmission":-1,"modWindows":-1,"modGrille":-1,"modSpeakers":-1,"plateIndex":4,"modRoof":-1,"tyreSmokeColor":[255,255,255],"windowTint":-1,"wheels":6,"modXenon":false}', 1, 1),
	('society:police', 'LSPD8', '{"modTrimA":-1,"modEngine":-1,"modTurbo":false,"modSeats":-1,"modFrontBumper":-1,"plate":"284PQW215","modBrakes":-1,"color2":0,"neonColor":[255,0,255],"modEngineBlock":-1,"modSideSkirt":-1,"modSmokeEnabled":false,"modArchCover":-1,"neonEnabled":[false,false,false,false],"modAPlate":-1,"modTrunk":-1,"modDoorSpeaker":-1,"modTank":-1,"modHydrolic":-1,"modFender":-1,"modBackWheels":-1,"modVanityPlate":-1,"modExhaust":-1,"modHood":-1,"modPlateHolder":-1,"modSteeringWheel":-1,"modShifterLeavers":-1,"modStruts":-1,"modDashboard":-1,"dirtLevel":3.0,"pearlescentColor":6,"modFrame":-1,"modFrontWheels":-1,"modAirFilter":-1,"modAerials":-1,"modTrimB":-1,"modRightFender":-1,"color1":1,"modSuspension":-1,"modRearBumper":-1,"modOrnaments":-1,"modArmor":-1,"model":382057582,"health":1000,"modHorns":-1,"modLivery":-1,"wheelColor":156,"modDial":-1,"modSpoilers":-1,"modTransmission":-1,"modWindows":-1,"modGrille":-1,"modSpeakers":-1,"plateIndex":4,"modRoof":-1,"tyreSmokeColor":[255,255,255],"windowTint":-1,"wheels":7,"modXenon":false}', 1, 1),
	('society:police', 'LSPDRS', '{"modTrimA":-1,"modEngine":-1,"modTurbo":false,"modSeats":-1,"modFrontBumper":-1,"plate":"LSPDRS","modBrakes":-1,"color2":64,"neonColor":[255,0,255],"modEngineBlock":-1,"modSideSkirt":-1,"modSmokeEnabled":false,"modArchCover":-1,"neonEnabled":[false,false,false,false],"modAPlate":-1,"modTrunk":-1,"modDoorSpeaker":-1,"modTank":-1,"modHydrolic":-1,"modFender":-1,"modBackWheels":-1,"modVanityPlate":-1,"modExhaust":-1,"modHood":-1,"modPlateHolder":-1,"modSteeringWheel":-1,"modShifterLeavers":-1,"modStruts":-1,"modDashboard":-1,"dirtLevel":8.0,"pearlescentColor":70,"modFrame":-1,"modFrontWheels":-1,"modAirFilter":-1,"modAerials":-1,"modTrimB":-1,"modRightFender":-1,"color1":64,"modSuspension":-1,"modRearBumper":-1,"modOrnaments":-1,"modArmor":-1,"model":1874137519,"health":1000,"modHorns":-1,"modLivery":-1,"wheelColor":158,"modDial":-1,"modSpoilers":-1,"modTransmission":-1,"modWindows":-1,"modGrille":-1,"modSpeakers":-1,"plateIndex":4,"modRoof":-1,"tyreSmokeColor":[255,255,255],"windowTint":-1,"wheels":0,"modXenon":false}', 1, 1),
	('society:taxi', 'TAXI1', '{"modGrille":-1,"modArchCover":-1,"neonEnabled":[false,false,false,false],"modArmor":-1,"plateIndex":0,"health":1000,"modLivery":-1,"modDashboard":-1,"modFrontBumper":-1,"windowTint":-1,"modHorns":-1,"modOrnaments":-1,"modEngine":1,"modFrontWheels":-1,"modPlateHolder":-1,"modWindows":-1,"tyreSmokeColor":[255,255,255],"modSteeringWheel":-1,"modShifterLeavers":-1,"modAerials":-1,"color1":1,"wheels":0,"modRightFender":-1,"modTransmission":-1,"modDoorSpeaker":-1,"modFender":-1,"wheelColor":156,"modSeats":-1,"modHydrolic":-1,"modRearBumper":-1,"modSpoilers":-1,"modSuspension":-1,"modBackWheels":-1,"model":-956048545,"modTrimA":-1,"modXenon":false,"modFrame":-1,"plate":"TAXI1","modTrimB":-1,"pearlescentColor":42,"modSpeakers":-1,"dirtLevel":0.015983210876584,"color2":42,"modHood":-1,"modTank":-1,"modDial":-1,"modExhaust":-1,"modSideSkirt":-1,"modEngineBlock":-1,"modSmokeEnabled":1,"modTrunk":-1,"modAirFilter":-1,"modStruts":-1,"modBrakes":-1,"modTurbo":false,"modAPlate":-1,"neonColor":[255,0,255],"modRoof":-1,"modVanityPlate":-1}', 1, 1),
	('society:taxi', 'TAXI2', '{"modGrille":-1,"modArchCover":-1,"neonEnabled":[false,false,false,false],"modArmor":-1,"plateIndex":0,"health":1000,"modLivery":-1,"modDashboard":-1,"modFrontBumper":-1,"windowTint":-1,"modHorns":-1,"modOrnaments":-1,"modEngine":1,"modFrontWheels":-1,"modPlateHolder":-1,"modWindows":-1,"tyreSmokeColor":[255,255,255],"modSteeringWheel":-1,"modShifterLeavers":-1,"modAerials":-1,"color1":1,"wheels":0,"modRightFender":-1,"modTransmission":-1,"modDoorSpeaker":-1,"modFender":-1,"wheelColor":156,"modSeats":-1,"modHydrolic":-1,"modRearBumper":-1,"modSpoilers":-1,"modSuspension":-1,"modBackWheels":-1,"model":-956048545,"modTrimA":-1,"modXenon":false,"modFrame":-1,"plate":"TAXI2","modTrimB":-1,"pearlescentColor":42,"modSpeakers":-1,"dirtLevel":0.015983210876584,"color2":42,"modHood":-1,"modTank":-1,"modDial":-1,"modExhaust":-1,"modSideSkirt":-1,"modEngineBlock":-1,"modSmokeEnabled":1,"modTrunk":-1,"modAirFilter":-1,"modStruts":-1,"modBrakes":-1,"modTurbo":false,"modAPlate":-1,"neonColor":[255,0,255],"modRoof":-1,"modVanityPlate":-1}', 1, 1),
	('society:taxi', 'TAXI3', '{"modGrille":-1,"modArchCover":-1,"neonEnabled":[false,false,false,false],"modArmor":-1,"plateIndex":0,"health":1000,"modLivery":-1,"modDashboard":-1,"modFrontBumper":-1,"windowTint":-1,"modHorns":-1,"modOrnaments":-1,"modEngine":1,"modFrontWheels":-1,"modPlateHolder":-1,"modWindows":-1,"tyreSmokeColor":[255,255,255],"modSteeringWheel":-1,"modShifterLeavers":-1,"modAerials":-1,"color1":1,"wheels":0,"modRightFender":-1,"modTransmission":-1,"modDoorSpeaker":-1,"modFender":-1,"wheelColor":156,"modSeats":-1,"modHydrolic":-1,"modRearBumper":-1,"modSpoilers":-1,"modSuspension":-1,"modBackWheels":-1,"model":-956048545,"modTrimA":-1,"modXenon":false,"modFrame":-1,"plate":"TAXI3","modTrimB":-1,"pearlescentColor":42,"modSpeakers":-1,"dirtLevel":0.015983210876584,"color2":42,"modHood":-1,"modTank":-1,"modDial":-1,"modExhaust":-1,"modSideSkirt":-1,"modEngineBlock":-1,"modSmokeEnabled":1,"modTrunk":-1,"modAirFilter":-1,"modStruts":-1,"modBrakes":-1,"modTurbo":false,"modAPlate":-1,"neonColor":[255,0,255],"modRoof":-1,"modVanityPlate":-1}', 1, 1);
/*!40000 ALTER TABLE `owned_vehicles` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
