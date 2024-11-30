/datum/skill/combat
	abstract_type = /datum/skill/combat
	name = "Combat"
	desc = ""
	dream_cost_base = 2
	dream_cost_per_level = 1

/datum/skill/combat/proc/get_skill_parry_modifier(level) //added parry drain/neg in parries and dodges
	switch(level)
		if(SKILL_LEVEL_NONE)
			return 0
		if(SKILL_LEVEL_NOVICE)
			return 5
		if(SKILL_LEVEL_APPRENTICE)
			return 10
		if(SKILL_LEVEL_JOURNEYMAN)
			return 15
		if(SKILL_LEVEL_EXPERT)
			return 20
		if(SKILL_LEVEL_MASTER)
			return 25
		if(SKILL_LEVEL_LEGENDARY)
			return 35

/datum/skill/combat/proc/get_skill_dodge_drain(level) //added parry drain/neg in parries and dodges
	switch(level)
		if(SKILL_LEVEL_NONE)
			return 30
		if(SKILL_LEVEL_NOVICE)
			return 60
		if(SKILL_LEVEL_APPRENTICE)
			return 90
		if(SKILL_LEVEL_JOURNEYMAN)
			return 120
		if(SKILL_LEVEL_EXPERT)
			return 180
		if(SKILL_LEVEL_MASTER)
			return 240
		if(SKILL_LEVEL_LEGENDARY)
			return 300

/datum/skill/combat/knives
	name = "Knife-fighting"
	dreams = list(
		"...you're thrown to the dirt by volves - panicking and flailing, one lunges to rip your neck out, only for blood to flow from its maw as steel is plunged into its nape...."
	)

/datum/skill/combat/swords
	name = "Sword-fighting"
	dreams = list(
		"...your heart beats wildly as your swords strike eachothers, you parry your opponent and finish him off with a decisive slash..."
	)

/datum/skill/combat/polearms
	name = "Polearms"
	dreams = list(
		"...his mouth meets his head, his teeth meets teeth, blood gushes from his mouth after a firm strike - you have no blade, yet you're armed..."
	)

/datum/skill/combat/axesmaces
	name = "Axes & Maces"
	dreams = list(
		"...you drag your finger across the edge. picking it up from the table, you round the corner, and stare at your ailing father..."
	)

/datum/skill/combat/whipsflails
	name = "Whips & Flails"
	dreams = list(
		"...you have a nightmare - accused of heresy, you reel and strike, skin sloughs off their back... you blink, you're the one in chains..."
	)

/datum/skill/combat/bows
	name = "Archery"
	dreams = list(
		"...you nock the arrow, and let it loose... as you have a hundred times before... tonight, he dies... the arrow flies through the carriage, you hear shrieking and... sobbing...?"
	)

/datum/skill/combat/crossbows
	name = "Crossbows"
	dreams = list(
		"...in your hands, it feels like it's the perfect weight. you rest the stock against your gut and pull the string back... and you raise your sights on the crowd below..."
	)

/datum/skill/combat/firearms
	name = "Firearms"
	dreams = list(
		"...one shot... you smell the sulfur... you spit the dirt out of your mouth, and blink the blood away... now... you know... you love to reload during a battle..."
	)

/datum/skill/combat/wrestling
	name = "Wrestling"
	dreams = list(
		"...he won't listen, your companion dies on the operating table. you feel nothing. you grab the medicine-man's head, and begin to twist... the screams, oh, what joyous whimsy..."
	)

/datum/skill/combat/unarmed
	name = "Fist-fighting"
	dreams = list(
		"...ailing and old, the same guard comes back for a daily beating... you grit your teeth... you smile... the old shall teach the young a lesson in violence..."
	)

/datum/skill/combat/shields
	name = "Shields"
	dreams = list(
		"...the deadite claws on the door, another crashes through a window... in a panic, you grab a chair, and utter a prayer to Necra..."
	)
