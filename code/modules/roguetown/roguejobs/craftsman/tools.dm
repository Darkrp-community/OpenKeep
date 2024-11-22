/obj/item/rogueweapon/handsaw
	force = 5
	possible_item_intents = list(/datum/intent/mace/strike/shovel)
	gripped_intents = null
	name = "handsaw"
	desc = ""
	icon_state = "handsaw"
	icon = 'icons/roguetown/items/crafting.dmi'
	sharpness = IS_SHARP
	dropshrink = 0.9
	wdefense = 1
//	pixel_y = -16
//	pixel_x = -16
//	inhand_x_dimension = 64
//	inhand_y_dimension = 64
//	bigboy = TRUE
	wlength = WLENGTH_LONG
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BACK || ITEM_SLOT_HIP
	swingsound = list('sound/combat/wooshes/blunt/shovel_swing.ogg','sound/combat/wooshes/blunt/shovel_swing2.ogg')
	drop_sound = 'sound/foley/dropsound/shovel_drop.ogg'
	smeltresult = /obj/item/ingot/iron
	associated_skill = /datum/skill/combat/polearms
	max_blade_int = 50

/obj/item/rogueweapon/chisel
	name = "chisel"
	desc = ""
	icon_state = "chisel"
	icon = 'icons/roguetown/items/crafting.dmi'
	force = 2
	throwforce = 2
	possible_item_intents = list(/datum/intent/stab, /datum/intent/pick)
	gripped_intents = null
	twohands_required = FALSE
	sharpness = IS_SHARP
	dropshrink = 0.9
	w_class = WEIGHT_CLASS_SMALL
	wdefense = 1
	blade_dulling = 0
	max_integrity = 150
	slot_flags = ITEM_SLOT_MOUTH|ITEM_SLOT_HIP
//	pixel_y = -16
//	pixel_x = -16
//	inhand_x_dimension = 64
//	inhand_y_dimension = 64
//	bigboy = TRUE
	wlength = WLENGTH_LONG
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	swingsound = list('sound/combat/wooshes/blunt/shovel_swing.ogg','sound/combat/wooshes/blunt/shovel_swing2.ogg')
	drop_sound = 'sound/foley/dropsound/shovel_drop.ogg'
	smeltresult = /obj/item/ingot/iron
	associated_skill = /datum/skill/combat/polearms
	max_blade_int = 50

/obj/item/natural/plank
	name = "wooden plank"
	desc = "a smooth wooden plank."
	icon = 'icons/roguetown/items/crafting.dmi'
	icon_state = "woodplank"
	possible_item_intents = list(/datum/intent/use)
	force = 10
	throwforce = 10
	attacked_sound = 'sound/misc/woodhit.ogg'
	obj_flags = null
	firefuel = 20 MINUTES
	resistance_flags = FLAMMABLE
	slot_flags = null
	body_parts_covered = null
	experimental_onhip = TRUE
	max_integrity = 20
	muteinmouth = TRUE
	w_class = WEIGHT_CLASS_BULKY

/obj/item/natural/plankshort
	name = "short wooden plank"
	desc = "a smooth wooden plank that has been cut short."
	force = 8
	throwforce = 8
	icon_state = "shortplank"
	firefuel = 10 MINUTES
	resistance_flags = FLAMMABLE
	slot_flags = null
	body_parts_covered = null
	experimental_onhip = TRUE
	max_integrity = 15
	muteinmouth = TRUE
	w_class = WEIGHT_CLASS_BULKY

/obj/item/natural/stoneblock
	name = "stone block"
	desc = "A rectangular stone block for building."
	icon = 'icons/roguetown/items/crafting.dmi'
	icon_state = "stoneblock"
	gripped_intents = null
	dropshrink = 0.75
	possible_item_intents = list(INTENT_GENERIC)
	force = 12
	throwforce = 20 //brick is valid wea
	slot_flags = null
	obj_flags = null
	w_class = WEIGHT_CLASS_TINY


/obj/item/natural/bundle/plank
	name = "stack of wooden planks"
	desc = "A stack of wooden planks."
	icon_state = "woodplankbundle1"
	possible_item_intents = list(/datum/intent/use)
	force = 15
	throwforce = 18
	throw_range = 2
	firefuel = null
	resistance_flags = null
	firemod = null
	w_class = WEIGHT_CLASS_HUGE
	stackname = "glass"
	stacktype = /obj/item/natural/plan
	maxamount = 3
	icon1 = "woodplankbundle1"
	icon1step = 2
	icon2 = "woodplankbundle2"
	icon2step = 3

/obj/item/natural/bundle/shortplank
	name = "stack of short wooden planks"
	desc = "A stack of short wooden planks."
	icon_state = "shortplankbundle1"
	possible_item_intents = list(/datum/intent/use)
	force = 15
	throwforce = 18
	throw_range = 2
	firefuel = null
	resistance_flags = null
	firemod = null
	w_class = WEIGHT_CLASS_HUGE
	stackname = "planks"
	stacktype = /obj/item/natural/plank
	maxamount = 3
	icon1 = "shortplankbundle1"
	icon1step = 2
	icon2 = "shortplankbundle2"
	icon2step = 3

/obj/item/natural/bundle/stoneblock
	name = "stack of stone blocks"
	desc = "A stack of stone blocks."
	icon_state = "stoneblockbundle1"
	possible_item_intents = list(/datum/intent/use)
	force = 15
	throwforce = 18
	throw_range = 2
	firefuel = null
	resistance_flags = null
	firemod = null
	w_class = WEIGHT_CLASS_HUGE
	stackname = "stine blocks"
	stacktype = /obj/item/natural/stoneblock
	maxamount = 3
	icon1 = "stoneblockbundle1"
	icon1step = 2
	icon2 = "sstoneblockbundle2"
	icon2step = 3