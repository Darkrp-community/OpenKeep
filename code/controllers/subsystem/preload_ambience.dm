SUBSYSTEM_DEF(preload_ambience)
	name = "Preload Ambience"
	init_order = INIT_ORDER_TITLE
	flags = SS_NO_FIRE


/client/proc/PreloadAmbience()
	for(var/music in GLOB.ambience_files)
		mob.playsound_local(mob, music, 0.1)
		sleep(10)


GLOBAL_LIST_INIT(ambience_files, list(
	'sound/music/area/bath.ogg',
	'sound/music/area/bog.ogg',
	'sound/music/area/catacombs.ogg',
	'sound/music/area/caves.ogg',
	'sound/music/area/church.ogg',
	'sound/music/area/decap.ogg',
	'sound/music/area/dungeon.ogg',
	'sound/music/area/dwarf.ogg',
	'sound/music/area/field.ogg',
	'sound/music/area/forest.ogg',
	'sound/music/area/magiciantower.ogg',
	'sound/music/area/manor.ogg',
	'sound/music/area/manor2.ogg',
	'sound/music/area/manorgarri.ogg',
	'sound/music/area/manorgarr_alt.ogg',
	'sound/music/area/sargoth.ogg',
	'sound/music/area/septimus.ogg',
	'sound/music/area/sewers.ogg',
	'sound/music/area/shop.ogg',
	'sound/music/area/siege.ogg',
	'sound/music/area/sleeping.ogg',
	'sound/music/area/spidercave.ogg',
	'sound/music/area/towngen.ogg',
	'sound/music/area/townstreets.ogg',
	'sound/music/area/underworlddrone.ogg',
	'sound/music/jukeboxes/tav3.ogg',
	'sound/music/jukeboxes/tavern1.ogg',
	'sound/music/jukeboxes/tavern2.ogg',
	))
