/mob/living/simple_animal/hostile/retaliate/rogue/bogbug
	icon = 'icons/roguetown/mob/monster/bogbug.dmi'
	name = "Bog Bug"
	icon_state = "bogbug"
	icon_living = "bogbug"
	icon_dead = "bogbugdead"
	gender = MALE
	emote_hear = null
	emote_see = null
	speak_chance = 1
	turns_per_move = 6
	see_in_dark = 9
	move_to_delay = 1
	base_intents = list(/datum/intent/simple/claw, /datum/intent/simple/stab)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/rawcutlet/xeno = 1,
						/obj/item/natural/hide = 1)

	faction = list("bugs")
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	health = 160
	maxHealth = 160
	melee_damage_lower = 25
	melee_damage_upper = 35
	vision_range = 9
	aggro_vision_range = 9
	environment_smash = ENVIRONMENT_SMASH_NONE
	retreat_distance = 2
	minimum_distance = 1
	milkies = FALSE
	food_type = list(/obj/item/reagent_containers/food/snacks/rogue/meat, /obj/item/bodypart, /obj/item/organ)
	footstep_type = FOOTSTEP_MOB_BAREFOOT
	pooptype = null
	STACON = 13
	STASTR = 10
	STASPD = 15
	STAEND = 15
	deaggroprob = 0
	defprob = 30
	defdrain = 8
	del_on_deaggro = 999 SECONDS
	retreat_health = 0
	food = 0
	attack_sound = list('sound/vo/mobs/bogbug/bogbugattack1.ogg','sound/vo/mobs/bogbug/bogbugattack2.ogg','sound/vo/mobs/bogbug/bogbugattack3.ogg')
	dodgetime = 20
	aggressive = 1
//	stat_attack = UNCONSCIOUS
	remains_type = /obj/effect/decal/remains/bogbug

/obj/effect/decal/remains/bogbug
	name = "remains"
	gender = PLURAL
	icon_state = "bones"
	icon = 'icons/roguetown/mob/monster/vol.dmi'

/mob/living/simple_animal/hostile/retaliate/rogue/bogbug/Initialize()
	. = ..()
	gender = MALE

/mob/living/simple_animal/hostile/retaliate/rogue/bogbug/death(gibbed)
	..()
	update_icon()


/mob/living/simple_animal/hostile/retaliate/rogue/bogbug/update_icon()
	cut_overlays()
	..()

/mob/living/simple_animal/hostile/retaliate/rogue/bogbug/get_sound(input)
	switch(input)
		if("aggro")
			return pick('sound/vo/mobs/bogbug/bogbug1.ogg','sound/vo/mobs/bogbug/bogbug2.ogg','sound/vo/mobs/bogbug/bogbug3.ogg')
		if("pain")
			return pick('sound/vo/mobs/bogbug/bogbughurt2.ogg')
		if("death")
			return pick('sound/vo/mobs/bogbug/bogbughurt1.ogg')
		if("idle")
			return pick('sound/vo/mobs/bogbug/bogbugidle.ogg')
		if("cidle")
			return pick('sound/vo/mobs/bogbug/bogbug3.ogg','sound/vo/mobs/bogbug/bogbugidle.ogg')

/mob/living/simple_animal/hostile/retaliate/rogue/bogbug/taunted(mob/user)
	emote("aggro")
	Retaliate()
	GiveTarget(user)
	return

/mob/living/simple_animal/hostile/retaliate/rogue/bogbug/Life()
	..()
	if(pulledby)
		Retaliate()
		GiveTarget(pulledby)

/mob/living/simple_animal/hostile/retaliate/rogue/bogbug/find_food()
	. = ..()
	if(!.)
		return eat_bodies()

/mob/living/simple_animal/hostile/retaliate/rogue/bogbug/simple_limb_hit(zone)
	if(!zone)
		return ""
	switch(zone)
		if(BODY_ZONE_PRECISE_R_EYE)
			return "head"
		if(BODY_ZONE_PRECISE_L_EYE)
			return "head"
		if(BODY_ZONE_PRECISE_NOSE)
			return "nose"
		if(BODY_ZONE_PRECISE_MOUTH)
			return "mouth"
		if(BODY_ZONE_PRECISE_SKULL)
			return "head"
		if(BODY_ZONE_PRECISE_EARS)
			return "head"
		if(BODY_ZONE_PRECISE_NECK)
			return "neck"
		if(BODY_ZONE_PRECISE_L_HAND)
			return "foreleg"
		if(BODY_ZONE_PRECISE_R_HAND)
			return "foreleg"
		if(BODY_ZONE_PRECISE_L_FOOT)
			return "leg"
		if(BODY_ZONE_PRECISE_R_FOOT)
			return "leg"
		if(BODY_ZONE_PRECISE_STOMACH)
			return "stomach"
		if(BODY_ZONE_PRECISE_GROIN)
			return "tail"
		if(BODY_ZONE_HEAD)
			return "head"
		if(BODY_ZONE_R_LEG)
			return "leg"
		if(BODY_ZONE_L_LEG)
			return "leg"
		if(BODY_ZONE_R_ARM)
			return "foreleg"
		if(BODY_ZONE_L_ARM)
			return "foreleg"
	return ..()

