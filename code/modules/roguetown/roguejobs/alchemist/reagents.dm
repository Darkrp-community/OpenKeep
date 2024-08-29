//Basic
/datum/reagent/additive
	name = "additive"
	reagent_state = LIQUID

//Potions
/datum/reagent/medicine/healthpot
	name = "Health Potion"
	description = "Gradually regenerates all types of damage."
	reagent_state = LIQUID
	color = "#ff0000"
	taste_description = "red"
	overdose_threshold = 0
	metabolization_rate = REAGENTS_METABOLISM * 3
	alpha = 173

/datum/reagent/medicine/healthpot/on_mob_life(mob/living/carbon/M)
	M.blood_volume = min(M.blood_volume+5, BLOOD_VOLUME_MAXIMUM)
	M.adjustBruteLoss(-2*REM, 0)
	M.adjustFireLoss(-2*REM, 0)
	M.adjustOxyLoss(-1, 0)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, -5*REM)
	M.adjustCloneLoss(-2*REM, 0)
	..()
	. = 1


/datum/reagent/medicine/stronghealth
	name = "Strong Health Potion"
	description = "Quickly regenerates all types of damage."
	color = "#420000"
	metabolization_rate = REAGENTS_METABOLISM * 10

/datum/reagent/medicine/stronghealth/on_mob_life(mob/living/carbon/M)
	M.blood_volume = min(M.blood_volume+5, BLOOD_VOLUME_MAXIMUM)
	M.adjustBruteLoss(-8*REM, 0)
	M.adjustFireLoss(-8*REM, 0)
	M.adjustOxyLoss(-5, 0)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, -5*REM)
	M.adjustCloneLoss(-5*REM, 0)
	..()
	. = 1

//
/datum/reagent/medicine/manapot
	name = "Mana Potion"
	description = "Gradually regenerates stamina."
	reagent_state = LIQUID
	color = "#000042"
	taste_description = "sweet mana"
	overdose_threshold = 0
	metabolization_rate = REAGENTS_METABOLISM * 8
	alpha = 173

/datum/reagent/medicine/manapot/on_mob_life(mob/living/carbon/M)
	M.rogstam_add(100)
	..()
	. = 1


/datum/reagent/medicine/strongmana
	name = "Strong Mana Potion"
	description = "Gradually regenerates stamina."
	color = "#0000ff"
	metabolization_rate = REAGENTS_METABOLISM * 10

/datum/reagent/medicine/strongmana/on_mob_life(mob/living/carbon/M)
	M.rogstam_add(200)
	..()
	. = 1


/datum/reagent/medicine/antidote
	name = "Poison Antidote"
	description = ""
	reagent_state = LIQUID
	color = "#00ff00"
	taste_description = "sickly sweet"
	metabolization_rate = REAGENTS_METABOLISM

/datum/reagent/medicine/antidote/on_mob_life(mob/living/carbon/M)
	M.adjustToxLoss(-4, 0)
	..()
	. = 1

/datum/reagent/medicine/diseasecure
	name = "Disease Cure"
	description = ""
	reagent_state = LIQUID
	color = "#004200"
	taste_description = "dirt"
	metabolization_rate = 30 * REAGENTS_METABOLISM

/datum/reagent/medicine/diseasecure/on_mob_life(mob/living/carbon/M)
	M.cure_disease()
	M.adjustToxLoss(-6, 0)
	..()
	. = 1

//Buff potions
/datum/reagent/buff
	description = ""
	reagent_state = LIQUID
	metabolization_rate = REAGENTS_METABOLISM

/datum/reagent/buff/strength
	name = "Strength"
	color = "#ff9000"
	taste_description = "old meat"

/datum/reagent/buff/strength/on_mob_life(mob/living/carbon/M)
	testing("str pot in system")
	if(M.has_status_effect(/datum/status_effect/buff/alch/strengthpot))
		return ..()
	if(M.reagents.has_reagent((/datum/reagent/buff/strength),4))
		M.apply_status_effect(/datum/status_effect/buff/alch/strengthpot)
		M.reagents.remove_reagent(/datum/reagent/buff/strength, M.reagents.get_reagent_amount(/datum/reagent/buff/strength))
	return ..()

/datum/reagent/buff/perception
	name = "Perception"
	color = "#ffff00"
	taste_description = "sweets"

/datum/reagent/buff/perception/on_mob_life(mob/living/carbon/M)
	testing("per pot in system")
	if(M.has_status_effect(/datum/status_effect/buff/alch/perceptionpot))
		return ..()
	if(M.reagents.has_reagent((/datum/reagent/buff/perception),4))
		M.apply_status_effect(/datum/status_effect/buff/alch/perceptionpot)
		M.reagents.remove_reagent(/datum/reagent/buff/perception, M.reagents.get_reagent_amount(/datum/reagent/buff/perception))
	return ..()

/datum/reagent/buff/intelligence
	name = "Intelligence"
	color = "#00ff90"
	taste_description = "sweets"

/datum/reagent/buff/intelligence/on_mob_life(mob/living/carbon/M)
	testing("int pot in system")
	if(M.has_status_effect(/datum/status_effect/buff/alch/intelligencepot))
		return ..()
	if(M.reagents.has_reagent((/datum/reagent/buff/intelligence),4))
		M.apply_status_effect(/datum/status_effect/buff/alch/intelligencepot)
		M.reagents.remove_reagent(/datum/reagent/buff/intelligence, M.reagents.get_reagent_amount(/datum/reagent/buff/intelligence))
	return ..()

/datum/reagent/buff/constitution
	name = "Constitution"
	color = "#ffff00"
	taste_description = "sweets"

/datum/reagent/buff/constitution/on_mob_life(mob/living/carbon/M)
	testing("con pot in system")
	if(M.has_status_effect(/datum/status_effect/buff/alch/constitutionpot))
		return ..()
	if(M.reagents.has_reagent((/datum/reagent/buff/constitution),4))
		M.apply_status_effect(/datum/status_effect/buff/alch/constitutionpot)
		M.reagents.remove_reagent(/datum/reagent/buff/constitution, M.reagents.get_reagent_amount(/datum/reagent/buff/constitution))
	return ..()

/datum/reagent/buff/endurance
	name = "Endurance"
	color = "#ffff00"
	taste_description = "sweets"

/datum/reagent/buff/endurance/on_mob_life(mob/living/carbon/M)
	testing("end pot in system")
	if(M.has_status_effect(/datum/status_effect/buff/alch/endurancepot))
		return ..()
	if(M.reagents.has_reagent((/datum/reagent/buff/endurance),4))
		M.apply_status_effect(/datum/status_effect/buff/alch/endurancepot)
		M.reagents.remove_reagent(/datum/reagent/buff/endurance, M.reagents.get_reagent_amount(/datum/reagent/buff/endurance))
	return ..()

/datum/reagent/buff/speed
	name = "Speed"
	color = "#ffff00"
	taste_description = "sweets"

/datum/reagent/buff/speed/on_mob_life(mob/living/carbon/M)
	testing("spd pot in system")
	if(M.has_status_effect(/datum/status_effect/buff/alch/speedpot))
		return ..()
	if(M.reagents.has_reagent((/datum/reagent/buff/speed),4))
		M.apply_status_effect(/datum/status_effect/buff/alch/speedpot)
		M.reagents.remove_reagent(/datum/reagent/buff/speed, M.reagents.get_reagent_amount(/datum/reagent/buff/speed))
	return ..()

/datum/reagent/buff/fortune
	name = "Fortune"
	color = "#ffff00"
	taste_description = "sweets"

/datum/reagent/buff/fortune/on_mob_life(mob/living/carbon/M)
	testing("luck pot in system")
	if(M.has_status_effect(/datum/status_effect/buff/alch/fortunepot))
		return ..()
	if(M.reagents.has_reagent((/datum/reagent/buff/fortune),4))
		M.apply_status_effect(/datum/status_effect/buff/alch/fortunepot)
		M.reagents.remove_reagent(/datum/reagent/buff/fortune, M.reagents.get_reagent_amount(/datum/reagent/buff/fortune))
	return ..()


//Poisons
/datum/reagent/berrypoison
	name = "Berry Poison"
	description = ""
	reagent_state = LIQUID
	color = "#00B4FF"
	taste_description = "burning"
	metabolization_rate = REAGENTS_METABOLISM

/datum/reagent/berrypoison/on_mob_life(mob/living/carbon/M)
	M.add_nausea(9)
	M.adjustToxLoss(3, 0)
	return ..()


/datum/reagent/strongpoison
	name = "Strong Poison"
	description = ""
	reagent_state = LIQUID
	color = "#000000"
	taste_description = "burning"
	metabolization_rate = REAGENTS_METABOLISM

/datum/reagent/strongpoison/on_mob_life(mob/living/carbon/M)
	M.add_nausea(20)
	M.adjustToxLoss(12, 0)
	return ..()

//Potion reactions
/datum/chemical_reaction/alch/stronghealth
	name = "Strong Health Potion"
	id = /datum/reagent/medicine/stronghealth
	results = list(/datum/reagent/medicine/stronghealth = 5)
	required_reagents = list(/datum/reagent/medicine/healthpot = 5, /datum/reagent/additive = 5)
	mix_message = "The cauldron glows for a moment."
/datum/chemical_reaction/alch/strongmana
	name = "Strong Mana Potion"
	id = /datum/reagent/medicine/strongmana
	results = list(/datum/reagent/medicine/strongmana = 5)
	required_reagents = list(/datum/reagent/medicine/manapot = 5, /datum/reagent/additive = 5)
	mix_message = "The cauldron glows for a moment."

/datum/chemical_reaction/alch/strongpoison
	name = "Strong Health Potion"
	id = /datum/reagent/strongpoison
	results = list(/datum/reagent/strongpoison = 5)
	required_reagents = list(/datum/reagent/berrypoison = 5, /datum/reagent/additive = 5)
	mix_message = "The cauldron glows for a moment."


/*----------\
|Ingredients|
\----------*/
/datum/reagent/undeadash
	name = "Spectral Powder"
	description = ""
	reagent_state = SOLID
	color = "#330066"
	taste_description = "tombstones"
	metabolization_rate = 0.1

/datum/reagent/toxin/fyritiusnectar
	name = "fyritius nectar"
	description = "oh no"
	reagent_state = LIQUID
	color = "#ffc400"
	metabolization_rate = 0.5

/datum/reagent/toxin/fyritiusnectar/on_mob_life(mob/living/carbon/M)
	M.add_nausea(9)
	M.adjustFireLoss(2, 0)
	M.adjust_fire_stacks(1)
	M.IgniteMob()
	return ..()
