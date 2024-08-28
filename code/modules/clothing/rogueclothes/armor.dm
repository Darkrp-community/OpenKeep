
/obj/item/clothing/proc/step_action() //this was made to rewrite clown shoes squeaking
	SEND_SIGNAL(src, COMSIG_CLOTHING_STEP_ACTION)

/obj/item/clothing/suit/roguetown/armor
	slot_flags = ITEM_SLOT_ARMOR
	body_parts_covered = CHEST
	icon = 'icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/armor.dmi'
	equip_sound = 'sound/blank.ogg'
	drop_sound = 'sound/blank.ogg'
	pickup_sound =  'sound/blank.ogg'
	sleeved = 'icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	sleevetype = "shirt"
	edelay_type = 1
	equip_delay_self = 25
	bloody_icon_state = "bodyblood"
	boobed = TRUE
	resistance_flags = FIRE_PROOF
	blocksound = PLATEHIT
	sellprice = 1
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/breaksound.ogg'
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	experimental_onhip = TRUE
	nodismemsleeves = TRUE
	var/picked
	var/colorable_var = FALSE

/obj/item/clothing/suit/roguetown/armor/chainmail
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	name = "haubergeon"
	desc = "A maille shirt made out of interlocked steel rings. Offers superior resistance against arrows, stabs and cuts. \nUsually worn as padding for proper armor, it still is as serviceable as a hauberk."
	body_parts_covered = CHEST|GROIN|ARMS|VITALS
	icon_state = "haubergeon"
	armor = list("melee" = 80, "bullet" = 90, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_STAB) // Chainmail is meant to stop cuts, stabs and arrows, not blunt
	blocksound = CHAINHIT
	var/do_sound = FALSE
	drop_sound = 'sound/foley/dropsound/chain_drop.ogg'
	anvilrepair = /datum/skill/craft/armorsmithing
	armor_class = ARMOR_CLASS_MEDIUM
	smeltresult = /obj/item/ingot/steel
	sellprice = 30

/obj/item/clothing/suit/roguetown/armor/chainmail/Initialize()
	. = ..()
	if(do_sound)
		AddComponent(/datum/component/squeak, list('sound/foley/footsteps/armor/chain (1).ogg',\
													'sound/foley/footsteps/armor/chain (2).ogg',\
													'sound/foley/footsteps/armor/chain (3).ogg'), 100)

/obj/item/clothing/suit/roguetown/armor/chainmail/iron
	icon_state = "ichainmail"
	name = "chainmaille"
	desc = "A light chain vest made of iron rings. Offers good protection against arrows, stabs and cuts."
	body_parts_covered = CHEST|GROIN|VITALS
	armor = list("melee" = 60, "bullet" = 80, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_LIGHT
	smeltresult = /obj/item/ingot/iron
	anvilrepair = /datum/skill/craft/armorsmithing
	sellprice = 20

/obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	name = "hauberk"
	desc = "A full body maille suit made of interlocked steel rings. Offers superior resistance against arrows, stabs and cuts throughout all of the body."
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS
	icon_state = "hauberk"
	item_state = "hauberk"
	armor = list("melee" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	anvilrepair = /datum/skill/craft/armorsmithing
	do_sound = TRUE
	smeltresult = /obj/item/ingot/steel
	armor_class = ARMOR_CLASS_MEDIUM
	sellprice = 60

/obj/item/clothing/suit/roguetown/armor/chainmail/chainkini
	name = "amazon mail"
	desc = "A combination of leather hides and chainmail armor, typically worn by warrior women of the isle of Issa."
	icon_state = "chainkini"
	item_state = "chainkini"
	allowed_sex = list(FEMALE)
	allowed_race = ALL_RACES_LIST
	body_parts_covered = CHEST|GROIN
	armor = list("melee" = 100, "bullet" = 15, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	anvilrepair = /datum/skill/craft/armorsmithing
	armor_class = ARMOR_CLASS_LIGHT
	smeltresult = /obj/item/ingot/iron
	sellprice = 50

/obj/item/clothing/suit/roguetown/armor/plate
	slot_flags = ITEM_SLOT_ARMOR
	name = "steel half-plate armor"
	desc = "\'Adventurer-fit\' plate armor with pauldrons."
	body_parts_covered = CHEST|GROIN|VITALS
	icon_state = "halfplate"
	item_state = "halfplate"
	armor = list("melee" = 80, "bullet" = 80, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	nodismemsleeves = TRUE
	max_integrity = 500
	allowed_sex = list(MALE, FEMALE)
	var/do_sound = TRUE
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	equip_delay_self = 40
	armor_class = ARMOR_CLASS_MEDIUM
	sellprice = 90

/obj/item/clothing/suit/roguetown/armor/plate/Initialize()
	. = ..()
	if(do_sound)
		AddComponent(/datum/component/squeak, list('sound/foley/footsteps/armor/plate (1).ogg',\
													'sound/foley/footsteps/armor/plate (2).ogg',\
													'sound/foley/footsteps/armor/plate (3).ogg'), 100)

/obj/item/clothing/suit/roguetown/armor/plate/rust
	name = "rusted half-plate armor"
	desc = "Old and rusted half-plate. Less durable than it used to be, but still quite protective."
	icon_state = "rustplate"
	item_state = "rustplate"
	max_integrity = 250
	smeltresult = /obj/item/ingot/iron
	sellprice = 40

/obj/item/clothing/suit/roguetown/armor/plate/half
	slot_flags = ITEM_SLOT_ARMOR
	name = "steel cuirass"
	desc = "A cuirass of steel. Lightweight and highly durable."
	body_parts_covered = CHEST|VITALS
	icon_state = "cuirass"
	item_state = "cuirass"
	armor = list("melee" = 100, "bullet" = 80, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	allowed_race = ALL_RACES_LIST
	nodismemsleeves = TRUE
	do_sound = FALSE
	blocking_behavior = null
	max_integrity = 300
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	armor_class = ARMOR_CLASS_MEDIUM
	sellprice = 40

/obj/item/clothing/suit/roguetown/armor/plate/full
	name = "plate armor"
	desc = "Full plate. Leg protecting tassets, groin cup, armored vambraces."
	icon_state = "plate"
	armor = list("melee" = 100, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST|GROIN|VITALS|LEGS|ARMS
	equip_delay_self = 80
	armor_class = ARMOR_CLASS_HEAVY
	sellprice = 120

/obj/item/clothing/suit/roguetown/armor/plate/half/iron
	name = "iron breastplate"
	desc = "Solid iron to protect the torso."
	icon_state = "ibreastplate"
	max_integrity = 200
	armor = list("melee" = 80, "bullet" = 60, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	smeltresult = /obj/item/ingot/iron
	armor_class = ARMOR_CLASS_MEDIUM
	sellprice = 20

/obj/item/clothing/suit/roguetown/armor/plate/half/iron/rust
	name = "rusted half-plate armor"
	desc = "Old but still useful to keep sharp objects from your innards."
	icon_state = "rustplate"
	item_state = "rustplate"


// Bladesinger armor, unique
/obj/item/clothing/suit/roguetown/armor/plate/half/elven
	name = "elven guardian cuirass"
	desc = "A cuirass made of steel with a thin decorative gold plating. Lightweight and durable."
	color = COLOR_ASSEMBLY_GOLD
	armor = list("melee" = 100, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	sellprice = 200

/obj/item/clothing/suit/roguetown/armor/plate/scale
	slot_flags = ITEM_SLOT_ARMOR
	name = "scalemail"
	desc = "A scale shirt typically padded with various interlocked steel plates. Offers decent protection."
	body_parts_covered = CHEST|VITALS|GROIN|LEGS
	allowed_sex = list(MALE, FEMALE)
	icon_state = "lamellar"
	max_integrity = 200
	armor = list("melee" = 90, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	smeltresult = /obj/item/ingot/steel
	equip_delay_self = 40
	armor_class = ARMOR_CLASS_MEDIUM
	sellprice = 35

//full iron armor for robbers/warriors
/obj/item/clothing/suit/roguetown/armor/plate/scale/iron
	slot_flags = ITEM_SLOT_ARMOR
	name = "iron plate armor"
	desc = "A rough set of iron armor, complete with chainmail joints and pauldrons. A simple and cheap design to protect vital zones, but not the arms."
	body_parts_covered = CHEST|VITALS|GROIN|LEGS
	allowed_sex = list(MALE, FEMALE)
	icon_state = "ironplate"
	max_integrity = 350 // Three iron bars, extra durability
	armor = list("melee" = 60, "bullet" = 60, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	smeltresult = /obj/item/ingot/iron
	equip_delay_self = 40
	armor_class = ARMOR_CLASS_MEDIUM
	sellprice = 45

// Rare Heartfelt equipment
// THIS ONE IS OLD! Check the 'Kaizoku' part for the current, new ones.
/obj/item/clothing/suit/roguetown/armor/heartfelt/lord
	slot_flags = ITEM_SLOT_ARMOR
	name = "coat of armor"
	desc = "A lordly coat of armor of Heartfelt design. Masterfully crafted to protect important nobility."
	body_parts_covered = CHEST|GROIN|VITALS|LEGS|ARMS
	icon_state = "heartfelt"
	item_state = "heartfelt"
	armor = list("melee" = 100, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	allowed_sex = list(MALE)
	nodismemsleeves = TRUE
	blocking_behavior = null
	max_integrity = 150
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	armor_class = ARMOR_CLASS_MEDIUM
	sellprice = 200

/obj/item/clothing/suit/roguetown/armor/heartfelt/hand
	slot_flags = ITEM_SLOT_ARMOR
	name = "coat of armor"
	desc = "A coat of armor typicially worn by distinguished retainers of Heartfeltian nobles."
	body_parts_covered = CHEST|GROIN|VITALS|LEGS|ARMS
	icon_state = "heartfelt_hand"
	item_state = "heartfelt_hand"
	armor = list("melee" = 90, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	allowed_sex = list(MALE)
	nodismemsleeves = TRUE
	blocking_behavior = null
	max_integrity = 120
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	armor_class = ARMOR_CLASS_MEDIUM
	sellprice = 150

/obj/item/clothing/suit/roguetown/armor/brigandine
	slot_flags = ITEM_SLOT_ARMOR
	name = "brigandine"
	desc = "A coat with plates concealed inside an exterior fabric. Protects the user from melee impacts and also ranged attacks to an extent."
	icon_state = "brigandine"
	blocksound = SOFTHIT
	body_parts_covered = CHEST|GROIN|VITALS|ARMS
	armor = list("melee" = 90, "bullet" = 80, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = 500
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	allowed_sex = list(MALE, FEMALE)
	anvilrepair = /datum/skill/craft/armorsmithing
	equip_delay_self = 40
	armor_class = ARMOR_CLASS_HEAVY
	smeltresult = /obj/item/ingot/steel
	sellprice = 95

/obj/item/clothing/suit/roguetown/armor/brigandine/Initialize()
	. = ..()
	AddComponent(/datum/component/squeak, list('sound/foley/footsteps/armor/coatplates (1).ogg',\
												'sound/foley/footsteps/armor/coatplates (2).ogg',\
												'sound/foley/footsteps/armor/coatplates (3).ogg'), 100)

/obj/item/clothing/suit/roguetown/armor/brigandine/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/suit/roguetown/armor/brigandine/captain/Initialize()
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src

/obj/item/clothing/suit/roguetown/armor/brigandine/captain/lordcolor(primary,secondary)
	detail_tag = "_det"
	detail_color = primary
	update_icon()
	if(ismob(loc))
		var/mob/L = loc
		L.update_inv_cloak()

/obj/item/clothing/suit/roguetown/armor/brigandine/captain/Destroy()
	GLOB.lordcolor -= src
	return ..()

/obj/item/clothing/suit/roguetown/armor/brigandine/coatplates
	slot_flags = ITEM_SLOT_ARMOR
	name = "coat of plates"
	desc = "A Zybantine leather coat with steel scales woven with miniscule threads of adamantine, \
			ensuring the wearer an optimal defence with forgiving breathability and mobility."
	icon_state = "coat_of_plates"
	blocksound = PLATEHIT
	body_parts_covered = CHEST|GROIN|VITALS|ARMS
	armor = list("melee" = 90, "bullet" = 90, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	max_integrity = 500
	armor_class = ARMOR_CLASS_MEDIUM
	sellprice = 200

/obj/item/clothing/suit/roguetown/armor/armordress
	slot_flags = ITEM_SLOT_ARMOR
	name = "padded dress"
	desc = "A padded dress that is usually worn by the female nobility. Offers some protection against melee."
	body_parts_covered = CHEST|GROIN|LEGS|ARMS|VITALS
	icon_state = "armordress"
	armor = list("melee" = 30, "bullet" = 15, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT)
	blocksound = SOFTHIT
	resistance_flags = FLAMMABLE
	allowed_sex = list(FEMALE)
	allowed_race = list("human", "tiefling", "elf", "aasimar", "abyssariad")
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sewrepair = TRUE
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	armor_class = ARMOR_CLASS_LIGHT
	sellprice = 35

/obj/item/clothing/suit/roguetown/armor/armordress/alt
	icon_state = "armordressalt"

/obj/item/clothing/suit/roguetown/armor/gambeson
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	name = "gambeson"
	desc = "A full body suit made of various layers of interwoven cloth that is either worn as affordable armour on its own, or used as padding for metal armour. Slightly protects the wearer against cuts."
	icon_state = "gambeson"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS
	armor = list("melee" = 20, "bullet" = 10, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_TWIST)
	resistance_flags = FLAMMABLE
	blocksound = SOFTUNDERHIT
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sewrepair = TRUE
	r_sleeve_status = SLEEVE_NOMOD
	l_sleeve_status = SLEEVE_NOMOD
	armor_class = ARMOR_CLASS_LIGHT
	sellprice = 20

/obj/item/clothing/suit/roguetown/armor/gambeson/light
	name = "light gambeson"
	desc = "A barely padded gambeson, typically worn by the peasantry as cheap yet fashionable armor for the whole body."
	armor = list("melee" = 15, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = null // It won't help, like, at all.
	sellprice = 10

/obj/item/clothing/suit/roguetown/armor/gambeson/heavy
	name = "padded gambeson"
	desc = "A gambeson with additional padding layers, hardened to make it more durable. It still cannot compare to proper armor."
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST)
	armor = list("melee" = 30, "bullet" = 15, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	sellprice = 30

/obj/item/clothing/suit/roguetown/armor/gambeson/heavy/dark
	desc = "A gambeson with additional padding layers, hardened to make it more durable. It still cannot compare to proper armor. This one is black."
	color = "#383838"

/obj/item/clothing/suit/roguetown/armor/gambeson/lord
	name = "arming jacket"
	desc = "Similar to a gambeson, it is meant to be used under heavier armor."
	icon_state = "dgamb"
	allowed_sex = list(MALE)
	body_parts_covered = CHEST|ARMS|VITALS|GROIN
	allowed_race = list("human", "tiefling", "aasimar", "abyssariad")
	sellprice = 40

/obj/item/clothing/suit/roguetown/armor/leather
	slot_flags = ITEM_SLOT_ARMOR
	name = "leather armor"
	desc = "A light armor typically made out of boiled leather. Offers slight protection from most weapons."
	icon_state = "leather"
//	color = "#514339"
	body_parts_covered = CHEST|GROIN|VITALS
	allowed_sex = list(MALE, FEMALE)
	armor = list("melee" = 40, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST)
	blocksound = SOFTHIT
	resistance_flags = FLAMMABLE
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sewrepair = TRUE
	max_integrity = 200
	sellprice = 30
	armor_class = ARMOR_CLASS_LIGHT
	smeltresult = /obj/item/ash

/obj/item/clothing/suit/roguetown/armor/leather/hide
	name = "hide armor"
	desc = "A leather armor with additional internal padding of creecher fur. Offers slightly higher integrity and comfort."
	armor = list("melee" = 50, "bullet" = 25, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	icon_state = "hidearmor"
	max_integrity = 250
	armor_class = ARMOR_CLASS_LIGHT
	sellprice = 35

/obj/item/clothing/suit/roguetown/armor/leather/studded
	name = "studded leather armor"
	desc = "A leather armor reinforced with close-set rivets for additional protection without compromising mobility. The most protection you will ever get from leather and metal."
	icon_state = "studleather"
	item_state = "studleather"
	blocksound = SOFTHIT
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_CHOP)
	armor = list("melee" = 60, "bullet" = 30, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	nodismemsleeves = TRUE
	body_parts_covered = CHEST|GROIN|VITALS
	max_integrity = 300
	sellprice = 50
	armor_class = ARMOR_CLASS_LIGHT

/obj/item/clothing/suit/roguetown/armor/leather/vest
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	name = "leather vest"
	desc = "A leather vest with no sleeves, won't really protect much but it's at least padded enough to be an armor."
	icon_state = "vest"
	item_state = "vest"
	color = "#514339"
	armor = list("melee" = 30, "bullet" = 15, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT)
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	body_parts_covered = CHEST|VITALS
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sewrepair = TRUE
	sleevetype = null
	sleeved = null
	armor_class = ARMOR_CLASS_LIGHT
	color = "#584742"

/obj/item/clothing/suit/roguetown/armor/leather/vest/butcher
	name = "leather vest"
	icon_state = "leathervest"
	item_state = "leathervest"
	color = null

// Unique swashbuckler vest. Notice it doesn't cover arms.
/obj/item/clothing/suit/roguetown/armor/leather/vest/sailor
	name = "sea jacket"
	desc = "A sturdy jacket worn by daring seafarers. The leather it's made from has been tanned by the salt of Abyssor's seas."
	icon_state = "sailorvest"
	armor = list("melee" = 60, "bullet" = 30, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	color = null
	slot_flags = ITEM_SLOT_ARMOR
	sleeved = 'icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	sleevetype = "shirt"

/obj/item/clothing/suit/roguetown/armor/leather/vest/sailor/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/storage/concrete)
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		STR.max_combined_w_class = 2
		STR.max_w_class = WEIGHT_CLASS_NORMAL
		STR.max_items = 1

/obj/item/clothing/suit/roguetown/armor/leather/vest/sailor/dropped(mob/living/carbon/human/user)
	..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		var/list/things = STR.contents()
		for(var/obj/item/I in things)
			STR.remove_from_storage(I, get_turf(src))

/obj/item/clothing/suit/roguetown/armor/leather/vest/sailor/niteman
	name = "silk jacket"
	icon_state = "nightman"
	desc = "A silken jacket discretely padded with leather on the inside."
	body_parts_covered = CHEST|VITALS|LEGS
	sleeved = 'icons/roguetown/clothing/onmob/armor.dmi'
	allowed_sex = list(MALE)
	allowed_race = list("human", "tiefling", "aasimar", "abyssariad")
	sellprice = 60


/obj/item/clothing/suit/roguetown/armor/leather/vest/hand
	name = "Hand's vest"
	icon_state = "handcoat"
	desc = "A quality silken coat, discretely padded with leather on the inside to protect its affluent wearer."
	color = null
	body_parts_covered = CHEST|VITALS|LEGS
	allowed_sex = list(MALE, FEMALE)
	allowed_race = list("human", "tiefling", "dwarf", "elf", "aasimar", "abyssariad")
	sellprice = 60

/obj/item/clothing/suit/roguetown/armor/leather/vest/black
	color = "#3c3a38"

/obj/item/clothing/suit/roguetown/armor/workervest
	name = "striped tunic"
	desc = "A common tunic worn by just about anyone. Nothing special, but essential."
	icon_state = "workervest"
	armor = null
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	resistance_flags = FLAMMABLE
	body_parts_covered = CHEST|VITALS
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sewrepair = TRUE
	sleevetype = null
	sleeved = null
	nodismemsleeves = TRUE
	boobed = TRUE
	sellprice = 10

/obj/item/clothing/suit/roguetown/armor/workervest/Initialize()
	color = pick("#94b4b6", "#ba8f9e", "#bd978c", "#92bd8c", "#c7c981")
	..()

/obj/item/clothing/suit/roguetown/armor/silkcoat
	name = "silk coat"
	desc = "An expertly padded coat made from the finest silks. Long may live the nobility that dons it."
	icon_state = "bliaut"
	color = null
	armor = list("melee" = 40, "bullet" = 15, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_TWIST)
	resistance_flags = FLAMMABLE
	blocksound = SOFTHIT
	slot_flags = ITEM_SLOT_ARMOR
	blade_dulling = DULLING_BASHCHOP
	body_parts_covered = CHEST|LEGS|VITALS|GROIN
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sewrepair = TRUE
	sleeved = 'icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	sleevetype = "shirt"
	max_integrity = 200
	sellprice = 50
	armor_class = ARMOR_CLASS_LIGHT
	allowed_sex = list(FEMALE)
	allowed_race = ALL_RACES_LIST

/obj/item/clothing/suit/roguetown/armor/silkcoat/Initialize()
	color = pick(CLOTHING_PURPLE, null,CLOTHING_GREEN, CLOTHING_RED)
	..()

/obj/item/clothing/suit/roguetown/armor/plate/half/iron/orc
	name = "orc mail"
	icon_state = "marauder_armor"
	item_state = "marauder_armor"
	icon = 'icons/roguetown/clothing/armor.dmi'
	smeltresult = /obj/item/ingot/iron
	allowed_race = list("orc")
	armor = list("melee" = 70, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	armor_class = ARMOR_CLASS_MEDIUM
	max_integrity = 120
	sellprice = 10

obj/item/clothing/suit/roguetown/armor/chainmail/iron/orc
	name = "Orc Marauder Chain Vest"
	icon_state = "orc_chainvest"
	item_state = "orc_chainvest"
	icon = 'icons/roguetown/clothing/armor.dmi'
	smeltresult = /obj/item/ingot/iron
	allowed_race = list("orc")
	armor = list("melee" = 25, "bullet" = 50, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_STAB)
	armor_class = ARMOR_CLASS_MEDIUM
	blocksound = PLATEHIT
	max_integrity = 100
	sellprice = 10


/obj/item/clothing/suit/roguetown/armor/plate/half/grenzelhoft
	slot_flags = ITEM_SLOT_ARMOR
	name = "grenzelhoft cuirass"
	desc = "A basic cuirass built from black-steel. It's somewhat more durable and lightweight than regular steel."
	icon_state = "grenzelcuirass"
	item_state = "grenzelcuirass"
	sleeved = 'icons/roguetown/clothing/onmob/helpers/stonekeep_merc.dmi'
	boobed = TRUE
	max_integrity = 500


/obj/item/clothing/suit/roguetown/armor/rare
	icon = 'icons/roguetown/topadd/takyon/Racial_Armour.dmi'
	mob_overlay_icon = 'icons/roguetown/topadd/takyon/onmob_racial.dmi'
	sleeved = 'icons/roguetown/topadd/takyon/onmob_racial.dmi'
	sleevetype = null

/obj/item/clothing/suit/roguetown/armor/rare/elfplate
	slot_flags = ITEM_SLOT_ARMOR
	name = "dark elf plate"
	desc = "A fine suit of sleek, moulded dark elf metal. Its interlocking nature and light weight allow for increased maneuverability."
	body_parts_covered = CHEST|VITALS
	icon_state = "elfchest"
	item_state = "elfchest"
	allowed_race = list("elf", "half-elf", "dark elf")
	armor = list("melee" = 100, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	nodismemsleeves = TRUE
	max_integrity = 500
	var/do_sound = TRUE
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	equip_delay_self = 40
	armor_class = ARMOR_CLASS_MEDIUM // Elven craft

/obj/item/clothing/suit/roguetown/armor/rare/elfplate/Initialize()
	. = ..()
	if(do_sound)
		AddComponent(/datum/component/squeak, list('sound/foley/footsteps/armor/fullplate (1).ogg',\
													'sound/foley/footsteps/armor/fullplate (2).ogg',\
													'sound/foley/footsteps/armor/fullplate (3).ogg'), 100)

/obj/item/clothing/suit/roguetown/armor/rare/elfplate/welfplate
	name = "elvish plate"
	desc = "A suit of steel interwoven, through honed elven technique, with hardened bark plates."
	icon_state = "welfchest"
	item_state = "welfchest"

/obj/item/clothing/suit/roguetown/armor/rare/dwarfplate
	slot_flags = ITEM_SLOT_ARMOR
	name = "dwarvish plate"
	desc = "Plate armor made out of the sturdiest, finest dwarvish metal armor. It's as heavy and durable as it gets."
	body_parts_covered = CHEST|GROIN|ARMS|VITALS
	icon_state = "dwarfchest"
	item_state = "dwarfchest"
	allowed_race = list("dwarf")
	armor = list("melee" = 100, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	nodismemsleeves = TRUE
	max_integrity = 600
	var/do_sound = TRUE
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	equip_delay_self = 40
	armor_class = ARMOR_CLASS_HEAVY

/obj/item/clothing/suit/roguetown/armor/rare/dwarfplate/Initialize()
	. = ..()
	if(do_sound)
		AddComponent(/datum/component/squeak, list('sound/foley/footsteps/armor/fullplate (1).ogg',\
													'sound/foley/footsteps/armor/fullplate (2).ogg',\
													'sound/foley/footsteps/armor/fullplate (3).ogg'), 100)

/obj/item/clothing/suit/roguetown/armor/rare/grenzelplate
	slot_flags = ITEM_SLOT_ARMOR
	name = "grenzelhoftian plate regalia"
	desc = "Engraved on this masterwork of humen metallurgy lies \"Thrice Slain, Thrice Risen, Thrice Pronged\" alongside the symbol of The Forgotten God in its neck guard."
	body_parts_covered = CHEST|GROIN|ARMS|VITALS
	icon_state = "human_swordchest"
	item_state = "human_swordchest"
	allowed_race = list("human")
	armor = list("melee" = 100, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	nodismemsleeves = TRUE
	max_integrity = 600
	allowed_sex = list(MALE)
	var/do_sound = TRUE
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	equip_delay_self = 40
	armor_class = ARMOR_CLASS_HEAVY
	sellprice = 200

/obj/item/clothing/suit/roguetown/armor/rare/grenzelplate/Initialize()
	. = ..()
	if(do_sound)
		AddComponent(/datum/component/squeak, list('sound/foley/footsteps/armor/fullplate (1).ogg',\
													'sound/foley/footsteps/armor/fullplate (2).ogg',\
													'sound/foley/footsteps/armor/fullplate (3).ogg'), 100)

/obj/item/clothing/suit/roguetown/armor/rare/zybanplate
	slot_flags = ITEM_SLOT_ARMOR
	name = "zybantean kataphractoe scaleskin"
	desc = "Steel scales woven into armor with miniscule threads of adamantine, \
			ensuring the wearer optimal defence with forgiving breathability. \
			The sigil of the Zybantu Kataphractoe is embezzeled at the throat guard."
	body_parts_covered = CHEST|GROIN|ARMS|VITALS
	icon_state = "human_spearchest"
	item_state = "human_spearchest"
	allowed_race = list("human")
	armor = list("melee" = 100, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	nodismemsleeves = TRUE
	max_integrity = 500
	allowed_sex = list(MALE)
	var/do_sound = TRUE
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	equip_delay_self = 40
	armor_class = ARMOR_CLASS_HEAVY
	sellprice = 200

/obj/item/clothing/suit/roguetown/armor/rare/zybanplate/Initialize()
	. = ..()
	if(do_sound)
		AddComponent(/datum/component/squeak, list('sound/foley/footsteps/armor/fullplate (1).ogg',\
													'sound/foley/footsteps/armor/fullplate (2).ogg',\
													'sound/foley/footsteps/armor/fullplate (3).ogg'), 100)

// Aasimar hoplite armor, a very rare armor indeed
/obj/item/clothing/suit/roguetown/armor/rare/hoplite
	icon = 'icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/armor.dmi'
	slot_flags = ITEM_SLOT_ARMOR
	name = "ancient plate armor"
	desc = "A battered set of bronze plate armor. Intricate runes and carvings once adorned the pieces, but most have faded with age."
	body_parts_covered = CHEST|GROIN|VITALS|LEGS
	icon_state = "aasimarplate"
	item_state = "aasimarplate"
	allowed_race = list("aasimar")
	armor = list("melee" = 100, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	nodismemsleeves = TRUE
	max_integrity = 500
	var/do_sound = TRUE
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = null // No bronze ingots yet, unfortunately
	equip_delay_self = 40
	armor_class = ARMOR_CLASS_HEAVY
	sellprice = 300 // It has great value to historical collectors

/obj/item/clothing/suit/roguetown/armor/rare/hoplite/Initialize()
	. = ..()
	if(do_sound)
		AddComponent(/datum/component/squeak, list('sound/foley/footsteps/armor/fullplate (1).ogg',\
													'sound/foley/footsteps/armor/fullplate (2).ogg',\
													'sound/foley/footsteps/armor/fullplate (3).ogg'), 100)

///////////////////////////////////////////////////////////////////
// Part of Kaizoku project. Usage ONLY for Stonekeep/Warmonger,  //
// If the usage is desired, ask monochrome9090 for permission.   //
// Respect the artists's will, COMMISSION them instead.          //
// This is solely for SPRITES. The code is free for the taking.	 //
///////////////////////////////////////////////////////////////////

/obj/item/clothing/suit/roguetown/armor/leather/muneate
	name = "muneate"
	desc = "A simple leather chest protector for casual archers. Barely protective- almost useless."
	icon_state = "vest"
	item_state = "vest"
	color = "#514339"
	armor = list("melee" = 20, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT)
	blocksound = SOFTHIT
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	blade_dulling = DULLING_BASHCHOP
	body_parts_covered = CHEST
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	max_integrity = 100
	sewrepair = TRUE
	armor_class = ARMOR_CLASS_LIGHT
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL

/obj/item/clothing/suit/roguetown/armor/plate/nanbando
	name = "nanban-dou-sode"
	desc = "Abyssariad steel cuirass, refined and with additional sode for protection. Rare and prized by High-ranking zamurais, this design has been acquired from raided humen settlements."
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	icon_state = "nanbando"
	item_state = "nanbando"

/obj/item/clothing/suit/roguetown/armor/plate/half/nanbando
	name = "nanban-dou"
	desc = "The Abyssariad steel cuirass that only protects the chest. Relatively common among the ones from the Zamurai caste."
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	icon_state = "nanbandoc"
	item_state = "nanbandoc"

/obj/item/clothing/suit/roguetown/armor/plate/nanbando
	name = "nanban-do-gusoku"
	desc = "A complete set of abyssariad steel armor, refined and with additional auxiliary parts for protection."
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	icon_state = "nanbandofull"

/obj/item/clothing/suit/roguetown/armor/chainmail/tatami
	name = "steel karuta tatami"
	desc = "a foldable, lightweight armor for convenient motion and manufacturing ease. \
	It is made of rectangular steel plates sewn into chainmail and often used by Ashigarus."
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	icon_state = "laminartatami"

/obj/item/clothing/suit/roguetown/armor/chainmail/iron/tatami
	name = "iron karuta tatami"
	desc = "a foldable, lightweight armor for convenient motion and manufacturing ease. \
	It is made of lacquered iron squares sewn into a padded cloth or leather backing."
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	icon_state = "tatami"

/obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/kusari
	name = "kusari katabira"
	desc = "Or simply 'single-layer chainmail robe', this armor is made of riveted steel rings patched together with slim plates protecting elbows. The armor reaches down to the legs and arms."
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	icon_state = "kusari"
	item_state = "kusari"

/obj/item/clothing/suit/roguetown/armor/plate/mirror/iron
	name = "iron mirror armor"
	desc = "Polished iron plates defines the design of this armor with a metal disk at its center. It is designed to deflect incoming strikes, and have a gleaming presence on any battlefield. This is the armor design is used by the army of Fog Island together with a kusari katabira."
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	icon_state = "imirrorarmor"
	max_integrity = 200
	armor = list("melee" = 80, "bullet" = 60, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	smeltresult = /obj/item/ingot/iron
	armor_class = ARMOR_CLASS_MEDIUM
	sellprice = 20

/obj/item/clothing/suit/roguetown/armor/plate/mirror
	name = "steel mirror armor"
	icon_state = "mirrorarmor"
	desc = "Polished steel plates defines the design of this armor with a metal disk at its center. It is designed to deflect incoming strikes, and have a gleaming presence on any battlefield. This is the armor design is used by the army of Fog Island together with a kusari katabira."
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	icon_state = "mirrorarmor"

/obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi
	name = "o-yoroi"
	desc = "Heavy-duty lamellar armor, designed for protection and flexibility for esteemed high-ranking zamurais on horseback. \
	Most suitable for horse archers, this armor can be found on those fighting on land."
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	icon_state = "oyoroi"

/obj/item/clothing/suit/roguetown/armor/plate/half/sanmaido
	name = "san mai-do"
	desc = "A cheap cuirass with three main plates riveted together with cloth. Flexible and dynamic, \
	it is integral for many poor footsoldiers, usually conscripted from isolated abyssariad villages or raiders."
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	icon_state = "sanmaido"

/obj/item/clothing/suit/roguetown/armor/leather/abyssal
	name = "leather lamellar armor"
	desc = "Also know as 'Tiejia', this islander leather armor features small rectangular leather plates laced together to cover vital organs."
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	icon_state = "tiejia"

/obj/item/clothing/suit/roguetown/armor/leather/hide/abyssal
	name = "leather cavalry armor"
	desc = "The Khatag Teghelgah designed to be used by abyssariad light cavalry and horse archers, specifically so they can remain light while showering the enemies of arrows before feinting withdrawal. Usually made of Horse leather and fur."
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	icon_state = "arisan_khuyag"

/obj/item/clothing/suit/roguetown/armor/leather/studded/kikko
	name = "kikko jacket"
	desc = "A cheaper and lighter version of Kikko Tatami, a leather jacket with small metal hexagon plates that has been sew on the material, in a turtle-like pattern."
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	icon_state = "kikko"
	colorable_var = TRUE

/obj/item/clothing/suit/roguetown/armor/leather/studded/kikko/AdjustClothes(mob/user)
	if(loc == user)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			if(toggle_icon_state)
				icon_state = "[initial(icon_state)]_open"
			flags_inv = null
			body_parts_covered = CHEST
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_armor()
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_armor()

/obj/item/clothing/suit/roguetown/armor/leather/hide/shozoku
	name = "shozoku"
	desc = "The main garment used by Ninjas and Kunoichis to blend into the night. Not viable during daylight, but it is easy to store anywhere."
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	icon_state = "shinobi"
	item_state = "shinobi"
	blocksound = SOFTHIT

/obj/item/clothing/suit/roguetown/armor/rattan //New armor; Iron-tier, chainmail-like, non-shirt wearable armor, but can be made in pairs. Looks fancier than the IRL version.
	slot_flags = ITEM_SLOT_ARMOR
	name = "rattan armor"
	desc = "A flexible and durable full body coat made from oil-boiled rattan and layered iron wires. This armor is used by LinYou Raiders for long-term expeditions, where self-reliance on repairs was necessary, but in overall, it is slighty worse than most iron armors."
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	icon_state = "rattan"
	item_state = "rattan"
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS
	armor = list("melee" = 70, "bullet" = 70, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_STAB)
	blocksound = CHAINHIT
	var/do_sound = FALSE
	anvilrepair = /datum/skill/craft/armorsmithing
	armor_class = ARMOR_CLASS_MEDIUM
	smeltresult = /obj/item/ash
	sellprice = 30
	sewrepair = TRUE

/obj/item/clothing/suit/roguetown/armor/kaizoku/haori
	name = "haori"
	desc = "a traditional jacket meant to be worn over a kimono."
	icon_state = "haori"
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	armor = null
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	body_parts_covered = CHEST|VITALS
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sewrepair = TRUE
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	nodismemsleeves = TRUE
	boobed = TRUE
	colorable_var = TRUE

/obj/item/clothing/suit/roguetown/armor/kaizoku/ceramic
	name = "marauder heavy armor"
	desc = "The heavy armor used by the tribalistic Kappa marauder forces under the flag of Abyssariads from the Flag Islands. Made of ceramic-like material from lava forges."
	icon_state = "marauder_chest"
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_STAB)
	blade_dulling = DULLING_BASHCHOP
	body_parts_covered = CHEST|VITALS|ARMS|GROIN
	smeltresult = /obj/item/ingot/steel
	armor = list("melee" = 100, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	allowed_race = ALL_RACES_LIST
	nodismemsleeves = TRUE
	blocking_behavior = null
	max_integrity = 300
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	equip_delay_self = 40
	armor_class = ARMOR_CLASS_HEAVY
	anvilrepair = /datum/skill/craft/armorsmithing

/obj/item/clothing/suit/roguetown/armor/kaizoku/ceramic/light
	name = "bone coverings"
	desc = "nothing but an simple armor of animal bones, thin enough to be weared equally as a shirt. Not very protective."
	armor = list("melee" = 50, "bullet" = 40, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	icon_state = "ivory_coverings"
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	armor = null
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	body_parts_covered = CHEST|GROIN
	max_integrity = 200
	prevent_crits = list(BCLASS_STAB, BCLASS_BLUNT)
	armor_class = ARMOR_CLASS_LIGHT
	smeltresult = null

/obj/item/clothing/suit/roguetown/armor/kaizoku/ceramic/medium
	name = "tribal coverings"
	desc = "A more well-designed armor made with sturdy animal bones. Suitable for hedonistic tribals."
	icon_state = "nacre_covering"
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	armor = null
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	body_parts_covered = CHEST|GROIN|VITALS|ARMS
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_STAB)
	armor_class = ARMOR_CLASS_MEDIUM
	max_integrity = 200

//New Rare Heartfelt equipment

/obj/item/clothing/suit/roguetown/armor/heartfelt/lord/kaizoku //Improved this armor slightly since, compared to other rare adventurer roles + normal adventurers, the previous Heartfelt Lord was abnoxiously bad.
	slot_flags = ITEM_SLOT_ARMOR
	name = "heartfelt kikko gusoku"
	desc = "A lordly body armor of Heartfelt design, based on Abyssariad armor techniques to further protect the nobility."
	body_parts_covered = CHEST|GROIN|VITALS|LEGS|ARMS
	icon_state = "heartfelt_kikko"
	item_state = "heartfelt_kikko"
	armor = list("melee" = 100, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	allowed_sex = list(MALE, FEMALE)
	nodismemsleeves = TRUE
	blocking_behavior = null
	max_integrity = 200 //Integrity increased. Kikko Gusoku is ACTUALLY armor afterall.
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	armor_class = ARMOR_CLASS_MEDIUM
	sellprice = 200
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'

/obj/item/clothing/suit/roguetown/armor/heartfelt/hand/kaizoku
	slot_flags = ITEM_SLOT_ARMOR
	name = "coat of armor"
	desc = "A coat of armor typicially worn by distinguished retainers of Heartfeltian nobles, with layers of Steel Kikko inside."
	body_parts_covered = CHEST|GROIN|VITALS|LEGS|ARMS
	icon_state = "heartfelt_kikkocoat"
	item_state = "heartfelt_kikkocoat"
	armor = list("melee" = 90, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	allowed_sex = list(MALE, FEMALE)
	nodismemsleeves = TRUE
	blocking_behavior = null
	max_integrity = 150
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	armor_class = ARMOR_CLASS_MEDIUM
	sellprice = 150
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'

/obj/item/clothing/suit/roguetown/armor/heartfelt/hand/kaizoku/female
	slot_flags = ITEM_SLOT_ARMOR
	name = "dress of armor"
	desc = "A dress of armor typicially worn by distinguished retainers of Heartfeltian nobles, with with layers of Steel Kikko inside."
	icon_state = "heartfelt_kikkodress"
	item_state = "heartfelt_kikkodress"

/obj/item/clothing/suit/roguetown/armor/attack_right(mob/user)
	if(colorable_var == TRUE)
		if(picked)
			return
		var/the_time = world.time
		if(world.time > (the_time + 30 SECONDS))
			return
		var/colorone = input(user, "Your emotions spreads your will.","Abyssor allows you to flush emotions within the threads.") as null|anything in CLOTHING_COLOR_NAMES
		if(!colorone)
			return
		picked = TRUE
		color = clothing_color2hex(colorone)
		update_icon()
		if(ismob(loc))
			var/mob/L = loc
			L.update_inv_shirt()
			L.update_inv_armor()
		return
	else 
		return
