/obj/item/clothing/neck/roguetown
	name = "necklace"
	desc = ""
	icon = 'icons/roguetown/clothing/neck.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/neck.dmi'
	bloody_icon_state = "bodyblood"
	resistance_flags = FIRE_PROOF
	sewrepair = FALSE
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/iron

/obj/item/clothing/neck/roguetown/coif
	name = "leather coif"
	desc = "A simple coif made of boiled leather, not that good as armor itself but mostly useful as padding for proper helmets."
	icon_state = "coif"
	item_state = "coif"
	flags_inv = HIDEEARS|HIDEHAIR
	slot_flags = ITEM_SLOT_NECK|ITEM_SLOT_HEAD
	blocksound = SOFTHIT
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	body_parts_covered = NECK|HAIR|EARS|HEAD
	armor = list("melee" = 30, "bullet" = 15, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT)
	adjustable = CAN_CADJUST
	toggle_icon_state = TRUE
	max_integrity = 150
	sewrepair = TRUE
	anvilrepair = null
	resistance_flags = FLAMMABLE // Made of leather
	smeltresult = /obj/item/ash

/obj/item/clothing/neck/roguetown/coif/AdjustClothes(mob/user)
	if(loc == user)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			if(toggle_icon_state)
				icon_state = "[initial(icon_state)]_t"
			flags_inv = null
			body_parts_covered = NECK
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_neck()
				H.update_inv_head()
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			flags_inv = HIDEEARS|HIDEHAIR
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_neck()
					H.update_inv_head()



/obj/item/clothing/neck/roguetown/chaincoif
	name = "chain coif"
	desc = "A coif made of interwoven steel rings, made to protect against arrows and blades. \
			Generally used as padding, but serviceable enough on its own."
	icon_state = "chaincoif"
	item_state = "chaincoif"
	flags_inv = HIDEEARS|HIDEHAIR
	armor = list("melee" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_NECK|ITEM_SLOT_HEAD
	body_parts_covered = NECK|HAIR|EARS|HEAD
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_STAB) // Chainmail is meant to stop cuts, stabs and arrows, not blunt
	pickup_sound = 'sound/foley/equip/equip_armor_chain.ogg'
	drop_sound = 'sound/foley/dropsound/chain_drop.ogg'
	adjustable = CAN_CADJUST
	toggle_icon_state = TRUE
	blocksound = CHAINHIT
	smeltresult = null

/obj/item/clothing/neck/roguetown/chaincoif/AdjustClothes(mob/user)
	if(loc == user)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			if(toggle_icon_state)
				icon_state = "[initial(icon_state)]_t"
			flags_inv = null
			body_parts_covered = NECK
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_neck()
				H.update_inv_head()
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			flags_inv = HIDEEARS|HIDEHAIR
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_neck()
					H.update_inv_head()


/obj/item/clothing/neck/roguetown/chaincoif/iron
	icon_state = "ichaincoif"
	name = "iron chain coif"
	desc = "A chain coif made of interwoven iron rings. Affordable protection against arrows and blades, \
			but should be used as padding rather than relied upon as armor."
	armor = list("melee" = 60, "bullet" = 80, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	smeltresult = null

/obj/item/clothing/neck/roguetown/bevor
	name = "bevor"
	desc = "A piece of plate armor meant to protect the throat and neck of its wearer against decapitation, extending the protection of armor plates."
	icon_state = "bervor"
	flags_inv = HIDEFACIALHAIR
	armor = list("melee" = 100, "bullet" = 80, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	smeltresult = /obj/item/ingot/steel
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	max_integrity = 300
	slot_flags = ITEM_SLOT_NECK
	body_parts_covered = NECK|EARS|MOUTH|NOSE
	// Realistically, it should also prevent stab crits. But for balance purposes let's not powercreep chainmail coifs for that purpose.
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	blocksound = PLATEHIT

/obj/item/clothing/neck/roguetown/gorget
	name = "gorget"
	icon_state = "gorget"
	desc = "An affordable piece of iron armor meant to protect one's neck against chopping. \
			Fits comfortably beneath chest armor, despite its weight."
	flags_inv = HIDEFACIALHAIR
	armor = list("melee" = 80, "bullet" = 50, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = 150
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_NECK
	body_parts_covered = NECK
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	blocksound = PLATEHIT
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	smeltresult = /obj/item/ingot/iron

/obj/item/clothing/neck/roguetown/gorget/hoplite // Better than an iron gorget, not quite as good as a steel bervor
	name = "ancient gorget"
	desc = "A heavy collar of bronze alloy, meant to protect the neck."
	icon_state = "aasimarneck"
	item_state = "aasimarneck"
	armor = list("melee" = 90, "bullet" = 60, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = 250
	smeltresult = null // No bronze ingots yet

// PSYCROSSES

/obj/item/clothing/neck/roguetown/psycross
	name = "psycross"
	desc = "Let His name be naught but forgot'n."
	icon_state = "psycross_w"
	//dropshrink = 0.75
	slot_flags = ITEM_SLOT_NECK|ITEM_SLOT_HIP|ITEM_SLOT_WRISTS
	sellprice = 10
	experimental_onhip = TRUE

// SILVER PSYCROSS START

/obj/item/clothing/neck/roguetown/psycross/silver
	name = "silver psycross"
	desc = "Let His name be naught but forgot'n. Let the wicked undead burn at my touch."
	icon_state = "psycross_steel"
	resistance_flags = FIRE_PROOF
	sellprice = 50
	smeltresult = /obj/item/ingot/silver

/obj/item/clothing/neck/roguetown/psycross/silver/pickup(mob/user)
	. = ..()
	var/mob/living/carbon/human/H = user
	var/datum/antagonist/vampirelord/V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
	if(H.mind)
		if(H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			to_chat(H, "<span class='userdanger'>I can't pick up the silver, it is my BANE!</span>")
			H.Knockdown(20)
			H.adjustFireLoss(60)
			H.Paralyze(20)
			H.fire_act(1,5)
		if(V_lord)
			if(V_lord.vamplevel < 4 && !H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
				to_chat(H, "<span class='userdanger'>I can't pick up the silver, it is my BANE!</span>")
				H.Knockdown(10)
				H.Paralyze(10)

/obj/item/clothing/neck/roguetown/psycross/silver/mob_can_equip(mob/living/M, mob/living/equipper, slot, disable_warning = FALSE, bypass_equip_delay_self = FALSE)
	. = ..()
	var/mob/living/carbon/human/H = M
	var/datum/antagonist/vampirelord/V_lord = H.mind?.has_antag_datum(/datum/antagonist/vampirelord/)
	if(H.mind)
		if(H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			to_chat(H, "<span class='userdanger'>I can't pick up the silver, it is my BANE!</span>")
			H.Knockdown(20)
			H.adjustFireLoss(60)
			H.Paralyze(20)
			H.fire_act(1,5)
		if(V_lord)
			if(V_lord.vamplevel < 4 && !H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
				to_chat(H, "<span class='userdanger'>I can't pick up the silver, it is my BANE!</span>")
				H.Knockdown(10)
				H.Paralyze(10)

// PANTHEON SILVER PSYCROSSES START

/obj/item/clothing/neck/roguetown/psycross/silver/astrata 
	name = "amulet of Astrata"
	desc = "Blessed be everything the light of the sun touches, for it is protected by Her grace."
	icon_state = "astrata"
	resistance_flags = FIRE_PROOF

// Only non-refactored psycross because Noc likes vamps. Neeeerd!
/obj/item/clothing/neck/roguetown/psycross/noc
	name = "amulet of Noc"
	desc = "Diligence, study, pursuit of truth and wisdom. Let nothing deterr you from it."
	icon_state = "noc"
	resistance_flags = FIRE_PROOF

/obj/item/clothing/neck/roguetown/psycross/silver/dendor
	name = "amulet of Dendor"
	desc = "Nature is a body of which we are but its entrails."
	icon_state = "dendor"
	resistance_flags = FIRE_PROOF

/obj/item/clothing/neck/roguetown/psycross/silver/necra
	name = "amulet of Necra"
	desc = "Where, grave, thy victory? I triumph still while the Veiled Lady abides by me."
	icon_state = "necra"
	resistance_flags = FIRE_PROOF

/obj/item/clothing/neck/roguetown/psycross/silver/ravox
	name = "amulet of Ravox"
	desc = "Struggle. Challenge. And rise to struggle again. That is the sword of he who yet lives to fight again."
	icon_state = "ravox"
	resistance_flags = FIRE_PROOF

/obj/item/clothing/neck/roguetown/psycross/silver/eora
	name = "amulet of Eora"
	desc = "And I love thee because thou art love."
	icon_state = "eora"
	resistance_flags = FIRE_PROOF

/obj/item/clothing/neck/roguetown/psycross/silver/pestra
	name = "amulet of Pestra"
	desc = "A Pestran amulet depicting her fabled walking staff, encrusted in this trinket is a venomous serpent. Believed to ward off disease and lessen poisons to devoted worshippers of the wise hag."
	icon_state = "pestra"
	resistance_flags = FIRE_PROOF

/obj/item/clothing/neck/roguetown/psycross/g
	name = "golden psycross"
	desc = "Let His name be naught but forgot'n."
	icon_state = "psycross_c"
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	sellprice = 100
	smeltresult = /obj/item/ingot/gold

/obj/item/clothing/neck/roguetown/talkstone
	name = "talkstone"
	desc = "A bizarre, enchanted necklace. Allows you to bridge the gap between languages."
	icon_state = "talkstone"
	item_state = "talkstone"
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	sellprice = 98

/obj/item/clothing/neck/roguetown/horus
	name = "eye of horuz"
	desc = ""
	icon_state = "horus"
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	sellprice = 30

/obj/item/clothing/neck/roguetown/shalal
	name = "desert rider medal"
	desc = ""
	icon_state = "shalal"
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	sellprice = 15

/obj/item/clothing/neck/roguetown/feld
	name = "feldsher's collar"
	desc = "Fits snug."
	icon_state = "feldcollar"
	item_state = "feldcollar"
	sellprice = 15

/obj/item/clothing/neck/roguetown/phys
	name = "physicker's collar"
	desc = "Fits snug."
	icon_state = "surgcollar"
	item_state = "surgcollar"
	sellprice = 15

/obj/item/clothing/neck/roguetown/gorget/copper
	name = "copper gorget"
	icon_state = "copperneck"
	desc = "An antique and simple protection for the neck, used more as an accessory by the common folk. But poor protection is still better than nothing."
	armor = list("melee" = 50, "bullet" = 50, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = 100
	smeltresult = /obj/item/ingot/copper

/obj/item/clothing/neck/roguetown/mercmedal
	name = "mercenary medal"
	desc = "A medal commemorating one's diligent work under the MGE."
	icon_state = "shalal"
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_NECK|ITEM_SLOT_HIP|ITEM_SLOT_WRISTS
	sellprice = 15

/obj/item/clothing/neck/roguetown/mercmedal/zybatine
	name = "desert rider chain"
	desc = "A small, gilded neck-chain. The desert riders rose from humble beginnings as fight pit slaves. A tale now celebrated in their decorations."
	icon_state = "goldchain"

/obj/item/clothing/neck/roguetown/mercmedal/grenzelhoft
	name = "grenzelhoft gryphon of valor"
	desc = "The fearsome beast of the Black Empire's heraldry, cast in brass. These service awards have lost much of their value since mercenaries started receiving them."
	icon_state = "gryphon"

/obj/item/clothing/neck/roguetown/mercmedal/underdweller
	name = "underdweller compass"
	desc = "A non-functional compass carried by seasoned miners as keepsake. Greed will light the way."
	icon_state = "compass"

/obj/item/clothing/neck/roguetown/mercmedal/blackoak
	name = "black oak seedpouch"
	desc = "A dark acorn resting in a canvas pouch. May your final resting place be the one life you give back to this world."
	icon_state = "seedpouch"

/obj/item/clothing/neck/roguetown/mercmedal/steppesman
	name = "steppe effigy"
	desc = "This straw doll is claimed to be a representation of Astrata. In truth, a homage to the steppe's wild spirits of yore."
	icon_state = "effigy"

/obj/item/clothing/neck/roguetown/mercmedal/boltslinger
	name = "dogmanne medal"
	desc = "Proof of veterancy among the dread Dog-Men sharpshooters. Pilfered, and returned into circulation on the wearer's inevitable passing. Funeral rites are foreign to these scavenger hounds."
	icon_state = "dogmedal"

/obj/item/clothing/neck/roguetown/mercmedal/anthrax
	name = "petrified larvae charm"
	desc = "The husk of a desiccated beespider larva, passed down within the ranks of those whose names have been struck from dark elven history. The old tyranny's uprooting would be their last act of true valor."
	icon_state = "spider"
