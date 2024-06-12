/datum/advclass/weaver
	name = "Weaver"
	tutorial = "Tailors, weavers and seamstresses, who make deft work of cloths and fiber \
				in order to craft clothes fit for a King, or royalty in general."
	allowed_sexes = list("Male", "female")
	allowed_races = list("Humen",
	"Elf",
	"Half-Elf",
	"Dwarf",
	"Tiefling",
	"Aasimar"
	)
	outfit = /datum/outfit/job/roguetown/adventurer/seamstress
	isvillager = TRUE
	ispilgrim = FALSE
	maxchosen = 1

/datum/outfit/job/roguetown/adventurer/seamstress/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/weaving, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/tanning, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/stealing, 1, TRUE)
	belt = /obj/item/storage/belt/rogue/leather/cloth/lady
	pants = /obj/item/clothing/under/roguetown/tights/random
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	backl = /obj/item/storage/backpack/rogue/satchel
	neck = /obj/item/storage/belt/rogue/pouch/coins/mid
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	beltr = /obj/item/rogueweapon/huntingknife/idagger
	cloak = /obj/item/clothing/cloak/raincloak/furcloak
	beltl = /obj/item/needle
	backpack_contents = list(/obj/item/natural/cloth = 1, /obj/item/natural/cloth = 1, /obj/item/natural/bundle/fibers = 1, /obj/item/needle = 1)
	H.change_stat("intelligence", 2)
	H.change_stat("speed", 2)
	H.change_stat("perception", 1)
