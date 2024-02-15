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

	L.polarity_extras = "Alertes supplémentaires pour le positionnement du changement de polarité"

	L.custom_off_select_charge_position = "Première position"
	L.custom_off_select_charge_position_desc = "Où se déplacer après le premier changement de polarité."
	L.custom_off_select_charge_position_value1 = "|cffff2020Négatif (-)|r est à GAUCHE, |cff2020ffPositif (+)|r est à DROITE"
	L.custom_off_select_charge_position_value2 = "|cff2020ffPositif (+)|r est à GAUCHE, |cffff2020Négatif (-)|r est à DROITE"

	L.custom_off_select_charge_movement = "Déplacement"
	L.custom_off_select_charge_movement_desc = "La stratégie de déplacement que votre groupe utilise."
	L.custom_off_select_charge_movement_value1 = "Courir |cff20ff20À TRAVERS|r le boss"
	L.custom_off_select_charge_movement_value2 = "Courir |cff20ff20DANS LE SENS DES AIGUILLES D'UNE MONTRE|r autour du boss"
	L.custom_off_select_charge_movement_value3 = "Courir |cff20ff20DANS LE SENS CONTRAIRE DES AIGUILLES D'UNE MONTRE|r autour du boss"
	L.custom_off_select_charge_movement_value4 = "Quatre groupes 1 : Changement de polarité se déplace à |cff20ff20DROITE|r, même polarité se déplace à |cff20ff20GAUCHE|r"
	L.custom_off_select_charge_movement_value5 = "Quatre groupes 2 : Changement de polarité se déplace à |cff20ff20GAUCHE|r, même polarité se déplace à |cff20ff20DROITE|r"

	L.custom_off_charge_graphic = "Flèche graphique"
	L.custom_off_charge_graphic_desc = "Afficher une flèche graphique."
	L.custom_off_charge_text = "Flèches de texte"
	L.custom_off_charge_text_desc = "Afficher un message supplémentaire."
	L.custom_off_charge_voice = "Alerte vocale"
	L.custom_off_charge_voice_desc = "Jouer un alerte vocale."

	--Translate these to get locale sound files!
	L.left = "<--- ALLEZ À GAUCHE <--- ALLEZ À GAUCHE <---"
	L.right = "---> ALLEZ À DROITE ---> ALLEZ À DROITE --->"
	L.swap = "^^^^ CHANGER DE CÔTÉS ^^^^ CHANGER DE CÔTÉS ^^^^"
	L.stay = "==== NE BOUGEZ PAS ==== NE BOUGEZ PAS ===="

	L.chat_message = "Le mod Thaddius prend en charge l'affichage de flèches directionnelles et la lecture de voix. Ouvrez les options pour les configurer."
end
