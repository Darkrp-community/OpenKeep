//Balance>
//Pros: Good stats (8 points), Sword skill specialization unless RnG says otherwise, Medium armor perk, Steel weapons and sidearm variation (the latter is important; Daisho must remain.)
//Cons: No chest or head armor, no heavy armor perk. Their specialization counteracts by not being generalistic on their stats.
//Hopefully players will take advantage of the POSSIBLE '4' swordskill to duel on the streets, otherwise its bad rp (irony) 
// >>>This is the role for PROPER Akira Kurosawa EXPERIENCE.<<<

/datum/advclass/combat/abyssariad/ronin
	name = "Ronin"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
	"Kitsune",
	"Tengu",
	"Oni")
	outfit = /datum/outfit/job/roguetown/adventurer/abyssariad/ronin
	category_tags = list(CTAG_ADVENTURER)
	tutorial = "A person of the waves, the one who drifters as the ocean. These are zamurais with no masters and severed the link with their clan and warlords, usually for breaking the code of Abyssal Tide in shameful display. They are know for acting as highwaymen, operating gambling rings and protection rackets. Others attempts to recover their former honor under the Abyssal Tide once more, in search of redemption."

/datum/outfit/job/roguetown/adventurer/abyssariad/ronin/pre_equip(mob/living/carbon/human/H)
	..()
	belt = /obj/item/storage/belt/rogue/kaizoku/leather/daisho
	pants = /obj/item/clothing/under/roguetown/chainlegs/iron/haidate_tatami
	shoes = /obj/item/clothing/shoes/roguetown/kaizoku/boots/armor/kusaritabi
	cloak = /obj/item/clothing/suit/roguetown/shirt/kaizoku/kamishimo/ronin
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather
	neck = /obj/item/clothing/mask/rogue/kaizoku/menpo/half
	gloves = /obj/item/clothing/gloves/roguetown/fingerless
	backl = /obj/item/storage/backpack/rogue/satchel
	head = /obj/item/clothing/head/roguetown/tengai/roningasa //most important piece of equipment, no doubt.

	if(prob(35))
		beltr = /obj/item/rogueweapon/sword/short/wakizashi //Higher Daisho
	else
		beltr = /obj/item/rogueweapon/huntingknife/idagger/steel/tanto //Lesser Daisho

	var/background = pickweight(list("FullDaisho_Ronin" = 6, "SavageKiller_Ronin" = 3, "AntiDaisho_Ronin" = 2, "Reformed_Ronin" = 1))
	switch(background)
		if("FullDaisho_Ronin")
			beltl = /obj/item/rogueweapon/sword/uchigatana
			to_chat(H, "<span class='info'>I managed to retain my full Daisho, even without masters to finance my activities.</span>")
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		if("Reformed_Ronin")
			beltl = /obj/item/rogueweapon/flail/sflail/kusarifundo
			to_chat(H, "<span class='info'>My sword was broken during battle, and from the blade, I made one anew. This is all what remains of my deceased master.</span>")
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
		if("SavageKiller_Ronin")
			beltr = /obj/item/rogueweapon/battle/ono
			to_chat(H, "<span class='info'>I killed a sanguinary savage and took from him his axe, and grinded the steel into a more efficient Ono. I've conquered a WHALER's soul, and will DOMINATE HIS WAYS.</span>")
			H.mind.adjust_skillrank(/datum/skill/combat/axesmaces, 3, TRUE)
		if("AntiDaisho_Ronin")
			beltr = /obj/item/rogueweapon/sword/sabre/messer/yuntoudao
			to_chat(H, "<span class='info'>The Daisho is obsolete. My sword is made to do more than draw blood - It should grind my enemies into mince.</span>")
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)

	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE) //necessity for all abyssariads.
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE) //You were a Zamurai in the past. You know how to read - and you just don't get 'art' because that's not a thing yet.
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)

	// Same as Warriors.
	H.change_stat("strength", 2)
	H.change_stat("endurance", 1)
	H.change_stat("constitution", 1)
	H.change_stat("intelligence", -1)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)