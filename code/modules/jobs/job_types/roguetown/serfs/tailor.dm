/datum/job/roguetown/tailor
	title = "Tailor"
	flag = TAILOR
	department_flag = TOWNERS
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	tutorial = "Cloth, linen, silk and leather. You've tirelessly studied and poured your life into \
				sewing articles of slight protection, padding, and fashion for serf and noble alike."

	allowed_races = ALL_PLAYER_RACES_BY_NAME

	bypass_lastclass = FALSE
	give_bank_account = 22
	outfit = /datum/outfit/job/roguetown/tailor
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
	head = /obj/item/clothing/head/roguetown/fashionablehat
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, pick(3,4), TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/tanning, pick(3,4), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/butchering, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		ADD_TRAIT(H, TRAIT_SEEPRICES, TRAIT_GENERIC)
	if(H.gender == MALE)
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
		pants = /obj/item/clothing/under/roguetown/tights
		cloak = /obj/item/clothing/cloak/raincloak/red
	else
		shirt = /obj/item/clothing/suit/roguetown/shirt/dress/silkdress
		cloak = /obj/item/clothing/cloak/raincloak/blue

		cloak = /obj/item/clothing/cloak/raincloak/purple
		shirt = /obj/item/clothing/suit/roguetown/shirt/dress/gen/purple
		armor = /obj/item/clothing/suit/roguetown/shirt/tunic/purple
		pants = /obj/item/clothing/under/roguetown/tights/purple

