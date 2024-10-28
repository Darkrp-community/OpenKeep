
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
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	pickup_sound =  'sound/blank.ogg'
	break_sound = 'sound/foley/breaksound.ogg'
	experimental_onhip = TRUE // does this do anything on armor I wonder?
//	blocking_behavior		use to block gloves when armor includes them etc
	sellprice = VALUE_COMMON_GOODS
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST

/obj/item/clothing/suit/roguetown/armor/medium	// Template, not for use
	name = "Medium armor template"
	equip_delay_self = 4 SECONDS
	unequip_delay_self = 4 SECONDS
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	armor_class = ARMOR_CLASS_MEDIUM
	body_parts_covered = CHEST|VITALS|GROIN|LEGS
	max_integrity = INTEGRITY_STANDARD
	clothing_flags = CANT_SLEEP_IN


//..................................................................................................................................
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
	desc = "Thick quilted cloth in layers, good on its own or worn below metal as padding."
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
	desc = "Thin and the maker skimped on the padding, typically worn by the peasantry to give some protection against cold for the whole body."
	icon_state = "gambesonl"
	sellprice = VALUE_LIGHT_GAMBESSON

	armor = ARMOR_GAMBESON_BAD
	prevent_crits = null // It won't help, like, at all.

/obj/item/clothing/suit/roguetown/armor/gambeson/heavy
	name = "padded gambeson"
	desc = "Thick, padded, this will help a little even against arrows. A wise man carried steel as well, but it will do in a pinch."
	icon_state = "gambesonp"
	sellprice = VALUE_HEAVY_GAMBESSON

	armor = ARMOR_GAMBESON_GOOD
	prevent_crits = ALL_EXCEPT_CHOP_AND_STAB

/obj/item/clothing/suit/roguetown/armor/gambeson/heavy/dark
	color = CLOTHING_BLACK_WARM


//................ Padded Dress ............... //
/obj/item/clothing/suit/roguetown/armor/gambeson/heavy/dress
	name = "padded dress"
	desc = "Favored by the female nobility, to maintain both vitality and good taste while out hunting."
	icon_state = "armordress"
	allowed_sex = list(FEMALE)
	allowed_race = list("human", "tiefling", "elf", "aasimar")
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	sellprice = VALUE_PADDED_DRESS

	body_parts_covered = CHEST|GROIN|LEGS|ARMS|VITALS

/obj/item/clothing/suit/roguetown/armor/gambeson/heavy/dress/alt
	icon_state = "armordressalt"


//................ Arming Jacket ............... //
/obj/item/clothing/suit/roguetown/armor/gambeson/arming
	name = "arming jacket"
	desc = "Thick quilted cloth, a gambesson for the discerning knight. it is meant to be used under heavier armor."
	icon_state = "arming"
	sellprice = VALUE_GAMBESSON+BONUS_VALUE_MODEST

	body_parts_covered = CHEST|ARMS|VITALS|GROIN


//................ Stalker Robe ............... //
/obj/item/clothing/suit/roguetown/armor/gambeson/shadowrobe
	name = "stalker robe"
	desc = "A robe-like gambeson of moth-eaten cloth and cheap purple dye. No self-respecting elf would be seen wearing this."
	allowed_race = list("elf", "dark elf")
	icon_state = "shadowrobe"


//................ Striped Tunic ............... // - Light gambesson type
/obj/item/clothing/suit/roguetown/armor/gambeson/light/striped
	name = "striped tunic"
	desc = "A common tunic worn by just about anyone. Nothing special, but essential."
	icon_state = "striped"
	sleevetype = null
	sleeved = null
	nodismemsleeves = TRUE

	body_parts_covered = CHEST|VITALS

/obj/item/clothing/suit/roguetown/armor/gambeson/light/striped/Initialize()
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
	name = "splint armor"
	desc = "The smell of a leather coat, with pieces of recycled metal from old breastplates or cooking utensils riveted to the inside."
	icon_state = "splint"
	sellprice = VALUE_LEATHER_ARMOR_PLUS

	armor = ARMOR_LEATHER_BEST
	prevent_crits = ALL_EXCEPT_STAB
	max_integrity = INTEGRITY_STRONG


//................ Leather Vest ............... //	- has no sleeves.  - can be worn in armor OR shirt slot
/obj/item/clothing/suit/roguetown/armor/leather/vest
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	name = "leather vest"
	desc = "Obviously no sleeves, won't really protect much but it's at least padded enough to be an armor, and can be worn against the skin snugly."
	icon_state = "vest"
	color = CLOTHING_BROWN
	blade_dulling = DULLING_BASHCHOP
	blocksound = SOFTHIT
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
	name = "butchers vest"
	icon_state = "leathervest"
//	item_state = "leathervest"
	color = "#d69c87" // custom coloring

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


//................ Jacket ............... //	- Has a small storage space
/obj/item/clothing/suit/roguetown/armor/leather/jacket
	name = "tanned jacket"
	icon_state = "leatherjacketo"
	desc = "A heavy leather jacket with wooden buttons, favored by workers who can afford it."

	body_parts_covered = CHEST|VITALS|ARMS

/obj/item/clothing/suit/roguetown/armor/leather/jacket/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/storage/concrete)
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		STR.max_combined_w_class = 2
		STR.max_w_class = WEIGHT_CLASS_NORMAL
		STR.max_items = 1

/obj/item/clothing/suit/roguetown/armor/leather/jacket/dropped(mob/living/carbon/human/user)
	..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		var/list/things = STR.contents()
		for(var/obj/item/I in things)
			STR.remove_from_storage(I, get_turf(src))

//................ Sea Jacket ............... //
/obj/item/clothing/suit/roguetown/armor/leather/jacket/sea
	slot_flags = ITEM_SLOT_ARMOR
	name = "sea jacket"
	desc = "A sturdy jacket worn by daring seafarers. The leather it's made from has been tanned by the salt of Abyssor's seas."
	icon_state = "sailorvest"
	sleevetype = "shirt"

	armor = ARMOR_LEATHER_BEST
	body_parts_covered = CHEST|VITALS

//................ Silk Coat ............... //
/obj/item/clothing/suit/roguetown/armor/leather/jacket/silk_coat
	name = "silk coat"
	desc = "An expertly padded coat made from the finest silks. Long may live the nobility that dons it."
	icon_state = "bliaut"
	sleevetype = "shirt"
	allowed_sex = list(FEMALE)
	sellprice = VALUE_LEATHER_ARMOR_LORD

	body_parts_covered = CHEST|LEGS|VITALS|GROIN
	prevent_crits = CUT_AND_MINOR_CRITS

/obj/item/clothing/suit/roguetown/armor/leather/jacket/silk_coat/Initialize()
	color = pick(CLOTHING_PURPLE, CLOTHING_WHITE,CLOTHING_RED)
	..()

//................ Silk Jacket ............... //
/obj/item/clothing/suit/roguetown/armor/leather/jacket/niteman
	name = "silk jacket"
	icon_state = "nightman"
	desc = "Displaying wealth while keeping your guts safe from blades with thick leather pads underneath."
	sellprice = VALUE_LEATHER_ARMOR_LORD

	body_parts_covered = CHEST|VITALS|LEGS

//................ Hand´s Coat ............... //
/obj/item/clothing/suit/roguetown/armor/leather/jacket/hand
	name = "noble coat"
	icon_state = "handcoat"
	desc = "A quality silken coat, discretely lined with thin metal platr on the inside to protect its affluent wearer."
	sellprice = VALUE_LEATHER_ARMOR_LORD

	body_parts_covered = CHEST|VITALS|LEGS


//................ Amazon chainkini ............... //
/obj/item/clothing/suit/roguetown/armor/amazon_chainkini
	name = "amazonian armor"
	desc = "Fur skirt and maille chest holder, typically worn by warrior women of the isle of Issa."
	icon_state = "chainkini"
	item_state = "chainkini"
	allowed_sex = list(FEMALE)
	sewrepair = TRUE
	smeltresult = /obj/item/ingot/iron
	sellprice = VALUE_IRON_ARMOR_UNUSUAL

	armor_class = ARMOR_CLASS_LIGHT
	armor = MELEE_70___ARROW_NOTHING
	body_parts_covered = CHEST|GROIN|VITALS
	prevent_crits = ALL_EXCEPT_BLUNT


//................ Iron Maille ............... //
/obj/item/clothing/suit/roguetown/armor/chainmail/iron
	name = "iron maille"
	desc = "A vest made of iron rings. Offers good protection against arrows, stabs and cuts."
	icon_state = "ichainmail"
	smeltresult = /obj/item/ingot/iron
	sellprice = VALUE_IRON_ARMOR

	armor = ARMOR_MAILLE_IRON
	armor_class = ARMOR_CLASS_LIGHT
	body_parts_covered = CHEST|GROIN|VITALS


//................ Copper Heart-protector ............... //
/obj/item/clothing/suit/roguetown/armor/cuirass/copperchest
	name = "heart protector"
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



//..................................................................................................................................
/*---------------\
|			 	 |
|  Medium Armor	 |		- Can't dodge?	- Max 95% protection
|			 	 |
\---------------*/

//................ Maille ............... //
/obj/item/clothing/suit/roguetown/armor/chainmail
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	name = "maille"
	desc = "Made out of interlocked steel rings. Offers superior resistance against arrows, stabs and cuts. \nUsually worn as padding for proper armor, it is also called a haubergon, the little hauberk."
	icon_state = "maille"
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


//................ Hauberk ............... //
/obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
	name = "hauberk"
	desc = "A long shirt of maille, heavy on the shoulders. Can be worn as a shirt, but some men with hairy chests consider it torture."
	icon_state = "hauberk"
	item_state = "hauberk"
	sellprice = VALUE_STEEL_ARMOR_FINE

	armor = list("melee" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS

/obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/Initialize()
	. = ..()
	AddComponent(/datum/component/squeak, list('sound/foley/footsteps/armor/chain (1).ogg',\
												'sound/foley/footsteps/armor/chain (2).ogg',\
												'sound/foley/footsteps/armor/chain (3).ogg'), 80)


/*-----------------------\
|  Cuirass & Breastplate |
\-----------------------*/
// A cuirass is armor that covers both stomach and chest front as well as your back. A breastplate only covers your front torso.
//................ Steel Cuirass ............... //
/obj/item/clothing/suit/roguetown/armor/cuirass
	slot_flags = ITEM_SLOT_ARMOR
	name = "steel cuirass"
	desc = "A cuirass of steel. Lightweight and highly durable."
	icon_state = "cuirass"
	item_state = "cuirass"
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	boobed = FALSE
	sellprice = VALUE_STEEL_ARMOR

	armor_class = ARMOR_CLASS_MEDIUM
	armor = list("melee" = 80, "bullet" = 80, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST|VITALS|GROIN
	prevent_crits = ALL_EXCEPT_STAB
	max_integrity = INTEGRITY_STRONGEST

//................ Grenzelhoft Cuirass ............... //
/obj/item/clothing/suit/roguetown/armor/cuirass/grenzelhoft
	name = "grenzelhoft cuirass"
	desc = "Simple armor, but made from Grenzelhoftian black-steel, famed afar for its strength."
	icon_state = "grenzelcuirass"
	item_state = "grenzelcuirass"
	sleeved = 'icons/roguetown/clothing/onmob/helpers/stonekeep_merc.dmi'
	boobed = TRUE

	armor = list("melee" = 90, "bullet" = 80, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

//................ Black Oak Cuirass ............... //
/obj/item/clothing/suit/roguetown/armor/cuirass/elven
	name = "elven guardian cuirass"
	desc = "A cuirass made of steel with a thin decorative gold plating. Lightweight and durable."
	icon_state = "halfplate"
	item_state = "cuirasse"
	color = COLOR_ASSEMBLY_GOLD
	equip_delay_self = 2 SECONDS
	unequip_delay_self = 2 SECONDS
	sellprice = VALUE_SNOWFLAKE_STEEL

//................ Iron Breastplate ............... //	- A breastplate is a cuirass without its back plate.
/obj/item/clothing/suit/roguetown/armor/cuirass/iron
	name = "iron breastplate"
	desc = "Many cooking pots ended their daes on the anvil to form this protective plate."
	icon_state = "ibreastplate"
	item_state = "ibreastplate"
	smeltresult = /obj/item/ingot/iron
	sellprice = VALUE_IRON_ARMOR

	armor = ARMOR_IRON
	body_parts_covered = CHEST|VITALS
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


//................ Scalemail ............... //
/obj/item/clothing/suit/roguetown/armor/medium/scale // important is how this item covers legs too compared to halfplate
	name = "scalemail"
	desc = "Overlapping steel plates almost makes the wearer look like he has silvery fish scales."
	icon_state = "scale"
	sellprice = VALUE_STEEL_ARMOR_FINE

	armor = list("melee" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST|VITALS|GROIN|LEGS
	prevent_crits = ALL_CRITICAL_HITS
	max_integrity = INTEGRITY_STRONGEST


//................ Armored Surcoat ............... //	- splint mail looking armor thats colored
/obj/item/clothing/suit/roguetown/armor/medium/surcoat
	name = "armored surcoat"
	desc = "Metal plates partly hidden by cloth, fitted for a man."
	icon_state = "surcoat"
	item_state = "surcoat"
	allowed_sex = list(MALE)	// trouble getting the sprites to work with females, sick of it, remains male only like it used to be
	detail_tag = "_metal"		// metal bits are the details so keep them uncolorer = white
	detail_color = COLOR_WHITE

/obj/item/clothing/suit/roguetown/armor/medium/surcoat/Initialize()
	. = ..()
	update_icon()

/obj/item/clothing/suit/roguetown/armor/medium/surcoat/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

//................ Armored surcoat (Heartfelt Lord) ............... //
/obj/item/clothing/suit/roguetown/armor/medium/surcoat/heartfelt
	desc = "A lordly protection in Heartfelt colors. Masterfully crafted coat of plates, for important nobility."
	color = CLOTHING_RED
	sellprice = VALUE_SNOWFLAKE_STEEL+BONUS_VALUE_SMALL

	armor = list("melee" = 95, "bullet" = 95, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST|GROIN|VITALS|LEGS|ARMS

//................ Armored surcoat (Heartfelt Hand) ............... //
/obj/item/clothing/suit/roguetown/armor/medium/surcoat/heartfelt/hand
	desc = "A coat of armor typicially worn by distinguished retainers of Heartfeltian nobles."
	sellprice = VALUE_SNOWFLAKE_STEEL

	armor = list("melee" = 90, "bullet" = 95, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)


//..................................................................................................................................
/*---------------\
|			 	 |
|  Heavy Armor	 |
|			 	 |
\---------------*/

//................ Half-plate Armor ............... //
/obj/item/clothing/suit/roguetown/armor/plate
	name = "steel half-plate"
	desc = "Plate armor with shoulder guards. An incomplete, bulky set of excellent armor."
	icon_state = "halfplate"
	item_state = "halfplate"
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	equip_delay_self = 4 SECONDS
	unequip_delay_self = 4 SECONDS
	equip_sound = 'sound/foley/equip/equip_armor_plate.ogg'
	sellprice = VALUE_STEEL_ARMOR
	clothing_flags = CANT_SLEEP_IN
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


//................ Iron Plate Armor ............... //
/obj/item/clothing/suit/roguetown/armor/plate/iron
	name = "iron plate armor"
	desc = "A rough set of iron armor, complete with chainmail joints and pauldrons. A simple and cheap design to protect vital zones, but not the arms."
	icon_state = "ironplate"
	smeltresult = /obj/item/ingot/iron
	sellprice = VALUE_IRON_ARMOR*2

	armor = list("melee" = 60, "bullet" = 60, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST|VITALS|GROIN|LEGS
	max_integrity = INTEGRITY_STRONG


//................ Rusted Half-plate ............... //
/obj/item/clothing/suit/roguetown/armor/plate/rust
	name = "rusted half-plate"
	desc = "Old glory, old defeats, most of the rust comes from damp and not the blood of previous wearers, one would hope."
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
	clothing_flags = CANT_SLEEP_IN
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
	name = "rare armor template"
	icon = 'icons/roguetown/clothing/Racial_Armour.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/onmob_racial.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/onmob_racial.dmi'
	sleevetype = null
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	equip_delay_self = 4 SECONDS
	unequip_delay_self = 4 SECONDS
	sellprice = VALUE_SNOWFLAKE_STEEL
	clothing_flags = CANT_SLEEP_IN
	armor_class = ARMOR_CLASS_HEAVY
	armor = ARMOR_STEEL_BEST
	body_parts_covered = CHEST|GROIN|ARMS|VITALS
	prevent_crits = ALL_EXCEPT_STAB
	max_integrity = INTEGRITY_STRONGEST

/obj/item/clothing/suit/roguetown/armor/rare/Initialize()
	. = ..()
	AddComponent(/datum/component/squeak, list('sound/foley/footsteps/armor/fullplate (1).ogg',\
												'sound/foley/footsteps/armor/fullplate (2).ogg',\
												'sound/foley/footsteps/armor/fullplate (3).ogg'), 80)

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
	name = "kataphractoe scaleskin"
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
	icon = 'icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	icon_state = "aasimarplate"
	item_state = "aasimarplate"
	allowed_race = list("aasimar")
	smeltresult = null // No bronze ingots yet, unfortunately
	sellprice = VALUE_SNOWFLAKE_STEEL+BONUS_VALUE_MODEST // It has great value to historical collectors

	body_parts_covered = CHEST|GROIN|VITALS|LEGS



//..................................................................................................................................
/*-----------------\
| Antagonist Armor |
\-----------------*/

//................ Ancient Ceremonial Plate ............... //	- ANTAG GEAR Vampire Lord, do not use for other things. Their medium armor
/obj/item/clothing/suit/roguetown/armor/plate/vampire
	name = "ancient plate"
	desc = "An ornate, ceremonial plate armor worn by the masters of the nite."
	icon_state = "vplate"
	item_state = "vplate"

	armor_class = ARMOR_CLASS_MEDIUM
	armor = list("melee" = 100, "bullet" = 80, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = CHEST|GROIN|VITALS
	prevent_crits = ALL_CRITICAL_HITS_VAMP

//................ Ancient Haubergon ............... //	- ANTAG GEAR Vampire Lord, do not use for other things. They can wear their chain shirt like the other bikers. Their light armor
/obj/item/clothing/suit/roguetown/armor/chainmail/iron/vampire
	name = "ancient haubergon"
	desc = "A style of armor long out of use. Rests easy on the shoulders."
	icon_state = "vunder"
	item_state = "vunder"

	body_parts_covered = CHEST|GROIN|ARMS|VITALS


//................ Blacksteel Plate ............... //
/obj/item/clothing/suit/roguetown/armor/plate/blkknight
	name = "blacksteel plate"
	body_parts_covered = CHEST|GROIN|VITALS|ARMS
	armor_class = ARMOR_CLASS_MEDIUM
	icon_state = "bkarmor"
	icon = 'icons/roguetown/clothing/special/blkknight.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/blkknight.dmi'
	sleeved = 'icons/roguetown/clothing/special/onmob/blkknight.dmi'



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
	name = "ancient ceremonial boots"
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
