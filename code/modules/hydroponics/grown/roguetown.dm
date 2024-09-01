
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
////	genes = list(/datum/plant_gene/trait/repeated_harvest)
//	mutatelist = list(/obj/item/seeds/apple/gold)
	delonharvest = FALSE

/obj/item/seeds/berryrogue/New()
	. = ..()
	yield = rand(1,5)

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
//	seed = /obj/item/seeds/fyritius

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
//	genes = list(/datum/plant_gene/trait/repeated_harvest)
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
//	seed = /obj/item/seeds/onion

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
//	seed = /obj/item/seeds/cabbage

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
//	seed = /obj/item/seeds/potato