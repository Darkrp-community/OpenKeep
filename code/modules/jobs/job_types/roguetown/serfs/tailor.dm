/datum/job/roguetown/tailor
	title = "Tailor"
	f_title = "Seamstress"
	flag = TAILOR
	department_flag = TOWNERS
	faction = "Station"
	tutorial = "Cloth, furs, silk and leather are what you know best. You've tirelessly studied and poured your life into \
				making clothing both for fashion and for protection for commoner and noble alike."
	total_positions = 1
	spawn_positions = 1
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list("Humen",
	"Elf",
	"Half-Elf",
	"Dwarf",,
	"Changeling",
	"Skylancer",
	"Ogrun",
	"Undine"
	)
	give_bank_account = TRUE
	bypass_lastclass = TRUE
	display_order = JDO_TAILOR

	outfit = /datum/outfit/job/roguetown/tailor


/datum/outfit/job/roguetown/tailor/pre_equip(mob/living/carbon/human/H)
	..()

	shoes = /obj/item/clothing/shoes/roguetown/boots
	head = /obj/item/clothing/head/roguetown/fancyhat
	armor = /obj/item/clothing/suit/roguetown/shirt/tunic/ucolored
	belt = /obj/item/storage/belt/rogue/leather/black
	beltl = /obj/item/storage/belt/rogue/pouch/coins/poor
	beltr = /obj/item/roguekey/tailor


	shoes = /obj/item/clothing/shoes/roguetown/nobleboot
	belt = /obj/item/storage/belt/rogue/leather/cloth/tailor
	backl = /obj/item/storage/backpack/rogue/satchel
	neck = /obj/item/storage/belt/rogue/pouch/coins/mid
	backpack_contents = list(/obj/item/natural/bundle/cloth/partial = 1, /obj/item/natural/fur/gote = 1, /obj/item/natural/fur/mole = 1, /obj/item/luxury_dyes = 1)

	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/tanning, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		ADD_TRAIT(H, TRAIT_SEEPRICES, TRAIT_GENERIC)
		H.mind.teach_crafting_recipe(/datum/crafting_recipe/roguetown/sewing/tunic)

	if(H.gender == MALE)
		pants = /obj/item/clothing/under/roguetown/tights/random
		shirt = /obj/item/clothing/suit/roguetown/shirt/tunic/random
	else
		armor = /obj/item/clothing/suit/roguetown/shirt/dress/valorian

	if(H.dna.species.id == "dwarf")
		shoes = /obj/item/clothing/shoes/roguetown/simpleshoes/buckle

	H.change_stat("intelligence", 2)
	H.change_stat("speed", 2)
	H.change_stat("perception", 1)

/obj/item/luxury_dyes
	name = "luxury dyes"
	desc = "Adding these to a dye bin will let you use even the rarest, most expensive dyes."
	icon = 'icons/roguetown/items/misc.dmi'
	icon_state = "luxury_dyes"

/obj/item/cheap_dyes
	name = "cheap dyes"
	desc = "Adding these to a wooden bin will let you use it to dye clothing."
	icon = 'icons/roguetown/items/misc.dmi'
	icon_state = "cheap_dyes"
