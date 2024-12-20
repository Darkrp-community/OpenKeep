/datum/asset/simple/namespaced/common
	assets = list("padlock.png"	= 'html/padlock.png')
	parents = list("common.css" = 'html/browser/common.css')

/datum/asset/group/goonchat

/datum/asset/simple/stonekeep_class_menu_slop_layout
	assets = list(
		"try4.png" = 'icons/roguetown/misc/try4.png',
		"try4_border.png" = 'icons/roguetown/misc/try4_border.png',
		"slop_menustyle2.css" = 'html/browser/slop_menustyle2.css',
		"gragstar.gif" = 'icons/roguetown/misc/gragstar.gif'
	)

/datum/asset/simple/stonekeep_triumph_buy_menu_slop_layout
	assets = list(
		"try5.png" = 'icons/roguetown/misc/try5.png',
		"try5_border.png" = 'icons/roguetown/misc/try5_border.png',
		"slop_menustyle3.css" = 'html/browser/slop_menustyle3.css'
	)

/datum/asset/simple/stonekeep_drifter_queue_menu_slop_layout
	assets = list(
		"slop_menustyle4.css" = 'html/browser/slop_menustyle4.css',
	)

/datum/asset/simple/roguefonts
	assets = list(
		"pterra.ttf" = 'interface/fonts/pterra.ttf',
		"chiseld.ttf" = 'interface/fonts/chiseld.ttf',
		"blackmoor.ttf" = 'interface/fonts/blackmoor.ttf',
		"handwrite.ttf" = 'interface/fonts/handwrite.ttf',
		"book1.ttf" = 'interface/fonts/book1.ttf',
		"book2.ttf" = 'interface/fonts/book1.ttf',
		"book3.ttf" = 'interface/fonts/book1.ttf',
		"book4.ttf" = 'interface/fonts/book1.ttf',
		"dwarf.ttf" = 'interface/fonts/languages/dwarf.ttf',
		"elf.ttf" = 'interface/fonts/languages/elf.ttf',
		"oldpsydonic.ttf" = 'interface/fonts/languages/oldpsydonic.ttf',
		"zybantine.ttf" = 'interface/fonts/languages/zybantine.ttf',
		"hell.ttf" = 'interface/fonts/languages/hell.ttf',
		"orc.ttf" = 'interface/fonts/languages/orc.ttf',
		"sand.ttf" = 'interface/fonts/languages/sand.ttf',
		"undead.ttf" = 'interface/fonts/languages/undead.ttf'
	)

//this exists purely to avoid meta by pre-loading all language icons.
/datum/asset/language/register()
	for(var/path in typesof(/datum/language))
		set waitfor = FALSE
		var/datum/language/L = new path ()
		L.get_icon()

/datum/asset/spritesheet/simple/achievements
	name ="achievements"

/datum/asset/simple/permissions
	assets = list(
		"search.js" = 'html/admin/search.js',
		"panels.css" = 'html/admin/panels.css'
	)


/datum/asset/group/permissions
	children = list(
		/datum/asset/simple/permissions,
		/datum/asset/simple/namespaced/common
	)

/datum/asset/simple/notes

/datum/asset/spritesheet/goonchat
	name = "Goonchat"

/datum/asset/group/tgui
