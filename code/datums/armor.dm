#define ARMORID "armor-[crush]-[slash]-[stab]-[pierce]-[fire]-[acid]-[magic]"

/proc/getArmor(crush = 0, slash = 0, stab = 0, pierce = 0, fire = 0, acid = 0, magic = 0)
	. = locate(ARMORID)
	if (!.)
		. = new /datum/armor(crush, slash, stab, pierce, fire, acid, magic)

/datum/armor
	datum_flags = DF_USE_TAG
	//bruising
	var/crush
	//cutting
	var/slash
	//piercing
	var/stab
	var/pierce
	//Protection against fighting
	var/fire
	//Protection against acid based attacks
	var/acid
	//Protection against magic based attacks
	var/magic

/datum/armor/New(crush = 0, slash = 0, stab = 0, pierce = 0, fire = 0, acid = 0, magic = 0)
	src.crush = crush
	src.slash = slash
	src.stab = stab
	src.pierce = pierce
	src.fire = fire
	src.acid = acid
	src.magic = magic
	tag = ARMORID

/datum/armor/proc/modifyRating(crush = 0, slash = 0, stab = 0, pierce = 0, fire = 0, acid = 0, magic = 0)
	return getArmor(src.crush+crush, src.slash+slash, src.stab+stab, src.pierce+pierce, src.fire+fire, src.acid+acid, src.magic+magic)

/datum/armor/proc/modifyAllRatings(modifier = 0)
	return getArmor(crush+modifier, slash+modifier, stab+modifier, pierce+modifier, fire+modifier, acid+modifier, magic+modifier)

//TODO! PORT BLACKSTONE BLUNT/SLASH/STAB ARMOR DEFINES!!!!!!
/datum/armor/proc/multiplymodifyAllRatings(modifier = 0)
	return getArmor(crush*modifier, slash*modifier, stab*modifier, pierce*modifier, fire*modifier, acid*modifier, magic*modifier)

/datum/armor/proc/setRating(crush, slash, stab, pierce, fire, acid, magic)
	return getArmor((isnull(crush) ? src.crush : crush),\
					(isnull(slash) ? src.slash : slash),\
					(isnull(stab) ? src.stab : stab),\
					(isnull(pierce) ? src.pierce : pierce),\
					(isnull(fire) ? src.fire : fire),\
					(isnull(acid) ? src.acid : acid),\
					(isnull(magic) ? src.magic : magic))

/datum/armor/proc/getRating(rating)
	return vars[rating]

/datum/armor/proc/getList()
	return list("crush" = crush, "slash" = slash, "stab" = stab, "pierce" = pierce, "fire" = fire, "acid" = acid, "magic" = magic)

/datum/armor/proc/attachArmor(datum/armor/AA)
	return getArmor(crush+AA.crush, slash+AA.slash, stab+AA.stab, pierce+AA.pierce, fire+AA.fire, acid+AA.acid, magic+AA.magic)

/datum/armor/proc/detachArmor(datum/armor/AA)
	return getArmor(crush-AA.crush, slash-AA.slash, stab-AA.stab, pierce-AA.pierce, fire-AA.fire, acid-AA.acid, magic-AA.magic)

/datum/armor/vv_edit_var(var_name, var_value)
	if (var_name == NAMEOF(src, tag))
		return FALSE
	. = ..()
	tag = ARMORID // update tag in case armor values were edited

#undef ARMORID
