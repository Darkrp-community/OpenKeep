
/datum/antagonist/bandit
	name = "Bandit"
	roundend_category = "bandits"
	antagpanel_category = "Bandit"
	job_rank = ROLE_BANDIT
	antag_hud_type = ANTAG_HUD_TRAITOR
	antag_hud_name = "bandit"
	var/tri_amt
	var/contrib
	confess_lines = list("FREEDOM!!!", "I WILL NOT LIVE IN YOUR WALLS!", "I WILL NOT FOLLOW YOUR RULES!")

/datum/antagonist/bandit/examine_friendorfoe(datum/antagonist/examined_datum,mob/examiner,mob/examined)
	if(istype(examined_datum, /datum/antagonist/bandit))
		return "<span class='boldnotice'>Another free man. My ally.</span>"

/datum/antagonist/bandit/on_gain()
	owner.special_role = "Bandit"
	owner.assigned_role = "Bandit"
	owner.current.job = null
	forge_objectives()
	. = ..()
	move_to_spawnpoint()
	finalize_bandit()
	equip_bandit()

/datum/antagonist/bandit/proc/finalize_bandit()
	owner.current.playsound_local(get_turf(owner.current), 'sound/music/traitor.ogg', 80, FALSE, pressure_affected = FALSE)
	var/mob/living/carbon/human/H = owner.current
	ADD_TRAIT(H, TRAIT_BANDITCAMP, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SEEPRICES, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_STEELHEARTED, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_VILLAIN, TRAIT_GENERIC)
	H.patron = GLOB.patronlist[/datum/patron/inhumen/matthios]

/datum/antagonist/bandit/greet()
	to_chat(owner.current, "<span class='alertsyndie'>I am a BANDIT!</span>")
	to_chat(owner.current, "<span class='info'>Long ago I did a crime worthy of my bounty being hung on the wall outside of the local inn.</span>")
	owner.announce_objectives()
	..()

/datum/antagonist/bandit/proc/forge_objectives()
	return
/*
	if(!(locate(/datum/objective/bandit) in objectives))
		var/datum/objective/bandit/bandit_objective = new
		bandit_objective.owner = owner
		objectives += bandit_objective
	if(!(locate(/datum/objective/escape) in objectives))
		var/datum/objective/escape/boat/escape_objective = new
		escape_objective.owner = owner
		objectives += escape_objective*/

/proc/isbandit(mob/living/M)
	return istype(M) && M.mind && M.mind.has_antag_datum(/datum/antagonist/bandit)

/datum/antagonist/bandit/proc/move_to_spawnpoint()
	owner.current.forceMove(pick(GLOB.bandit_starts))

/datum/antagonist/bandit/proc/equip_bandit()

	owner.unknow_all_people()
	for(var/datum/mind/MF in get_minds())
		owner.become_unknown_to(MF)
	for(var/datum/mind/MF in get_minds("Bandit"))
		owner.i_know_person(MF)
		owner.person_knows_me(MF)

	var/mob/living/carbon/human/H = owner.current
	if(H.mobid in GLOB.character_list)
		GLOB.character_list[H.mobid] = null
	GLOB.chosen_names -= H.real_name
	H.cmode_music = 'sound/music/combat_bandit.ogg'

	addtimer(CALLBACK(H, TYPE_PROC_REF(/mob/living/carbon/human, choose_name_popup), "BANDIT"), 5 SECONDS)
//	H.job = "Bandit"
//	H.advjob = pick("Cheesemaker", "Mercenary", "Barbarian", "Ranger", "Rogue")
	H.equipOutfit(/datum/outfit/job/roguetown/bandit)

	return TRUE

/datum/outfit/job/roguetown/bandit/pre_equip(mob/living/carbon/human/H)
	..()
	H.become_blind("TRAIT_GENERIC")
	var/classes = list("Deserter","Poacher","Brigand")
	var/classchoice = input("Choose your background", "Available backgrounds") as anything in classes

	switch(classchoice)
	
		if("Deserter") //well armored, polearm skill, shield skill. The heavy melee class.
			H.set_blindness(0)
			to_chat(H, span_warning("You were once a soldier employed under a lord, and left illegally. You're capable with armor, shields, and polearms."))
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
			H.change_stat("strength", 2)
			H.change_stat("endurance", 1)
			H.change_stat("constitution", 1)

			armor = /obj/item/clothing/suit/roguetown/armor/plate/rust
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			head = /obj/item/clothing/head/roguetown/helmet/heavy/rust
			beltl = /obj/item/clothing/head/roguetown/menacing/bandit

			if(H.age == AGE_OLD) //old deserters are experts with polearms
				H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)

			switch(pick(1,3))
				if (1 to 2)
					backr = /obj/item/rogueweapon/spear
				if (3)
					backr = /obj/item/rogueweapon/halberd/bardiche

			switch(pick(1,2))
				if (1) //worse leg protection, better neck protection, and a face mask
					pants = /obj/item/clothing/under/roguetown/trou/leather
					neck = /obj/item/clothing/neck/roguetown/chaincoif
					mask = /obj/item/clothing/mask/rogue/facemask
				if (2) //better leg protection, worse neck protection
					pants = /obj/item/clothing/under/roguetown/chainlegs/iron
					neck = /obj/item/clothing/neck/roguetown/chaincoif/iron
					mask = /obj/item/clothing/mask/rogue/shepherd/rag

		if("Poacher") //good perception, speed, bow skill, and knife skill. Also some cooking and skincrafting since they are poachers. The speedy ranged class.
			H.set_blindness(0)
			to_chat(H, span_warning("You illegally hunt within the lands of others, and are quite good at it."))
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/bows, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/tanning, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/traps, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
			H.change_stat("strength", 1)
			H.change_stat("endurance", 1)
			H.change_stat("perception", 2)
			H.change_stat("speed", 2)

			armor = /obj/item/clothing/suit/roguetown/armor/gambeson
			pants = /obj/item/clothing/under/roguetown/trou/leather
			beltr = /obj/item/rogueweapon/huntingknife
			backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow
			beltl = /obj/item/quiver/arrows
			head = /obj/item/clothing/head/roguetown/helmet/leather/volfhelm
			mask = /obj/item/clothing/mask/rogue/shepherd/rag

			if(H.age == AGE_OLD) //old poachers are better at their jobs
				H.mind.adjust_skillrank(/datum/skill/craft/tanning, 1, TRUE)
				H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)
				H.mind.adjust_skillrank(/datum/skill/labor/butchering, 1, TRUE)

			switch(pick(1,3))
				if (1)
					beltr = /obj/item/rogueweapon/huntingknife
				if (2)
					beltr = /obj/item/rogueweapon/huntingknife/cleaver
				if (3)
					beltr = /obj/item/rogueweapon/huntingknife/idagger

		if("Brigand") //good sword skill, shield skill, flail skill, mace skill, slightly speedy. Kind of an all rounder.
			H.set_blindness(0)
			to_chat(H, span_warning("You are experienced with using swords and clubs to threaten and rob others."))
			H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/shields, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
			H.change_stat("strength", 2)
			H.change_stat("endurance", 2)
			H.change_stat("constitution", 1)
			H.change_stat("speed", 1)

			neck = /obj/item/clothing/neck/roguetown/coif
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
			pants = /obj/item/clothing/under/roguetown/trou/leather
			head = /obj/item/clothing/head/roguetown/menacing/bandit
			beltl = /obj/item/clothing/mask/rogue/shepherd/rag

			switch(pick(1,2))
				if (1)
					armor = /obj/item/clothing/suit/roguetown/armor/leather
				if (2)
					armor = /obj/item/clothing/suit/roguetown/armor/leather/hide

			if(H.age == AGE_OLD) //old brigands have been in the business for so long that they have managed to pick up some better gear along the way
				armor = /obj/item/clothing/suit/roguetown/armor/leather/studded
				mask = /obj/item/clothing/mask/rogue/facemask

			switch(pick(1,4))
				if (1)
					beltr = /obj/item/rogueweapon/sword/iron
				if (2)
					beltr = /obj/item/rogueweapon/flail
				if (3)
					beltr = /obj/item/rogueweapon/mace
				if (4)
					beltr = /obj/item/rogueweapon/sword/iron/messer

	H.cure_blind("TRAIT_GENERIC")

	// The commmon skills shared between all bandits
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
 
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/stealing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)

	// The commmon gear shared between all bandits
	belt = /obj/item/storage/belt/rogue/leather
	shoes = /obj/item/clothing/shoes/roguetown/boots
	backl = /obj/item/storage/backpack/rogue/satchel

	switch(pick(1,3))
		if (1 to 2)
			gloves = /obj/item/clothing/gloves/roguetown/leather
			shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/random
		if (3)
			gloves = /obj/item/clothing/gloves/roguetown/angle
			shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black

	H.change_stat("intelligence", -2)
	var/obj/item/bodypart/B = H.get_bodypart("head")
	if(B)
		B.sellprice = rand(66, 123)

	H.ambushable = FALSE

/datum/antagonist/bandit/roundend_report()
	if(owner?.current)
		var/amt = tri_amt
		var/the_name = owner.name
		if(ishuman(owner.current))
			var/mob/living/carbon/human/H = owner.current
			the_name = H.real_name
		if(!amt)
			to_chat(world, "[the_name] was a bandit.")
		else
			to_chat(world, "[the_name] was a bandit. He stole [amt] triumphs worth of loot.")
	return

	var/traitorwin = TRUE

	var/count = 0
	if(objectives.len)//If the traitor had no objectives, don't need to process this.
		for(var/datum/objective/objective in objectives)
			objective.update_explanation_text()
			if(!objective.check_completion())
				traitorwin = FALSE
			count += objective.triumph_count

	if(!count)
		count = 1

	if(traitorwin)
		owner.adjust_triumphs(count)
		to_chat(owner.current, "<span class='greentext'>I've TRIUMPHED!</span>")
		if(owner.current)
			owner.current.playsound_local(get_turf(owner.current), 'sound/misc/triumph.ogg', 100, FALSE, pressure_affected = FALSE)
	else
		to_chat(owner.current, "<span class='redtext'>I've failed to satisfy my greed.</span>")
		if(owner.current)
			owner.current.playsound_local(get_turf(owner.current), 'sound/misc/fail.ogg', 100, FALSE, pressure_affected = FALSE)

