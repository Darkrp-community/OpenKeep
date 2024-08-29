// The Abyssariad BROADER version of "The Warrior" class.
// It's meant to be a RnG catch-many for the players that have gambling addiction and
// greater cultural juice. Otherwise they will take Ronin, Sohei or Marauder.
// Militaristic as it fit their theme. But not a member of the Zamurai caste.
/datum/advclass/combat/abyssariad/wokou
	name = "Wokou Warrior"
	tutorial = "The Wokou is a general term for abyssariad fighter and/or pirates, those who constantly causes annual invasions on coastline provinces worldwide. They have many specializations and many \
	receives government subsidy. However, their presence on Enigma has less boundaries to raiding as it usually would be."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
	"Kitsune",
	"Tengu",
	"Oni",
	"Kappa")
	outfit = /datum/outfit/job/roguetown/adventurer/abyssariad/wokou
	category_tags = list(CTAG_ADVENTURER)

/datum/outfit/job/roguetown/adventurer/abyssariad/wokou/pre_equip(mob/living/carbon/human/H) // Same as Warrior.
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

	shoes = /obj/item/clothing/shoes/roguetown/kaizoku/jikatabi
	gloves = /obj/item/clothing/gloves/roguetown/leather
	belt = /obj/item/storage/belt/rogue/kaizoku/leather/daisho
	shirt = /obj/item/clothing/suit/roguetown/shirt/kaizoku/looseshirt/random
	pants = /obj/item/clothing/under/roguetown/tobi/random
	var/specialization = pickweight(list("LinYou" = 2, "Dustriders" = 1, "Muqian" = 2, "Independent" = 3, "Kaizoku" = 1))
	switch(specialization)
		if("LinYou") //below average roll; 20% of Wokou Population
			armor = /obj/item/clothing/suit/roguetown/armor/rattan
			head = /obj/item/clothing/head/roguetown/helmet/skullcap/rattan
			backl = /obj/item/storage/backpack/rogue/satchel
			backr = /obj/item/rogueweapon/shield/rattan
			beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
			beltl = /obj/item/rogueweapon/woodcut/changfu
			H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 1, TRUE)
			to_chat(H, "<span class='info'>Hailing from the tropical edges, I am a 'LinYou', armored in humble, oil-boiled wickerwork and iron, I am trained to perform long-term expeditions and guerrila tactics on any soil.</span>")
		if("Dustrider") //Special roll. Light armor + Chainmail. Loses shield and money for a bow and arrows. Literally mongolian. 10% of Wokou Population
			armor = /obj/item/clothing/suit/roguetown/armor/leather/hide/dustwalker
			shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/iron/tatami
			head = /obj/item/clothing/head/roguetown/helmet/leather/malgai/duulga
			backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/hankyu
			backl = /obj/item/storage/backpack/rogue/satchel
			beltr = /obj/item/quiver/arrows
			beltl =/obj/item/rogueweapon/huntingknife/idagger/kunai //so they HAVE something to use in melee combat.
			H.mind.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
			to_chat(H, "<span class='info'>Hailing from the arid heart of the island, I am a 'Dustwalker'. I left my horse behind to try my luck among the sailing allies, but my trusted bow remains with me.</span>")
		if("Independent") // Medium Roll. 30% of Wokou Population. No satchel - start with a full menpo.
			armor = /obj/item/clothing/suit/roguetown/armor/plate/mirror/iron
			head = /obj/item/clothing/head/roguetown/helmet/skullcap/hachigane
			mask = /obj/item/clothing/mask/rogue/kaizoku/menpo
			beltl = /obj/item/rogueweapon/sword/iron/jian
			backr = /obj/item/rogueweapon/shield/rattan
			beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
			to_chat(H, "<span class='info'>I am a independent Freebooter that brought my own assets. However, I do not need to pay a fee to the Emperor's government. I choose if I pay taxes or not.</span>")
		if("Muqian") //below average roll. 20% of Wokou Population. Start full Kusari armor and a flail(kusari means chain). Muqians are mail bros all the way.
			shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/iron/tatami
			neck = /obj/item/clothing/neck/roguetown/chaincoif/iron/kusari_zukin
			shoes = /obj/item/clothing/shoes/roguetown/kaizoku/boots/armor/kusaritabi
			beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
			backr = /obj/item/rogueweapon/shield/rattan
			beltl = /obj/item/rogueweapon/flail/kusarigama
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
			to_chat(H, "<span class='info'>I am a Muqian, I hail from the towers of civilization - always ready and at present. May the dices of destiny enlight my ways and those who I conquer.</span>")
		if("Kaizoku") // Special Roll. "AYO THIS IS THE PROJECT NAME!!!" 10% of Wokou Population. Start with Steel Weapon - but uses weak light armor, but they have DRIP, and non-rattan shield, because from where they come from, has no Rattan.
			armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/kaizoku
			head = /obj/item/clothing/head/roguetown/helmet/leather/kaizoku
			beltl = /obj/item/rogueweapon/sword/sabre/messer/yuntoudao
			backr = /obj/item/rogueweapon/shield/wood
			beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
			to_chat(H, "<span class='info'>I am one with the destroyed Atoll and my life is on the seas. The major empire's supply lines shall crumble against my ways of warfare. May the Abyssal Emperor live FOREVER. </span>")
	// Same as Warriors.
	H.change_stat("strength", 2)
	H.change_stat("endurance", 1)
	H.change_stat("constitution", 1)
	H.change_stat("intelligence", -1)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)