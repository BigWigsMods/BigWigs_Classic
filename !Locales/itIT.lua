-- Ahn'Qiraj 20

local L = BigWigs:NewBossLocale("General Rajaxx", "itIT")
if L then
	--L.wave_trigger1a = "Kill first, ask questions later... Incoming!"
	--L.wave_trigger1b = "Remember, Rajaxx, when I said I'd kill you last?"
end

L = BigWigs:NewBossLocale("Buru the Gorger", "itIT")
if L then
	L.fixate_desc = "Prende di mira il bersaglio, ignorando le provocazioni degli altri attaccanti."
end

L = BigWigs:NewBossLocale("Ayamiss the Hunter", "itIT")
if L then
	--L.sacrifice = "Sacrifice"
end

L = BigWigs:NewBossLocale("Ruins of Ahn'Qiraj Trash", "itIT")
if L then
	L.guardian = "Guardiano Anubisath"
end

-- Ahn'Qiraj 40

L = BigWigs:NewBossLocale("Viscidus", "itIT")
if L then
	--L.freeze = "Freezing States"
	--L.freeze_desc = "Warn for the different frozen states."

	--L.freeze_trigger1 = "%s begins to slow!"
	--L.freeze_trigger2 = "%s is freezing up!"
	--L.freeze_trigger3 = "%s is frozen solid!"
	--L.freeze_trigger4 = "%s begins to crack!"
	--L.freeze_trigger5 = "%s looks ready to shatter!"

	--L.freeze_warn1 = "First freeze phase!"
	--L.freeze_warn2 = "Second freeze phase!"
	--L.freeze_warn3 = "Viscidus is frozen!"
	--L.freeze_warn4 = "Cracking up - keep going!"
	--L.freeze_warn5 = "Cracking up - almost there!"
	--L.freeze_warn_melee = "%d melee attacks - %d more to go"
	--L.freeze_warn_frost = "%d frost attacks - %d more to go"
end

L = BigWigs:NewBossLocale("Silithid Royalty", "itIT")
if L then
	L[15543] = "Yauj"
	L[15544] = "Vem"
	L[15511] = "Kri"
end

L = BigWigs:NewBossLocale("Ouro", "itIT")
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

L = BigWigs:NewBossLocale("C'Thun", "itIT")
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

L = BigWigs:NewBossLocale("Ahn'Qiraj Trash", "itIT")
if L then
	L.sentinel = "Sentinella Anubisath" -- NPC 15264
	L.brainwasher = "Strizzacervelli Qiraji" -- NPC 15247
	L.defender = "Difensore Anubisath" -- NPC 15277
	L.crawler = "Scorpione dell'Alveare Vekniss" -- NPC 15240

	--L.target_buffs = "Target Buff Warnings"
	--L.target_buffs_desc = "When your target is an Anubisath Sentinel, show a warning for what buff it has."
	--L.target_buffs_message = "Target Buffs: %s"
	--L.detect_magic_missing_message = "Detect Magic is missing from your target"
	--L.detect_magic_warning = "A Mage must cast \124cff71d5ff\124Hspell:2855:0\124h[Detect Magic]\124h\124r on your target for buff warnings to work."
end

-- Blackwing Lair

L = BigWigs:NewBossLocale("Razorgore the Untamed", "itIT")
if L then
	--L.start_trigger = "Intruders have breached"

	--L.eggs = "Count Eggs"
	--L.eggs_desc = "Count the destroyed eggs."
	--L.eggs_message = "%d/30 eggs destroyed"
end

L = BigWigs:NewBossLocale("Vaelastrasz the Corrupt", "itIT")
if L then
	--L.warmup_trigger = "Too late, friends!"
end

L = BigWigs:NewBossLocale("Chromaggus", "itIT")
if L then
	--L.breath = "Breaths"
	--L.breath_desc = "Warn for Breaths."

	--L.debuffs_message = "3/5 debuffs, carefull!"
	--L.debuffs_warning = "4/5 debuffs, %s on 5th!"
	L.bronze = "Bronzo"

	--L.vulnerability = "Vulnerability Change"
	--L.vulnerability_desc = "Warn for Vulnerability changes."
	--L.vulnerability_message = "Vulnerability: %s"
	--L.detect_magic_missing = "Detect Magic is missing from Chromaggus"
	--L.detect_magic_warning = "A Mage must cast \124cff71d5ff\124Hspell:2855:0\124h[Detect Magic]\124h\124r on Chromaggus for vulnerability warnings to work."
end

L = BigWigs:NewBossLocale("Nefarian Classic", "itIT")
if L then
	--L.engage_yell_trigger = "Let the games begin"
	--L.stage3_yell_trigger = "Impossible! Rise my"

	--L.shaman_class_call_yell_trigger = "Shamans"
	--L.deathknight_class_call_yell_trigger = "Death Knights"
	--L.monk_class_call_yell_trigger = "Monks"
	--L.hunter_class_call_yell_trigger = "Hunters"

	--L.warnshaman = "Shamans - Totems spawned!"
	--L.warndruid = "Druids - Stuck in cat form!"
	--L.warnwarlock = "Warlocks - Incoming Infernals!"
	--L.warnpriest = "Priests - Heals hurt!"
	--L.warnhunter = "Hunters - Bows/Guns broken!"
	--L.warnwarrior = "Warriors - Stuck in berserking stance!"
	--L.warnrogue = "Rogues - Ported and rooted!"
	--L.warnpaladin = "Paladins - Blessing of Protection!"
	--L.warnmage = "Mages - Incoming polymorphs!"
	--L.warndeathknight = "Death Knights - Death Grip"
	--L.warnmonk = "Monks - Stuck Rolling"
	--L.warndemonhunter = "Demon Hunters - Blinded"

	--L.classcall = "Class Call"
	--L.classcall_desc = "Warn for Class Calls."

	--L.add = "Drakonid deaths"
	--L.add_desc = "Announce the number of adds killed in stage 1 before Nefarian lands."
end

L = BigWigs:NewBossLocale("Blackwing Lair Trash", "itIT")
if L then
	L.wyrmguard_overseer = "Guardiadragoni dell'Artiglio della Morte / Sovrintendente dell'Artiglio della Morte" -- NPC 12460 / 12461
	L.sandstorm = "Tempesta di Sabbia"

	--L.target_vulnerability = "Target Vulnerability Warnings"
	--L.target_vulnerability_desc = "When your target is a Death Talon Wyrmguard or a Death Talon Overseer, show a warning for what vulnerability it has."
	--L.target_vulnerability_message = "Target Vulnerability: %s"
	--L.detect_magic_missing_message = "Detect Magic is missing from your target"
	--L.detect_magic_warning = "A Mage must cast \124cff71d5ff\124Hspell:2855:0\124h[Detect Magic]\124h\124r on your target for vulnerability warnings to work."

	L.warlock = "Stregone dell'Ala Nera" -- NPC 12459
end

-- Molten Core

L = BigWigs:NewBossLocale("Ragnaros Classic", "itIT")
if L then
	--L.submerge_trigger = "COME FORTH,"
	L.son = "Figlio delle Fiamme" -- NPC ID 12143
end

L = BigWigs:NewBossLocale("The Molten Core", "itIT")
if L then
	--L.bossName = "The Molten Core"
end
