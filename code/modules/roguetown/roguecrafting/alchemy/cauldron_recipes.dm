/datum/alch_cauldron_recipe
	var/recipe_name = "" //The name of the recipe, kinda there just in case.
	var/smells_like = "nothing" //the cauldron "emits a faint [smell] smell" when done crafting
	var/list/output_reagents = list() //list of paths of new reagents to create in the cauldron. Remember, 1 oz is 3 units! [reagent = amnt]
	var/list/output_items = list() //List of paths for new items that should be created, [path = chance to be created]

/datum/alch_cauldron_recipe/disease_cure
	recipe_name = "Rotbane"
	smells_like = "purity"
	output_reagents = list(/datum/reagent/medicine/diseasecure = 90)

/datum/alch_cauldron_recipe/berrypoison
	recipe_name = "Liquid Malice"
	smells_like = "death"
	output_reagents = list(/datum/reagent/berrypoison = 90)

/datum/alch_cauldron_recipe/antidote
	recipe_name = "Malicebane"
	smells_like = "wet moss"
	output_reagents = list(/datum/reagent/medicine/antidote = 90)

//Healing potions
/datum/alch_cauldron_recipe/health_potion
	recipe_name = "Elixir of Health"
	smells_like = "sweet berries"
	output_reagents = list(/datum/reagent/medicine/healthpot = 90)

/datum/alch_cauldron_recipe/big_health_potion
	recipe_name = "Strong Elixir of Health"
	smells_like = "sweet berries"
	output_reagents = list(/datum/reagent/medicine/healthpot = 90,/datum/reagent/additive = 90)

/datum/alch_cauldron_recipe/mana_potion
	recipe_name = "Arcane Elixir"
	smells_like = "power"
	output_reagents = list(/datum/reagent/medicine/manapot = 90)

/datum/alch_cauldron_recipe/big_mana_potion
	recipe_name = "Powerful Arcane Elixir"
	smells_like = "power"
	output_reagents = list(/datum/reagent/medicine/manapot = 90,/datum/reagent/additive = 90)

//S.P.E.C.I.A.L. potions
/datum/alch_cauldron_recipe/str_potion
	recipe_name = "Potion of Mountain Muscles"
	smells_like = "petrichor"
	output_reagents = list(/datum/reagent/buff/strength = 30)

/datum/alch_cauldron_recipe/per_potion
	recipe_name = "Potion of Keen Eye"
	smells_like = "fire"
	output_reagents = list(/datum/reagent/buff/perception = 30)

/datum/alch_cauldron_recipe/end_potion
	recipe_name = "Potion of Enduring Fortitude"
	smells_like = "mountain air"
	output_reagents = list(/datum/reagent/buff/endurance = 30)

/datum/alch_cauldron_recipe/con_potion
	recipe_name = "Potion of Stone Flesh"
	smells_like = "earth"
	output_reagents = list(/datum/reagent/buff/constitution = 30)

/datum/alch_cauldron_recipe/int_potion
	recipe_name = "Potion of Keen Mind"
	smells_like = "water"
	output_reagents = list(/datum/reagent/buff/intelligence = 30)

/datum/alch_cauldron_recipe/spd_potion
	recipe_name = "Potion of Fleet Foot"
	smells_like = "clean air"
	output_reagents = list(/datum/reagent/buff/speed = 30)
