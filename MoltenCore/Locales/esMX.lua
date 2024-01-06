local L = BigWigs:NewBossLocale("Majordomo Executus", "esMX")
if not L then return end
if L then
	--L.disabletrigger = "Impossible! Stay your attack, mortals... I submit! I submit!"
	L.power_next = "Próximo Escudo"
end

L = BigWigs:NewBossLocale("Ragnaros Classic", "esMX")
if L then
	--L.engage_trigger = "NOW FOR YOU,"
	L.submerge_trigger = "¡AVANCEN, MIS SIRVIENTES!"

	L.submerge = "Sumersión"
	L.submerge_desc = "Anuncia la sumersión de Ragnaros."
	L.submerge_message = "¡Ragnaros se sumerge durante 90 seg!"
	L.submerge_bar = "Sumersión"

	L.emerge = "Emersión"
	L.emerge_desc = "Anuncia la emersión de Ragnaros."
	L.emerge_message = "¡Ragnaros se emergió, 3 minutos hasta que se sumerge!"
	L.emerge_bar = "Emersión"
end
