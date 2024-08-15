/datum/reagent/medicine/healthpot
	name = "Health Potion"
	description = "Gradually regenerates brute and brain damage."
	reagent_state = LIQUID
	color = "#ff0000"
	taste_description = "red"
	overdose_threshold = 0
	metabolization_rate = 20 * REAGENTS_METABOLISM
	alpha = 173

/datum/reagent/medicine/healthpot/on_mob_life(mob/living/carbon/M)
	M.adjustBruteLoss(-0.1*REM, 0)
	M.adjustOxyLoss(-1, 0)
	M.adjustOrganLoss(ORGAN_SLOT_BRAIN, -1*REM)
	M.adjustCloneLoss(-1*REM, 0)
	..()
	. = 1

/datum/reagent/medicine/manapot
	name = "Manna Potion"
	description = "Gradually regenerates stamina."
	reagent_state = LIQUID
	color = "#0000ff"
	taste_description = "manna"
	overdose_threshold = 0
	metabolization_rate = 20 * REAGENTS_METABOLISM
	alpha = 173

/datum/reagent/medicine/manapot/on_mob_life(mob/living/carbon/M)
	M.rogstam_add(100)
	..()
	. = 1

/datum/reagent/medicine/burnpot
	name = "Burn Potion"
	description = "Gradually regenerates burns."
	reagent_state = LIQUID
	color = "#ff8000"
	taste_description = "strong bitter medicine"
	overdose_threshold = 0
	metabolization_rate = 20 * REAGENTS_METABOLISM
	alpha = 173

/datum/reagent/medicine/burnpot/on_mob_life(mob/living/carbon/M)
	M.adjustFireLoss(-0.5*REM, 0)

/datum/reagent/medicine/bloodpot
	name = "Replenishment Potion"
	description = "Gradually regenerates blood volume."
	reagent_state = LIQUID
	color = "#ff0055"
	taste_description = "iron"
	overdose_threshold = 0
	metabolization_rate = 20 * REAGENTS_METABOLISM
	alpha = 173

/datum/reagent/medicine/bloodpot/on_mob_life(mob/living/carbon/M)
	if(M.blood_volume < BLOOD_VOLUME_NORMAL)
		M.blood_volume = min(M.blood_volume+50, BLOOD_VOLUME_MAXIMUM)
	else
		//can overfill you with blood, but at a slower rate
		M.blood_volume = min(M.blood_volume+10, BLOOD_VOLUME_MAXIMUM)
	M.add_nausea(9) // iron supplements can make you nauseous!

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

/datum/reagent/berrypoison
	name = "Berry Poison"
	description = "f"
	reagent_state = LIQUID
	color = "#00B4FF"
	metabolization_rate = 0.1

/datum/reagent/berrypoison/on_mob_life(mob/living/carbon/M)
	M.add_nausea(9)
	M.adjustToxLoss(3, 0)
	return ..()

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
