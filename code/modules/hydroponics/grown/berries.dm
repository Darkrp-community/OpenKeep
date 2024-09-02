/obj/item/reagent_containers/food/snacks/grown/berries
//	seed = /obj/item/seeds/berry
	name = "bunch of berries"
	desc = ""
	icon_state = "berrypile"
	gender = PLURAL
	filling_color = "#FF00FF"
	bitesize_mod = 2
	foodtype = FRUIT
	juice_results = list(/datum/reagent/consumable/berryjuice = 0)
	tastes = list("berry" = 1)

// Poison Berries
/obj/item/seeds/berry/poison
	name = "pack of poison-berry seeds"
	desc = ""
	icon_state = "seed"
	species = "poisonberry"
	plantname = "Poison-Berry Bush"
	product = /obj/item/reagent_containers/food/snacks/grown/berries/poison
	reagents_add = list(/datum/reagent/toxin/cyanide = 0.15, /datum/reagent/toxin/staminatoxin = 0.2, /datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	rarity = 10 // Mildly poisonous berries are common in reality

/obj/item/reagent_containers/food/snacks/grown/berries/poison
//	seed = /obj/item/seeds/berry/poison
	name = "bunch of poison-berries"
	desc = ""
	icon_state = "poisonberrypile"
	filling_color = "#C71585"
	foodtype = FRUIT | TOXIC
	juice_results = list(/datum/reagent/consumable/poisonberryjuice = 0)
	tastes = list("poison-berry" = 1)
	distill_reagent = null
	//wine_power = 35

/obj/item/reagent_containers/food/snacks/grown/berries/death
//	seed = /obj/item/seeds/berry/death
	name = "bunch of death-berries"
	desc = ""
	icon_state = "deathberrypile"
	filling_color = "#708090"
	foodtype = FRUIT | TOXIC
	tastes = list("death-berry" = 1)
	distill_reagent = null
	//wine_power = 50

// Glow Berries
/obj/item/seeds/berry/glow
	name = "pack of glow-berry seeds"
	desc = ""
	icon_state = "seed"
	species = "glowberry"
	plantname = "Glow-Berry Bush"
	product = /obj/item/reagent_containers/food/snacks/grown/berries/glow
	lifespan = 30
	endurance = 25
	mutatelist = list()
//	genes = list(/datum/plant_gene/trait/glow/white, /datum/plant_gene/trait/repeated_harvest)
	reagents_add = list(/datum/reagent/uranium = 0.25, /datum/reagent/iodine = 0.2, /datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)
	rarity = 20

/obj/item/reagent_containers/food/snacks/grown/berries/glow
//	seed = /obj/item/seeds/berry/glow
	name = "bunch of glow-berries"
	desc = ""
	icon_state = "glowberrypile"
	filling_color = "#7CFC00"
	foodtype = FRUIT
	tastes = list("glow-berry" = 1)
	distill_reagent = null
	//wine_power = 60


/obj/item/reagent_containers/food/snacks/grown/cherries
//	seed = /obj/item/seeds/cherry
	name = "cherries"
	desc = ""
	icon_state = "cherry"
	gender = PLURAL
	filling_color = "#FF0000"
	bitesize_mod = 2
	foodtype = FRUIT
	grind_results = list(/datum/reagent/consumable/cherryjelly = 0)
	tastes = list("cherry" = 1)
	//wine_power = 30

/obj/item/reagent_containers/food/snacks/grown/bluecherries
//	seed = /obj/item/seeds/cherry/blue
	name = "blue cherries"
	desc = ""
	icon_state = "bluecherry"
	filling_color = "#6495ED"
	bitesize_mod = 2
	foodtype = FRUIT
	grind_results = list(/datum/reagent/consumable/bluecherryjelly = 0)
	tastes = list("blue cherry" = 1)
	//wine_power = 50

/obj/item/reagent_containers/food/snacks/grown/cherrybulbs
//	seed = /obj/item/seeds/cherry/bulb
	name = "cherry bulbs"
	desc = ""
	icon_state = "cherry_bulb"
	filling_color = "#FF0000"
	bitesize_mod = 2
	foodtype = FRUIT
	grind_results = list(/datum/reagent/consumable/cherryjelly = 0)
	tastes = list("cherry" = 1)
	//wine_power = 50

// Grapes
/obj/item/seeds/grape
	name = "pack of grape seeds"
	desc = ""
	icon_state = "seed"
	species = "grape"
	plantname = "Grape Vine"
	product = /obj/item/reagent_containers/food/snacks/grown/grapes
	lifespan = 50
	endurance = 25
	maturation = 3
	production = 5
	yield = 4
	growthstages = 2
	growing_icon = 'icons/obj/hydroponics/growing_fruits.dmi'
	icon_grow = "grape-grow"
	icon_dead = "grape-dead"
//	genes = list(/datum/plant_gene/trait/repeated_harvest)
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1, /datum/reagent/consumable/sugar = 0.1)

/obj/item/reagent_containers/food/snacks/grown/grapes
//	seed = /obj/item/seeds/grape
	name = "bunch of grapes"
	desc = ""
	icon_state = "grapes"
	dried_type = /obj/item/reagent_containers/food/snacks/no_raisin/healthy
	filling_color = "#FF1493"
	bitesize_mod = 2
	foodtype = FRUIT
	juice_results = list(/datum/reagent/consumable/grapejuice = 0)
	tastes = list("grape" = 1)
	distill_reagent = /datum/reagent/consumable/ethanol/wine

/obj/item/reagent_containers/food/snacks/grown/grapes/green
//	seed = /obj/item/seeds/grape/green
	name = "bunch of green grapes"
	icon_state = "greengrapes"
	filling_color = "#7FFF00"
	tastes = list("green grape" = 1)
	distill_reagent = /datum/reagent/consumable/ethanol/cognac
