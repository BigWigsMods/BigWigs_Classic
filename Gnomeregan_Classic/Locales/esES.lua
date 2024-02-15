local L = BigWigs:NewBossLocale("Grubbis Discovery", "esES")
if not L then return end
if L then
	L.bossName = "Grubbis"
	L.aoe = "Daño cuerpo a cuerpo en área de efecto"
	L.cloud = "Una nube alcanzó al jefe"
	L.cone = "Cono \"frontal\"" -- "Frontal" Cone, it's a rear cone (he's farting)
	--L.warmup_say_chat_trigger = "Gnomeregan" -- There are still ventilation shafts actively spewing radioactive material throughout Gnomeregan.
	L.interruptable = "Interrumpible"
end

L = BigWigs:NewBossLocale("Viscous Fallout Discovery", "esES")
if L then
	L.bossName = "Radiactivo viscoso"
	--L.desiccated_fallout = "Desiccated Fallout" -- NPC ID 216810
end

L = BigWigs:NewBossLocale("Crowd Pummeler 9-60 Discovery", "esES")
if L then
	L.bossName = "Golpeamasa 9-60"
end

L = BigWigs:NewBossLocale("Electrocutioner 6000 Discovery", "esES")
if L then
	L.bossName = "Electrocutor 6000"
	L.ready = "|cff20ff20Listo|r"
end

L = BigWigs:NewBossLocale("Mechanical Menagerie Discovery", "esES")
if L then
	L.bossName = "Animalario mecánico"
	L.attack_buff = "Velocidad de ataque +50%"
	L.boss_at_hp = "%s al %d%%" -- BOSS_NAME at 50%

	L[218242] = "|T134153:0:0:0:0:64:64:4:60:4:60|tDragón"
	L[218243] = "|T136071:0:0:0:0:64:64:4:60:4:60|tOveja"
	L[218244] = "|T133944:0:0:0:0:64:64:4:60:4:60|tArdilla"
	L[218245] = "|T135996:0:0:0:0:64:64:4:60:4:60|tPollo"
end

L = BigWigs:NewBossLocale("Mekgineer Thermaplugg Discovery", "esES")
if L then
	L.bossName = "Mekigeniero Termochufe"
	L.interruptable = "Interrumpible"
	L.ready = "|cff20ff20Listo|r"
end
