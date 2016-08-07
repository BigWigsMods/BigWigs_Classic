local L = BigWigs:NewBossLocale("Moam", "frFR")
if not L then return end
if L then
	L.starttrigger = "%s sent votre peur."
end

L = BigWigs:NewBossLocale("Ossirian the Unscarred", "frFR")
if L then
	L.debuff = "Affaiblissements"
	L.debuff_desc = "Préviens quand Ossirian est affaibli face à certaines écoles de magie."
end

L = BigWigs:NewBossLocale("General Rajaxx", "frFR")
if L then
	L.wave = "Vagues"
	L.wave_desc = "Préviens de l'arrivée des vagues."

	L.trigger1 = "Ils arrivent. Essayez de ne pas vous faire tuer, bleusaille."
	--L.trigger2 = "?????"
	L.trigger3 = "L’heure de notre vengeance sonne enfin ! Que les ténèbres règnent dans le coeur de nos ennemis !"
	L.trigger4 = "C’en est fini d’attendre derrière des portes fermées et des murs de pierre ! Nous ne serons pas privés de notre vengeance ! Les dragons eux-mêmes trembleront devant notre courroux !"
	L.trigger5 = "La peur est pour l’ennemi ! La peur et la mort !"
	L.trigger6 = "Staghelm pleurnichera pour avoir la vie sauve, comme l’a fait son morveux de fils ! En ce jour, mille ans d’injustice s’achèvent !"
	L.trigger7 = "Fandral ! Ton heure est venue ! Va te cacher dans le Rêve d’Emeraude, et prie pour que nous ne te trouvions jamais !"
	L.trigger8 = "Imbécile imprudent ! Je vais te tuer moi-même !"
	L.trigger9 = "Alors, Rajaxx, tu te souviens que j’avais dit que je te tuerais le dernier ?"

	L.warn1 = "Vague 1/8"
	L.warn2 = "Vague 2/8"
	L.warn3 = "Vague 3/8"
	L.warn4 = "Vague 4/8"
	L.warn5 = "Vague 5/8"
	L.warn6 = "Vague 6/8"
	L.warn7 = "Vague 7/8"
	L.warn8 = "Le général Rajaxx arrive !"
	L.warn9 = "Vague 1/8" -- trigger for starting the event by pulling the first wave instead of talking to andorov
end

L = BigWigs:NewBossLocale("Ruins of Ahn'Qiraj Trash", "frFR")
if L then
	--L.guardian = "Anubisath Guardian"
end

