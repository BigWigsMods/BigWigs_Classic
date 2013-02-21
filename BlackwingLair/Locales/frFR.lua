local L = BigWigs:NewBossLocale("Razorgore the Untamed", "frFR")
if not L then return end
if L then
	L.start_trigger = "Sonnez l'alarme"
	L.start_message = "Tranchetripe engagé ! Gardes dans 45 sec. !"
	L.start_soon = "Arrivée des gardes dans 5 sec. !"
	L.start_mob = "Arrivée des gardes"

	L.eggs = "Comptage des œufs"
	L.eggs_desc = "Compte le nombre d'œufs détruits."
	L.eggs_message = "%d/30 œuf(s) détruit(s) !"

	L.phase2_message = "Tous les œufs ont été détruits !"
end

L = BigWigs:NewBossLocale("Nefarian", "frFR")
if L then
	L.landing_soon_trigger = "Beau travail"
	L.landing_trigger = "BRÛLEZ, misérables"
	L.zerg_trigger = "C'est impossible ! Relevez%-vous, serviteurs !"

	L.triggershamans = "Chamans, montrez moi"
	L.triggerdruid = "Les druides et leur stupides"
	L.triggerwarlock = "Démonistes, vous ne devriez pas jouer"
	L.triggerpriest = "Prêtres ! Si vous continuez"
	L.triggerhunter = "Ah, les chasseurs et les stupides"
	L.triggerwarrior = "Guerriers, je sais que vous pouvez frapper plus fort"
	L.triggerrogue = "Voleurs, arrêtez de vous cacher"
	L.triggerpaladin = "Les paladins"
	L.triggermage = "Les mages aussi"
	L.triggerdeathknight = "Chevalier de la mort"
	--L.triggermonk = "Monks,"

	L.landing_soon_warning = "Nefarian atterit dans 10 sec. !"
	L.landing_warning = "Nefarian atterit !"
	L.zerg_warning = "Zerg imminent !"
	L.fear_warning = "Peur dans 2 sec. !"
	L.fear_soon_warning = "Peur probable dans ~5 sec."
	L.shadowflame_warning = "Arrivée de la Flamme d'ombre !"
	L.classcall_warning = "Arrivée de l'appel des classes !"

	L.warnshaman = "Chamans - Totems posés !"
	L.warndruid = "Druides - Coincés en forme de félin !"
	L.warnwarlock = "Démonistes - Arrivée d'infernaux !"
	L.warnpriest = "Prêtre - Soins blessants !"
	L.warnhunter = "Chasseurs - Arcs/Fusils cassés !"
	L.warnwarrior = "Guerriers - Coincés en posture berseker !"
	L.warnrogue = "Voleurs - Téléportés et immobilisés !"
	L.warnpaladin = "Paladins - Bénédiction de protection !"
	L.warnmage = "Mages - Arrivée des métamorphoses !"

	L.classcall_bar = "Appel des classes"
	L.fear_bar = "Peur probable"

	L.shadowflame = "Flamme d'ombre"
	L.shadowflame_desc = "Préviens de l'arrivée de la Flamme d'ombre."

	L.fear = "Peur"
	L.fear_desc = "Préviens quand Nefarian incante sa peur de zone."

	L.classcall = "Appel de classe"
	L.classcall_desc = "Préviens de l'arrivée des appels de classe."

	L.otherwarn = "Atterissage et zerg"
	L.otherwarn_desc = "Préviens quand les Zergs arrivent et quand Nefarian atterit."
end

L = BigWigs:NewBossLocale("Chromaggus", "frFR")
if L then
	
end

