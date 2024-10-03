
/obj/item/gun/ballistic/revolver/grenadelauncher/blowgun
	name = "blowgun"
	desc = "A primitive tool used for hunting. Sometimes favored by Rogues for its ease of use and easy obtainability."
	icon = 'icons/roguetown/weapons/32.dmi'
	icon_state = "blowgun"
	item_state = "blowgun"
	possible_item_intents = list(/datum/intent/shoot/blowgun, /datum/intent/arc/blowgun, INTENT_GENERIC)
	mag_type = /obj/item/ammo_box/magazine/internal/shot/blowgun
	slot_flags = ITEM_SLOT_HIP
	w_class = WEIGHT_CLASS_NORMAL
	randomspread = 1
	spread = 0
	can_parry = FALSE
	pin = /obj/item/firing_pin
	force = 10
	var/cocked = FALSE
	cartridge_wording = "dart"
	fire_sound = 'sound/combat/Ranged/blowgun_shot.ogg'
	associated_skill = /datum/skill/combat/crossbows

/obj/item/gun/ballistic/revolver/grenadelauncher/blowgun/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.5,"sx" = -4,"sy" = -6,"nx" = 9,"ny" = -6,"wx" = -6,"wy" = -4,"ex" = 4,"ey" = -6,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 90,"wturn" = 93,"eturn" = -12,"nflip" = 0,"sflip" = 1,"wflip" = 0,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/datum/intent/shoot/blowgun
	chargedrain = 0 //no drain to aim a crossbow

/datum/intent/shoot/blowgun/get_chargetime()
	if(mastermob && chargetime)
		var/newtime = chargetime
		//skill block
		newtime = newtime + 18
		newtime = newtime - (mastermob.mind.get_skill_level(/datum/skill/combat/crossbows) * 3)
		//per block
		newtime = newtime + 20
		newtime = newtime - (mastermob.STAPER)
		if(newtime > 0)
			return newtime
		else
			return 0.1
	return chargetime

/datum/intent/shoot/blowgun
	chargedrain = 0 //no drain to aim a gun
	charging_slowdown = 4
	warnoffset = 20
	chargetime = 10

/datum/intent/shoot/blowgun/arc
	name = "arc"
	icon_state = "inarc"
	chargedrain = 1
	charging_slowdown = 3
	warnoffset = 20

/datum/intent/shoot/blowgun/arc/arc_check()
	return TRUE

/datum/intent/shoot/blowgun/get_chargetime()
	if(mastermob && chargetime)
		var/newtime = chargetime
		//skill block
		newtime = newtime + 18
		newtime = newtime - (mastermob.mind.get_skill_level(/datum/skill/combat/firearms) * 3.5)
		//per block
		newtime = newtime + 20
		// Perception aint gonna help you with loading a musket, bud
		//newtime = newtime - (mastermob.STAPER)
		if(newtime > 0)
			return newtime
		else
			return 0.1
	return chargetime

/datum/intent/shoot/blowgun/pistol/get_chargetime()
	if(mastermob && chargetime)
		var/newtime = chargetime
		//skill block
		newtime = newtime + 18
		newtime = newtime - (mastermob.mind.get_skill_level(/datum/skill/combat/firearms) * 3)
		//per block
		newtime = newtime + 20
		newtime = newtime - (mastermob.STAPER)
		if(newtime > 0)
			return newtime
		else
			return 1
	return chargetime

/datum/intent/arc/blowgun
	chargetime = 1
	chargedrain = 0 //no drain to aim a crossbow

/datum/intent/arc/blowgun/get_chargetime()
	if(mastermob && chargetime)
		var/newtime = chargetime
		//skill block
		newtime = newtime + 18
		newtime = newtime - (mastermob.mind.get_skill_level(/datum/skill/combat/crossbows) * 3)
		//per block
		newtime = newtime + 20
		newtime = newtime - (mastermob.STAPER)
		if(newtime > 0)
			return newtime
		else
			return 1
	return chargetime

/obj/item/gun/ballistic/revolver/grenadelauncher/blowgun/shoot_with_empty_chamber()
	if(cocked)
		cocked = FALSE
		update_icon()

/obj/item/gun/ballistic/revolver/grenadelauncher/blowgun/attack_self(mob/living/user)
	if(chambered)
		..()
	else
		if(!cocked)
			to_chat(user, "<span class='info'>I raise the blowgun...</span>")
			if(do_after(user, 3 - user.STASTR, target = user))
				cocked = TRUE
		else
			to_chat(user, "<span class='warning'>I lower the blowgun.</span>")
			cocked = FALSE
	update_icon()

/obj/item/gun/ballistic/revolver/grenadelauncher/blowgun/attackby(obj/item/A, mob/user, params)
	if(istype(A, /obj/item/ammo_box) || istype(A, /obj/item/ammo_casing))
		if(cocked)
			..()
		else
			to_chat(user, "<span class='warning'>I need to ready the blowgun first.</span>")


/obj/item/gun/ballistic/revolver/grenadelauncher/blowgun/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0)
	if(user.client)
		if(user.client.chargedprog >= 100)
			spread = 0
		else
			spread = 150 - (150 * (user.client.chargedprog / 100))
	else
		spread = 0
	for(var/obj/item/ammo_casing/CB in get_ammo_list(FALSE, TRUE))
		var/obj/projectile/BB = CB.BB
		if(user.client)
			if(user.client.chargedprog >= 100)
				BB.accuracy += 15 //better accuracy for fully aiming
		if(user.STAPER > 8)
			BB.accuracy += (user.STAPER - 8) * 4 //each point of perception above 8 increases standard accuracy by 4.
			BB.bonus_accuracy += (user.STAPER - 8) //Also, increases bonus accuracy by 1, which cannot fall off due to distance.
			if(user.STAPER > 10)
				BB.damage = BB.damage * (user.STAPER / 10)
		BB.damage *= damfactor // Apply damfactor multiplier regardless of PER.
		BB.bonus_accuracy += (user.mind.get_skill_level(/datum/skill/combat/crossbows) * 3) //+3 accuracy per level in crossbows
	cocked = FALSE
	..()

/obj/item/gun/ballistic/revolver/grenadelauncher/blowgun/update_icon()
	. = ..()
	if(cocked)
		icon_state = "blowgun"
	else
		icon_state = "blowgun"
	cut_overlays()
	if(chambered)
		var/obj/item/I = chambered
		I.pixel_x = 0
		I.pixel_y = 0
		add_overlay(new /mutable_appearance(I))
	if(ismob(loc))
		var/mob/M = loc
		M.update_inv_hands()

/obj/item/ammo_box/magazine/internal/shot/blowgun
	ammo_type = /obj/item/ammo_casing/caseless/rogue/dart
	caliber = "dart"
	max_ammo = 1
	start_empty = TRUE
