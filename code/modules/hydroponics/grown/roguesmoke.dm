//swarmpweed
/obj/item/reagent_containers/food/snacks/grown/rogue/swampweed
	seed = /obj/item/seeds/swampweed
	name = "swampweed"
	desc = "A 'foggy' pipe weed."
	icon_state = "swampweed"
	filling_color = "#008000"
	bitesize_mod = 1
	foodtype = VEGETABLES
	list_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/berrypoison = 5)
	tastes = list("sweet" = 1,"bitterness" = 1)
	eat_effect = /datum/status_effect/debuff/badmeal
	rotprocess = 15 MINUTES

/obj/item/seeds/swampweed
	name = "seeds"
	desc = ""
	species = "swampweed"
	plantname = "swampweed plant"
	product = /obj/item/reagent_containers/food/snacks/grown/rogue/swampweed
	production = 1
	yield = 3
	potency = 1
	color = "#455838"

/obj/item/reagent_containers/food/snacks/grown/rogue/swampweeddry
	seed = null
	name = "swampweed"
	desc = ""
	icon_state = "swampweedd"
	dry = 1
	pipe_reagents = list(/datum/reagent/drug/space_drugs = 30)
	list_reagents = list(/datum/reagent/drug/space_drugs = 2, /datum/reagent/consumable/nutriment = 1)
	eat_effect = /datum/status_effect/debuff/badmeal

//crafting recipes
/datum/crafting_recipe/roguetown/dryleaf
	name = "dry swampweed"
	result = /obj/item/reagent_containers/food/snacks/grown/rogue/swampweeddry
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/rogue/swampweed = 1)
	structurecraft = /obj/structure/fluff/dryingrack
	time = 2 SECONDS
	verbage = "dry"
	verbage_tp = "dries"
	craftsound = null
	skillcraft = null

/datum/crafting_recipe/roguetown/sigsweet
	name = "swampweed zig"
	result = /obj/item/clothing/mask/cigarette/rollie/cannabis
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/rogue/swampweeddry = 1,
				/obj/item/paper/scroll = 1)
	req_table = TRUE
	time = 10 SECONDS
	verbage = "roll"
	verbage_tp = "rolls"
	craftdiff = 0

//westleach leaf
/obj/item/reagent_containers/food/snacks/grown/rogue/pipeweed
	seed = /obj/item/seeds/pipeweed
	name = "westleach leaf"
	desc = "A generic kind of pipe weed."
	icon_state = "westleach"
	filling_color = "#008000"
	bitesize_mod = 1
	foodtype = VEGETABLES
	tastes = list("sweet" = 1,"bitterness" = 1)
	list_reagents = list(/datum/reagent/drug/nicotine = 2, /datum/reagent/consumable/nutriment = 1, /datum/reagent/berrypoison = 5)
	eat_effect = /datum/status_effect/debuff/badmeal
	rotprocess = 15 MINUTES
	can_distill = TRUE
	distill_reagent = /datum/reagent/consumable/tea

/obj/item/seeds/pipeweed
	name = "seeds"
	desc = ""
	species = "westleach"
	plantname = "westleach plant"
	product = /obj/item/reagent_containers/food/snacks/grown/rogue/pipeweed
	production = 1
	yield = 3
	potency = 1
	color = "#6d915d"

/obj/item/reagent_containers/food/snacks/grown/rogue/pipeweeddry
	seed = null
	name = "westleach leaf"
	desc = "A dried leaf."
	icon_state = "westleachd"
	dry = 1
	pipe_reagents = list(/datum/reagent/drug/nicotine = 30)
	eat_effect = /datum/status_effect/debuff/badmeal
	list_reagents = list(/datum/reagent/drug/nicotine = 5, /datum/reagent/consumable/nutriment = 1)

/datum/crafting_recipe/roguetown/dryweed
	name = "dry westleach leaf"
	result = /obj/item/reagent_containers/food/snacks/grown/rogue/pipeweeddry
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/rogue/pipeweed = 1)
	structurecraft = /obj/structure/fluff/dryingrack
	time = 2 SECONDS
	verbage = "dry"
	verbage_tp = "dries"
	craftsound = null
	skillcraft = null

/datum/crafting_recipe/roguetown/sigdry
	name = "westleach zig"
	result = /obj/item/clothing/mask/cigarette/rollie/nicotine
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/rogue/pipeweeddry = 1,
				/obj/item/paper/scroll = 1)
	req_table = TRUE
	time = 10 SECONDS
	verbage = "roll"
	verbage_tp = "rolls"
	craftdiff = 0
