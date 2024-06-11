/mob/living/carbon/human/species/orc
	name = "orc"

	icon = 'icons/roguetown/mob/monster/Orc.dmi'
	icon_state = "orc"
	race = /datum/species/orc
	gender = MALE
	bodyparts = list(/obj/item/bodypart/chest/orc, /obj/item/bodypart/head/orc, /obj/item/bodypart/l_arm/orc,
					 /obj/item/bodypart/r_arm/orc, /obj/item/bodypart/r_leg/orc, /obj/item/bodypart/l_leg/orc)
	rot_type = /datum/component/rot/corpse/orc
	var/gob_outfit = /datum/outfit/job/roguetown/npc/orc
	ambushable = FALSE
	base_intents = list(INTENT_HELP, INTENT_DISARM, INTENT_GRAB, /datum/intent/unarmed/claw, /datum/intent/simple/bite)
	possible_rmb_intents = list()

/mob/living/carbon/human/species/orc/npc
	aggressive = 1
	mode = AI_IDLE
	dodgetime = 15 //they can dodge easily, but have a cooldown on it
	canparry = TRUE
	flee_in_pain = FALSE
	wander = TRUE

/mob/living/carbon/human/species/orc/npc/ambush
	aggressive=1
	mode = AI_IDLE
	dodgetime = 15
	canparry = TRUE
	flee_in_pain = FALSE
	wander = TRUE

/obj/item/bodypart/chest/orc
	dismemberable = 1
/obj/item/bodypart/l_arm/orc
	dismemberable = 1
/obj/item/bodypart/r_arm/orc
	dismemberable = 1
/obj/item/bodypart/r_leg/orc
	dismemberable = 1
/obj/item/bodypart/l_leg/orc
	dismemberable = 1

/obj/item/bodypart/head/orc/update_icon_dropped()
	return

/obj/item/bodypart/head/orc/get_limb_icon()
	return

/obj/item/bodypart/head/orc/skeletonize()
	. = ..()
	icon_state = "orc_skel_head"
	sellprice = 2

/mob/living/carbon/human/species/orc/update_body()
	remove_overlay(BODY_LAYER)
	if(!dna || !dna.species)
		return
	var/datum/species/orc/G = dna.species
	if(!istype(G))
		return
	icon_state = ""
	var/list/standing = list()
	var/mutable_appearance/body_overlay
	var/obj/item/bodypart/chesty = get_bodypart("chest")
	var/obj/item/bodypart/headdy = get_bodypart("head")
	if(!headdy)
		if(chesty && chesty.skeletonized)
			body_overlay = mutable_appearance(icon, "orc_skel_decap", -BODY_LAYER)
		else
			body_overlay = mutable_appearance(icon, "[G.raceicon]_decap", -BODY_LAYER)
	else
		if(chesty && chesty.skeletonized)
			body_overlay = mutable_appearance(icon, "orc_skel", -BODY_LAYER)
		else
			body_overlay = mutable_appearance(icon, "[G.raceicon]", -BODY_LAYER)

	if(body_overlay)
		standing += body_overlay
	if(standing.len)
		overlays_standing[BODY_LAYER] = standing

	apply_overlay(BODY_LAYER)
	dna.species.update_damage_overlays()

/mob/living/carbon/human/species/orc/proc/update_wearable()
	remove_overlay(ARMOR_LAYER)

	var/list/standing = list()
	var/mutable_appearance/body_overlay
	if(wear_armor)
		body_overlay = mutable_appearance(icon, "[wear_armor.item_state]", -ARMOR_LAYER)
		if(body_overlay)
			standing += body_overlay
	if(head)
		body_overlay = mutable_appearance(icon, "[head.item_state]", -ARMOR_LAYER)
		if(body_overlay)
			standing += body_overlay
	if(standing.len)
		overlays_standing[ARMOR_LAYER] = standing

	apply_overlay(ARMOR_LAYER)

/mob/living/carbon/human/species/orc/update_inv_head()
	update_wearable()
/mob/living/carbon/human/species/orc/update_inv_armor()
	update_wearable()

/mob/living/carbon/human/species/orc/Initialize()
	. = ..()
	addtimer(CALLBACK(src, .proc/after_creation), 10)
	configure_mind()

/mob/living/carbon/human/species/orc/proc/configure_mind()
    if(!mind)
        mind = new /datum/mind(src)

    mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
    mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
    mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
    mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
    mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
    mind.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)

/mob/living/carbon/human/species/orc/handle_combat()
	if(mode == AI_HUNT)
		if(prob(2))
			emote("aggro")
	. = ..()

/mob/living/carbon/human/species/orc/after_creation()
	..()
	gender = MALE
	QDEL_NULL(sexcon)
	if(src.dna && src.dna.species)
		src.dna.species.soundpack_m = new /datum/voicepack/orc()
		var/obj/item/headdy = get_bodypart("head")
		if(headdy)
			headdy.icon = 'icons/roguetown/mob/monster/Orc.dmi'
			headdy.icon_state = "[src.dna.species.id]_head"
			headdy.sellprice = rand(15,40)
	src.grant_language(/datum/language/common)
	var/obj/item/organ/eyes/eyes = src.getorganslot(ORGAN_SLOT_EYES)
	if(eyes)
		eyes.Remove(src,1)
		QDEL_NULL(eyes)
	eyes = new /obj/item/organ/eyes/night_vision/nightmare
	eyes.Insert(src)
	src.underwear = "Nude"
	if(src.charflaw)
		QDEL_NULL(src.charflaw)
	update_body()
	faction = list("orcs")
	name = "orc"
	real_name = "orc"
	ADD_TRAIT(src, TRAIT_NOROGSTAM, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
//	ADD_TRAIT(src, TRAIT_NOBREATH, TRAIT_GENERIC)
//	blue breathes underwater, need a new specific one for this maybe organ cheque
//	ADD_TRAIT(src, TRAIT_TOXIMMUNE, TRAIT_GENERIC)
	if(gob_outfit)
		var/datum/outfit/O = new gob_outfit
		if(O)
			equipOutfit(O)

/datum/species/orc
	name = "orc"
	id = "orc"
	species_traits = list(NO_UNDERWEAR,NOEYESPRITES)
	inherent_traits = list(TRAIT_RESISTCOLD,TRAIT_RESISTHIGHPRESSURE,TRAIT_RESISTLOWPRESSURE,TRAIT_RADIMMUNE)
	no_equip = list(SLOT_SHIRT, SLOT_WEAR_MASK, SLOT_GLOVES, SLOT_SHOES, SLOT_PANTS, SLOT_S_STORE)
	nojumpsuit = 1
	sexes = 1
	damage_overlay_type = ""
	var/raceicon = "orc"

/datum/species/orc/update_damage_overlays(var/mob/living/carbon/human/H)
	return

/datum/species/orc/regenerate_icons(var/mob/living/carbon/human/H)
//	H.cut_overlays()
	H.icon_state = ""
	if(H.notransform)
		return 1
	H.update_inv_hands()
	H.update_inv_handcuffed()
	H.update_inv_legcuffed()
	H.update_fire()
	H.update_body()
	var/mob/living/carbon/human/species/orc/G = H
	G.update_wearable()
	H.update_transform()
	return TRUE

/datum/component/rot/corpse/orc/process()
	var/amt2add = 10 //1 second
	if(last_process)
		amt2add = ((world.time - last_process)/10) * amt2add
	last_process = world.time
	amount += amt2add
	var/mob/living/carbon/C = parent
	if(!C)
		qdel(src)
		return
	if(C.stat != DEAD)
		qdel(src)
		return
	var/should_update = FALSE
	if(amount > 20 MINUTES)
		for(var/obj/item/bodypart/B in C.bodyparts)
			if(!B.skeletonized)
				B.skeletonized = TRUE
				should_update = TRUE
	else if(amount > 12 MINUTES)
		for(var/obj/item/bodypart/B in C.bodyparts)
			if(!B.rotted)
				B.rotted = TRUE
				should_update = TRUE
			if(B.rotted)
				var/turf/open/T = C.loc
				if(istype(T))
					T.add_pollutants(/datum/pollutant/rot, 1)
	if(should_update)
		if(amount > 20 MINUTES)
			C.update_body()
			qdel(src)
			return
		else if(amount > 12 MINUTES)
			C.update_body()

/////
////
////
//// OUTFIT//////////////////
////
///

/datum/outfit/job/roguetown/npc/orc/pre_equip(mob/living/carbon/human/H)
	..()
	H.STASTR = 14
	H.STASPD = 12
	H.STACON = 13
	H.STAEND = 13
	var/loadout = rand(1,5)
	switch(loadout)
		if(1) //tribal spear
			r_hand = /obj/item/rogueweapon/spear/stone
			armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron/orc
		if(2) //tribal axe
			r_hand = /obj/item/rogueweapon/sword/iron
			armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron/orc
		if(3) //tribal club
			r_hand = /obj/item/rogueweapon/mace/cudgel
			armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron/orc
			if(prob(10))
				head = /obj/item/clothing/head/roguetown/helmet/orc
				r_hand = /obj/item/rogueweapon/spear/stone
				armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron/orc
				pants = /obj/item/clothing/suit/roguetown/armor/leather/hide/orc
		if(4) //lightly armored sword/flail/daggers
			if(prob(50))
				head = /obj/item/clothing/head/roguetown/helmet/orc
				r_hand = /obj/item/rogueweapon/mace/spiked
				armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron/orc
				pants = /obj/item/clothing/suit/roguetown/armor/leather/hide/orc
			if(prob(30))
				l_hand = /obj/item/rogueweapon/sword/iron
				armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron/orc
			if(prob(23))
				armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron/orc
				r_hand = /obj/item/rogueweapon/battle
				pants = /obj/item/clothing/suit/roguetown/armor/leather/hide/orc
			if(prob(80))
				head = /obj/item/clothing/head/roguetown/helmet/orc
				armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron/orc
				pants = /obj/item/clothing/suit/roguetown/armor/leather/hide/orc
		if(5) //heavy armored sword/flail/shields
			if(prob(30))
				r_hand = /obj/item/rogueweapon/battle
				armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron/orc
				head = /obj/item/clothing/head/roguetown/helmet/orc
			else
				l_hand = /obj/item/rogueweapon/huntingknife/cleaver/combat
				armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron/orc
				head = /obj/item/clothing/head/roguetown/helmet/orc
			if(prob(80))
				head = /obj/item/clothing/head/roguetown/helmet/orc
				armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron/orc
				pants = /obj/item/clothing/suit/roguetown/armor/leather/hide/orc
				r_hand = /obj/item/rogueweapon/battle
			else
				head = /obj/item/clothing/head/roguetown/helmet/orc
				armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron/orc
				r_hand = /obj/item/rogueweapon/battle
			if(prob(50))
				r_hand = /obj/item/rogueweapon/sword/iron
				armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron/orc
				head = /obj/item/clothing/head/roguetown/helmet/orc
			else
				r_hand = /obj/item/rogueweapon/mace/spiked
				armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron/orc
				head = /obj/item/clothing/head/roguetown/helmet/orc
			if(prob(20))
				r_hand = /obj/item/rogueweapon/battle
				armor = /obj/item/clothing/suit/roguetown/armor/plate/half/iron/orc
				head = /obj/item/clothing/head/roguetown/helmet/orc
