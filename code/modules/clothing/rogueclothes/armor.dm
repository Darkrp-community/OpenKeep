
/obj/item/clothing/proc/step_action() //this was made to rewrite clown shoes squeaking
	SEND_SIGNAL(src, COMSIG_CLOTHING_STEP_ACTION)

/obj/item/clothing/suit/roguetown/armor
	slot_flags = ITEM_SLOT_ARMOR
	icon = 'icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	sleevetype = "shirt"
	bloody_icon_state = "bodyblood"
	boobed = TRUE
	edelay_type = 1
	equip_delay_self = 3 SECONDS
	unequip_delay_self = 2 SECONDS
	resistance_flags = FIRE_PROOF
	blocksound = PLATEHIT
	blade_dulling = DULLING_BASHCHOP
	nodismemsleeves = TRUE
	equip_sound = 'sound/foley/equip/equip_armor.ogg'
	drop_sound = 'sound/blank.ogg'
	pickup_sound =  'sound/blank.ogg'
	break_sound = 'sound/foley/breaksound.ogg'
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	experimental_onhip = TRUE // does this do anything on armor I wonder?
//	blocking_behavior		use to block gloves when armor includes them etc
	sellprice = VALUE_COMMON_GOODS
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST

/obj/item/clothing/suit/roguetown/armor/medium	// Template, not for use
	name = "Medium armor template"
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	armor_class = ARMOR_CLASS_MEDIUM
	body_parts_covered = CHEST|VITALS|GROIN|LEGS
	max_integrity = INTEGRITY_STANDARD



/*---------------\
|			 	 |
|  Light Armor	 |
|			 	 |
\---------------*/

/*-------------\
| Padded Armor |	- Cloth based
\-------------*/

//................ Gambesson ............... //
/obj/item/clothing/suit/roguetown/armor/gambeson
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	name = "gambeson"
	desc = "A full body suit made of various layers of interwoven cloth that is either worn as affordable armour on its own, or used as padding for metal armour. Slightly protects the wearer against cuts."
	icon_state = "gambeson"
	resistance_flags = FLAMMABLE
	blocksound = SOFTUNDERHIT
	blade_dulling = DULLING_BASHCHOP
	equip_sound = 'sound/foley/equip/cloak_equip.ogg'
	pickup_sound = 'sound/foley/equip/cloak_take_off.ogg'
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sewrepair = TRUE
//	nodismemsleeves = FALSE gambesson being ripped by hand to bandages makes no sense. OTOH it can go into shirt slot asnd its kinda fun so maybe?
	r_sleeve_status = SLEEVE_NOMOD
	l_sleeve_status = SLEEVE_NOMOD
	sellprice = VALUE_GAMBESSON

	armor_class = ARMOR_CLASS_LIGHT
	armor = ARMOR_GAMBESON
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS
	prevent_crits = list(BCLASS_CUT, BCLASS_TWIST)

/obj/item/clothing/suit/roguetown/armor/gambeson/light
	name = "light gambeson"
	desc = "A barely padded gambeson, typically worn by the peasantry as cheap yet fashionable armor for the whole body."
	sellprice = VALUE_LIGHT_GAMBESSON

	armor = ARMOR_GAMBESON_BAD
	prevent_crits = null // It won't help, like, at all.

/obj/item/clothing/suit/roguetown/armor/gambeson/heavy
	name = "padded gambeson"
	desc = "A gambeson with additional padding layers, hardened to make it more durable. It still cannot compare to proper armor."
	sellprice = VALUE_HEAVY_GAMBESSON

	armor = ARMOR_GAMBESON_GOOD
	prevent_crits = ALL_EXCEPT_CHOP_AND_STAB

/obj/item/clothing/suit/roguetown/armor/gambeson/heavy/dark
	desc = "A gambeson with additional padding layers, hardened to make it more durable. It still cannot compare to proper armor. This one is black."
	color = CLOTHING_BLACK_WARM


//................ Padded Dress ............... //
//obj/item/clothing/suit/roguetown/armor/gambeson/heavy/dress
/obj/item/clothing/suit/roguetown/armor/armordress // Should be refactored to heavy gambeson subtype its a dupe in practice
	name = "padded dress"
	desc = "A padded dress that is usually worn by the female nobility. Offers some protection against melee."
	icon_state = "armordress"
	resistance_flags = FLAMMABLE
	allowed_sex = list(FEMALE)
	allowed_race = list("human", "tiefling", "elf", "aasimar")
	blade_dulling = DULLING_BASHCHOP
	blocksound = SOFTHIT
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sewrepair = TRUE
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	sellprice = VALUE_PADDED_DRESS

	armor_class = ARMOR_CLASS_LIGHT
	armor = ARMOR_GAMBESON_GOOD
	body_parts_covered = CHEST|GROIN|LEGS|ARMS|VITALS
	prevent_crits = ALL_EXCEPT_CHOP_AND_STAB

/obj/item/clothing/suit/roguetown/armor/armordress/alt
	icon_state = "armordressalt"


//................ Arming Jacket ............... // 
/obj/item/clothing/suit/roguetown/armor/gambeson/lord
	name = "arming jacket"
	desc = "Similar to a gambeson, it is meant to be used under heavier armor."
	icon_state = "dgamb"
	allowed_sex = list(MALE)
	allowed_race = list("human", "tiefling", "aasimar")
	sellprice = VALUE_GAMBESSON+BONUS_VALUE_MODEST

	body_parts_covered = CHEST|ARMS|VITALS|GROIN


//................ Stalker Robe ............... //
/obj/item/clothing/suit/roguetown/armor/gambeson/shadowrobe
	name = "stalker robe"
	desc = "A robe-like gambeson of moth-eaten cloth and cheap purple dye. No self-respecting elf would be seen wearing this."
	allowed_race = list("elf", "dark elf")
	icon_state = "shadowrobe"


//................ Striped Tunic ............... // - Light gambesson type
//obj/item/clothing/suit/roguetown/armor/gambeson/light/striped
/obj/item/clothing/suit/roguetown/armor/workervest
	name = "striped tunic"
	desc = "A common tunic worn by just about anyone. Nothing special, but essential."
	icon_state = "workervest"
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	resistance_flags = FLAMMABLE
	equip_sound = 'sound/foley/equip/cloak_equip.ogg'
	pickup_sound = 'sound/foley/equip/cloak_take_off.ogg'
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sewrepair = TRUE
	sleevetype = null
	sleeved = null
	nodismemsleeves = TRUE
	boobed = TRUE
	sellprice = VALUE_COMMON_GOODS

	armor = ARMOR_GAMBESON_BAD
	body_parts_covered = CHEST|VITALS
	prevent_crits = null

/obj/item/clothing/suit/roguetown/armor/workervest/Initialize()
	color = pick(CLOTHING_SALMON, CLOTHING_PALE_BLUE, CLOTHING_PALE_ORANGE, CLOTHING_PALE_GREEN, CLOTHING_PALE_YELLOW)
	..()



/*--------------\
| Leather Armor |	- Medium-poor melee defense, poor arrow defense
\--------------*/

//................ Leather Armor ............... //
/obj/item/clothing/suit/roguetown/armor/leather
	name = "leather armor"
	desc = "A light armor typically made out of boiled leather. Offers slight protection from most weapons."
	icon_state = "leather"
	allowed_sex = list(MALE, FEMALE)
	resistance_flags = FLAMMABLE
	blade_dulling = DULLING_BASHCHOP
	blocksound = SOFTHIT
	equip_sound = 'sound/foley/equip/cloak_equip.ogg'
	pickup_sound = 'sound/foley/equip/cloak_take_off.ogg'
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sewrepair = TRUE
	smeltresult = /obj/item/ash
	sellprice = VALUE_LEATHER_ARMOR

	armor_class = ARMOR_CLASS_LIGHT
	armor = ARMOR_LEATHER
	body_parts_covered = CHEST|GROIN|VITALS
	prevent_crits = ALL_EXCEPT_CHOP_AND_STAB
	max_integrity = INTEGRITY_STANDARD

//................ Hide Armor ............... //
/obj/item/clothing/suit/roguetown/armor/leather/hide
	name = "hide armor"
	desc = "A leather armor with additional internal padding of creacher fur. Offers slightly higher integrity and comfort."
	icon_state = "hidearmor"
	sellprice = VALUE_LEATHER_ARMOR_FUR

	armor = ARMOR_LEATHER_GOOD

//................ Splint Mail ............... //
/obj/item/clothing/suit/roguetown/armor/leather/studded
	name = "splint mail"
	desc = "Leather armor reinforced with strips of metal riveted to the inside. Usually made from metal recycled from old breastplates or cooking utensils, coverage is partial at best."
	icon_state = "studleather"
	item_state = "studleather"
	sellprice = VALUE_LEATHER_ARMOR_PLUS

	armor = ARMOR_LEATHER_BEST
	prevent_crits = ALL_EXCEPT_STAB
	max_integrity = INTEGRITY_STRONG


//................ Leather Vest ............... //
/obj/item/clothing/suit/roguetown/armor/leather/vest
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	name = "leather vest"
	desc = "A leather vest with no sleeves, won't really protect much but it's at least padded enough to be an armor."
	icon_state = "vest"
	item_state = "vest"
	color = "#514339"
	blade_dulling = DULLING_BASHCHOP
	blocksound = SOFTHIT
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sewrepair = TRUE
	sleevetype = null
	sleeved = null

	armor = ARMOR_GAMBESON_GOOD
	body_parts_covered = CHEST|VITALS
	prevent_crits = CUT_AND_MINOR_CRITS

/obj/item/clothing/suit/roguetown/armor/leather/vest/random/Initialize()
	color = pick(CLOTHING_BLACK, CLOTHING_BROWN, CLOTHING_GREEN, CLOTHING_PALE_ORANGE)
	..()

//................ Butchers Vest ............... //
/obj/item/clothing/suit/roguetown/armor/leather/vest/butcher
	name = "leather vest"
	icon_state = "leathervest"
	item_state = "leathervest"
	color = CLOTHING_WHITE


//................ Sea Jacket ............... //
// Unique swashbuckler vest. Notice it doesn't cover arms. Should not be vest subtype, works very differently
//obj/item/clothing/suit/roguetown/armor/leather/jacket
/obj/item/clothing/suit/roguetown/armor/leather/vest/sailor
	slot_flags = ITEM_SLOT_ARMOR
	name = "sea jacket"
	desc = "A sturdy jacket worn by daring seafarers. The leather it's made from has been tanned by the salt of Abyssor's seas."
	icon_state = "sailorvest"
	color = CLOTHING_WHITE
	sleeved = 'icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	sleevetype = "shirt"

	armor = ARMOR_LEATHER_BEST
	body_parts_covered = CHEST|VITALS

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


//................ Silk Coat ............... //
//obj/item/clothing/suit/roguetown/armor/leather/jacket/silk_coat
/obj/item/clothing/suit/roguetown/armor/silkcoat
	name = "silk coat"
	desc = "An expertly padded coat made from the finest silks. Long may live the nobility that dons it."
	icon_state = "bliaut"
	color = null
	resistance_flags = FLAMMABLE
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	equip_sound = 'sound/foley/equip/cloak_equip.ogg'
	pickup_sound = 'sound/foley/equip/cloak_take_off.ogg'
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sewrepair = TRUE
	sleeved = 'icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	sleevetype = "shirt"
	allowed_sex = list(FEMALE)
	allowed_race = ALL_RACES_LIST
	sellprice = VALUE_LEATHER_ARMOR_LORD

	armor_class = ARMOR_CLASS_LIGHT
	armor = ARMOR_LEATHER
	body_parts_covered = CHEST|LEGS|VITALS|GROIN
	prevent_crits = CUT_AND_MINOR_CRITS
	max_integrity = INTEGRITY_STANDARD

/obj/item/clothing/suit/roguetown/armor/silkcoat/Initialize()
	color = pick(CLOTHING_PURPLE, CLOTHING_WHITE,CLOTHING_GREEN, CLOTHING_RED, CLOTHING_SALMON)
	..()


//................ Silk Jacket ............... //
/obj/item/clothing/suit/roguetown/armor/leather/vest/sailor/niteman
//obj/item/clothing/suit/roguetown/armor/leather/jacket/niteman
	name = "silk jacket"
	icon_state = "nightman"
	desc = "A silken jacket discretely padded with leather on the inside."
	sleeved = 'icons/roguetown/clothing/onmob/armor.dmi'
	allowed_race = list("human", "tiefling", "aasimar")
	sellprice = VALUE_LEATHER_ARMOR_LORD
	allowed_race = list("human", "tiefling","elf", "half-elf", "dark elf", "aasimar")
	sellprice = 60

	body_parts_covered = CHEST|VITALS|LEGS

//................ Hand´s Vest ............... // Is that really correct grammar?
//obj/item/clothing/suit/roguetown/armor/leather/jacket/hand
/obj/item/clothing/suit/roguetown/armor/leather/vest/hand
	name = "Hand's vest"
	icon_state = "handcoat"
	desc = "A quality silken coat, discretely padded with leather on the inside to protect its affluent wearer."
	color = CLOTHING_WHITE
	allowed_race = list("human", "tiefling", "dwarf", "elf", "aasimar")
	sellprice = VALUE_LEATHER_ARMOR_LORD

	body_parts_covered = CHEST|VITALS|LEGS // legs on a vest? hmm....


//................ Other Vests ............... //
/obj/item/clothing/suit/roguetown/armor/leather/vest/butler
	color = CLOTHING_RED

/obj/item/clothing/suit/roguetown/armor/leather/vest/butler/Initialize()
	..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src
/obj/item/clothing/suit/roguetown/armor/leather/vest/butler/Destroy()
	GLOB.lordcolor -= src
	return ..()

/obj/item/clothing/suit/roguetown/armor/leather/vest/black
	color = CLOTHING_BLACK_WARM


//................ Amazon chainkini ............... //	- made of iron, 100/15, a little peculiar
/obj/item/clothing/suit/roguetown/armor/chainmail/chainkini
	name = "amazon maille"
	desc = "A combination of leather hides and chainmail, typically worn by warrior women of the isle of Issa."
	icon_state = "chainkini"
	item_state = "chainkini"
	allowed_sex = list(FEMALE)
	allowed_race = ALL_RACES_LIST
	smeltresult = /obj/item/ingot/iron
	sellprice = VALUE_IRON_ARMOR_UNUSUAL

	armor_class = ARMOR_CLASS_LIGHT
	armor = list("melee" = 100, "bullet" = 15, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST|GROIN


//................ Maille ............... //
/obj/item/clothing/suit/roguetown/armor/chainmail/iron
	name = "chainmaille"
	desc = "A light chain vest made of iron rings. Offers good protection against arrows, stabs and cuts."
	icon_state = "ichainmail"
	smeltresult = /obj/item/ingot/iron
	sellprice = VALUE_IRON_ARMOR

	armor = list("melee" = 60, "bullet" = 80, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	armor_class = ARMOR_CLASS_LIGHT
	body_parts_covered = CHEST|GROIN|VITALS


//................ Copper Heart-protector ............... //
/obj/item/clothing/suit/roguetown/armor/cuirass/copperchest
	name = "copper heart protector"//SHITTY ARMOR SHITTY ARMOR!!
	desc = "Very simple and crude protection for the chest. Ancient fighters once used similar gear, with better quality..."
	icon_state = "copperchest"
	item_state = "copperchest"
	smeltresult = /obj/item/ingot/copper
	sellprice = VALUE_DIRT_CHEAP

	armor_class = ARMOR_CLASS_LIGHT
	armor = ARMOR_COPPER
	body_parts_covered = CHEST|VITALS
	prevent_crits = ONLY_VITAL_ORGANS
	max_integrity = INTEGRITY_POOR


/*---------------\
|			 	 |
|  Medium Armor	 |
|			 	 |
\---------------*/

//................ Haubergon ............... //	- means little hauberk
/obj/item/clothing/suit/roguetown/armor/chainmail
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	name = "haubergeon"
	desc = "A mail shirt made out of interlocked steel rings. Offers superior resistance against arrows, stabs and cuts. \nUsually worn as padding for proper armor, it still is as serviceable as a hauberk."
	icon_state = "haubergeon"
	blocksound = CHAINHIT
	drop_sound = 'sound/foley/dropsound/chain_drop.ogg'
	pickup_sound = 'sound/foley/equip/equip_armor_chain.ogg'
	equip_sound = 'sound/foley/equip/equip_armor_chain.ogg'
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	sellprice = VALUE_STEEL_ARMOR

	armor_class = ARMOR_CLASS_MEDIUM
	armor = ARMOR_MAILLE
	body_parts_covered = CHEST|GROIN|ARMS|VITALS
	prevent_crits = ALL_EXCEPT_BLUNT

/obj/item/clothing/suit/roguetown/armor/chainmail/Initialize()
	. = ..()
	AddComponent(/datum/component/squeak, list('sound/foley/footsteps/armor/chain (1).ogg',\
												'sound/foley/footsteps/armor/chain (2).ogg',\
												'sound/foley/footsteps/armor/chain (3).ogg'), 80)


//................ Hauberk ............... //
/obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	name = "hauberk"
	desc = "A full body maille suit made of interlocked steel rings. Offers superior resistance against arrows, stabs and cuts throughout all of the body."
	icon_state = "hauberk"
	item_state = "hauberk"
	sellprice = VALUE_STEEL_ARMOR_FINE

	armor = list("melee" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS


/*-----------------------\
|  Cuirass & Breastplate |
\-----------------------*/
// A cuirass is armor that covers both stomach and chest front as well as your back. A breastplate only covers your front torso. Make breastplates light and define with crit prevention, groin coverage, integrity, or not at all?
//................ Steel Cuirass ............... //	
/obj/item/clothing/suit/roguetown/armor/cuirass
	slot_flags = ITEM_SLOT_ARMOR
	name = "steel cuirass"
	desc = "A cuirass of steel. Lightweight and highly durable."
	icon_state = "cuirass"
	item_state = "cuirass"
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	sellprice = VALUE_STEEL_ARMOR

	armor_class = ARMOR_CLASS_MEDIUM
	armor = list("melee" = 80, "bullet" = 80, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST|VITALS|GROIN
	prevent_crits = ALL_EXCEPT_STAB
	max_integrity = INTEGRITY_STRONGEST

//................ Grenzelhoft Cuirass ............... //
/obj/item/clothing/suit/roguetown/armor/cuirass/grenzelhoft
	name = "grenzelhoft cuirass"
	desc = "A basic cuirass built from black-steel. It's somewhat more durable and lightweight than regular steel."
	icon_state = "grenzelcuirass"
	item_state = "grenzelcuirass"
	sleeved = 'icons/roguetown/clothing/onmob/helpers/stonekeep_merc.dmi'
	boobed = TRUE

	armor = list("melee" = 100, "bullet" = 80, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)


//................ Iron Breastplate ............... //	- A breastplate is a cuirass without its back plate
/obj/item/clothing/suit/roguetown/armor/cuirass/iron
	name = "iron breastplate"
	desc = "Solid iron to protect the torso."
	icon_state = "ibreastplate"
	item_state = "ibreastplate"
	smeltresult = /obj/item/ingot/iron
	sellprice = VALUE_IRON_ARMOR

	armor = list("melee" = 70, "bullet" = 50, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = INTEGRITY_STRONG

//................ Rusted Breastplate ............... //
/obj/item/clothing/suit/roguetown/armor/cuirass/iron/rust
	name = "rusted breastplate"
	desc = "Old but still useful to keep sharp objects from your innards."
	icon_state = "rusthalf"
	item_state = "rusthalf"
	sellprice = VALUE_IRON_ARMOR/2

	max_integrity = INTEGRITY_STANDARD

//................ Scourge Breastplate ............... //
/obj/item/clothing/suit/roguetown/armor/cuirass/iron/shadowplate
	name = "scourge breastplate"
	desc = "More form over function, this armor is fit for demonstration of might rather than open combat. The aged gilding slowly tarnishes away."
	icon_state = "shadowplate"
	item_state = "shadowplate"
	allowed_race = list("elf", "dark elf")


//................ Bladesinger Cuirass ............... //	- Should be a cuirass?
//obj/item/clothing/suit/roguetown/armor/plate/cuirass/elven
/obj/item/clothing/suit/roguetown/armor/plate/elven
	name = "elven guardian cuirass"
	desc = "A cuirass made of steel with a thin decorative gold plating. Lightweight and durable."
	color = COLOR_ASSEMBLY_GOLD
	equip_delay_self = 2 SECONDS
	unequip_delay_self = 2 SECONDS
	sellprice = VALUE_SNOWFLAKE_STEEL

	armor_class = ARMOR_CLASS_MEDIUM
	armor = list("melee" = 100, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)


//................ Scalemail ............... //
/obj/item/clothing/suit/roguetown/armor/plate/scale // important is how this item covers legs too compared to halfplate
	name = "scalemail"
	desc = "A scale shirt typically padded with various interlocked steel plates. Offers decent protection."
	icon_state = "lamellar"
	sellprice = VALUE_STEEL_ARMOR_FINE

	armor_class = ARMOR_CLASS_MEDIUM
	armor = list("melee" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST|VITALS|GROIN|LEGS
	prevent_crits = ALL_CRITICAL_HITS
	max_integrity = 500

//................ Iron Plate Armor ............... //	- A little weird name for medium and this armor value
/obj/item/clothing/suit/roguetown/armor/plate/scale/iron
	name = "iron plate armor"
	desc = "A rough set of iron armor, complete with chainmail joints and pauldrons. A simple and cheap design to protect vital zones, but not the arms."
	icon_state = "ironplate"
	smeltresult = /obj/item/ingot/iron
	sellprice = VALUE_IRON_ARMOR*2

	armor = list("melee" = 60, "bullet" = 60, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST|VITALS|GROIN|LEGS
	max_integrity = INTEGRITY_STRONG


//................ Coat of Armor ............... //
//obj/item/clothing/suit/roguetown/armor/medium/heartfelt_lord
/obj/item/clothing/suit/roguetown/armor/heartfelt/lord
	name = "coat of armor"
	desc = "A lordly coat of armor of Heartfelt design. Masterfully crafted to protect important nobility."
	icon_state = "heartfelt"
	item_state = "heartfelt"
	allowed_sex = list(MALE)
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	sellprice = VALUE_SNOWFLAKE_STEEL+BONUS_VALUE_SMALL

	armor_class = ARMOR_CLASS_MEDIUM
	armor = list("melee" = 100, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST|GROIN|VITALS|LEGS|ARMS
	max_integrity = INTEGRITY_STANDARD

//................ Coat of Armor ............... //
//obj/item/clothing/suit/roguetown/armor/medium/heartfelt_hand
/obj/item/clothing/suit/roguetown/armor/heartfelt/hand
	name = "coat of armor"
	desc = "A coat of armor typicially worn by distinguished retainers of Heartfeltian nobles."
	icon_state = "heartfelt_hand"
	item_state = "heartfelt_hand"
	allowed_sex = list(MALE)
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	sellprice = VALUE_SNOWFLAKE_STEEL

	armor_class = ARMOR_CLASS_MEDIUM
	armor = list("melee" = 90, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST|GROIN|VITALS|LEGS
	max_integrity = INTEGRITY_STANDARD



/*---------------\
|			 	 |
|  Heavy Armor	 |
|			 	 |
\---------------*/

//................ Half-plate Armor ............... //
/obj/item/clothing/suit/roguetown/armor/plate
	name = "steel half-plate armor"
	desc = "Plate armor with shoulder guards. An incomplete, bulky set of excellent armor."
	icon_state = "halfplate"
	item_state = "halfplate"
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	equip_delay_self = 4 SECONDS
	unequip_delay_self = 4 SECONDS
	equip_sound = 'sound/foley/equip/equip_armor_plate.ogg'
	sellprice = VALUE_STEEL_ARMOR

	armor_class = ARMOR_CLASS_HEAVY
	armor = list("melee" = 100, "bullet" = 80, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST|GROIN|VITALS
	prevent_crits = ALL_EXCEPT_STAB
	max_integrity = INTEGRITY_STRONGEST

/obj/item/clothing/suit/roguetown/armor/plate/Initialize()
	. = ..()
	AddComponent(/datum/component/squeak, list('sound/foley/footsteps/armor/plate (1).ogg',\
												'sound/foley/footsteps/armor/plate (2).ogg',\
												'sound/foley/footsteps/armor/plate (3).ogg'), 100)


//................ Full Plate Armor ............... //
/obj/item/clothing/suit/roguetown/armor/plate/full
	name = "plate armor"
	desc = "Full plate. Leg protecting tassets, groin cup, armored vambraces."
	icon_state = "plate"
	item_state = "plate"
	equip_delay_self = 8 SECONDS
	unequip_delay_self = 8 SECONDS
	sellprice = VALUE_FULL_PLATE

	armor_class = ARMOR_CLASS_HEAVY
	armor = list("melee" = 100, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST|GROIN|VITALS|LEGS|ARMS


//................ Rusted Half-plate ............... //
/obj/item/clothing/suit/roguetown/armor/plate/rust
	name = "rusted half-plate"
	desc = "Old and rusted plate armor. Less durable than it used to be, but still quite protective."
	icon_state = "rustplate"
	item_state = "rustplate"
	smeltresult = /obj/item/ingot/iron
	sellprice = VALUE_IRON_ARMOR/2

	max_integrity = INTEGRITY_STRONG


//................ Brigandine ............... //
/obj/item/clothing/suit/roguetown/armor/brigandine
	name = "brigandine"
	desc = "A coat with plates concealed inside an exterior fabric. Protects the user from melee impacts and also ranged attacks to an extent."
	icon_state = "brigandine"
	blocksound = SOFTHIT
	equip_delay_self = 4 SECONDS
	unequip_delay_self = 4 SECONDS
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	sellprice = VALUE_BRIGANDINE

	armor_class = ARMOR_CLASS_HEAVY
	armor = list("melee" = 90, "bullet" = 80, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST|GROIN|VITALS|ARMS
	max_integrity = INTEGRITY_STRONGEST
	prevent_crits = ALL_EXCEPT_STAB

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

//................ Coat of Plate ............... // 
/obj/item/clothing/suit/roguetown/armor/brigandine/coatplates	// Scalemail with Bonus 50& integrity, minus 10% arrow armor. Brigandine for the heraldry I think.
	name = "coat of plates"
	desc = "A Zybantine leather coat with steel scales woven with miniscule threads of adamantine, \
			ensuring the wearer an optimal defence with forgiving breathability and mobility."
	icon_state = "coat_of_plates"
	blocksound = PLATEHIT
	sellprice = VALUE_SNOWFLAKE_STEEL

	armor_class = ARMOR_CLASS_MEDIUM
	armor = list("melee" = 90, "bullet" = 90, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = INTEGRITY_STRONG
	prevent_crits = ALL_EXCEPT_STAB


//................ Snowflake Plate ............... //
/obj/item/clothing/suit/roguetown/armor/rare
	name = "Parent rare armor"
	desc = "You shouldn't be seeing this. Did you forget to add a description?"
	icon = 'icons/roguetown/topadd/takyon/Racial_Armour.dmi'
	mob_overlay_icon = 'icons/roguetown/topadd/takyon/onmob_racial.dmi'
	sleeved = 'icons/roguetown/topadd/takyon/onmob_racial.dmi'
	sleevetype = null
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	equip_delay_self = 4 SECONDS
	unequip_delay_self = 4 SECONDS
	sellprice = VALUE_SNOWFLAKE_STEEL

	armor_class = ARMOR_CLASS_HEAVY
	armor = ARMOR_STEEL_BEST
	body_parts_covered = CHEST|GROIN|ARMS|VITALS
	prevent_crits = ALL_EXCEPT_STAB
	max_integrity = INTEGRITY_STRONGEST

/obj/item/clothing/suit/roguetown/armor/rare/Initialize()
	. = ..()
	AddComponent(/datum/component/squeak, list('sound/foley/footsteps/armor/fullplate (1).ogg',\
												'sound/foley/footsteps/armor/fullplate (2).ogg',\
												'sound/foley/footsteps/armor/fullplate (3).ogg'), 100)

/obj/item/clothing/suit/roguetown/armor/rare/elfplate
	name = "dark elf plate"
	desc = "A fine suit of sleek, moulded dark elf metal. Its interlocking nature and light weight allow for increased maneuverability."
	icon_state = "elfchest"
	item_state = "elfchest"
	allowed_race = list("elf", "half-elf", "dark elf")
	equip_delay_self = 2 SECONDS
	unequip_delay_self = 2 SECONDS

	armor_class = ARMOR_CLASS_MEDIUM // Elven craft
	body_parts_covered = CHEST|VITALS

/obj/item/clothing/suit/roguetown/armor/rare/elfplate/welfplate
	name = "elvish plate"
	desc = "A suit of steel interwoven, through honed elven technique, with hardened bark plates."
	icon_state = "welfchest"
	item_state = "welfchest"

/obj/item/clothing/suit/roguetown/armor/rare/dwarfplate
	name = "dwarvish plate"
	desc = "Plate armor made out of the sturdiest, finest dwarvish metal armor. It's as heavy and durable as it gets."
	icon_state = "dwarfchest"
	item_state = "dwarfchest"
	allowed_race = list("dwarf")

	max_integrity = INTEGRITY_STRONGEST+100

/obj/item/clothing/suit/roguetown/armor/rare/grenzelplate
	name = "grenzelhoftian plate regalia"
	desc = "Engraved on this masterwork of humen metallurgy lies \"Thrice Slain, Thrice Risen, Thrice Pronged\" alongside the symbol of The Forgotten God in its neck guard."
	icon_state = "human_swordchest"
	item_state = "human_swordchest"
	allowed_race = list("human")
	allowed_sex = list(MALE)

	max_integrity = INTEGRITY_STRONG+100

/obj/item/clothing/suit/roguetown/armor/rare/zybanplate
	name = "zybantean kataphractoe scaleskin"
	desc = "Steel scales woven into armor with miniscule threads of adamantine, \
			ensuring the wearer optimal defence with forgiving breathability. \
			The sigil of the Zybantu Kataphractoe is embezzeled at the throat guard."
	icon_state = "human_spearchest"
	item_state = "human_spearchest"
	allowed_race = list("human")
	allowed_sex = list(MALE)

// Aasimar hoplite armor, a very rare armor indeed
/obj/item/clothing/suit/roguetown/armor/rare/hoplite
	name = "ancient plate armor"
	desc = "A battered set of bronze plate armor. Intricate runes and carvings once adorned the pieces, but most have faded with age."
	icon_state = "aasimarplate"
	item_state = "aasimarplate"
	allowed_race = list("aasimar")
	smeltresult = null // No bronze ingots yet, unfortunately
	sellprice = VALUE_SNOWFLAKE_STEEL+BONUS_VALUE_MODEST // It has great value to historical collectors

	body_parts_covered = CHEST|GROIN|VITALS|LEGS


/*-----------------\
| Antagonist Armor |
\-----------------*/

//................ Ancient Ceremonial Plate ............... //	- ANTAG GEAR Vampire Lord, do not use for other things. Their medium armor
/obj/item/clothing/suit/roguetown/armor/plate/vampire
	name = "ancient ceremonial plate"
	desc = "An ornate, ancient plate armor worn by the masters of the nite."
	icon_state = "vplate"
	item_state = "vplate"

	armor_class = ARMOR_CLASS_MEDIUM
	armor = list("melee" = 100, "bullet" = 80, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST|GROIN|VITALS
	prevent_crits = ALL_CRITICAL_HITS_VAMP

//................ Vampire Maille ............... //	- ANTAG GEAR Vampire Lord, do not use for other things. They can wear their chain shirt like the other bikers. Their light armor
/obj/item/clothing/suit/roguetown/armor/chainmail/iron/vampire
	name = "ancient chain shirt"
	desc = "Ancient iron chainmail."
	icon_state = "vunder"
	item_state = "vunder"

	body_parts_covered = CHEST|GROIN|ARMS|VITALS


//................ Crude Armor ............... // Orc stuff
/obj/item/clothing/suit/roguetown/armor/plate/breastplate/orc
	name = "crude plate armor"
	icon_state = "marauder_armor"
	item_state = "marauder_armor"
	icon = 'icons/roguetown/clothing/armor.dmi'
	allowed_race = list("orc")
	smeltresult = /obj/item/ingot/iron
	sellprice = NO_MARKET_VALUE

	armor_class = ARMOR_CLASS_MEDIUM
	armor = ARMOR_IRON_BAD
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS	// got arm & leg too because of NPC I guess? Still weird
	prevent_crits = list(BCLASS_LASHING, BCLASS_BITE, BCLASS_TWIST, BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	max_integrity = INTEGRITY_POOR

obj/item/clothing/suit/roguetown/armor/chainmail/iron/orc
	name = "crude maille"
	icon_state = "orc_chainvest"
	item_state = "orc_chainvest"
	icon = 'icons/roguetown/clothing/armor.dmi'
	allowed_race = list("orc")
	blocksound = PLATEHIT
	smeltresult = /obj/item/ingot/iron
	sellprice = NO_MARKET_VALUE

	armor_class = ARMOR_CLASS_MEDIUM
	armor = list("melee" = 25, "bullet" = 50, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS	// got arm & leg too because of NPC I guess? Still weird
	prevent_crits = ALL_EXCEPT_BLUNT
	max_integrity = INTEGRITY_POOR

// VAMPIRE ARMORS BELOW

/obj/item/clothing/under/roguetown/platelegs/vampire
	name = "ancient plate greaves"
	desc = ""
	gender = PLURAL
	icon_state = "vpants"
	item_state = "vpants"
	sewrepair = FALSE
	armor = list("melee" = 100, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_BITE, BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST) // Vampire armors don't protect against lashing, Castlevania reference
	blocksound = PLATEHIT
	do_sound = FALSE
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	r_sleeve_status = SLEEVE_NOMOD
	l_sleeve_status = SLEEVE_NOMOD

/obj/item/clothing/suit/roguetown/shirt/vampire
	slot_flags = ITEM_SLOT_SHIRT|ITEM_SLOT_ARMOR
	name = "regal silks"
	desc = ""
	body_parts_covered = CHEST|GROIN|LEGS|VITALS
	prevent_crits = list(BCLASS_BITE, BCLASS_TWIST)
	icon_state = "vrobe"
	item_state = "vrobe"
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL

/obj/item/clothing/head/roguetown/vampire
	name = "crown of darkness"
	icon_state = "vcrown"
	body_parts_covered = null
	slot_flags = ITEM_SLOT_HEAD
	dynamic_hair_suffix = null
	sellprice = 1000
	resistance_flags = FIRE_PROOF

/obj/item/clothing/shoes/roguetown/boots/armor/vampire
	name = "ancient ceremonial plated boots"
	desc = "Antediluvian boots with ceremonial ornamets from ages past."
	body_parts_covered = FEET
	icon_state = "vboots"
	item_state = "vboots"
	prevent_crits = ALL_CRITICAL_HITS_VAMP
	color = null
	blocksound = PLATEHIT
	smeltresult = /obj/item/ingot/steel
	armor = list("melee" = 100, "bullet" = 80, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/gloves/roguetown/chain/vampire
	name = "ancient ceremonial gloves"
	icon_state = "vgloves"
	smeltresult = /obj/item/ingot/steel
