
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
	armor = ARMOR_MINIMAL
	body_parts_covered = CHEST

/obj/item/clothing/suit/roguetown/armor/medium	// Template, not for use
	name = "Medium armor template"
	equip_delay_self = 4 SECONDS
	unequip_delay_self = 3 SECONDS
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	armor_class = AC_MEDIUM
	armor = ARMOR_SCALE
	max_integrity = INTEGRITY_STANDARD
	clothing_flags = CANT_SLEEP_IN
	prevent_crits = ALL_EXCEPT_STAB


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

	armor_class = AC_LIGHT
	armor = ARMOR_PADDED
	body_parts_covered = COVERAGE_FULL
	prevent_crits = ALL_EXCEPT_CHOP_AND_STAB

//................ Crimson Marauder ............... //
/obj/item/clothing/suit/roguetown/armor/leather/jacket/sea/marauder
	slot_flags = ITEM_SLOT_ARMOR
	name = "jinete's linothorax"
	desc = "A stained leather cuirass bearing the snarling face of a demon. The tiefling nomads of the Crimsonlands shape this armor to hearken to that which their ancestors wore."
	icon_state = "crimson_armor"
	sleevetype = "shirt"
	nodismemsleeves = TRUE
	armor = ARMOR_LEATHER_GOOD
	body_parts_covered = CHEST|GROIN|LEGS|VITALS

/obj/item/clothing/suit/roguetown/armor/gambeson/light
	name = "light gambeson"
	desc = "Thin and the maker skimped on the padding, typically worn by the peasantry to give some protection against cold for the whole body."
	icon_state = "gambesonl"
	color = CLOTHING_LINEN
	sellprice = VALUE_LIGHT_GAMBESSON

	armor = ARMOR_PADDED_BAD
	prevent_crits = MINOR_CRITICALS

/obj/item/clothing/suit/roguetown/armor/gambeson/heavy
	name = "padded gambeson"
	desc = "Thick, padded, this will help a little even against arrows. A wise man carried steel as well, but it will do in a pinch."
	icon_state = "gambesonp"
	sellprice = VALUE_HEAVY_GAMBESSON

	armor = ARMOR_PADDED_GOOD

/obj/item/clothing/suit/roguetown/armor/gambeson/heavy/dark
	color = CLOTHING_DARK_INK


//................ Padded Dress ............... //
/obj/item/clothing/suit/roguetown/armor/gambeson/heavy/dress
	name = "padded dress"
	desc = "Favored by the female nobility, to maintain both vitality and good taste while out hunting."
	icon_state = "armordress"
	allowed_sex = list(FEMALE)
	allowed_race = list("human", "tiefling", "elf", "aasimar", "abyssariad", "half-elf", "dark elf")
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	sellprice = VALUE_PADDED_DRESS

	body_parts_covered = COVERAGE_FULL

/obj/item/clothing/suit/roguetown/armor/gambeson/heavy/dress/alt
	icon_state = "armordressalt"


//................ Arming Jacket ............... //
/obj/item/clothing/suit/roguetown/armor/gambeson/arming
	name = "arming jacket"
	desc = "Thick quilted cloth, a gambesson for the discerning knight. It is meant to be used under heavier armor."
	icon_state = "arming"
	sellprice = VALUE_GAMBESSON+BONUS_VALUE_MODEST

	body_parts_covered =  COVERAGE_ALL_BUT_LEGS


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

	body_parts_covered = COVERAGE_VEST

/obj/item/clothing/suit/roguetown/armor/gambeson/light/striped/Initialize()
	color = pick(CLOTHING_SALMON, CLOTHING_BERRY_BLUE, CLOTHING_SPRING_GREEN, CLOTHING_PEAR_YELLOW)
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

	armor_class = AC_LIGHT
	armor = ARMOR_LEATHER_BAD
	body_parts_covered = COVERAGE_TORSO
	prevent_crits = ALL_EXCEPT_CHOP_AND_STAB
	max_integrity = INTEGRITY_STANDARD

//................ Hide Armor ............... //
/obj/item/clothing/suit/roguetown/armor/leather/hide
	name = "hide armor"
	desc = "A leather armor with additional internal padding of creacher fur. Offers slightly higher integrity and comfort."
	icon_state = "hidearmor"
	sellprice = VALUE_LEATHER_ARMOR_FUR

	armor = ARMOR_LEATHER

//................ Splint Mail ............... //
/obj/item/clothing/suit/roguetown/armor/leather/splint
	name = "splint armor"
	desc = "The smell of a leather coat, with pieces of recycled metal from old breastplates or cooking utensils riveted to the inside."
	icon_state = "splint"
	sellprice = VALUE_LEATHER_ARMOR_PLUS

	armor = ARMOR_LEATHER_GOOD
	prevent_crits = ALL_EXCEPT_STAB
	max_integrity = INTEGRITY_STRONG


//................ Leather Vest ............... //	- has no sleeves.  - can be worn in armor OR shirt slot
/obj/item/clothing/suit/roguetown/armor/leather/vest
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	name = "leather vest"
	desc = "Obviously no sleeves, won't really protect much but it's at least padded enough to be an armor, and can be worn against the skin snugly."
	icon_state = "vest"
	color = CLOTHING_BARK_BROWN
	blade_dulling = DULLING_BASHCHOP
	blocksound = SOFTHIT
	sewrepair = TRUE
	sleevetype = null
	sleeved = null

	armor = ARMOR_LEATHER_WORST
	body_parts_covered = COVERAGE_VEST
	prevent_crits = CUT_AND_MINOR_CRITS

/obj/item/clothing/suit/roguetown/armor/leather/vest/random/Initialize()
	color = pick(CLOTHING_SOOT_BLACK, CLOTHING_BARK_BROWN, CLOTHING_FOREST_GREEN)
	..()

//................ Butchers Vest ............... //
/obj/item/clothing/suit/roguetown/armor/leather/vest/butcher
	name = "butchers vest"
	icon_state = "leathervest"
	color = "#d69c87" // custom coloring

//................ Other Vests ............... //
/obj/item/clothing/suit/roguetown/armor/leather/vest/butler
	color = CLOTHING_BLOOD_RED

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
	color = CLOTHING_DARK_INK

/obj/item/clothing/suit/roguetown/armor/leather/vest/innkeep // repath to correct padded vest some day
	name = "padded vest"
	desc = "Dyed green, belongs to the owner of the Drunken Saiga inn."
	icon_state = "striped"
	color = "#638b45"


//................ Jacket ............... //	- Has a small storage space
/obj/item/clothing/suit/roguetown/armor/leather/jacket
	name = "tanned jacket"
	icon_state = "leatherjacketo"
	desc = "A heavy leather jacket with wooden buttons, favored by workers who can afford it."

	armor = ARMOR_LEATHER_WORST
	body_parts_covered = COVERAGE_SHIRT

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

//................ Leather Jacket ............... //
/obj/item/clothing/suit/roguetown/armor/leather/jacket/toggle // hehe...should be toggleable

//................ Sea Jacket ............... //
/obj/item/clothing/suit/roguetown/armor/leather/jacket/sea
	slot_flags = ITEM_SLOT_ARMOR
	name = "sea jacket"
	desc = "A sturdy jacket worn by daring seafarers. The leather it's made from has been tanned by the salt of Abyssor's seas."
	icon_state = "sailorvest"
	sleevetype = "shirt"

	armor = ARMOR_LEATHER_BAD
	body_parts_covered = COVERAGE_VEST

//................ Silk Coat ............... //
/obj/item/clothing/suit/roguetown/armor/leather/jacket/silk_coat
	name = "silk coat"
	desc = "An expertly padded coat made from the finest silks. Long may live the nobility that dons it."
	icon_state = "bliaut"
	sleevetype = "shirt"
	sellprice = VALUE_LEATHER_ARMOR_LORD

	armor = ARMOR_LEATHER_BAD
	body_parts_covered = COVERAGE_ALL_BUT_ARMS
	prevent_crits = CUT_AND_MINOR_CRITS

/obj/item/clothing/suit/roguetown/armor/leather/jacket/silk_coat/Initialize()
	color = pick(CLOTHING_PLUM_PURPLE, CLOTHING_WHITE,CLOTHING_BLOOD_RED)
	..()

//................ Silk Jacket ............... //
/obj/item/clothing/suit/roguetown/armor/leather/jacket/niteman
	name = "silk jacket"
	icon_state = "niteman"
	desc = "Displaying wealth while keeping your guts safe from blades with thick leather pads underneath."
	sellprice = VALUE_LEATHER_ARMOR_LORD

	body_parts_covered = COVERAGE_SHIRT

//................ Hand´s Coat ............... //
/obj/item/clothing/suit/roguetown/armor/leather/jacket/hand
	name = "noble coat"
	icon_state = "handcoat"
	desc = "A quality silken coat, discretely lined with thin metal plate on the inside to protect its affluent wearer."
	sellprice = VALUE_LEATHER_ARMOR_LORD

	body_parts_covered = COVERAGE_ALL_BUT_ARMS


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

	armor_class = AC_LIGHT
	armor = ARMOR_LEATHER_GOOD
	body_parts_covered = COVERAGE_TORSO
	prevent_crits = ALL_EXCEPT_BLUNT //This having stab crit protection as a bikini is extremely funny so I will just leave it here.


//................ Copper Heart-protector ............... //
/obj/item/clothing/suit/roguetown/armor/cuirass/copperchest
	name = "heart protector"
	desc = "Very simple and crude protection for the chest. Ancient fighters once used similar gear, with better quality..."
	icon_state = "copperchest"
	item_state = "copperchest"
	smeltresult = /obj/item/ingot/copper
	sellprice = VALUE_DIRT_CHEAP

	armor_class = AC_LIGHT
	armor = ARMOR_PLATE_BAD
	body_parts_covered = CHEST
	prevent_crits = ONLY_VITAL_ORGANS
	max_integrity = INTEGRITY_POOR



//..................................................................................................................................
/*---------------\
|			 	 |
|  Medium Armor	 |
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

	armor_class = AC_MEDIUM
	armor = ARMOR_MAILLE
	body_parts_covered = COVERAGE_ALL_BUT_LEGS
	prevent_crits = ALL_EXCEPT_BLUNT
	max_integrity = INTEGRITY_STRONG


//................ Iron Maille ............... //
/obj/item/clothing/suit/roguetown/armor/chainmail/iron
	name = "iron maille"
	desc = "A short-sleeved shirt made of iron rings. Offers good protection against arrows, stabs and cuts."
	icon_state = "ichainmail"
	smeltresult = /obj/item/ingot/iron
	sellprice = VALUE_IRON_ARMOR

	armor = ARMOR_MAILLE_IRON
	body_parts_covered = COVERAGE_TORSO
	max_integrity = INTEGRITY_STANDARD
	prevent_crits = ALL_EXCEPT_BLUNT_AND_STAB //Non-riveted, iron chain can be broken apart with a powerful thrust.


//................ Hauberk ............... //
/obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
	name = "hauberk"
	desc = "A long shirt of maille, heavy on the shoulders. Can be worn as a shirt, but some men with hairy chests consider it torture."
	icon_state = "hauberk"
	item_state = "hauberk"
	sellprice = VALUE_STEEL_ARMOR_FINE

	body_parts_covered = COVERAGE_FULL

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
	clothing_flags = CANT_SLEEP_IN
	boobed = FALSE
	sellprice = VALUE_STEEL_ARMOR

	armor_class = AC_MEDIUM
	armor = ARMOR_PLATE
	body_parts_covered = COVERAGE_TORSO
	prevent_crits = ALL_EXCEPT_STAB
	max_integrity = INTEGRITY_STRONG

//................ Grenzelhoft Cuirass ............... //
/obj/item/clothing/suit/roguetown/armor/cuirass/grenzelhoft
	name = "grenzelhoft cuirass"
	desc = "Simple armor, but made from Grenzelhoftian black-steel, famed afar for its strength."
	icon_state = "grenzelcuirass"
	item_state = "grenzelcuirass"
	sleeved = 'icons/roguetown/clothing/onmob/helpers/stonekeep_merc.dmi'
	boobed = TRUE

	armor = ARMOR_PLATE_GOOD

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

	armor = ARMOR_PLATE_BAD
	body_parts_covered = COVERAGE_VEST
	max_integrity = INTEGRITY_STANDARD

//................ Rusted Breastplate ............... //
/obj/item/clothing/suit/roguetown/armor/cuirass/iron/rust
	name = "rusted breastplate"
	desc = "Old but still useful to keep sharp objects from your innards."
	icon_state = "rusthalf"
	item_state = "rusthalf"
	sellprice = VALUE_IRON_ARMOR/2

	max_integrity = INTEGRITY_POOR

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

	body_parts_covered = COVERAGE_ALL_BUT_ARMS
	prevent_crits = ALL_CRITICAL_HITS
	max_integrity = INTEGRITY_STRONG


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

//................ Armored surcoat (Heartfelt) ............... //
/obj/item/clothing/suit/roguetown/armor/medium/surcoat/heartfelt
	name = "heartfelt kikko gusoku"
	desc = "A lordly protection in Heartfelt colors. Masterfully crafted coat of hexagon plates, for important nobility."
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	icon_state = "heartfelt_kikko"
	item_state = "heartfelt_kikko"
	allowed_sex = list(MALE,FEMALE)
	sellprice = VALUE_SNOWFLAKE_STEEL+BONUS_VALUE_SMALL

	body_parts_covered = COVERAGE_FULL

//................ Armored surcoat (Heartfelt Hand) ............... //
/obj/item/clothing/suit/roguetown/armor/medium/surcoat/heartfelt/hand
	name = "heartfelt kikko coat"
	desc = "A coat of armor typicially worn by distinguished retainers of Heartfeltian nobles, using exotic silks adquired from Fog Island."
	icon_state = "heartfelt_kikkocoat"
	item_state = "heartfelt_kikkocoat"

/obj/item/clothing/suit/roguetown/armor/medium/surcoat/heartfelt/hand/female
	name = "heartfelt kikko dress"
	desc = "A dress of armor typicially worn by distinguished retainers of Heartfeltian nobles, using exotic silks adquired from Fog Island."
	icon_state = "heartfelt_kikkodress"
	item_state = "heartfelt_kikkodress"

//................ Coat of Plate ............... //
/obj/item/clothing/suit/roguetown/armor/medium/coatplates
	name = "coat of plates"
	desc = "Armor in the zybantine fashion with thick leather and rows of little steel plates covering vital organs,\
			allowing for more movement than full plate but still giving good protection. Not as durable as maille."
	icon_state = "coat_of_plates"
	blocksound = PLATEHIT
	sellprice = VALUE_SNOWFLAKE_STEEL

	armor = ARMOR_MAILLE_GOOD




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
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	equip_delay_self = 4 SECONDS
	unequip_delay_self = 4 SECONDS
	equip_sound = 'sound/foley/equip/equip_armor_plate.ogg'
	sellprice = VALUE_STEEL_ARMOR
	clothing_flags = CANT_SLEEP_IN

	armor_class = AC_HEAVY
	armor = ARMOR_PLATE
	body_parts_covered = COVERAGE_ALL_BUT_ARMS
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
	unequip_delay_self = 7 SECONDS
	sellprice = VALUE_FULL_PLATE

	armor = ARMOR_PLATE
	body_parts_covered = COVERAGE_FULL


//................ Iron Plate Armor ............... //
/obj/item/clothing/suit/roguetown/armor/plate/iron
	name = "iron plate armor"
	desc = "A rough set of iron armor, complete with chainmail joints and pauldrons. A simple and cheap design to protect vital zones, but not the arms."
	icon_state = "ironplate"
	smeltresult = /obj/item/ingot/iron
	sellprice = VALUE_IRON_ARMOR*2

	armor = ARMOR_PLATE_BAD
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
	desc = "A heavy coat with plates concealed inside an exterior fabric. Protects the user from melee impacts and also ranged attacks to an extent."
	icon_state = "brigandine"
	blocksound = SOFTHIT
	equip_delay_self = 4 SECONDS
	unequip_delay_self = 4 SECONDS
	anvilrepair = /datum/skill/craft/armorsmithing
	smeltresult = /obj/item/ingot/steel
	sellprice = VALUE_BRIGANDINE
	clothing_flags = CANT_SLEEP_IN

	armor_class = AC_HEAVY
	armor = ARMOR_PLATE_BAD
	body_parts_covered = COVERAGE_ALL_BUT_LEGS
	max_integrity = INTEGRITY_STRONG
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

	armor_class = AC_HEAVY
	armor = ARMOR_PLATE_GOOD
	body_parts_covered = COVERAGE_ALL_BUT_LEGS
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
	allowed_race = list("elf", "half-elf", "dark elf")
	equip_delay_self = 2 SECONDS
	unequip_delay_self = 2 SECONDS

	armor_class = AC_MEDIUM // Elven craft, also a cuirass
	body_parts_covered = COVERAGE_VEST

/obj/item/clothing/suit/roguetown/armor/rare/elfplate/welfplate
	name = "elvish plate"
	desc = "A suit of steel interwoven, through honed elven technique, with hardened bark plates."
	icon_state = "welfchest"

/obj/item/clothing/suit/roguetown/armor/rare/dwarfplate
	name = "dwarvish plate"
	desc = "Plate armor made out of the sturdiest, finest dwarvish metal armor. It's as heavy and durable as it gets."
	icon_state = "dwarfchest"
	allowed_race = list("dwarf")

/obj/item/clothing/suit/roguetown/armor/rare/grenzelplate
	name = "grenzelhoftian plate regalia"
	desc = "Engraved on this masterwork of humen metallurgy lies \"Thrice Slain, Thrice Risen, Thrice Pronged\" alongside the symbol of The Forgotten God in its neck guard."
	icon_state = "human_swordchest"
	allowed_race = list("human")
	allowed_sex = list(MALE)

/obj/item/clothing/suit/roguetown/armor/rare/zybanplate
	name = "kataphractoe scaleskin"
	desc = "Steel scales woven into armor with miniscule threads of adamantine, \
			ensuring the wearer optimal defence with forgiving breathability. \
			The sigil of the Zybantu Kataphractoe is embezzeled at the throat guard."
	icon_state = "human_spearchest"
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
	allowed_race = list("aasimar")
	smeltresult = null // No bronze ingots yet, unfortunately
	sellprice = VALUE_SNOWFLAKE_STEEL+BONUS_VALUE_MODEST // It has great value to historical collectors

	body_parts_covered = COVERAGE_ALL_BUT_ARMS



//..................................................................................................................................
/*-----------------\
| Antagonist Armor |
\-----------------*/


//................ Ancient Ceremonial Plate ............... //
/obj/item/clothing/suit/roguetown/armor/cuirass/vampire
	name = "ancient plate"
	desc = "A ornate, ceremonial plate cuirass of considerable age."
	icon_state = "vplate"

	armor_class = AC_MEDIUM
	armor = ARMOR_PLATE_GOOD
	body_parts_covered = COVERAGE_TORSO
	prevent_crits = ALL_CRITICAL_HITS_VAMP

//................ Ancient Maille ............... //
/obj/item/clothing/suit/roguetown/armor/chainmail/maille_vampire
	name = "ancient maille"
	desc = "A style of armor long out of use. Rests easy on the shoulders."
	icon_state = "vunder"
	sellprice = VALUE_IRON_ARMOR_UNUSUAL

	armor_class = AC_LIGHT
	armor = ARMOR_SCALE
	body_parts_covered = COVERAGE_ALL_BUT_LEGS
	prevent_crits = ALL_EXCEPT_BLUNT


//................ Blacksteel Plate ............... //
/obj/item/clothing/suit/roguetown/armor/plate/blkknight
	name = "blacksteel plate"
	body_parts_covered = COVERAGE_ALL_BUT_LEGS
	armor_class = AC_MEDIUM
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
	armor = ARMOR_PLATE_GOOD
	prevent_crits = ALL_CRITICAL_HITS_VAMP // Vampire armors don't protect against lashing, Castlevania reference
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
	armor = ARMOR_PLATE_GOOD

/obj/item/clothing/gloves/roguetown/chain/vampire
	name = "ancient ceremonial gloves"
	icon_state = "vgloves"
	smeltresult = /obj/item/ingot/steel

///////////////////////////////////////////////////////////////////
// Part of Kaizoku project that is still yet to be finished.     //
// The Demo usage is meant for Stonekeep and Warmongers.		 //
// If the usage for other sources is desired, before it finishes,//
// ask monochrome9090 for permission. Respect the artists's will.//
// If you want this quality content, COMMISSION me instead. 	 //
// For this project, requirements are low, and mostly lore-based.//
// I just do not desire for the Abyssariads to be butchered.	 //
///////////////////////////////////////////////////////////////////

/obj/item/clothing/suit/roguetown/armor/leather/vest/muneate //exists only for the drip.
	name = "muneate"
	desc = "A simple leather chest protector for casual archers. Barely protective- almost useless."
	icon_state = "muneate"
	item_state = "muneate"
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'

/obj/item/clothing/suit/roguetown/armor/leather/vest/muneate/random/Initialize()
	color = RANDOM_PEASANT_DYES
	..()

/obj/item/clothing/suit/roguetown/armor/leather/vest/muneate/kappa
	color = CLOTHING_FOREST_GREEN

/obj/item/clothing/suit/roguetown/armor/plate/nanbando
	name = "nanban-dou-sode"
	desc = "Abyssariad steel cuirass, refined and with additional sode for protection. Rare and prized by High-ranking zamurais, this design has been acquired from raided humen settlements."
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	icon_state = "nanbando"
	item_state = "nanbando"

/obj/item/clothing/suit/roguetown/armor/cuirass/nanbando
	name = "nanban-dou"
	desc = "The Abyssariad steel cuirass that only protects the chest. Relatively common among the ones from the lower Zamurai caste."
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	icon_state = "nanbandoc"
	item_state = "nanbandoc"

/obj/item/clothing/suit/roguetown/armor/plate/full/nanbando
	name = "nanban-do-gusoku"
	desc = "A complete set of abyssariad steel armor, refined and with additional auxiliary parts for protection."
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	icon_state = "nanbandofull"

/obj/item/clothing/suit/roguetown/armor/plate/full/nanbando/cursed/Initialize()
	. = ..()
	name = "soulbinded nanban-do-gusoku"
	ADD_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT)

/obj/item/clothing/suit/roguetown/armor/plate/full/nanbando/cursed/obj_break(damage_flag)
	. = ..()
	if(QDELETED(src))
		return
	qdel(src)

/obj/item/clothing/suit/roguetown/armor/chainmail/tatami
	name = "lamellae-tatami do"
	desc = "a foldable, lightweight armor for convenient motion and manufacturing ease. \
	It is made of rectangular steel lamellae sewn into chainmail and is a massforged armor. \
	Considered the backbone of abyssariad military armor, often used below mirror-armor and o-yoroi."
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	icon_state = "laminartatami"

/obj/item/clothing/suit/roguetown/armor/chainmail/iron/tatami
	name = "tatami karuta-gane"
	desc = "a foldable, lightweight armor for convenient motion and manufacturing ease. \
	It is made of lacquered, card-like iron squares sewn into a padded cloth or leather backing."
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	icon_state = "tatami"

/obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/kusari
	name = "kusari katabira"
	desc = "Or simply 'single-layer chainmail robe', this armor is made of riveted steel rings  \
	patched together with slim plates protecting elbows. The armor reaches down to the legs and arms."
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	icon_state = "kusari"
	item_state = "kusari"

/obj/item/clothing/suit/roguetown/armor/plate/mirror/iron
	name = "iron mirror armor"
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	desc = "Polished iron plates defines the frame of this armor with a metal disk at its center. This is the armor design used by the Islander army together with a kusari katabira."
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	icon_state = "imirrorarmor"
	max_integrity = 200
	armor = list("melee" = 80, "bullet" = 60, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	smeltresult = /obj/item/ingot/iron
	armor_class = AC_MEDIUM
	sellprice = 20

/obj/item/clothing/suit/roguetown/armor/plate/mirror
	name = "steel mirror armor"
	icon_state = "mirrorarmor"
	desc = "Polished steel plates defines the frame of this armor with a metal disk at its center. This is the armor design used by the Islander army together with a kusari katabira."
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	icon_state = "mirrorarmor"

/obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi //I did everything I could to fix this shit. I couldn't. So the entire 'colourscheme overlay' ordeal went to hell.
	name = "o-yoroi"
	desc = "Heavy-duty lamellar armor esteemed high-ranking zamurais on horseback or on land."
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	icon_state = "halfoyoroi"

/obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi/cursed/Initialize()
	. = ..()
	name = "soulbinded o-yoroi gusoku"
	ADD_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT)

/obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi/cursed/obj_break(damage_flag)
	. = ..()
	if(QDELETED(src))
		return
	qdel(src)

/obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi/royal/Initialize()
	. = ..()
	AddComponent(/datum/component/squeak, list('sound/foley/footsteps/armor/coatplates (1).ogg',\
												'sound/foley/footsteps/armor/coatplates (2).ogg',\
												'sound/foley/footsteps/armor/coatplates (3).ogg'), 100)

/obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi/royal/update_icon()
	cut_overlays()
	detail_tag = "_met"
	detail_color = GLOB.lordprimary
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi/captain/Initialize()
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src

/obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi/captain/lordcolor(primary,secondary)
	detail_tag = "_met"
	detail_color = primary
	update_icon()
	if(ismob(loc))
		var/mob/L = loc
		L.update_inv_armor()

/obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi/captain/Destroy()
	GLOB.lordcolor -= src
	return ..()

/obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi/oyoroigusoku
	name = "o-yoroi gusoku"
	desc = "Heavy-duty, complete set of lamellar armor esteemed by high-ranking zamurais on horseback or on land."
	icon_state = "oyoroi"
	body_parts_covered = CHEST|GROIN|VITALS|LEGS|ARMS

/obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi/oyoroigusoku/cursed/Initialize()
	. = ..()
	name = "soulbinded o-yoroi gusoku"
	ADD_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT)

/obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi/oyoroigusoku/cursed/obj_break(damage_flag)
	. = ..()
	if(QDELETED(src))
		return
	qdel(src)

/obj/item/clothing/suit/roguetown/armor/cuirass/sanmaido
	name = "san mai-do"
	desc = "A cheap cuirass with three main plates riveted together with cloth. Flexible and dynamic, integral for many poor footsoldiers"
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

/obj/item/clothing/suit/roguetown/armor/leather/hide/dustwalker
	name = "leather cavalry armor"
	desc = "The Khatag Teghelgah designed to be used by abyssariad light cavalry and horse archers on the heart of Fog Island."
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	icon_state = "arisan_khuyag"

/obj/item/clothing/suit/roguetown/armor/leather/splint/kikko //This one is more realistic than Studded Leather armor. A reminder that Studded leather armor is a misinterpretation of a Brigandine.
	name = "kikko jacket"
	desc = "A cheaper and lighter version of Kikko Tatami, a leather jacket with metal hexagon plates in a turtle-shell pattern."
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	icon_state = "kikko"
	adjustable = CAN_CADJUST

/obj/item/clothing/suit/roguetown/armor/leather/splint/kikko/eidolon
	color = CLOTHING_EIDOLON

/obj/item/clothing/suit/roguetown/armor/leather/splint/kikko/rich/Initialize()
	color = RANDOM_NOBLE_DYES
	..()

/obj/item/clothing/suit/roguetown/armor/leather/splint/kikko/AdjustClothes(mob/user)
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
	desc = "The main garment used by Ninjas and Kunoichis to blend into the night. Not viable during daylight, but it is easy to store anywhere, and any time."
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	icon_state = "shinobi"
	item_state = "shinobi"
	blocksound = SOFTHIT

/obj/item/clothing/suit/roguetown/armor/chainmail/rattan //New armor; Iron-to-steel tier.
	slot_flags = ITEM_SLOT_ARMOR
	name = "rattan armor"
	desc = "A flexible and durable full body coat made from oil-boiled rattan and layered iron wires. Used by LinYou Raiders, it can be easily repaired."
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	icon_state = "rattan"
	item_state = "rattan"
	sellprice = VALUE_IRON_ARMOR+10

	armor = ARMOR_MAILLE_IRON
	max_integrity = INTEGRITY_STANDARD
	prevent_crits = ALL_EXCEPT_BLUNT_AND_STAB
	sewrepair = TRUE //this armor's utility.

/obj/item/clothing/suit/roguetown/armor/leather/jacket/haori
	name = "haori"
	desc = "a traditional jacket meant to be worn over a kimono."
	icon_state = "haori"
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'

/obj/item/clothing/suit/roguetown/armor/leather/jacket/haori/random/Initialize()
	color = RANDOM_PEASANT_DYES
	..()

/obj/item/clothing/suit/roguetown/armor/leather/jacket/haori/dark
	color = CLOTHING_SOOT_BLACK

//New Rare Heartfelt equipment
/obj/item/clothing/suit/roguetown/armor/medium/surcoat/heartfelt/abyssariad
	name = "abyssariad kikko gusoku"
	desc = "The Heartfelt design reforged in the ways of Fog Islands to better supply quick-moving zamurai cavalry, replacing the heavier and costier O-Yoroi lamellar."
	body_parts_covered = CHEST|GROIN|VITALS|LEGS //does not protect the arms. Countering the Brigandine that protects the arms, but not legs.
	icon_state = "kikkoabyssal"
	item_state = "kikkoabyssal"
	sellprice = 65 //not unique.

/obj/item/clothing/suit/roguetown/armor/leather/vest/kaizoku
	name = "kaizoku's waitao"
	icon_state = "waitao_coat"
	color = null
	desc = "A silken coat of Heartfelt making used by the Abyssariad Kaizoku, those who brought the name of Fog Islands to the outsiders by accident. Or just artistic folk."
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	body_parts_covered = CHEST|VITALS|LEGS
	sellprice = 45

/obj/item/clothing/suit/roguetown/armor/brigandine/shanwenkai //I dislike overused armor in unique roles. so I just made an "Officer" armor based on the chinese actual officer armor. Brigadine.
	slot_flags = ITEM_SLOT_ARMOR
	name = "weeper-patterned championage armor" //This is the Shan Wen Kia armor, but the downwards 'Y' is upwards now, so I can't name it <mountain patterned armor>
	desc = "The ancient godwenkai, a heavy armor made with overlapping arrangement of armor plates, assembled with the symbol of the Weeping God. This is used by Abyssariad Champions who still lingers on this world, honoring the Weeper who fed Abyssor."
	icon_state = "shanwenkai"
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'

/obj/item/clothing/suit/roguetown/armor/brigandine/shanwenkai/update_icon()
	return

/obj/item/clothing/suit/roguetown/armor/gambeson/ruankai
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	name = "padded ruankai"
	desc = "made of layered cotton or silk, it is quilted together to absorb shock from blows to protect wearer as a cushioning layer. Enough to survive a horse's kick."
	icon_state = "ruankai"
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'

/obj/item/clothing/suit/roguetown/armor/gambeson/light/hitatare
	name = "yoroi hitatare"
	desc = "A traditional Abyssariad padded robe with wide sleeves, made to be worn beneath armor. It is comfortable and thick, but not very protective compared to a ruankai, but can be used all the time without raising suspicion."
	icon_state = "yoroihitatare"
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	var/picked = FALSE

/obj/item/clothing/suit/roguetown/armor/gambeson/light/hitatare/zamurai/proc/get_player_input()
	if(!ishuman(loc))
		return

	var/list/colors = list(
	"PURPLE"="#865c9c",
	"RED"="#933030",
	"BROWN"="#685542",
	"GREEN"="#79763f",
	"BLUE"="#395480",
	"YELLOW"="#b5b004",
	"TEAL"="#249589",
	"WHITE"="#ffffff",
	"ORANGE"="#b86f0c",
	"MAJENTA"="#962e5c")
	var/mob/living/carbon/human/L = loc
	var/choice = input(L, "Choose a color.", "ZAMURAI COLORPLEX") as anything in colors
	var/playerchoice = colors[choice]
	picked = TRUE
	detail_color = playerchoice
	update_icon()
	for(var/obj/item/clothing/V in L.get_equipped_items(FALSE))
		testing("clothes to color are [V]")
		if(V.colorgrenz)
			V.detail_color = playerchoice
			V.update_icon()
	L.regenerate_icons()

/obj/item/clothing/suit/roguetown/armor/gambeson/light/hitatare/zamurai/Initialize()
	. = ..()
	if(!picked)
		INVOKE_ASYNC(src, PROC_REF(get_player_input))

/obj/item/clothing/suit/roguetown/armor/gambeson/light/hitatare/zamurai/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

// Randomized color Hitatare
/obj/item/clothing/suit/roguetown/armor/gambeson/light/hitatare/random/Initialize()
	color = RANDOM_PEASANT_DYES
	..()

// Randomized color Hitatare
/obj/item/clothing/suit/roguetown/armor/gambeson/light/hitatare/rich/Initialize()
	color = RANDOM_NOBLE_DYES
	..()

// Ronin Hitatare
/obj/item/clothing/suit/roguetown/armor/gambeson/light/hitatare/ronin
	color = CLOTHING_SOOT_BLACK

// Eidolon Hitatare
/obj/item/clothing/suit/roguetown/armor/gambeson/light/hitatare/eidolon
	color = CLOTHING_EIDOLON

/obj/item/clothing/suit/roguetown/armor/gambeson/heavy/deelcoat
	name = "reinforced deel coat"
	desc = "A loose-fitting abyssariad tunic usually made with horse leather, traditionally used by the Dustwalkers. The dense padding greatly protects the user against blunt trauma."
	icon_state = "deel"
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'

/obj/item/clothing/suit/roguetown/armor/leather/splint/ninjakappa //same as studded leather armor
	name = "tribalistic bronze cuirass"
	desc = "A layered armor with oil-boiled leather reinforced with bronze plates sew into the fabric. Light and flexible, it is used by Undines who became part of underground shinobi operations to destroy illegal gangs, drugdealers and centers of prostitution."
	icon_state = "ninjakappa"
	item_state = "ninjakappa"
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'

/obj/item/clothing/suit/roguetown/armor/rare/myrmidon
	name = "myrmidon mingguang kai" // that's "明光铠", not the genshin character.
	desc = "Ocean-blessed overlapping steel plates joined by butchered demonhide threads and orichalcum infusion, \
	long purified with abyssor sigils and symbols of the Weeper. Each steel layer is engraved: \
	\"By the Heavenly Emperor's command. For the abyss against all odds.\""
	icon_state = "myrmidon"
	item_state = "myrmidon"
	allowed_race = list("abyssariad")
	sleevetype = null
	max_integrity = INTEGRITY_STRONGEST+100 //Chest + Pants - Everything is on a single armor. Breaks easier since it gets battered everywhere, so it requires more endurance.
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	body_parts_covered = CHEST|GROIN|ARMS|VITALS|LEGS //Pays off by not having other limbparts.

/obj/item/clothing/suit/roguetown/armor/ceramic
	name = "tribal coverings"
	desc = "A more well-designed armor made with sturdy animal bones. Suitable for tribals whom uses little mettalurgy."
	icon_state = "nacre_covering"
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	armor = list("melee" = 60, "bullet" = 50, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	body_parts_covered = CHEST|GROIN|VITALS
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_STAB) // Bones are ceramic-like. These are horrible against blunt.
	armor_class = AC_MEDIUM
	max_integrity = 150
	anvilrepair = null //You can't repair 'ceramic' armor. You will need to make a new armor instead.
	smeltresult = /obj/item/ash
	sewrepair = FALSE
	slot_flags = ITEM_SLOT_ARMOR

/obj/item/clothing/suit/roguetown/armor/ceramic/reinforced
	name = "marauder trollhunter armor"
	desc = "The heavy armor used by the tribalistic Undine marauder forces under the flag of Abyssariads from the Flag Islands. Made of ceramic-like material from lava forges."
	icon_state = "marauder_chest"
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_STAB) // Bones are ceramic-like. These are horrible against blunt.
	blade_dulling = DULLING_BASHCHOP
	body_parts_covered = CHEST|VITALS|ARMS|GROIN //Protects an acceptable large range of places for such relatively cost-y armor. I hope.
	armor = list("melee" = 60, "bullet" = 60, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = 250
	equip_delay_self = 40
	armor_class = AC_MEDIUM

/obj/item/clothing/suit/roguetown/armor/ceramic/light
	name = "bone coverings"
	desc = "An simple, primitive armor made of chiseled bones bound with fibers and sinews. Stronger than gambesons, but requires conquering tough dendor's creatures to make."
	icon = 'icons/roguetown/kaizoku/clothingicon/armor.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/armor.dmi'
	sleeved = 'icons/roguetown/kaizoku/helpers/sleeves_armor.dmi'
	armor = list("melee" = 40, "bullet" = 30, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	icon_state = "ivory_coverings"
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	body_parts_covered = CHEST|GROIN
	max_integrity = 100 //breaks quickly
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB) //Bones acts similar to ceramics, it will crack with blunt damage.
	armor_class = AC_LIGHT
