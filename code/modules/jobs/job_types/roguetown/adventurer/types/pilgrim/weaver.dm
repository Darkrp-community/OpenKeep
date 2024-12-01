/datum/advclass/pilgrim/weaver
	name = "Weaver"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list("Humen",
	"Elf",
	"Half-Elf",
	"Dwarf",
	"Tiefling",
	"Aasimar"
	)
	outfit = /datum/outfit/job/roguetown/adventurer/tailor
//	category_tags = list(CTAG_PILGRIM)	Actually these guys are pure bloat, pilgrims need to have their own take on stuff, not be carbon copies.

/datum/outfit/job/roguetown/adventurer/tailor/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/tanning, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	belt = /obj/item/storage/belt/rogue/leather/cloth/lady
	pants = /obj/item/clothing/under/roguetown/tights/random
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	backl = /obj/item/storage/backpack/rogue/satchel
	neck = /obj/item/storage/belt/rogue/pouch/coins/mid
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	beltr = /obj/item/rogueweapon/knife/villager
	cloak = /obj/item/clothing/cloak/raincloak/furcloak
	beltl = /obj/item/needle
	backpack_contents = list(/obj/item/natural/cloth = 1, /obj/item/natural/cloth = 1, /obj/item/natural/bundle/fibers = 1, /obj/item/needle = 1)
	H.change_stat("intelligence", 2)
	H.change_stat("speed", 2)
	H.change_stat("perception", 1)

/datum/advclass/pilgrim/weaver/town
	category_tags = list(CTAG_TOWNER)
	outfit = /datum/outfit/job/roguetown/adventurer/weaver_towner

/datum/outfit/job/roguetown/adventurer/weaver_towner/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/tanning, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.mind.teach_crafting_recipe(/datum/crafting_recipe/roguetown/sewing/tunic)
	belt = /obj/item/storage/belt/rogue/leather/cloth/lady
	pants = /obj/item/clothing/under/roguetown/tights/random
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	backl = /obj/item/storage/backpack/rogue/satchel
	neck = /obj/item/storage/belt/rogue/pouch/coins/mid
	shirt = /obj/item/clothing/suit/roguetown/shirt/tunic/random
	beltr = /obj/item/rogueweapon/knife/villager
	cloak = /obj/item/clothing/cloak/raincloak/furcloak
	beltl = /obj/item/needle
	backpack_contents = list(/obj/item/natural/cloth = 1, /obj/item/natural/cloth = 1, /obj/item/natural/bundle/fibers = 1, /obj/item/needle = 1)
	H.change_stat("intelligence", 2)
	H.change_stat("speed", 2)
	H.change_stat("perception", 1)
