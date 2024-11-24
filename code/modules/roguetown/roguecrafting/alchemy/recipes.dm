/datum/alchemy_recipe
	var/recipe_name = "" //The name of the recipe,not really needed but there in case
	var/smells_like = "nothing" //What does the potion smell like when made?
	var/list/required_items = list() //list of paths needed to make the output, path = amnt
	var/list/output_items = list() //list of paths of new items to create ontop the cauldron, path = amnt
	var/list/output_reagents = list() //list of /datum/reagent/ to put in the cauldron. path = amnt
	var/required_base = /datum/reagent/water //what should be in the cauldron as a base, water by default
	var/required_base_amount = 90 //How much of above do we need in the cauldron? 3 = 1 oz

/datum/alchemy_recipe/disease_cure
	recipe_name = "Rotbane"
	smells_like = "purity"
	required_items = list(/obj/item/ash = 2,/obj/item/alch/silverdust = 1)
	output_reagents = list(/datum/reagent/medicine/diseasecure = 90)

/datum/alchemy_recipe/disease_invert
	recipe_name = "Rot Induction"
	smells_like = "death"
	required_items = list(/obj/item/natural/dirtclod = 1)
	required_base = /datum/reagent/medicine/diseasecure
	output_reagents = list(/datum/reagent/berrypoison = 90)

/datum/alchemy_recipe/disease_invert/berry
	required_items = list(/obj/item/reagent_containers/food/snacks/produce/jacksberry/poison = 1)

/datum/alchemy_recipe/antidote
	recipe_name = "Malicebane"
	required_items = list(/obj/item/alch/coaldust = 2)
	output_reagents = list(/datum/reagent/medicine/antidote = 90)

//Healing potions
/datum/alchemy_recipe/health_potion
	recipe_name = "Elixir of Health"
	smells_like = "sweet berries"
	required_items = list(/obj/item/alch/viscera = 1,/obj/item/natural/chaff = 1)
	output_reagents = list(/datum/reagent/medicine/healthpot = 90)

/datum/alchemy_recipe/health_potion/alternate
	recipe_name = "Strong Elixir of Health"
	required_items = list(/obj/item/alch/airdust = 1)
	output_reagents = list(/datum/reagent/medicine/healthpot = 90,/datum/reagent/additive = 90)

/datum/alchemy_recipe/mana_potion
	recipe_name = "Arcane Elixir"
	smells_like = "power"
	required_items = list(/obj/item/alch/bonemeal = 1,/obj/item/alch/seeddust = 1)
	output_reagents = list(/datum/reagent/medicine/manapot = 90)

/datum/alchemy_recipe/mana_potion/alternate
	recipe_name = "Powerful Arcane Elixir"
	required_items = list(/obj/item/alch/runedust = 1)
	output_reagents = list(/datum/reagent/medicine/manapot = 90,/datum/reagent/additive = 90)

//S.P.E.C.I.A.L. potions
/datum/alchemy_recipe/str_potion
	recipe_name = "Potion of Mountain Muscles"
	smells_like = "petrichor"
	required_items = list(/obj/item/alch/sinew = 1,/obj/item/alch/irondust = 1)
	required_base_amount = 30
	output_reagents = list(/datum/reagent/buff/strength = 30)

/datum/alchemy_recipe/per_potion
	recipe_name = "Potion of Keen Eye"
	smells_like = "fire"
	required_items = list(/obj/item/reagent_containers/powder/ozium = 1,/obj/item/alch/tobaccodust = 1)
	required_base_amount = 30
	output_reagents = list(/datum/reagent/buff/perception = 30)

/datum/alchemy_recipe/end_potion
	recipe_name = "Potion of Enduring Fortitude"
	smells_like = "mountain air"
	required_items = list(/obj/item/natural/worms/leech = 1,/obj/item/reagent_containers/food/snacks/produce/apple = 1)
	required_base_amount = 30
	output_reagents = list(/datum/reagent/buff/endurance = 30)

/datum/alchemy_recipe/con_potion
	recipe_name = "Potion of Stone Flesh"
	smells_like = "earth"
	required_items = list(/obj/item/reagent_containers/food/snacks/fish = 1,/obj/item/alch/bone=1)
	required_base_amount = 30
	output_reagents = list(/datum/reagent/buff/constitution = 30)

/datum/alchemy_recipe/int_potion
	recipe_name = "Potion of Keen Mind"
	smells_like = "water"
	required_items = list(/obj/item/reagent_containers/powder/moondust = 1,/obj/item/alch/swampdust = 1)
	required_base_amount = 30
	output_reagents = list(/datum/reagent/buff/intelligence = 30)

/datum/alchemy_recipe/spd_potion
	recipe_name = "Potion of Fleet Foot"
	smells_like = "clean air"
	required_items = list(/obj/item/reagent_containers/powder/moondust_purest = 1,/obj/item/reagent_containers/powder/salt = 1)
	required_base_amount = 30
	output_reagents = list(/datum/reagent/buff/speed = 30)
