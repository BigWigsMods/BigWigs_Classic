local L = BigWigs:NewBossLocale("Razorgore the Untamed", "esES")
if not L then return end
if L then
	L.start_trigger = "¡Tenemos intrusos en El Criadero!"

	L.eggs = "Contar huevos"
	L.eggs_desc = "Cuenta los huevos destruídos."
	L.eggs_message = "¡%d/30 huevos destruídos!"
end

L = BigWigs:NewBossLocale("Vaelastrasz the Corrupt", "esES")
if L then
	L.warmup_trigger = "¡Demasiado tarde, amigos!"
	--L.tank_bomb = "Tank Bomb"
end

L = BigWigs:NewBossLocale("Chromaggus", "esES")
if L then
	L.breath = "Alientos"
	L.breath_desc = "Anuncia los alientos."

	L.debuffs_message = "¡3/5 perjuicios, ten cuidado!"
	L.debuffs_warning = "¡4/5 perjuicios, %s al 5to!"
end

L = BigWigs:NewBossLocale("Nefarian Classic", "esES")
if L then
	L.landing_soon_trigger = "Bien hecho, esbirros."
	--L.stage2_yell_trigger = "BURN! You wretches"
	L.stage3_yell_trigger = "¡Imposible! ¡Levantaos, esbirros!"

	L.shaman_class_call_yell_trigger = "Chamanes"
	L.warlock_class_call_yell_trigger = "Brujos"
	L.hunter_class_call_yell_trigger = "Cazadores"
	L.mage_class_call_yell_trigger = "Magos"
	--L.deathknight_class_call_yell_trigger = "Death Knights"
	--L.monk_class_call_yell_trigger = "Monks"

	L.warnshaman = "¡Chamanes - aparecen tótems!"
	L.warndruid = "¡Druidas - atrapado en forma felina!"
	L.warnwarlock = "¡Brujos - infernales entrantes!"
	L.warnpriest = "¡Sacerfotes - sanaciones hacen daño!"
	L.warnhunter = "¡Cazadores - armas están rotos!"
	L.warnwarrior = "¡Guerreros - atrapado en actitud rabiosa!"
	L.warnrogue = "¡Pícaros - teletransportado y enredado!"
	L.warnpaladin = "¡Paladines - bendición de protección!"
	L.warnmage = "¡Magos - polimorfias entrantes!"
	--L.warndeathknight = "Death Knights - Death Grip"
	--L.warnmonk = "Monks - Stuck Rolling"
	--L.warndemonhunter = "Demon Hunters - Blinded"

	L.classcall = "Llamada de clase"
	L.classcall_desc = "Anucia las llamadas de clase."

	L.add = "Muertes de dracónidos"
	L.add_desc = "Anuncia el número de dracónidos muertos en fase 1 antes del aterrizaje de Nefarian."
end
