-- Blackfathom Deeps

local L = BigWigs:NewBossLocale("Baron Aquanis Discovery", "esMX")
if L then
	L.bossName = "Barón Aquanis"
end

L = BigWigs:NewBossLocale("Ghamoo-ra Discovery", "esMX")
if L then
	L.bossName = "Ghamoo-ra"
end

L = BigWigs:NewBossLocale("Lady Sarevess Discovery", "esMX")
if L then
	L.bossName = "Lady Sarevess"
end

L = BigWigs:NewBossLocale("Gelihast Discovery", "esMX")
if L then
	L.bossName = "Gelihast"
end

L = BigWigs:NewBossLocale("Lorgus Jett Discovery", "esMX")
if L then
	L.bossName = "Lorgus Jett"
	L.priestess = "Sacerdotisa de las mareas Brazanegra"
	L.priestess_short = "Sacerdotisa" -- Shortened version of L.priestess (Blackfathom Tide Priestess)
	L.murloc = "Múrloc Brazanegra"
end

L = BigWigs:NewBossLocale("Twilight Lord Kelris Discovery", "esMX")
if L then
	L.bossName = "Señor Crepuscular Kelris"
end

L = BigWigs:NewBossLocale("Aku'mai Discovery", "esMX")
if L then
	L.bossName = "Aku'mai"
end

-- Crystal Vale

L = BigWigs:NewBossLocale("Thunderaan Season of Discovery", "esMX")
if L then
	L.bossName = "Príncipe Thunderaan"
	--L.mender = "Storm Mender" -- NPC 231858
end

-- Gnomeregan

L = BigWigs:NewBossLocale("Grubbis Discovery", "esMX")
if L then
	L.bossName = "Grubbis"
	L.aoe = "Daño cuerpo a cuerpo en área"
	L.cloud = "Una nube alcanzó al jefe"
	L.cone = "Cono \"frontal\"" -- "Frontal" Cone, it's a rear cone (he's farting)
	--L.warmup_say_chat_trigger = "Gnomeregan" -- There are still ventilation shafts actively spewing radioactive material throughout Gnomeregan.
end

L = BigWigs:NewBossLocale("Viscous Fallout Discovery", "esMX")
if L then
	L.bossName = "Radiactivo viscoso"
	L.desiccated_fallout = "Radiactivo disecado" -- NPC ID 216810
end

L = BigWigs:NewBossLocale("Crowd Pummeler 9-60 Discovery", "esMX")
if L then
	L.bossName = "Golpeamasa 9-60"
end

L = BigWigs:NewBossLocale("Electrocutioner 6000 Discovery", "esMX")
if L then
	L.bossName = "Electrocutor 6000"
end

L = BigWigs:NewBossLocale("Mechanical Menagerie Discovery", "esMX")
if L then
	L.bossName = "Sala de fieras mecánicas"
	L.attack_buff = "Velocidad de ataque +50%"
	L.boss_at_hp = "%s al %d%%" -- BOSS_NAME at 50%
	L.red_button = "Botón rojo"

	L[218242] = "|T134153:0:0:0:0:64:64:4:60:4:60|tDragón"
	L[218243] = "|T136071:0:0:0:0:64:64:4:60:4:60|tOveja"
	L[218244] = "|T133944:0:0:0:0:64:64:4:60:4:60|tArdilla"
	L[218245] = "|T135996:0:0:0:0:64:64:4:60:4:60|tPollo"

	L.run = "Corre hacia la puerta"
	L.run_desc = "Muestra un mensaje cuando derrotes a este jefe para correr hacia la puerta. Esto tiene como objetivo ayudarte a evitar enfrentarte accidentalmente al próximo jefe."
end

L = BigWigs:NewBossLocale("Mekgineer Thermaplugg Discovery", "esMX")
if L then
	L.bossName = "Mekigeniero Termochufe"
	L.red_button = "Botón rojo"
	L.position = "Posición %d" -- Position 5
end

-- Nightmare Grove

L = BigWigs:NewBossLocale("Emeriss Season of Discovery", "esMX")
if L then
	L.bossName = "Emeriss"
end

L = BigWigs:NewBossLocale("Lethon Season of Discovery", "esMX")
if L then
	L.bossName = "Lethon"
end

L = BigWigs:NewBossLocale("Taerar Season of Discovery", "esMX")
if L then
	L.bossName = "Taerar"
end

L = BigWigs:NewBossLocale("Ysondre Season of Discovery", "esMX")
if L then
	L.bossName = "Ysondre"
end

-- Scarlet Enclave

L = BigWigs:NewBossLocale("Balnazzar Scarlet Enclave", "esMX")
if L then
	--L.bossName = "Balnazzar"
end

L = BigWigs:NewBossLocale("High Commander Beatrix", "esMX")
if L then
	--L.bossName = "High Commander Beatrix"
	--L.meteor_yell_trigger = "As you wish" -- As you wish, High Commander!
	--L.waves_footmen_yell_trigger = "Form up" -- Form up and hold the line!
	--L.waves_cavalry_yell_trigger = "Ready your lances" -- Understod! Ready your lances!
	--L.arrows_yell_trigger = "Archers," -- Archers, unleash hell!
	--L.bombing_yell_trigger = "At once," -- At once, Beatrix!
end

L = BigWigs:NewBossLocale("Solistrasza", "esMX")
if L then
	--L.bossName = "Solistrasza"
end

L = BigWigs:NewBossLocale("Alexei the Beastlord", "esMX")
if L then
	--L.bossName = "Alexei the Beastlord"
end

L = BigWigs:NewBossLocale("Mason the Echo", "esMX")
if L then
	--L.bossName = "Mason the Echo"
end

L = BigWigs:NewBossLocale("Reborn Council", "esMX")
if L then
	L.bossName = "Consejo renacido"
	--L[240795] = "Herod"
	--L[240809] = "Vishas"
	--L[240810] = "Doan"
end

L = BigWigs:NewBossLocale("Lillian Voss", "esMX")
if L then
	--L.bossName = "Lillian Voss"
end

L = BigWigs:NewBossLocale("Grand Crusader Caldoran", "esMX")
if L then
	--L.bossName = "Grand Crusader Caldoran"
end

-- Storm Cliffs

L = BigWigs:NewBossLocale("Azuregos Season of Discovery", "esMX")
if L then
	L.bossName = "Azuregos"
end

-- Sunken Temple

L = BigWigs:NewBossLocale("Atal'alarion Discovery", "esMX")
if L then
	--L.bossName = "Atal'alarion"
end

L = BigWigs:NewBossLocale("Festering Rotslime Discovery", "esMX")
if L then
	--L.bossName = "Festering Rotslime"
end

L = BigWigs:NewBossLocale("Atal'ai Defenders Discovery", "esMX")
if L then
	--L.bossName = "Atal'ai Defenders"
end

L = BigWigs:NewBossLocale("Dreamscythe and Weaver Discovery", "esMX")
if L then
	--L.bossName = "Dreamscythe and Weaver"
end

L = BigWigs:NewBossLocale("Avatar of Hakkar Discovery", "esMX")
if L then
	--L.bossName = "Avatar of Hakkar"
end

L = BigWigs:NewBossLocale("Jammal'an and Ogom Discovery", "esMX")
if L then
	--L.bossName = "Jammal'an and Ogom"
end

L = BigWigs:NewBossLocale("Morphaz and Hazzas Discovery", "esMX")
if L then
	--L.bossName = "Morphaz and Hazzas"
end

L = BigWigs:NewBossLocale("Shade of Eranikus Discovery", "esMX")
if L then
	--L.bossName = "Shade of Eranikus"
	--L.deep_slumber_clouds = "Clouds" -- Clouds of Slumber
	--L.deep_slumber_player_debuff = "Player"
end

-- The Tainted Scar

L = BigWigs:NewBossLocale("Lord Kazzak Season of Discovery", "esMX")
if L then
	L.bossName = "Lord Kazzak"
end

-- World Bosses

L = BigWigs:NewBossLocale("Azuregos", "esMX")
if L then
	L.bossName = "Azuregos"
end

L = BigWigs:NewBossLocale("Lord Kazzak", "esMX")
if L then
	L.bossName = "Lord Kazzak"

	L.engage_trigger = "¡Por la Legión! ¡Por Kil'Jaeden!"
end

L = BigWigs:NewBossLocale("Emeriss", "esMX")
if L then
	L.bossName = "Emeriss"

	L.engage_trigger = "¡La esperanza es una ENFERMEDAD del alma! ¡Esta tierra se marchitará y morirá!"
end

L = BigWigs:NewBossLocale("Lethon", "esMX")
if L then
	L.bossName = "Lethon"

	L.engage_trigger = "Puedo sentir la SOMBRA en sus corazones. ¡No puede haber descanso para los malos!"
end

L = BigWigs:NewBossLocale("Taerar", "esMX")
if L then
	L.bossName = "Taerar"

	L.engage_trigger = "¡La paz no es más que un sueño fugaz! ¡Que reine la PESADILLA!"
end

L = BigWigs:NewBossLocale("Ysondre", "esMX")
if L then
	L.bossName = "Ysondre"

	L.engage_trigger = "¡Los hilos de la VIDA se han roto! ¡Tenemos que vengar a los Soñadores!"
end
