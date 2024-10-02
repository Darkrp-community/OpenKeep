/mob/living/simple_animal/hostile/retaliate/rogue/wildboar
	icon = 'modular/Creechers/icons/piggie.dmi'
	name = "wild boar"
	desc = "A brawny and hairy wild swine animal. Commonly the target of hunts due to its tasty flesh."
	icon_state = "oldBoar"
	icon_living = "piggie_m"
	icon_dead = "oldBoarDead"
	icon_gib = "oldBoarDead"
	gender = MALE
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	emote_see = list("eyes the surroundings.", "flicks its ears.")
	speak_chance = 1
	turns_per_move = 5
	see_in_dark = 9
	move_to_delay = 4
	animal_species = /mob/living/simple_animal/hostile/retaliate/rogue/wildboar
	butcher_results = list(/obj/item/reagent_containers/food/snacks/rogue/meat/fatty = 4,
						/obj/item/reagent_containers/food/snacks/fat = 2,
						/obj/item/natural/hide = 2)
	base_intents = list(/datum/intent/simple/stab)
	health = 120
	maxHealth = 120
	food_type = list(/obj/item/reagent_containers/food/snacks/rogue/truffles,/obj/item/reagent_containers/food/snacks/produce/wheat,/obj/item/reagent_containers/food/snacks/produce/oat,/obj/item/reagent_containers/food/snacks/produce/apple,/obj/item/reagent_containers/food/snacks/produce/berries/rogue)
	footstep_type = FOOTSTEP_MOB_SHOE
	pooptype = /obj/item/natural/poo/horse
	faction = list("boars")
	attack_verb_continuous = "gores"
	attack_verb_simple = "gores"
	melee_damage_lower = 10
	melee_damage_upper = 20
	minimum_distance = 1
	STASPD = 8
	STACON = 10
	STASTR = 12
	can_buckle = TRUE
	buckle_lying = FALSE
	tame_chance = 15
	bonus_tame_chance = 15
	can_saddle = TRUE
	remains_type = /obj/effect/decal/remains/boar

/obj/effect/decal/remains/boar
	name = "remains"
	gender = PLURAL
	icon_state = "Boarbones"
	icon = 'modular/Creechers/icons/piggie.dmi'

/mob/living/simple_animal/hostile/retaliate/rogue/wildboar/tamed(mob/user)
	..()
	deaggroprob = 20
	if(can_buckle)
		var/datum/component/riding/D = LoadComponent(/datum/component/riding)
		D.set_riding_offsets(RIDING_OFFSET_ALL, list(TEXT_NORTH = list(0, 4), TEXT_SOUTH = list(0, 4), TEXT_EAST = list(-2, 4), TEXT_WEST = list(2, 4)))
		D.set_vehicle_dir_layer(SOUTH, ABOVE_MOB_LAYER)
		D.set_vehicle_dir_layer(NORTH, OBJ_LAYER)
		D.set_vehicle_dir_layer(EAST, OBJ_LAYER)
		D.set_vehicle_dir_layer(WEST, OBJ_LAYER)
