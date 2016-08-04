local L = BigWigs:NewBossLocale("Moam", "frFR")
if not L then return end
if L then
	--L.starttrigger = "%s senses your fear."
end

L = BigWigs:NewBossLocale("Ossirian the Unscarred", "frFR")
if L then
	--L.debuff = "Weakness"
	--L.debuff_desc = "Warn for various weakness types."
end

L = BigWigs:NewBossLocale("General Rajaxx", "frFR")
if L then
	wave = "Vagues",
	wave_desc = "Préviens de l'arrivée des vagues.",

	trigger1 = "Ils arrivent. Essayez de ne pas vous faire tuer, bleusaille.",
	-- trigger2 = "?????",
	trigger3 = "L’heure de notre vengeance sonne enfin ! Que les ténèbres règnent dans le coeur de nos ennemis !",
	trigger4 = "C’en est fini d’attendre derrière des portes fermées et des murs de pierre ! Nous ne serons pas privés de notre vengeance ! Les dragons eux-mêmes trembleront devant notre courroux !",
	trigger5 = "La peur est pour l’ennemi ! La peur et la mort !",
	trigger6 = "Staghelm pleurnichera pour avoir la vie sauve, comme l’a fait son morveux de fils ! En ce jour, mille ans d’injustice s’achèvent !",
	trigger7 = "Fandral ! Ton heure est venue ! Va te cacher dans le Rêve d’Emeraude, et prie pour que nous ne te trouvions jamais !",
	trigger8 = "Imbécile imprudent ! Je vais te tuer moi-même !",
	trigger9 = "Alors, Rajaxx, tu te souviens que j’avais dit que je te tuerais le dernier ?",

	warn1 = "Vague 1/8",
	warn2 = "Vague 2/8",
	warn3 = "Vague 3/8",
	warn4 = "Vague 4/8",
	warn5 = "Vague 5/8",
	warn6 = "Vague 6/8",
	warn7 = "Vague 7/8",
	warn8 = "Le général Rajaxx arrive !",
	warn9 = "Vague 1/8", -- trigger for starting the event by pulling the first wave instead of talking to andorov
end

L = BigWigs:NewBossLocale("Ruins of Ahn'Qiraj Trash", "frFR")
if L then
	--L.guardian = "Anubisath Guardian"
end

