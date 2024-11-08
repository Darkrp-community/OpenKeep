/* WHIPS
==========================================================*/

/obj/item/rogueweapon/whip
	force = DAMAGE_WHIP
	possible_item_intents = list(/datum/intent/whip/crack, /datum/intent/whip/lash)
	name = "whip"
	desc = "A leather whip, intertwining rope, leather and a fanged tip to inflict enormous pain. Favored by slavers and beast-tamers."
	icon_state = "whip"
	icon = 'icons/roguetown/weapons/32.dmi'
	sharpness = IS_BLUNT
	//dropshrink = 0.75
	wlength = WLENGTH_GREAT
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_HIP | ITEM_SLOT_BELT
	associated_skill = /datum/skill/combat/whipsflails
	anvilrepair = /datum/skill/craft/tanning
	resistance_flags = FLAMMABLE // Fully made of leather
	smeltresult = /obj/item/ash
	can_parry = FALSE
	swingsound = WHIPWOOSH
	throwforce = 5
	wdefense = 0
	minstr = 4
	sellprice = 30

/obj/item/rogueweapon/whip/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.5,"sx" = -10,"sy" = -3,"nx" = 11,"ny" = -2,"wx" = -7,"wy" = -3,"ex" = 3,"ey" = -3,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 22,"sturn" = -23,"wturn" = -23,"eturn" = 29,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)


/*------------\
| Lash intent |
\------------*/
/datum/intent/whip/lash
	name = "lash"
	blade_class = BCLASS_LASHING
	attack_verb = list("lashes", "whips")
	hitsound = list('sound/combat/hits/blunt/flailhit.ogg')
	chargetime = 5
	recovery = 5
	penfactor = 5
	reach = 2
	misscost = 7
	icon_state = "inlash"
	canparry = FALSE //Has reach and can't be parried, but needs to be charged and punishes misses.

/*-------------\
| Crack intent |
\-------------*/
/datum/intent/whip/crack
	name = "crack"
	blade_class = BCLASS_BLUNT
	attack_verb = list("cracks", "strikes") //something something dwarf fotresss
	hitsound = list('sound/combat/hits/blunt/flailhit.ogg')
	chargetime = 0
	recovery = 5
	penfactor = 20
	reach = 1
	icon_state = "incrack"
	canparry = TRUE

//................ Repenta En ............... //
/obj/item/rogueweapon/whip/antique
	force = DAMAGE_WHIP+4
	name = "Repenta En"
	desc = "An extremely well maintained whip, with a polished steel tip and gilded handle."
	minstr = 7
	icon_state = "gwhip"
	resistance_flags = FIRE_PROOF
	smeltresult = /obj/item/ingot/steel
	sellprice = 50
		
/obj/item/rogueweapon/whip/antique/silver
	name = "Contemptum"
	desc = "An extremely well maintained whip, with a gleaming silver tip and gilded handle. Both bane and punishment."
	var/last_used = 0

/obj/item/rogueweapon/whip/antique/silver/pickup(mob/user)
	. = ..()
	var/mob/living/carbon/human/H = user
	if(ishuman(H))
		if(H.mind?.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			to_chat(H, "<span class='userdanger'>I can't pick up the silver, it is my BANE!</span>")
			H.Knockdown(30)
			H.Paralyze(1)
			H.adjustFireLoss(40)
			H.fire_act(1,5)
		if(H.mind?.has_antag_datum(/datum/antagonist/vampirelord/))
			var/datum/antagonist/vampirelord/V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
			if(V_lord.vamplevel < 4 && !H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
				to_chat(H, "<span class='userdanger'>I can't pick up the silver, it is my BANE!</span>")
				H.Knockdown(10)
				H.Paralyze(1)

/obj/item/rogueweapon/whip/antique/silver/funny_attack_effects(mob/living/target, mob/living/user = usr, nodmg)
	if(world.time < src.last_used + 100)
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
				H.visible_message("<font color='white'>The silver weapon undoes [H]'s wicked disguise!</font>")
				to_chat(H, "<span class='userdanger'>I'm hit by my BANE!</span>")
				H.adjustFireLoss(30)
				H.Knockdown(30)
				H.fire_act(1,5)
				H.apply_status_effect(/datum/status_effect/debuff/silver_curse)
				src.last_used = world.time
			else
				to_chat(H, "<span class='userdanger'>I'm hit by my BANE!</span>")
				H.adjustFireLoss(30)
				H.Knockdown(30)
				H.fire_act(1,5)
				H.apply_status_effect(/datum/status_effect/debuff/silver_curse)
				src.last_used = world.time
		if(V_lord)
			if(V_lord.vamplevel < 4 && !V)
				to_chat(H, "<span class='userdanger'>I'm hit by my BANE!</span>")
				H.adjustFireLoss(20)
				H.Knockdown(20)
				H.fire_act(1,4)
				H.apply_status_effect(/datum/status_effect/debuff/silver_curse) // Lesser curse applied still
				src.last_used = world.time
			if(V_lord.vamplevel == 4 && !V)
				if(prob(25))
					H.fire_act(1,3)
				to_chat(s_user, "<font color='red'> The silver weapon barely works against such an abomination!</font>")
				H.visible_message(H, "<span class='userdanger'>This feeble metal can't stop me, I HAVE TRANSCENDED!</span>")
			return
	if((target.mob_biotypes & MOB_UNDEAD))
		target.adjustFireLoss(25)
		return

//................ Lashkiss Whip ............... //
/obj/item/rogueweapon/whip/spiderwhip
	force = DAMAGE_WHIP+3
	name = "lashkiss whip"
	desc = "A dark whip with segmented, ashen spines for a base. Claimed to be hewn from dendrified prisoners of terror."
	icon_state = "spiderwhip"
	minstr = 6
