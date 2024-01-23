local L = BigWigs:NewBossLocale("Razorgore the Untamed", "frFR")
if not L then return end
if L then
	L.start_trigger = "Sonnez l'alarme"

	L.eggs = "Comptage des œufs"
	L.eggs_desc = "Compte le nombre d'œufs détruits."
	L.eggs_message = "%d/30 œufs détruits"
end

L = BigWigs:NewBossLocale("Vaelastrasz the Corrupt", "frFR")
if L then
	L.warmup_trigger = "Trop tard, mes amis"
	--L.tank_bomb = "Tank Bomb"
end

L = BigWigs:NewBossLocale("Chromaggus", "frFR")
if L then
	L.breath = "Souffles"
	L.breath_desc = "Préviens de l'arrivée des souffles."

	--L.debuffs_message = "3/5 debuffs, carefull!"
	--L.debuffs_warning = "4/5 debuffs, %s on 5th!"

	L.vulnerability = "Changement de vulnérabilité"
	L.vulnerability_desc = "Préviens quand la vulnérabilité change."
	L.vulnerability_message = "Vulnerabilité : %s"
	L.detect_magic_missing = "Détection de la magie is missing from Chromaggus"
	L.detect_magic_warning = "A Mage must cast \124cff71d5ff\124Hspell:2855:0\124h[Détection de la magie]\124h\124r on Chromaggus for vulnerability warnings to work."
end

L = BigWigs:NewBossLocale("Nefarian Classic", "frFR")
if L then
	--L.engage_yell_trigger = "Let the games begin"
	L.landing_soon_trigger = "Beau travail"
	L.stage2_yell_trigger = "BRÛLEZ, misérables"
	L.stage3_yell_trigger = "C'est impossible"

	L.shaman_class_call_yell_trigger = "Chamans, montrez moi"
	L.deathknight_class_call_yell_trigger = "Chevalier de la mort"
	--L.monk_class_call_yell_trigger = "Monks"

	L.warnshaman = "Chamans - Totems posés !"
	L.warndruid = "Druides - Coincés en forme de félin !"
	L.warnwarlock = "Démonistes - Arrivée d'infernaux !"
	L.warnpriest = "Prêtre - Soins blessants !"
	L.warnhunter = "Chasseurs - Arcs/Fusils cassés !"
	L.warnwarrior = "Guerriers - Coincés en posture berseker !"
	L.warnrogue = "Voleurs - Téléportés et immobilisés !"
	L.warnpaladin = "Paladins - Bénédiction de protection !"
	L.warnmage = "Mages - Arrivée des métamorphoses !"
	--L.warndeathknight = "Death Knights - Death Grip"
	--L.warnmonk = "Monks - Stuck Rolling"
	--L.warndemonhunter = "Demon Hunters - Blinded"

	L.classcall = "Appel de classe"
	L.classcall_desc = "Préviens de l'arrivée des appels de classe."

	--L.add = "Drakonid deaths"
	--L.add_desc = "Announce the number of adds killed in Phase 1 before Nefarian lands."
end
