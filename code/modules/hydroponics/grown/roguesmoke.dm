//swarmpweed
/obj/item/reagent_containers/food/snacks/grown/rogue/swampweed
	seed = /obj/item/seeds/swampweed
	name = "swampweed"
	filling_color = "#008000"
	bitesize_mod = 1
	foodtype = VEGETABLES
	list_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/berrypoison = 5)
	tastes = list("sweet" = 1,"bitterness" = 1)
	eat_effect = /datum/status_effect/debuff/badmeal
	rotprocess = 15 MINUTES
	dust_result = /obj/item/alch/swampdust

/obj/item/seeds/swampweed
	name = "seeds"
	desc = "Seeds of the swampweed plant."
	species = "swampweed"
	plantname = "swampweed plant"
	product = /obj/item/reagent_containers/food/snacks/grown/rogue/swampweed
	production = 1
	yield = 3
	potency = 1
	color = "#455838"
	dust_result = /obj/item/alch/seeddust



//westleach leaf
/obj/item/reagent_containers/food/snacks/grown/rogue/pipeweed
	seed = /obj/item/seeds/pipeweed
	name = "westleach leaf"
	desc = "A common, strong-smelling leaf that is often dried and smoked."
	bitesize_mod = 1
	foodtype = VEGETABLES
	tastes = list("sweet" = 1,"bitterness" = 1)
	list_reagents = list(/datum/reagent/drug/nicotine = 2, /datum/reagent/consumable/nutriment = 1, /datum/reagent/berrypoison = 5)
	eat_effect = /datum/status_effect/debuff/badmeal
	rotprocess = 15 MINUTES

/obj/item/seeds/pipeweed
	name = "seeds"
	desc = "Seeds of the westleach plant."
	species = "westleach"
	plantname = "westleach plant"
	product = /obj/item/reagent_containers/food/snacks/grown/rogue/pipeweed
	production = 1
	yield = 3
	potency = 1
	color = "#6d915d"

