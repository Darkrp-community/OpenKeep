/obj/item/gun/ballistic/revolver/grenadelauncher/flintlock
	name = "barksteel"
	desc = "Alternative names include 'firebow' for Elven militaries and something along the lines of 'Musker' for Dwarven militias."
	icon = 'icons/roguetown/weapons/64.dmi'
	lefthand_file = 'icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/guns_righthand.dmi'
	icon_state = "longgun"
	item_state = "musket"
	experimental_inhand = FALSE
	experimental_onback = FALSE
	possible_item_intents = list(INTENT_GENERIC)
	gripped_intents = list(/datum/intent/shoot/musket, /datum/intent/shoot/musket/arc)
	mag_type = /obj/item/ammo_box/magazine/internal/shot/musk
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	randomspread = 1
	spread = 0
	var/cocked = FALSE
	var/rammed = FALSE
	var/click_delay = 3
	var/obj/item/ramrod/rod
	bigboy = TRUE
	can_parry = TRUE
	pin = /obj/item/firing_pin
	force = 10
	cartridge_wording = "ball"
	recoil = 4
	load_sound = 'sound/foley/nockarrow.ogg'
	fire_sound = 'sound/combat/Ranged/muskshoot.ogg'
	equip_sound = 'sound/foley/gun_equip.ogg'
	pickup_sound = 'sound/foley/gun_equip.ogg'
	drop_sound = 'sound/foley/gun_drop.ogg'
	dropshrink = 0.7
	associated_skill = /datum/skill/combat/firearms

/obj/item/ramrod
	name = "ram rod"
	desc = ""
	icon = 'icons/roguetown/items/misc.dmi'
	icon_state = "ramrod"

/obj/item/gun/ballistic/revolver/grenadelauncher/flintlock/Initialize()
	. = ..()
	var/obj/item/ramrod/rrod = new(src)
	rod = rrod

/obj/item/gun/ballistic/revolver/grenadelauncher/flintlock/attackby(obj/item/A, mob/user, params)
	var/ramtime = 5.5
	ramtime = ramtime - (user.mind.get_skill_level(/datum/skill/combat/firearms) / 2)
	if(istype(A, /obj/item/ramrod))
		if(!user.is_holding(src))
			to_chat(user, "<span class='warning'>I need to hold \the [src] to ram it!</span>")
			return
		if(chambered)
			if(!rammed)
				if(do_after(user, ramtime SECONDS, TRUE, src))
					to_chat(user, "<span class='info'>I ram \the [src].</span>")
					playsound(src.loc, 'sound/foley/nockarrow.ogg', 100, FALSE)
					rammed = TRUE
	else
		return ..()

/obj/item/gun/ballistic/revolver/grenadelauncher/flintlock/MiddleClick(mob/user, params)
	. = ..()
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(rod)
			H.put_in_hands(rod)
			rod = null
			to_chat(user, "<span class='info'>I remove the ramrod from \the [src].</span>")
			playsound(src.loc, 'sound/foley/struggle.ogg', 100, FALSE, -1)
		else
			if(istype(H.get_active_held_item(), /obj/item/ramrod))
				var/obj/item/ramrod/rrod = H.get_active_held_item()
				rrod.forceMove(src)
				rod = rrod
				to_chat(user, "<span class='info'>I put \the [rrod] into \the [src].</span>")
				playsound(src.loc, 'sound/foley/struggle.ogg', 100, FALSE, -1)

/obj/item/gun/ballistic/revolver/grenadelauncher/flintlock/bayo
	icon_state = "longgun_b"
	randomspread = 1
	spread = 0.5
	gripped_intents = list(/datum/intent/shoot/musket, /datum/intent/shoot/musket/arc, /datum/intent/dagger/cut, /datum/intent/dagger/chop/cleaver)

/obj/item/gun/ballistic/revolver/grenadelauncher/flintlock/dropped(mob/user)
	. = ..()
	if(wielded)
		ungrip(user)
	update_icon()

/obj/item/gun/ballistic/revolver/grenadelauncher/flintlock/attack_right(mob/user)
	. = ..()
	if(!user.is_holding(src))
		to_chat(user, "<span class='warning'>I need to hold \the [src] to cock it!</span>")
		return
	if(cocked)
		cocked = FALSE
		to_chat(user, "<span class='warning'>I carefully de-cock \the [src].</span>")
		playsound(src.loc, 'sound/combat/Ranged/muskclick.ogg', 100, FALSE)
	else
		playsound(src.loc, 'sound/combat/Ranged/muskclick.ogg', 100, FALSE)
		to_chat(user, "<span class='info'>I cock \the [src].</span>")
		cocked = TRUE

/obj/item/gun/ballistic/revolver/grenadelauncher/flintlock/pistol
	name = "puffer"
	desc = "The current zenith of Dwarven and Humen cooperation on the Eastern continent. It uses alchemical blastpowder to propel metal balls for devastating effect."
	icon = 'icons/roguetown/weapons/32.dmi'
	lefthand_file = 'icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/guns_righthand.dmi'
	icon_state = "puffer"
	item_state = "gun"
	bigboy = FALSE
	recoil = 8
	randomspread = 2
	spread = 3
	click_delay = 0.5
	possible_item_intents = list(/datum/intent/shoot/musket, /datum/intent/shoot/musket/arc, INTENT_GENERIC)
	gripped_intents = null
	slot_flags = ITEM_SLOT_HIP
	w_class = WEIGHT_CLASS_NORMAL
	sellprice = 200 // This kind of equipment is very hard to come by in Rockhill.

/obj/item/gun/ballistic/revolver/grenadelauncher/flintlock/pistol/attack_self(mob/living/user)
	return

/obj/item/gun/ballistic/revolver/grenadelauncher/flintlock/pistol/update_icon()
	return

/obj/item/gun/ballistic/revolver/grenadelauncher/flintlock/update_icon()
	icon_state = "[initial(icon_state)][wielded]"

/obj/item/gun/ballistic/revolver/grenadelauncher/flintlock/attack_self(mob/living/user)
	if(!wielded)
		wield(user)
		update_icon()
	else
		ungrip(user)
		update_icon()

/obj/item/gun/ballistic/revolver/grenadelauncher/flintlock/shoot_with_empty_chamber(mob/living/user)
	if(!cocked)
		return
	playsound(src.loc, 'sound/combat/Ranged/muskclick.ogg', 100, FALSE)
	cocked = FALSE
	rammed = FALSE // just in case

/obj/item/gun/ballistic/revolver/grenadelauncher/flintlock/process_fire(atom/target, mob/living/user, message = TRUE, params = null, zone_override = "", bonus_spread = 0)
	if(user.client)
		if(user.client.chargedprog >= 100)
			spread = 0
		else
			spread = 150 - (150 * (user.client.chargedprog / 100))
	else
		spread = 0
	for(var/obj/item/ammo_casing/CB in get_ammo_list(FALSE, TRUE))
		var/obj/projectile/BB = CB.BB
		if(user.STAPER > 10)
			BB.damage = BB.damage * (user.STAPER / 10)
	if(!cocked)
		return
	if(!rammed)
		return
	playsound(src.loc, 'sound/combat/Ranged/muskclick.ogg', 100, FALSE)
	cocked = FALSE
	rammed = FALSE
	sleep(click_delay)
	..()

/obj/item/gun/ballistic/revolver/grenadelauncher/flintlock/shoot_live_shot(mob/living/user, pointblank, mob/pbtarget, message)
	if(user.mind.get_skill_level(/datum/skill/combat/firearms) <= 0)
		to_chat(user, "<span class='danger'>I do not know how to use this.</span>")
		return
	..()
	user.playsound_local(get_turf(user), 'sound/foley/tinnitus.ogg', 60, FALSE) // muh realism or something
	new /obj/effect/particle_effect/smoke(get_turf(user))

/obj/item/ammo_box/magazine/internal/shot/musk
	ammo_type = /obj/item/ammo_casing/caseless/rogue/bullet
	caliber = "musketball"
	max_ammo = 1
	start_empty = TRUE