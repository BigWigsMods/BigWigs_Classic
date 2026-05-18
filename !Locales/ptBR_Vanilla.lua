-- Blackfathom Deeps

local L = BigWigs:NewBossLocale("Baron Aquanis Discovery", "ptBR")
if L then
	L.bossName = "Barão Aquanis"
end

L = BigWigs:NewBossLocale("Ghamoo-ra Discovery", "ptBR")
if L then
	L.bossName = "Ghamoo-ra"
end

L = BigWigs:NewBossLocale("Lady Sarevess Discovery", "ptBR")
if L then
	L.bossName = "Lady Sarevess"
end

L = BigWigs:NewBossLocale("Gelihast Discovery", "ptBR")
if L then
	L.bossName = "Gelihast"
end

L = BigWigs:NewBossLocale("Lorgus Jett Discovery", "ptBR")
if L then
	L.bossName = "Lorgus Jett"
	L.priestess = "Sacerdotisa da Maré das Profundezas Negras"
	L.priestess_short = "Sacerdotisa" -- Shortened version of L.priestess (Blackfathom Tide Priestess)
	L.murloc = "Murloc das Profundezas Negras"
end

L = BigWigs:NewBossLocale("Twilight Lord Kelris Discovery", "ptBR")
if L then
	L.bossName = "Senhor do Crepúsculo Kelris"
end

L = BigWigs:NewBossLocale("Aku'mai Discovery", "ptBR")
if L then
	L.bossName = "Aku'mai"
end

-- Crystal Vale

L = BigWigs:NewBossLocale("Thunderaan Season of Discovery", "ptBR")
if L then
	L.bossName = "Príncipe Trovejardus"
	--L.mender = "Storm Mender" -- NPC 231858
end

-- Gnomeregan

L = BigWigs:NewBossLocale("Grubbis Discovery", "ptBR")
if L then
	L.bossName = "Grúdio"
	L.aoe = "Dano corpo a corpo em área"
	L.cloud = "Uma nuvem chegou ao chefe"
	L.cone = "Cone \"frontal\"" -- "Frontal" Cone, it's a rear cone (he's farting)
	L.warmup_say_chat_trigger = "Gnomeregan" -- Ainda há dutos de ventilação espalhando material radioativo em Gnomeregan.
end

L = BigWigs:NewBossLocale("Viscous Fallout Discovery", "ptBR")
if L then
	L.bossName = "Precipitação Radioativa Viscosa"
	L.desiccated_fallout = "Precipitação Desidratada" -- NPC ID 216810
end

L = BigWigs:NewBossLocale("Crowd Pummeler 9-60 Discovery", "ptBR")
if L then
	L.bossName = "Espanca-gente 9-60"
end

L = BigWigs:NewBossLocale("Electrocutioner 6000 Discovery", "ptBR")
if L then
	L.bossName = "Eletrocutor 6000"
end

L = BigWigs:NewBossLocale("Mechanical Menagerie Discovery", "ptBR")
if L then
	L.bossName = "Viveiro Mecânico"
	L.attack_buff = "+50% de velocidade de ataque"
	L.boss_at_hp = "%s com %d%%" -- BOSS_NAME at 50%
	L.red_button = "Botão vermelho"

	L[218242] = "|T134153:0:0:0:0:64:64:4:60:4:60|tDragão"
	L[218243] = "|T136071:0:0:0:0:64:64:4:60:4:60|tOvelha"
	L[218244] = "|T133944:0:0:0:0:64:64:4:60:4:60|tEsquilo"
	L[218245] = "|T135996:0:0:0:0:64:64:4:60:4:60|tFrango"

	L.run = "Corra até a porta"
	L.run_desc = "Ao derrotar este chefe, uma mensagem será mostrada instruindo você a correr até a porta. Isso é para ajudá-lo a evitar engajar acidentalmente o próximo chefe."
end

L = BigWigs:NewBossLocale("Mekgineer Thermaplugg Discovery", "ptBR")
if L then
	L.bossName = "Mecangenheiro Termaplugue"
	L.red_button = "Botão vermelho"
	L.position = "Posição %d" -- Position 5
end

-- Nightmare Grove

L = BigWigs:NewBossLocale("Emeriss Season of Discovery", "ptBR")
if L then
	L.bossName = "Emeriss"
end

L = BigWigs:NewBossLocale("Lethon Season of Discovery", "ptBR")
if L then
	L.bossName = "Lethon"
end

L = BigWigs:NewBossLocale("Taerar Season of Discovery", "ptBR")
if L then
	L.bossName = "Taerar"
end

L = BigWigs:NewBossLocale("Ysondre Season of Discovery", "ptBR")
if L then
	L.bossName = "Ysondra"
end

-- Scarlet Enclave

L = BigWigs:NewBossLocale("Balnazzar Scarlet Enclave", "ptBR")
if L then
	--L.bossName = "Balnazzar"
end

L = BigWigs:NewBossLocale("High Commander Beatrix", "ptBR")
if L then
	--L.bossName = "High Commander Beatrix"
	--L.meteor_yell_trigger = "As you wish" -- As you wish, High Commander!
	--L.waves_footmen_yell_trigger = "Form up" -- Form up and hold the line!
	--L.waves_cavalry_yell_trigger = "Ready your lances" -- Understod! Ready your lances!
	--L.arrows_yell_trigger = "Archers," -- Archers, unleash hell!
	--L.bombing_yell_trigger = "At once," -- At once, Beatrix!
end

L = BigWigs:NewBossLocale("Solistrasza", "ptBR")
if L then
	--L.bossName = "Solistrasza"
end

L = BigWigs:NewBossLocale("Alexei the Beastlord", "ptBR")
if L then
	--L.bossName = "Alexei the Beastlord"
end

L = BigWigs:NewBossLocale("Mason the Echo", "ptBR")
if L then
	--L.bossName = "Mason the Echo"
end

L = BigWigs:NewBossLocale("Reborn Council", "ptBR")
if L then
	L.bossName = "Conselho Renascido"
	--L[240795] = "Herod"
	--L[240809] = "Vishas"
	--L[240810] = "Doan"
end

L = BigWigs:NewBossLocale("Lillian Voss", "ptBR")
if L then
	--L.bossName = "Lillian Voss"
end

L = BigWigs:NewBossLocale("Grand Crusader Caldoran", "ptBR")
if L then
	--L.bossName = "Grand Crusader Caldoran"
end

-- Storm Cliffs

L = BigWigs:NewBossLocale("Azuregos Season of Discovery", "ptBR")
if L then
	L.bossName = "Azuregos"
end

-- Sunken Temple

L = BigWigs:NewBossLocale("Atal'alarion Discovery", "ptBR")
if L then
	--L.bossName = "Atal'alarion"
end

L = BigWigs:NewBossLocale("Festering Rotslime Discovery", "ptBR")
if L then
	--L.bossName = "Festering Rotslime"
end

L = BigWigs:NewBossLocale("Atal'ai Defenders Discovery", "ptBR")
if L then
	--L.bossName = "Atal'ai Defenders"
end

L = BigWigs:NewBossLocale("Dreamscythe and Weaver Discovery", "ptBR")
if L then
	--L.bossName = "Dreamscythe and Weaver"
end

L = BigWigs:NewBossLocale("Avatar of Hakkar Discovery", "ptBR")
if L then
	--L.bossName = "Avatar of Hakkar"
end

L = BigWigs:NewBossLocale("Jammal'an and Ogom Discovery", "ptBR")
if L then
	--L.bossName = "Jammal'an and Ogom"
end

L = BigWigs:NewBossLocale("Morphaz and Hazzas Discovery", "ptBR")
if L then
	--L.bossName = "Morphaz and Hazzas"
end

L = BigWigs:NewBossLocale("Shade of Eranikus Discovery", "ptBR")
if L then
	--L.bossName = "Shade of Eranikus"
	--L.deep_slumber_clouds = "Clouds" -- Clouds of Slumber
	--L.deep_slumber_player_debuff = "Player"
end

-- The Tainted Scar

L = BigWigs:NewBossLocale("Lord Kazzak Season of Discovery", "ptBR")
if L then
	L.bossName = "Lorde Kazzak"
end

-- World Bosses

L = BigWigs:NewBossLocale("Azuregos", "ptBR")
if L then
	L.bossName = "Azuregos"
end

L = BigWigs:NewBossLocale("Lord Kazzak", "ptBR")
if L then
	L.bossName = "Lorde Kazzak"

	L.engage_trigger = "Pela Legião! Por Kil'Jaeden!"
end

L = BigWigs:NewBossLocale("Emeriss", "ptBR")
if L then
	L.bossName = "Emeriss"

	L.engage_trigger = "A esperança é uma DOENÇA da alma! Estas terras definharão até a morte!"
end

L = BigWigs:NewBossLocale("Lethon", "ptBR")
if L then
	L.bossName = "Lethon"

	L.engage_trigger = "Eu sinto as TREVAS no coração de vocês. Não há descanso para os perversos!"
end

L = BigWigs:NewBossLocale("Taerar", "ptBR")
if L then
	L.bossName = "Taerar"

	L.engage_trigger = "A paz é um sonho efêmero! Que os PESADELOS reinem soberanos!"
end

L = BigWigs:NewBossLocale("Ysondre", "ptBR")
if L then
	L.bossName = "Ysondra"

	L.engage_trigger = "Os fios da VIDA foram cortados! Os Sonhadores serão vingados!"
end
