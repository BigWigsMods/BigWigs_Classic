local L = BigWigs:NewBossLocale("Majordomo Executus", "deDE")
if not L then return end
if L then
	L.disabletrigger = "Haltet ein, Sterbliche"
	--L.power_next = "Next Power"
end

L = BigWigs:NewBossLocale("Ragnaros Classic", "deDE")
if L then
	L.submerge_trigger = "KOMMT HERBEI, MEINE DIENER"
	L.engage_trigger = "NUN ZU EUCH, INSEKTEN"

	L.submerge = "Untertauchen"
	L.submerge_desc = "Warnt, wenn Ragnaros untertaucht."
	L.submerge_message = "Ragnaros untergetaucht für 90 sek!"
	L.submerge_bar = "Untertauchen"

	L.emerge = "Auftauchen"
	L.emerge_desc = "Warnt, wenn Ragnaros auftaucht."
	L.emerge_message = "Ragnaros aufgetaucht! Untertauchen in 3 min!"
	L.emerge_bar = "Auftauchen"
end
