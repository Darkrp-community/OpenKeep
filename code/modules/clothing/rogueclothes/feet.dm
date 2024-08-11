/obj/item/clothing/shoes/roguetown
	name = "shoes"
	icon = 'icons/roguetown/clothing/feet.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/feet.dmi'
	desc = "Typical shoes worn by almost anyone."
	gender = PLURAL
	slot_flags = ITEM_SLOT_SHOES
	body_parts_covered = FEET
	sleeved = 'icons/roguetown/clothing/onmob/feet.dmi'
	sleevetype = "leg"
	bloody_icon_state = "shoeblood"
	equip_delay_self = 30
	smeltresult = /obj/item/ash
	resistance_flags = FLAMMABLE
	sellprice = 5

/obj/item/clothing/shoes/roguetown/boots
	name = "dark boots"
	//dropshrink = 0.75
	color = "#d5c2aa"
	desc = "Boots made out of darker materials. Offers light protection against melee attacks."
	gender = PLURAL
	icon_state = "blackboots"
	item_state = "blackboots"
	armor = list("melee" = 15, "bullet" = 5, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	sellprice = 10

/obj/item/clothing/shoes/roguetown/nobleboot
	name = "noble boots"
	//dropshrink = 0.75
	color = "#d5c2aa"
	desc = "Fine dark leather boots. Offers light protection against melee attacks."
	gender = PLURAL
	icon_state = "nobleboots"
	item_state = "nobleboots"
	armor = list("melee" = 20, "bullet" = 15, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	sellprice = 10

/obj/item/clothing/shoes/roguetown/shortboots
	name = "shortboots"
	color = "#d5c2aa"
	desc = "A shorter format of boots worn by about anyone."
	gender = PLURAL
	icon_state = "shortboots"
	item_state = "shortboots"
	armor = list("melee" = 10, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/shoes/roguetown/ridingboots
	name = "riding boots"
	color = "#d5c2aa"
	desc = "Boots designed for riding a mount."
	armor = list("melee" = 20, "bullet" = 10, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	gender = PLURAL
	icon_state = "ridingboots"
	item_state = "ridingboots"
	sellprice = 10

///obj/item/clothing/shoes/roguetown/ridingboots/Initialize()
//	. = ..()
//	AddComponent(/datum/component/squeak, list('sound/foley/spurs (1).ogg'sound/blank.ogg'=1), 50)

/obj/item/clothing/shoes/roguetown/simpleshoes
	name = "shoes"
	desc = "Simple shoes worn by about anyone."
	gender = PLURAL
	icon_state = "simpleshoe"
	item_state = "simpleshoe"
	resistance_flags = null
	color = "#473a30"

/obj/item/clothing/shoes/roguetown/simpleshoes/white
	color = null


/obj/item/clothing/shoes/roguetown/simpleshoes/buckle
	name = "shoes"
	icon_state = "buckleshoes"
	color = null

/obj/item/clothing/shoes/roguetown/simpleshoes/lord
	name = "shoes"
	desc = "Shoes typically worn by the King himself."
	gender = PLURAL
	icon_state = "simpleshoe"
	item_state = "simpleshoe"
	resistance_flags = null
	color = "#cbcac9"
	sellprice = 20

/obj/item/clothing/shoes/roguetown/gladiator
	name = "leather sandals"
	desc = "Open design sandals made from sturdy leather. Can be typically seen worn by gladiators."
	gender = PLURAL
	icon_state = "gladiator"
	item_state = "gladiator"

/obj/item/clothing/shoes/roguetown/sandals
	name = "sandals"
	desc = "Standard sandals."
	gender = PLURAL
	icon_state = "sandals"
	item_state = "sandals"

/obj/item/clothing/shoes/roguetown/hoplite
	name = "ancient sandals"
	desc = "Worn sandals lined with bronze, ready to march ever onwards."
	icon_state = "aasimarfeet"
	item_state = "aasimarfeet"
	sellprice = 20

/obj/item/clothing/shoes/roguetown/shalal
	name = "babouche"
	desc = "Leather slippers of zybantean origin."
	gender = PLURAL
	icon_state = "shalal"
	item_state = "shalal"
	sellprice = 15

/obj/item/clothing/shoes/roguetown/tribal
	name = "tribal shoes"
	desc = "Haphazardly-made slippers of creecher leather worn by primitives, or those who don't care about fashion and just want to protect their feet."
	icon_state = "tribalshoes"
	item_state = "tribalshoes"
	sellprice = 3

/obj/item/clothing/shoes/roguetown/boots/armor
	name = "plated boots"
	desc = "Armored boots made from steel offering heavy protection against both melee and ranged attacks."
	body_parts_covered = FEET
	icon_state = "armorboots"
	item_state = "armorboots"
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	color = null
	blocksound = PLATEHIT
	armor = list("melee" = 100, "bullet" = 80, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = 500
	armor_class = ARMOR_CLASS_HEAVY
	anvilrepair = /datum/skill/craft/armorsmithing
	resistance_flags = FIRE_PROOF
	sellprice = 25

/obj/item/clothing/shoes/roguetown/boots/armor/light
	name = "light plate boots"
	icon_state = "soldierboots"
	item_state = "soldierboots"
	desc = "Lightly armored boots made from iron offering protection against both melee and ranged attacks."
	armor = list("melee" = 80, "bullet" = 60, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = 250
	armor_class = ARMOR_CLASS_MEDIUM
	sellprice = 20

/obj/item/clothing/shoes/roguetown/boots/leather
	name = "leather boots"
	//dropshrink = 0.75
	desc = "Boots made out of sturdy leather. Providing light protection against melee attacks."
	gender = PLURAL
	icon_state = "leatherboots"
	item_state = "leatherboots"
	armor = list("melee" = 20, "bullet" = 10, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	resistance_flags = FLAMMABLE
	sellprice = 10

/obj/item/clothing/shoes/roguetown/jester
	name = "funny shoes"
	desc = "Shoes typically worn by a Jester."
	icon_state = "jestershoes"
	resistance_flags = null
	sellprice = 10

/obj/item/clothing/shoes/roguetown/grenzelhoft
	name = "grenzelhoft boots"
	icon_state = "grenzelboots"
	item_state = "grenzelboots"
	sleeved = 'icons/roguetown/clothing/onmob/helpers/stonekeep_merc.dmi'
	armor = list("melee" = 25, "bullet" = 15, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	sellprice = 20

/obj/item/clothing/shoes/roguetown/boots/rare
	icon = 'icons/roguetown/topadd/takyon/Racial_Armour.dmi'
	mob_overlay_icon = 'icons/roguetown/topadd/takyon/onmob_racial.dmi'
	sleeved = 'icons/roguetown/topadd/takyon/onmob_racial.dmi'
	sleevetype = null
	resistance_flags = FIRE_PROOF // All of these are plated
	anvilrepair = /datum/skill/craft/armorsmithing
	armor = list("melee" = 100, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	sellprice = 30

/obj/item/clothing/shoes/roguetown/boots/rare/elfplate
	name = "dark elvish plated boots"
	desc = "Bizzarrely shaped boots of exquisite dark elven craftsmanship, forged from steel alloyed in ways unbeknownst to every other race."
	body_parts_covered = FEET
	icon_state = "elfshoes"
	item_state = "elfshoes"
	allowed_race = list("elf", "half-elf", "dark elf")
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	color = null
	blocksound = PLATEHIT

/obj/item/clothing/shoes/roguetown/boots/rare/elfplate/welfplate
	name = "elvish plated boots"
	desc = "Bizzarrely shaped boots of exquisite elven craftsmanship, forged from steel alloyed in ways unbeknownst to every other race."
	icon_state = "welfshoes"
	item_state = "welfshoes"

/obj/item/clothing/shoes/roguetown/boots/rare/elfplate/welfplate
	name = "elvish plated boots"
	icon_state = "welfshoes"
	item_state = "welfshoes"

/obj/item/clothing/shoes/roguetown/boots/rare/dwarfplate
	name = "decorated dwarven plate boots"
	allowed_race = list("dwarf")
	allowed_sex = list(MALE, FEMALE)
	desc = "Laced with golden bands, these dwarven plated boots glitter with glory as they are used to kick enemy's shins."
	body_parts_covered = FEET|LEGS
	icon_state = "dwarfshoe"
	item_state = "dwarfshoe"
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	color = null
	blocksound = PLATEHIT

/obj/item/clothing/shoes/roguetown/boots/rare/grenzelplate
	name = "grenzelhoft \"Elvenbane\" sabatons"
	allowed_race = list("human")
	allowed_sex = list(MALE)
	desc = "The sabatons that march to the tune of a glorious nation. It is said that the boots \
			are gilded with the tears of once native elves of the Grenzeholft lands, \
			eradicated via humen conquest."
	body_parts_covered = FEET|LEGS
	icon_state = "human_swordshoes"
	item_state = "human_swordshoes"
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	color = null
	blocksound = PLATEHIT

/obj/item/clothing/shoes/roguetown/boots/rare/zybanplate
	name = "zybantean segmented plate boots"
	allowed_race = list("human")
	allowed_sex = list(MALE)
	desc = "The segmented plate boots are a recent alteration to the Zybantu Elite, \
			many old warriors decorate their own by tieing ribbons and other knick-knacks \
			as a homage to the colorful socks they wore in simpler times."
	body_parts_covered = FEET|LEGS
	icon_state = "human_spearshoe"
	item_state = "human_spearshoe"
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	color = null
	blocksound = PLATEHIT
