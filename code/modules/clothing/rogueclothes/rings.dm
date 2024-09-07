

/obj/item/clothing/ring
	name = "ring"
	desc = ""
	w_class = WEIGHT_CLASS_TINY
	icon = 'icons/roguetown/clothing/rings.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/rings.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/rings.dmi'
	sleevetype = "shirt"
	icon_state = ""
	slot_flags = ITEM_SLOT_RING
	resistance_flags = FIRE_PROOF | ACID_PROOF
	dropshrink = 0.8

/obj/item/clothing/ring/silver
	name = "silver ring"
	icon_state = "ring_s"
	sellprice = 33

/obj/item/clothing/ring/silver/makers_guild
	name = "Makers ring"
	desc = "The wearer is a proud member of the Makers' guild."
	icon_state = "guild_mason"
	sellprice = 0

/obj/item/clothing/ring/gold
	name = "gold ring"
	icon_state = "ring_g"
	sellprice = 70

/obj/item/clothing/ring/gold/guild_mercator
	name = "Mercator ring"
	desc = "The wearer is a proud member of the Mercator guild."
	icon_state = "guild_mercator"
	sellprice = 0

/obj/item/clothing/ring/active
	var/active = FALSE
	desc = "Unfortunately, like most magic rings, it must be used sparingly. (Right-click me to activate)"
	var/cooldowny
	var/cdtime
	var/activetime
	var/activate_sound

/obj/item/clothing/ring/active/attack_right(mob/user)
	if(loc != user)
		return
	if(cooldowny)
		if(world.time < cooldowny + cdtime)
			to_chat(user, "<span class='warning'>Nothing happens.</span>")
			return
	user.visible_message("<span class='warning'>[user] twists the [src]!</span>")
	if(activate_sound)
		playsound(user, activate_sound, 100, FALSE, -1)
	cooldowny = world.time
	addtimer(CALLBACK(src, PROC_REF(demagicify)), activetime)
	active = TRUE
	update_icon()
	activate(user)

/obj/item/clothing/ring/active/proc/activate(mob/user)
	user.update_inv_wear_id()

/obj/item/clothing/ring/active/proc/demagicify()
	active = FALSE
	update_icon()
	if(ismob(loc))
		var/mob/user = loc
		user.visible_message("<span class='warning'>The ring settles down.</span>")
		user.update_inv_wear_id()


/obj/item/clothing/ring/active/nomag
	name = "ring of null magic"
	icon_state = "ruby"
	activate_sound = 'sound/magic/antimagic.ogg'
	cdtime = 10 MINUTES
	activetime = 30 SECONDS
	sellprice = 100

/obj/item/clothing/ring/active/nomag/update_icon()
	..()
	if(active)
		icon_state = "rubyactive"
	else
		icon_state = "ruby"

/obj/item/clothing/ring/active/nomag/activate(mob/user)
	. = ..()
	AddComponent(/datum/component/anti_magic, TRUE, FALSE, FALSE, ITEM_SLOT_RING, INFINITY, FALSE)

/obj/item/clothing/ring/active/nomag/demagicify()
	. = ..()
	var/datum/component/magcom = GetComponent(/datum/component/anti_magic)
	if(magcom)
		magcom.RemoveComponent()

// ................... Ring of Protection ....................... (rare treasure, not for purchase)
/obj/item/clothing/ring/gold/protection
	name = "ring of protection"
	desc = "Old ring, inscribed with arcane words. Once held magical powers, perhaps it does still?"
	icon_state = "ring_protection"
	var/antileechy
	var/antimagika	// will cause bugs if equipped roundstart to wizards
	var/antishocky

/obj/item/clothing/ring/gold/protection/Initialize()
	. = ..()
	switch(rand(1,4))
		if(1)
			antileechy = TRUE
		if(2)
			antileechy = TRUE
		if(3)
			antishocky = TRUE
		if(4)
			return

/obj/item/clothing/ring/gold/protection/equipped(mob/user, slot)
	. = ..()
	if(antileechy)
		if (slot == SLOT_RING && istype(user))
			ADD_TRAIT(user, TRAIT_LEECHIMMUNE,"Unleechable")
		else
			REMOVE_TRAIT(user, TRAIT_LEECHIMMUNE,"Unleechable")

	if(antimagika)
		if (slot == SLOT_RING && istype(user))
			ADD_TRAIT(user, TRAIT_ANTIMAGIC,"Anti-Magic")
		else
			REMOVE_TRAIT(user, TRAIT_ANTIMAGIC,"Anti-Magic")

	if(antishocky)
		if (slot == SLOT_RING && istype(user))
			ADD_TRAIT(user, TRAIT_SHOCKIMMUNE,"Shock Immunity")
		else
			REMOVE_TRAIT(user, TRAIT_SHOCKIMMUNE,"Shock Immunity")

/obj/item/clothing/ring/gold/protection/dropped(mob/user)
	. = ..()
	REMOVE_TRAIT(user, TRAIT_LEECHIMMUNE,"Unleechable")
	REMOVE_TRAIT(user, TRAIT_ANTIMAGIC,"Anti-Magic")
	REMOVE_TRAIT(user, TRAIT_SHOCKIMMUNE, "Shock Immunity")
	
/obj/item/clothing/ring/gold/ravox
	name = "ring of ravox"
	desc = "Old ring, inscribed with arcane words. Just being near it imbues you with otherworldly strength."
	icon_state = "ring_ravox"

/obj/item/clothing/ring/gold/ravox/equipped(mob/living/user, slot)
	. = ..()
	if(user.mind)
		if (slot == SLOT_RING && istype(user))
			user.apply_status_effect(/datum/status_effect/buff/ravox)
		else
			user.remove_status_effect(/datum/status_effect/buff/ravox)

/obj/item/clothing/ring/silver/calm
	name = "soothing ring"
	desc = "A lightweight ring that feels entirely weightless, and easing to your mind as you place it upon a finger."
	icon_state = "ring_calm"

/obj/item/clothing/ring/silver/calm/equipped(mob/living/user, slot)
	. = ..()
	if(user.mind)
		if (slot == SLOT_RING && istype(user))
			user.apply_status_effect(/datum/status_effect/buff/calm)
		else
			user.remove_status_effect(/datum/status_effect/buff/calm)

/obj/item/clothing/ring/silver/noc
	name = "ring of noc"
	desc = "Old ring, inscribed with arcane words. Just being near it imbues you with otherworldly knowledge."
	icon_state = "ring_sapphire"

/obj/item/clothing/ring/silver/noc/equipped(mob/living/user, slot)
	. = ..()
	if(user.mind)
		if (slot == SLOT_RING && istype(user))
			user.apply_status_effect(/datum/status_effect/buff/noc)
		else
			user.remove_status_effect(/datum/status_effect/buff/noc)