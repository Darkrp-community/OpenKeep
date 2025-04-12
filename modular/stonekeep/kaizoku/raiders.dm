// These guys are mostly meant to appear only on events.
// It would be unwise to put them anywhere 'spawnable' unless it is the ocean. As in, it would make completely sense for them to raid beaches.

GLOBAL_LIST_INIT(custodian_quotes, world.file2list("strings/rt/custodianlines.txt"))
GLOBAL_LIST_INIT(custodian_aggro, world.file2list("strings/rt/custodianaggrolines.txt"))
GLOBAL_LIST_INIT(custodian_special, world.file2list("strings/rt/custodianspecial.txt"))
GLOBAL_LIST_INIT(custodian_tease, world.file2list("strings/rt/custodiantease.txt"))
GLOBAL_LIST_INIT(custodian_handsoff, world.file2list("strings/rt/custodian_handsoff.txt"))

/mob/living/carbon/human/species/abyssariad/raider
	mode = AI_IDLE
	faction = list("burakumin")
	ambushable = FALSE
	dodgetime = 3 SECONDS
	flee_in_pain = TRUE
	possible_rmb_intents = list(/datum/rmb_intent/strong)
	aggressive = 1
	wander = FALSE
	abyssariadraider = TRUE
	shuriken_count = 3

/mob/living/carbon/human/species/abyssariad/raider/retaliate(mob/living/L) //handle_combat may be better for this one. Remember to check.
	var/newtarg = target
	.=..()
	if(target)
		aggressive=1
		wander = TRUE
		if(prob(25)) //Throw a Shuriken on the enemy. I tried making it a possible attack depending of how far the enemy is. Didn't worked.
			src.throw_star(L)
		if(target != newtarg)
			emote("rage")
			say(pick(GLOB.custodian_aggro))

/mob/living/carbon/human/species/abyssariad/raider/Initialize()
	. = ..()
	var/list/racetypes = list("Changeling" = 1, "Skylancer" = 1, "Ogrun" = 1)
	var/type = pickweight(racetypes)
	src.gender = MALE // lore implications.
	switch(type)
		if("Changeling")
			set_species(/datum/species/abyssariad/changeling)
		if("Skylancer")
			set_species(/datum/species/abyssariad/skylancer)
		if("Ogrun")
			set_species(/datum/species/abyssariad/ogrun)
	addtimer(CALLBACK(src, PROC_REF(after_creation)), 1 SECONDS)
	d_intent = INTENT_PARRY
	canparry = TRUE
	cmode = 1
	mode = AI_IDLE
	canparry = TRUE
	wander = TRUE

/mob/living/carbon/human/species/abyssariad/raider/npc_idle()
	if(m_intent == MOVE_INTENT_SNEAK)
		return
	if(world.time < next_idle)
		return
	next_idle = world.time + rand(30, 70)
	if((mobility_flags & MOBILITY_MOVE) && isturf(loc) && wander)
		if(prob(20))
			var/turf/T = get_step(loc, pick(GLOB.cardinals))
			if(!istype(T, /turf/open/transparent/openspace))
				Move(T)
		else
			face_atom(get_step(src, pick(GLOB.cardinals)))
	else if(!wander && prob(10))
		face_atom(get_step(src, pick(GLOB.cardinals)))
	// Healing after being idle for some time
	if(prob(5) && src.health < src.maxHealth)
		var/greenpoultice = 100
		src.apply_damage(-greenpoultice, BRUTE)
		src.apply_damage(-greenpoultice, BURN)
		visible_message(span_notice("[src] spreads a green poultice on the body."))
		src.regenerate_organs()
		src.spill_embedded_objects()

		var/list/hurt_limbs = src.get_damaged_bodyparts(1, 1, null, BODYPART_ORGANIC)
		for(var/obj/item/bodypart/X in hurt_limbs)
			if(X.heal_damage(greenpoultice, greenpoultice, null, BODYPART_ORGANIC))
				src.update_damage_overlays()
		src.updatehealth()
	if(prob(3))
		say(pick(GLOB.custodian_quotes))
	if(prob(3))
		emote(pick("laugh", "throatsing"))

/mob/living/carbon/human/species/abyssariad/raider/after_creation()
	..()
	if(!mind)
		mind = new /datum/mind(src)
	mind.transfer_to(src)

	if(mind?.get_language_holder())
		grant_language(/datum/language/common)
		grant_language(/datum/language/abyssal)

//custodian lowclass class

/mob/living/carbon/human/species/abyssariad/raider/retainer/after_creation()
	..()
	job = "Exiled Retainer"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

	equipOutfit(new /datum/outfit/job/roguetown/antag/raider/retainer)
	defprob = 50
	configure_mind()
	d_intent = INTENT_DODGE
	aggressive=1
	mode = AI_IDLE
	dodgetime = 6 SECONDS
	canparry = TRUE

	flee_in_pain = TRUE
	ambushable = FALSE

/datum/outfit/job/roguetown/antag/raider/retainer/pre_equip(mob/living/carbon/human/H)
	..()

	H.STASTR = rand(11,13)
	H.STASPD = rand(10,12)
	H.STACON = rand(11,13)
	H.STAEND = rand(11,13)
	H.STAINT = rand(10,12)

	shirt = /obj/item/clothing/armor/gambeson/ruankai
	mask = /obj/item/clothing/face/kaizoku/menpo/half
	cloak = /obj/item/clothing/cloak/stabard/haramaki/jinbaori/raider
	shoes = /obj/item/clothing/shoes/boots/jikatabi/shinobi
	belt = /obj/item/storage/belt/kaizoku/leather/daisho/random
	neck = /obj/item/clothing/neck/chaincoif/iron/kusari_zukin
	pants = /obj/item/clothing/pants/chainlegs/iron/haidate_tatami

	var/loadout = rand(1, 4)
	switch(loadout)
		if(1)
			r_hand = /obj/item/weapon/sword/scimitar/messer/dao
			l_hand = /obj/item/weapon/shield/wood/rattan
			armor = /obj/item/clothing/armor/cuirass/sanmaido
			head = /obj/item/clothing/head/helmet/kaizoku/jingasa
		if(2)
			r_hand = /obj/item/weapon/mace/steel/ararebo
			l_hand = /obj/item/weapon/shield/wood/rattan
			head = /obj/item/clothing/head/helmet/kaizoku/hachigane
			armor = /obj/item/clothing/armor/chainmail/tatami
		if(3)
			r_hand = /obj/item/weapon/flail/sflail/kusarifundo
			l_hand = /obj/item/weapon/shield/wood/rattan
			armor = /obj/item/clothing/armor/chainmail/tatami
			head = /obj/item/clothing/head/helmet/kaizoku/jingasa
		if(4)
			r_hand = /obj/item/weapon/polearm/spear/yari/katakama
			armor = /obj/item/clothing/armor/cuirass/nanbando
			head = /obj/item/clothing/head/helmet/kaizoku/jingasa

/mob/living/carbon/human/species/abyssariad/raider/retainer/proc/configure_mind()
	mind = new /datum/mind(src)
	mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)

	mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)

	mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	mind.adjust_skillrank(/datum/skill/craft/tanning, 1, TRUE)

//lowclass Custodian class

/mob/living/carbon/human/species/abyssariad/raider/custodian/after_creation()
	..()
	job = "Lowclass Custodian"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
	equipOutfit(new /datum/outfit/job/roguetown/antag/raider/custodian)
	defprob = 60 //more skilled
	configure_mind()
	d_intent = INTENT_PARRY //these ones will parry instead of dodge, the higher the skill the more powerful this is of course
	aggressive = 1
	mode = AI_IDLE
	dodgetime = 4 SECONDS
	canparry = TRUE

	flee_in_pain = TRUE
	ambushable = FALSE

/datum/outfit/job/roguetown/antag/raider/custodian/pre_equip(mob/living/carbon/human/H)
	..()

	H.STASTR = rand(13,15)
	H.STASPD = rand(11,12)
	H.STACON = rand(13,15)
	H.STAEND = rand(12,15)
	H.STAINT = rand(10,12)

	pants = /obj/item/clothing/pants/chainlegs/sendan/cursed
	mask = /obj/item/clothing/face/kaizoku/menpo
	cloak = /obj/item/clothing/cloak/stabard/haramaki/odoshi/raider
	shoes = /obj/item/clothing/shoes/boots/armor/suneate/cursed
	belt = /obj/item/storage/belt/kaizoku/leather/daisho/random
	wrists = /obj/item/clothing/wrists/bracers/kote/cursed
	neck = /obj/item/clothing/neck/roguetown/chaincoif/karuta_zukin

	var/loadout = rand(1, 4)
	switch(loadout)
		if(1)
			r_hand = /obj/item/weapon/sword/uchigatana
			l_hand = /obj/item/weapon/shield/tower/abyssaltower
			armor = /obj/item/clothing/armor/plate/mirror
			head = /obj/item/clothing/head/helmet/sallet/tosei_kabuto/cursed
			shirt = /obj/item/clothing/armor/gambeson/light/hitatare/random
		if(2)
			r_hand = /obj/item/weapon/mace/steel/ararebo
			l_hand = /obj/item/weapon/shield/tower/abyssaltower
			head = /obj/item/clothing/head/helmet/sallet/tosei_kabuto/cursed
			armor = /obj/item/clothing/armor/chainmail/hauberk/kusari
			shirt = /obj/item/clothing/armor/gambeson/ruankai
		if(3)
			r_hand = /obj/item/weapon/polearm/halberd/bardiche/naginata/dustcurse
			armor = /obj/item/clothing/armor/medium/surcoat/heartfelt/abyssariad
			head = /obj/item/clothing/head/helmet/sallet/tosei_kabuto/cursed
			shirt = /obj/item/clothing/armor/chainmail/tatami
		if(4)
			r_hand = /obj/item/weapon/mace/goden/kanabo
			armor =/obj/item/clothing/armor/medium/surcoat/heartfelt/abyssariad
			head = /obj/item/clothing/head/helmet/sallet/tosei_kabuto/cursed
			shirt = /obj/item/clothing/armor/chainmail/tatami

/mob/living/carbon/human/species/abyssariad/raider/custodian/proc/configure_mind()
	mind = new /datum/mind(src)
	mind.adjust_skillrank(/datum/skill/combat/axesmaces, 5, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/swords, 5, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/polearms, 5, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/wrestling, 5, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/unarmed, 5, TRUE)

	mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)

	mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	mind.adjust_skillrank(/datum/skill/craft/tanning, 1, TRUE)

//highclass custodian

/mob/living/carbon/human/species/abyssariad/raider/highcustodian/after_creation()
	..()
	job = "Exiled High Custodian"
	ADD_TRAIT(src, TRAIT_NOMOOD, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOHUNGER, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_HEAVYARMOR, TRAIT_GENERIC)

	equipOutfit(new /datum/outfit/job/roguetown/antag/raider/highcustodian)
	defprob = 70 //even more skilled. I don't even know if that works, honestly.
	configure_mind()
	d_intent = INTENT_PARRY //these ones will parry instead of dodge, the higher the skill the more powerful this is of course
	aggressive = 1
	mode = AI_IDLE
	dodgetime = 4 SECONDS
	canparry = TRUE

	flee_in_pain = TRUE
	ambushable = FALSE

/datum/outfit/job/roguetown/antag/raider/highcustodian
	name = "Exiled Highclass Custodian"

/datum/outfit/job/roguetown/antag/raider/highcustodian/pre_equip(mob/living/carbon/human/H)
	..()
	H.STASTR = rand(13,16)
	H.STASPD = rand(11,13)
	H.STACON = rand(13,16)
	H.STAEND = rand(12,16)
	H.STAINT = rand(10,13)

	pants = /obj/item/clothing/pants/chainlegs/sendan/cursed
	mask = /obj/item/clothing/face/kaizoku/menpo/steel
	cloak = /obj/item/clothing/cloak/stabard/haramaki/odoshi/raider
	shoes = /obj/item/clothing/shoes/boots/armor/suneate/cursed
	belt = /obj/item/storage/belt/kaizoku/leather/daisho/random
	wrists = /obj/item/clothing/wrists/bracers/kote/cursed
	neck = /obj/item/clothing/neck/roguetown/chaincoif/karuta_zukin

	var/loadout = rand(1, 4)
	switch(loadout)
		if(1)
			r_hand = /obj/item/weapon/mace/goden/steel/tetsubo/dustcurse
			armor = /obj/item/clothing/armor/plate/full/nanbando/cursed
			head = /obj/item/clothing/head/helmet/visored/zunari/cursed
			shirt = /obj/item/clothing/armor/chainmail/hauberk/kusari
		if(2)
			r_hand = /obj/item/weapon/polearm/halberd/bisento/dustcurse
			armor = /obj/item/clothing/armor/plate/full/nanbando/cursed
			head = /obj/item/clothing/head/helmet/sallet/tosei_kabuto/cursed
			shirt = /obj/item/clothing/armor/chainmail/hauberk/kusari
		if(3)
			r_hand = /obj/item/weapon/mace/steel/ararebo
			l_hand = /obj/item/weapon/shield/tower/abyssaltower
			armor = /obj/item/clothing/armor/brigandine/oyoroi
			head = /obj/item/clothing/head/helmet/visored/zunari/cursed
			shirt = /obj/item/clothing/armor/gambeson/ruankai
		if(4)
			r_hand = /obj/item/weapon/sword/long/tachi/dustcurse
			l_hand = /obj/item/weapon/shield/tower/metal/abyssal/dustcurse
			armor = /obj/item/clothing/armor/brigandine/oyoroi/oyoroigusoku/cursed
			head = /obj/item/clothing/head/helmet/sallet/tosei_kabuto/cursed
			shirt = /obj/item/clothing/armor/gambeson/ruankai

/mob/living/carbon/human/species/abyssariad/raider/highcustodian/proc/configure_mind()
	mind = new /datum/mind(src)
	mind.adjust_skillrank(/datum/skill/combat/axesmaces, 5, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/swords, 5, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/polearms, 5, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/wrestling, 5, TRUE)
	mind.adjust_skillrank(/datum/skill/combat/unarmed, 5, TRUE)

	mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)
	mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
	mind.adjust_skillrank(/datum/skill/craft/tanning, 1, TRUE)
	mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
