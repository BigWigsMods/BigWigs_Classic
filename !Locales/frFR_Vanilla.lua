-- Blackfathom Deeps

local L = BigWigs:NewBossLocale("Baron Aquanis Discovery", "frFR")
if L then
	L.bossName = "Baron Aquanis"
end

L = BigWigs:NewBossLocale("Ghamoo-ra Discovery", "frFR")
if L then
	L.bossName = "Ghamoo-Ra"
end

L = BigWigs:NewBossLocale("Lady Sarevess Discovery", "frFR")
if L then
	L.bossName = "Dame Sarevess"
end

L = BigWigs:NewBossLocale("Gelihast Discovery", "frFR")
if L then
	L.bossName = "Gelihast"
end

L = BigWigs:NewBossLocale("Lorgus Jett Discovery", "frFR")
if L then
	L.bossName = "Lorgus Jett"
	L.priestess = "Prêtresse des marées de Brassenoire"
	L.priestess_short = "Prêtresse" -- Shortened version of L.priestess (Blackfathom Tide Priestess)
	L.murloc = "Murloc de Brassenoire"
end

L = BigWigs:NewBossLocale("Twilight Lord Kelris Discovery", "frFR")
if L then
	L.bossName = "Seigneur du crépuscule Kelris"
end

L = BigWigs:NewBossLocale("Aku'mai Discovery", "frFR")
if L then
	L.bossName = "Aku'mai"
end

-- Crystal Vale

L = BigWigs:NewBossLocale("Thunderaan Season of Discovery", "frFR")
if L then
	L.bossName = "Prince Tonneraan"
	--L.mender = "Storm Mender" -- NPC 231858
end

-- Gnomeregan

L = BigWigs:NewBossLocale("Grubbis Discovery", "frFR")
if L then
	L.bossName = "Grubbis"
	L.aoe = "Dégâts de mêlée en AoE"
	L.cloud = "Un nuage a atteint le boss"
	L.cone = "Cône \"frontal\"" -- "Frontal" Cone, it's a rear cone (he's farting)
	--L.warmup_say_chat_trigger = "Gnomeregan" -- There are still ventilation shafts actively spewing radioactive material throughout Gnomeregan.
end

L = BigWigs:NewBossLocale("Viscous Fallout Discovery", "frFR")
if L then
	L.bossName = "Retombée visqueuse"
	L.desiccated_fallout = "Retombée desséchée" -- NPC ID 216810
end

L = BigWigs:NewBossLocale("Crowd Pummeler 9-60 Discovery", "frFR")
if L then
	L.bossName = "Disperseur de foule 9-60"
end

L = BigWigs:NewBossLocale("Electrocutioner 6000 Discovery", "frFR")
if L then
	L.bossName = "Electrocuteur 6000"
end

L = BigWigs:NewBossLocale("Mechanical Menagerie Discovery", "frFR")
if L then
	L.bossName = "Ménagerie mécanique"
	L.attack_buff = "+50% de vitesse d'attaque"
	L.boss_at_hp = "%s à %d%%" -- BOSS_NAME at 50%
	L.red_button = "Bouton rouge"

	L[218242] = "|T134153:0:0:0:0:64:64:4:60:4:60|tDragon"
	L[218243] = "|T136071:0:0:0:0:64:64:4:60:4:60|tMouton"
	L[218244] = "|T133944:0:0:0:0:64:64:4:60:4:60|tÉcureuil"
	L[218245] = "|T135996:0:0:0:0:64:64:4:60:4:60|tPoulet"

	L.run = "Courir jusqu'à la porte"
	L.run_desc = "Affichez un message lorsque vous avez vaincu ce boss pour courir jusqu'à la porte. Cela est destiné à vous aider à éviter d'engager accidentellement le prochain boss."
end

L = BigWigs:NewBossLocale("Mekgineer Thermaplugg Discovery", "frFR")
if L then
	L.bossName = "Mekgénieur Thermojoncteur"
	L.red_button = "Bouton rouge"
	--L.position = "Position %d" -- Position 5
end

-- Nightmare Grove

L = BigWigs:NewBossLocale("Emeriss Season of Discovery", "frFR")
if L then
	L.bossName = "Emeriss"
end

L = BigWigs:NewBossLocale("Lethon Season of Discovery", "frFR")
if L then
	L.bossName = "Léthon"
end

L = BigWigs:NewBossLocale("Taerar Season of Discovery", "frFR")
if L then
	L.bossName = "Taerar"
end

L = BigWigs:NewBossLocale("Ysondre Season of Discovery", "frFR")
if L then
	L.bossName = "Ysondre"
end

-- Scarlet Enclave

L = BigWigs:NewBossLocale("Balnazzar Scarlet Enclave", "frFR")
if L then
	--L.bossName = "Balnazzar"
end

L = BigWigs:NewBossLocale("High Commander Beatrix", "frFR")
if L then
	--L.bossName = "High Commander Beatrix"
	--L.meteor_yell_trigger = "As you wish" -- As you wish, High Commander!
	--L.waves_footmen_yell_trigger = "Form up" -- Form up and hold the line!
	--L.waves_cavalry_yell_trigger = "Ready your lances" -- Understod! Ready your lances!
	--L.arrows_yell_trigger = "Archers," -- Archers, unleash hell!
	--L.bombing_yell_trigger = "At once," -- At once, Beatrix!
end

L = BigWigs:NewBossLocale("Solistrasza", "frFR")
if L then
	--L.bossName = "Solistrasza"
end

L = BigWigs:NewBossLocale("Alexei the Beastlord", "frFR")
if L then
	--L.bossName = "Alexei the Beastlord"
end

L = BigWigs:NewBossLocale("Mason the Echo", "frFR")
if L then
	--L.bossName = "Mason the Echo"
end

L = BigWigs:NewBossLocale("Reborn Council", "frFR")
if L then
	L.bossName = "Le conseil ressuscité"
	--L[240795] = "Herod"
	--L[240809] = "Vishas"
	--L[240810] = "Doan"
end

L = BigWigs:NewBossLocale("Lillian Voss", "frFR")
if L then
	--L.bossName = "Lillian Voss"
end

L = BigWigs:NewBossLocale("Grand Crusader Caldoran", "frFR")
if L then
	--L.bossName = "Grand Crusader Caldoran"
end

-- Storm Cliffs

L = BigWigs:NewBossLocale("Azuregos Season of Discovery", "frFR")
if L then
	L.bossName = "Azuregos"
end

-- Sunken Temple

L = BigWigs:NewBossLocale("Atal'alarion Discovery", "frFR")
if L then
	--L.bossName = "Atal'alarion"
end

L = BigWigs:NewBossLocale("Festering Rotslime Discovery", "frFR")
if L then
	--L.bossName = "Festering Rotslime"
end

L = BigWigs:NewBossLocale("Atal'ai Defenders Discovery", "frFR")
if L then
	--L.bossName = "Atal'ai Defenders"
end

L = BigWigs:NewBossLocale("Dreamscythe and Weaver Discovery", "frFR")
if L then
	--L.bossName = "Dreamscythe and Weaver"
end

L = BigWigs:NewBossLocale("Avatar of Hakkar Discovery", "frFR")
if L then
	--L.bossName = "Avatar of Hakkar"
end

L = BigWigs:NewBossLocale("Jammal'an and Ogom Discovery", "frFR")
if L then
	--L.bossName = "Jammal'an and Ogom"
end

L = BigWigs:NewBossLocale("Morphaz and Hazzas Discovery", "frFR")
if L then
	--L.bossName = "Morphaz and Hazzas"
end

L = BigWigs:NewBossLocale("Shade of Eranikus Discovery", "frFR")
if L then
	--L.bossName = "Shade of Eranikus"
	--L.deep_slumber_clouds = "Clouds" -- Clouds of Slumber
	--L.deep_slumber_player_debuff = "Player"
end

-- The Tainted Scar

L = BigWigs:NewBossLocale("Lord Kazzak Season of Discovery", "frFR")
if L then
	L.bossName = "Seigneur Kazzak"
end

-- World Bosses

L = BigWigs:NewBossLocale("Azuregos", "frFR")
if L then
	L.bossName = "Azuregos"
end

L = BigWigs:NewBossLocale("Lord Kazzak", "frFR")
if L then
	L.bossName = "Seigneur Kazzak"

	L.engage_trigger = "Pour la Légion ! Pour Kil'Jaeden !"
end

L = BigWigs:NewBossLocale("Emeriss", "frFR")
if L then
	L.bossName = "Emeriss"

	L.engage_trigger = "L'espoir est une MALADIE de l'âme ! Ces terres vont flétrir et mourir !"
end

L = BigWigs:NewBossLocale("Lethon", "frFR")
if L then
	L.bossName = "Léthon"

	L.engage_trigger = "Je sens l'OMBRE dans vos cœurs. Il ne peut y avoir de repos pour les vilains !"
end

L = BigWigs:NewBossLocale("Taerar", "frFR")
if L then
	L.bossName = "Taerar"

	L.engage_trigger = "La paix n'est qu'un rêve éphémère ! Que le CAUCHEMAR règne !"
end

L = BigWigs:NewBossLocale("Ysondre", "frFR")
if L then
	L.bossName = "Ysondre"

	L.engage_trigger = "Les fils de la VIE ont été coupés ! Les Rêveurs doivent être vengés !"
end
