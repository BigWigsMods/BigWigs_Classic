local L = BigWigs:NewBossLocale("General Rajaxx", "esMX")
if not L then return end
if L then
	L.wave = "Avisos de oleadas"
	L.wave_desc = "Aviso para oleadas entrantes"

	L.wave_trigger1a = "Ahí vienen. Intenta que no te maten,"
	L.wave_trigger1b = "Rajaxx, ¿recuerdas que te dije que serías el último en morir?"
	L.wave_trigger3 = "¡La hora de las recompensas está próxima! ¡Que la oscuridad reine en el corazón de nuestros enemigos!"
	L.wave_trigger4 = "¡No volveremos a esperar detrás de rejas y muros de piedra! ¡Nunca más podrán negarnos nuestra venganza! ¡Hasta los dragones temblarán frente a nuestra ira!"
	L.wave_trigger5 = "¡El miedo es para el enemigo! ¡Miedo y muerte!"
	L.wave_trigger6 = "¡Corzocelada llorará y rogará por su vida, igual que lo hizo su débil hijo! ¡Hoy acabará un milenio lleno de injusticia!"
	L.wave_trigger7 = "¡Fandral! ¡Ha llegado tu hora! ¡Ve y escóndete en el Sueño Esmeralda y reza para que nunca te encontremos!"
	L.wave_trigger8 = "¡Loco imprudente! ¡Acabaré contigo yo mismo!"

	L.wave_message = "Oleada (%d/8)"
end

L = BigWigs:NewBossLocale("Buru the Gorger", "esMX")
if L then
	L.fixate = "Fijar"
	L.fixate_desc = "Se fija en un objetivo e ignora la amenaza de otros atacantes."
end

L = BigWigs:NewBossLocale("Ossirian the Unscarred", "esMX")
if L then
	L.debuff = "Debilidad"
	L.debuff_desc = "Anunciar debilidades"
end

L = BigWigs:NewBossLocale("Ruins of Ahn'Qiraj Trash", "esMX")
if L then
	L.guardian = "Guardián Anubisath"
end
