-- Ahn'Qiraj 20

local L = BigWigs:NewBossLocale("General Rajaxx", "deDE")
if L then
	L.wave_trigger1a = "Hier kommen sie. Bleibt am Leben, Welpen."
	L.wave_trigger1b = "Erinnerst du dich daran, Rajaxx, wann ich dir das letzte Mal sagte, ich w\195\188rde dich t\195\182ten?"
end

L = BigWigs:NewBossLocale("Buru the Gorger", "deDE")
if L then
	L.fixate_desc = "Fixiert sich auf ein Ziel und ignoriert die Bedrohung anderer Angreifer."
end

L = BigWigs:NewBossLocale("Ayamiss the Hunter", "deDE")
if L then
	L.sacrifice = "Opferung"
end

L = BigWigs:NewBossLocale("Ruins of Ahn'Qiraj Trash", "deDE")
if L then
	L.guardian = "Beschützer des Anubisath"
end

-- Ahn'Qiraj 40

L = BigWigs:NewBossLocale("Viscidus", "deDE")
if L then
	--L.freeze = "Freezing States"
	--L.freeze_desc = "Warn for the different frozen states."

	L.freeze_trigger1 = "wird langsamer!"
	L.freeze_trigger2 = "friert ein!"
	L.freeze_trigger3 = "ist tiefgefroren!"
	L.freeze_trigger4 = "beginnt zu splittern!"
	L.freeze_trigger5 = "ist kurz davor, zu zerspringen!"

	--L.freeze_warn1 = "First freeze phase!"
	--L.freeze_warn2 = "Second freeze phase!"
	--L.freeze_warn3 = "Viscidus is frozen!"
	--L.freeze_warn4 = "Cracking up - keep going!"
	--L.freeze_warn5 = "Cracking up - almost there!"
	--L.freeze_warn_melee = "%d melee attacks - %d more to go"
	--L.freeze_warn_frost = "%d frost attacks - %d more to go"
end

L = BigWigs:NewBossLocale("Silithid Royalty", "deDE")
if L then
	L[15543] = "Yauj"
	L[15544] = "Vem"
	L[15511] = "Kri"
end

L = BigWigs:NewBossLocale("Ouro", "deDE")
if L then
	--L.emerge_message = "Ouro has emerged"
	--L.emerge_bar = "Emerge"

	--L.submerge_message = "Ouro has submerged"
	--L.submerge_bar = "Submerge"
	--L.submerge_early_message = "Early Submerge - No one was in range"

	--L.scarab = "Scarab Despawn"
	--L.scarab_desc = "Warn for Scarab Despawn."
	--L.scarab_bar = "Scarabs despawn"
end

L = BigWigs:NewBossLocale("C'Thun", "deDE")
if L then
	--L.claw_tentacle = "Claw Tentacle"
	--L.claw_tentacle_desc = "Timers for the claw tentacle."

	--L.giant_claw_tentacle = "Giant Claw"
	--L.giant_claw_tentacle_desc = "Timers for the giant claw tentacle."

	--L.eye_tentacles = "Eye Tentacles"
	--L.eye_tentacles_desc = "Timers for the 8 eye tentacles."

	--L.giant_eye_tentacle = "Giant Eye"
	--L.giant_eye_tentacle_desc = "Timers for the giant eye tentacle."

	--L.weakened_desc = "Warn for weakened state."

	--L.dark_glare_message = "%s: %s (Group %s)" -- Dark Glare: PLAYER_NAME (Group 1)
	--L.stomach = "Stomach"
end

L = BigWigs:NewBossLocale("Ahn'Qiraj Trash", "deDE")
if L then
	L.sentinel = "Wächter des Anubisath" -- NPC 15264
	L.brainwasher = "Gehirnwäscher der Qiraji" -- NPC 15247
	L.defender = "Verteidiger des Anubisath" -- NPC 15277
	L.crawler = "Schwarmkriecher der Vekniss" -- NPC 15240

	--L.target_buffs = "Target Buff Warnings"
	--L.target_buffs_desc = "When your target is an Anubisath Sentinel, show a warning for what buff it has."
	--L.target_buffs_message = "Target Buffs: %s"
	L.detect_magic_missing_message = "Magie entdecken is missing from your target"
	L.detect_magic_warning = "A Mage must cast \124cff71d5ff\124Hspell:2855:0\124h[Magie entdecken]\124h\124r on your target for buff warnings to work."
end

-- Blackwing Lair

L = BigWigs:NewBossLocale("Razorgore the Untamed", "deDE")
if L then
	L.start_trigger = "Eindringlinge sind in die"

	L.eggs = "Eier nicht zählen"
	L.eggs_desc = "Die zerstörten Eier nicht zählen."
	L.eggs_message = "%d/30 Eier zerstört"
end

L = BigWigs:NewBossLocale("Vaelastrasz the Corrupt", "deDE")
if L then
	L.warmup_trigger = "Zu spät, Freunde!"
end

L = BigWigs:NewBossLocale("Chromaggus", "deDE")
if L then
	L.breath = "Atem"
	L.breath_desc = "Warnung, wenn Chromaggus seinen Atem wirkt."

	L.debuffs_message = "3/5 Debuffs, vorsicht!"
	L.debuffs_warning = "4/5 Debuffs, %s auf 5th!"
	L.bronze = "Bronze"

	L.vulnerability = "Zauber-Verwundbarkeiten"
	L.vulnerability_desc = "Warnung, wenn Chromagguss Zauber-Verwundbarkeit sich ändert."
	L.vulnerability_message = "Neue Zauber-Verwundbarkeit: %s"
	L.detect_magic_missing = "Magie entdecken is missing from Chromaggus"
	L.detect_magic_warning = "A Mage must cast \124cff71d5ff\124Hspell:2855:0\124h[Magie entdecken]\124h\124r on Chromaggus for vulnerability warnings to work."
end

L = BigWigs:NewBossLocale("Nefarian Classic", "deDE")
if L then
	L.engage_yell_trigger = "Lasst die Spiele beginnen!"
	L.stage3_yell_trigger = "Unmöglich! Erhebt euch"

	L.shaman_class_call_yell_trigger = "Schamane, zeigt mir was"
	L.deathknight_class_call_yell_trigger = "Todesritter"
	--L.monk_class_call_yell_trigger = "Monks"
	L.hunter_class_call_yell_trigger = "Jäger und ihre lästigen"

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

L = BigWigs:NewBossLocale("Blackwing Lair Trash", "deDE")
if L then
	L.wyrmguard_overseer = "Wyrmwache der Todeskrallen / Aufseher der Todeskrallen" -- NPC 12460 / 12461
	L.sandstorm = "Sandsturm"

	--L.target_vulnerability = "Target Vulnerability Warnings"
	--L.target_vulnerability_desc = "When your target is a Death Talon Wyrmguard or a Death Talon Overseer, show a warning for what vulnerability it has."
	--L.target_vulnerability_message = "Target Vulnerability: %s"
	L.detect_magic_missing_message = "Magie entdecken is missing from your target"
	L.detect_magic_warning = "A Mage must cast \124cff71d5ff\124Hspell:2855:0\124h[Magie entdecken]\124h\124r on your target for vulnerability warnings to work."

	L.warlock = "Hexenmeister der Pechschwingen" -- NPC 12459
end

-- Molten Core

L = BigWigs:NewBossLocale("Ragnaros Classic", "deDE")
if L then
	L.submerge_trigger = "KOMMT HERBEI, MEINE DIENER"
	L.son = "Sohn der Flamme" -- NPC ID 12143
end

L = BigWigs:NewBossLocale("The Molten Core", "deDE")
if L then
	--L.bossName = "The Molten Core"
end
