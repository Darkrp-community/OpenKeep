

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
	species = "fyritius"
	plantname = "fyritius flower bush"
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


