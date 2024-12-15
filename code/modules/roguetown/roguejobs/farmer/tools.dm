/obj/item/rogueweapon/sickle
	force = 10
	possible_item_intents = list(DAGGER_CUT)
	name = "sickle"
	desc = "Rusted blade, worn handle, symbol of toil."
	icon_state = "sickle"
	icon = 'icons/roguetown/weapons/tools.dmi'
	sharpness = IS_SHARP
	wlength = 10
	slot_flags = ITEM_SLOT_HIP
	thrown_bclass = BCLASS_CUT
	drop_sound = 'sound/foley/dropsound/blade_drop.ogg'
	max_blade_int = 50
	smeltresult = /obj/item/ingot/iron
	associated_skill = /datum/skill/combat/knives

/obj/item/rogueweapon/sickle/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -10,"sy" = 1,"nx" = 12,"ny" = 1,"wx" = -7,"wy" = 1,"ex" = 6,"ey" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)


/obj/item/rogueweapon/sickle/attack_turf(turf/T, mob/living/user)
	user.changeNext_move(CLICK_CD_MELEE)
	if(istype(T, /turf/open/floor/rogue/dirt))
		var/turf/open/floor/rogue/dirt/D = T
		if(D.planted_crop)
			D.planted_crop.attackby(src, user)
			return
	. = ..()


/obj/item/rogueweapon/hoe
	name = "hoe"
	desc = ""
	icon_state = "hoe"
	icon = 'icons/roguetown/weapons/tools.dmi'
	wlength = WLENGTH_LONG
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	minstr = 5
	sharpness = IS_BLUNT
	walking_stick = TRUE
	drop_sound = 'sound/foley/dropsound/wooden_drop.ogg'
	smeltresult = /obj/item/ingot/iron
	possible_item_intents = list(/datum/intent/pick)
	gripped_intents = list(TILL_INTENT,/datum/intent/pick,POLEARM_BASH)
	associated_skill = /datum/skill/combat/polearms

	force = 5
	force_wielded = 10
	wdefense = 2
	wlength = 66

/obj/item/rogueweapon/hoe/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.7,"sx" = -7,"sy" = 0,"nx" = 8,"ny" = 0,"wx" = -5,"wy" = 0,"ex" = 0,"ey" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 32,"eturn" = -32,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.7,"sx" = 3,"sy" = -4,"nx" = 3,"ny" = -3,"wx" = -4,"wy" = -4,"ex" = 2,"ey" = -4,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 45,"sturn" = 135,"wturn" = -45,"eturn" = 45,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)


/obj/item/rogueweapon/hoe/attack_turf(turf/T, mob/living/user)
	if(user.used_intent.type == /datum/intent/till)
		user.changeNext_move(CLICK_CD_MELEE)
		if(istype(T, /turf/open/floor/rogue/grass))
			playsound(T,'sound/items/dig_shovel.ogg', 100, TRUE)
			if (do_after(user, 3 SECONDS, target = src))
				apply_farming_fatigue(user, 10)
				T.ChangeTurf(/turf/open/floor/rogue/dirt, flags = CHANGETURF_INHERIT_AIR)
				playsound(T,'sound/items/dig_shovel.ogg', 100, TRUE)
			return
		if(istype(T, /turf/open/floor/rogue/dirt))
			playsound(T,'sound/items/dig_shovel.ogg', 100, TRUE)
			if(do_after(user, 2 SECONDS, target = src))
				playsound(T,'sound/items/dig_shovel.ogg', 100, TRUE)
				var/obj/structure/soil/soil = get_soil_on_turf(T)
				if(soil)
					soil.user_till_soil(user)
				else
					apply_farming_fatigue(user, 8)
					new /obj/structure/soil(T)
			return
	. = ..()

/datum/intent/till
	name = "hoe"
	icon_state = "inhoe"
	chargetime = 0
	noaa = TRUE
	candodge = FALSE
	misscost = 0

/obj/item/rogueweapon/hoe/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.7,"sx" = -7,"sy" = 0,"nx" = 8,"ny" = 0,"wx" = -5,"wy" = 0,"ex" = 0,"ey" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 32,"eturn" = -32,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.7,"sx" = 3,"sy" = -4,"nx" = 3,"ny" = -3,"wx" = -4,"wy" = -4,"ex" = 2,"ey" = -4,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 45,"sturn" = 135,"wturn" = -45,"eturn" = 45,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)


/* WAS USED WHEN 64x64
/obj/item/rogueweapon/hoe/attack_turf(turf/T, mob/living/user)
	user.changeNext_move(CLICK_CD_MELEE)
	if(istype(T, /turf/open/floor/rogue/dirt))
		var/turf/open/floor/rogue/dirt/D = T
		if(D.planted_crop)
			D.planted_crop.attackby(src, user)
			return
	if(istype(T, /turf/open/floor/rogue/grass))
		if(user.used_intent.type == /datum/intent/till)
			playsound(T,'sound/items/dig_shovel.ogg', 100, TRUE)
			if (do_after(user,30, target = src))
				T.ChangeTurf(/turf/open/floor/rogue/dirt, flags = CHANGETURF_INHERIT_AIR)
				playsound(T,'sound/items/dig_shovel.ogg', 100, TRUE)
			return
	. = ..()

/obj/item/rogueweapon/hoe/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.7,"sx" = -7,"sy" = 1,"nx" = 7,"ny" = 1,"wx" = -5,"wy" = 1,"ex" = 0,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 32,"eturn" = -32,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 5,"sy" = -2,"nx" = -7,"ny" = -2,"wx" = -4,"wy" = -3,"ex" = 5,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/rogueweapon/hoe/Initialize()
	. = ..()
	pixel_y = -16
	pixel_x = -16

/obj/item/rogueweapon/hoe/dropped()
	. = ..()
	pixel_y = -16
	pixel_x = -16

/obj/item/rogueweapon/hoe/equipped(mob/user, slot)
	. = ..()
	pixel_y = 0
	pixel_x = 0
*/

/obj/item/rogueweapon/thresher
	name = "thresher"
	desc = "Crushes grain, or skulls."
	icon_state = "thresher"
//	icon = 'modular/Neu_Farming/icons/farmtools.dmi'
	icon = 'icons/roguetown/weapons/tools.dmi'
	slot_flags = ITEM_SLOT_BACK
	sharpness = IS_BLUNT
	wlength = WLENGTH_LONG
	w_class = WEIGHT_CLASS_BULKY
	walking_stick = TRUE
	minstr = 6
	gripsprite = TRUE
	drop_sound = 'sound/foley/dropsound/wooden_drop.ogg'
	smeltresult = null
	associated_skill = /datum/skill/combat/whipsflails
	possible_item_intents = list(MACE_STRIKE)
	gripped_intents = list(/datum/intent/flailthresh,/datum/intent/flail/strike/long)

	force = 10
	force_wielded = 14
	wdefense = 2
	wlength = 66

/obj/item/rogueweapon/thresher/military
	force = 12
	force_wielded = 25
	possible_item_intents = list(MACE_STRIKE)
	gripped_intents = list(/datum/intent/flail/strike/long, /datum/intent/flail/strike/smash/long, /datum/intent/flailthresh,)
	name = "military flail"
	desc = "A reinforced thresher designed to smash skulls, the design isn't the best but the craftman did the best job possible using simple working tools."
	icon_state = "military"
	minstr = 7
	smeltresult = /obj/item/ingot/iron

/datum/intent/flailthresh
	name = "thresh"
	icon_state = "inthresh"
	chargetime = 0
	noaa = TRUE
	candodge = FALSE
	misscost = 0
	no_attack = TRUE

/obj/item/rogueweapon/thresher/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.7,
"sx" = -9,
"sy" = 1,
"nx" = 10,
"ny" = 0,
"wx" = -7,
"wy" = -0,
"ex" = 6,
"ey" = 3,
"northabove" = 0,
"southabove" = 1,
"eastabove" = 1,
"westabove" = 0,
"nturn" = -15,
"sturn" = 12,
"wturn" = 0,
"eturn" = 354,
"nflip" = 0,
"sflip" = 8,
"wflip" = 8,
"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.7,
"sx" = 4,
"sy" = -7,
"nx" = -6,
"ny" = -6,
"wx" = 1,
"wy" = -8,
"ex" = 4,
"ey" = -8,
"northabove" = 0,
"southabove" = 1,
"eastabove" = 1,
"westabove" = 1,
"nturn" = -10, //-40
"sturn" = 0, // 40
"wturn" = 10, // 60
"eturn" = 0, // 25
"nflip" = 8,
"sflip" = 0,
"wflip" = 0,
"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.4,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/rogueweapon/thresher/Initialize()
	. = ..()
	pixel_y = -16
	pixel_x = -16

/obj/item/rogueweapon/thresher/dropped()
	. = ..()
	pixel_y = -16
	pixel_x = -16

/obj/item/rogueweapon/thresher/equipped()
	. = ..()
	pixel_y = -16
	pixel_x = -16

/obj/item/reagent_containers/food/drinks/afterattack(obj/target, mob/user , proximity)
	. = ..()

/obj/item/rogueweapon/thresher/afterattack(obj/target, mob/user, proximity)
	if(user.used_intent.type == /datum/intent/flailthresh)
		if(!proximity)
			return
		var/turf/T = target.loc
		var/found = FALSE
		for(var/obj/item/natural/chaff/C in T)
			found = TRUE
			C.thresh()
		if(found)
			playsound(loc,"plantcross", 90, FALSE)
			playsound(loc,"smashlimb", 35, FALSE)
			apply_farming_fatigue(user, 10)
			user.visible_message("<span class='notice'>[user] threshes the stalks!</span>", \
									"<span class='notice'>I thresh the stalks.</span>")
		return
	..()
/*	INSTANT THRESH
/obj/item/rogueweapon/thresher/afterattack(obj/target, mob/user, proximity)
	if(user.used_intent.type == /datum/intent/flailthresh)
		if(isturf(target.loc))
			var/turf/T = target.loc
			var/found = FALSE
			for(var/obj/item/natural/chaff/C in T)
				found = TRUE
				C.thresh()
			if(found)
				playsound(loc,"plantcross", 90, FALSE)
				playsound(loc,"smashlimb", 40, FALSE)
				user.visible_message("<span class='notice'>[user] threshes the stalks!</span>", \
									"<span class='notice'>I thresh the stalks.</span>")
			return
	..()
*/


/obj/item/rogueweapon/pitchfork
	name = "pitchfork"
	desc = "Compost, chaff, hay, it matters not."
	icon_state = "pitchfork"
//	icon = 'modular/Neu_Farming/icons/farmtools.dmi'
	icon = 'icons/roguetown/weapons/tools.dmi'
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	blade_dulling = DULLING_BASHCHOP
	walking_stick = TRUE
	minstr = 6
	var/list/forked = list()
	drop_sound = 'sound/foley/dropsound/wooden_drop.ogg'
	possible_item_intents = list(POLEARM_THRUST, POLEARM_BASH)
	gripped_intents = list(DUMP_INTENT,POLEARM_BASH,POLEARM_THRUST)
	smeltresult = /obj/item/ingot/iron
	associated_skill = /datum/skill/combat/polearms
	thrown_bclass = BCLASS_STAB
	throwforce = 15

	force = 10
	force_wielded = 22
	wdefense = 2
	wlength = WLENGTH_LONG

/obj/item/rogueweapon/pitchfork/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -7,"sy" = 0,"nx" = 8,"ny" = 0,"wx" = -5,"wy" = 0,"ex" = 0,"ey" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 32,"eturn" = -32,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 3,"sy" = -4,"nx" = 3,"ny" = -3,"wx" = -4,"wy" = -4,"ex" = 2,"ey" = -4,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 45,"sturn" = 135,"wturn" = -45,"eturn" = 45,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)


/datum/intent/pforkdump
	name = "scoop"
	icon_state = "inscoop"
	chargetime = 0
	noaa = TRUE
	candodge = FALSE
	misscost = 0
	no_attack = TRUE

/obj/item/rogueweapon/pitchfork/afterattack(obj/target, mob/user, proximity)
	if((!proximity) || (!wielded))
		return ..()
	testing("fuck")
	if(isopenturf(target))
		if(forked.len)
			for(var/obj/item/I in forked)
				I.forceMove(target)
				forked -= I
			to_chat(user, span_warning("I dump the stalks."))
		update_icon()
		return
	..()

/obj/item/rogueweapon/pitchfork/ungrip(mob/living/carbon/user, show_message = TRUE)
	if(forked.len)
		var/turf/T = get_turf(user)
		for(var/obj/item/I in forked)
			I.forceMove(T)
			forked -= I
		update_icon()
	..()

/obj/item/rogueweapon/pitchfork/update_icon()
	if(forked.len)
		icon_state = "pitchforkstuff"
	else
		icon_state = initial(icon_state)
	..()


//copper tools

/obj/item/rogueweapon/hoe/copper
	force = 10
	force_wielded = 15
	possible_item_intents = list(/datum/intent/pick)
	gripped_intents = list(/datum/intent/pick,POLEARM_BASH,TILL_INTENT)
	name = "copper hoe"
	desc = ""
	icon = 'icons/roguetown/weapons/tools.dmi'
	icon_state = "choe"
	smeltresult = /obj/item/ingot/copper

/obj/item/rogueweapon/sickle/copper
	force = 10
	possible_item_intents = list(DAGGER_CUT)
	name = "copper sickle"
	desc = ""
	icon = 'icons/roguetown/weapons/tools.dmi'
	icon_state = "csickle"
	smeltresult = /obj/item/ingot/copper


/obj/item/rogueweapon/pitchfork/copper
	force = 10
	force_wielded = 15
	possible_item_intents = list(POLEARM_THRUST, POLEARM_BASH)
	gripped_intents = list(POLEARM_BASH,POLEARM_THRUST,DUMP_INTENT)
	name = "copper fork"
	desc = "A simple and rustic tool for working the fields, not a very effective weapon."
	icon_state = "cfork"
	item_state = "cfork"
	icon = 'icons/roguetown/weapons/64.dmi'
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	wlength = WLENGTH_LONG
	w_class = WEIGHT_CLASS_BULKY
	blade_dulling = DULLING_BASHCHOP
	walking_stick = TRUE
	minstr = 6
	wdefense = 2
	dropshrink = 0.8
	wlength = 66
	var/list/forked/copper = list()
	drop_sound = 'sound/foley/dropsound/wooden_drop.ogg'
	smeltresult = /obj/item/ingot/copper
	associated_skill = /datum/skill/combat/polearms
	thrown_bclass = BCLASS_STAB
	throwforce = 25

/obj/item/rogueweapon/pitchfork/copper/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -7,"sy" = 0,"nx" = 8,"ny" = 0,"wx" = -5,"wy" = 0,"ex" = 0,"ey" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 32,"eturn" = -32,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 3,"sy" = -4,"nx" = 3,"ny" = -3,"wx" = -4,"wy" = -4,"ex" = 2,"ey" = -4,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 45,"sturn" = 135,"wturn" = -45,"eturn" = 45,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/rogueweapon/pitchfork/update_icon()
	if(forked.len)
		icon_state = "cfork1"
	else
		icon_state = initial(icon_state)
	..()
