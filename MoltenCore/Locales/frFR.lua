
local L = BigWigs:NewBossLocale("Gehennas", "frFR")
if L then
	L.curse_warning = "5 sec. avant Malédiction de Gehennas !"
	L.fire_you = "Pluie de feu sur VOUS !"
end

L = BigWigs:NewBossLocale("Lucifron", "frFR")
if L then
	L.curse_warn = "5 sec. avant Malédiction de Lucifron !"
	L.doom_warn = "5 sec. avant Malédiction imminente !"
	L.mc_bar = "CM : %s"
end

L = BigWigs:NewBossLocale("Majordomo Executus", "frFR")
if L then
	L.disabletrigger = "Impossible ! Arrêtez votre attaque, mortels... Je me rends ! Je me rends !"
	L.warn = "5 sec. avant Bouclier/Renvoi !"
end

L = BigWigs:NewBossLocale("Ragnaros", "frFR")
if L then
	L.knockback_trigger = "^GOÛTEZ "
	L.submerge_trigger = "^VENEZ, MES SERVITEURS"
	L.engage_trigger = "^ET MAINTENANT"

	L.knockback = "Projection de zone"
	L.knockback_desc = "Préviens de l'arrivée des Projections de zone."
	L.knockback_message = "Projection de zone !"
	L.knockback_bar = "Projection de zone"

	L.submerge = "Immersion"
	L.submerge_desc = "Préviens quand Ragnaros plonge et l'arrivée des Fils des flammes."
	L.submerge_message = "Ragnaros intouchable pendant 90 sec. Arrivée des Fils des flammes !"
	L.submerge_bar = "Départ de Ragnaros"

	L.emerge = "Émergence"
	L.emerge_desc = "Préviens quand Ragnaros émerge."
	L.emerge_message = "Ragnaros en surface, 3 min. avant immersion !"
	L.emerge_bar = "Retour de Ragnaros"
end

