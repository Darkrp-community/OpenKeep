/mob/living/simple_animal/hostile/retaliate/rogue/lobster
	icon = 'icons/roguetown/mob/monster/lobsters.dmi'
	name = "marsh crawler"
	desc = "A swamp-dwelling creacher with a hardened carapace and pinching claws A relatively harmless scavenger, they eat detritus from the bog."
	icon_state = "marshcrawler"
	icon_living = "marshcrawler"
	icon_dead = "marshcrawler_dead"
	emote_see = list("snaps it's claws.","piches the air.")
	density = FALSE
	faction = list("neutral") //these shouldnt be aggressive
	pass_flags = PASSTABLE | PASSMOB

	botched_butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/lobster = 1)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/lobster = 2)
	perfect_butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/lobster = 2, /obj/item/reagent_containers/food/snacks/fat)

	health = CHICKEN_HEALTH
	maxHealth = CHICKEN_HEALTH

	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently pushes aside"
	response_disarm_simple = "gently push aside"
	response_harm_continuous = "kicks"
	response_harm_simple = "kick"

	food_type = list(/obj/item/reagent_containers/food/snacks/rogue/meat,
					/obj/item/bodypart,
					/obj/item/organ)

	base_intents = list(/datum/intent/simple/claw)
	attack_sound = list('sound/vo/mobs/bogbug/bogbugattack1.ogg','sound/vo/mobs/bogbug/bogbugattack2.ogg','sound/vo/mobs/bogbug/bogbugattack3.ogg')
	melee_damage_lower = 2
	melee_damage_upper = 10

	STACON = 5
	STASTR = 5
	STASPD = 5
	STAEND = 5

	retreat_distance = 2
	minimum_distance = 1
	deaggroprob = 0
	defprob = 30
	defdrain = 8
	del_on_deaggro = 999 SECONDS
	retreat_health = 0
	food = 0

	dodgetime = 20
	aggressive = 0
//	stat_attack = UNCONSCIOUS
	body_eater = TRUE

/mob/living/simple_animal/hostile/retaliate/rogue/lobster/strong
	name = "blood crawler"
	desc = "A swamp-dwelling creacher with a hardened carapace and pinching claws. They have developed a taste for flesh, and they no longer wait for their meal to die first."
	icon_state = "bloodcrawler"
	icon_living = "bloodhcrawler"
	icon_dead = "bloodcrawler_dead"
	health =  VOLF_HEALTH //110hp
	maxHealth =  VOLF_HEALTH
	faction = list("bugs")

	melee_damage_lower = 10
	melee_damage_upper = 25 //wider range of damage than  volves
	STACON = 7
	STASTR = 7
	STASPD = 6
	STAEND = 10
	body_eater = TRUE


/obj/effect/decal/remains/lobster
	name = "remains"
	gender = PLURAL
	icon_state = "bones"
	icon = 'icons/roguetown/mob/monster/vol.dmi'

/mob/living/simple_animal/hostile/retaliate/rogue/lobster/Initialize()
	. = ..()
	gender = MALE

/mob/living/simple_animal/hostile/retaliate/rogue/lobster/death(gibbed)
	..()
	update_icon()


/mob/living/simple_animal/hostile/retaliate/rogue/lobster/update_icon()
	cut_overlays()
	..()

/mob/living/simple_animal/hostile/retaliate/rogue/lobster/get_sound(input)
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

/mob/living/simple_animal/hostile/retaliate/rogue/lobster/taunted(mob/user)
	emote("aggro")
	Retaliate()
	GiveTarget(user)
	return

/mob/living/simple_animal/hostile/retaliate/rogue/lobster/Life()
	..()
	if(pulledby)
		Retaliate()
		GiveTarget(pulledby)

/mob/living/simple_animal/hostile/retaliate/rogue/lobster/simple_limb_hit(zone)
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
