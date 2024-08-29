// Sword base
/obj/item/rogueweapon/sword
	slot_flags = ITEM_SLOT_HIP
	force = 20
	force_wielded = 25
	possible_item_intents = list(/datum/intent/sword/cut, /datum/intent/sword/thrust)
	gripped_intents = list(/datum/intent/sword/cut, /datum/intent/sword/thrust)
	name = "sword"
	desc = "A trustworthy blade design, the first dedicated tool of war since before the age of history."
	icon_state = "sword1"
	icon = 'icons/roguetown/weapons/32.dmi'
	lefthand_file = 'icons/mob/inhands/weapons/rogue_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/rogue_righthand.dmi'
	parrysound = "bladedmedium"
	swingsound = BLADEWOOSH_MED
	associated_skill = /datum/skill/combat/swords
	max_blade_int = 300
	max_integrity = 500
	wlength = WLENGTH_NORMAL
	w_class = WEIGHT_CLASS_BULKY
	pickup_sound = 'sound/foley/equip/swordlarge1.ogg'
	flags_1 = CONDUCT_1
	throwforce = 10
	thrown_bclass = BCLASS_CUT
	//dropshrink = 0.75
	smeltresult = /obj/item/ingot/steel
	minstr = 7
	sellprice = 30
	wdefense = 4

/obj/item/rogueweapon/sword/Initialize()
	. = ..()
	if(icon_state == "sword1")
		icon_state = "sword[rand(1,3)]"

/obj/item/rogueweapon/sword/decorated
	icon_state = "decsword1"
	sellprice = 140

/obj/item/rogueweapon/sword/decorated/Initialize()
	. = ..()
	if(icon_state == "decsword1")
		icon_state = "decsword[rand(1,3)]"

/obj/item/rogueweapon/sword/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -10,"sy" = -8,"nx" = 13,"ny" = -8,"wx" = -8,"wy" = -7,"ex" = 7,"ey" = -8,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 90,"sturn" = -90,"wturn" = -80,"eturn" = 81,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 3,"sy" = 4,"nx" = -1,"ny" = 4,"wx" = -8,"wy" = 3,"ex" = 7,"ey" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 15,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.5,"sx" = -4,"sy" = -6,"nx" = 5,"ny" = -6,"wx" = 0,"wy" = -6,"ex" = -1,"ey" = -6,"nturn" = 100,"sturn" = 156,"wturn" = 90,"eturn" = 180,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)


/datum/intent/sword/cut
	name = "strike"
	icon_state = "incut"
	attack_verb = list("cuts", "slashes")
	animname = "cut"
	blade_class = BCLASS_CUT
	hitsound = list('sound/combat/hits/bladed/genslash (1).ogg', 'sound/combat/hits/bladed/genslash (2).ogg', 'sound/combat/hits/bladed/genslash (3).ogg')
	misscost = 5

/datum/intent/sword/thrust
	name = "stab"
	icon_state = "instab"
	attack_verb = list("stabs")
	animname = "stab"
	blade_class = BCLASS_STAB
	hitsound = list('sound/combat/hits/bladed/genstab (1).ogg', 'sound/combat/hits/bladed/genstab (2).ogg', 'sound/combat/hits/bladed/genstab (3).ogg')
	penfactor = 20
	misscost = 5

//Basic silver sword
/obj/item/rogueweapon/sword/silver
	name = "silver sword"
	desc = "A simple silver sword with an edge that gleams in moonlight."
	icon_state = "sword_s"
	minstr = 6
	force = 23 // .9 of steel
	force_wielded = 20
	smeltresult = /obj/item/ingot/silver
	max_blade_int = 240 // .8 of steel
	max_integrity = 300 // .8 of steel
	sellprice = 45
	var/last_used = 0

/obj/item/rogueweapon/sword/silver/pickup(mob/user)
	. = ..()
	var/mob/living/carbon/human/H = user
	if(ishuman(H))
		if(H.mind?.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			to_chat(H, "<span class='userdanger'>I can't pick up the silver, it is my BANE!</span>")
			H.Knockdown(20)
			H.adjustFireLoss(60)
			H.Paralyze(20)
			H.fire_act(1,5)
		if(H.mind?.has_antag_datum(/datum/antagonist/vampirelord/))
			var/datum/antagonist/vampirelord/V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
			if(V_lord.vamplevel < 4 && !H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
				to_chat(H, "<span class='userdanger'>I can't pick up the silver, it is my BANE!</span>")
				H.Knockdown(10)
				H.Paralyze(10)

/obj/item/rogueweapon/sword/silver/mob_can_equip(mob/living/M, mob/living/equipper, slot, disable_warning = FALSE, bypass_equip_delay_self = FALSE)
	. = ..()
	if(ishuman(M))
		var/datum/antagonist/vampirelord/V_lord = FALSE
		var/mob/living/carbon/human/H = M
		if(H.mind?.has_antag_datum(/datum/antagonist/vampirelord))
			V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
		if(H.mind?.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			H.Knockdown(20)
			H.adjustFireLoss(60)
			H.Paralyze(20)
			H.fire_act(1,5)
		if(V_lord)
			if(V_lord.vamplevel < 4 && !H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
				H.Knockdown(10)
				H.Paralyze(10)

/obj/item/rogueweapon/sword/silver/funny_attack_effects(mob/living/target, mob/living/user = usr, nodmg)
	if(world.time < src.last_used + 100)
		to_chat(user, "<span class='notice'>The silver effect is on cooldown.</span>")
		return



	. = ..()
	if(ishuman(target))
		var/mob/living/carbon/human/s_user = user
		var/mob/living/carbon/human/H = target
		var/datum/antagonist/vampirelord/lesser/V = FALSE
		if(H.mind?.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			V =  H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser)
		var/datum/antagonist/vampirelord/V_lord = FALSE
		if(H.mind.has_antag_datum(/datum/antagonist/vampirelord/))
			V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
		if(V)
			if(V.disguised)
				H.Stun(20)
				H.visible_message("<font color='white'>The silver weapon manifests the [H] curse!</font>")
				to_chat(H, "<span class='userdanger'>I'm hit by my BANE!</span>")
				H.adjustFireLoss(30)
				H.Paralyze(20)
				H.fire_act(1,4)
				H.apply_status_effect(/datum/status_effect/debuff/silver_curse)
				src.last_used = world.time
			else
				H.Stun(20)
				to_chat(H, "<span class='userdanger'>I'm hit by my BANE!</span>")
				H.adjustFireLoss(30)
				H.Paralyze(20)
				H.fire_act(1,4)
				H.apply_status_effect(/datum/status_effect/debuff/silver_curse)
				src.last_used = world.time
		if(V_lord)
			if(V_lord.vamplevel < 4 && !V)
				H.Stun(10)
				to_chat(H, "<span class='userdanger'>I'm hit by my BANE!</span>")
				H.adjustFireLoss(25)
				H.Paralyze(10)
				H.fire_act(1,4)
				src.last_used = world.time
			if(V_lord.vamplevel == 4 && !V)
				s_user.Stun(10)
				s_user.Paralyze(10)
				to_chat(s_user, "<font color='red'> The silver weapon fails!</font>")
				H.visible_message(H, "<span class='userdanger'>This feeble metal can't hurt me, I HAVE TRANSCENDED!</span>")
// Long Swords
/obj/item/rogueweapon/sword/long
	force = 18
	force_wielded = 28
	possible_item_intents = list(/datum/intent/sword/cut, /datum/intent/sword/thrust, /datum/intent/sword/strike)
	gripped_intents = list(/datum/intent/sword/cut, /datum/intent/sword/thrust, /datum/intent/sword/strike, /datum/intent/sword/chop)
	icon_state = "longsword"
	icon = 'icons/roguetown/weapons/64.dmi'
	item_state = "longsword"
	lefthand_file = 'icons/mob/inhands/weapons/roguebig_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/roguebig_righthand.dmi'
	name = "longsword"
	desc = "A long hand-and-a-half blade, wielded by the virtuous and vile alike."
	parrysound = "bladedmedium"
	swingsound = BLADEWOOSH_LARGE
	pickup_sound = 'sound/foley/equip/swordlarge2.ogg'
	bigboy = 1
	max_blade_int = 300
	max_integrity = 500
	wlength = WLENGTH_LONG
	gripsprite = TRUE
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	associated_skill = /datum/skill/combat/swords
	throwforce = 15
	thrown_bclass = BCLASS_CUT
	slot_flags = ITEM_SLOT_BACK|ITEM_SLOT_HIP
	dropshrink = 0.75
	smeltresult = /obj/item/ingot/steel
	wbalance = -1
	sellprice = 60

/obj/item/rogueweapon/sword/long/death
	color = CLOTHING_BLACK

/obj/item/rogueweapon/sword/long/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen") return list("shrink" = 0.5,"sx" = -14,"sy" = -8,"nx" = 15,"ny" = -7,"wx" = -10,"wy" = -5,"ex" = 7,"ey" = -6,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -13,"sturn" = 110,"wturn" = -60,"eturn" = -30,"nflip" = 1,"sflip" = 1,"wflip" = 8,"eflip" = 1)
			if("onback") return list("shrink" = 0.5,"sx" = -1,"sy" = 2,"nx" = 0,"ny" = 2,"wx" = 2,"wy" = 1,"ex" = 0,"ey" = 1,"nturn" = 0,"sturn" = 0,"wturn" = 70,"eturn" = 15,"nflip" = 1,"sflip" = 1,"wflip" = 1,"eflip" = 1,"northabove" = 1,"southabove" = 0,"eastabove" = 0,"westabove" = 0)
			if("wielded") return list("shrink" = 0.6,"sx" = 6,"sy" = -2,"nx" = -4,"ny" = 2,"wx" = -8,"wy" = -1,"ex" = 8,"ey" = 3,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 15,"sturn" = -200,"wturn" = -160,"eturn" = -25,"nflip" = 8,"sflip" = 8,"wflip" = 0,"eflip" = 0)
			if("onbelt") return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/rogueweapon/sword/long/heirloom
	force = 15
	force_wielded = 25 // Old blade, a relic mostly
	possible_item_intents = list(/datum/intent/sword/cut, /datum/intent/sword/thrust, /datum/intent/sword/strike)
	gripped_intents = list(/datum/intent/sword/cut, /datum/intent/longsword/thrust, /datum/intent/sword/strike, /datum/intent/longsword/chop)
	icon_state = "heirloom"
	icon = 'icons/roguetown/weapons/64.dmi'
	item_state = "longsword"
	lefthand_file = 'icons/mob/inhands/weapons/roguebig_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/roguebig_righthand.dmi'
	name = "old sword"
	desc = "An old steel sword with a heraldic green leather grip, mouldered by years of neglect."
	parrysound = "bladedmedium"
	swingsound = BLADEWOOSH_LARGE
	pickup_sound = 'sound/foley/equip/swordlarge2.ogg'
	bigboy = 1
	max_blade_int = 180 // Neglected, unused
	max_integrity = 300
	wlength = WLENGTH_LONG
	gripsprite = TRUE
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	associated_skill = /datum/skill/combat/swords
	throwforce = 15
	thrown_bclass = BCLASS_CUT
	slot_flags = ITEM_SLOT_BACK|ITEM_SLOT_HIP
	dropshrink = 0.75
	smeltresult = /obj/item/ingot/steel
	sellprice = 45 // Old and chipped

/obj/item/rogueweapon/sword/long/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen") return list("shrink" = 0.5,"sx" = -14,"sy" = -8,"nx" = 15,"ny" = -7,"wx" = -10,"wy" = -5,"ex" = 7,"ey" = -6,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -13,"sturn" = 110,"wturn" = -60,"eturn" = -30,"nflip" = 1,"sflip" = 1,"wflip" = 8,"eflip" = 1)
			if("onback") return list("shrink" = 0.5,"sx" = -1,"sy" = 2,"nx" = 0,"ny" = 2,"wx" = 2,"wy" = 1,"ex" = 0,"ey" = 1,"nturn" = 0,"sturn" = 0,"wturn" = 70,"eturn" = 15,"nflip" = 1,"sflip" = 1,"wflip" = 1,"eflip" = 1,"northabove" = 1,"southabove" = 0,"eastabove" = 0,"westabove" = 0)
			if("wielded") return list("shrink" = 0.6,"sx" = 6,"sy" = -2,"nx" = -4,"ny" = 2,"wx" = -8,"wy" = -1,"ex" = 8,"ey" = 3,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 15,"sturn" = -200,"wturn" = -160,"eturn" = -25,"nflip" = 8,"sflip" = 8,"wflip" = 0,"eflip" = 0)
			if("onbelt") return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

// Repurposing this unused sword for the Paladin job as a heavy counter against vampires.
/obj/item/rogueweapon/sword/long/judgement
	force = 15
	force_wielded = 30
	possible_item_intents = list(/datum/intent/sword/cut, /datum/intent/sword/thrust, /datum/intent/sword/strike)
	gripped_intents = list(/datum/intent/sword/cut, /datum/intent/longsword/thrust, /datum/intent/sword/strike, /datum/intent/longsword/chop)
	icon_state = "judgement"
	icon = 'icons/roguetown/weapons/64.dmi'
	item_state = "judgement"
	lefthand_file = 'icons/mob/inhands/weapons/roguebig_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/roguebig_righthand.dmi'
	name = "judgement"
	desc = "A sword with a silvered grip, a jeweled hilt and a honed blade; a design fit for nobility."
	parrysound = "bladedmedium"
	swingsound = BLADEWOOSH_LARGE
	pickup_sound = 'sound/foley/equip/swordlarge2.ogg'
	bigboy = 1
	wlength = WLENGTH_LONG
	gripsprite = TRUE
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	associated_skill = /datum/skill/combat/swords
	throwforce = 15
	thrown_bclass = BCLASS_CUT
	slot_flags = ITEM_SLOT_BACK|ITEM_SLOT_HIP
	dropshrink = 0.75
	smeltresult = /obj/item/ingot/steel
	sellprice = 363
	static_price = TRUE
	var/last_used = 0

/obj/item/rogueweapon/sword/long/judgement/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen") return list("shrink" = 0.5,"sx" = -14,"sy" = -8,"nx" = 15,"ny" = -7,"wx" = -10,"wy" = -5,"ex" = 7,"ey" = -6,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -13,"sturn" = 110,"wturn" = -60,"eturn" = -30,"nflip" = 1,"sflip" = 1,"wflip" = 8,"eflip" = 1)
			if("onback") return list("shrink" = 0.5,"sx" = -1,"sy" = 2,"nx" = 0,"ny" = 2,"wx" = 2,"wy" = 1,"ex" = 0,"ey" = 1,"nturn" = 0,"sturn" = 0,"wturn" = 70,"eturn" = 15,"nflip" = 1,"sflip" = 1,"wflip" = 1,"eflip" = 1,"northabove" = 1,"southabove" = 0,"eastabove" = 0,"westabove" = 0)
			if("wielded") return list("shrink" = 0.4,"sx" = 3,"sy" = 4,"nx" = -1,"ny" = 4,"wx" = -8,"wy" = 3,"ex" = 7,"ey" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 15,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt") return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/rogueweapon/sword/long/judgement/pickup(mob/user)
	. = ..()
	var/mob/living/carbon/human/H = user
	if(ishuman(H))
		if(H.mind?.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			to_chat(H, "<span class='userdanger'>I can't pick up the silver, it is my BANE!</span>")
			H.Knockdown(30)
			H.adjustFireLoss(60)
			H.Paralyze(30)
			H.fire_act(1,5)
		if(H.mind?.has_antag_datum(/datum/antagonist/vampirelord/))
			var/datum/antagonist/vampirelord/V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
			if(V_lord.vamplevel < 4 && !H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
				to_chat(H, "<span class='userdanger'>I can't pick up the silver, it is my BANE!</span>")
				H.Knockdown(10)
				H.Paralyze(10)

/obj/item/rogueweapon/sword/long/judgement/mob_can_equip(mob/living/M, mob/living/equipper, slot, disable_warning = FALSE, bypass_equip_delay_self = FALSE)
	. = ..()
	if(ishuman(M))
		var/datum/antagonist/vampirelord/V_lord = FALSE
		var/mob/living/carbon/human/H = M
		if(H.mind?.has_antag_datum(/datum/antagonist/vampirelord))
			V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
		if(H.mind?.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			to_chat(H, "<span class='userdanger'>I cannot equip this, it is made of my BANE!</span>")
			H.Knockdown(20)
			H.adjustFireLoss(60)
			H.Paralyze(20)
			H.fire_act(1,5)
		if(V_lord)
			if(V_lord.vamplevel < 4 && !H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
				to_chat(H, "<span class='userdanger'>I cannot equip this, it is made of my BANE!</span>")
				H.Knockdown(10)
				H.Paralyze(10)
			else
				if(prob(25))
					H.fire_act(1,3)

/obj/item/rogueweapon/sword/long/judgement/funny_attack_effects(mob/living/target, mob/living/user = usr, nodmg)
	if(world.time < src.last_used + 120)
		to_chat(user, "<span class='notice'>The silver effect is on cooldown.</span>")
		return

	. = ..()
	if(ishuman(target))
		var/mob/living/carbon/human/s_user = user
		var/mob/living/carbon/human/H = target
		var/datum/antagonist/vampirelord/lesser/V = FALSE
		if(H.mind?.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			V = H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser)
		var/datum/antagonist/vampirelord/V_lord = FALSE
		if(H.mind.has_antag_datum(/datum/antagonist/vampirelord/))
			V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
		if(V)
			if(V.disguised)
				H.Stun(30)
				H.visible_message("<font color='white'>The silver weapon undoes [H]'s wicked disguise!</font>")
				to_chat(H, "<span class='userdanger'>I'm hit by my BANE!</span>")
				H.adjustFireLoss(60)
				H.Paralyze(30)
				H.fire_act(1,5)
				H.apply_status_effect(/datum/status_effect/debuff/silver_curse/greater)
				src.last_used = world.time
			else
				H.Stun(30)
				to_chat(H, "<span class='userdanger'>I'm hit by my BANE!</span>")
				H.adjustFireLoss(60)
				H.Paralyze(30)
				H.fire_act(1,5)
				H.apply_status_effect(/datum/status_effect/debuff/silver_curse/greater)
				src.last_used = world.time
		if(V_lord)
			if(V_lord.vamplevel < 4 && !V)
				H.Stun(20)
				to_chat(H, "<span class='userdanger'>I'm hit by my BANE!</span>")
				H.adjustFireLoss(30)
				H.Paralyze(20)
				H.fire_act(1,4)
				H.apply_status_effect(/datum/status_effect/debuff/silver_curse) // Lesser curse applied still
				src.last_used = world.time
			if(V_lord.vamplevel == 4 && !V)
				if(prob(25))
					H.fire_act(1,3)
				to_chat(s_user, "<font color='red'> The silver weapon barely works against such an abomination!</font>")
				H.visible_message(H, "<span class='userdanger'>This feeble metal can't stop me, I HAVE TRANSCENDED!</span>")

/obj/item/rogueweapon/sword/long/vlord
	force = 18
	force_wielded = 30
	possible_item_intents = list(/datum/intent/sword/cut, /datum/intent/sword/thrust, /datum/intent/sword/strike)
	gripped_intents = list(/datum/intent/sword/cut, /datum/intent/longsword/thrust, /datum/intent/sword/strike, /datum/intent/longsword/chop)
	icon_state = "vlord"
	icon = 'icons/roguetown/weapons/64.dmi'
	item_state = "vlord"
	lefthand_file = 'icons/mob/inhands/weapons/roguebig_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/roguebig_righthand.dmi'
	name = "Jaded Fang"
	desc = "An ancestral long blade with an ominous glow, serrated with barbs along it's edges. Stained with a strange green tint."
	parrysound = "bladedmedium"
	swingsound = BLADEWOOSH_LARGE
	pickup_sound = 'sound/foley/equip/swordlarge2.ogg'
	bigboy = 1
	wlength = WLENGTH_LONG
	gripsprite = TRUE
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	associated_skill = /datum/skill/combat/swords
	throwforce = 15
	thrown_bclass = BCLASS_CUT
	slot_flags = ITEM_SLOT_BACK|ITEM_SLOT_HIP
	dropshrink = 0.75
	smeltresult = /obj/item/ingot/steel
	sellprice = 363
	static_price = TRUE

/obj/item/rogueweapon/sword/long/vlord/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -6,"sy" = 6,"nx" = 6,"ny" = 7,"wx" = 0,"wy" = 5,"ex" = -1,"ey" = 7,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -50,"sturn" = 40,"wturn" = 50,"eturn" = -50,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 9,"sy" = -4,"nx" = -7,"ny" = 1,"wx" = -9,"wy" = 2,"ex" = 10,"ey" = 2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 5,"sturn" = -190,"wturn" = -170,"eturn" = -10,"nflip" = 8,"sflip" = 8,"wflip" = 1,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/rogueweapon/sword/long/rider
	force = 15
	force_wielded = 30
	possible_item_intents = list(/datum/intent/sword/cut, /datum/intent/sword/strike)
	gripped_intents = list(/datum/intent/sword/cut, /datum/intent/sword/strike, /datum/intent/longsword/chop)
	icon_state = "tabi"
	icon = 'icons/roguetown/weapons/64.dmi'
	item_state = "tabi"
	lefthand_file = 'icons/mob/inhands/weapons/roguebig_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/roguebig_righthand.dmi'
	name = "kilij scimitar"
	desc = "A curved blade of Zybantu origin meaning 'curved one'. The standard sword that saw the conquest of the Zybantine continent and peoples."
	parrysound = "bladedmedium"
	swingsound = BLADEWOOSH_LARGE
	pickup_sound = 'sound/foley/equip/swordlarge2.ogg'
	bigboy = 1
	wlength = WLENGTH_LONG
	gripsprite = TRUE
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	associated_skill = /datum/skill/combat/swords
	throwforce = 15
	thrown_bclass = BCLASS_CUT
	slot_flags = ITEM_SLOT_BACK|ITEM_SLOT_HIP
	dropshrink = 0.75
	smeltresult = /obj/item/ingot/steel
	sellprice = 80

/obj/item/rogueweapon/sword/long/rider/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -10,"sy" = -8,"nx" = 13,"ny" = -8,"wx" = -8,"wy" = -7,"ex" = 7,"ey" = -8,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 90,"sturn" = -90,"wturn" = -80,"eturn" = 81,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 3,"sy" = 4,"nx" = -1,"ny" = 4,"wx" = -8,"wy" = 3,"ex" = 7,"ey" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 15,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.5,"sx" = -4,"sy" = -6,"nx" = 5,"ny" = -6,"wx" = 0,"wy" = -6,"ex" = -1,"ey" = -6,"nturn" = 100,"sturn" = 156,"wturn" = 90,"eturn" = 180,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/rogueweapon/sword/long/marlin
	force = 15
	force_wielded = 30
	possible_item_intents = list(/datum/intent/sword/cut, /datum/intent/sword/strike)
	gripped_intents = list(/datum/intent/sword/cut, /datum/intent/sword/strike, /datum/intent/longsword/chop, /datum/intent/longsword/thrust)
	icon_state = "marlin"
	icon = 'icons/roguetown/weapons/64.dmi'
	item_state = "marlin"
	lefthand_file = 'icons/mob/inhands/weapons/roguebig_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/roguebig_righthand.dmi'
	name = "shalal saber"
	desc = "A humongous saber of Zybantu origin in the style of the Shalal tribesfolk, renowned for their defiance against magic and mastery of mounted swordsmanship."
	parrysound = list('sound/combat/parry/bladed/bladedthin (1).ogg', 'sound/combat/parry/bladed/bladedthin (2).ogg', 'sound/combat/parry/bladed/bladedthin (3).ogg')
	swingsound = BLADEWOOSH_SMALL
	pickup_sound = 'sound/foley/equip/swordlarge2.ogg'
	bigboy = 0
	wlength = WLENGTH_LONG
	gripsprite = TRUE
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	associated_skill = /datum/skill/combat/swords
	throwforce = 15
	thrown_bclass = BCLASS_CUT
	slot_flags = ITEM_SLOT_BACK|ITEM_SLOT_HIP
	dropshrink = 0.75
	minstr = 6
	sellprice = 80
	wdefense = 5
	smeltresult = /obj/item/ingot/steel

/obj/item/rogueweapon/sword/long/marlin/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -10,"sy" = -8,"nx" = 13,"ny" = -8,"wx" = -8,"wy" = -7,"ex" = 7,"ey" = -8,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 90,"sturn" = -90,"wturn" = -80,"eturn" = 81,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 3,"sy" = 4,"nx" = -1,"ny" = 4,"wx" = -8,"wy" = 3,"ex" = 7,"ey" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 15,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.5,"sx" = -4,"sy" = -6,"nx" = 5,"ny" = -6,"wx" = 0,"wy" = -6,"ex" = -1,"ey" = -6,"nturn" = 100,"sturn" = 156,"wturn" = 90,"eturn" = 180,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/rogueweapon/sword/long/forgotten
	force = 16 // Damage is .9 of a steel sword
	force_wielded = 25
	possible_item_intents = list(/datum/intent/sword/cut, /datum/intent/sword/thrust, /datum/intent/sword/strike)
	gripped_intents = list(/datum/intent/sword/cut, /datum/intent/longsword/thrust, /datum/intent/sword/strike, /datum/intent/longsword/chop)
	icon_state = "forgotten"
	icon = 'icons/roguetown/weapons/64.dmi'
	item_state = "forgotten"
	lefthand_file = 'icons/mob/inhands/weapons/roguebig_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/roguebig_righthand.dmi'
	name = "forgotten blade"
	desc = "A large silver-alloy sword made in a revisionist style, honoring the Forgotten God. Best known as the prefered weapon of Inquisitorial Lodges"
	parrysound = "bladedmedium"
	swingsound = BLADEWOOSH_LARGE
	pickup_sound = 'sound/foley/equip/swordlarge2.ogg'
	bigboy = 1
	max_blade_int = 240 // Integrity and blade retention is .8 of a steel sword
	max_integrity = 400
	wlength = WLENGTH_LONG
	gripsprite = TRUE
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	associated_skill = /datum/skill/combat/swords
	throwforce = 15
	thrown_bclass = BCLASS_CUT
	slot_flags = ITEM_SLOT_BACK|ITEM_SLOT_HIP
	dropshrink = 0.75
	smeltresult = /obj/item/ingot/silver
	wbalance = -1
	wdefense = 4
	sellprice = 90
	var/last_used = 0

/obj/item/rogueweapon/sword/long/forgotten/pickup(mob/user)
	. = ..()
	var/mob/living/carbon/human/H = user
	if(ishuman(H))
		if(H.mind?.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			to_chat(H, "<span class='userdanger'>I can't pick up the silver, it is my BANE!</span>")
			H.Knockdown(20)
			H.adjustFireLoss(60)
			H.Paralyze(20)
			H.fire_act(1,5)
		if(H.mind?.has_antag_datum(/datum/antagonist/vampirelord/))
			var/datum/antagonist/vampirelord/V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
			if(V_lord.vamplevel < 4 && !H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
				to_chat(H, "<span class='userdanger'>I can't pick up the silver, it is my BANE!</span>")
				H.Knockdown(10)
				H.Paralyze(10)

/obj/item/rogueweapon/sword/long/forgotten/mob_can_equip(mob/living/M, mob/living/equipper, slot, disable_warning = FALSE, bypass_equip_delay_self = FALSE)
	. = ..()
	if(ishuman(M))
		var/datum/antagonist/vampirelord/V_lord = FALSE
		var/mob/living/carbon/human/H = M
		if(H.mind?.has_antag_datum(/datum/antagonist/vampirelord))
			V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
		if(H.mind?.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			H.Knockdown(20)
			H.adjustFireLoss(60)
			H.Paralyze(20)
			H.fire_act(1,5)
		if(V_lord)
			if(V_lord.vamplevel < 4 && !H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
				H.Knockdown(10)
				H.Paralyze(10)

/obj/item/rogueweapon/sword/long/forgotten/funny_attack_effects(mob/living/target, mob/living/user = usr, nodmg)
	if(world.time < src.last_used + 100)
		to_chat(user, "<span class='notice'>The silver effect is on cooldown.</span>")
		return



	. = ..()
	if(ishuman(target))
		var/mob/living/carbon/human/s_user = user
		var/mob/living/carbon/human/H = target
		var/datum/antagonist/vampirelord/lesser/V = FALSE
		if(H.mind?.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			V =  H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser)
		var/datum/antagonist/vampirelord/V_lord = FALSE
		if(H.mind.has_antag_datum(/datum/antagonist/vampirelord/))
			V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
		if(V)
			if(V.disguised)
				H.Stun(20)
				H.visible_message("<font color='white'>The silver weapon manifests the [H] curse!</font>")
				to_chat(H, "<span class='userdanger'>I'm hit by my BANE!</span>")
				H.adjustFireLoss(30)
				H.Paralyze(20)
				H.fire_act(1,4)
				H.apply_status_effect(/datum/status_effect/debuff/silver_curse)
				src.last_used = world.time
			else
				H.Stun(20)
				to_chat(H, "<span class='userdanger'>I'm hit by my BANE!</span>")
				H.adjustFireLoss(30)
				H.Paralyze(20)
				H.fire_act(1,4)
				H.apply_status_effect(/datum/status_effect/debuff/silver_curse)
				src.last_used = world.time
		if(V_lord)
			if(V_lord.vamplevel < 4 && !V)
				H.Stun(10)
				to_chat(H, "<span class='userdanger'>I'm hit by my BANE!</span>")
				H.adjustFireLoss(25)
				H.Paralyze(10)
				H.fire_act(1,4)
				src.last_used = world.time
			if(V_lord.vamplevel == 4 && !V)
				s_user.Stun(10)
				s_user.Paralyze(10)
				to_chat(s_user, "<font color='red'> The silver weapon fails!</font>")
				H.visible_message(H, "<span class='userdanger'>This feeble metal can't hurt me, I HAVE TRANSCENDED!</span>")

/obj/item/rogueweapon/greatsword
	force = 15
	force_wielded = 35
	possible_item_intents = list(/datum/intent/sword/chop,/datum/intent/sword/strike) //bash is for nonlethal takedowns, only targets limbs
	gripped_intents = list(/datum/intent/sword/cut, /datum/intent/longsword/chop, /datum/intent/sword/thrust, /datum/intent/sword/strike)
	name = "greatsword"
	desc = "An oversized hunk of metal designed for putting fear into men and killing beasts."
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
	max_blade_int = 300
	max_integrity = 500
	wdefense = 3
	wbalance = -1 // All long swords are heavy.
	sellprice = 90

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
	force = 15
	force_wielded = 40 // Unique weapon from rare job
	smeltresult = /obj/item/ingot/steel
	max_blade_int = 200
	max_integrity = 400
	sellprice = 120

/obj/item/rogueweapon/greatsword/zwei
	name = "zweihander"
	desc = "Sometimes known as a doppelhander or beidhander, this weapon's size is so impressive that it's handling properties are more akin to that of a polearm than a sword."
	icon_state = "steelzwei"
	force_wielded = 25 // A weapon worth 3 iron bars can't be as good as one worth 3 steel bars. Steel sword tier.
	possible_item_intents = list(/datum/intent/sword/cut/zwei, /datum/intent/sword/thrust/zwei, /datum/intent/sword/strike)
	gripped_intents = list(/datum/intent/sword/cut, /datum/intent/longsword/thrust, /datum/intent/sword/strike, /datum/intent/longsword/chop)
	smeltresult = /obj/item/ingot/iron
	max_blade_int = 150 // Iron tier
	max_integrity = 300
	sellprice = 60

/obj/item/rogueweapon/greatsword/elfgsword
	force = 15
	force_wielded = 30 // Unique weapon from rare job
	name = "elven kriegsmesser"
	desc = "A huge, curved elven blade. It's metal is of a high quality, yet still light, crafted by the greatest elven bladesmiths."
	icon_state = "kriegsmesser"
	smeltresult = /obj/item/ingot/steel
	max_blade_int = 300
	max_integrity = 300
	minstr = 10
	sellprice = 120

// Attack Intents

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

/datum/intent/sword/strike
	name = "pommel strike"
	icon_state = "instrike"
	attack_verb = list("bashes", "clubs")
	animname = "strike"
	blade_class = BCLASS_BLUNT
	hitsound = list('sound/combat/hits/blunt/metalblunt (1).ogg', 'sound/combat/hits/blunt/metalblunt (2).ogg', 'sound/combat/hits/blunt/metalblunt (3).ogg')
	chargetime = 0
	penfactor = 25
	swingdelay = 1
	damfactor = 0.8


/datum/intent/longsword/thrust
	name = "stab"
	icon_state = "instab"
	attack_verb = list("stabs")
	animname = "stab"
	blade_class = BCLASS_STAB
	hitsound = list('sound/combat/hits/bladed/genstab (1).ogg', 'sound/combat/hits/bladed/genstab (2).ogg', 'sound/combat/hits/bladed/genstab (3).ogg')
	penfactor = 20
	reach = 2
	misscost = 10

/datum/intent/longsword/chop
	name = "chop"
	icon_state = "inchop"
	attack_verb = list("chops", "hacks")
	animname = "chop"
	blade_class = BCLASS_CHOP
	hitsound = list('sound/combat/hits/bladed/genchop (1).ogg', 'sound/combat/hits/bladed/genchop (2).ogg', 'sound/combat/hits/bladed/genchop (3).ogg')
	penfactor = 20
	damfactor = 1.1
	chargetime = 1.2
	swingdelay = 1.5
	misscost = 15
	warnie = "mobwarning"

/datum/intent/sword/chop
	name = "chop"
	icon_state = "inchop"
	attack_verb = list("chops", "hacks")
	animname = "chop"
	blade_class = BCLASS_CHOP
	hitsound = list('sound/combat/hits/bladed/genchop (1).ogg', 'sound/combat/hits/bladed/genchop (2).ogg', 'sound/combat/hits/bladed/genchop (3).ogg')
	penfactor = 15
	damfactor = 1.1
	swingdelay = 1

/obj/item/rogueweapon/sword/long/exe
	possible_item_intents = list(/datum/intent/sword/strike)
	gripped_intents = list(/datum/intent/sword/chop)
	icon_state = "exe"
	name = "executioner's sword"
	desc = "An ancient blade of ginormous stature, with a round ended tip. The pride and joy of Roguetown's greatest pastime, executions."
	minstr = 10
	slot_flags = ITEM_SLOT_BACK

/obj/item/rogueweapon/sword/long/exe/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -6,"sy" = 6,"nx" = 6,"ny" = 7,"wx" = 0,"wy" = 5,"ex" = -1,"ey" = 7,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = -50,"sturn" = 40,"wturn" = 50,"eturn" = -50,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 9,"sy" = -4,"nx" = -7,"ny" = 1,"wx" = -9,"wy" = 2,"ex" = 10,"ey" = 2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 5,"sturn" = -190,"wturn" = -170,"eturn" = -10,"nflip" = 8,"sflip" = 8,"wflip" = 1,"eflip" = 0)
			if("onback")
				return list("shrink" = 0.6,"sx" = -1,"sy" = 3,"nx" = -1,"ny" = 2,"wx" = 3,"wy" = 4,"ex" = -1,"ey" = 5,"nturn" = 0,"sturn" = 0,"wturn" = 70,"eturn" = 20,"nflip" = 1,"sflip" = 1,"wflip" = 1,"eflip" = 1,"northabove" = 1,"southabove" = 0,"eastabove" = 0,"westabove" = 0)

/obj/item/rogueweapon/sword/long/exe/cloth
	icon_state = "terminusest"
	name = "Terminus Est"

/obj/item/rogueweapon/sword/long/exe/cloth/rmb_self(mob/user)
	user.changeNext_move(CLICK_CD_MELEE)
	playsound(user, "clothwipe", 100, TRUE)
	SEND_SIGNAL(src, COMSIG_COMPONENT_CLEAN_ACT, CLEAN_STRONG)
	user.visible_message("<span class='warning'>[user] wipes [src] down with its cloth.</span>","<span class='notice'>I wipe [src] down with its cloth.</span>")
	return

//Short Swords
/obj/item/rogueweapon/sword/iron
	name = "sword"
	desc = "A simple iron sword with a tested edge, sharp and true."
	icon_state = "isword"
	minstr = 6
	force = 15 // Iron tier. Higher than steel daggers, still.
	force_wielded = 20
	smeltresult = /obj/item/ingot/iron
	max_blade_int = 200
	max_integrity = 300
	sellprice = 15

/obj/item/rogueweapon/sword/iron/short
	name = "short sword"
	desc = "An iron sword of shortened design, a reduced grip for primarily single hand use."
	icon_state = "iswordshort"
	possible_item_intents = list(/datum/intent/sword/cut/short, /datum/intent/sword/thrust/short)
	gripped_intents = null
	max_integrity = 200
	minstr = 4
	wdefense = 3
	wbalance = 1

/obj/item/rogueweapon/sword/iron/short/chipped
	desc = "An ancient-looking iron sword that has seen better days."
	force = 12
	icon_state = "iswordshort_d"
	max_integrity = 75

/datum/intent/sword/cut/short
	clickcd = 10
	damfactor = 0.85

/datum/intent/sword/thrust/short
	clickcd = 10
	penfactor = 30

/obj/item/rogueweapon/sword/iron/messer
	name = "iron messer"
	desc = "A single edged blade fashioned in the Grenzelhoft messer style."
	force = 18 // Can't be dual wielded, but shouldn't be higher than a steel equivalent.
	icon_state = "imesser"
	possible_item_intents = list(/datum/intent/sword/cut, /datum/intent/axe/chop)
	gripped_intents = null
	max_blade_int = 250
	max_integrity = 350
	minstr = 8 // Heavy blade used by orcs
	wdefense = 3
	wbalance = -1 // Heavy, STR bonus
	sellprice = 20

/obj/item/rogueweapon/sword/short
	name = "short sword"
	desc = "An archaic steel sword made for penetrating the bodies of impudents."
	possible_item_intents = list(/datum/intent/sword/cut/short, /datum/intent/sword/thrust/short)
	icon_state = "swordshort"
	gripped_intents = null
	minstr = 4
	wdefense = 4
	max_blade_int = 250
	max_integrity = 350
	wbalance = 1
	smeltresult = /obj/item/ingot/steel

/obj/item/rogueweapon/sword/short/silver
	name = "silver short sword"
	desc = "A single-edged sword made of silver. Can cut through the undead like butter."
	force = 18 // .9 of normal steel sword's damage
	possible_item_intents = list(/datum/intent/sword/cut/short, /datum/intent/sword/thrust/short)
	icon_state = "swordshort_s"
	gripped_intents = null
	minstr = 4
	wdefense = 4
	max_blade_int = 200 // Blade int and durability is .8 steel
	max_integrity = 280
	wbalance = 1
	smeltresult = /obj/item/ingot/silver
	sellprice = 45
	var/last_used = 0

/obj/item/rogueweapon/sword/short/silver/pickup(mob/user)
	. = ..()
	var/mob/living/carbon/human/H = user
	if(ishuman(H))
		if(H.mind?.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			to_chat(H, "<span class='userdanger'>I can't pick up the silver, it is my BANE!</span>")
			H.Knockdown(20)
			H.adjustFireLoss(60)
			H.Paralyze(20)
			H.fire_act(1,5)
		if(H.mind?.has_antag_datum(/datum/antagonist/vampirelord/))
			var/datum/antagonist/vampirelord/V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
			if(V_lord.vamplevel < 4 && !H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
				to_chat(H, "<span class='userdanger'>I can't pick up the silver, it is my BANE!</span>")
				H.Knockdown(10)
				H.Paralyze(10)

/obj/item/rogueweapon/sword/short/silver/mob_can_equip(mob/living/M, mob/living/equipper, slot, disable_warning = FALSE, bypass_equip_delay_self = FALSE)
	. = ..()
	if(ishuman(M))
		var/datum/antagonist/vampirelord/V_lord = FALSE
		var/mob/living/carbon/human/H = M
		if(H.mind?.has_antag_datum(/datum/antagonist/vampirelord))
			V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
		if(H.mind?.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			H.Knockdown(20)
			H.adjustFireLoss(60)
			H.Paralyze(20)
			H.fire_act(1,5)
		if(V_lord)
			if(V_lord.vamplevel < 4 && !H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
				H.Knockdown(10)
				H.Paralyze(10)

/obj/item/rogueweapon/sword/short/silver/funny_attack_effects(mob/living/target, mob/living/user = usr, nodmg)
	if(world.time < src.last_used + 100)
		to_chat(user, "<span class='notice'>The silver effect is on cooldown.</span>")
		return



	. = ..()
	if(ishuman(target))
		var/mob/living/carbon/human/s_user = user
		var/mob/living/carbon/human/H = target
		var/datum/antagonist/vampirelord/lesser/V = FALSE
		if(H.mind?.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			V =  H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser)
		var/datum/antagonist/vampirelord/V_lord = FALSE
		if(H.mind.has_antag_datum(/datum/antagonist/vampirelord/))
			V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
		if(V)
			if(V.disguised)
				H.Stun(20)
				H.visible_message("<font color='white'>The silver weapon manifests the [H] curse!</font>")
				to_chat(H, "<span class='userdanger'>I'm hit by my BANE!</span>")
				H.adjustFireLoss(30)
				H.Paralyze(20)
				H.fire_act(1,4)
				H.apply_status_effect(/datum/status_effect/debuff/silver_curse)
				src.last_used = world.time
			else
				H.Stun(20)
				to_chat(H, "<span class='userdanger'>I'm hit by my BANE!</span>")
				H.adjustFireLoss(30)
				H.Paralyze(20)
				H.fire_act(1,4)
				H.apply_status_effect(/datum/status_effect/debuff/silver_curse)
				src.last_used = world.time
		if(V_lord)
			if(V_lord.vamplevel < 4 && !V)
				H.Stun(10)
				to_chat(H, "<span class='userdanger'>I'm hit by my BANE!</span>")
				H.adjustFireLoss(25)
				H.Paralyze(10)
				H.fire_act(1,4)
				src.last_used = world.time
			if(V_lord.vamplevel == 4 && !V)
				s_user.Stun(10)
				s_user.Paralyze(10)
				to_chat(s_user, "<font color='red'> The silver weapon fails!</font>")
				H.visible_message(H, "<span class='userdanger'>This feeble metal can't hurt me, I HAVE TRANSCENDED!</span>")

// Sabres
/obj/item/rogueweapon/sword/sabre
	name = "saber"
	desc = "A swift sabre, favored by duelists and cut-throats alike."
	icon_state = "saber"
	smeltresult = /obj/item/ingot/steel
	possible_item_intents = list(/datum/intent/sword/cut/sabre, /datum/intent/sword/chop)
	gripped_intents = null
	parrysound = list('sound/combat/parry/bladed/bladedthin (1).ogg', 'sound/combat/parry/bladed/bladedthin (2).ogg', 'sound/combat/parry/bladed/bladedthin (3).ogg')
	swingsound = BLADEWOOSH_SMALL
	minstr = 5
	wdefense = 5
	wbalance = 1

/datum/intent/sword/cut/sabre
	name = "strike"
	icon_state = "incut"
	attack_verb = list("cuts", "slashes")
	animname = "cut"
	blade_class = BCLASS_CUT
	chargetime = 0
	hitsound = list('sound/combat/hits/bladed/genslash (1).ogg', 'sound/combat/hits/bladed/genslash (2).ogg', 'sound/combat/hits/bladed/genslash (3).ogg')
	penfactor = 15

/obj/item/rogueweapon/sword/sabre/dec
	name = "decorated saber"
	desc = "A saber decorated with fashionable gold accents without sacrificing its lethal practicality."
	icon_state = "decsaber"
	max_integrity = 550
	smeltresult = /obj/item/ingot/steel
	gripped_intents = null
	parrysound = list('sound/combat/parry/bladed/bladedthin (1).ogg', 'sound/combat/parry/bladed/bladedthin (2).ogg', 'sound/combat/parry/bladed/bladedthin (3).ogg')
	swingsound = BLADEWOOSH_SMALL
	minstr = 6
	wdefense = 5
	wbalance = 1
	sellprice = 140

/obj/item/rogueweapon/sword/sabre/messer //not IRL sabre, but its a one handed cutting weapon, way lower defense, but has higher damage and the axe chop intent
	name = "falchion"
	desc = "A broad steel falchion, a favored sword among the few created by dwarffolk."
	force = 20
	icon_state = "falchion"
	smeltresult = /obj/item/ingot/steel
	possible_item_intents = list(/datum/intent/sword/cut/sabre, /datum/intent/sword/thrust, /datum/intent/axe/chop)
	gripped_intents = null
	minstr = 4
	wdefense = 2
	wbalance = -1 // Heavy
	sellprice = 100

//Rapiers
/obj/item/rogueweapon/sword/rapier
	name = "rapier"
	desc = "A precise rapier, favored by the small, eloquent and bloodthirsty."
	icon_state = "rapier"
	smeltresult = /obj/item/ingot/steel
	possible_item_intents = list(/datum/intent/sword/thrust/rapier, /datum/intent/sword/cut/rapier)
	gripped_intents = null
	parrysound = list('sound/combat/parry/bladed/bladedthin (1).ogg', 'sound/combat/parry/bladed/bladedthin (2).ogg', 'sound/combat/parry/bladed/bladedthin (3).ogg')
	swingsound = BLADEWOOSH_SMALL
	minstr = 6
	wdefense = 5
	wbalance = 1

/datum/intent/sword/cut/rapier
	name = "strike"
	icon_state = "incut"
	attack_verb = list("cuts", "slashes")
	animname = "cut"
	blade_class = BCLASS_CUT
	chargetime = 0
	hitsound = list('sound/combat/hits/bladed/genslash (1).ogg', 'sound/combat/hits/bladed/genslash (2).ogg', 'sound/combat/hits/bladed/genslash (3).ogg')
	penfactor = 20
	misscost = 5

/datum/intent/sword/thrust/rapier
	name = "stab"
	icon_state = "instab"
	attack_verb = list("stabs")
	animname = "stab"
	blade_class = BCLASS_STAB
	hitsound = list('sound/combat/hits/bladed/genstab (1).ogg', 'sound/combat/hits/bladed/genstab (2).ogg', 'sound/combat/hits/bladed/genstab (3).ogg')
	penfactor = 40
	misscost = 5

/obj/item/rogueweapon/sword/rapier/dec
	icon_state = "decrapier"
	desc = "A rapier decorated with gold inlaid on its hilt. A regal weapon fit for nobility."
	max_integrity = 550
	sellprice = 140

/obj/item/rogueweapon/sword/rapier/lord
	force = 25
	name = "Kings Sword"
	desc = "Passed down through the ages, a weapon that once carved a kingdom out now relegated to a decorative piece."
	icon_state = "lordrap"
	sellprice = 300
	max_integrity = 600
	max_blade_int = 400
	wdefense = 7

/obj/item/rogueweapon/sword/rapier/silver
	name = "silver rapier"
	desc = "An elegant silver rapier. Popular with lords and ladies in Valoria."
	force = 18 // .9 of base steel
	icon_state = "rapier_s"
	smeltresult = /obj/item/ingot/silver
	possible_item_intents = list(/datum/intent/sword/thrust/rapier, /datum/intent/sword/cut/rapier)
	parrysound = list('sound/combat/parry/bladed/bladedthin (1).ogg', 'sound/combat/parry/bladed/bladedthin (2).ogg', 'sound/combat/parry/bladed/bladedthin (3).ogg')
	swingsound = BLADEWOOSH_SMALL
	minstr = 6
	wdefense = 5
	wbalance = 1
	max_blade_int = 240 // .8 of base steel
	max_integrity = 400 // .8 of base steel
	sellprice = 45
	var/last_used = 0

/obj/item/rogueweapon/sword/rapier/silver/pickup(mob/user)
	. = ..()
	var/mob/living/carbon/human/H = user
	if(ishuman(H))
		if(H.mind?.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			to_chat(H, "<span class='userdanger'>I can't pick up the silver, it is my BANE!</span>")
			H.Knockdown(20)
			H.adjustFireLoss(60)
			H.Paralyze(20)
			H.fire_act(1,5)
		if(H.mind?.has_antag_datum(/datum/antagonist/vampirelord/))
			var/datum/antagonist/vampirelord/V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
			if(V_lord.vamplevel < 4 && !H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
				to_chat(H, "<span class='userdanger'>I can't pick up the silver, it is my BANE!</span>")
				H.Knockdown(10)
				H.Paralyze(10)

/obj/item/rogueweapon/sword/rapier/silver/mob_can_equip(mob/living/M, mob/living/equipper, slot, disable_warning = FALSE, bypass_equip_delay_self = FALSE)
	. = ..()
	if(ishuman(M))
		var/datum/antagonist/vampirelord/V_lord = FALSE
		var/mob/living/carbon/human/H = M
		if(H.mind?.has_antag_datum(/datum/antagonist/vampirelord))
			V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
		if(H.mind?.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			H.Knockdown(20)
			H.adjustFireLoss(60)
			H.Paralyze(20)
			H.fire_act(1,5)
		if(V_lord)
			if(V_lord.vamplevel < 4 && !H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
				H.Knockdown(10)
				H.Paralyze(10)

/obj/item/rogueweapon/sword/rapier/silver/funny_attack_effects(mob/living/target, mob/living/user = usr, nodmg)
	if(world.time < src.last_used + 100)
		to_chat(user, "<span class='notice'>The silver effect is on cooldown.</span>")
		return



	. = ..()
	if(ishuman(target))
		var/mob/living/carbon/human/s_user = user
		var/mob/living/carbon/human/H = target
		var/datum/antagonist/vampirelord/lesser/V = FALSE
		if(H.mind?.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			V =  H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser)
		var/datum/antagonist/vampirelord/V_lord = FALSE
		if(H.mind.has_antag_datum(/datum/antagonist/vampirelord/))
			V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
		if(V)
			if(V.disguised)
				H.Stun(20)
				H.visible_message("<font color='white'>The silver weapon manifests the [H] curse!</font>")
				to_chat(H, "<span class='userdanger'>I'm hit by my BANE!</span>")
				H.adjustFireLoss(30)
				H.Paralyze(20)
				H.fire_act(1,4)
				H.apply_status_effect(/datum/status_effect/debuff/silver_curse)
				src.last_used = world.time
			else
				H.Stun(20)
				to_chat(H, "<span class='userdanger'>I'm hit by my BANE!</span>")
				H.adjustFireLoss(30)
				H.Paralyze(20)
				H.fire_act(1,4)
				H.apply_status_effect(/datum/status_effect/debuff/silver_curse)
				src.last_used = world.time
		if(V_lord)
			if(V_lord.vamplevel < 4 && !V)
				H.Stun(10)
				to_chat(H, "<span class='userdanger'>I'm hit by my BANE!</span>")
				H.adjustFireLoss(25)
				H.Paralyze(10)
				H.fire_act(1,4)
				src.last_used = world.time
			if(V_lord.vamplevel == 4 && !V)
				s_user.Stun(10)
				s_user.Paralyze(10)
				to_chat(s_user, "<font color='red'> The silver weapon fails!</font>")
				H.visible_message(H, "<span class='userdanger'>This feeble metal can't hurt me, I HAVE TRANSCENDED!</span>")

// Cutless
/obj/item/rogueweapon/sword/cutlass
	name = "cutlass"
	desc = "Both tool and weapon of war, favored by Abyssor cultists and sailors for seafaring battle."
	icon_state = "cutlass"
	possible_item_intents = list(/datum/intent/sword/cut/sabre, /datum/intent/sword/chop)
	gripped_intents = null
	parrysound = list('sound/combat/parry/bladed/bladedthin (1).ogg', 'sound/combat/parry/bladed/bladedthin (2).ogg', 'sound/combat/parry/bladed/bladedthin (3).ogg')
	swingsound = BLADEWOOSH_SMALL
	minstr = 6
	wdefense = 5
	wbalance = 1

// COPPER AND BRONZE WEAPONS

/obj/item/rogueweapon/sword/coppermesser
	force = 15 // Messers are heavy weapons, crude and STR based.
	force_wielded = 20
	possible_item_intents = list(/datum/intent/sword/cut, /datum/intent/sword/strike)
	gripped_intents = list(/datum/intent/sword/cut, /datum/intent/sword/strike, /datum/intent/sword/chop)
	icon_state = "cmesser"
	item_state = "cmesser"
	lefthand_file = 'icons/mob/inhands/weapons/roguebig_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/roguebig_righthand.dmi'
	name = "copper messer"
	desc = "A weapon of war from simpler times, its copper material is unideal but still efficient for the price."
	parrysound = "bladedmedium"
	swingsound = BLADEWOOSH_LARGE
	pickup_sound = 'sound/foley/equip/swordlarge2.ogg'
	wlength = WLENGTH_LONG
	max_blade_int = 150
	max_integrity = 200
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	throwforce = 15
	slot_flags = ITEM_SLOT_BACK|ITEM_SLOT_HIP
	dropshrink = 0.90
	smeltresult = /obj/item/ingot/copper
	wbalance = -1
	sellprice = 10

/obj/item/rogueweapon/sword/coppermesser/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.5,"sx" = -10,"sy" = -8,"nx" = 13,"ny" = -8,"wx" = -8,"wy" = -7,"ex" = 7,"ey" = -8,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 90,"sturn" = -90,"wturn" = -80,"eturn" = 81,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onback")
				return list("shrink" = 0.5,"sx" = -1,"sy" = 2,"nx" = 0,"ny" = 2,"wx" = 2,"wy" = 1,"ex" = 0,"ey" = 1,"nturn" = 0,"sturn" = 0,"wturn" = 70,"eturn" = 15,"nflip" = 1,"sflip" = 1,"wflip" = 1,"eflip" = 1,"northabove" = 1,"southabove" = 0,"eastabove" = 0,"westabove" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = 3,"sy" = 4,"nx" = -1,"ny" = 4,"wx" = -8,"wy" = 3,"ex" = 7,"ey" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 15,"nflip" = 8,"sflip" = 0,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.5,"sx" = -4,"sy" = -6,"nx" = 5,"ny" = -6,"wx" = 0,"wy" = -6,"ex" = -1,"ey" = -6,"nturn" = 100,"sturn" = 156,"wturn" = 90,"eturn" = 180,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/rogueweapon/sword/copper
	name = "copper sword"
	desc = "A simple copper sword, rustic design with a tested edge, sharp and lethal."
	icon_state = "csword"
	minstr = 6
	force = 12 // shitty copper tier. lower than steel daggers and ready to be used by very poor people and skeletons or undead zombies
	force_wielded = 16
	smeltresult = /obj/item/ingot/copper
	max_blade_int = 100
	max_integrity = 220
	sellprice = 10

///obj/item/rogueweapon/sword/bronze
	name = "bronze sword"
	desc = "A simple bronze sword, an ancient design with a tested edge. While this one is far inferior in quality to those forged in the God-War era, it still does the job."
	icon_state = "bsword"
	minstr = 6
	force = 14 // bronze tier. same as steel daggers and ready to be used by very poor warriors and skeletons or undead zombies
	force_wielded = 20
	smeltresult = /obj/item/ingot/bronze
	max_blade_int = 190
	max_integrity = 290
	sellprice = 20

/obj/item/rogueweapon/sword/long/rider/copper
	force = 11
	force_wielded = 23 // Shitty Design, Shitty materials, SHITTY WEAPON 
	possible_item_intents = list(/datum/intent/sword/cut, /datum/intent/sword/strike)
	gripped_intents = list(/datum/intent/sword/cut, /datum/intent/sword/strike)
	icon_state = "copperfalx"
	icon = 'icons/roguetown/weapons/64.dmi'
	item_state = "copperfalx"
	name = "copper falx."
	desc = "A special 'sword' of copper, the material isn't the best but is good enough to slash and kill. "
	parrysound = "bladedmedium"
	swingsound = BLADEWOOSH_LARGE
	pickup_sound = 'sound/foley/equip/swordlarge2.ogg'
	bigboy = 1
	max_blade_int = 150 // Shitty Weapon
	max_integrity = 230//this is fair to be fair
	wlength = WLENGTH_LONG
	gripsprite = TRUE
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	associated_skill = /datum/skill/combat/swords
	throwforce = 15
	thrown_bclass = BCLASS_CUT
	slot_flags = ITEM_SLOT_BACK//how the fuck you could put this thing on your hip?
	dropshrink = 0.75
	smeltresult = /obj/item/ingot/copper
	sellprice = 25//lets make the two bars worth it 
	




///obj/item/rogueweapon/sword/long/marlin/bronze
	force = 15
	force_wielded = 25 // this one is actually fair since is 2 bars, same as iron zwei
	possible_item_intents = list(/datum/intent/sword/cut, /datum/intent/sword/thrust, /datum/intent/sword/strike)
	gripped_intents = list(/datum/intent/sword/cut, /datum/intent/longsword/thrust, /datum/intent/sword/strike, /datum/intent/longsword/chop)
	icon_state = "bgreatsor"
	icon = 'icons/roguetown/weapons/64.dmi'
	item_state = "bgreatsor"
	name = "bronze long sword."
	desc = "An elaborate long sword made of bronze. A rare weapon, unfamiliar to most, but all too familiar to the aasimar who still recall the God-War."
	parrysound = "bladedmedium"
	swingsound = BLADEWOOSH_LARGE
	pickup_sound = 'sound/foley/equip/swordlarge2.ogg'
	bigboy = 1
	max_blade_int = 140 // not a bad Weapon
	max_integrity = 200//this is fair to be fair in this fair code
	wlength = WLENGTH_LONG
	gripsprite = TRUE
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	associated_skill = /datum/skill/combat/swords
	throwforce = 15
	thrown_bclass = BCLASS_CUT
	slot_flags = ITEM_SLOT_BACK//how the fuck you could put this thing on your hip?
	dropshrink = 0.75
	smeltresult = /obj/item/ingot/bronze
	sellprice = 35//lets make the two bars worth it 

// Hoplite Kophesh
/obj/item/rogueweapon/sword/khopesh
	name = "ancient khopesh"
	desc = "A bronze weapon of war from the era of Apotheosis. This blade is older than a few elven generations, but has been very well-maintained and still keeps a good edge."
	force = 22 // Unique weapon from rare job, slightly more force than most one-handers
	possible_item_intents = list(/datum/intent/sword/cut, /datum/intent/sword/chop, /datum/intent/sword/strike)
	gripped_intents = null
	icon = 'icons/roguetown/weapons/64.dmi'
	icon_state = "khopesh"
	item_state = "khopesh"
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	pixel_y = -16
	pixel_x = -16
	dropshrink = 0.75
	bigboy = 1 // WHY DOES THIS FUCKING VARIABLE CONTROL WHETHER THE BLOOD OVERLAY WORKS ON 64x64 WEAPONS
	slot_flags = ITEM_SLOT_BACK|ITEM_SLOT_HIP
	smeltresult = /obj/item/ingot/bronze // No bronze ingots yet//added
	max_blade_int = 300
	max_integrity = 300
	minstr = 10 // Even though it's technically one-handed, you gotta have some muscle to wield this thing
	wdefense = 3 // Lower than average sword defense (meant to pair with a shield)
	wbalance = -1 // Likely weighted towards the blade, for deep cuts and chops
	sellprice = 200 // A noble collector would love to get his/her hands on one of these blades
