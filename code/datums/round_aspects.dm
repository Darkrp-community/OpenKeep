/datum/round_aspect
	var/name = "Round Aspect"
	var/description = "Uh oh."
	var/sekrit = FALSE // dictates whether the aspect should be revealed on round start. if FALSE it will be only revealed after the round has ended

	// Yup, that's all they are. They're basically just hollow shells and don't do much by themselves.

/datum/round_aspect/proc/apply() // Instant thing that happens when it's chosen. Used for aspects that change one single var
	return

/proc/aspect_chosen(var/datum/round_aspect/aspect) // use to check if an aspects chosen
	if(istype(SSticker.round_aspect, aspect))
		return TRUE

/datum/round_aspect/normal
	name = "Nothing!"
	description = "Normality above all."

/datum/round_aspect/strongbums // these arent bums. these are fraggers.
	name = "Strong Beggars"
	description = "Life on the streets requires a lot of physical work, y'know."

/datum/round_aspect/kingforareason
	name = "King for a Reason"
	description = "The previous ruler's reign was cut unfortunately short after his throat was ripped out. Praise be the new King!"

/datum/round_aspect/somethinginthewater
	name = "Something in the Water"
	description = "You feel just a little bit dumber."

/datum/round_aspect/merchanthoarder
	name = "Greedy Bastard"
	description = "The merchant is just a little bit more greedy than usual."

/datum/round_aspect/favorsintherightplaces
	name = "Favors in the Right Places"
	description = "The merchant knows how to exploit people, the balloon is faster."

/datum/round_aspect/sexless
	name = "Sexless"
	description = "Everyone in the town is a virgin due to a rumor of a 'Lover's Plague', strange."

/datum/round_aspect/fulltreasury
	name = "Full Treasury"
	description = "The previous ruler was a great leader."

/datum/round_aspect/emptytreasury
	name = "Empty Treasury"
	description = "The previous ruler was a dick."

/datum/round_aspect/faulty
	name = "Faulty Machines"
	description = "SCOMs may need some maintenance from time to time so they don't scramble their messages, maybe a good slap will do the trick."

/datum/round_aspect/drugparty
	name = "Town Party"
	description = "Ugh... what happened last night?"

/datum/round_aspect/drunkparty
	name = "Town Party"
	description = "Ugh... what happened last night?"

/datum/round_aspect/drunkgarrison
	name = "Delayed Inspection"
	description = "The Garrison is overdue on an inspection, hopefully they aren't too rowdy."

/*
/datum/round_aspect/beggarking
	name = "Peasantry Revolutionized"
	description = "Well, the peasants revolted; and they won. Is this what you wanted? He looks like a fucking clown."
*/

/datum/round_aspect/crippledbeggars
	name = "Crippled Beggars"
	description = "Due to a previous Lord's decree all beggars got their legs broken, that was a long time ago, and they were training their arms. Better get a bow."
