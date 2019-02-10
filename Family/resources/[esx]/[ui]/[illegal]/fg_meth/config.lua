Config.DrawDistance           = 100.0
Config.PoliceNeeded           = 2

Config.PayeType = 3 -- [1 = Cash , 2 = Banque , 3 = Argent Sale]
-- 	------------- CASH
-- Config.PayeCashItem = "$ de Cash"
-- Config.PayeCashMessage = "Vous avez reçu"
-- 	------------- Banque
-- Config.PayeBankItem = "$ en Banque"
-- Config.PayeBankMessage = "Vous avez reçu"
-- 	------------- Argent Sale
-- Config.PayeDirtyItem = "$ d'Argent Sale"
-- Config.PayeDirtyMessage = "Vous avez reçu"

Config.PoliceJob = 'police'

Config.Zones = {

  Recolte = {
		Pos   = {x = 1397.0594, y = 3627.8349, z = 33.9000},
		Size  = {x = 3.5, y = 3.5, z = 1.0},
		Color = {r = 204, g = 204, b = 0},
		Type  = -1,
		messagePolice = 'Vous avez trouvé un point pour récolter de ~r~stupefiant~s~ !',
		ItemTime = 2000,
		ItemDb_name = "methamphetamine",
		ItemName = "Méthamphétamine",
		ItemMax = 100,
		ItemAdd = 1,
		ItemRemove = 1,
		ItemRequires = "nothing",
		ItemRequires_name = "nothing",
		ItemDrop = 100,
		ItemPrice  = 0,
	},

  Vente = {
		Pos   = {x = -442.0230, y = -2179.2907, z = 9.3198},
		Size  = {x = 9.0, y = 9.0, z = 0.2},
		Color = {r = 204, g = 204, b = 0},
		Type  = -1,
		hint  = 'Appuyez sur ~INPUT_CONTEXT~ pour vendre la ~r~Méthamphétamine',
		ItemTime = 2000,
		ItemDb_name = "nothing",
		ItemName = "nothing",
		ItemMax = 100,
		ItemAdd = 1,
		ItemRemove = 1,
		ItemRequires = "methamphetamine",
		ItemRequires_name = "Méthamphétamine",
		ItemDrop = 100,
		ItemPrice  = 253,
		messagePolice = 'Vous avez trouvé un point de vente de ~r~stupefiant~s~ !',
	},
}

Config.Text = {

	NeedVehicle = '~b~Methylamine~w~, un labo mobile à la breaking bad, tu connais?',
	BadVehicle = '~o~Ce véhicule ne va pas faire l\'affaire, trouve autre chose!',
	ChargementVehicle = 'Chargement en ~g~Methylamine ~w~ en cours..',
	ChargementFullVehicle = '~r~Véhicule plein!',
	TransformToMeth = 'Fabrication de ~g~Méthamphétamine ~w~en cours..',
	VehicleVide = '~r~Votre véhicule est vide!',
	HelpFullVehicle1 = '~m~~o~Il est temps de passer au traitement',
	HelpFullVehicle2 = 'Rendez-vous dans un endroit ~r~sécurisé',
	HelpFullVehicle3 = 'Commencez le traitement avec ~g~Y',
	speed = 'Vous devez être a l\'arret !'

}