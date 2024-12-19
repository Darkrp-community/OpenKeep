/obj/item/rogueweapon/handsaw
	force = 5
	possible_item_intents = list(/datum/intent/mace/strike/shovel)
	gripped_intents = null
	name = "handsaw"
	desc = "An iron saw for sawing wood."
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

/obj/item/rogueweapon/handsaw/crude
	name = "crude sawing tool"
	desc = "A stick with sharp pieces of flint added."
	icon_state = "stonesaw"
	wlength = WLENGTH_LONG
	w_class = WEIGHT_CLASS_BULKY
	force = 5
	smeltresult =  /obj/item/ash
	firefuel = 5 MINUTES
	toolspeed = 3

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
	swingsound = list('sound/combat/wooshes/blunt/shovel_swing.ogg','sound/combat/wooshes/blunt/shovel_swing2.ogg')
	drop_sound = 'sound/foley/dropsound/shovel_drop.ogg'
	associated_skill = /datum/skill/combat/knives
	max_blade_int = 50

/obj/item/natural/plank
	name = "wooden plank"
	desc = "A smooth wooden plank."
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
	bundletype = /obj/item/natural/bundle/plank

/obj/item/natural/plank/attackby(obj/item/I, mob/living/user, params)		// remake to use /datum/intent/axe/cut or TO DO never do maybe
	user.changeNext_move(CLICK_CD_MELEE)
	if(istype(I, /obj/item/rogueweapon/axe))
		playsound(get_turf(src.loc), 'sound/items/wood_cutting.ogg', 100)
		if(do_after(user, 8 SECONDS))
			user.visible_message("<span class='notice'>[user] crudely shortens the [src].</span>")
			new /obj/item/natural/plankshort(get_turf(src.loc))
			qdel(src)
	if(istype(I, /obj/item/rogueweapon/polearm/halberd/bardiche))
		playsound(get_turf(src.loc), 'sound/items/wood_cutting.ogg', 100)
		if(do_after(user, 8 SECONDS))
			user.visible_message("<span class='notice'>[user] crudely shortens the [src].</span>")
			new /obj/item/natural/plankshort(get_turf(src.loc))
			qdel(src)
	if(istype(I, /obj/item/rogueweapon/handsaw))
		playsound(get_turf(src.loc), 'sound/items/sawing.ogg', 100)
		if(do_after(user, 3 SECONDS))
			user.visible_message("<span class='notice'>[user] makes two shorter planks from [src].</span>")
			new /obj/item/natural/plankshort(get_turf(src.loc))
			new /obj/item/natural/plankshort(get_turf(src.loc))
			qdel(src)
	..()

/obj/item/natural/plank/attack_right(mob/user)
	to_chat(user, "<span class='warning'>I start to collect [src]...</span>")
	if(move_after(user, 5 SECONDS, target = src))
		var/plankcount = 0
		for(var/obj/item/natural/plank/F in get_turf(src))
			plankcount++
		while(plankcount > 0)
			if(plankcount == 1)
				new /obj/item/natural/plank(get_turf(user))
				plankcount--
			else if(plankcount >= 2)
				var/obj/item/natural/bundle/plank/B = new(get_turf(user))
				B.amount = clamp(plankcount, 2, 3)
				B.update_bundle()
				plankcount -= clamp(plankcount, 2, 3)
		for(var/obj/item/natural/plank/F in get_turf(src))
			qdel(F)

/obj/item/natural/plankshort
	name = "short wooden plank"
	desc = "A smooth wooden plank that has been cut short."
	force = 8
	throwforce = 8
	icon_state = "shortplank"
	icon = 'icons/roguetown/items/crafting.dmi'
	firefuel = 10 MINUTES
	resistance_flags = FLAMMABLE
	slot_flags = null
	body_parts_covered = null
	experimental_onhip = TRUE
	max_integrity = 15
	muteinmouth = TRUE
	w_class = WEIGHT_CLASS_NORMAL
	bundletype = /obj/item/natural/bundle/plankshort

/obj/item/natural/plankshort/attack_right(mob/user)
	to_chat(user, "<span class='warning'>I start to collect [src]...</span>")
	if(move_after(user, 5 SECONDS, target = src))
		var/splankcount = 0
		for(var/obj/item/natural/plank/F in get_turf(src))
			splankcount++
		while(splankcount > 0)
			if(splankcount == 1)
				new /obj/item/natural/plankshort(get_turf(user))
				splankcount--
			else if(splankcount >= 2)
				var/obj/item/natural/bundle/plankshort/B = new(get_turf(user))
				B.amount = clamp(splankcount, 2, 3)
				B.update_bundle()
				splankcount -= clamp(splankcount, 2, 3)
		for(var/obj/item/natural/plankshort/F in get_turf(src))
			qdel(F)


/obj/item/natural/stoneblock
	name = "stone block"
	desc = "A rectangular stone block for building."
	icon = 'icons/roguetown/items/crafting.dmi'
	icon_state = "stoneblock"
	gripped_intents = null
	possible_item_intents = list(INTENT_GENERIC)
	force = 12
	throwforce = 20 //brick is valid weapon
	slot_flags = null
	obj_flags = null
	w_class = WEIGHT_CLASS_SMALL
	bundletype = /obj/item/natural/bundle/stoneblock

/obj/item/natural/stoneblock/attack_right(mob/user)
	to_chat(user, "<span class='warning'>I start to collect [src]...</span>")
	if(move_after(user, 5 SECONDS, target = src))
		var/blockcount = 0
		for(var/obj/item/natural/stoneblock/F in get_turf(src))
			blockcount++
		while(blockcount > 0)
			if(blockcount == 1)
				new /obj/item/natural/stoneblock(get_turf(user))
				blockcount--
			else if(blockcount >= 2)
				var/obj/item/natural/bundle/stoneblock/B = new(get_turf(user))
				B.amount = clamp(blockcount, 2, 3)
				B.update_bundle()
				blockcount -= clamp(blockcount, 2, 3)
		for(var/obj/item/natural/stoneblock/F in get_turf(src))
			qdel(F)

/obj/item/natural/bundle/plank
	name = "stack of wooden planks"
	desc = "A stack of wooden planks."
	icon_state = "woodplankbundle1"
	icon = 'icons/roguetown/items/crafting.dmi'
	possible_item_intents = list(/datum/intent/use)
	force = 15
	throwforce = 18
	throw_range = 2
	firefuel = null
	resistance_flags = null
	firemod = null
	w_class = WEIGHT_CLASS_HUGE
	stackname = "plank"
	stacktype = /obj/item/natural/plank
	maxamount = 3
	icon1 = "woodplankbundle1"
	icon1step = 2
	icon2 = "woodplankbundle2"
	icon2step = 3

/obj/item/natural/bundle/plankshort
	name = "stack of short wooden planks"
	desc = "A stack of short wooden planks."
	icon_state = "shortplankbundle1"
	icon = 'icons/roguetown/items/crafting.dmi'
	possible_item_intents = list(/datum/intent/use)
	force = 15
	throwforce = 18
	throw_range = 2
	firefuel = null
	resistance_flags = null
	firemod = null
	w_class = WEIGHT_CLASS_HUGE
	stackname = "planks"
	stacktype = /obj/item/natural/plankshort
	maxamount = 3
	icon1 = "shortplankbundle1"
	icon1step = 2
	icon2 = "shortplankbundle2"
	icon2step = 3

/obj/item/natural/bundle/stoneblock
	name = "stack of stone blocks"
	desc = "A stack of stone blocks."
	icon_state = "stoneblockbundle1"
	icon = 'icons/roguetown/items/crafting.dmi'
	possible_item_intents = list(/datum/intent/use)
	force = 15
	throwforce = 18
	throw_range = 2
	firefuel = null
	resistance_flags = null
	firemod = null
	w_class = WEIGHT_CLASS_HUGE
	stackname = "stone blocks"
	stacktype = /obj/item/natural/stoneblock
	maxamount = 3
	icon1 = "stoneblockbundle1"
	icon1step = 2
	icon2 = "stoneblockbundle2"
	icon2step = 3
