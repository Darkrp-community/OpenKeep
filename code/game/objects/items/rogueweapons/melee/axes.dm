/* AXES - Ok damage, kinda bad parry, ok AP for chops
==========================================================*/

/obj/item/rogueweapon/axe
	item_state = "axe"
	parrysound = "parrywood"
	swingsound = BLADEWOOSH_MED
	associated_skill = /datum/skill/combat/axesmaces
	possible_item_intents = list(/datum/intent/axe/cut)
	gripped_intents = list(/datum/intent/axe/chop)
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_BACK
	wlength = WLENGTH_NORMAL
	resistance_flags = FLAMMABLE // Weapon made mostly of wood
	axe_cut = 10	// bonus damage to trees

/*------------\
| Chop intent |	small AP, fewer protect vs this crit (more delimb?)
\------------*/
/datum/intent/axe/chop
	name = "chop"
	icon_state = "inchop"
	blade_class = BCLASS_CHOP
	attack_verb = list("chops", "hacks")
	animname = "chop"
	hitsound = list('sound/combat/hits/bladed/genchop (1).ogg', 'sound/combat/hits/bladed/genchop (2).ogg', 'sound/combat/hits/bladed/genchop (3).ogg')
	penfactor = AP_AXE_CHOP
	swingdelay = 1
	misscost = 5

/datum/intent/axe/chop/charged //Charged chop for the battleaxe and bearded axe.
	name = "overhead chop"
	penfactor = AP_HEAVYAXE_CHOP
	chargetime = 1

/datum/intent/axe/chop/great//unique long attack for axes, basically you swing really really hard, stills worse than a polearm like the bardiche or spear
	name = "great chop"
	damfactor = 1.2 //Charged attack.
	penfactor = AP_HEAVYAXE_CHOP
	reach = 2
	chargetime = 1


/*------------\
| Cut intent |	small AP
\------------*/
/datum/intent/axe/cut
	name = "cut"
	icon_state = "incut"
	blade_class = BCLASS_CUT
	attack_verb = list("cuts", "slashes")
	hitsound = list('sound/combat/hits/bladed/smallslash (1).ogg', 'sound/combat/hits/bladed/smallslash (2).ogg', 'sound/combat/hits/bladed/smallslash (3).ogg')
	animname = "cut"
	penfactor = AP_AXE_CUT
	swingdelay = 0
	misscost = 5

/*--------------\
| Impale intent |	big AP
\--------------*/
/datum/intent/axe/thrust
	name = "impale"
	blade_class = BCLASS_STAB
	attack_verb = list("stabs")
	animname = "stab"
	icon_state = "instab"
	reach = 2
	chargetime = 1
	warnie = "mobwarning"
	hitsound = list('sound/combat/hits/bladed/genstab (1).ogg', 'sound/combat/hits/bladed/genstab (2).ogg', 'sound/combat/hits/bladed/genstab (3).ogg')
	penfactor = AP_HEAVYAXE_STAB
	swingdelay = 1
	misscost = 10

/datum/intent/pick
	penfactor = AP_PICK //This is used in some actual weapons, so giving it some AP is likely wise. Hefty swing delay means it is impractical in combat.
	name = "pick"
	icon_state = "inpick"
	attack_verb = list("picks","impales")
	hitsound = list('sound/combat/hits/pick/genpick (1).ogg', 'sound/combat/hits/pick/genpick (2).ogg')
	animname = "strike"
	blade_class = BCLASS_PICK
	chargetime = 0
	swingdelay = 3

//................ Stone Axe ............... //
/obj/item/rogueweapon/axe/stone
	force = DAMAGE_BAD_AXE
	force_wielded = DAMAGE_BAD_AXE_WIELD
	name = "stone axe"
	desc = "Hewn wood, steadfast thread, a chipped stone. A recipe to bend nature to your will."
	icon_state = "stoneaxe"
	max_blade_int = 80
	max_integrity = 80
	wdefense = BAD_PARRY
	axe_cut = 15

	wbalance = EASY_TO_DODGE
	wlength = WLENGTH_SHORT
	smeltresult = /obj/item/ash //is a wooden log and a stone hammered in the top
	sellprice = 10

/obj/item/rogueweapon/axe/stone/getonmobprop(tag)
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -12,"sy" = -10,"nx" = 12,"ny" = -10,"wx" = -8,"wy" = -7,"ex" = 3,"ey" = -9,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 90,"sturn" = -90,"wturn" = -90,"eturn" = 90,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = -12,"sy" = 3,"nx" = 12,"ny" = 2,"wx" = -8,"wy" = 2,"ex" = 4,"ey" = 2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0)
	return ..()


//................ Battle Axe ............... //
/obj/item/rogueweapon/axe/battle
	force = DAMAGE_AXE
	force_wielded = DAMAGE_HEAVYAXE_WIELD
	name = "battle axe"
	desc = "A masterfully constructed ax, with additional weights in the form of ornate spikes and practical edges."
	icon_state = "battleaxe"
	max_blade_int = 500
	smeltresult = /obj/item/ingot/steel
	gripped_intents = list(/datum/intent/axe/cut, /datum/intent/axe/chop, /datum/intent/axe/chop/charged)
	parrysound = "sword"
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	minstr = 10 //meant to be a orc weapon or barbarian weapon
	max_blade_int = 200
	max_integrity = INTEGRITY_STRONG
	wdefense = AVERAGE_PARRY
	sellprice = 60

/obj/item/rogueweapon/axe/battle/getonmobprop(tag)
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -12,"sy" = -10,"nx" = 12,"ny" = -10,"wx" = -8,"wy" = -7,"ex" = 3,"ey" = -9,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 90,"sturn" = -90,"wturn" = -90,"eturn" = 90,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = -12,"sy" = 3,"nx" = 12,"ny" = 2,"wx" = -8,"wy" = 2,"ex" = 4,"ey" = 2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0)
	return ..()


//................ Iron Axe ............... //
/obj/item/rogueweapon/axe/iron
	force = DAMAGE_AXE
	force_wielded = DAMAGE_AXE_WIELD
	possible_item_intents = list(/datum/intent/axe/cut,/datum/intent/axe/chop)
	name = "iron axe"
	desc = "Tool, weapon, loyal iron companion."
	icon_state = "axe"
	max_blade_int = INTEGRITY_STRONG
	max_integrity = INTEGRITY_STANDARD
	smeltresult = /obj/item/ingot/iron
	gripped_intents = list(/datum/intent/axe/cut,/datum/intent/axe/chop)
	parrysound = "sword"
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	axe_cut = 18

	wdefense = MEDIOCRE_PARRY
	minstr = 6

	sellprice = 20


//................ Pick Axe ............... //
// Pickaxe-axe ; Technically both a tool and weapon, but it goes here due to weapon function.
// Same stats as steel axe, but refactored for pickaxe quality purposes.
/obj/item/rogueweapon/pick/paxe
	force = DAMAGE_AXE
	force_wielded = DAMAGE_AXE_WIELD
	name = "pickaxe"
	desc = "An odd mix of a pickaxe front and a hatchet blade back, capable of being switched between."
	icon = 'icons/roguetown/weapons/32.dmi'
	icon_state = "paxe"
	possible_item_intents = list(/datum/intent/axe/cut, /datum/intent/pick)
	gripped_intents = list(/datum/intent/axe/cut,/datum/intent/axe/chop)
	wlength = WLENGTH_NORMAL
	max_blade_int = INTEGRITY_STRONGEST
	max_integrity = INTEGRITY_STRONGEST
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_BACK
	associated_skill = /datum/skill/combat/axesmaces
	anvilrepair = /datum/skill/craft/weaponsmithing
	smeltresult = /obj/item/ingot/steel
	resistance_flags = FIRE_PROOF
	parrysound = list('sound/combat/parry/wood/parrywood (1).ogg', 'sound/combat/parry/wood/parrywood (2).ogg', 'sound/combat/parry/wood/parrywood (3).ogg')
	swingsound = BLADEWOOSH_MED
	wdefense = AVERAGE_PARRY
	minstr = 6
	sellprice = 50
	pickmult = 1.2 // It's a pick...
	axe_cut = 15 // ...and an Axe!
	toolspeed = 2


//................ Steel Axe ............... //
/obj/item/rogueweapon/axe/steel
	name = "steel axe"
	desc = "A bearded steel axe revered by dwarf, humen and elf alike. Performs much better than its iron counterpart."
	icon_state = "saxe"
	force = DAMAGE_AXE+3 //Superior as an one-handed option.
	force_wielded = DAMAGE_AXE_WIELD+2
	possible_item_intents = list(/datum/intent/axe/cut,/datum/intent/axe/chop,/datum/intent/axe/chop/charged)
	max_blade_int = INTEGRITY_STRONGEST
	max_integrity = INTEGRITY_STRONG
	smeltresult = /obj/item/ingot/steel
	resistance_flags = FIRE_PROOF
	gripped_intents = list(/datum/intent/axe/cut,/datum/intent/axe/chop)
	wdefense = AVERAGE_PARRY
	minstr = 6
	sellprice = 35
	axe_cut = 20

/obj/item/rogueweapon/axe/iron/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -12,"sy" = -10,"nx" = 12,"ny" = -10,"wx" = -8,"wy" = -7,"ex" = 3,"ey" = -9,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 90,"sturn" = -90,"wturn" = -90,"eturn" = 90,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = -12,"sy" = 3,"nx" = 12,"ny" = 2,"wx" = -8,"wy" = 2,"ex" = 4,"ey" = 2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0)


//................ Copper Hatchet ............... //
// Copper Hatchet
/obj/item/rogueweapon/axe/copper
	force = DAMAGE_BAD_AXE
	force_wielded = DAMAGE_BAD_AXE_WIELD

	name = "copper hatchet"
	desc = "A simple designed handaxe, an outdated weaponry from simpler times."
	icon_state = "chatchet"

	max_blade_int = 120
	max_integrity = INTEGRITY_WORST
	minstr = 6
	smeltresult = /obj/item/ingot/copper
	wlength = WLENGTH_SHORT
	pickup_sound = 'sound/foley/equip/rummaging-03.ogg'
	sellprice = 15
/obj/item/rogueweapon/axe/copper/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -12,"sy" = -10,"nx" = 12,"ny" = -10,"wx" = -8,"wy" = -7,"ex" = 3,"ey" = -9,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 90,"sturn" = -90,"wturn" = -90,"eturn" = 90,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = -12,"sy" = 3,"nx" = 12,"ny" = 2,"wx" = -8,"wy" = 2,"ex" = 4,"ey" = 2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0)


//................ Woodcutter Axe ............... //
/obj/item/rogueweapon/polearm/halberd/bardiche/woodcutter
	slot_flags = ITEM_SLOT_BACK
	bigboy = TRUE
	force = DAMAGE_AXE
	force_wielded = DAMAGE_HEAVYAXE_WIELD
	possible_item_intents = list(/datum/intent/axe/cut)
	name = "woodcutter axe"
	desc = "The tool, weapon, and loyal companion of woodcutters. Able to chop mighty trees and repel the threats of the forest."
	icon_state = "woodcutter"
	icon = 'icons/roguetown/weapons/64.dmi'
	max_blade_int = 200
	max_integrity = INTEGRITY_STRONG
	smeltresult = /obj/item/ingot/iron
	gripped_intents = list(/datum/intent/axe/cut,/datum/intent/axe/chop/great)
	parrysound = list('sound/combat/parry/wood/parrywood (1).ogg', 'sound/combat/parry/wood/parrywood (2).ogg', 'sound/combat/parry/wood/parrywood (3).ogg')
	swingsound = BLADEWOOSH_MED
	resistance_flags = FLAMMABLE // Weapon made mostly of wood
	associated_skill = /datum/skill/combat/axesmaces
	wdefense = AVERAGE_PARRY
	dropshrink = 0.95
	minstr = 8
	axe_cut = 15
	sellprice = 20

/obj/item/rogueweapon/woodchopper/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -7,"sy" = 2,"nx" = 7,"ny" = 3,"wx" = -2,"wy" = 1,"ex" = 1,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 30,"eturn" = -30,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 9,"sy" = -4,"nx" = -7,"ny" = 1,"wx" = -9,"wy" = 2,"ex" = 10,"ey" = 2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 5,"sturn" = -190,"wturn" = -170,"eturn" = -10,"nflip" = 4,"sflip" = 4,"wflip" = 1,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)


//................ War Axe ............... //
//attempting to fix transformation issues//it worked wohoo, don't touch it.
/obj/item/rogueweapon/polearm/halberd/bardiche/warcutter
	slot_flags = ITEM_SLOT_BACK
	force = DAMAGE_AXE
	force_wielded = DAMAGE_AXE_WIELD
	possible_item_intents = list(/datum/intent/axe/cut)
	name = "footman war axe"
	desc = "An enormous spiked axe. The ideal choice for a militiaman wanting to cut a fancy noble whoreson down to size."
	icon_state = "warcutter"
	icon = 'icons/roguetown/weapons/64.dmi'
	max_blade_int = 200
	max_integrity = INTEGRITY_STRONG
	bigboy = TRUE
	smeltresult = /obj/item/ingot/iron
	gripped_intents = list(/datum/intent/axe/cut,/datum/intent/axe/chop/great, /datum/intent/axe/thrust, /datum/intent/pick)
	parrysound = list('sound/combat/parry/wood/parrywood (1).ogg', 'sound/combat/parry/wood/parrywood (2).ogg', 'sound/combat/parry/wood/parrywood (3).ogg')
	swingsound = BLADEWOOSH_MED
	resistance_flags = FLAMMABLE // Weapon made mostly of wood
	associated_skill = /datum/skill/combat/axesmaces
	dropshrink = 0.95
	minstr = 10
	wdefense = 3
	axe_cut = 15
	sellprice = 20



/obj/item/rogueweapon/polearm/halberd/bardiche/warcutter/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -7,"sy" = 2,"nx" = 7,"ny" = 3,"wx" = -2,"wy" = 1,"ex" = 1,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 30,"eturn" = -30,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.7,"sx" = 5,"sy" = -2,"nx" = -5,"ny" = -2,"wx" = -5,"wy" = -2,"ex" = 5,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)



///////////////////////////////////////////////////////////////////
// Part of Kaizoku project that is still yet to be finished.     //
// The Demo usage is meant for Stonekeep and Warmongers.		 //
// If the usage for other sources is desired, before it finishes,//
// ask monochrome9090 for permission. Respect the artists's will.//
// If you want this quality content, COMMISSION me instead. 	 //
// For this project, requirements are low, and mostly lore-based.//
// I just do not desire for the Abyssariads to be butchered.	 //
///////////////////////////////////////////////////////////////////

/obj/item/rogueweapon/battle/ono
	slot_flags = ITEM_SLOT_HIP
	force = 15
	force_wielded = 25
	possible_item_intents = list(/datum/intent/axe/cut)
	name = "nagai ono"
	desc = "A battleaxe of Abyssariad design with a longer handle and shorter blade than its Humen counterpart. The increased leverage, reduced weight, and smaller striking area give it greater use against armor, while the longer handle makes it easier to parry with."
	icon_state = "ono"
	max_blade_int = 500
	smeltresult = /obj/item/ingot/steel
	gripped_intents = list(/datum/intent/axe/cut,/datum/intent/axe/battleaxe/chop/ono)
	parrysound = list('sound/combat/parry/wood/parrywood (1).ogg', 'sound/combat/parry/wood/parrywood (2).ogg', 'sound/combat/parry/wood/parrywood (3).ogg')
	swingsound = BLADEWOOSH_MED
	associated_skill = /datum/skill/combat/axesmaces
	minstr = 8
	icon = 'icons/roguetown/kaizoku/weapons/32.dmi'
	max_blade_int = 200
	max_integrity = 300
	wdefense = 6

/obj/item/rogueweapon/battle/getonmobprop(tag)
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -12,"sy" = -10,"nx" = 12,"ny" = -10,"wx" = -8,"wy" = -7,"ex" = 3,"ey" = -9,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 90,"sturn" = -90,"wturn" = -90,"eturn" = 90,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = -12,"sy" = 3,"nx" = 12,"ny" = 2,"wx" = -8,"wy" = 2,"ex" = 4,"ey" = 2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0)
	return ..()

/obj/item/rogueweapon/thrown/ono
	slot_flags = ITEM_SLOT_HIP
	force = 15
	possible_item_intents = list(/datum/intent/axe/cut, /datum/intent/axe/chop) //Added chop because the throwing Ono is still suitable for woodcutting. It's a hatchet.
	name = "nage ono"
	desc = "A well-balanced, short-handled Abyssariad axe designed for throwing. Traditionally used as a hunting weapon as an alternative to archery, as bow wood is scarce on the Fog Isles."
	icon = 'icons/roguetown/kaizoku/weapons/32.dmi'
	icon_state = "throwing_ono"
	max_blade_int = 500
	smeltresult = /obj/item/ash
	parrysound = list('sound/combat/parry/wood/parrywood (1).ogg', 'sound/combat/parry/wood/parrywood (2).ogg', 'sound/combat/parry/wood/parrywood (3).ogg')
	swingsound = BLADEWOOSH_MED
	wlength = WLENGTH_SHORT
	associated_skill = /datum/skill/combat/axesmaces
	minstr = 6
	max_blade_int = 200
	max_integrity = 300
	wdefense = 3
	throwforce = 40
	axe_cut = 5 //You'd be surprised to know that the axe head design for throwing is the same one for cutting wood, but lighter.
	embedding = list("embedded_pain_multiplier" = 3, "embed_chance" = 20, "embedded_fall_chance" = 60)

/obj/item/rogueweapon/woodcut/changfu
	name = "iron changfu"
	desc = "The tool of justice, hardwork and destruction, all in one."
	icon_state = "changfu"
	icon = 'icons/roguetown/kaizoku/weapons/32.dmi'
	wdefense = 4 //Battle designed.
	axe_cut = 3 //Not as viable for cutting as the other one, less than a hatchet in fact.

/datum/intent/axe/battleaxe/chop/ono //because actual battle axes don't have stupid large blades.
	name = "chop"
	icon_state = "inchop"
	blade_class = BCLASS_CHOP
	attack_verb = list("chops", "hacks")
	animname = "chop"
	hitsound = list('sound/combat/hits/bladed/genchop (1).ogg', 'sound/combat/hits/bladed/genchop (2).ogg', 'sound/combat/hits/bladed/genchop (3).ogg')
	penfactor = AP_HEAVYAXE_STAB
	swingdelay = 1
	misscost = 10
