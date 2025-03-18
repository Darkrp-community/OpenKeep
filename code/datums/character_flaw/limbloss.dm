

/datum/charflaw/limbloss
	var/lost_zone

/datum/charflaw/limbloss/on_mob_creation(mob/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	var/obj/item/bodypart/O = H.get_bodypart(lost_zone)
	if(O)
		O.drop_limb()
		qdel(O)
	return

/datum/charflaw/limbloss/arm_r
	name = "Wooden Arm (R)"
	desc = "I lost my right arm long ago, but the wooden arm doesn't bleed as much."
	lost_zone = BODY_ZONE_R_ARM

/datum/charflaw/limbloss/arm_r/on_mob_creation(mob/user)
	..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	var/obj/item/bodypart/r_arm/rproesthetic/L = new()
	L.attach_limb(H)

/datum/charflaw/limbloss/arm_l
	name = "Wooden Arm (L)"
	desc = "I lost my left arm long ago, but the wooden arm doesn't bleed as much."
	lost_zone = BODY_ZONE_L_ARM

/datum/charflaw/limbloss/arm_l/on_mob_creation(mob/user)
	..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	var/obj/item/bodypart/l_arm/rproesthetic/L = new()
	L.attach_limb(H)

/datum/charflaw/limbloss/r_leg
	name = "Wooden Leg (R)"
	desc = "I lost my right leg long ago, but the wooden leg doesn't bleed as much."
	lost_zone = BODY_ZONE_R_LEG

/datum/charflaw/limbloss/r_leg/on_mob_creation(mob/user)
	..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	ADD_TRAIT(H, TRAIT_HOBBLED, TRAIT_GENERIC)
	var/obj/item/bodypart/r_leg/rproesthetic/L = new()
	L.attach_limb(H)

/datum/charflaw/limbloss/l_leg
	name = "Wooden Leg (L)"
	desc = "I lost my left leg long ago, but the wooden leg doesn't bleed as much."
	lost_zone = BODY_ZONE_L_LEG

/datum/charflaw/limbloss/l_leg/on_mob_creation(mob/user)
	..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	ADD_TRAIT(H, TRAIT_HOBBLED, TRAIT_GENERIC)
	var/obj/item/bodypart/l_leg/rproesthetic/L = new()
	L.attach_limb(H)
