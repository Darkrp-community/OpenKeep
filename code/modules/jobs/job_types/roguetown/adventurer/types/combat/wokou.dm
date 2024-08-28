// The Abyssariad BROADER version of "The Warrior" class.
// It's meant to be a RnG catch-many for the players that have gambling addiction and
// greater cultural juice. Otherwise they will take Ronin, Sohei or Marauder.
// Militaristic as it fit their theme. Not a member of Zamurai caste.
/datum/advclass/combat/abyssariad/wokou
	name = "Wokou Raider"
	tutorial = "Wokou is a general term for abyssariad pirates who constantly causes annual invasions on coastline provinces worldwide. These fierce warriors is the main reason Abyssariads are feared on the local population - and constantly switch statrocracy-funded equipment before expeditions."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
	"Kitsune",
	"Tengu",
	"Oni",
	"Kappa")
	outfit = /datum/advclass/combat/abyssariad/wokou
	category_tags = list(CTAG_ADVENTURER)

/datum/advclass/combat/abyssariad/wokou/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, pick(1,2), TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/bows, pick(1,2), TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, pick(1,1,2), TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/shields, pick(2,3), TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, pick(1,1,2), TRUE)

	shoes = /obj/item/clothing/shoes/roguetown/boots
	gloves = /obj/item/clothing/gloves/roguetown/leather
	belt = /obj/item/storage/belt/rogue/leather
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/random
	pants = /obj/item/clothing/under/roguetown/tights/black
	var/specialization = pickweight(list("LinYou" = 2, "Dustriders" = 1, "Muqian" = 3, "Independent" = 2, "Corsair" = 1))
	switch(specialization)
		if("LinYou") //below average roll; 20% of Wokou Population
			armor = /obj/item/clothing/suit/roguetown/armor/rattan
			head = /obj/item/clothing/head/roguetown/helmet/skullcap/rattan
			backl = /obj/item/storage/backpack/rogue/satchel
			backr = /obj/item/rogueweapon/shield/rattan
			beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
			beltl = /obj/item/rogueweapon/sword/iron/jian
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
			to_chat(H, "<span class='info'>Hailing from the tropical edges, I am a 'LinYou', armored in humble, oil-boiled wickerwork and iron, I am trained to perform long-term expeditions and guerrila tactics on any soil.</span>")
		if("Dustrider") //Special roll. Light armor + Chainmail. Loses shield and money for a bow and arrows. Literally mongolian. 10% of Wokou Population
			armor = /obj/item/clothing/suit/roguetown/armor/leather/hide/abyssal
			shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/iron/tatami
			head = /obj/item/clothing/head/roguetown/helmet/leather/malgai/duulga
			backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/hankyu
			backl = /obj/item/storage/backpack/rogue/satchel
			beltr = /obj/item/quiver/arrows
			H.mind.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
			to_chat(H, "<span class='info'>Hailing from the arid heart of the island, I am a 'Dustwalker'. I left my horse behind to try my luck among the sailing allies, but my trusted bow remains with me.</span>")
		if("Muqian") // Medium Roll. 30% of Wokou Population
			armor = /obj/item/clothing/suit/roguetown/armor/plate/mirror/iron
			head = /obj/item/clothing/head/roguetown/helmet/skullcap/hachigane
			to_chat(H, "<span class='info'>I am a Muqian(WIP)... </span>")
		if("Independent") //below average roll. 20% of Wokou Population
			shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
			neck = /obj/item/clothing/neck/roguetown/chaincoif/iron/kusari_zukin
			to_chat(H, "<span class='info'>I am a independent Freebooter, and I engage in authorized warfare against countries hostile to us, and breaking down their supply lines is glorious. But I'm taking a vacation on Enigma, but if I see any Mainlander... </span>")
		if("Corsair") // Special Roll. 10% of Wokou Population
			armor = /obj/item/clothing/suit/roguetown/armor/plate/mirror/iron
			shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/iron
			pants = /obj/item/clothing/under/roguetown/kaizoku/haidate_tatami
			to_chat(H, "<span class='info'>I am a corsair(WIP)... </span>")


	switch(weapontype) // We get +1 weapon skill in either axes/maces, swords, or flails depending on our starting weapon
		if("Axe")
			beltl = /obj/item/rogueweapon/woodcut
			H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 1, TRUE)
		if("Mace")
			beltl = /obj/item/rogueweapon/mace
			H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 1, TRUE)
		if("Messer")
			beltl = /obj/item/rogueweapon/sword/iron/messer
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		if("Sword")
			beltl = /obj/item/rogueweapon/sword/iron
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		if("Flail") // Big roller gets one of the best weapons to pair with a shield, even if it is only iron tier. Lucky bastard
			beltl = /obj/item/rogueweapon/flail
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)

	if(prob(66))
		neck = /obj/item/clothing/neck/roguetown/gorget
		head = /obj/item/clothing/head/roguetown/helmet/skullcap
	else // High roller gets steel chain coif
		neck = /obj/item/clothing/neck/roguetown/chaincoif

	H.change_stat("strength", 2)
	H.change_stat("endurance", 1)
	H.change_stat("constitution", 1)
	H.change_stat("intelligence", -1) // Muscle brains
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC) // MEDIUM armor training only, this is not a rare drifter, they shouldn't have more armor training than a garrison guard


	if(prob(25))
		armor = /obj/item/clothing/suit/roguetown/armor/kaizoku/plate/cuirass/iron
		pants = /obj/item/clothing/under/roguetown/kaizoku/haidate_tatami
		shirt = /obj/item/clothing/suit/roguetown/shirt/kaizoku/looseshirt
		
	else if(prob(50))
		armor = /obj/item/clothing/suit/roguetown/armor/kaizoku/chainmail/kikko
		shirt = /obj/item/clothing/suit/roguetown/armor/kaizoku/chainmail/itatami
		pants = /obj/item/clothing/under/roguetown/kaizoku/tobi/hakama
	else
		armor = /obj/item/clothing/suit/roguetown/armor/kaizoku/chainmail
		pants = /obj/item/clothing/under/roguetown/kaizoku/tobi/fur
		shirt = /obj/item/clothing/suit/roguetown/shirt/kaizoku/looseshirt
	if(prob(33))
		beltl = /obj/item/rogueweapon/sword/iron/jian
	else if(prob(50))
		beltl = /obj/item/rogueweapon/sword/iron/messer/dao
	else
		beltl = /obj/item/rogueweapon/flail/kusarigama
	if(prob(66))
		neck = /obj/item/clothing/neck/roguetown/chaincoif
		mask = /obj/item/clothing/mask/rogue/kaizoku/menpo
	else
		head = /obj/item/clothing/head/roguetown/kaizoku/helmet
		mask = /obj/item/clothing/mask/rogue/kaizoku/menpo/half
