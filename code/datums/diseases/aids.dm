/datum/disease/sexdisease // basically AIDS
	name = "Love Plague"
	max_stages = 3
	stage = 1
	spread_flags = DISEASE_SPREAD_SPECIAL
	disease_flags = CAN_CARRY | CAN_RESIST
	viable_mobtypes = list(/mob/living/carbon/human)
	stage_prob = 5

/datum/disease/sexdisease/stage_act()
	. = ..()
	switch(stage)
		if(2)
			if(prob(5))
				affected_mob.bodytemperature += rand(0.1,1)
			if(prob(5))
				to_chat(affected_mob, "<span class='warning'>[pick("It iches down there...", "Ugh... it itches down there...", "Why does it have to itch down there?!")]</span>")
		if(3)
			if(prob(5))
				affected_mob.bodytemperature += rand(0.5,2)
			if(prob(5))
				to_chat(affected_mob, "<span class='warning'>[pick("It's burning down there! Argh!", "IT'S BUURNING!!!", "GAAAAAARGH! HEEELP! BURNING!")]</span>")
	return