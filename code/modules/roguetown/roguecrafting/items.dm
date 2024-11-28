/* CRAFTING	uses the Crafting skill, natch. Pretty much every recipe that doesn't fit somewhere else.
==========================================================*/

/datum/crafting_recipe/roguetown
	always_availible = TRUE
	skillcraft = /datum/skill/craft/crafting
	craftdiff = 0

/*========= NO SKILL LEVEL REQUIRED ==========*/

/datum/crafting_recipe/roguetown/torch
	name = "torch"
	result = /obj/item/flashlight/flare/torch
	reqs = list(/obj/item/grown/log/tree/stick = 1,
				/obj/item/natural/fibers = 1)

/datum/crafting_recipe/roguetown/tneedle
	name = "sewing needle"
	result = /obj/item/needle/thorn
	reqs = list(/obj/item/natural/thorn = 1,
				/obj/item/natural/fibers = 1)

/datum/crafting_recipe/roguetown/cloth
	name = "cloth"
	result = /obj/item/natural/cloth
	reqs = list(/obj/item/natural/fibers = 2)
	tools = list(/obj/item/needle)
	skillcraft = /datum/skill/misc/sewing
	verbage = "sew"
	verbage_tp = "sews"

/datum/crafting_recipe/roguetown/pipe
	name = "wood pipe"
	result = /obj/item/clothing/mask/cigarette/pipe/crafted
	reqs = list(/obj/item/grown/log/tree/stick = 2)

/obj/item/clothing/mask/cigarette/pipe/crafted
	sellprice = 6

/datum/crafting_recipe/roguetown/dryweed
	name = "dry westleach leaf"
	result = /obj/item/reagent_containers/food/snacks/produce/dry_westleach
	reqs = list(/obj/item/reagent_containers/food/snacks/produce/westleach = 1)
	structurecraft = /obj/structure/fluff/dryingrack
	time = 2 SECONDS
	verbage = "dry"
	verbage_tp = "dries"
	craftsound = null
	skillcraft = null

/datum/crafting_recipe/roguetown/sigdry
	name = "westleach zig"
	result = /obj/item/clothing/mask/cigarette/rollie/nicotine
	reqs = list(/obj/item/reagent_containers/food/snacks/produce/dry_westleach = 1,
				/obj/item/paper = 1)
	time = 10 SECONDS
	verbage = "roll"
	verbage_tp = "rolls"

/datum/crafting_recipe/roguetown/dryleaf
	name = "dry swampweed"
	result = /obj/item/reagent_containers/food/snacks/produce/swampweed_dried
	reqs = list(/obj/item/reagent_containers/food/snacks/produce/swampweed = 1)
	structurecraft = /obj/structure/fluff/dryingrack
	time = 2 SECONDS
	verbage = "dry"
	verbage_tp = "dries"
	craftsound = null
	skillcraft = null

/datum/crafting_recipe/roguetown/sigsweet
	name = "swampweed zig"
	result = /obj/item/clothing/mask/cigarette/rollie/cannabis
	reqs = list(/obj/item/reagent_containers/food/snacks/produce/swampweed_dried = 1,
				/obj/item/paper = 1)
	time = 10 SECONDS
	verbage = "roll"
	verbage_tp = "rolls"

/datum/crafting_recipe/roguetown/dart
	name = "dart"
	result = /obj/item/ammo_casing/caseless/rogue/dart
	reqs = list(/obj/item/natural/thorn = 1,
				/obj/item/grown/log/tree/stick = 1)

/datum/crafting_recipe/roguetown/blowgun
	name = "blowgun"
	result = /obj/item/gun/ballistic/revolver/grenadelauncher/blowgun
	reqs = list(/obj/item/grown/log/tree/stick = 1)

/datum/crafting_recipe/roguetown/clothsash
	name = "cloth sash"
	result = /obj/item/storage/belt/rogue/leather/cloth
	reqs = list(/obj/item/natural/cloth = 1)
	verbage = "tie"
	verbage_tp = "ties"

/datum/crafting_recipe/roguetown/unclothsash
	name = "untie cloth sash"
	result = /obj/item/natural/cloth
	reqs = list(/obj/item/storage/belt/rogue/leather/cloth = 1)
	verbage = "untie"
	verbage_tp = "unties"

/datum/crafting_recipe/roguetown/ropebelt
	name = "rope belt"
	result = /obj/item/storage/belt/rogue/leather/rope
	reqs = list(/obj/item/rope = 1)
	verbage = "untie"
	verbage_tp  = "unties"

/datum/crafting_recipe/roguetown/unropebelt
	name = "untie rope belt"
	result = /obj/item/rope
	reqs = list(/obj/item/storage/belt/rogue/leather/rope = 1)
	verbage = "untie"
	verbage_tp  = "unties"

/datum/crafting_recipe/roguetown/rope
	name = "rope"
	result = /obj/item/rope
	reqs = list(/obj/item/natural/fibers = 3)
	verbage = "braid"
	verbage_tp = "braids"

/*
/datum/crafting_recipe/roguetown/net
	name = "net"
	result = /obj/item/net
	craftdiff = 2
	reqs = list(/obj/item/rope = 2,
				/obj/item/natural/stone = 3)
	verbage = "braid"
	verbage_tp = "braids"
*/

/datum/crafting_recipe/roguetown/woodstaff//this is the simple staff anyone can make
	name = "wood staff"
	result = list(/obj/item/rogueweapon/polearm/woodstaff,
	/obj/item/rogueweapon/polearm/woodstaff,
	/obj/item/rogueweapon/polearm/woodstaff)
	reqs = list(/obj/item/grown/log/tree = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/stoneaxe
	name = "stone axe"
	result = /obj/item/rogueweapon/axe/stone
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/stone = 1)

/datum/crafting_recipe/roguetown/stoneknife
	name = "stone knife"
	result = /obj/item/rogueweapon/knife/stone
	reqs = list(/obj/item/grown/log/tree/stick = 1,
				/obj/item/natural/stone = 1)

/datum/crafting_recipe/roguetown/stonespear
	name = "stone spear"
	result = /obj/item/rogueweapon/polearm/spear/stone
	reqs = list(/obj/item/rogueweapon/polearm/woodstaff = 1,
				/obj/item/natural/stone = 1)

/datum/crafting_recipe/roguetown/woodclub
	name = "wood club"
	result = /obj/item/rogueweapon/mace/woodclub/crafted
	reqs = list(/obj/item/grown/log/tree/small = 1)

/obj/item/rogueweapon/mace/woodclub/crafted
	sellprice = 8

/datum/crafting_recipe/roguetown/rod
	name = "fishing rod"
	result = /obj/item/fishingrod/crafted
	reqs = list(/obj/item/grown/log/tree/small = 1,
		/obj/item/natural/fibers = 2)
	tools = list(/obj/item/rogueweapon/knife)
	craftdiff = 0

/obj/item/fishingrod/crafted
	sellprice = 8

/datum/crafting_recipe/roguetown/bait
	name = "bait"
	result = /obj/item/bait
	reqs = list(/obj/item/storage/roguebag = 1,
				/obj/item/reagent_containers/food/snacks/produce/wheat = 2)
	subtype_reqs = TRUE

/datum/crafting_recipe/roguetown/sbaita
	name = "sweetbait (a)"
	result = /obj/item/bait/sweet
	reqs = list(/obj/item/storage/roguebag = 1,
				/obj/item/reagent_containers/food/snacks/produce/apple = 2)
	subtype_reqs = TRUE

/datum/crafting_recipe/roguetown/sbait
	name = "sweetbait (b)"
	result = /obj/item/bait/sweet
	reqs = list(/obj/item/storage/roguebag = 1,
				/obj/item/reagent_containers/food/snacks/produce/jacksberry = 2)
	subtype_reqs = TRUE

/datum/crafting_recipe/roguetown/bloodbait
	name = "bloodbait"
	result = /obj/item/bait/bloody
	reqs = list(/obj/item/storage/roguebag = 1,
				/obj/item/reagent_containers/food/snacks/rogue/meat = 2)
	subtype_reqs = TRUE

/datum/crafting_recipe/roguetown/earnecklace
	name = "ear necklace"
	result = /obj/item/clothing/neck/roguetown/menears
	reqs = list(/obj/item/organ/ears = 4,
				/obj/item/rope = 1)

/datum/crafting_recipe/roguetown/elfearnecklace
	name = "elf ear necklace"
	result = /obj/item/clothing/neck/roguetown/elfears
	reqs = list(/obj/item/organ/ears = 4,
				/obj/item/rope = 1)

/*========= SKILL LEVEL: 1 REQUIRED ==========*/

/datum/crafting_recipe/roguetown/candle
	name = "candle"
	result = /obj/item/candle/yellow
	reqs = list(/obj/item/reagent_containers/food/snacks/fat = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/basket_wicker
	name = "basket (wicker)"
	result = /obj/structure/closet/crate/chest/wicker
	reqs = list(/obj/item/natural/fibers = 4)
	craftdiff = 1

/datum/crafting_recipe/roguetown/broom
	name = "broom"
	result = /obj/item/broom
	reqs = list(/obj/item/natural/fibers = 1,
			/obj/item/grown/log/tree/stick = 4)
	craftdiff = 1

/datum/crafting_recipe/roguetown/wickercloak
	name = "wickercloak"
	result = /obj/item/clothing/cloak/wickercloak
	reqs = list(/obj/item/natural/dirtclod = 1,
				/obj/item/grown/log/tree/stick = 5,
				/obj/item/natural/fibers = 3)
	craftdiff = 1

/datum/crafting_recipe/roguetown/bogcowl
	name = "bogcowl"
	result = /obj/item/clothing/neck/roguetown/bogcowl
	reqs = list(/obj/item/natural/dirtclod = 1,
				/obj/item/grown/log/tree/stick = 3,
				/obj/item/natural/fibers = 2)
	craftdiff = 1

/*========= MISCELLANY ==========*/

/datum/crafting_recipe/roguetown/pestle
	name = "pestle"
	result = /obj/item/pestle
	reqs = list(/obj/item/natural/stone = 2)
	tools = list(/obj/item/rogueweapon/knife/hunting)
	verbage = "crafts"
	skillcraft = /datum/skill/craft/masonry
	craftdiff = 1

/datum/crafting_recipe/roguetown/mortar
	name = "stone mortar"
	result = /obj/item/reagent_containers/glass/mortar
	reqs = list(/obj/item/natural/stone = 1)
	tools = list(/obj/item/rogueweapon/knife/hunting)
	craftdiff = 1
	subtype_reqs = TRUE
	skillcraft = /datum/skill/craft/masonry

/datum/crafting_recipe/roguetown/alchmortar
	name = "alchemical mortar"
	result = /obj/item/mortar
	reqs = list(/obj/item/natural/stone = 3)
	tools = list(/obj/item/rogueweapon/knife/hunting)
	verbage = "crafts"
	skillcraft = /datum/skill/craft/masonry

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

/*========= AMMO CRAFTING ==========*/

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
				/obj/item/reagent_containers/food/snacks/produce/jacksberry/poison = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/poisonarrow/alt
	reqs = list(/obj/item/ammo_casing/caseless/rogue/arrow = 1,
				/datum/reagent/berrypoison = 5)

/datum/crafting_recipe/roguetown/poisonarrow/potent
	name = "poison arrow (potent)"
	result = /obj/item/ammo_casing/caseless/rogue/arrow/poison/potent
	reqs = list(/obj/item/ammo_casing/caseless/rogue/arrow = 1,
				/datum/reagent/strongpoison = 5)

/datum/crafting_recipe/roguetown/poisonbolt
	name = "poison bolt"
	result = /obj/item/ammo_casing/caseless/rogue/bolt/poison
	reqs = list(/obj/item/ammo_casing/caseless/rogue/bolt = 1,
				/obj/item/reagent_containers/food/snacks/produce/jacksberry/poison = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/poisonbolt/alt
	reqs = list(/obj/item/ammo_casing/caseless/rogue/bolt = 1,
				/datum/reagent/berrypoison = 5)

/datum/crafting_recipe/roguetown/poisonbolt/potent
	name = "poison bolt (potent)"
	result = /obj/item/ammo_casing/caseless/rogue/bolt/poison/potent
	reqs = list(/obj/item/ammo_casing/caseless/rogue/bolt = 1,
				/datum/reagent/strongpoison = 5)

/*========= ENGINEEERING CRAFTING ==========*/

/datum/crafting_recipe/roguetown/flint
	name = "flint"
	result = /obj/item/flint
	reqs = list(
			/obj/item/natural/stone = 1,
			/obj/item/ingot/iron = 1)
	skillcraft = /datum/skill/craft/engineering
	craftdiff = 0 // Something to practice engineering with.

/datum/crafting_recipe/roguetown/pyroarrow
	name = "pyroclastic arrow"
	result = /obj/item/ammo_casing/caseless/rogue/arrow/pyro
	reqs = list(/obj/item/ammo_casing/caseless/rogue/arrow = 1,
				/obj/item/reagent_containers/food/snacks/produce/fyritius = 1)
	craftdiff = 1
	skillcraft = /datum/skill/craft/engineering

/datum/crafting_recipe/roguetown/pyrobolt
	name = "pyroclastic bolt"
	result = /obj/item/ammo_casing/caseless/rogue/bolt/pyro
	reqs = list(/obj/item/ammo_casing/caseless/rogue/bolt = 1,
				/obj/item/reagent_containers/food/snacks/produce/fyritius = 1)
	craftdiff = 1
	skillcraft = /datum/skill/craft/engineering

/datum/crafting_recipe/roguetown/bomb
	name = "bomb"
	result = /obj/item/bomb/homemade
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/reagent_containers/food/snacks/produce/fyritius = 1,
				/obj/item/reagent_containers/glass/bottle = 1)
	craftdiff = 2
	skillcraft = /datum/skill/craft/engineering

/*========= LITERATURE CRAFTING ==========*/

/datum/crafting_recipe/roguetown/paperscroll
	name = "parchment scroll x5"
	result = list(/obj/item/paper/scroll,
				/obj/item/paper/scroll,
				/obj/item/paper/scroll,
				/obj/item/paper/scroll,
				/obj/item/paper/scroll)
	reqs = list(/obj/item/grown/log/tree/small = 1,
	/datum/reagent/water = 50)
	tools = list(/obj/item/rogueweapon/knife/hunting)
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
