/obj/item/clothing/head/roguetown/helmet/scomlink
	name = "scomlink helmet"
	desc = "A helmet made of steel. It can communicate with other helmets of similar type with the mushrooms that are inside."
	icon_state = "guardhelm"
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_HIP|ITEM_SLOT_WRISTS
	flags_inv = HIDEEARS|HIDEFACE
	equip_sound = 'sound/foley/equip/equip_armor_plate.ogg'
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	block2add = FOV_BEHIND
	smeltresult = /obj/item/ingot/steel
	sellprice = VALUE_STEEL_HELMET
	armor = ARMOR_MAILLE_GOOD
	body_parts_covered = FULL_HEAD
	prevent_crits = ALL_EXCEPT_BLUNT
	max_integrity = INTEGRITY_STRONGEST
	var/canspeak = TRUE

/obj/item/clothing/head/roguetown/helmet/scomlink/attack_right(mob/living/carbon/human/user)
	user.changeNext_move(CLICK_CD_MELEE)
	playsound(user, 'sound/misc/beep.ogg', 100, FALSE, -1)
	if(!canspeak)
		to_chat(user, "<span class='info'>[src.name] is off.</span>")
		return
	var/input_text = input(user, "Speak into the Scom Link.","Scom Link")
	if(!input_text)
		return
	user.whisper(input_text)
	send_message(input_text, user)

/obj/item/clothing/head/roguetown/helmet/scomlink/proc/send_message(message, mob/living/carbon/human/user, atom/A)
	for(var/obj/item/clothing/head/roguetown/helmet/scomlink/scom in SSroguemachine.scomm_machines)
		if(!canspeak)
			to_chat(scom.loc, "<span class='info'>\The [src.name] vibrates.</span>")
		var/speaker_clue = "[user.age] [(user.gender == FEMALE) ? "Woman" : "Man"]"
		playsound(scom.loc, 'sound/misc/scom.ogg', 25, TRUE, -1)
		to_chat(scom.loc, "<font color='#00d5ff'>(SCOM LINK)</font> <font color='#[user.voice_color]'>[speaker_clue]</font> ''[message]''")

/obj/item/clothing/head/roguetown/helmet/scomlink/MiddleClick(mob/user)
	if(.)
		return
	user.changeNext_move(CLICK_CD_MELEE)
	playsound(user, 'sound/misc/beep.ogg', 100, FALSE, -1)
	canspeak = !canspeak
	to_chat(user, "<span class='info'>I [canspeak ? "unmute" : "mute"] \the [src.name].</span>")

/obj/item/clothing/head/roguetown/helmet/scomlink/Initialize()
	. = ..()
	SSroguemachine.scomm_machines += src

/obj/item/clothing/head/roguetown/helmet/scomlink/Destroy()
	SSroguemachine.scomm_machines -= src
	return ..()
