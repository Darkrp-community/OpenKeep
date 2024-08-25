/datum/anvil_recipe/tools
	i_type = "Utilities"
	craftdiff = 1

/datum/anvil_recipe/tools/blankeys
	name = "Blank Key x5"
	recipe_name = "five Blank Keys"
	req_bar = /obj/item/ingot/iron
	appro_skill = /datum/skill/craft/engineering // To train engineering
	created_item = /obj/item/customblank
	createmultiple = TRUE
	createditem_num = 4
	craftdiff = 0

/datum/anvil_recipe/tools/chains
	name = "Chains x3"
	recipe_name = "three lengths of Chain"
	req_bar = /obj/item/ingot/iron
	appro_skill = /datum/skill/craft/traps // To train trapmaking
	created_item = /obj/item/rope/chain
	createmultiple = TRUE
	createditem_num = 2
	craftdiff = 0

/datum/anvil_recipe/tools/cogiron
	name = "Cog x3"
	recipe_name = "three Cogs"
	req_bar = /obj/item/ingot/iron
	appro_skill = /datum/skill/craft/engineering // To train engineering
	created_item = /obj/item/roguegear
	createmultiple = TRUE
	createditem_num = 2
	craftdiff = 0

/datum/anvil_recipe/tools/cogstee
	name = "Cog x4"
	recipe_name = "four Cogs"
	req_bar = /obj/item/ingot/steel
	appro_skill = /datum/skill/craft/engineering // To train engineering
	created_item = /obj/item/roguegear
	createmultiple = TRUE
	createditem_num = 3

/datum/anvil_recipe/tools/cups
	name = "Cups x3"
	recipe_name = "three drinking Cups"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/reagent_containers/glass/cup
	createmultiple = TRUE
	createditem_num = 1
	craftdiff = 0

/datum/anvil_recipe/tools/frypan
	name = "Frypan"
	recipe_name = "a Frypan"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/cooking/pan
	craftdiff = 0

/datum/anvil_recipe/tools/gobletsteel
	name = "Goblets x3"
	recipe_name = "three Goblets"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/reagent_containers/glass/cup/steel
	createmultiple = TRUE
	createditem_num = 2
	craftdiff = 0

/datum/anvil_recipe/tools/gobletgold
	name = "Goblets x3"
	recipe_name = "three Goblets"
	req_bar = /obj/item/ingot/gold
	created_item = /obj/item/reagent_containers/glass/cup/golden
	createmultiple = TRUE
	createditem_num = 2
	craftdiff = 2

/datum/anvil_recipe/tools/gobletsilver
	name = "Goblets x3"
	recipe_name = "three Goblets"
	req_bar = /obj/item/ingot/silver
	created_item = /obj/item/reagent_containers/glass/cup/silver
	createmultiple = TRUE
	createditem_num = 2
	craftdiff = 2

/datum/anvil_recipe/tools/hammer
	name = "Hammer (+s)"
	recipe_name = "a blacksmithing Hammer"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/hammer
	i_type = "Tools"

/datum/anvil_recipe/tools/hoe
	name = "Hoe (+2s)"
	recipe_name = "a gardening Hoe"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick,/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/hoe
	i_type = "Tools"

/datum/anvil_recipe/tools/keyring
	name = "Keyrings x3"
	recipe_name = "three Keyrings"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/keyring
	createmultiple = TRUE
	createditem_num = 2
	craftdiff = 0

/datum/anvil_recipe/tools/lamptern
	name = "Lamptern"
	recipe_name = "a Lamptern"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/flashlight/flare/torch/lantern

/datum/anvil_recipe/tools/locks
	name = "Lock x5"
	recipe_name = "five Locks"
	req_bar = /obj/item/ingot/iron
	appro_skill = /datum/skill/craft/engineering // To train engineering
	created_item = /obj/item/customlock
	createmultiple = TRUE
	createditem_num = 4
	craftdiff = 0

/datum/anvil_recipe/tools/lockpicks
	name = "Lockpicks x3"
	recipe_name = "three Lockpicks"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/lockpick
	createmultiple = TRUE
	createditem_num = 2
	craftdiff = 2

/datum/anvil_recipe/tools/lockpickring
	name = "Lockpickrings x3"
	recipe_name = "three Lockpickrings"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/lockpickring
	createmultiple = TRUE
	createditem_num = 2
	craftdiff = 0

/datum/anvil_recipe/tools/pick
	name = "Pick (+s)"
	recipe_name = "a digging Pick"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/pick
	i_type = "Tools"

/datum/anvil_recipe/tools/pitchfork
	name = "Pitchfork (+2s)"
	recipe_name = "a Pitchfork"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick,/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/pitchfork
	i_type = "Tools"

/datum/anvil_recipe/tools/sewingneedle
	name = "Sewing Needles x3"
	recipe_name = "three Sewing Needles"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/needle
	createmultiple = TRUE
	createditem_num = 2 // They can be refilled with fiber now
	craftdiff = 0

/datum/anvil_recipe/tools/shovel
	name = "Shovel (+2s)"
	recipe_name = "a Shovel"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick,/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/shovel
	i_type = "Tools"

/datum/anvil_recipe/tools/sickle
	name = "Sickle (+s)"
	recipe_name = "a Sickle"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/grown/log/tree/stick)
	created_item = /obj/item/rogueweapon/sickle
	i_type = "Tools"

/datum/anvil_recipe/tools/tongs
	name = "Tongs"
	recipe_name = "a pair of Tongs"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/rogueweapon/tongs
	i_type = "Tools"

/datum/anvil_recipe/tools/torch
	name = "Torches x5 (+c)"
	recipe_name = "five Torches"
	req_bar = /obj/item/ingot/iron
	additional_items = list(/obj/item/rogueore/coal)
	created_item = /obj/item/flashlight/flare/torch/metal
	createmultiple = TRUE
	createditem_num = 4
	craftdiff = 0

/datum/anvil_recipe/tools/pote
	name = "Iron pot"
	recipe_name = "a cooking pot"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/reagent_containers/glass/bucket/pot
	craftdiff = 0
