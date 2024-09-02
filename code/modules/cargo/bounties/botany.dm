/datum/bounty/item/botany
	reward = 5000
	var/datum/bounty/item/botany/multiplier = 0 //adds bonus reward money; increased for higher tier or rare mutations
	var/datum/bounty/item/botany/bonus_desc //for adding extra flavor text to bounty descriptions
	var/datum/bounty/item/botany/foodtype = "meal" //same here

/datum/bounty/item/botany/New()
	..()
	description = "Central Command's head chef is looking to prepare a fine [foodtype] with [name]. [bonus_desc]"
	reward += multiplier * 1000
	required_count = rand(5, 10)

/datum/bounty/item/botany/ambrosia_vulgaris
/datum/bounty/item/botany/ambrosia_gaia
	name = "Ambrosia Gaia Leaves"
/datum/bounty/item/botany/apple_golden
	name = "Golden Apples"
/datum/bounty/item/botany/banana
	name = "Bananas"
/datum/bounty/item/botany/banana_bluespace
	name = "Bluespace Bananas"
/datum/bounty/item/botany/beans_koi
	name = "Koi Beans"
/datum/bounty/item/botany/berries_death
	name = "Death Berries"
	multiplier = 2
	bonus_desc = ""
	foodtype = "sorbet"
/datum/bounty/item/botany/berries_glow
	name = "Glow-Berries"
	multiplier = 2
	foodtype = "sorbet"

/datum/bounty/item/botany/cannabis
	name = "Cannabis Leaves"
//	wanted_types = list(/obj/item/reagent_containers/food/snacks/grown/cannabis)
//	exclude_types = list(/obj/item/reagent_containers/food/snacks/grown/cannabis/white, /obj/item/reagent_containers/food/snacks/grown/cannabis/death, /obj/item/reagent_containers/food/snacks/grown/cannabis/ultimate)
	multiplier = 4 //hush money
	bonus_desc = ""
	foodtype = "batch of \"muffins\""

/datum/bounty/item/botany/cannabis_white
	name = "Lifeweed Leaves"
/datum/bounty/item/botany/cannabis_death
	name = "Deathweed Leaves"
	multiplier = 6
	bonus_desc = ""
	foodtype = "\"meal\""
/datum/bounty/item/botany/cannabis_ultimate
	name = "Omega Weed Leaves"
	multiplier = 6
	bonus_desc = ""
	foodtype = "batch of \"brownies\""
/datum/bounty/item/botany/wheat
	name = "Wheat Grains"
/datum/bounty/item/botany/rice

/datum/bounty/item/botany/chili
	name = "Chili Peppers"

/datum/bounty/item/botany/ice_chili
	name = "Ice Chili Peppers"
	multiplier = 2

/datum/bounty/item/botany/ghost_chili
	name = "Ghost Chili Peppers"
	multiplier = 2

/datum/bounty/item/botany/citrus_lime
	name = "Limes"
	foodtype = "sorbet"

/datum/bounty/item/botany/citrus_lemon
	name = "Lemons"
	foodtype = "sorbet"

/datum/bounty/item/botany/citrus_oranges
	name = "Oranges"
	bonus_desc = "" //I vanted orahnge!
	foodtype = "sorbet"

/datum/bounty/item/botany/eggplant

/datum/bounty/item/botany/eggplant_eggy
	name = "Egg-plants"
	bonus_desc = ""
	multiplier = 2

/datum/bounty/item/botany/kudzu
	name = "Kudzu Pods"
	bonus_desc = ""
	multiplier = 4

/datum/bounty/item/botany/watermelon
	name = "Watermelons"
	foodtype = "dessert"

/datum/bounty/item/botany/watermelon_holy
	name = "Holy Melons"
	multiplier = 2
	foodtype = "dessert"

/datum/bounty/item/botany/glowshroom
	name = "Glowshrooms"
/datum/bounty/item/botany/glowshroom_cap
	name = "Glowcaps"
/datum/bounty/item/botany/glowshroom_shadow
	name = "Shadowshrooms"
/datum/bounty/item/botany/nettles_death
	name = "Death Nettles"
/datum/bounty/item/botany/pineapples
	name = "Pineapples"
/datum/bounty/item/botany/tomato
	name = "Tomatoes"
/datum/bounty/item/botany/tomato_bluespace
	name = "Bluespace Tomatoes"
/datum/bounty/item/botany/oatz
	name = "Oats"

