/datum/patron/divine
	name = null
	associated_faith = /datum/faith/divine_pantheon
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal

/datum/patron/divine/astrata
	name = "Astrata"
	domain = "Goddess of Order, the Sun Queen"
	desc = "The Firstborn of Psydon, twin of Noc, gifted man the Sun as her divine gift."
	flaws = "Tyrannical, Fury, Uncompromising"
	worshippers = "Nobles, Zealots, Commoners"
	sins = "Betrayal, Sloth, Witchcraft"
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t1 = /obj/effect/proc_holder/spell/invoked/sacred_flame_rogue
	t2 = /obj/effect/proc_holder/spell/invoked/heal
	t3 = /obj/effect/proc_holder/spell/invoked/revive

/datum/patron/divine/noc
	name = "Noc"
	domain = "God of Knowledge, the Moon Prince"
	desc = "The Firstborn of Psydon, twin of Astrata, gifted man divine knowledge."
	flaws = "Resentful, Vindictive, Haughty"
	worshippers = "Magic Practitioners, Scholars, Scribes"
	sins = "Ignorance, Burning books, Carnal desire"

// ............ FORCES ..................
/datum/patron/divine/dendor
	name = "Dendor"
	domain = "Force of Nature and Beasts"
	desc = "The Primordial Son of Psydon, patron of beasts and the wood. Gone mad with time."
	flaws = "Madness, Rebellious, Disorderly"
	worshippers = "Druids, Beasts, Madmen"
	sins = "Deforestation, Overhunting, Disrespecting nature"
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t1 = /obj/effect/proc_holder/spell/targeted/blesscrop
	t2 = /obj/effect/proc_holder/spell/targeted/beasttame
	t3 = null

/datum/patron/divine/abyssor
	name = "Abyssor"
	domain = "Force of Seas and Storms"
	desc = "The World Whale, one of the three primordial forces."
	flaws= "Reckless, Stubborn, Destructive"
	worshippers = "Men of the Sea and Sky, Horrid sea-creechers"
	sins = "Fear, Hubris, Trying to tame water and storms"

/datum/patron/divine/necra
	name = "Necra"
	domain = "Force of Death and Decay"
	desc = "The Veiled Lady, a feared but respected God who leads the dead."
	flaws = "Unchanging, Apathetic, Strict"
	worshippers = " The Dead, Gravekeepers and Mourners"
	sins = "Undeath"
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t1 = /obj/effect/proc_holder/spell/targeted/burialrite
	t2 = /obj/effect/proc_holder/spell/targeted/churn

// ............ SAINTS ..................
/datum/patron/divine/ravox
	name = "Ravox"
	domain = "Saint of Warfare, Struggle and Chivalry"
	desc = "The strong-arm of the Pantheon, he watches man from afar."
	flaws = "Careless, Confrontational, Proud"
	worshippers = "Warriors, Sellswords & the Ambitious"
	sins = "Cowardice, Cruelty, Stagnation"

/datum/patron/divine/xylix
	name = "Xylix"
	domain = "Saint of Trickery, Freedom and Inspiration"
	desc = "Mortal turned trickster and shadow of the Pantheon."
	flaws = "Annoying, Liar, Deceitful"
	worshippers = "Cheats, Artists, the Hopeless"
	sins = "Boredom, Predictability, Routine"

/datum/patron/divine/pestra
	name = "Pestra"
	domain = "Saint of Disease, Alchemy, and Prophecy"
	desc = "A mortal turned saint by her own brew."
	flaws = "Disrespectful, Irresponsible, Drunkard"
	worshippers = "Warlocks, The Sick and Alchemists"
	sins = "´Curing´ abnormalities, Refusing to help the misfortunates, Groveling"

/datum/patron/divine/malum
	name = "Malum"
	domain = "Saint of Toil, Value and Craft"
	desc = "Father of the dwarves, master of the craft."
	flaws = "Obsessive, Repetetive, Greedy"
	worshippers = "Smiths, Miners, Artists."
	sins = "Cheating, Shoddy work, Suicide"

/datum/patron/divine/eora
	name = "Eora"
	domain = "Saint of the Love, Life and Beauty"
	desc = "Blind love for all, without a shred of hate in her heart"
	flaws= "Naive, Compulsive, Ignorant"
	worshippers = "Lovers, Harlots, Doting Grandparents"
	sins = "Sadism, Celibacy, Ruining beauty"
	t0 = /obj/effect/proc_holder/spell/invoked/lesser_heal
	t1 = /obj/effect/proc_holder/spell/invoked/bud
	t2 = /obj/effect/proc_holder/spell/invoked/eoracurse
	t3 = null