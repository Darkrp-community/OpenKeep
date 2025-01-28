/datum/advclass/pilgrim/weaver
	name = "Weaver"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list("Humen",
	"Elf",
	"Half-Elf",
	"Dwarf",
	"Tiefling",
	"Changeling",
	"Skylancer",
	"Ogrun",
	"Undine"
	)
	outfit = /datum/outfit/job/roguetown/adventurer/weaver
	category_tags = list(CTAG_PILGRIM)

/datum/outfit/job/roguetown/adventurer/weaver/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/tanning, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
	head = /obj/item/clothing/head/roguetown/fashionablehat
	belt = /obj/item/storage/belt/rogue/leather/cloth/lady
	pants = /obj/item/clothing/under/roguetown/tights/random
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	backl = /obj/item/storage/backpack/rogue/satchel
	neck = /obj/item/storage/belt/rogue/pouch/coins/mid
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	beltr = /obj/item/rogueweapon/knife/hunting
	cloak = /obj/item/clothing/cloak/raincloak/furcloak
	beltl = /obj/item/reagent_containers/glass/bottle/waterskin/half
	backpack_contents = list(/obj/item/natural/bundle/cloth/partial = 1, /obj/item/cheap_dyes = 1, /obj/item/natural/bundle/fibers = 1, /obj/item/natural/fur/volf = 1)
	H.change_stat("intelligence", 2)
	H.change_stat("speed", 2)
	H.change_stat("perception", 1)
