/obj/item/paper/bsmith
	info = "It's easy to smith. Put ores in the smelter. Put ingots on the anvil. Use your tongs to handle ingots. Hit them with the hammer. Quench hot ingots in the barrel (there must be water in it). Steel is an alloy from iron and coal, find the golden ratio"

/obj/item/paper/heartfelt/goal3
	info = "Establish a diplomatic alliance with the King of Rockhill to strengthen the relationship between Heartfelt, Fog Islands and Rockhill."

/obj/item/paper/heartfelt/goal2
	info = "Explore the mysteries of isle of Enigma, uncovering its secrets and hidden treasures."

/obj/item/paper/heartfelt/goal1 //suggestion: Make this unironically unlock kaizoku goods for the merchant.
	info = "Negotiate trade agreements with merchants in Rockhill to facilitate the exchange of goods and resources between the three realms."

/obj/item/paper/heartfelt/goal4
	info = "Our realm is rebelling against Grezenholft, but we are in dire need of sustenance to continue our cause. The people grow desperate and our allies cannot feed us, as they have even less farmable land than us. Seek royal largesse"

/obj/item/paper/heartfelt/random/Initialize()
	..()
	var/type = pick(typesof(/obj/item/paper/heartfelt) - /obj/item/paper/heartfelt/random)
	new type(loc)
	return INITIALIZE_HINT_QDEL
