/datum/crafting_recipe/roguetown/structure/composter
	name = "composter"
	result = /obj/structure/composter
	reqs = list(/obj/item/grown/log/tree/small = 1)
	craftdiff = 0
	time = 2 SECONDS

/datum/crafting_recipe/roguetown/structure/plough
	name = "plough"
	result = /obj/structure/plough
	reqs = list(/obj/item/grown/log/tree/small = 2, /obj/item/ingot/iron = 1)
	skillcraft = /datum/skill/craft/carpentry
	time = 4 SECONDS

/datum/crafting_recipe/roguetown/woodthresher
	name = "thresher"
	result = list(/obj/item/rogueweapon/thresher)
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/rope = 1)

/datum/crafting_recipe/roguetown/militarythresher
	name = "military flail"
	result = list(/obj/item/rogueweapon/thresher/military)
	reqs = list(/obj/item/rogueweapon/thresher = 1,
				/obj/item/ingot/iron = 1)



/datum/crafting_recipe/roguetown/dryweed
	name = "dry westleach leaf"
	result = /obj/item/reagent_containers/food/snacks/produce/rogue/pipeweed_dried
	reqs = list(/obj/item/reagent_containers/food/snacks/produce/rogue/pipeweed = 1)
	structurecraft = /obj/structure/fluff/dryingrack
	time = 2 SECONDS
	verbage = "dry"
	verbage_tp = "dries"
	craftsound = null
	skillcraft = null

/datum/crafting_recipe/roguetown/sigdry
	name = "westleach zig"
	result = /obj/item/clothing/mask/cigarette/rollie/nicotine
	reqs = list(/obj/item/reagent_containers/food/snacks/produce/rogue/pipeweed_dried = 1,
				/obj/item/paper = 1)
	time = 10 SECONDS
	verbage = "roll"
	verbage_tp = "rolls"
	craftdiff = 0


//crafting recipes
/datum/crafting_recipe/roguetown/dryleaf
	name = "dry swampweed"
	result = /obj/item/reagent_containers/food/snacks/produce/rogue/swampweed_dried
	reqs = list(/obj/item/reagent_containers/food/snacks/produce/rogue/sweetleaf = 1)
	structurecraft = /obj/structure/fluff/dryingrack
	time = 2 SECONDS
	verbage = "dry"
	verbage_tp = "dries"
	craftsound = null
	skillcraft = null

/datum/crafting_recipe/roguetown/sigsweet
	name = "swampweed zig"
	result = /obj/item/clothing/mask/cigarette/rollie/cannabis
	reqs = list(/obj/item/reagent_containers/food/snacks/produce/rogue/swampweed_dried = 1,
				/obj/item/paper = 1)
	time = 10 SECONDS
	verbage = "roll"
	verbage_tp = "rolls"
	craftdiff = 0
