/datum/crafting_recipe/roguetown/alchemy
	req_table = TRUE
	subtype_reqs = TRUE
	skillcraft = /datum/skill/craft/alchemy

//GLASS

/datum/crafting_recipe/roguetown/engineering/glass
	name = "glass"
	reqs = list(
		/obj/item/natural/dirtclod = 2
        )
	result = /obj/item/reagent_containers/glass/bottle/rogue
	tools = list(/obj/machinery/light/rogue/forge, /obj/item/rogueweapon/tongs)

//STRENGTH

/datum/crafting_recipe/roguetown/alchemy/strengthpotion
	name = "potion of strength"
	reqs = list(
		/datum/reagent/medicine/healthpot = 30,
		/obj/item/reagent_containers/food/snacks/grown/fyritius/rogue = 1,
		/obj/item/reagent_containers/glass/bottle/rogue = 1
        )
	result = /obj/item/reagent_containers/glass/bottle/rogue/strengthpotion
	craftdiff = 3

/obj/item/reagent_containers/glass/bottle/rogue/strengthpotion
	list_reagents = list(/datum/reagent/medicine/strengthpot = 45)

/datum/reagent/medicine/strengthpot
	name = "Potion of Bull Strength"
	description = "Increases your strength."
	reagent_state = LIQUID
	color = "#ffff00"
	taste_description = "yellow"
	overdose_threshold = 0
	metabolization_rate = 0.2 * REAGENTS_METABOLISM
	alpha = 173

/datum/reagent/medicine/strengthpot/on_mob_life(mob/living/carbon/M)
	if(!M.has_status_effect(/datum/status_effect/buff/strengthbuff))
		M.apply_status_effect(/datum/status_effect/buff/strengthbuff)
	..()
	. = 1

/datum/status_effect/buff/strengthbuff
	id = "strengthbuff"
	alert_type = /atom/movable/screen/alert/status_effect/buff/strengthbuff
	effectedstats = list("strength" = 3)
	duration = 10 SECONDS

/atom/movable/screen/alert/status_effect/buff/strengthbuff
	name = "Potion of Bull Strength"
	desc = "<span class='nicegreen'>I am strong like a bull!</span>\n"
	icon_state = "buff"

//SPEED

/datum/crafting_recipe/roguetown/alchemy/speedpotion
	name = "potion of speed"
	reqs = list(
		/datum/reagent/medicine/manapot = 30,
		/obj/item/reagent_containers/food/snacks/grown/fyritius/rogue = 1,
		/obj/item/reagent_containers/glass/bottle/rogue = 1
        )
	result = /obj/item/reagent_containers/glass/bottle/rogue/speedpotion
	craftdiff = 3

/obj/item/reagent_containers/glass/bottle/rogue/speedpotion
	list_reagents = list(/datum/reagent/medicine/speedpot = 45)

/datum/reagent/medicine/speedpot
	name = "Potion of Cat Grace"
	description = "Increases your speed."
	reagent_state = LIQUID
	color = "#00ff00"
	taste_description = "green"
	overdose_threshold = 0
	metabolization_rate = 0.2 * REAGENTS_METABOLISM
	alpha = 173

/datum/reagent/medicine/speedpot/on_mob_life(mob/living/carbon/M)
	if(!M.has_status_effect(/datum/status_effect/buff/speedbuff))
		M.apply_status_effect(/datum/status_effect/buff/speedbuff)
	..()
	. = 1

/datum/status_effect/buff/speedbuff
	id = "speedbuff"
	alert_type = /atom/movable/screen/alert/status_effect/buff/speedbuff
	effectedstats = list("speed" = 3)
	duration = 10 SECONDS

/atom/movable/screen/alert/status_effect/buff/speedbuff
	name = "Potion of Cat Grace"
	desc = "<span class='nicegreen'>I am fast like a cat!</span>\n"
	icon_state = "buff"

//ENDURANCE

/datum/crafting_recipe/roguetown/alchemy/endurancepotion
	name = "potion of endurance"
	reqs = list(
		/datum/reagent/medicine/healthpot = 30,
		/obj/item/reagent_containers/food/snacks/grown/rogue/swampweed = 1,
		/obj/item/reagent_containers/glass/bottle/rogue = 1
        )
	result = /obj/item/reagent_containers/glass/bottle/rogue/endurancepotion
	craftdiff = 3

/obj/item/reagent_containers/glass/bottle/rogue/endurancepotion
	list_reagents = list(/datum/reagent/medicine/endurancepot = 45)

/datum/reagent/medicine/endurancepot
	name = "Potion of Bear Endurance"
	description = "Increases your endurance."
	reagent_state = LIQUID
	color = "#964b00"
	taste_description = "brown"
	overdose_threshold = 0
	metabolization_rate = 0.1 * REAGENTS_METABOLISM
	alpha = 173

/datum/reagent/medicine/endurancepot/on_mob_life(mob/living/carbon/M)
	if(!M.has_status_effect(/datum/status_effect/buff/endurancebuff))
		M.apply_status_effect(/datum/status_effect/buff/endurancebuff)
	..()
	. = 1

/datum/status_effect/buff/endurancebuff
	id = "endurancebuff"
	alert_type = /atom/movable/screen/alert/status_effect/buff/endurancebuff
	effectedstats = list("endurance" = 3, "constitution" = 3)
	duration = 2 MINUTES

/atom/movable/screen/alert/status_effect/buff/endurancebuff
	name = "Potion of Bear Endurance"
	desc = "<span class='nicegreen'>I am strudy like a bear!</span>\n"
	icon_state = "buff"

//INTELLIGENCE

/datum/crafting_recipe/roguetown/alchemy/wisdompotion
	name = "potion of wisdom"
	reqs = list(
		/datum/reagent/medicine/manapot = 30,
		/obj/item/reagent_containers/food/snacks/grown/rogue/swampweed = 1,
		/obj/item/reagent_containers/glass/bottle/rogue = 1
        )
	result = /obj/item/reagent_containers/glass/bottle/rogue/wisdompotion
	craftdiff = 3

/obj/item/reagent_containers/glass/bottle/rogue/wisdompotion
	list_reagents = list(/datum/reagent/medicine/wisdompot = 45)

/datum/reagent/medicine/wisdompot
	name = "Potion of Owl Wisdom"
	description = "Increases your wisdom."
	reagent_state = LIQUID
	color = "#add8e6"
	taste_description = "light blue"
	overdose_threshold = 0
	metabolization_rate = 0.1 * REAGENTS_METABOLISM
	alpha = 173

/datum/reagent/medicine/wisdompot/on_mob_life(mob/living/carbon/M)
	if(!M.has_status_effect(/datum/status_effect/buff/wisdombuff))
		M.apply_status_effect(/datum/status_effect/buff/wisdombuff)
	..()
	. = 1

/datum/status_effect/buff/wisdombuff
	id = "wisdombuff"
	alert_type = /atom/movable/screen/alert/status_effect/buff/wisdombuff
	effectedstats = list("intelligence" = 3, "perception" = 3)
	duration = 2 MINUTES

/atom/movable/screen/alert/status_effect/buff/wisdombuff
	name = "Potion of Owl Wisdom"
	desc = "<span class='nicegreen'>I am wise like an owl!</span>\n"
	icon_state = "buff"

//LUCK

/datum/crafting_recipe/roguetown/alchemy/luckpotion
	name = "potion of luck"
	reqs = list(
		/datum/reagent/medicine/manapot = 30,
		/datum/reagent/medicine/healthpot = 30,
		/obj/item/reagent_containers/food/snacks/grown/rogue/swampweed = 1,
		/obj/item/reagent_containers/food/snacks/grown/fyritius/rogue = 1,
		/obj/item/reagent_containers/glass/bottle/rogue = 1
        )
	result = /obj/item/reagent_containers/glass/bottle/rogue/luckpotion
	craftdiff = 4

/obj/item/reagent_containers/glass/bottle/rogue/luckpotion
	list_reagents = list(/datum/reagent/medicine/luckpot = 45)

/datum/reagent/medicine/luckpot
	name = "Felix Felicis"
	description = "Increases your luck."
	reagent_state = LIQUID
	color = "#ffd700"
	taste_description = "golden"
	overdose_threshold = 0
	metabolization_rate = 0.2 * REAGENTS_METABOLISM
	alpha = 173

/datum/reagent/medicine/luckpot/on_mob_life(mob/living/carbon/M)
	if(!M.has_status_effect(/datum/status_effect/buff/luckbuff))
		M.apply_status_effect(/datum/status_effect/buff/luckbuff)
	..()
	. = 1

/datum/status_effect/buff/luckbuff
	id = "luckbuff"
	alert_type = /atom/movable/screen/alert/status_effect/buff/luckbuff
	effectedstats = list("luck" = 5)
	duration = 10 SECONDS

/atom/movable/screen/alert/status_effect/buff/luckbuff
	name = "Felix Felicis"
	desc = "<span class='nicegreen'>I am just damn lucky!</span>\n"
	icon_state = "buff"