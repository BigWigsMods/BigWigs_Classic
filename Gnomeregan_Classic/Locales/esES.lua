local L = BigWigs:NewBossLocale("Grubbis Discovery", "esES")
if not L then return end
if L then
	L.bossName = "Grubbis"
	L.aoe = "Daño cuerpo a cuerpo área de efecto"
	L.cloud = "Una nube alcanzó al jefe"
	L.cone = "Cono \"frontal\"" -- "Frontal" Cone, it's a rear cone (he's farting)
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
end

L = BigWigs:NewBossLocale("Mechanical Menagerie Discovery", "esES")
if L then
	L.bossName = "Animalario mecánico"
	L.attack_buff = "Velocidad de ataque +50%"
	L.dont_attack = "No ataques a la oveja"
	L.sheep_safe = "La oveja es segura para atacar"

	L[218242] = "Dragón"
	L[218243] = "Oveja"
	L[218244] = "Ardilla"
	L[218245] = "Pollo"
end

L = BigWigs:NewBossLocale("Mekgineer Thermaplugg Discovery", "esES")
if L then
	L.bossName = "Mekigeniero Termochufe"
	L.interruptable = "Interrumpible"
end
