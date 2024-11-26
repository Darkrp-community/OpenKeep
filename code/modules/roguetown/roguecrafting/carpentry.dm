/* CARPENTRY is for pretty much any object made of wood. To see some wooden structures that also use carpentry, go to structure.dm.
==========================================================*/

/datum/crafting_recipe/roguetown/carpentry
	skillcraft = /datum/skill/craft/carpentry
	subtype_reqs = TRUE
	craftdiff = 0

/*========= NO SKILL LEVEL REQUIRED ==========*/

/datum/crafting_recipe/roguetown/carpentry/woodbucket
	name = "wooden bucket"
	result = /obj/item/reagent_containers/glass/bucket/wooden
	reqs = list(/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/carpentry/spoon
	name = "wooden spoon"
	result = list(/obj/item/kitchen/spoon,
				/obj/item/kitchen/spoon)
	reqs = list(/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/carpentry/rollingpin
	name = "wooden rollingpin"
	result = /obj/item/rogueweapon/mace/woodclub/rollingpin
	reqs = list(/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/carpentry/woodbowl
	name = "wooden bowl"
	result = list(/obj/item/reagent_containers/glass/bowl,
				/obj/item/reagent_containers/glass/bowl)
	reqs = list(/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/carpentry/woodcup
	name = "wooden cups"
	result = list(/obj/item/reagent_containers/glass/cup/wooden/crafted,
				/obj/item/reagent_containers/glass/cup/wooden/crafted,
				/obj/item/reagent_containers/glass/cup/wooden/crafted)
	reqs = list(/obj/item/grown/log/tree/small = 1)

/obj/item/reagent_containers/glass/cup/wooden/crafted
	sellprice = 3

/datum/crafting_recipe/roguetown/carpentry/woodplatter
	name = "wood platters (x2)"
	result = list(/obj/item/cooking/platter,
				/obj/item/cooking/platter)
	reqs = list(/obj/item/grown/log/tree/small = 1)

/*========= SKILL LEVEL: 1 REQUIRED ==========*/

/datum/crafting_recipe/roguetown/carpentry/woodsword
	name = "wood sword"
	result = list(/obj/item/rogueweapon/mace/woodclub/train_sword,
					/obj/item/rogueweapon/mace/woodclub/train_sword)
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/carpentry/quarterstaff//elaborated quarterstaff only carpenters can do
	name = "wooden quarterstaff"
	result = list(/obj/item/rogueweapon/polearm/woodstaff/quarterstaff,
	/obj/item/rogueweapon/polearm/woodstaff/quarterstaff)
	reqs = list(/obj/item/grown/log/tree = 1)
	req_table = TRUE
	tools = list(/obj/item/rogueweapon/knife)
	craftdiff = 2

/datum/crafting_recipe/roguetown/woodspade
	name = "wood spade"
	result = /obj/item/rogueweapon/shovel/small
	reqs = list(/obj/item/grown/log/tree/small = 1,
			/obj/item/grown/log/tree/stick = 1)
	craftdiff = 1

/obj/item/rogueweapon/shovel/small/crafted
	sellprice = 5

/datum/crafting_recipe/roguetown/carpentry/recurve
	name = "recurve bow"
	result = list(/obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve)
	reqs = list(/obj/item/grown/log/tree/small = 1,
	/obj/item/natural/fibers = 4)
	craftdiff = 1

/*========= SKILL LEVEL: 2 REQUIRED ==========*/

/datum/crafting_recipe/roguetown/carpentry/woodshield
	name = "wooden shield"
	result = /obj/item/rogueweapon/shield/wood/crafted
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/hide = 1)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 2

/obj/item/rogueweapon/shield/wood/crafted
	sellprice = 6

/datum/crafting_recipe/roguetown/carpentry/handmadebow
	name = "wooden bow"
	result = list(/obj/item/gun/ballistic/revolver/grenadelauncher/bow)
	reqs = list(/obj/item/grown/log/tree/small = 1,
	/obj/item/natural/fibers = 6)
	craftdiff = 2

/datum/crafting_recipe/roguetown/structure/plough
	name = "plough"
	result = /obj/structure/plough
	reqs = list(/obj/item/grown/log/tree/small = 2, /obj/item/ingot/iron = 1)
	skillcraft = /datum/skill/craft/carpentry
	time = 4 SECONDS
	craftdiff = 2

/*========= SKILL LEVEL: 3 REQUIRED ==========*/

/datum/crafting_recipe/roguetown/carpentry/rproesthetic
	name = "wood arm (L)"
	result = list(/obj/item/bodypart/l_arm/rproesthetic)
	reqs = list(/obj/item/grown/log/tree/small = 1,
	/obj/item/roguegear = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/carpentry/rproesthetic
	name = "wood arm (R)"
	result = list(/obj/item/bodypart/r_arm/rproesthetic)
	reqs = list(/obj/item/grown/log/tree/small = 1,
	/obj/item/roguegear = 1)
	craftdiff = 3

/datum/crafting_recipe/roguetown/carpentry/longbow
	name = "longbow"
	result = list(/obj/item/gun/ballistic/revolver/grenadelauncher/bow/long)
	reqs = list(/obj/item/grown/log/tree/small = 1,
	/obj/item/natural/fibers = 8,
	/obj/item/reagent_containers/food/snacks/fat)
	structurecraft = /obj/machinery/light/rogue/campfire
	craftdiff = 3

/datum/crafting_recipe/roguetown/carpentry/woodflail
	name = "wooden flail x2"
	reqs = list(/obj/item/rope/chain = 1,
			/obj/item/grown/log/tree/stick = 1, /obj/item/grown/log/tree/small = 1)
	tools = list(/obj/item/rogueweapon/hammer)
	req_table = TRUE
	result = list(/obj/item/rogueweapon/flail/towner, /obj/item/rogueweapon/flail/towner)
	craftdiff = 3

/datum/crafting_recipe/roguetown/carpentry/woodengreatflail
	name = "great wooden flail"
	reqs = list(/obj/item/rope = 1,
			/obj/item/grown/log/tree/stick = 1, /obj/item/grown/log/tree/small = 1)
	tools = list(/obj/item/rogueweapon/hammer)
	req_table = TRUE
	result = list(/obj/item/rogueweapon/thresher)
	craftdiff = 3

// These are so these items don't receive the smithing modifiers.

/datum/crafting_recipe/roguetown/carpentry/steelstaff
	name = "steel quarterstaff"
	reqs = list(/obj/item/rogueweapon/polearm/woodstaff/quarterstaff = 1, /obj/item/ingot/steel = 2)
	result = list(/obj/item/rogueweapon/polearm/woodstaff/quarterstaff/steel)
	craftdiff = 3

/datum/crafting_recipe/roguetown/carpentry/ironstaff
	name = "iron quarterstaff"
	reqs = list(/obj/item/rogueweapon/polearm/woodstaff/quarterstaff = 1, /obj/item/ingot/iron = 1)
	tools = list(/obj/item/rogueweapon/hammer)
	result = list(/obj/item/rogueweapon/polearm/woodstaff/quarterstaff/iron)
	craftdiff = 3

/datum/crafting_recipe/roguetown/carpentry/militia_flail
	name = "militia flail"
	reqs = list(/obj/item/rogueweapon/flail/towner = 1, /obj/item/ingot/iron = 1)
	tools = list(/obj/item/rogueweapon/hammer)
	req_table = TRUE
	result = list(/obj/item/rogueweapon/flail/militia)
	craftdiff = 3

/datum/crafting_recipe/roguetown/carpentry/bigflail
	name = "great militia flail"
	reqs = list(/obj/item/rope/chain = 1,
			/obj/item/rogueweapon/thresher = 1, /obj/item/ingot/iron = 1)
	tools = list(/obj/item/rogueweapon/hammer)
	req_table = TRUE
	result = list(/obj/item/rogueweapon/thresher/military)
	craftdiff = 3

/datum/crafting_recipe/roguetown/carpentry/ironcudgel
	name = "peasant cudgels x2"
	reqs = list(/obj/item/grown/log/tree/small = 1, /obj/item/ingot/iron = 1)
	tools = list(/obj/item/rogueweapon/hammer)
	req_table = TRUE
	result = list(/obj/item/rogueweapon/mace/cudgel/carpenter, /obj/item/rogueweapon/mace/cudgel/carpenter)
	craftdiff = 3
