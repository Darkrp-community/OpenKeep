#define BERRYCOLORS		list("#6a6699", "#9b6464", "#58a75c", "#5658a9", "#669799")
GLOBAL_LIST_EMPTY(berrycolors)

// Apple
/obj/item/seeds/berryrogue
	name = "seeds"
	desc = ""
	icon_state = "seed"
	species = "berry"
	plantname = "berry bush"
	product = /obj/item/reagent_containers/food/snacks/grown/berries/rogue
	lifespan = 55
	endurance = 35
	color = "#524441"
	yield = 5
//	genes = list(/datum/plant_gene/trait/repeated_harvest)
//	mutatelist = list(/obj/item/seeds/apple/gold)
	delonharvest = FALSE

/obj/item/seeds/berryrogue/New()
	. = ..()
	yield = rand(1,5)

/obj/item/reagent_containers/food/snacks/grown/berries/rogue
	seed = /obj/item/seeds/berryrogue
	name = "jacksberries"
	desc = ""
	icon_state = "berries"
	tastes = list("berry" = 1)
	bitesize = 5
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)
	dropshrink = 0.75
	var/color_index = "good"
	can_distill = TRUE
	distill_reagent = /datum/reagent/consumable/ethanol/beer/jackberrywine
	rotprocess = SHELFLIFE_SHORT
	var/poisonous = FALSE

/obj/item/reagent_containers/food/snacks/grown/berries/rogue/examine(var/mob/user)
	var/farminglvl = user.mind?.get_skill_level(/datum/skill/labor/farming)
	. += ..()
	if(farminglvl >= 3 && poisonous == TRUE)
		. += "These berries appear to be poisonous."

/obj/item/reagent_containers/food/snacks/grown/berries/rogue/Initialize()
	if(GLOB.berrycolors[color_index])
		filling_color = GLOB.berrycolors[color_index]
	else
		var/newcolor = pick(BERRYCOLORS)
		if(newcolor in GLOB.berrycolors)
			GLOB.berrycolors[color_index] = pick(BERRYCOLORS)
		else
			GLOB.berrycolors[color_index] = newcolor
		filling_color = GLOB.berrycolors[color_index]
	update_icon()
	..()

/obj/item/reagent_containers/food/snacks/grown/berries/rogue/On_Consume(mob/living/eater)
	..()
	update_icon()

/obj/item/reagent_containers/food/snacks/grown/berries/rogue/update_icon()
	cut_overlays()
	var/used_state = "berriesc5"
	if(bitecount == 1)
		used_state = "berriesc4"
	if(bitecount == 2)
		used_state = "berriesc3"
	if(bitecount == 3)
		used_state = "berriesc2"
	if(bitecount == 4)
		used_state = "berriesc1"
	var/image/item_overlay = image(used_state)
	item_overlay.color = filling_color
	add_overlay(item_overlay)

/obj/item/reagent_containers/food/snacks/grown/berries/rogue/poison
	seed = /obj/item/seeds/berryrogue/poison
	icon_state = "berries"
	tastes = list("berry" = 1)
	list_reagents = list(/datum/reagent/berrypoison = 5, /datum/reagent/consumable/nutriment = 3)
	color_index = "bad"
	poisonous = TRUE

/obj/item/seeds/berryrogue/poison
	product = /obj/item/reagent_containers/food/snacks/grown/berries/rogue/poison

/obj/item/reagent_containers/food/snacks/grown/fyritius/rogue
	name = "fyritius flower"
	desc = ""
	icon_state = "fyritius"
	tastes = list("tastes like regret and fire" = 1)
	bitesize = 1
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/toxin/fyritiusnectar = 5)
	can_distill = TRUE // no distill reagent but fyritius nectar could be used as a poison to set people on fire, which is too funny to prevent
	distill_reagent = null
	//rotprocess = 10 MINUTES // too rare to rot
	seed = /obj/item/seeds/fyritius

/obj/item/seeds/fyritius
	name = "odd seeds"
	desc = ""
	icon_state = "seed"
	species = "fyritius"
	plantname = "fyritius flower bush"
	growing_icon = 'icons/roguetown/misc/crops.dmi'
	icon_grow = "fyritius-grow" // Uses one growth icons set for all the subtypes
	icon_dead = "fyritius-dead" // Same for the dead icon
	product = /obj/item/reagent_containers/food/snacks/grown/fyritius/rogue
	lifespan = 55
	endurance = 50
	weed_rate = 0
	weed_chance = 0
	foodsucc = 0
	watersucc = 0
	color = "#e2b22e"
	yield = 3
	genes = list(/datum/plant_gene/trait/repeated_harvest)
	delonharvest = FALSE

/obj/item/seeds/onion
	name = "seeds"
	desc = ""
	icon_state = "seed"
	species = "onion"
	plantname = "onions"
	product = /obj/item/reagent_containers/food/snacks/grown/onion/rogue
	lifespan = 55
	endurance = 35
	color = "#241F10"
	yield = 3
	delonharvest = FALSE

/obj/item/reagent_containers/food/snacks/grown/onion/rogue
	name = "onion"
	desc = ""
	icon_state = "onion"
	slices_num = 1
	tastes = list("spicy sweetness" = 1)
	bitesize = 2
	list_reagents = list(/datum/reagent/consumable/nutriment = 2)
	can_distill = TRUE
	distill_reagent = /datum/reagent/consumable/ethanol/beer/onion
	rotprocess = null
	seed = /obj/item/seeds/onion

/obj/item/seeds/cabbage
	name = "seeds"
	desc = ""
	icon_state = "seed"
	species = "cabbage"
	plantname = "cabbages"
	product = /obj/item/reagent_containers/food/snacks/grown/cabbage/rogue
	lifespan = 55
	endurance = 35
	color = "#4F421C"
	yield = 1
	delonharvest = FALSE

/obj/item/reagent_containers/food/snacks/grown/cabbage/rogue
	name = "cabbage"
	desc = ""
	icon_state = "cabbage"
	tastes = list("blandness" = 1)
	bitesize = 10
	list_reagents = list(/datum/reagent/consumable/nutriment = 5)
	can_distill = TRUE
	distill_reagent = /datum/reagent/consumable/ethanol/beer/fireleaf
	rotprocess = SHELFLIFE_LONG
	seed = /obj/item/seeds/cabbage

// PO-TAET-OHS
/obj/item/seeds/potato
	name = "seeds"
	desc = ""
	icon_state = "seed"
	species = "potato"
	plantname = "potatos"
	product = /obj/item/reagent_containers/food/snacks/grown/potato/rogue
	lifespan = 55
	endurance = 35
	color = "#51470A"
	yield = 3
	delonharvest = FALSE

/obj/item/reagent_containers/food/snacks/grown/potato/rogue
	name = "potato"
	desc = ""
	icon_state = "potato"
	eat_effect = /datum/status_effect/debuff/uncookedfood
	tastes = list("starchy dirt" = 1)
	bitesize = 2
	list_reagents = list(/datum/reagent/consumable/nutriment = 1)
	can_distill = TRUE
	distill_reagent = /datum/reagent/consumable/ethanol/beer/voddena
	rotprocess = null
	seed = /obj/item/seeds/potato

