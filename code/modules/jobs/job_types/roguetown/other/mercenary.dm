/datum/job/roguetown/mercenary
	title = "Mercenary"
	flag = GRAVEDIGGER
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 4
	spawn_positions = 4

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = list(
		"Humen",
		"Elf",
		"Half-Elf",
		"Dwarf",
		"Tiefling",
		"Dark Elf",
		"Aasimar"
	)
	tutorial = "<br>Blood stained hands, do you even see it when they line your palms with golden treasures?  <br><br>\
	You are a paid killer, redeemable only by fact that your loyalty can be bought,  \
	gold is the great hypocritical lubricant in life, founding empires, driving brothers to kill one another.  <br><br>\
	You care not. Another day, another mammon - your sponsor, the Merchant of the MGE guild should have work for you todae.<br>"
	display_order = JDO_MERCENARY
	bypass_lastclass = TRUE
	give_bank_account = 3
	min_pq = 0
	outfit = null
	outfit_female = null
	advclass_cat_rolls = list(CTAG_MERCENARY = 20)

/datum/job/roguetown/mercenary/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(L)
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

/datum/outfit/job/roguetown/mercenary // when turned to adventurerclass, tutorial was broken. This fixes that.
	var/tutorial = "<br>Another day, another mammon - your sponsor, the Merchant, representing the MGE guild, should have work for you todae, go find out.<br>"

/datum/outfit/job/roguetown/mercenary/post_equip(mob/living/carbon/human/H)
	..()
	to_chat(H, tutorial)

// terribly sinful but here temporary so can push ahead since extended testmerge purgatory 
/obj/item/reagent_containers/powder/spice
	name = "spice"
	desc = ""
	icon = 'icons/roguetown/items/produce.dmi'
	icon_state = "spice"
	item_state = "spice"
	possible_transfer_amounts = list()
	volume = 15
	list_reagents = list(/datum/reagent/druqks = 15)
	sellprice = 10

/area/rogue/indoors/soilsons
	name = "soilsons"
