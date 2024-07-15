local L = BigWigs:NewBossLocale("Ragnaros Classic", "deDE")
if not L then return end
if L then
	L.submerge_trigger = "KOMMT HERBEI, MEINE DIENER"

	L.submerge = "Untertauchen"
	L.submerge_desc = "Warnt, wenn Ragnaros untertaucht."
	L.submerge_message = "Ragnaros untergetaucht für 90 sek!"
	L.submerge_bar = "Untertauchen"

	L.emerge = "Auftauchen"
	L.emerge_desc = "Warnt, wenn Ragnaros auftaucht."
	L.emerge_message = "Ragnaros aufgetaucht! Untertauchen in 3 min!"
	L.emerge_bar = "Auftauchen"
end

L = BigWigs:NewBossLocale("The Molten Core", "deDE")
if L then
	--L.bossName = "The Molten Core"
end
