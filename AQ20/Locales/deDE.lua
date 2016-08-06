local L = BigWigs:NewBossLocale("Moam", "deDE")
if not L then return end
if L then
	L.starttrigger = "%s sp\195\188rt Eure Angst."
end

L = BigWigs:NewBossLocale("Ossirian the Unscarred", "deDE")
if L then
	--L.debuff = "Weakness"
	--L.debuff_desc = "Warn for various weakness types."
end

L = BigWigs:NewBossLocale("General Rajaxx", "deDE")
if L then
	wave = "Wellen"
	wave_desc = "Warnung vor den ankommenden Gegner Wellen."

	trigger1 = "Hier kommen sie. Bleibt am Leben, Welpen."
	--trigger2 = "?????" -- There is no callout for wave 2 ><
	trigger3 = "Die Zeit der Vergeltung ist gekommen! Lasst uns die Herzen unserer Feinde mit Dunkelheit f\195\188llen!"
	trigger4 = "Wir werden nicht l\195\164nger hinter verbarrikadierten Toren und Mauern aus Stein ausharren! Die Rache wird unser sein! Selbst die Drachen werden im Angesicht unseres Zornes erzittern!"
	trigger5 = "Wir kennen keine Furcht! Und wir werden unseren Feinden den Tod bringen!"
	trigger6 = "Staghelm wird winseln und um sein Leben betteln, genau wie sein r\195\164udiger Sohn! Eintausend Jahre der Ungerechtigkeit werden heute enden!"
	trigger7 = "Fandral! Deine Zeit ist gekommen! Geh und verstecke dich im Smaragdgr\195\188nen Traum, und bete, dass wir dich nie finden werden!"
	trigger8 = "Unversch\195\164mter Narr! Ich werde Euch h\195\182chstpers\195\182nlich t\195\182ten!"
	trigger9 = "Erinnerst du dich daran, Rajaxx, wann ich dir das letzte Mal sagte, ich w\195\188rde dich t\195\182ten?"

	warn1 = "Welle 1/8"
	warn2 = "Welle 2/8"
	warn3 = "Welle 3/8"
	warn4 = "Welle 4/8"
	warn5 = "Welle 5/8"
	warn6 = "Welle 6/8"
	warn7 = "Welle 7/8"
	warn8 = "General Rajaxx kommt!"
	warn9 = "Welle 1/8" -- trigger for starting the event by pulling the first wave instead of talking to andorov
end

L = BigWigs:NewBossLocale("Ruins of Ahn'Qiraj Trash", "deDE")
if L then
	--L.guardian = "Anubisath Guardian"
end

