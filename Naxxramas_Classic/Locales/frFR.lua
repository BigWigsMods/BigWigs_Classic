local L = BigWigs:NewBossLocale("Gothik the Harvester", "frFR")
if not L then return end
if L then
	L.add_death = "Mort des renforts"
	L.add_death_desc = "Prévient quand un des renforts meurt."

	L.wave = "%d/23 : %s"

	L.trainee = "Jeune recrue" -- Unrelenting Trainee NPC 16124
	L.deathKnight = "Chevalier de la mort" -- Unrelenting Death Knight NPC 16125
	L.rider = "Cavalier" -- Unrelenting Rider NPC 16126
end

L = BigWigs:NewBossLocale("Grobbulus", "frFR")
if L then
	L.injection = "Injection"
end

L = BigWigs:NewBossLocale("Heigan the Unclean", "frFR")
if L then
	L.teleport_yell_trigger = "Votre fin est venue."
end

L = BigWigs:NewBossLocale("The Four Horsemen", "frFR")
if L then
	L.mark_desc = "Prévient de l'arrivée des marques."
end

L = BigWigs:NewBossLocale("Kel'Thuzad", "frFR")
if L then
	L.KELTHUZADCHAMBERLOCALIZEDLOLHAX = "Appartements de Kel'Thuzad"

	L.engage_yell_trigger = "Serviteurs, valets et soldats des ténèbres glaciales ! Répondez à l'appel de Kel'Thuzad !"
	L.stage2_yell_trigger1 = "Faites vos prières !"
	L.stage2_yell_trigger2 = "Hurlez et expirez !"
	L.stage2_yell_trigger3 = "Votre fin est proche !"
	L.stage3_yell_trigger = "Maître, j'ai besoin d'aide !"
	L.adds_yell_trigger = "Très bien. Guerriers des terres gelées, relevez-vous ! Je vous ordonne de combattre, de tuer et de mourir pour votre maître ! N'épargnez personne !"
end

L = BigWigs:NewBossLocale("Loatheb", "frFR")
if L then
	L.ready = "|cff20ff20Prêt|r"
end

L = BigWigs:NewBossLocale("Noth the Plaguebringer", "frFR")
if L then
	L.adds_yell_trigger = "Levez-vous, soldats" -- Levez-vous, soldats ! Levez-vous et combattez une fois encore !
end

L = BigWigs:NewBossLocale("Maexxna", "frFR")
if L then
	L.cocoons = "Entoilage"
end

L = BigWigs:NewBossLocale("Instructor Razuvious", "frFR")
if L then
	L.understudy = "Doublure de chevalier de la mort"
end

L = BigWigs:NewBossLocale("Thaddius", "frFR")
if L then
	L.stage1_yell_trigger1 = "Stalagg écraser toi !"
	L.stage1_yell_trigger2 = "À manger pour maître !"

	L.stage2_yell_trigger1 = "Manger… tes… os…"
	L.stage2_yell_trigger2 = "Casser... toi !"
	L.stage2_yell_trigger3 = "Tuer…"

	L.add_death_emote_trigger = "%s meurt."
	L.overload_emote_trigger = "%s entre en surcharge !"
	--L.add_revive_emote_trigger = "%s is jolted back to life!"

	--L.polarity_extras = "Additional alerts for Polarity Shift positioning"

	--L.custom_off_select_charge_position = "First position"
	--L.custom_off_select_charge_position_desc = "Where to move to after the first Polarity Shift."
	--L.custom_off_select_charge_position_value1 = "|cffff2020Negative (-)|r are LEFT, |cff2020ffPositive (+)|r are RIGHT"
	--L.custom_off_select_charge_position_value2 = "|cff2020ffPositive (+)|r are LEFT, |cffff2020Negative (-)|r are RIGHT"

	--L.custom_off_select_charge_movement = "Movement"
	--L.custom_off_select_charge_movement_desc = "The movement strategy your group uses."
	--L.custom_off_select_charge_movement_value1 = "Run |cff20ff20THROUGH|r the boss"
	--L.custom_off_select_charge_movement_value2 = "Run |cff20ff20CLOCKWISE|r around the boss"
	--L.custom_off_select_charge_movement_value3 = "Run |cff20ff20COUNTER-CLOCKWISE|r around the boss"
	--L.custom_off_select_charge_movement_value4 = "Four camps 1: Polarity changed moves |cff20ff20RIGHT|r, same polarity moves |cff20ff20LEFT|r"
	--L.custom_off_select_charge_movement_value5 = "Four camps 2: Polarity changed moves |cff20ff20LEFT|r, same polarity moves |cff20ff20RIGHT|r"

	--L.custom_off_charge_graphic = "Graphical arrow"
	--L.custom_off_charge_graphic_desc = "Show an arrow graphic."
	--L.custom_off_charge_text = "Text arrows"
	--L.custom_off_charge_text_desc = "Show an additional message."
	--L.custom_off_charge_voice = "Voice alert"
	--L.custom_off_charge_voice_desc = "Play a voice alert."

	--Translate these to get locale sound files!
	--L.left = "<--- GO LEFT <--- GO LEFT <---"
	--L.right = "---> GO RIGHT ---> GO RIGHT --->"
	--L.swap = "^^^^ SWITCH SIDES ^^^^ SWITCH SIDES ^^^^"
	--L.stay = "==== DON'T MOVE ==== DON'T MOVE ===="

	--L.chat_message = "The Thaddius mod supports showing you directional arrows and playing voices. Open the options to configure them."
end
