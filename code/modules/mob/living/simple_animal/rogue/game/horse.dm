/mob/living/simple_animal/hostile/retaliate/rogue/saiga/horse/update_icon()
	cut_overlays()
	..()
	if(stat != DEAD)
		if(ssaddle)
			var/mutable_appearance/saddlet = mutable_appearance(icon, "saddle", 4.3)
			add_overlay(saddlet)
		if(has_buckled_mobs())
			var/mutable_appearance/mounted = mutable_appearance(icon, "horse_mounted", 4.3)
			add_overlay(mounted)

/mob/living/simple_animal/hostile/retaliate/rogue/saiga/horse/tamed(mob/user)
	..()
	deaggroprob = 30
	if(can_buckle)
		var/datum/component/riding/D = LoadComponent(/datum/component/riding)
		D.set_riding_offsets(RIDING_OFFSET_ALL, list(TEXT_NORTH = list(0, 12), TEXT_SOUTH = list(0, 12), TEXT_EAST = list(-2, 8), TEXT_WEST = list(2, 12))) //horses are 6 pixels taller.
		D.set_vehicle_dir_layer(SOUTH, OBJ_LAYER)
		D.set_vehicle_dir_layer(NORTH, OBJ_LAYER)
		D.set_vehicle_dir_layer(EAST, OBJ_LAYER)
		D.set_vehicle_dir_layer(WEST, OBJ_LAYER)

/mob/living/simple_animal/hostile/retaliate/rogue/saiga/horse
	icon = 'icons/roguetown/kaizoku/mobs/horse.dmi'
	name = "fogbeast"
	desc = "A huge and elegant beast that gallops across open fields with hooves deadlier than any sword. Long extinct from the mainlands, it is the favourite beasts of Fog Islanders and Heartfelteans."
	icon_state = "horse"
	icon_living = "horse"
	icon_dead = "horse_dead"
	icon_gib = "horse_gib"
	faction = list("saiga")
	gender = FEMALE
	footstep_type = FOOTSTEP_MOB_SHOE
	emote_see = list("grazes on grass.", "whinnies softly.", "stamps a hoof.", "gazes upon the horizon.", "'s tail whips mosquitos away.")
	move_to_delay = 7
	botched_butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/steak = 12,
						/obj/item/natural/hide = 1,
						/obj/item/alch/bone = 1)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/steak = 4,
						/obj/item/reagent_containers/food/snacks/fat = 2,
						/obj/item/natural/hide = 3,
						/obj/item/natural/head/saiga = 1,
						/obj/item/alch/bone = 2)
	perfect_butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/steak = 5,
						/obj/item/reagent_containers/food/snacks/fat = 2,
						/obj/item/natural/hide = 4,
						/obj/item/alch/bone = 3,
						/obj/item/natural/head/saiga = 1)

	health = HORSE_UNGENDERED_HEALTH
	maxHealth = HORSE_UNGENDERED_HEALTH
	food_type = list(/obj/item/reagent_containers/food/snacks/produce/wheat,
					/obj/item/reagent_containers/food/snacks/produce/oat,
					/obj/item/reagent_containers/food/snacks/produce/jacksberry,
					/obj/item/reagent_containers/food/snacks/produce/apple)
	tame_chance = 40 // Foglander horses are easier to tame due to centuries of domestication, but you won't see them naturally on Stonekeep.
	bonus_tame_chance = 15
	pooptype = /obj/item/natural/poo/horse

	base_intents = list(/datum/intent/simple/headbutt)
	attack_sound = list('sound/vo/mobs/saiga/attack (1).ogg','sound/vo/mobs/saiga/attack (2).ogg')
	attack_verb_continuous = "headbutts"
	attack_verb_simple = "headbutt"
	melee_damage_lower = 20
	melee_damage_upper = 30
	retreat_distance = 10
	minimum_distance = 10
	STASPD = 15
	STACON = 12
	STASTR = 11
	childtype = /mob/living/simple_animal/hostile/retaliate/rogue/saiga/horse/horsekid
	can_buckle = TRUE
	buckle_lying = FALSE
	can_saddle = TRUE
	aggressive = TRUE


/mob/living/simple_animal/hostile/retaliate/rogue/saiga/horse/Initialize()
	. = ..()
	if(prob(50))
		gender = MALE

/mob/living/simple_animal/hostile/retaliate/rogue/saiga/horse/tamed(mob/user)
	..()
	if(can_buckle)
		var/datum/component/riding/D = LoadComponent(/datum/component/riding)
		D.set_riding_offsets(RIDING_OFFSET_ALL, list(
			TEXT_NORTH = list(0, 8),
			TEXT_SOUTH = list(0, 8),
			TEXT_EAST = list(-2, 8),
			TEXT_WEST = list(2, 8)))
		D.set_vehicle_dir_layer(SOUTH, OBJ_LAYER)
		D.set_vehicle_dir_layer(NORTH, OBJ_LAYER)
		D.set_vehicle_dir_layer(EAST, OBJ_LAYER)
		D.set_vehicle_dir_layer(WEST, OBJ_LAYER)

/mob/living/simple_animal/hostile/retaliate/rogue/saiga/horse/horsekid
	icon = 'icons/roguetown/kaizoku/mobs/horse.dmi'
	name = "fogbeast calf"
	icon_state = "horsekid"
	icon_living = "horsekid"
	icon_dead = "horsekid_dead"
	icon_gib = "horsekid_gib"

	animal_species = null
	gender = NEUTER //Sex will only matter when it gets initializated.
	pass_flags = PASSTABLE | PASSMOB
	mob_size = MOB_SIZE_SMALL

	botched_butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/mince = 1)
	butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/steak = 1)
	perfect_butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/steak = 1,
								/obj/item/natural/hide = 1)

	health = CALF_HEALTH
	maxHealth = CALF_HEALTH

	base_intents = list(/datum/intent/simple/headbutt)
	melee_damage_lower = 1
	melee_damage_upper = 6

	STACON = 5
	STASTR = 5
	STASPD = 5
	defprob = 50
	pixel_x = -16
	adult_growth = /mob/living/simple_animal/hostile/retaliate/rogue/saiga/horse
	tame = TRUE
	can_buckle = FALSE
	aggressive = FALSE

/mob/living/simple_animal/hostile/retaliate/rogue/saiga/horse/tame
	tame = TRUE

/mob/living/simple_animal/hostile/retaliate/rogue/saiga/horse/tame/saddled/Initialize()
	. = ..()
	var/obj/item/natural/saddle/S = new(src)
	ssaddle = S
	update_icon()
