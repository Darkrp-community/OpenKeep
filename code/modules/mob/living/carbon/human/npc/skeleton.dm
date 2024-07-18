/mob/living/carbon/human/species/skeleton
	name = "skeleton"

	race = /datum/species/human/northern
	gender = MALE
	bodyparts = list(/obj/item/bodypart/chest, /obj/item/bodypart/head, /obj/item/bodypart/l_arm,
					 /obj/item/bodypart/r_arm, /obj/item/bodypart/r_leg, /obj/item/bodypart/l_leg)
	faction = list("undead")
	var/skel_outfit = /datum/outfit/job/roguetown/npc/skeleton
	ambushable = FALSE
	rot_type = null
	possible_rmb_intents = list()

/mob/living/carbon/human/species/skeleton/npc
	aggressive = 1
	mode = AI_IDLE
	wander = TRUE

/mob/living/carbon/human/species/skeleton/Initialize()
	. = ..()
	cut_overlays()
	spawn(10)
		after_creation()

//	addtimer(CALLBACK(src, PROC_REF(after_creation)), 10)  fired loadout equip again, leading to duping inhands. Unclear why its here.

/mob/living/carbon/human/species/skeleton/after_creation()
	..()
	if(src.dna && src.dna.species)
		src.dna.species.species_traits |= NOBLOOD
		src.dna.species.soundpack_m = new /datum/voicepack/skeleton()
		src.dna.species.soundpack_f = new /datum/voicepack/skeleton()
	var/obj/item/bodypart/O = src.get_bodypart(BODY_ZONE_R_ARM)
	if(O)
		O.drop_limb()
		qdel(O)
	O = src.get_bodypart(BODY_ZONE_L_ARM)
	if(O)
		O.drop_limb()
		qdel(O)
	src.regenerate_limb(BODY_ZONE_R_ARM)
	src.regenerate_limb(BODY_ZONE_L_ARM)
	for(var/obj/item/bodypart/B in src.bodyparts)
		B.skeletonize()
	var/obj/item/organ/eyes/eyes = src.getorganslot(ORGAN_SLOT_EYES)
	if(eyes)
		eyes.Remove(src,1)
		QDEL_NULL(eyes)
	eyes = new /obj/item/organ/eyes/night_vision/zombie
	eyes.Insert(src)
	src.underwear = "Nude"
	if(src.charflaw)
		QDEL_NULL(src.charflaw)
	update_body()
	mob_biotypes = MOB_UNDEAD
	faction = list("undead")
	name = "skeleton"
	real_name = "skeleton"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOROGSTAM, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOLIMBDISABLE, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_EASYDISMEMBER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_CRITICAL_WEAKNESS, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOBREATH, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOPAIN, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_TOXIMMUNE, TRAIT_GENERIC)
	if(skel_outfit)
		var/datum/outfit/OU = new skel_outfit
		if(OU)
			equipOutfit(OU)


/datum/outfit/job/roguetown/npc/skeleton/random/pre_equip(mob/living/carbon/human/H)
	..()

	H.STASTR = 6
	H.STASPD = 10
	H.STACON = 8
	H.STAEND = 8
	H.STAINT = 1


///////////////////////////////////////////////////////////// EVENTMIN SKELETONGS

/mob/living/carbon/human/species/skeleton/npc/peasant/after_creation()
	..()
	QDEL_NULL(sexcon)
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOROGSTAM, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_EASYDISMEMBER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_CRITICAL_WEAKNESS, TRAIT_GENERIC)
	equipOutfit(new /datum/outfit/job/roguetown/species/skeleton/npc/peasant)
	aggressive=1
	mode = AI_IDLE
	dodgetime = 15
	canparry = TRUE
	flee_in_pain = FALSE
	wander = TRUE

/datum/outfit/job/roguetown/species/skeleton/npc/peasant/pre_equip(mob/living/carbon/human/H)
	..()
	H.STASTR = 6
	H.STASPD = 8
	H.STACON = 8
	H.STAEND = 8
	var/loadout = rand(1,6)
	switch(loadout)
		if(1) //Axe Warrior
			r_hand = /obj/item/rogueweapon/woodcut
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant
			pants = /obj/item/clothing/under/roguetown/tights/vagrant
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			head = /obj/item/clothing/head/roguetown/roguehood
		if(2) //Long Stick Fighter
			r_hand = /obj/item/rogueweapon/woodstaff
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant
			pants = /obj/item/clothing/under/roguetown/tights/vagrant
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			head = /obj/item/clothing/head/roguetown/roguehood
		if(3) //Club Caveman
			r_hand = /obj/item/rogueweapon/mace/woodclub
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant
			pants = /obj/item/clothing/under/roguetown/tights/vagrant
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			head = /obj/item/clothing/head/roguetown/roguehood
		if(4) //Stabbity Stabbity your Knight is now horizontality
			r_hand =/obj/item/rogueweapon/pitchfork
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant
			pants = /obj/item/clothing/under/roguetown/tights/vagrant
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			head = /obj/item/clothing/head/roguetown/roguehood
		if(5) //Bonk Build
			r_hand = /obj/item/rogueweapon/thresher
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant
			pants = /obj/item/clothing/under/roguetown/tights/vagrant
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			head = /obj/item/clothing/head/roguetown/roguehood
		if(6) //Bonk Build
			r_hand = /obj/item/rogueweapon/hoe
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant
			pants = /obj/item/clothing/under/roguetown/tights/vagrant
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			head = /obj/item/clothing/head/roguetown/roguehood

///////////////////////////////////////////////////////////// EVENTMIN SKELETONGS
/mob/living/carbon/human/species/skeleton/npc/ambush/after_creation()
	..()
	QDEL_NULL(sexcon)
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOROGSTAM, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_EASYDISMEMBER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_CRITICAL_WEAKNESS, TRAIT_GENERIC)
	equipOutfit(new /datum/outfit/job/roguetown/species/skeleton/npc/random)
	aggressive=1
	mode = AI_IDLE
	dodgetime = 15
	canparry = TRUE
	flee_in_pain = FALSE
	wander = TRUE

/datum/outfit/job/roguetown/species/skeleton/npc/random/pre_equip(mob/living/carbon/human/H)
	..()
	if(prob(50))
		wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	if(prob(50))
		armor = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
	if(prob(30))
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant
		if(prob(50))
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant/l
	if(prob(50))
		pants = /obj/item/clothing/under/roguetown/tights/vagrant
		if(prob(50))
			pants = /obj/item/clothing/under/roguetown/tights/vagrant/l
	if(prob(50))
		head = /obj/item/clothing/head/roguetown/helmet/leather
	if(prob(50))
		head = /obj/item/clothing/head/roguetown/roguehood
	if(prob(50))
		r_hand = /obj/item/rogueweapon/sword/iron
	else
		r_hand = /obj/item/rogueweapon/mace/woodclub

///////////////////////////////////////////////////////////// EVENTMIN SKELETONGS

/mob/living/carbon/human/species/skeleton/npc/warrior/after_creation()
	..()
	QDEL_NULL(sexcon)
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOROGSTAM, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_EASYDISMEMBER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_CRITICAL_WEAKNESS, TRAIT_GENERIC)
	equipOutfit(new /datum/outfit/job/roguetown/species/skeleton/npc/warrior)
	aggressive=1
	mode = AI_IDLE
	dodgetime = 15
	canparry = TRUE
	flee_in_pain = FALSE
	wander = TRUE

/datum/outfit/job/roguetown/species/skeleton/npc/warrior/pre_equip(mob/living/carbon/human/H)
	..()
	H.STASTR = 10
	H.STASPD = 7
	H.STACON = 10
	H.STAEND = 10
	var/loadout = rand(1,6)
	switch(loadout)
		if(1) //Skeleton Warrior
			r_hand = /obj/item/rogueweapon/sword/iron
			l_hand = /obj/item/rogueweapon/shield/wood
			belt = /obj/item/storage/belt/rogue/leather
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant
			pants = /obj/item/clothing/under/roguetown/tights/vagrant
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			neck = /obj/item/clothing/neck/roguetown/chaincoif
			head = /obj/item/clothing/head/roguetown/helmet/kettle
		if(2)//Skeleton Warrior
			r_hand = /obj/item/rogueweapon/mace
			l_hand = /obj/item/rogueweapon/shield/wood
			belt = /obj/item/storage/belt/rogue/leather
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant
			pants = /obj/item/clothing/under/roguetown/tights/vagrant
			neck = /obj/item/clothing/neck/roguetown/chaincoif
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			head = /obj/item/clothing/head/roguetown/helmet/kettle
		if(3) //Skeleton Warrior
			r_hand = /obj/item/rogueweapon/flail
			l_hand = /obj/item/rogueweapon/shield/wood
			belt = /obj/item/storage/belt/rogue/leather
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant
			pants = /obj/item/clothing/under/roguetown/tights/vagrant
			neck = /obj/item/clothing/neck/roguetown/chaincoif
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			head = /obj/item/clothing/head/roguetown/helmet/skullcap
		if(4) //Skeleton Warrior
			r_hand =/obj/item/rogueweapon/spear
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant
			neck = /obj/item/clothing/neck/roguetown/chaincoif
			pants = /obj/item/clothing/under/roguetown/tights/vagrant
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			head = /obj/item/clothing/head/roguetown/helmet/kettle
		if(5) //Skeleton Warrior
			r_hand = /obj/item/rogueweapon/sword/sabre
			l_hand = /obj/item/rogueweapon/huntingknife/idagger
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant
			pants = /obj/item/clothing/under/roguetown/tights/vagrant
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			neck = /obj/item/clothing/neck/roguetown/chaincoif
			head = /obj/item/clothing/head/roguetown/helmet/kettle
		if(6) //Skeleton Warrior
			r_hand = /obj/item/rogueweapon/sword/iron/messer
			l_hand = /obj/item/rogueweapon/huntingknife/idagger
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/vagrant
			pants = /obj/item/clothing/under/roguetown/tights/vagrant
			neck = /obj/item/clothing/neck/roguetown/chaincoif
			armor = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			head = /obj/item/clothing/head/roguetown/helmet/skullcap