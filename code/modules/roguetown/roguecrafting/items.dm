/datum/crafting_recipe/roguetown
	always_availible = TRUE
	skillcraft = /datum/skill/craft/crafting


/datum/crafting_recipe/roguetown/tneedle
	name = "sewing needle"
	result = /obj/item/needle/thorn
	reqs = list(/obj/item/natural/thorn = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/cloth
	name = "cloth"
	result = /obj/item/natural/cloth
	reqs = list(/obj/item/natural/fibers = 2)
	tools = list(/obj/item/needle)
	skillcraft = /datum/skill/misc/sewing
	craftdiff = 0
	verbage = "sew"
	verbage_tp = "sews"

/datum/crafting_recipe/roguetown/dart
	name = "dart"
	result = /obj/item/ammo_casing/caseless/rogue/dart
	reqs = list(/obj/item/natural/thorn = 1,
				/obj/item/grown/log/tree/stick = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/blowgun
	name = "blowgun"
	result = /obj/item/gun/ballistic/revolver/grenadelauncher/blowgun
	reqs = list(/obj/item/grown/log/tree/stick = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/clothsash
	name = "cloth sash"
	result = /obj/item/storage/belt/rogue/leather/cloth
	reqs = list(/obj/item/natural/cloth = 1)
	craftdiff = 0
	verbage = "tie"
	verbage_tp = "ties"

/datum/crafting_recipe/roguetown/unclothsash
	name = "untie cloth sash"
	result = /obj/item/natural/cloth
	reqs = list(/obj/item/storage/belt/rogue/leather/cloth = 1)
	craftdiff = 0
	verbage = "untie"
	verbage_tp = "unties"

/datum/crafting_recipe/roguetown/ropebelt
	name = "rope belt"
	result = /obj/item/storage/belt/rogue/leather/rope
	reqs = list(/obj/item/rope = 1)
	craftdiff = 0
	verbage = "untie"
	verbage_tp  = "unties"

/datum/crafting_recipe/roguetown/unropebelt
	name = "untie rope belt"
	result = /obj/item/rope
	reqs = list(/obj/item/storage/belt/rogue/leather/rope = 1)
	craftdiff = 0
	verbage = "untie"
	verbage_tp  = "unties"

/datum/crafting_recipe/roguetown/rope
	name = "rope"
	result = /obj/item/rope
	reqs = list(/obj/item/natural/fibers = 3)
	verbage = "braid"
	verbage_tp = "braids"

/datum/crafting_recipe/roguetown/net
	name = "net"
	result = /obj/item/net
	craftdiff = 2
	reqs = list(/obj/item/rope = 2,
				/obj/item/natural/stone = 3)
	verbage = "braid"
	verbage_tp = "braids"


/datum/crafting_recipe/roguetown/torch
	name = "torch"
	result = /obj/item/flashlight/flare/torch
	reqs = list(/obj/item/grown/log/tree/stick = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/candle
	name = "candle"
	result = /obj/item/candle/yellow
	reqs = list(/obj/item/reagent_containers/food/snacks/fat = 1)

/datum/crafting_recipe/roguetown/stoneaxe
	name = "stone axe"
	result = /obj/item/rogueweapon/stoneaxe
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/stone = 1)


/datum/crafting_recipe/roguetown/stoneknife
	name = "stone knife"
	result = /obj/item/rogueweapon/huntingknife/stoneknife
	reqs = list(/obj/item/grown/log/tree/stick = 1,
				/obj/item/natural/stone = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/stonespear
	name = "stone spear"
	result = /obj/item/rogueweapon/spear/stone
	reqs = list(/obj/item/rogueweapon/woodstaff = 1,
				/obj/item/natural/stone = 1)

/datum/crafting_recipe/roguetown/woodclub
	name = "wood club"
	result = /obj/item/rogueweapon/mace/woodclub/crafted
	reqs = list(/obj/item/grown/log/tree/small = 1)
	craftdiff = 0


/datum/crafting_recipe/roguetown/rproesthetic
	name = "wood arm (L)"
	result = list(/obj/item/bodypart/l_arm/rproesthetic)
	reqs = list(/obj/item/grown/log/tree/small = 1,
	/obj/item/roguegear = 1)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 3

/datum/crafting_recipe/roguetown/rproesthetic
	name = "wood arm (R)"
	result = list(/obj/item/bodypart/r_arm/rproesthetic)
	reqs = list(/obj/item/grown/log/tree/small = 1,
	/obj/item/roguegear = 1)
	skillcraft = /datum/skill/craft/carpentry
	craftdiff = 3

/obj/item/rogueweapon/mace/woodclub/crafted
	sellprice = 8

/datum/crafting_recipe/roguetown/woodstaff
	name = "wood staff"
	result = list(/obj/item/rogueweapon/woodstaff,
	/obj/item/rogueweapon/woodstaff,
	/obj/item/rogueweapon/woodstaff)
	reqs = list(/obj/item/grown/log/tree = 1)

/datum/crafting_recipe/roguetown/woodsword
	name = "wood sword"
	result = list(/obj/item/rogueweapon/mace/wsword,
					/obj/item/rogueweapon/mace/wsword)
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/fibers = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/woodshield
	name = "wooden shield"
	result = /obj/item/rogueweapon/shield/wood/crafted
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/hide = 1)
	skillcraft = /datum/skill/craft/carpentry

/obj/item/rogueweapon/shield/wood/crafted
	sellprice = 6

/datum/crafting_recipe/roguetown/spoon
	name = "wooden spoon"
	result = list(/obj/item/kitchen/spoon,
				/obj/item/kitchen/spoon)
	reqs = list(/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/rollingpin
	name = "wooden rollingpin"
	result = /obj/item/kitchen/rollingpin
	reqs = list(/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/woodbucket
	name = "wooden bucket"
	result = /obj/item/reagent_containers/glass/bucket/wooden
	reqs = list(/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/woodbowl
	name = "wooden bowl"
	result = list(/obj/item/reagent_containers/glass/bowl,
				/obj/item/reagent_containers/glass/bowl)
	reqs = list(/obj/item/grown/log/tree/small = 1)


/datum/crafting_recipe/roguetown/woodcup
	name = "wooden cups"
	result = list(/obj/item/reagent_containers/glass/cup/wooden/crafted,
				/obj/item/reagent_containers/glass/cup/wooden/crafted,
				/obj/item/reagent_containers/glass/cup/wooden/crafted)
	reqs = list(/obj/item/grown/log/tree/small = 1)

/obj/item/reagent_containers/glass/cup/wooden/crafted
	sellprice = 3

/datum/crafting_recipe/roguetown/mortar
	name = "stone mortar"
	result = /obj/item/reagent_containers/glass/mortar
	reqs = list(/obj/item/natural/stone = 1)
	tools = list(/obj/item/rogueweapon/huntingknife)
	craftdiff = 3
	subtype_reqs = TRUE

/datum/crafting_recipe/roguetown/alchmortar
	name = "alchemical mortar"
	result = /obj/item/mortar
	reqs = list(/obj/item/natural/stone = 3)
	tools = list(/obj/item/rogueweapon/huntingknife)
	verbage = "crafts"
	skillcraft = /datum/skill/craft/masonry

/datum/crafting_recipe/roguetown/pestle
	name = "pestle"
	result = /obj/item/pestle
	reqs = list(/obj/item/natural/stone = 2)
	tools = list(/obj/item/rogueweapon/huntingknife)
	verbage = "crafts"
	skillcraft = /datum/skill/craft/masonry

/datum/crafting_recipe/roguetown/bag
	name = "bag"
	result = /obj/item/storage/roguebag/crafted
	reqs = list(/obj/item/natural/fibers = 1,
				/obj/item/natural/cloth = 1)
	tools = list(/obj/item/needle)
	skillcraft = /datum/skill/misc/sewing

/obj/item/storage/roguebag/crafted
	sellprice = 4

/datum/crafting_recipe/roguetown/bait
	name = "bait"
	result = /obj/item/bait
	reqs = list(/obj/item/storage/roguebag = 1,
				/obj/item/reagent_containers/food/snacks/produce/wheat = 2)
	req_table = FALSE
	subtype_reqs = TRUE

/datum/crafting_recipe/roguetown/sbaita
	name = "sweetbait (a)"
	result = /obj/item/bait/sweet
	reqs = list(/obj/item/storage/roguebag = 1,
				/obj/item/reagent_containers/food/snacks/produce/apple = 2)
	req_table = FALSE
	subtype_reqs = TRUE

/datum/crafting_recipe/roguetown/sbait
	name = "sweetbait (b)"
	result = /obj/item/bait/sweet
	reqs = list(/obj/item/storage/roguebag = 1,
				/obj/item/reagent_containers/food/snacks/produce/berries/rogue = 2)
	req_table = FALSE
	subtype_reqs = TRUE

/datum/crafting_recipe/roguetown/bloodbait
	name = "bloodbait"
	result = /obj/item/bait/bloody
	reqs = list(/obj/item/storage/roguebag = 1,
				/obj/item/reagent_containers/food/snacks/rogue/meat = 2)
	req_table = FALSE
	subtype_reqs = TRUE

/datum/crafting_recipe/roguetown/woodplatter
	name = "wood platters (x2)"
	result = list(/obj/item/cooking/platter,
				/obj/item/cooking/platter)
	reqs = list(/obj/item/grown/log/tree/small = 1)

/datum/crafting_recipe/roguetown/pipe
	name = "wood pipe"
	result = /obj/item/clothing/mask/cigarette/pipe/crafted
	reqs = list(/obj/item/grown/log/tree/stick = 2)

/obj/item/clothing/mask/cigarette/pipe/crafted
	sellprice = 6

/datum/crafting_recipe/roguetown/rod
	name = "fishing rod"
	result = /obj/item/fishingrod/crafted
	reqs = list(/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/fibers = 2)

/obj/item/fishingrod/crafted
	sellprice = 8

/datum/crafting_recipe/roguetown/woodspade
	name = "wood spade"
	result = /obj/item/rogueweapon/shovel/small
	reqs = list(/obj/item/grown/log/tree/small = 1,
			/obj/item/grown/log/tree/stick = 1)

/datum/crafting_recipe/roguetown/broom
	name = "broom"
	result = /obj/item/broom
	reqs = list(/obj/item/natural/fibers = 1,
			/obj/item/grown/log/tree/stick = 4)
	craftdiff = 1

/obj/item/rogueweapon/shovel/small/crafted
	sellprice = 5

/datum/crafting_recipe/roguetown/basket_wicker
	name = "basket (wicker)"
	result = /obj/structure/closet/crate/chest/wicker
	reqs = list(/obj/item/natural/fibers = 4)
	craftdiff = 1

/datum/crafting_recipe/roguetown/book_crafting_kit
	name = "book crafting kit"
	result = /obj/item/book_crafting_kit
	reqs = list(
			/obj/item/natural/hide = 2,
			/obj/item/natural/cloth = 1)
	tools = list(/obj/item/needle = 1)
	req_table = TRUE

/datum/crafting_recipe/roguetown/mantrap
	name = "mantrap"
	result = list(/obj/item/restraints/legcuffs/beartrap,
				/obj/item/restraints/legcuffs/beartrap)
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/fibers = 2,
				/obj/item/ingot/iron = 1)
	req_table = TRUE
	skillcraft = /datum/skill/craft/traps
	craftdiff = 1
	verbage = "put together"
	verbage_tp = "puts together"

/datum/crafting_recipe/roguetown/stonearrow
	name = "stone arrow"
	result = /obj/item/ammo_casing/caseless/rogue/arrow/stone
	reqs = list(/obj/item/grown/log/tree/stick = 1,
				/obj/item/natural/stone = 1)
	req_table = TRUE

/datum/crafting_recipe/roguetown/poisonarrow
	name = "poison arrow"
	result = /obj/item/ammo_casing/caseless/rogue/arrow/poison
	reqs = list(/obj/item/ammo_casing/caseless/rogue/arrow = 1,
				/obj/item/reagent_containers/food/snacks/produce/berries/rogue/poison = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/poisonarrow/alt
	reqs = list(/obj/item/ammo_casing/caseless/rogue/arrow = 1,
				/datum/reagent/berrypoison = 5)

/datum/crafting_recipe/roguetown/poisonarrow/potent
	name = "poison arrow (potent)"
	result = /obj/item/ammo_casing/caseless/rogue/arrow/poison/potent
	reqs = list(/obj/item/ammo_casing/caseless/rogue/arrow = 1,
				/datum/reagent/strongpoison = 5)

/datum/crafting_recipe/roguetown/pyroarrow
	name = "pyroclastic arrow"
	result = /obj/item/ammo_casing/caseless/rogue/arrow/pyro
	reqs = list(/obj/item/ammo_casing/caseless/rogue/arrow = 1,
				/obj/item/reagent_containers/food/snacks/produce/fyritius = 1)
	craftdiff = 1
	skillcraft = /datum/skill/craft/engineering

/datum/crafting_recipe/roguetown/poisonbolt
	name = "poison bolt"
	result = /obj/item/ammo_casing/caseless/rogue/bolt/poison
	reqs = list(/obj/item/ammo_casing/caseless/rogue/bolt = 1,
				/obj/item/reagent_containers/food/snacks/produce/berries/rogue/poison = 1)
	craftdiff = 0

/datum/crafting_recipe/roguetown/poisonbolt/alt
	reqs = list(/obj/item/ammo_casing/caseless/rogue/bolt = 1,
				/datum/reagent/berrypoison = 5)

/datum/crafting_recipe/roguetown/poisonbolt/potent
	name = "poison bolt (potent)"
	result = /obj/item/ammo_casing/caseless/rogue/bolt/poison/potent
	reqs = list(/obj/item/ammo_casing/caseless/rogue/bolt = 1,
				/datum/reagent/strongpoison = 5)

/datum/crafting_recipe/roguetown/bomb
	name = "bomb"
	result = /obj/item/bomb/homemade
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/reagent_containers/food/snacks/produce/fyritius = 1,
				/obj/item/reagent_containers/glass/bottle = 1)
	craftdiff = 2
	skillcraft = /datum/skill/craft/engineering

/datum/crafting_recipe/roguetown/pyrobolt
	name = "pyroclastic bolt"
	result = /obj/item/ammo_casing/caseless/rogue/bolt/pyro
	reqs = list(/obj/item/ammo_casing/caseless/rogue/bolt = 1,
				/obj/item/reagent_containers/food/snacks/produce/fyritius = 1)
	craftdiff = 1
	skillcraft = /datum/skill/craft/engineering

/datum/crafting_recipe/roguetown/flint
	name = "flint"
	result = /obj/item/flint
	reqs = list(
			/obj/item/natural/stone = 1,
			/obj/item/ingot/iron = 1)
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 0 // Something to practice engineering with.

/datum/crafting_recipe/roguetown/paperscroll
	name = "parchment scroll x5"
	result = list(/obj/item/paper/scroll,
				/obj/item/paper/scroll,
				/obj/item/paper/scroll,
				/obj/item/paper/scroll,
				/obj/item/paper/scroll)
	reqs = list(/obj/item/grown/log/tree/small = 1,
	/datum/reagent/water = 50)
	tools = list(/obj/item/rogueweapon/huntingknife)
	structurecraft = /obj/structure/fluff/dryingrack
	craftdiff = 1

/datum/crafting_recipe/roguetown/readingscroll
	name = "novice's guide to literature"
	result = list(/obj/item/literary)
	reqs = list(/obj/item/paper/scroll = 5)
	tools = list(/obj/item/natural/feather)
	req_table = TRUE
	skillcraft = /datum/skill/misc/reading
	craftdiff = 2
	verbage = "write"
	verbage_tp  = "writes"

/datum/crafting_recipe/roguetown/readingscroll/apprentice
	name = "apprentice's guide to literature"
	result = list(/obj/item/literary/apprentice)
	craftdiff = 3

/datum/crafting_recipe/roguetown/readingscroll/journeyman
	name = "journeyman's guide to literature"
	result = list(/obj/item/literary/journeyman)
	craftdiff = 4

/datum/crafting_recipe/roguetown/readingscroll/expert
	name = "expert's guide to literature"
	result = list(/obj/item/literary/expert)
	craftdiff = 5

/datum/crafting_recipe/roguetown/readingscroll/master
	name = "master's guide to literature"
	result = list(/obj/item/literary/master)
	craftdiff = 6

//weapons

/datum/crafting_recipe/roguetown/quarterstaff
	name = "wooden quarterstaff"
	result = list(/obj/item/rogueweapon/woodstaff/quarterstaff,
	/obj/item/rogueweapon/woodstaff/quarterstaff)
	reqs = list(/obj/item/grown/log/tree = 1)
	req_table = TRUE
	tools = list(/obj/item/rogueweapon/huntingknife)
	skillcraft = /datum/skill/craft/carpentry

/datum/crafting_recipe/roguetown/steelstaff
	name = "steel quarterstaff"
	skillcraft = /datum/skill/craft/carpentry
	reqs = list(/obj/item/rogueweapon/woodstaff/quarterstaff = 1, /obj/item/ingot/steel = 2)
	result = list(/obj/item/rogueweapon/woodstaff/quarterstaff/steel)
	craftdiff = 3

/datum/crafting_recipe/roguetown/ironstaff
	name = "iron quarterstaff"
	skillcraft = /datum/skill/craft/carpentry
	reqs = list(/obj/item/rogueweapon/woodstaff/quarterstaff = 1, /obj/item/ingot/iron = 1)
	tools = list(/obj/item/rogueweapon/hammer)
	result = list(/obj/item/rogueweapon/woodstaff/quarterstaff/iron)
	craftdiff = 2

/datum/crafting_recipe/roguetown/woodflail
	name = "wooden flail x2"
	skillcraft = /datum/skill/craft/carpentry
	reqs = list(/obj/item/rope/chain = 1,
			/obj/item/grown/log/tree/stick = 1, /obj/item/grown/log/tree/small = 1)
	tools = list(/obj/item/rogueweapon/hammer)
	req_table = TRUE
	result = list(/obj/item/rogueweapon/flail/towner, /obj/item/rogueweapon/flail/towner)
	craftdiff = 2

/datum/crafting_recipe/roguetown/militia_flail
	name = "militia flail"
	skillcraft = /datum/skill/craft/carpentry
	reqs = list(/obj/item/rogueweapon/flail/towner = 1, /obj/item/ingot/iron = 1)
	tools = list(/obj/item/rogueweapon/hammer)
	req_table = TRUE
	result = list(/obj/item/rogueweapon/flail/militia)
	craftdiff = 3

/datum/crafting_recipe/roguetown/woodengreatflail
	name = "great wooden flail"
	skillcraft = /datum/skill/craft/carpentry
	reqs = list(/obj/item/rope = 1,
			/obj/item/grown/log/tree/stick = 1, /obj/item/grown/log/tree/small = 1)
	tools = list(/obj/item/rogueweapon/hammer)
	req_table = TRUE
	result = list(/obj/item/rogueweapon/thresher)
	craftdiff = 2

/datum/crafting_recipe/roguetown/bigflail
	name = "great militia flail"
	skillcraft = /datum/skill/craft/carpentry
	reqs = list(/obj/item/rope/chain = 1,
			/obj/item/rogueweapon/thresher = 1, /obj/item/ingot/iron = 1)
	tools = list(/obj/item/rogueweapon/hammer)
	req_table = TRUE
	result = list(/obj/item/rogueweapon/thresher/military)
	craftdiff = 3


/datum/crafting_recipe/roguetown/ironcudgel
	name = "peasant cudgels x2"
	skillcraft = /datum/skill/craft/carpentry
	reqs = list(/obj/item/grown/log/tree/small = 1, /obj/item/ingot/iron = 1)
	tools = list(/obj/item/rogueweapon/hammer)
	req_table = TRUE
	result = list(/obj/item/rogueweapon/mace/cudgel/carpenter, /obj/item/rogueweapon/mace/cudgel/carpenter)
	craftdiff = 3

//bows
/datum/crafting_recipe/roguetown/bowyer
	tools = list(/obj/item/rogueweapon/huntingknife)
	skillcraft = /datum/skill/craft/carpentry

/datum/crafting_recipe/roguetown/bowstring
	name = "bowstring"
	result = list(/obj/item/natural/bowstring)
	reqs = list(/obj/item/natural/fibers = 4)
	craftdiff = 1
	verbage = "twist"
	verbage_tp = "twists"

/datum/crafting_recipe/roguetown/bowyer/handmadebow
	name = "wooden bow"
	result = list(/obj/item/gun/ballistic/revolver/grenadelauncher/bow)
	reqs = list(/obj/item/grown/log/tree/small = 1,
	/obj/item/natural/bowstring = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/bowyer/recurve
	name = "recurve bow"
	result = list(/obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve, /obj/item/gun/ballistic/revolver/grenadelauncher/bow/recurve)
	reqs = list(/obj/item/grown/log/tree/small = 1, /obj/item/natural/bowstring = 1, /obj/item/alch/sinew = 1, /obj/item/alch/horn = 1 )
	craftdiff = 1

/datum/crafting_recipe/roguetown/bowyer/longbow
	name = "longbow"
	result = list(/obj/item/gun/ballistic/revolver/grenadelauncher/bow/long)
	reqs = list(/obj/item/grown/log/tree = 1,
	/obj/item/alch/sinew = 1,
	/obj/item/reagent_containers/food/snacks/fat)
	structurecraft = /obj/machinery/light/rogue/campfire
	craftdiff = 3
