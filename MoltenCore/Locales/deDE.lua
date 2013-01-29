
local L = BigWigs:NewBossLocale("Lucifron", "deDE")
if L then
	L.mc_bar = "MC: %s"
end

L = BigWigs:NewBossLocale("Majordomo Executus", "deDE")
if L then
	L.disabletrigger = "Haltet ein, Sterbliche"
	L.warn = "Magie in 5 sek!"
end

L = BigWigs:NewBossLocale("Ragnaros", "deDE")
if L then
	L.knockback_trigger = "SPÜRT DIE FLAMMEN"
	L.submerge_trigger = "KOMMT HERBEI, MEINE DIENER"
	L.engage_trigger = "NUN ZU EUCH, INSEKTEN"

	L.knockback = "Knockback"
	L.knockback_desc = "Warnt, wenn Ragnaros seinen AoE Knockback wirkt."
	L.knockback_message = "Knockback!"
	L.knockback_bar = "Knockback"

	L.submerge = "Untertauchen"
	L.submerge_desc = "Warnt, wenn Ragnaros untertaucht."
	L.submerge_message = "Ragnaros untergetaucht für 90 sek!"
	L.submerge_bar = "Untertauchen"

	L.emerge = "Auftauchen"
	L.emerge_desc = "Warnt, wenn Ragnaros auftaucht."
	L.emerge_message = "Ragnaros aufgetaucht! Untertauchen in 3 min!"
	L.emerge_bar = "Auftauchen"
end

