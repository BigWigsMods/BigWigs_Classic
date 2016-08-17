local L = BigWigs:NewBossLocale("Moam", "deDE")
if not L then return end
if L then
	L.starttrigger = "%s spürt Eure Angst."
end

L = BigWigs:NewBossLocale("Ossirian the Unscarred", "deDE")
if L then
	--L.debuff = "Weakness"
	--L.debuff_desc = "Warn for various weakness types."
end

L = BigWigs:NewBossLocale("General Rajaxx", "deDE")
if L then
	L.wave = "Wellen"
	L.wave_desc = "Warnung vor den ankommenden Gegner Wellen."

	L.trigger1 = "Hier kommen sie. Bleibt am Leben, Welpen."
	--L.trigger2 = "?????" -- There is no callout for wave 2 ><
	L.trigger3 = "Die Zeit der Vergeltung ist gekommen! Lasst uns die Herzen unserer Feinde mit Dunkelheit füllen!"
	L.trigger4 = "Wir werden nicht länger hinter verbarrikadierten Toren und Mauern aus Stein ausharren! Die Rache wird unser sein! Selbst die Drachen werden im Angesicht unseres Zornes erzittern!"
	L.trigger5 = "Wir kennen keine Furcht! Und wir werden unseren Feinden den Tod bringen!"
	L.trigger6 = "Staghelm wird winseln und um sein Leben betteln, genau wie sein räudiger Sohn! Eintausend Jahre der Ungerechtigkeit werden heute enden!"
	L.trigger7 = "Fandral! Deine Zeit ist gekommen! Geh und verstecke dich im Smaragdgrünen Traum, und bete, dass wir dich nie finden werden!"
	L.trigger8 = "Unverschämter Narr! Ich werde Euch höchstpersönlich töten!"
	L.trigger9 = "Erinnerst du dich daran, Rajaxx, wann ich dir das letzte Mal sagte, ich würde dich töten?"

	L.warn1 = "Welle 1/8"
	L.warn2 = "Welle 2/8"
	L.warn3 = "Welle 3/8"
	L.warn4 = "Welle 4/8"
	L.warn5 = "Welle 5/8"
	L.warn6 = "Welle 6/8"
	L.warn7 = "Welle 7/8"
	L.warn8 = "General Rajaxx kommt!"
	L.warn9 = "Welle 1/8" -- trigger for starting the event by pulling the first wave instead of talking to andorov
end

L = BigWigs:NewBossLocale("Ruins of Ahn'Qiraj Trash", "deDE")
if L then
	--L.guardian = "Anubisath Guardian"
end

