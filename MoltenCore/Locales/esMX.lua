local L = BigWigs:NewBossLocale("Ragnaros Classic", "esMX")
if not L then return end
if L then
	L.submerge_trigger = "¡AVANCEN, MIS SIRVIENTES!"

	L.submerge = "Sumersión"
	L.submerge_desc = "Anuncia la sumersión de Ragnaros."
	L.submerge_message = "¡Ragnaros se sumerge durante 90 seg!"
	L.submerge_bar = "Sumersión"

	L.emerge = "Emersión"
	L.emerge_desc = "Anuncia la emersión de Ragnaros."
	L.emerge_message = "¡Ragnaros se emergió, 3 minutos hasta que se sumerge!"
	L.emerge_bar = "Emersión"

	L.son = "Hijo de la llama" -- NPC ID 12143
end

L = BigWigs:NewBossLocale("The Molten Core", "esMX")
if L then
	--L.bossName = "The Molten Core"
end
