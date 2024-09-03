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
