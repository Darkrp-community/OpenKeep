/datum/mob_descriptor/age
	name = "Age"
	slot = MOB_DESCRIPTOR_SLOT_AGE
	verbage = "looks"

/datum/mob_descriptor/age/can_describe(mob/living/described)
	if(!ishuman(described))
		return FALSE
	return TRUE

/datum/mob_descriptor/age/get_description(mob/living/described)
	var/mob/living/carbon/human/human = described
	switch(human.age)
		if(AGE_OLD)
			return "old"
		if(AGE_MIDDLEAGED)
			return "middle-aged"
	//ADULT and IMMORTAL
	return "of adult age"
