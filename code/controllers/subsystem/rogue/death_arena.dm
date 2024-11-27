
SUBSYSTEM_DEF(death_arena)
	name = "Death Arena"
	wait = 2 SECONDS
	flags = SS_NO_INIT
	priority = 1

	var/obj/effect/landmark/death_arena/first_spawn
	var/obj/effect/landmark/death_arena/second/second_spawn
	var/list/waiting_fighters = list()
	///this is just so I can easily reference the head later
	var/list/fighters_heads = list()
	var/list/fighters = list()
	var/fighting = FALSE

/datum/controller/subsystem/death_arena/fire(resumed = 0)
	if(!first_spawn || !second_spawn)
		return
	if(fighting)
		return
	if(length(waiting_fighters < 2))
		return
	start_fight()

/datum/controller/subsystem/death_arena/proc/add_fighter(mob/living/fighter)
	waiting_fighters += fighter

/datum/controller/subsystem/death_arena/proc/remove_fighter(mob/living/fighter)
	waiting_fighters -= fighter

/datum/controller/subsystem/death_arena/proc/start_fight()
	var/mob/living/carbon/spirit/first = pick(waiting_fighters)
	remove_fighter(first)
	var/mob/living/carbon/human/species/skeleton/first_skeleton = new /mob/living/carbon/human/species/skeleton(get_turf(first_spawn))
	first_skeleton.name = first.livingname
	first_skeleton.equipOutfit(new /datum/outfit/job/roguetown/arena_skeleton)

	var/mob/living/carbon/spirit/second = pick(waiting_fighters)
	remove_fighter(second)
	var/mob/living/carbon/human/species/skeleton/second_skeleton = new /mob/living/carbon/human/species/skeleton(get_turf(second_spawn))
	second_skeleton.name = first.livingname
	second_skeleton.equipOutfit(new /datum/outfit/job/roguetown/arena_skeleton)

	fighters = list(first_skeleton, second_skeleton)

	fighters_heads = list(first_skeleton.get_bodypart(BODY_ZONE_HEAD), second_skeleton.get_bodypart(BODY_ZONE_HEAD))

	first_skeleton.forceMove(get_turf(first_spawn))
	second_skeleton.forceMove(get_turf(second_spawn))

	qdel(first)
	qdel(second)

	fighting = TRUE

/datum/controller/subsystem/death_arena/proc/try_end_fight(obj/item/bodypart/head/head, mob/living/carbon/user)
	if(!istype(head))
		return FALSE
	if(!(head in fighters_heads))
		return FALSE
	return TRUE

/datum/controller/subsystem/death_arena/proc/process_fight_end(obj/item/bodypart/head/head, mob/living/carbon/user)
	if(!try_end_fight(head, user))
		return

	fighters_heads = list()
	user.returntolobby()

	for(var/mob/living/carbon/carbon in fighters)
		fighters -= carbon
		if(carbon != user)
			var/turf/spawn_loc = pick(GLOB.underworldcoinspawns)
			var/mob/living/carbon/spirit/O = new /mob/living/carbon/spirit(spawn_loc)
			O.livingname = carbon.name
			O.ckey = carbon.ckey
		qdel(carbon)
	fighters = list()

	fighting = FALSE

/datum/outfit/job/roguetown/arena_skeleton/pre_equip(mob/living/carbon/human/H, visualsOnly)
	..()
	H.change_stat("strength", 1)
	H.change_stat("endurance", 1)

	H.mind?.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
	H.mind?.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)

	r_hand = /obj/item/rogueweapon/sword/iron
	l_hand = /obj/item/rogueweapon/shield/wood
	beltr = /obj/item/rogueweapon/axe/iron


/obj/structure/table/wood/fine/altar
	name = "Ravox's sacrifical altar"
	desc = "It awaits an offering of your triumphs"

/obj/structure/table/wood/fine/altar/after_added_effects(obj/item/item, mob/user)
	if(!istype(item, obj/item/bodypart/head))
		return
	process_fight_end(item, user)
