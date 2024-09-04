/obj/item/reagent_containers/food/snacks/grown/cocoapod
//	seed = /obj/item/seeds/cocoapod
	name = "cocoa pod"
	desc = ""
	icon_state = "cocoapod"
	filling_color = "#FFD700"
	bitesize_mod = 2
	foodtype = FRUIT
	tastes = list("cocoa" = 1)
	distill_reagent = /datum/reagent/consumable/ethanol/creme_de_cacao

/obj/item/reagent_containers/food/snacks/grown/vanillapod
//	seed = /obj/item/seeds/cocoapod/vanillapod
	name = "vanilla pod"
	desc = ""
	icon_state = "vanillapod"
	filling_color = "#FFD700"
	foodtype = FRUIT
	tastes = list("vanilla" = 1)
	distill_reagent = /datum/reagent/consumable/vanilla //Takes longer, but you can get even more vanilla from it.


/obj/item/reagent_containers/food/snacks/grown/bungofruit
//	seed = /obj/item/seeds/cocoapod/bungotree
	name = "bungo fruit"
	desc = ""
	icon_state = "bungo"
	trash = /obj/item/reagent_containers/food/snacks/grown/bungopit
	filling_color = "#E8C22F"
	foodtype = FRUIT
	juice_results = list(/datum/reagent/consumable/bungojuice = 0)
	tastes = list("bungo" = 2, "tropical fruitiness" = 1)
	distill_reagent = null

/obj/item/reagent_containers/food/snacks/grown/bungopit
//	seed = /obj/item/seeds/cocoapod/bungotree
	name = "bungo pit"
	icon_state = "bungopit"
	desc = ""
	w_class = WEIGHT_CLASS_TINY
	throwforce = 5
	throw_speed = 1
	throw_range = 7
	foodtype = TOXIC
	tastes = list("acrid bitterness" = 1)

/obj/item/reagent_containers/food/snacks/grown/bungopit/Initialize()
	. =..()
	reagents.clear_reagents()
//	reagents.add_reagent(/datum/reagent/toxin/bungotoxin, seed.potency * 0.10) //More than this will kill at too low potency
//	reagents.add_reagent(/datum/reagent/consumable/nutriment, seed.potency * 0.04)
