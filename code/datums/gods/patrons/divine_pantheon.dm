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
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t1 = /obj/effect/proc_holder/spell/invoked/sacred_flame_rogue
	t2 = /obj/effect/proc_holder/spell/invoked/heal
	t3 = /obj/effect/proc_holder/spell/invoked/revive

/datum/patron/divine/noc
	name = "Noc"
	domain = "God of Knowledge, the Moon Prince"
	desc = "The Firstborn of the Forgotten God, twin of Astrata, gifted mankind divine wisdom."
	flaws = "Resentful, Vindictive, Haughty"
	worshippers = "Magic Practitioners, Scholars, Scribes"
	sins = "Ignorance, Burning Books, Indulgence of Lust"
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t1 = /obj/effect/proc_holder/spell/invoked/blindness
	t2 = null
	t3 = null

// ............ FORCES ..................
/datum/patron/divine/dendor
	name = "Dendor"
	domain = "Force of Nature and Beasts"
	desc = "The embodiment of the unchanged natural world. Driven mad with time."
	flaws = "Madness, Rebelliousness, Disorderliness"
	worshippers = "Druids, Beasts, Madmen"
	sins = "Deforestation, Overhunting, Disrespecting Nature"
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t1 = /obj/effect/proc_holder/spell/targeted/blesscrop
	t2 = /obj/effect/proc_holder/spell/targeted/beasttame
	t3 = null

/datum/patron/divine/abyssor
	name = "Abyssor"
	domain = "Force of Seas and Storms"
	desc = "The World-Whale, the steward of the seas and storms."
	flaws= "Reckless, Stubborn, Destructive"
	worshippers = "Sailors of the Sea and Sky, Horrid Sea-Creachers, Fog Islanders"
	sins = "Fear, Hubris, Trying to Tame the Seas"

/datum/patron/divine/necra
	name = "Necra"
	domain = "Force of Death and Decay"
	desc = "The Veiled Lady, a feared but respected God and keeper of the dead."
	flaws = "Unchanging, Apathetic, Strict"
	worshippers = "Dark Elves, Gravekeepers, Mourners"
	sins = "Undeath"
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t1 = /obj/effect/proc_holder/spell/targeted/burialrite
	t2 = /obj/effect/proc_holder/spell/targeted/churn

// ............ SAINTS ..................
/datum/patron/divine/ravox
	name = "Ravox"
	domain = "Saint of Warfare, Struggle, and Chivalry"
	desc = "The blade of the Pantheon, a patron of all who struggle in warfare."
	flaws = "Carelessness, Aggression, Pride"
	worshippers = "Warriors, Sellswords, Guardsmen"
	sins = "Cowardice, Cruelty, Stagnation"

/datum/patron/divine/xylix
	name = "Xylix"
	domain = "Saint of Trickery, Freedom, and Inspiration"
	desc = "Some say he does not exist, but regardless he shadows the Pantheon."
	flaws = "Petulance, Deception, Irreverence"
	worshippers = "Cheats, Artists, the Hopeless"
	sins = "Boredom, Predictability, Routine"

/datum/patron/divine/pestra
	name = "Pestra"
	domain = "Saint of Disease, Alchemy, and Prophecy"
	desc = "The finest alchemist to ever live, made saint by her own brew."
	flaws = "Drunkenness, Crudeness, Irresponsibility"
	worshippers = "The Ill and Infirm, Alchemists, Necromancers"
	sins = "´Curing´ Abnormalities, Refusing to Help Unfortunates, Groveling"	
	t0 = /obj/effect/proc_holder/spell/invoked/diagnose
	t1 = /obj/effect/proc_holder/spell/invoked/heal
	t2 = /obj/effect/proc_holder/spell/invoked/attach_bodypart
	t3 = /obj/effect/proc_holder/spell/invoked/cure_rot

/datum/patron/divine/malum
	name = "Malum"
	domain = "Saint of Toil, Value, and Craft"
	desc = "Father of the dwarves, master of crafting and industry."
	flaws = "Obsessive, Exacting, Overbearing"
	worshippers = "Smiths, Miners, Artisans"
	sins = "Cheating, Shoddy Work, Suicide"

/datum/patron/divine/eora
	name = "Eora"
	domain = "Saint of Love, Life, and Beauty"
	desc = "A Saint who sees beauty everywhere and has not a shred of hate in her heart."
	flaws= "Naivete, Impulsiveness, Ignorance"
	worshippers = "Lovers, Nite-workers, Doting Grandparents"
	sins = "Sadism, Celibacy, Ruining Beauty"
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t1 = /obj/effect/proc_holder/spell/invoked/bud
	t2 = /obj/effect/proc_holder/spell/invoked/projectile/eoracurse
	t3 = null
