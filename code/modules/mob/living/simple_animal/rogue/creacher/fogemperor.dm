
/* Still wip. Move along.

/mob/living/simple_animal/hostile/megafauna/colossus/fogemperor
	name = "The Heavenly Emperor of Fog Islands Koyanagi Abyssancti"
	desc = "WHAT IS THE DEATH OF GOD'S WILL?<br>\
    THE DISAPPOINTMENT OF ONE SO GREATER <br>\
    WILL LEAD TO THE DOWNFALL OF ALL"
	health = 2500
	maxHealth = 2500
	attack_verb_continuous = "judges"
	attack_verb_simple = "judge"
	attack_sound = 'sound/blank.ogg'
	icon_state = "eva"
	icon_living = "eva"
	icon_dead = ""
	friendly_verb_continuous = "stares down"
	friendly_verb_simple = "stare down"
	icon = 'icons/mob/lavaland/96x96megafauna.dmi'
	speak_emote = list("roars")
	armor_penetration = 40
	melee_damage_lower = 40
	melee_damage_upper = 40
	speed = 10
	move_to_delay = 10
	ranged = TRUE
	pixel_x = -32
	del_on_death = TRUE
	gps_name = "Angelic Signal"
	achievement_type = /datum/award/achievement/boss/colussus_kill
	crusher_achievement_type = /datum/award/achievement/boss/colussus_crusher
	score_achievement_type = /datum/award/score/colussus_score
	crusher_loot = list(/obj/structure/closet/crate/necropolis/colossus/crusher)
	loot = list(/obj/structure/closet/crate/necropolis/colossus)
	deathmessage = "disintegrates, leaving a glowing core in its wake."
	deathsound = 'sound/blank.ogg'
	attack_action_types = list(/datum/action/innate/megafauna_attack/spiral_attack,
							   /datum/action/innate/megafauna_attack/aoe_attack,
							   /datum/action/innate/megafauna_attack/shotgun,
							   /datum/action/innate/megafauna_attack/alternating_cardinals)
	small_sprite_type = /datum/action/small_sprite/megafauna/colossus

/datum/action/innate/megafauna_attack/spiral_attack
	name = "Spiral Shots"
	icon_icon = 'icons/mob/actions/actions_items.dmi'
	button_icon_state = "sniper_zoom"
	chosen_message = "<span class='colossus'>I are now firing in a spiral.</span>"
	chosen_attack_num = 1

/datum/action/innate/megafauna_attack/aoe_attack
	name = "All Directions"
	icon_icon = 'icons/effects/effects.dmi'
	button_icon_state = "at_shield2"
	chosen_message = "<span class='colossus'>I are now firing in all directions.</span>"
	chosen_attack_num = 2

/datum/action/innate/megafauna_attack/shotgun
	name = "Shotgun Fire"
	icon_icon = 'icons/obj/guns/projectile.dmi'
	button_icon_state = "shotgun"
	chosen_message = "<span class='colossus'>I are now firing shotgun shots where you aim.</span>"
	chosen_attack_num = 3

/datum/action/innate/megafauna_attack/alternating_cardinals
	name = "Alternating Shots"
	icon_icon = 'icons/obj/guns/projectile.dmi'
	button_icon_state = "pistol"
	chosen_message = "<span class='colossus'>I are now firing in alternating cardinal directions.</span>"
	chosen_attack_num = 4

/mob/living/simple_animal/hostile/megafauna/colossus/OpenFire()
	anger_modifier = CLAMP(((maxHealth - health)/50),0,20)
	ranged_cooldown = world.time + 120

	if(client)
		switch(chosen_attack)
			if(1)
				select_spiral_attack()
			if(2)
				random_shots()
			if(3)
				blast()
			if(4)
				alternating_dir_shots()
		return

	if(enrage(target))
		if(move_to_delay == initial(move_to_delay))
			visible_message("<span class='colossus'>\"<b>I can't dodge.</b>\"</span>")
		ranged_cooldown = world.time + 30
		telegraph()
		dir_shots(GLOB.alldirs)
		move_to_delay = 3
		return
	else
		move_to_delay = initial(move_to_delay)

	if(prob(20+anger_modifier)) //Major attack
		select_spiral_attack()
	else if(prob(20))
		random_shots()
	else
		if(prob(70))
			blast()
		else
			alternating_dir_shots()

/mob/living/simple_animal/hostile/megafauna/colossus/proc/enrage(mob/living/L)
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		if(H.mind)
			if(istype(H.mind.martial_art, /datum/martial_art/the_sleeping_carp))
				. = TRUE

/mob/living/simple_animal/hostile/megafauna/colossus/proc/alternating_dir_shots()
	ranged_cooldown = world.time + 40
	dir_shots(GLOB.diagonals)
	SLEEP_CHECK_DEATH(10)
	dir_shots(GLOB.cardinals)
	SLEEP_CHECK_DEATH(10)
	dir_shots(GLOB.diagonals)
	SLEEP_CHECK_DEATH(10)
	dir_shots(GLOB.cardinals)

/mob/living/simple_animal/hostile/megafauna/colossus/proc/select_spiral_attack()
	telegraph()
	if(health < maxHealth/3)
		return double_spiral()
	visible_message("<span class='colossus'>\"<b>Judgement.</b>\"</span>")
	return spiral_shoot()

/mob/living/simple_animal/hostile/megafauna/colossus/proc/double_spiral()
	visible_message("<span class='colossus'>\"<b>Die.</b>\"</span>")

	SLEEP_CHECK_DEATH(10)
	INVOKE_ASYNC(src, PROC_REF(spiral_shoot), FALSE)
	INVOKE_ASYNC(src, PROC_REF(spiral_shoot), TRUE)

/mob/living/simple_animal/hostile/megafauna/colossus/proc/spiral_shoot(negative = pick(TRUE, FALSE), counter_start = 8)
	var/turf/start_turf = get_step(src, pick(GLOB.alldirs))
	var/counter = counter_start
	for(var/i in 1 to 80)
		if(negative)
			counter--
		else
			counter++
		if(counter > 16)
			counter = 1
		if(counter < 1)
			counter = 16
		shoot_projectile(start_turf, counter * 22.5)
		playsound(get_turf(src), 'sound/blank.ogg', 20, TRUE)
		SLEEP_CHECK_DEATH(1)

/mob/living/simple_animal/hostile/megafauna/colossus/proc/shoot_projectile(turf/marker, set_angle)
	if(!isnum(set_angle) && (!marker || marker == loc))
		return
	var/turf/startloc = get_turf(src)
	var/obj/projectile/P = new /obj/projectile/colossus(startloc)
	P.preparePixelProjectile(marker, startloc)
	P.firer = src
	if(target)
		P.original = target
	P.fire(set_angle)

/mob/living/simple_animal/hostile/megafauna/colossus/proc/random_shots()
	ranged_cooldown = world.time + 30
	var/turf/U = get_turf(src)
	playsound(U, 'sound/blank.ogg', 300, TRUE, 5)
	for(var/T in RANGE_TURFS(12, U) - U)
		if(prob(5))
			shoot_projectile(T)

/mob/living/simple_animal/hostile/megafauna/colossus/proc/blast(set_angle)
	ranged_cooldown = world.time + 20
	var/turf/target_turf = get_turf(target)
	playsound(src, 'sound/blank.ogg', 200, TRUE, 2)
	newtonian_move(get_dir(target_turf, src))
	var/angle_to_target = Get_Angle(src, target_turf)
	if(isnum(set_angle))
		angle_to_target = set_angle
	var/static/list/colossus_shotgun_shot_angles = list(12.5, 7.5, 2.5, -2.5, -7.5, -12.5)
	for(var/i in colossus_shotgun_shot_angles)
		shoot_projectile(target_turf, angle_to_target + i)

/mob/living/simple_animal/hostile/megafauna/colossus/proc/dir_shots(list/dirs)
	if(!islist(dirs))
		dirs = GLOB.alldirs.Copy()
	playsound(src, 'sound/blank.ogg', 200, TRUE, 2)
	for(var/d in dirs)
		var/turf/E = get_step(src, d)
		shoot_projectile(E)

/mob/living/simple_animal/hostile/megafauna/colossus/proc/telegraph()
	for(var/mob/M in range(10,src))
		if(M.client)
			flash_color(M.client, "#C80000", 1)
			shake_camera(M, 4, 3)
	playsound(src, 'sound/blank.ogg', 200, TRUE)


/mob/living/simple_animal/hostile/megafauna/colossus/devour(mob/living/L)
	visible_message("<span class='colossus'>[src] disintegrates [L]!</span>")
	L.dust()

/obj/effect/temp_visual/at_shield
	name = "anti-toolbox field"
	desc = ""
	icon = 'icons/effects/effects.dmi'
	icon_state = "at_shield2"
	layer = FLY_LAYER
	light_range = 2
	duration = 8
	var/target

/obj/effect/temp_visual/at_shield/Initialize(mapload, new_target)
	. = ..()
	target = new_target
	INVOKE_ASYNC(src, TYPE_PROC_REF(/atom/movable, orbit), target, 0, FALSE, 0, 0, FALSE, TRUE)

/mob/living/simple_animal/hostile/megafauna/colossus/bullet_act(obj/projectile/P)
	if(!stat)
		var/obj/effect/temp_visual/at_shield/AT = new /obj/effect/temp_visual/at_shield(loc, src)
		var/random_x = rand(-32, 32)
		AT.pixel_x += random_x

		var/random_y = rand(0, 72)
		AT.pixel_y += random_y
	return ..()

/obj/projectile/colossus
	name ="death bolt"
	icon_state= "chronobolt"
	damage = 25
	armor_penetration = 100
	speed = 2
	eyeblur = 0
	damage_type = BRUTE
	pass_flags = PASSTABLE

/obj/projectile/colossus/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(isturf(target) || isobj(target))
		target.ex_act(EXPLODE_HEAVY)
*/
