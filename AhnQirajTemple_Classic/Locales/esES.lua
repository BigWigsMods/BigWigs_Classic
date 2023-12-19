local L = BigWigs:NewBossLocale("Viscidus", "esES")
if not L then return end
if L then
	L.freeze = "Congelación"
	L.freeze_desc = "Anunciar los estados de congelación"

	L.freeze_trigger1 = "comienza a remitir!"
	L.freeze_trigger2 = "se queda inmóvil!"
	L.freeze_trigger3 = "está paralizada!"
	L.freeze_trigger4 = "empieza a desmoronarse!"
	L.freeze_trigger5 = "parece a punto de hacerse añicos!"

	L.freeze_warn1 = "¡Primera fase de congelación!"
	L.freeze_warn2 = "¡Segunda fase de congelación!"
	L.freeze_warn3 = "¡Viscidus está paralizada!"
	L.freeze_warn4 = "Desmoronándose - ¡sigue adelante!"
	L.freeze_warn5 = "Desmoronándose - ¡casi llegamos!"
	L.freeze_warn_melee = "%d golpes físicos - faltan %d más"
	L.freeze_warn_frost = "%d golpes de escarcha - faltan %d más"
end

L = BigWigs:NewBossLocale("Ouro", "esES")
if L then
	L.engage_message = "¡Ouro comenzado! Inmersión posible en 90 seg!"

	L.emerge = "Emersión"
	L.emergewarn = "¡15 segundos hasta posible inmersión!"
	L.emergewarn2 = "¡15 segundos hasta la inmersión de Ouro!"
	L.emergebartext = "Inmersión"

	L.submerge = "Inmersión"
	L.possible_submerge_bar = "Inmersión posible"

	L.scarab = "Desaparición de escarabajos"
	L.scarab_desc = "Anunciar desaparición de escarabajos."
	L.scarabdespawn = "Escarabajos desaparecerán en 10 segundos"
	L.scarabbar = "Desaparición de escarabajos"
end

L = BigWigs:NewBossLocale("C'Thun", "esES")
if L then
	L.tentacle = "Tentáculos"
	L.tentacle_desc = "Anuncia cuando aparezcan tentáculos"

	L.giant = "Anunciar tentáculo ocular gigante"
	L.giant_desc = "Anuncia cuando aparezca un tentáculo ocular gigante"

	L.weakened = "Anunciar debilidad"
	L.weakened_desc = "Anuncia la debilidad de C'Thun"

	L.weakenedtrigger = "%s está débil!"

	L.weakened_msg = "C'Thun queda debilitado durante 45 segundos"
	L.invulnerable2 = "C'Thun es invulnerable en 5 segundos"
	L.invulnerable1 = "C'Thun es invulnerable"

	L.giant3 = "Tentáculo ocular gigante - 10 seg"
	L.giant2 = "Tentáculo ocular gigante - 5 seg"
	L.giant1 = "Tentáculo ocular gigante - ¡mátalo!"

	L.startwarn = "¡C'Thun comenzado! - 45 seg hasta mirada oscura y tentáculos oculares"

	L.tentacleParty = "¡Un montón de tentáculos!"
	L.barWeakened = "¡C'Thun está débil!"
	L.barGiant = "¡Tentáculo ocular gigante!"

	L.groupwarning = "Mirada oscura al grupo %s (%s)"
	L.phase2starting = "¡Ojo de C'Thun está muerto! Prepárense!"
end

L = BigWigs:NewBossLocale("Ahn'Qiraj Trash", "esES")
if L then
	L.anubisath = "Anubisath"
	L.sentinel = "Centinela Anubisath"
	L.defender = "Defensor Anubisath"
	L.crawler = "Reptador de la colmena Vekniss"
end
