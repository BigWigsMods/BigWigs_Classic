local L = BigWigs:NewBossLocale("Razorgore the Untamed", "esMX")
if not L then return end
if L then
	L.start_trigger = "¡Los invasores han penetrado en El Criadero!"
	L.start_message = "¡Sangrevaja el Indomable comenzado! Esbirros en 45 seg!"
	L.start_soon = "¡Esbirros en 5 seg!"
	L.start_mob = "Esbirros aparecen"

	L.eggs = "Contar huevos"
	L.eggs_desc = "Cuenta los huevos destruídos."
	L.eggs_message = "¡%d/30 huevos destruídos!"

	L.phase2_message = "huyen mientras se consume el poder del orbe."
end

L = BigWigs:NewBossLocale("Vaelastrasz the Corrupt", "esMX")
if L then
	L.warmup_trigger = "¡Demasiado tarde, amigos!"
end

L = BigWigs:NewBossLocale("Chromaggus", "esMX")
if L then
	L.breath = "Alientos"
	L.breath_desc = "Anuncia los alientos."

	L.debuffs_message = "¡3/5 perjuicios, ten cuidado!"
	L.debuffs_warning = "¡4/5 perjuicios, %s al 5to!"
end

L = BigWigs:NewBossLocale("Nefarian ", "esMX")
if L then
	L.landing_soon_trigger = "Bien hecho, mis esbirros"
	--L.landing_trigger = "BURN! You wretches"
	L.zerg_trigger = "¡Imposible! ¡Levántense, mis esbirros!"

	L.triggershamans = "Chamanes"
	L.triggerwarlock = "Brujos"
	L.triggerhunter = "Cazadores"
	L.triggermage = "Magos"
	L.triggerdeathknight = "Caballeros de la Muerte"
	L.triggermonk = "Monjes"

	L.landing_soon_warning = "¡Nefarian está aterrizando en 10 segundos!"
	L.landing_warning = "¡Nefarian está aterrizando!"
	L.zerg_warning = "¡Esbirros entrantes!"
	L.classcall_warning = "¡Llamada de clase entrante!"

	L.warnshaman = "¡Chamanes - aparecen tótems!"
	L.warndruid = "¡Druidas - atrapado en forma felina!"
	L.warnwarlock = "¡Brujos - infernales entrantes!"
	L.warnpriest = "¡Sacerfotes - sanaciones hacen daño!"
	L.warnhunter = "¡Cazadores - armas están rotos!"
	L.warnwarrior = "¡Guerreros - atrapado en actitud rabiosa!"
	L.warnrogue = "¡Pícaros - teletransportado y enredado!"
	L.warnpaladin = "¡Paladines - Bendición de protección!"
	L.warnmage = "¡Magos - polimorfias entrantes!"
	--L.warndeathknight = "Death Knights - Death Grip"
	--L.warnmonk = "Monks - Stuck Rolling"
	--L.warndemonhunter = "Demon Hunters - Blinded"

	L.classcall_bar = "Llamada de clase"

	L.classcall = "Llamada de clase"
	L.classcall_desc = "Anucia las llamadas de clase."

	L.otherwarn = "Aterrizaje y esbirros"
	L.otherwarn_desc = "Anuncia el aterrizaje y esbirros de Nefarian."
end

