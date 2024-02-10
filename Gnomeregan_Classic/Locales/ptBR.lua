local L = BigWigs:NewBossLocale("Grubbis Discovery", "ptBR")
if not L then return end
if L then
	L.bossName = "Grúdio"
	L.aoe = "Dano corpo a corpo em área"
	L.cloud = "Uma nuvem chegou ao chefe"
	L.cone = "Cone \"frontal\"" -- "Frontal" Cone, it's a rear cone (he's farting)
end

L = BigWigs:NewBossLocale("Viscous Fallout Discovery", "ptBR")
if L then
	L.bossName = "Precipitação Radioativa Viscosa"
	--L.desiccated_fallout = "Desiccated Fallout" -- NPC ID 216810
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
	L.dont_attack = "Não ataque a ovelha"
	L.sheep_safe = "A ovelha pode ser atacada com segurança"

	--L[218242] = "Dragon"
	--L[218243] = "Sheep"
	--L[218244] = "Squirrel"
	--L[218245] = "Chicken"
end

L = BigWigs:NewBossLocale("Mekgineer Thermaplugg Discovery", "ptBR")
if L then
	L.bossName = "Mecangenheiro Termaplugue"
	L.interruptable = "Interrompível"
end
