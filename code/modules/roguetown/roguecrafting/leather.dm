/* SKINCRAFT	-	skincraft skill
==========================================================*/
// The only ingridients these recipes can require is HIDE and FUR
// They all require a needle and a drying rack

/datum/crafting_recipe/roguetown/leather
	tools = list(/obj/item/needle)
	structurecraft = /obj/structure/fluff/dryingrack
	skillcraft = /datum/skill/craft/tanning
	craftdiff = 0
	subtype_reqs = TRUE // so you can use any subtype of fur
	reqs = list(/obj/item/natural/hide = 1)



/*========= NO SKILL LEVEL REQUIRED ==========*/
/datum/crafting_recipe/roguetown/leather/belt
	name = "leather belt"
	result = list(/obj/item/storage/belt/rogue/leather)

/datum/crafting_recipe/roguetown/leather/pouch
	name = "leather pouch"
	result = list(/obj/item/storage/belt/rogue/pouch)

/datum/crafting_recipe/roguetown/leather/gloves
	name = "leather gloves"
	result = /obj/item/clothing/gloves/roguetown/leather

/datum/crafting_recipe/roguetown/leather/bracers
	name = "leather bracers"
	result = /obj/item/clothing/wrists/roguetown/bracers/leather

/datum/crafting_recipe/roguetown/leather/shoes
	name = "leather shoes"
	result = /obj/item/clothing/shoes/roguetown/simpleshoes

/datum/crafting_recipe/roguetown/leather/boots
	name = "leather boots"
	result = /obj/item/clothing/shoes/roguetown/boots/leather

/datum/crafting_recipe/roguetown/leather/sandals
	name = "sandals"
	result = /obj/item/clothing/shoes/roguetown/sandals

/datum/crafting_recipe/roguetown/leather/gladiator
	name = "gladiator sandals"
	result = /obj/item/clothing/shoes/roguetown/gladiator

/datum/crafting_recipe/roguetown/leather/hood
	name = "leather hood"
	result = /obj/item/clothing/head/roguetown/roguehood/brown

/datum/crafting_recipe/roguetown/leather/papakha
	name = "papakha hat"
	result = /obj/item/clothing/head/roguetown/papakha
	reqs = list(/obj/item/natural/fur = 1)

/datum/crafting_recipe/roguetown/leather/cloak
	name = "leather cloak"
	result = /obj/item/clothing/cloak/raincloak/brown

/datum/crafting_recipe/roguetown/leather/cloakfur
	name = "fur cloak"
	result = /obj/item/clothing/cloak/raincloak/furcloak
	reqs = list(/obj/item/natural/fur = 1)

/datum/crafting_recipe/roguetown/leather/quiver
	name = "quiver"
	result = /obj/item/quiver
	reqs = list(/obj/item/natural/hide = 2)

/datum/crafting_recipe/roguetown/leather/tribal_cloak
	name = "tribal pelt"
	result = /obj/item/clothing/cloak/tribal

/datum/crafting_recipe/roguetown/leather/tribal_shoes
	name = "tribal shoes"
	result = list(/obj/item/clothing/shoes/roguetown/tribal)

/datum/crafting_recipe/roguetown/leather/furlinedanklets
	name = "fur lined anklets"
	reqs = list(/obj/item/natural/fur = 1)
	result = /obj/item/clothing/shoes/roguetown/boots/furlinedanklets

/datum/crafting_recipe/roguetown/leather/brimmedhat
	name = "brimmed hat"
	result = /obj/item/clothing/head/roguetown/brimmed

/datum/crafting_recipe/roguetown/leather/waterskin
	name = "waterskin"
	result = /obj/item/reagent_containers/glass/bottle/waterskin

/datum/crafting_recipe/roguetown/leather/leatherjacket
	name = "leather jacket"
	result = list(/obj/item/clothing/suit/roguetown/armor/leather/jacket/toggle)
	reqs = list(/obj/item/natural/hide = 2)

/datum/crafting_recipe/roguetown/leather/pants
	name = "leather pants"
	result = /obj/item/clothing/under/roguetown/trou/leather
	reqs = list(/obj/item/natural/hide = 2)

/*========= SKILL LEVEL: 1 REQUIRED ==========*/
/datum/crafting_recipe/roguetown/leather/saddle
	name = "leather saddle"
	result = /obj/item/natural/saddle
	reqs = list(/obj/item/natural/hide = 2)
	craftdiff = 1

/datum/crafting_recipe/roguetown/leather/satchel
	name = "leather satchel"
	result = /obj/item/storage/backpack/rogue/satchel
	reqs = list(/obj/item/natural/hide = 3)
	craftdiff = 1

/datum/crafting_recipe/roguetown/leather/meatbag
	name = "game satchel"
	result = /obj/item/storage/meatbag
	reqs = list(/obj/item/natural/hide = 3)
	craftdiff = 1

/datum/crafting_recipe/roguetown/leather/heavygloves
	name = "fur-lined gloves"
	result = /obj/item/clothing/gloves/roguetown/angle
	reqs = list(/obj/item/natural/hide = 1,
				/obj/item/natural/fur = 1)
	craftdiff = 1

/datum/crafting_recipe/roguetown/leather/helmet
	name = "leather helmet"
	result = /obj/item/clothing/head/roguetown/helmet/leather
	reqs = list(/obj/item/natural/hide = 2)
	craftdiff = 1

/datum/crafting_recipe/roguetown/leather/armor
	name = "leather armor"
	result = /obj/item/clothing/suit/roguetown/armor/leather
	reqs = list(/obj/item/natural/hide = 2)
	craftdiff = 1

/datum/crafting_recipe/roguetown/leather/whip
	name = "leather whip"
	result = /obj/item/rogueweapon/whip
	reqs = list(/obj/item/natural/hide = 2)
	craftdiff = 1

/datum/crafting_recipe/roguetown/leather/furlinedboots
	name = "fur lined boots"
	result = /obj/item/clothing/shoes/roguetown/boots/furlinedboots
	reqs = 	list(/obj/item/natural/hide = 2,
				/obj/item/natural/fur = 2)
	craftdiff = 1


/*========= SKILL LEVEL: 2 REQUIRED ==========*/

/datum/crafting_recipe/roguetown/leather/backpack
	name = "leather backpack"
	result = /obj/item/storage/backpack/rogue/backpack
	reqs = list(/obj/item/natural/hide = 4)
	craftdiff = 2

/datum/crafting_recipe/roguetown/leather/hidearmor
	name = "fur-lined armor"
	result = /obj/item/clothing/suit/roguetown/armor/leather/hide
	reqs = list(/obj/item/natural/hide = 2,
				/obj/item/natural/fur = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/leather/coif
	name = "leather coif"
	result = /obj/item/clothing/neck/roguetown/coif
	reqs = list(/obj/item/natural/hide = 1)
	craftdiff = 2

/datum/crafting_recipe/roguetown/leather/volfmantle
	name = "volf mantle"
	result = /obj/item/clothing/cloak/volfmantle
	reqs = list(/obj/item/natural/fur/volf = 1,
	/obj/item/natural/head/volf = 1)
	craftdiff = 2

