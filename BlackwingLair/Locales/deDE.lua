local L = BigWigs:NewBossLocale("Razorgore the Untamed", "deDE")
if not L then return end
if L then
	L.start_trigger = "Eindringlinge sind in die"
	L.start_message = "Razorgore angegriffen!"
	L.start_soon = "Mob Spawn in 5sec!"
	L.start_mob = "Mob Spawn"

	L.eggs = "Eier nicht z\195\164hlen"
	L.eggs_desc = "Die zerst\195\182rten Eier nicht z\195\164hlen."
	L.eggs_message = "%d/30 Eier zerst\195\182rt!"

	L.phase2_message = "Alle Eier zerst\195\182rt!"
end

L = BigWigs:NewBossLocale("Nefarian", "deDE")
if L then
	L.landing_soon_trigger = "Sehr gut, meine Diener"
	L.landing_trigger = "BRENNT! Ihr Elenden!"
	L.zerg_trigger = "Unm\195\182glich! Erhebt euch"

	L.triggershamans = "Schamane, zeigt mir was"
	L.triggerdruid = "Druiden und ihre l\195\164cherliche"
	L.triggerwarlock = "Hexenmeister, Ihr solltet nicht mit Magie"
	L.triggerpriest = "Priester! Wenn Ihr weiterhin"
	L.triggerhunter = "J\195\164ger und ihre l\195\164stigen"
	L.triggerwarrior = "Krieger, Ich bin mir sicher"
	L.triggerrogue = "Schurken%? Kommt aus den Schatten"
	L.triggerpaladin = "Paladine"
	L.triggermage = "Auch Magier%? Ihr solltet vorsichtiger"
	L.triggerdeathknight = "Todesritter"
	--L.triggermonk = "Monks,"

	L.landing_soon_warning = "Nefarian landet in 10 Sekunden!"
	L.landing_warning = "Nefarian ist gelandet!"
	L.zerg_warning = "Diener herbeigerufen!"
	L.fear_warning = "AoE Furcht in 2 Sekunden!"
	L.fear_soon_warning = "M\195\182gliche AoE Furcht in ~5 sec"
	L.shadowflame_warning = "Schattenflamme!"
	L.classcall_warning = "Klassenruf in K\195\188rze!"

	L.warnshaman = "Schamanen - Totems!"
	L.warndruid = "Druiden - Gefangen in Katzenform!"
	L.warnwarlock = "Hexenmeister - H\195\182llenbestien herbeigerufen!"
	L.warnpriest = "Priester - Heilung schadet!"
	L.warnhunter = "J\195\164ger - Angelegte Fernkampfwaffen defekt!"
	L.warnwarrior = "Krieger - Gefangen in Berserkerhaltung!"
	L.warnrogue = "Schurken - Teleportiert und festgewurzelt!"
	L.warnpaladin = "Paladine - Segen des Schutzes!"
	L.warnmage = "Magier - Verwandlung!"

	L.classcall_bar = "Klassenruf"
	L.fear_bar = "M\195\182gliche AoE Furcht"

	L.shadowflame = "Schattenflamme"
	L.shadowflame_desc = "Warnung, wenn Nefarian Schattenflamme wirkt."

	L.fear = "Furcht"
	L.fear_desc = "Warnung, wenn Nefarian AoE Furcht wirkt."

	L.classcall = "Klassenruf"
	L.classcall_desc = "Warnung vor Klassenrufen."

	L.otherwarn = "Anderes"
	L.otherwarn_desc = "Warnung, wenn Nefarian landet und seine Diener ruft."
end

L = BigWigs:NewBossLocale("Chromaggus", "deDE")
if L then
	
end

