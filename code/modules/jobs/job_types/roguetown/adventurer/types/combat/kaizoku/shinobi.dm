
/datum/advclass/combat/abyssariad/shinobi
	name = "Shinobi"
	tutorial = "The military or former monks convert agents of a Daimyo or a clan who operates in secrecy, using stealth, \
	disguise and deception as tool. Knowledged in poison, Shinobis steals battle plans and assassinates \
	important political figures. Differently of Imperial Assassins or Rogues, the Shinobis still have concepts \
	of loyalty to Abyssal Tide's honor."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Kitsune",
		"Tengu",
		"Oni",
		"Kappa"
	)
	outfit = /datum/outfit/job/roguetown/adventurer/abyssariad/shinobi
	category_tags = list(CTAG_ADVENTURER)
	pickprob = 100

/datum/outfit/job/roguetown/adventurer/abyssariad/shinobi/pre_equip(mob/living/carbon/human/H)
	..()
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 5)
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 5, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/stealing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/medicine, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/traps, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 4, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/engineering, 2, TRUE) //Shinobis produces bombs.

	if(H.dna?.species)
		if(H.dna.species?.id == "abyssariad")
			head = /obj/item/clothing/head/roguetown/shinobi_zukin
			pants = /obj/item/clothing/under/roguetown/kaizoku/shinobizubon
			shirt = /obj/item/clothing/suit/roguetown/shirt/kaizoku/looseshirt/shinobi
			gloves = /obj/item/clothing/gloves/roguetown/leather
				if(prob(30))
					gloves = /obj/item/clothing/gloves/roguetown/fingerless
			belt = /obj/item/storage/belt/rogue/kaizoku/leather/daisho/ninja
			armor = /obj/item/clothing/suit/roguetown/armor/leather/hide/shozoku
			backl = /obj/item/storage/backpack/rogue/satchel/ninja
			beltr = /obj/item/quiver/arrows
				if(prob(50))
					beltl = /obj/item/rogueweapon/huntingknife/idagger/steel/tanto
				else 
					beltl = /obj/item/rogueweapon/huntingknife/idagger/steel/kaiken
			backr = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/hankyu
			shoes = /obj/item/clothing/shoes/roguetown/kaizoku/jikatabi/shinobi
			neck = /obj/item/clothing/neck/roguetown/gorget
			wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
		else
//			to_chat(H, "<span class='warning'>Living in the Fog island's waterways, I've been trained and fed by the many Abyssariad monks. From their will, I am a branch of their skills.")
/*			var/TMNT = pickweight(list("Donatello" = 1, "Leonardo" = 1, "Michelangelo" = 1, "Raphael" = 1)) // is this a reference...?
			H.become_blind("TRAIT_GENERIC")
		
			switch(TMNT) //I'm fucking autistic
				if("Donatello") 
				shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/kusari
				neck = /obj/item/clothing/neck/roguetown/chaincoif/iron/kusari_zukin
				shoes = /obj/item/clothing/shoes/roguetown/kaizoku/boots/armor/kusaritabi
				beltl = /obj/item/rogueweapon/flail/kusarigama
				H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)

			if("Kaizoku(Navy)") // Special one. "AYO THIS IS THE PROJECT NAME!!!" Start with Steel Weapon - but uses weak light armor, but they have DRIP, and non-rattan shield, because from where they come from, has no Rattan.
				H.set_blindness(0)
				armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/kaizoku
				head = /obj/item/clothing/head/roguetown/helmet/leather/malgai/kaizoku
				beltl = /obj/item/rogueweapon/sword/sabre/messer/yuntoudao
				backr = /obj/item/rogueweapon/shield/wood
				beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
				H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
				to_chat(H, span_warning("<span class='info'>I am a son of Kaizoku and I am one with the destroyed Atoll, my life is on the seas. The major empire's supply lines shall crumble against my ways of warfare. May the Abyssal Emperor live FOREVER. </span>"))



	H.cure_blind("TRAIT_GENERIC")
*/

	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	H.change_stat("perception", 1)
	H.change_stat("speed", 3)
	H.change_stat("constitution", 1)