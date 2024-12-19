/obj/item/paper/bsmith
	info = "It's easy to smith. Put ores in the smelter. Put ingots on the anvil. Use your tongs to handle ingots. Hit them with the hammer.   \
	Quench hot ingots in the barrel (there must be water in it). Steel is an alloy from iron and coal, find the golden ratio"

/obj/item/paper/heartfelt/goal3
	info = "Establish a diplomatic alliance with the King of Rockhill to strengthen the relationship between Heartfelt and Rockhill."

/obj/item/paper/heartfelt/goal2
	info = "Explore the mysteries of isle of Enigma, uncovering its secrets and hidden treasures."

/obj/item/paper/heartfelt/goal1
	info = "Negotiate trade agreements with merchants in Rockhill to facilitate the exchange of goods and resources between the two realms."

/obj/item/paper/heartfelt/goal4
	info = "Our lands have long been forsaken by Dendor, Our fields are failing and the famine is causing unrest in our realm. Seek royal largesse"

/obj/item/paper/note_about_dwarfs
	name = "report to Guild on steel deliveries"
	info = "Last yils deliverie of steele from the dwarf outposte in the northeast: 83 ingots of finest steel. None hath been delivered this yil, this will not do. For the good of the Makers Guild, this must be investigated."

/obj/item/paper/reminder_about_dwarfs
	name = "note about steel deliveries"
	info = "Makers! The northern dwarves delivery of steele is much delayed this yil. Make do or go get it from them, the Guild cannot do more to solve this."

/obj/item/paper/feldsher_certificate
	name = "feldsher health certificate"
	info = "The wearer hath passed the feldshers monthly inspection as mandated by the pestilence laws, and is not a bearer of maladies to infect our towne.   \
	Thus they are allowede legally to ply the nitemaidens trade. I so swear on this date. (signed by the town feldsher, the date is a few weeks ago)"
/obj/item/paper/feldsher_certificate/expired
	info = "The wearer hath passed the feldshers monthly inspection as mandated by the pestilence laws, and is not a bearer of maladies to infect our towne.   \
	Thus they are allowede legally to ply the nitemaidens trade. I so swear on this date.  (signed by the town feldsher, the date is half a year ago)"
/obj/item/paper/feldsher_certificate/fake
	info = "The wearer hath passed the feldshers monthly inspection as mandated by the pestilence laws, and is not a bearer of maladies to infect our towne.   \
	Thus they are allowede legally to ply the nitemaidens trade. I so swear on this date.  (signature is undreadable, the date is a few weeks ago)"
/obj/item/paper/feldsher_certificate/Initialize()
	..()
	icon_state = "certificate"

/obj/item/paper/heartfelt/random/Initialize()
	..()
	var/type = pick(typesof(/obj/item/paper/heartfelt) - /obj/item/paper/heartfelt/random)
	new type(loc)
	return INITIALIZE_HINT_QDEL
