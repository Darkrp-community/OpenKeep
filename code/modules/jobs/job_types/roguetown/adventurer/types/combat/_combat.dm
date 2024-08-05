/datum/advclass/combat
    maximum_possible_slots = 2
    min_pq = 1

/datum/outfit/job/roguetown/adventurer/pre_equip(mob/living/carbon/human/H)
    ..()
    H.client?.adjust_triumphs(-1)