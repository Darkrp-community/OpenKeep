// Malumite miracles

/obj/effect/proc_holder/spell/targeted/restoresteel
	name = "Restore Steel"
	range = 5
	overlay_state = "restoresteel"
	releasedrain = 30
	charge_max = 30 SECONDS
	req_items = list(/obj/item/clothing/neck/roguetown/psycross/silver/malum)
	max_targets = 0
	cast_without_targets = TRUE
	sound = 'sound/magic/churn.ogg'
	associated_skill = /datum/skill/magic/holy
	invocation = ""
	invocation_type = "shout" //can be none, whisper, emote and shout
	miracle = TRUE
	devotion_cost = -15

/obj/effect/proc_holder/spell/targeted/shieldofmalum
	name = "Shield of Malum"
	desc = "Briefly strengthens armor beyond its usual properties."
	overlay_state = "shieldofmalum"
	charge_max = 12 MINUTES
	req_items = list(/obj/item/clothing/neck/roguetown/psycross/silver/dendor)
	invocation = "Beast-Lord, lend me the eyes of the zad, the nose of the volf."
	invocation_type = "whisper"
	cooldown_min = 10 MINUTES
	releasedrain = 30

/obj/effect/proc_holder/spell/self/beastsense/cast(list/targets,mob/living/user = usr)
	playsound(get_turf(user), 'sound/vo/smokedrag.ogg', 100, TRUE)
	sleep(pick(50,70,90))
	to_chat(user, span_notice("A raven passes overhead....your prayer was heard"))
	playsound(get_turf(user), 'sound/vo/mobs/bird/CROW_01.ogg', 60, TRUE, -1)
	sleep(20)
	if((iself(user)))	// already got night vision so lets not fuck it up, instead get +1 PER
		user.apply_status_effect(/datum/status_effect/buff/beastsense_elf)
		return
	user.apply_status_effect(/datum/status_effect/buff/beastsense)

/obj/effect/proc_holder/spell/targeted/forgevitality
	name = "Forge's Vitality"
	range = 5
	overlay_state = "forgevitality"
	releasedrain = 30
	charge_max = 6 MINUTES
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
	playsound(get_turf(user), 'sound/vo/smokedrag.ogg', 100, TRUE)
	visible_message("<FONT COLOR='green'>[usr] soothes the beastblood with Dendor's whisper.</FONT><BR>")
	for(var/mob/living/simple_animal/hostile/retaliate/B in oview(2))
		if((B.mob_biotypes & MOB_UNDEAD))
			continue
		B.aggressive = 0
		B.tamed(user)

