
/datum/crafting_recipe/roguetown/narcotics
	req_table = FALSE
	tools = list(/obj/item/mortar, /obj/item/pestle)
	subtype_reqs = FALSE
	skillcraft = /datum/skill/craft/alchemy
	time = 10 SECONDS

/datum/crafting_recipe/roguetown/narcotics/spice
	name = "Spice"
	reqs = list(/obj/item/alch/swampdust = 2, /obj/item/alch/firedust = 1, /obj/item/reagent_containers/powder/ozium = 1)
	result = /obj/item/reagent_containers/powder/spice
	craftdiff = 3

/datum/crafting_recipe/roguetown/narcotics/moondust
	name = "Moondust"
	reqs = list(/obj/item/alch/earthdust = 2, /obj/item/alch/waterdust = 1, /obj/item/reagent_containers/powder/ozium = 1)
	result = /obj/item/reagent_containers/powder/moondust
	craftdiff = 3

/datum/crafting_recipe/roguetown/narcotics/moondustpurify
	name = "Purify Moondust"
	reqs = list(/obj/item/alch/magicdust = 1, /obj/item/alch/silverdust = 1, /obj/item/reagent_containers/powder/moondust = 1)
	result = /obj/item/reagent_containers/powder/moondust_purest
	craftdiff = 5
