/obj/effect/proc_holder/spell/targeted/blesscrop
	name = "Bless Crops"
	range = 5
	overlay_state = "blesscrop"
	releasedrain = 30
	charge_max = 30 SECONDS
	req_items = list(/obj/item/clothing/neck/roguetown/psycross/silver/dendor)
	max_targets = 0
	cast_without_targets = TRUE
	sound = 'sound/magic/churn.ogg'
	associated_skill = /datum/skill/magic/holy
	invocation = "The Treefather commands thee, be fruitful!"
	invocation_type = "shout" //can be none, whisper, emote and shout
	miracle = TRUE
	devotion_cost = -15

/obj/effect/proc_holder/spell/targeted/blesscrop/cast(list/targets,mob/user = usr)
	. = ..()
	var/growed = FALSE
	var/amount_blessed = 0
	for(var/obj/structure/soil/soil in view(4))
		soil.bless_soil()
		growed = TRUE
		amount_blessed++
		// Blessed only up to 5 crops
		if(amount_blessed >= 5)
			break
	if(growed)
		visible_message("<FONT COLOR='green'>[usr] blesses the crop with Dendor's Favour!</FONT><BR>")
	return growed

//At some point, this spell should Awaken beasts, allowing a ghost to possess them. Not for this PR though.
/obj/effect/proc_holder/spell/targeted/beasttame
	name = "Tame Beast"
	range = 5
	overlay_state = "tamebeast"
	releasedrain = 30
	charge_max = 30 SECONDS
	req_items = list(/obj/item/clothing/neck/roguetown/psycross/silver/dendor)
	max_targets = 0
	cast_without_targets = TRUE
	sound = 'sound/magic/churn.ogg'
	associated_skill = /datum/skill/magic/holy
	invocation = "Be still and calm, brotherbeast."
	invocation_type = "whisper" //can be none, whisper, emote and shout
	miracle = TRUE
	devotion_cost = -60

/obj/effect/proc_holder/spell/targeted/beasttame/cast(list/targets,mob/user = usr)
	visible_message("<FONT COLOR='green'>[usr] soothes the beastblood with Dendor's whisper.</FONT><BR>")
	for(var/mob/living/simple_animal/hostile/retaliate/B in oview(2))
		if((B.mob_biotypes & MOB_UNDEAD))
			continue
		B.aggressive = 0
		B.tamed(user)

/obj/effect/proc_holder/spell/targeted/conjure_kneestingers
	name = "Fungal Illumination"
	range = 1
	overlay_state = "blesscrop"
	releasedrain = 30
	charge_max = 30 SECONDS
	max_targets = 0
	cast_without_targets = TRUE
	sound = 'sound/items/dig_shovel.ogg'
	associated_skill = /datum/skill/magic/holy
	req_items = list(/obj/item/clothing/neck/roguetown/psycross/silver/dendor)
	invocation = "Treefather light the way."
	invocation_type = "whisper" //can be none, whisper, emote and shout

/obj/effect/proc_holder/spell/targeted/conjure_kneestingers/cast(list/targets,mob/user = usr)
	var/turf/T = user.loc
	new /obj/structure/kneestingers(T)

/* The old more powerful version that spwans 4 kneestingers instead of one
/obj/effect/proc_holder/spell/targeted/conjure_kneestingers/cast(list/targets,mob/user = usr)
	var/turf/T = user.loc
	for(var/X in GLOB.cardinals)
		var/turf/TT = get_step(T, X)
		if(!isclosedturf(TT) && !locate(/obj/structure/kneestingers) in TT)
			if(prob(50))	// added this but meh, not good
				new /obj/structure/kneestingers(TT)
	return TRUE
*/
