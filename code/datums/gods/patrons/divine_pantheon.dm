/datum/patron/divine
	name = null
	associated_faith = /datum/faith/divine_pantheon
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal

/datum/patron/divine/astrata
	name = "Astrata"
	domain = "Goddess of Order, the Sun Queen"
	desc = "The Firstborn of the Forgotten God, twin of Noc, gifted mankind the Sun."
	flaws = "Tyrannical, Ill-Tempered, Uncompromising"
	worshippers = "Nobles, Zealots, Commoners"
	sins = "Betrayal, Sloth, Witchcraft"
	boons = "Your stamina regeneration delay is lowered during daytime."
	added_traits = list(TRAIT_APRICITY)
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t1 = /obj/effect/proc_holder/spell/invoked/sacred_flame_rogue
	t2 = /obj/effect/proc_holder/spell/invoked/heal
	t3 = /obj/effect/proc_holder/spell/invoked/revive
	confess_lines = list(
		"ASTRATA IS MY LIGHT!",
		"ASTRATA BRINGS LAW!",
		"I SERVE THE GLORY OF THE SUN!",
	)

/datum/patron/divine/noc
	name = "Noc"
	domain = "God of Knowledge, the Moon Prince"
	desc = "The Firstborn of the Forgotten God, twin of Astrata, gifted mankind divine wisdom."
	flaws = "Resentful, Vindictive, Haughty"
	worshippers = "Magic Practitioners, Scholars, Scribes"
	sins = "Ignorance, Burning Books, Indulgence of Lust"
	boons = "You learn and teach apprentices slightly better."
	added_traits = list(TRAIT_TUTELAGE)
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t1 = /obj/effect/proc_holder/spell/invoked/invisibility
	t2 = /obj/effect/proc_holder/spell/invoked/blindness
	t3 = /obj/effect/proc_holder/spell/invoked/projectile/moondagger
	confess_lines = list(
		"NOC IS NIGHT!",
		"NOC SEES ALL!",
		"I SEEK THE MYSTERIES OF THE MOON!",
	)

/datum/patron/divine/dendor
	name = "Dendor"
	domain = "Force of Nature and Beasts"
	desc = "The embodiment of the unchanged natural world. Driven mad with time."
	flaws = "Madness, Rebelliousness, Disorderliness"
	worshippers = "Druids, Beasts, Madmen"
	sins = "Deforestation, Overhunting, Disrespecting Nature"
	boons = "You are immune to kneestingers."
	added_traits = list(TRAIT_KNEESTINGER_IMMUNITY)
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t1 = /obj/effect/proc_holder/spell/targeted/blesscrop
	t2 = /obj/effect/proc_holder/spell/self/beastsense
	t3 = /obj/effect/proc_holder/spell/targeted/beasttame
	confess_lines = list(
		"DENDOR PROVIDES!",
		"THE TREEFATHER BRINGS BOUNTY!",
		"I ANSWER THE CALL OF THE WILD!",
	)

/datum/patron/divine/abyssor
	name = "Abyssor"
	domain = "Force of Seas and Storms"
	desc = "The World-Whale, the sovereign of the seas and storms."
	flaws= "Reckless, Stubborn, Destructive"
	worshippers = "Sailors of the Sea and Sky, Horrid Sea-Creachers, Fog Islanders"
	sins = "Fear, Hubris, Trying to Tame the Seas"
	boons = "Leeches will not latch onto you in dirty water."
	added_traits = list(TRAIT_LEECHIMMUNE)
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal/abyssal
	t1 = /obj/effect/proc_holder/spell/invoked/projectile/purify
	t2 = /obj/effect/proc_holder/spell/invoked/icebind
	t3 = null
	//	t3 = /obj/effect/proc_holder/spell/invoked/elemental //Not finished.
	confess_lines = list(
		"ABYSSOR COMMANDS THE WAVES!",
		"THE OCEAN'S FURY IS ABYSSOR'S WILL!",
		"I AM DRAWN BY THE PULL OF THE TIDE!",
	)

/datum/patron/divine/necra
	name = "Necra"
	domain = "Force of Death and Decay"
	desc = "The Undermaiden, also known as the Veiled Lady. A feared but respected Force and keeper of the dead."
	flaws = "Unchanging, Apathetic, Strict"
	worshippers = "Dark Elves, Gravekeepers, Mourners"
	sins = "Undeath"
	boons = "You may see the presence of a soul in a body."
	added_traits = list(TRAIT_SOUL_EXAMINE)
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t1 = /obj/effect/proc_holder/spell/targeted/burialrite
	t2 = /obj/effect/proc_holder/spell/targeted/soulspeak
	t3 = /obj/effect/proc_holder/spell/targeted/churn
	confess_lines = list(
		"ALL SOULS FIND THEIR WAY TO NECRA!",
		"THE UNDERMAIDEN IS OUR FINAL REPOSE!",
		"I FEAR NOT DEATH, MY LADY AWAITS ME!",
	)

/datum/patron/divine/ravox
	name = "Ravox"
	domain = "Saint of Warfare, Struggle, and Chivalry"
	desc = "The blade of the Pantheon, a patron of all who struggle in warfare."
	flaws = "Carelessness, Aggression, Pride"
	worshippers = "Warriors, Sellswords, Guardsmen"
	sins = "Cowardice, Cruelty, Stagnation"
	boons = "Your used weapons dull slower."
	added_traits = list(TRAIT_SHARPER_BLADES)
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t1 = /obj/effect/proc_holder/spell/self/call_to_arms
	t2 = /obj/effect/proc_holder/spell/self/divine_strike
	t3 = /obj/effect/proc_holder/spell/invoked/persistence
	confess_lines = list(
		"RAVOX IS JUSTICE!",
		"THROUGH STRIFE, GRACE!",
		"THE DRUMS OF WAR BEAT IN MY CHEST!",
	)

/datum/patron/divine/xylix
	name = "Xylix"
	domain = "Saint of Trickery, Freedom, and Inspiration"
	desc = "Some say he does not exist, but regardless he shadows the Pantheon."
	flaws = "Petulance, Deception, Irreverence"
	worshippers = "Cheats, Artists, the Hopeless"
	sins = "Boredom, Predictability, Routine"
	boons = "You can rig different forms of gambling in your favor."
	added_traits = list(TRAIT_BLACKLEG)
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t1 = /obj/effect/proc_holder/spell/invoked/vicious_mimicry
	t2 = /obj/effect/proc_holder/spell/invoked/wheel
	confess_lines = list(
		"ASTRATA IS MY LIGHT!",
		"NOC IS NIGHT!",
		"DENDOR PROVIDES!",
		"ABYSSOR COMMANDS THE WAVES!",
		"RAVOX IS JUSTICE!",
		"ALL SOULS FIND THEIR WAY TO NECRA!",
		"HAHAHAHA! AHAHAHA! HAHAHAHA!", //the only xylix-related confession
		"PESTRA SOOTHES ALL ILLS!",
		"MALUM IS MY FORGE!",
		"EORA BRINGS US TOGETHER!",
	)

/datum/patron/divine/pestra
	name = "Pestra"
	domain = "Saint of Disease, Alchemy, and Prophecy"
	desc = "The finest alchemist to ever live, made saint by her own brew."
	flaws = "Drunkenness, Crudeness, Irresponsibility"
	worshippers = "The Ill and Infirm, Alchemists, Necromancers"
	sins = "´Curing´ Abnormalities, Refusing to Help Unfortunates, Groveling"
	boons = "You may consume rotten food without being sick."
	added_traits = list(TRAIT_ROT_EATER)
	t0 = /obj/effect/proc_holder/spell/invoked/diagnose
	t1 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t2 = /obj/effect/proc_holder/spell/invoked/attach_bodypart
	t3 = /obj/effect/proc_holder/spell/invoked/cure_rot
	confess_lines = list(
		"PESTRA SOOTHES ALL ILLS!",
		"DECAY IS A CONTINUATION OF LIFE!",
		"MY AFFLICTION IS MY TESTAMENT!",
	)

/datum/patron/divine/malum
	name = "Malum"
	domain = "Saint of Toil, Value, and Craft"
	desc = "Father of the dwarves, master of crafting and industry."
	flaws = "Obsessive, Exacting, Overbearing"
	worshippers = "Smiths, Miners, Artisans"
	sins = "Cheating, Shoddy Work, Suicide"
	boons = "You recover more energy when sleeping."
	added_traits = list(TRAIT_BETTER_SLEEP)
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t1 = /obj/effect/proc_holder/spell/invoked/vigorouscraft
	t2 = /obj/effect/proc_holder/spell/invoked/hammerfall
	t3 = /obj/effect/proc_holder/spell/invoked/heatmetal
	confess_lines = list(
		"MALUM IS MY FORGE!",
		"TRUE VALUE IS IN THE TOIL!",
		"I AM AN INSTRUMENT OF CREATION!",
	)

/datum/patron/divine/eora
	name = "Eora"
	domain = "Saint of Love, Life, and Beauty"
	desc = "A Saint who sees beauty everywhere and has not a shred of hate in her heart."
	flaws= "Naivete, Impulsiveness, Ignorance"
	worshippers = "Lovers, Nite-workers, Doting Grandparents"
	sins = "Sadism, Celibacy, Ruining Beauty"
	boons = "You can understand others' needs better."
	added_traits = list(TRAIT_EXTEROCEPTION)
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t1 = /obj/effect/proc_holder/spell/invoked/instill_perfection
	t2 = /obj/effect/proc_holder/spell/invoked/projectile/eoracurse
	t3 = /obj/effect/proc_holder/spell/invoked/bud
	confess_lines = list(
		"EORA BRINGS US TOGETHER!",
		"HER BEAUTY IS EVEN IN THIS TORMENT!",
		"I LOVE YOU, EVEN AS YOU TRESPASS AGAINST ME!",
	)
