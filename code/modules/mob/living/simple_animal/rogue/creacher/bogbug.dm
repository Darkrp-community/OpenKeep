// Got this one resprited and remade. I'd rather make a literal reference to CEV: Eris with a resprite rather than use
// the sprites from a Russian C-Word Z*pe Game. It's literally STOLEN from life web. 
// We don't need that. We don't need to lifewebify anything. If it is to have a sprite - we'd rather make it proper.

/mob/living/simple_animal/hostile/retaliate/rogue/sewercarrion
	icon = 'icons/roguetown/mob/monster/sewercarrion.dmi'
	name = "sewercarrion"
	desc = "when humenity first developed the sewers, the cockroaches overfed upon alchemical waste, overgrowing- taking on humen flesh."
	icon_state = "sewercarrion"
	icon_living = "sewercarrion"
	icon_dead = "sewercarriondead"
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
	melee_damage_lower = 18
	melee_damage_upper = 26
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
	remains_type = /obj/effect/decal/remains/sewercarrion
	body_eater = TRUE

/mob/living/simple_animal/hostile/retaliate/rogue/sewercarrion/necrobug
	name = "necrophage"
	icon_state = "necrobug"
	icon_living = "necrobug"
	icon_dead = "necrobugdead"
	desc = "overgrow from alchemical waste and humen flesh, the necrophages spreads across all non-contaminated sewers to the bog."

	butcher_results = list(/obj/item/reagent_containers/food/snacks/meat/rawcutlet/xeno = 2,
						/obj/item/natural/hide = 2)
	STACON = 15
	STASTR = 14
	STASPD = 10
	STAEND = 15
	health = 220
	maxHealth = 220
	melee_damage_lower = 25
	melee_damage_upper = 35

/obj/effect/decal/remains/sewercarrion
	name = "remains"
	gender = PLURAL
	icon_state = "bones"
	icon = 'icons/roguetown/mob/monster/vol.dmi'

/mob/living/simple_animal/hostile/retaliate/rogue/sewercarrion/Initialize()
	. = ..()
	gender = MALE

/mob/living/simple_animal/hostile/retaliate/rogue/sewercarrion/death(gibbed)
	..()
	update_icon()


/mob/living/simple_animal/hostile/retaliate/rogue/sewercarrion/update_icon()
	cut_overlays()
	..()

/mob/living/simple_animal/hostile/retaliate/rogue/sewercarrion/get_sound(input)
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

/mob/living/simple_animal/hostile/retaliate/rogue/sewercarrion/taunted(mob/user)
	emote("aggro")
	Retaliate()
	GiveTarget(user)
	return

/mob/living/simple_animal/hostile/retaliate/rogue/sewercarrion/Life()
	..()
	if(pulledby)
		Retaliate()
		GiveTarget(pulledby)

/mob/living/simple_animal/hostile/retaliate/rogue/sewercarrion/simple_limb_hit(zone)
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

/mob/living/simple_animal/hostile/retaliate/rogue/sewercarrion/update_icon()
	cut_overlays()
	..()
	if(stat != DEAD)
		var/mutable_appearance/eye_lights = mutable_appearance(icon, "sewercarrion-eyes")
		eye_lights.plane = 19
		eye_lights.layer = 19
		add_overlay(eye_lights)

/mob/living/simple_animal/hostile/retaliate/rogue/sewercarrion/necrobug/update_icon()
	cut_overlays()
	..()
	if(stat != DEAD)
		var/mutable_appearance/eye_lights = mutable_appearance(icon, "necrobug-eyes")
		eye_lights.plane = 19
		eye_lights.layer = 19
		add_overlay(eye_lights)