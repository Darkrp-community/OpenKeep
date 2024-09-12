/obj/item/neuFarm/seed
	name = "seeds"
	icon = 'modular/Neu_Farming/icons/produce.dmi'
	icon_state = "seeds"
	w_class = WEIGHT_CLASS_TINY
	resistance_flags = FLAMMABLE
	possible_item_intents = list(/datum/intent/use)
	var/plant_def_type
	var/seed_identity = "some seed"

/obj/item/neuFarm/seed/Initialize()
	. = ..()
	if(plant_def_type)
		var/datum/plant_def/def = GLOB.plant_defs[plant_def_type]
		color = def.seed_color

/obj/item/neuFarm/seed/Crossed(mob/living/L)
	. = ..()
	// Chance to destroy the seed as it's being stepped on
	if(prob(35) && istype(L))
		qdel(src)

/obj/item/neuFarm/seed/examine(mob/user)
	. = ..()
	var/show_real_identity = FALSE
	if(isliving(user))
		var/mob/living/living = user
		// Seed knowers, know the seeds (druids and such)
		if(HAS_TRAIT(living, TRAIT_SEEDKNOW))
			show_real_identity = TRUE
		// Journeyman farmers know them too
		else if(living.mind.get_skill_level(/datum/skill/labor/farming) >= 2)
			show_real_identity = TRUE
	else
		show_real_identity = TRUE
	if(show_real_identity)
		. += span_info("I can tell these are [seed_identity]")

/obj/item/neuFarm/seed/attack_turf(turf/T, mob/living/user)
	var/obj/structure/soil/soil = get_soil_on_turf(T)
	if(soil)
		try_plant_seed(user, soil)
		return
	else if(istype(T, /turf/open/floor/rogue/dirt))
		to_chat(user, span_notice("I begin making a mound for the seeds..."))
		if(do_after(user, get_farming_do_time(user, 10 SECONDS), target = src))
			apply_farming_fatigue(user, 30)
			soil = get_soil_on_turf(T)
			if(!soil)
				soil = new /obj/structure/soil(T)
		return
	. = ..()

/obj/item/neuFarm/seed/proc/try_plant_seed(mob/living/user, obj/structure/soil/soil)
	if(soil.plant)
		to_chat(user, span_warning("There is already something planted in \the [soil]!"))
		return
	if(!plant_def_type)
		return
	to_chat(user, span_notice("I plant \the [src] in \the [soil]."))
	soil.insert_plant(GLOB.plant_defs[plant_def_type])
	qdel(src)

/obj/item/neuFarm/seed/wheat
	seed_identity = "wheat seeds"
	plant_def_type = /datum/plant_def/wheat

/obj/item/neuFarm/seed/wheat/oat
	seed_identity = "oat seeds"
	plant_def_type = /datum/plant_def/oat

/obj/item/neuFarm/seed/apple
	seed_identity = "apple seeds"
	plant_def_type = /datum/plant_def/apple

/obj/item/neuFarm/seed/pipeweed
	seed_identity = "westleach leaf seeds"
	plant_def_type = /datum/plant_def/pipeweed

/obj/item/neuFarm/seed/swampleaf
	seed_identity = "swampweed seeds"
	plant_def_type = /datum/plant_def/sweetleaf

/obj/item/neuFarm/seed/berryrogue
	seed_identity = "berry seeds"
	plant_def_type = /datum/plant_def/berry

/obj/item/neuFarm/seed/berryrogue/poison
	seed_identity = "berry seeds"
	plant_def_type = /datum/plant_def/berry_poison

/obj/item/neuFarm/seed/cabbage
	seed_identity = "cabbage seeds"
	plant_def_type = /datum/plant_def/cabbage

/obj/item/neuFarm/seed/onion
	seed_identity = "onion seeds"
	color = "#ffeeb9"
	plant_def_type = /datum/plant_def/onion
/obj/item/neuFarm/seed/potato
	seed_identity = "potato seedlings"
	plant_def_type = /datum/plant_def/potato
/obj/item/neuFarm/seed/sunflower
	seed_identity = "sunflower seeds"
	plant_def_type = /datum/plant_def/sunflower


/*
/obj/item/neuFarm/seed/pear
	seed_identity = "pear seeds"
	plant_def_type = /datum/plant_def/pear

/obj/item/neuFarm/seed/cherry
	seed_identity = "cherry seeds"
	plant_def_type = /datum/plant_def/cherry

/obj/item/neuFarm/seed/olive
	seed_identity = "olive seeds"
	plant_def_type = /datum/plant_def/olive

/obj/item/neuFarm/seed/nut
	seed_identity = "rocknut seeds"
	plant_def_type = /datum/plant_def/nut

/obj/item/neuFarm/seed/tomato
	seed_identity = "tomato seeds"
	plant_def_type = /datum/plant_def/tomato

/obj/item/neuFarm/seed/garlic
	seed_identity = "garlic seeds"
	plant_def_type = /datum/plant_def/garlic

/obj/item/neuFarm/seed/carrot
	seed_identity = "carrot seeds"
	plant_def_type = /datum/plant_def/carrot

/obj/item/neuFarm/seed/eggplant
	seed_identity = "eggplant seeds"
	plant_def_type = /datum/plant_def/eggplant

/obj/item/neuFarm/seed/bean
	seed_identity = "bean seeds"
	plant_def_type = /datum/plant_def/bean

/obj/item/neuFarm/seed/radish
	seed_identity = "radish seeds"
	plant_def_type = /datum/plant_def/radish

/obj/item/neuFarm/seed/beet
	seed_identity = "sugarbeet seeds"
	plant_def_type = /datum/plant_def/beet

/obj/item/neuFarm/seed/bellpepper
	seed_identity = "little tiefling eggs"
	plant_def_type = /datum/plant_def/bellpepper

/obj/item/neuFarm/seed/peas
	seed_identity = "pea seeds"
	plant_def_type = /datum/plant_def/peas

/obj/item/neuFarm/seed/rice
	seed_identity = "rice seeds"
	plant_def_type = /datum/plant_def/rice

/obj/item/neuFarm/seed/cucumber
	seed_identity = "cucumber seeds"
	plant_def_type = /datum/plant_def/cucumber

/obj/item/neuFarm/seed/tea
	seed_identity = "tea seeds"
	plant_def_type = /datum/plant_def/tea

/obj/item/neuFarm/seed/mycelium
	name = "spores"
	icon_state = "mycelium"

/obj/item/neuFarm/seed/mycelium/plumphelmet
	seed_identity = "plump helmet spores"
	plant_def_type = /datum/plant_def/plumphelmet

/obj/item/neuFarm/seed/mycelium/trippy
	seed_identity = "blue mushroom spores"
	plant_def_type = /datum/plant_def/trippy

/obj/item/neuFarm/seed/mycelium/amanita
	seed_identity = "red mushroom spores"
	plant_def_type = /datum/plant_def/amanita
*/