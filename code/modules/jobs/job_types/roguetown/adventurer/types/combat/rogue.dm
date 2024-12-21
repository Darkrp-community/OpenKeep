/datum/advclass/combat/rogue
	name = "Thief"
	tutorial = "A wandering thief, capable of breaking in and out of just about any secure location, and born to meet the sharp end of the guillotine. Just remember, murder is the mark of an amateur."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = ALL_PLAYER_RACES_BY_NAME
	outfit = /datum/outfit/job/roguetown/adventurer/rogue
	min_pq = 5
	category_tags = list(CTAG_ADVENTURER)
	cmode_music = 'sound/music/cmode/adventurer/CombatRogue.ogg'

/datum/outfit/job/roguetown/adventurer/rogue/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.mind)
		H.mind?.adjust_skillrank(/datum/skill/combat/swords, pick(0,0,1), TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/climbing, 5, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/reading, pick(0,1,1), TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/sneaking, 5, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/stealing, 5, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/misc/lockpicking, 4, TRUE)
		H.mind?.adjust_skillrank(/datum/skill/craft/traps, 3, TRUE)
	// DO NOT GIVE THEM A CLOAK HERE- THAT WILL BE SORTED IN post_equip()
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/black
	gloves = /obj/item/clothing/gloves/roguetown/fingerless
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shoes = /obj/item/clothing/shoes/roguetown/boots
	backl = /obj/item/storage/backpack/rogue/satchel
	//backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow // Give them this back when ever we give the thief a quiver that has a variety of arrows such as rope- water- fire- moss- and blunt arrows.
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/rogueweapon/mace/cudgel // TEMP untill I make a blackjack- for now though this will do
	//beltl = /obj/item/quiver/arrows // Give them this back when ever we give the thief a quiver that has a variety of arrows such as rope- water- fire- moss- and blunt arrows.
	backpack_contents = list(/obj/item/lockpick, /obj/item/rogueweapon/knife/dagger/steel, /obj/item/clothing/mask/rogue/shepherd/rag)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_THIEVESGUILD, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_LIGHT_STEP, TRAIT_GENERIC)
	H.change_stat(STATKEY_STR, -3)
	H.change_stat(STATKEY_PER, 2)
	H.change_stat(STATKEY_SPD, 2)
	H.grant_language(/datum/language/thievescant)
	to_chat(H, "<span class='info'>I can gesture in thieves' cant with ,t before my speech.</span>")

/datum/outfit/job/roguetown/adventurer/rogue/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	// Give them their cloak- as well as the ability to choose what color they want.
	//var/list/thiefcloak_color = list("Fyritius Dye","Winestain Red","Maroon","Blood Red","Forest Green","Bog Green","Spring Green","Royal Teal","Mana Blue","Berry","Lavender Purple","Majenta","Bark Brown","Russet","Chestnut","Old Leather","Ashen Black")
	var/thiefcloak_color_selection = input(usr,"What color was I again?","The Cloak","Ashen Black") in list("Fyritius Dye","Winestain Red","Maroon","Blood Red","Forest Green","Bog Green","Spring Green","Royal Teal","Mana Blue","Berry","Lavender Purple","Majenta","Bark Brown","Russet","Chestnut","Old Leather","Ashen Black")
	var/obj/item/clothing/cloak/raincloak/thiefcloak = new()
	switch(thiefcloak_color_selection)
		if("Fyritius Dye")
			thiefcloak.color="#b47011"
		if("Winestain Red")
			thiefcloak.color="#6b3737"
		if("Maroon")
			thiefcloak.color="#672c0d"
		if("Blood Red")
			thiefcloak.color="#770d0d"
		if("Forest Green")
			thiefcloak.color="#3f8b24"
		if("Bog Green")
			thiefcloak.color="#58793f"
		if("Spring Green")
			thiefcloak.color="#435436"
		if("Royal Teal")
			thiefcloak.color="#249589"
		if("Mana Blue")
			thiefcloak.color="#1b3c7a"
		if("Berry")
			thiefcloak.color="#38455b"
		if("Lavender Purple")
			thiefcloak.color="#865c9c"
		if("Majenta")
			thiefcloak.color="#822b52"
		if("Bark Brown")
			thiefcloak.color="#685542"
		if("Russet")
			thiefcloak.color="#685542"
		if("Chestnut")
			thiefcloak.color="#5f3d21"
		if("Old Leather")
			thiefcloak.color="#473a30"
		if("Ashen Black")
			thiefcloak.color="#2f352f"
	H.equip_to_slot(thiefcloak, SLOT_CLOAK, TRUE)
