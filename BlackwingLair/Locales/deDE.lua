local L = BigWigs:NewBossLocale("Razorgore the Untamed", "deDE")
if not L then return end
if L then
	L.start_trigger = "Eindringlinge sind in die"

	L.eggs = "Eier nicht zählen"
	L.eggs_desc = "Die zerstörten Eier nicht zählen."
	L.eggs_message = "%d/30 Eier zerstört!"
end

L = BigWigs:NewBossLocale("Vaelastrasz the Corrupt", "deDE")
if L then
	L.warmup_trigger = "Zu spät, Freunde!"
	--L.tank_bomb = "Tank Bomb"
end

L = BigWigs:NewBossLocale("Chromaggus", "deDE")
if L then
	L.breath = "Atem"
	L.breath_desc = "Warnung, wenn Chromaggus seinen Atem wirkt."

	L.debuffs_message = "3/5 Debuffs, vorsicht!"
	L.debuffs_warning = "4/5 Debuffs, %s auf 5th!"
end

L = BigWigs:NewBossLocale("Nefarian Classic", "deDE")
if L then
	L.landing_soon_trigger = "Sehr gut, meine Diener"
	L.stage2_yell_trigger = "BRENNT! Ihr Elenden!"
	L.stage3_yell_trigger = "Unmöglich! Erhebt euch"

	L.shaman_class_call_yell_trigger = "Schamane, zeigt mir was"
	L.warlock_class_call_yell_trigger = "Hexenmeister, Ihr solltet nicht mit Magie"
	L.hunter_class_call_yell_trigger = "Jäger und ihre lästigen"
	L.mage_class_call_yell_trigger = "Auch Magier"
	L.deathknight_class_call_yell_trigger = "Todesritter"
	--L.monk_class_call_yell_trigger = "Monks"

	L.warnshaman = "Schamanen - Totems!"
	L.warndruid = "Druiden - Gefangen in Katzenform!"
	L.warnwarlock = "Hexenmeister - Höllenbestien herbeigerufen!"
	L.warnpriest = "Priester - Heilung schadet!"
	L.warnhunter = "Jäger - Angelegte Fernkampfwaffen defekt!"
	L.warnwarrior = "Krieger - Gefangen in Berserkerhaltung!"
	L.warnrogue = "Schurken - Teleportiert und festgewurzelt!"
	L.warnpaladin = "Paladine - Segen des Schutzes!"
	L.warnmage = "Magier - Verwandlung!"
	--L.warndeathknight = "Death Knights - Death Grip"
	--L.warnmonk = "Monks - Stuck Rolling"
	--L.warndemonhunter = "Demon Hunters - Blinded"

	L.classcall = "Klassenruf"
	L.classcall_desc = "Warnung vor Klassenrufen."

	L.add = "Tote Drakoniden"
	L.add_desc = "Zeigt die Anzahl der getöteten Adds in Phase 1 vor Nefarians Landung an."
end
