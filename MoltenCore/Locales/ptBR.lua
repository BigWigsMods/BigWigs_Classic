local L = BigWigs:NewBossLocale("Ragnaros Classic", "ptBR")
if not L then return end
if L then
	L.submerge_trigger = "VENHAM, MEUS SERVOS"

	L.submerge = "Submersão"
	L.submerge_desc = "Aviso para a submersão de Ragnaros."
	L.submerge_message = "Ragnaros fora por 90 seg!"
	L.submerge_bar = "Submersão"

	L.emerge = "Emersão"
	L.emerge_desc = "Aviso para a emersão de Ragnaros."
	L.emerge_message = "Ragnaros emergiu, 3 minutos até a submersão!"
	L.emerge_bar = "Emersão"

	L.son = "Filho das Chamas" -- NPC ID 12143
end

L = BigWigs:NewBossLocale("The Molten Core", "ptBR")
if L then
	--L.bossName = "The Molten Core"
end
