/datum/intent/spear/thrust
	name = "thrust"
	blade_class = BCLASS_STAB
	attack_verb = list("stabs")
	animname = "stab"
	icon_state = "instab"
	reach = 2
	chargetime = 1
	warnie = "mobwarning"
	hitsound = list('sound/combat/hits/bladed/genstab (1).ogg', 'sound/combat/hits/bladed/genstab (2).ogg', 'sound/combat/hits/bladed/genstab (3).ogg')
	penfactor = 50
	swingdelay = 1
	misscost = 5

/datum/intent/spear/bash
	name = "bash"
	blade_class = BCLASS_BLUNT
	icon_state = "inbash"
	attack_verb = list("bashes", "strikes")
	penfactor = 10
	damfactor = 0.8
	swingdelay = 1
	misscost = 5

/datum/intent/spear/cut
	name = "cut"
	blade_class = BCLASS_CUT
	attack_verb = list("cuts", "slashes")
	icon_state = "incut"
	damfactor = 0.8
	hitsound = list('sound/combat/hits/bladed/genslash (1).ogg', 'sound/combat/hits/bladed/genslash (2).ogg', 'sound/combat/hits/bladed/genslash (3).ogg')
	reach = 2
	swingdelay = 1
	misscost = 5

/obj/item/rogueweapon/woodstaff
	force = 10
	force_wielded = 15
	possible_item_intents = list(SPEAR_BASH)
	gripped_intents = list(SPEAR_BASH,/datum/intent/mace/smash/wood)
	name = "wooden staff"
	desc = ""
	icon_state = "woodstaff"
	icon = 'icons/roguetown/weapons/64.dmi'
	wlength = WLENGTH_LONG
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	blade_dulling = DULLING_BASHCHOP
	walking_stick = TRUE
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	max_blade_int = 120
	max_integrity = 200
	wdefense = 4
	bigboy = TRUE
	gripsprite = TRUE
	associated_skill = /datum/skill/combat/polearms

/obj/item/rogueweapon/woodstaff/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -6,"sy" = -1,"nx" = 8,"ny" = 0,"wx" = -4,"wy" = 0,"ex" = 2,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 32,"eturn" = -23,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 4,"sy" = -2,"nx" = -3,"ny" = -2,"wx" = -5,"wy" = -1,"ex" = 3,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)


/obj/item/rogueweapon/woodstaff/aries
	name = "staff of the shepherd"
	desc = ""
	force = 15
	force_wielded = 25
	possible_item_intents = list(SPEAR_BASH)
	gripped_intents = list(SPEAR_BASH,/datum/intent/mace/smash/wood)
	icon_state = "aries"
	icon = 'icons/roguetown/weapons/64.dmi'
	wlength = WLENGTH_LONG
	w_class = WEIGHT_CLASS_BULKY
	blade_dulling = DULLING_BASHCHOP
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	dropshrink = 0.6
	wdefense = 4
	bigboy = TRUE
	gripsprite = TRUE
	associated_skill = /datum/skill/combat/polearms

/obj/item/rogueweapon/woodstaff/aries/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -6,"sy" = -1,"nx" = 8,"ny" = 0,"wx" = -4,"wy" = 0,"ex" = 2,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 32,"eturn" = -23,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 4,"sy" = -2,"nx" = -3,"ny" = -2,"wx" = -5,"wy" = -1,"ex" = 3,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)


/obj/item/rogueweapon/spear
	force = 15
	force_wielded = 30
	possible_item_intents = list(SPEAR_THRUST, SPEAR_BASH) //bash is for nonlethal takedowns, only targets limbs
	gripped_intents = list(SPEAR_THRUST, SPEAR_CUT, SPEAR_BASH)
	name = "spear"
	desc = ""
	icon_state = "spear"
	icon = 'icons/roguetown/weapons/64.dmi'
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	gripsprite = TRUE
	wlength = WLENGTH_GREAT
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	max_blade_int = 100
	max_integrity = 450
	minstr = 8
	smeltresult = /obj/item/ingot/iron
	associated_skill = /datum/skill/combat/polearms
	dropshrink = 0.6
	blade_dulling = DULLING_BASHCHOP
	walking_stick = TRUE
	wdefense = 5
	thrown_bclass = BCLASS_STAB
	throwforce = 25

/obj/item/rogueweapon/spear/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -7,"sy" = 2,"nx" = 7,"ny" = 3,"wx" = -2,"wy" = 1,"ex" = 1,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 30,"eturn" = -30,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 5,"sy" = -3,"nx" = -5,"ny" = -2,"wx" = -5,"wy" = -1,"ex" = 3,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)

/obj/item/rogueweapon/spear/billhook
	name = "billhook"
	desc = ""
	icon_state = "billhook"
	force = 15
	force_wielded = 30
	possible_item_intents = list(SPEAR_THRUST, SPEAR_BASH) //bash is for nonlethal takedowns, only targets limbs
	gripped_intents = list(SPEAR_THRUST, SPEAR_CUT, /datum/intent/axe/chop, SPEAR_BASH)
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	gripsprite = TRUE
	wlength = WLENGTH_GREAT
	w_class = WEIGHT_CLASS_BULKY
	minstr = 8
	max_blade_int = 100
	max_integrity = 450
	smeltresult = /obj/item/ingot/steel
	associated_skill = /datum/skill/combat/polearms
	dropshrink = 0.6
	blade_dulling = DULLING_BASHCHOP
	walking_stick = TRUE
	wdefense = 5


/obj/item/rogueweapon/spear/stone
	force = 15
	force_wielded = 18
	name = "simple spear"
	icon_state = "stonespear"
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	gripsprite = TRUE
	wlength = WLENGTH_GREAT
	slot_flags = ITEM_SLOT_BACK
	minstr = 6
	max_blade_int = 50
	smeltresult = null
	associated_skill = /datum/skill/combat/polearms
	dropshrink = 0.6
	blade_dulling = DULLING_BASHCHOP
	walking_stick = TRUE
	wdefense = 4
	max_integrity = 120

/obj/item/rogueweapon/halberd
	force = 15
	force_wielded = 30
	possible_item_intents = list(SPEAR_THRUST, SPEAR_BASH) //bash is for nonlethal takedowns, only targets limbs
	gripped_intents = list(SPEAR_THRUST, SPEAR_CUT, /datum/intent/axe/chop, SPEAR_BASH)
	name = "halbert"
	desc = ""
	icon_state = "halberd"
	icon = 'icons/roguetown/weapons/64.dmi'
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	gripsprite = TRUE
	wlength = WLENGTH_GREAT
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	minstr = 8
	max_blade_int = 100
	max_integrity = 450
	smeltresult = /obj/item/ingot/steel
	associated_skill = /datum/skill/combat/polearms
	dropshrink = 0.6
	blade_dulling = DULLING_BASHCHOP
	walking_stick = TRUE
	wdefense = 5

/obj/item/rogueweapon/halberd/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -7,"sy" = 2,"nx" = 7,"ny" = 3,"wx" = -2,"wy" = 1,"ex" = 1,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 30,"eturn" = -30,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 5,"sy" = -3,"nx" = -5,"ny" = -2,"wx" = -5,"wy" = -1,"ex" = 3,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)


/obj/item/rogueweapon/halberd/bardiche
	name = "bardiche"
	desc = ""
	icon_state = "bardiche"
	smeltresult = /obj/item/ingot/iron
	max_blade_int = 300

/obj/item/rogueweapon/eaglebeak
	force = 15
	force_wielded = 30
	possible_item_intents = list(SPEAR_BASH, SPEAR_THRUST) //bash is for nonlethal takedowns, only targets limbs
	gripped_intents = list(SPEAR_BASH, SPEAR_THRUST, /datum/intent/mace/smash)
	name = "eagle's beak"
	desc = ""
	icon_state = "eaglebeak"
	icon = 'icons/roguetown/weapons/64.dmi'
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	gripsprite = TRUE
	wlength = WLENGTH_GREAT
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	minstr = 11
	smeltresult = /obj/item/ingot/steel
	associated_skill = /datum/skill/combat/polearms
	max_blade_int = 300
	dropshrink = 0.6
	blade_dulling = DULLING_BASHCHOP
	walking_stick = TRUE
	wdefense = 6

/obj/item/rogueweapon/eaglebeak/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -8,"sy" = 6,"nx" = 8,"ny" = 6,"wx" = -5,"wy" = 6,"ex" = 0,"ey" = 6,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 32,"eturn" = -32,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 5,"sy" = -2,"nx" = -5,"ny" = -2,"wx" = -5,"wy" = -2,"ex" = 5,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)


/obj/item/rogueweapon/eaglebeak/lucerne
	name = "lucerne"
	desc = ""
	icon_state = "polehammer"
	smeltresult = /obj/item/ingot/iron
	max_blade_int = 300

/obj/item/rogueweapon/greatsword
	force = 10
	force_wielded = 20
	possible_item_intents = list(/datum/intent/sword/chop,/datum/intent/sword/strike) //bash is for nonlethal takedowns, only targets limbs
	gripped_intents = list(/datum/intent/sword/cut/zwei, /datum/intent/sword/chop, /datum/intent/sword/thrust/zwei, /datum/intent/sword/strike)
	name = "northern greatsword"
	desc = "A huge blade, crafted by the Northern human empires. Takes a truly strong man to wield."
	icon_state = "gsw"
	icon = 'icons/roguetown/weapons/64.dmi'
	parrysound = "bladedlarge"
	swingsound = BLADEWOOSH_HUGE
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	gripsprite = TRUE
	wlength = WLENGTH_GREAT
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	thrown_bclass = BCLASS_CUT
	throwforce = 15
	minstr = 12
	smeltresult = /obj/item/ingot/steel
	associated_skill = /datum/skill/combat/swords
	max_blade_int = 100
	max_integrity = 300
	wdefense = 3

/obj/item/rogueweapon/greatsword/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -6,"sy" = 6,"nx" = 6,"ny" = 7,"wx" = 0,"wy" = 5,"ex" = -1,"ey" = 7,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -50,"sturn" = 40,"wturn" = 50,"eturn" = -50,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 9,"sy" = -4,"nx" = -7,"ny" = 1,"wx" = -9,"wy" = 2,"ex" = 10,"ey" = 2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 5,"sturn" = -190,"wturn" = -170,"eturn" = -10,"nflip" = 4,"sflip" = 4,"wflip" = 1,"eflip" = 0)
			if("onback")
				return list("shrink" = 0.6,"sx" = -1,"sy" = 3,"nx" = -1,"ny" = 2,"wx" = 3,"wy" = 4,"ex" = -1,"ey" = 5,"nturn" = 0,"sturn" = 0,"wturn" = 70,"eturn" = 20,"nflip" = 1,"sflip" = 1,"wflip" = 1,"eflip" = 1,"northabove" = 1,"southabove" = 0,"eastabove" = 0,"westabove" = 0)

/obj/item/rogueweapon/greatsword/flamberge
	name = "flamberge"
	desc = "Commonly known as a flame-bladed sword, this weapon has an undulating blade. It's wave-like form distributes force better, and is less likely to break on impact."
	icon_state = "flamberge"
	smeltresult = /obj/item/ingot/iron
	wdefense = 3

/obj/item/rogueweapon/greatsword/zwei
	name = "zweihander"
	desc = "Sometimes known as a doppelhander or beidhander, this weapon's size is so impressive that it's handling properties are more akin to that of a polearm than a sword."
	icon_state = "steelzwei"
	smeltresult = /obj/item/ingot/steel
	wdefense = 3

/datum/intent/sword/cut/zwei
	name = "cut"
	blade_class = BCLASS_CUT
	attack_verb = list("cuts", "slashes")
	icon_state = "incut"
	damfactor = 0.8
	hitsound = list('sound/combat/hits/bladed/genslash (1).ogg', 'sound/combat/hits/bladed/genslash (2).ogg', 'sound/combat/hits/bladed/genslash (3).ogg')
	reach = 1
	swingdelay = 1
	misscost = 5

/datum/intent/sword/thrust/zwei
    name = "thrust"
    blade_class = BCLASS_STAB
    attack_verb = list("stabs")
    animname = "stab"
    icon_state = "instab"
    reach = 1
    chargetime = 1
    warnie = "mobwarning"
    hitsound = list('sound/combat/hits/bladed/genstab (1).ogg', 'sound/combat/hits/bladed/genstab (2).ogg', 'sound/combat/hits/bladed/genstab (3).ogg')
    penfactor = 20
    swingdelay = 1
    misscost = 5

/obj/item/rogueweapon/greatsword/elfgsword
	force = 12
	force_wielded = 23
	name = "elven kriegsmesser"
	desc = "A huge, curved elven blade. It's metal is of a high quality, yet still light, crafted by the greatest elven bladesmiths."
	icon_state = "kriegsmesser"
	minstr = 10

// Copper Spear

/obj/item/rogueweapon/copperspear
	force = 10
	force_wielded = 15
	possible_item_intents = list(SPEAR_THRUST, SPEAR_BASH) //bash is for nonlethal takedowns, only targets limbs
	gripped_intents = list(SPEAR_THRUST, SPEAR_CUT, SPEAR_BASH)
	name = "copper spear"
	desc = "the walking stick of the poor fucking infantry."
	icon_state = "cspear"
	icon = 'icons/roguetown/weapons/64.dmi'
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	gripsprite = TRUE
	wlength = WLENGTH_GREAT
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = null
	max_blade_int = 70
	max_integrity = 130
	minstr = 7
	smeltresult = /obj/item/ingot/copper
	associated_skill = /datum/skill/combat/polearms
	dropshrink = 0.9
	blade_dulling = DULLING_BASHCHOP
	walking_stick = TRUE
	wdefense = 4
	thrown_bclass = BCLASS_STAB
	throwforce = 20

/obj/item/rogueweapon/copperspear/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.7,"sx" = -7,"sy" = 2,"nx" = 7,"ny" = 3,"wx" = -2,"wy" = 1,"ex" = 1,"ey" = 1,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -38,"sturn" = 37,"wturn" = 30,"eturn" = -30,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.7,"sx" = 5,"sy" = -3,"nx" = -5,"ny" = -2,"wx" = -5,"wy" = -1,"ex" = 3,"ey" = -2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 7,"sturn" = -7,"wturn" = 16,"eturn" = -22,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)