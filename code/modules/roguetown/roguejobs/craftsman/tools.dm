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
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	swingsound = list('sound/combat/wooshes/blunt/shovel_swing.ogg','sound/combat/wooshes/blunt/shovel_swing2.ogg')
	drop_sound = 'sound/foley/dropsound/shovel_drop.ogg'
	smeltresult = /obj/item/ingot/iron
	associated_skill = /datum/skill/combat/polearms
	max_blade_int = 50

/obj/item/rogueweapon/chisel
	force = 5
	possible_item_intents = list(/datum/intent/pick)
	gripped_intents = null
	name = "chisel"
	desc = ""
	icon_state = "chisel"
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

/obj/item/natural/plank/short
	name = "short wooden plank"
	desc = "a smooth wooden plank that has been cut short."
	firefuel = 10 MINUTES