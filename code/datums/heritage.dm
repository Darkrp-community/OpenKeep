/*
* Family Defines
* FAMILY_FATHER, FAMILY_MOTHER,
* FAMILY_PROGENY, FAMILY_ADOPTED
* The Familytree subsystem places
* people into the heritage datum
* and several people can share the
* same heritage datum.
*/

/datum/heritage
	var/housename
	var/dominant_species
	var/mob/living/carbon/human/matriarch
	var/mob/living/carbon/human/patriarch
	var/list/family = list()
	var/list/family_icons = list()

/datum/heritage/New(mob/living/carbon/human/progenator, new_name, majority_species)
	if(progenator)
		if(!new_name)
			ClaimHouse(progenator)
			return
		addToHouse(progenator)
	if(new_name)
		housename = new_name
	dominant_species = majority_species
	if(!majority_species && progenator)
		dominant_species = progenator.dna.species

/*
* Renames entire house. Useful for default houses.
*/
/datum/heritage/proc/ClaimHouse(mob/living/carbon/human/person)
	var/gender_male
	if(person.gender == MALE)
		gender_male = TRUE
	addToHouse(person, gender_male ? FAMILY_FATHER : FAMILY_MOTHER)
	housename = SurnameFormatting(person)
	dominant_species = person.dna.species

/*
* Adds someone to the family using a mob and a status.
*/
/datum/heritage/proc/addToHouse(mob/living/carbon/human/person, status)
	//You are not a human. Get outta ere.
	if(!ishuman(person))
		testing("FAMTREE_ERROR:add1")
		return
	//Your already in the family. We dont have the system for more than one role.
	if(family[person])
		testing("FAMTREE_ERROR:add2")
		return
	//Make a seperate list so we not mistake the status for another duplicate status role.
	var/list/temp_list = list()
	if(status == FAMILY_PROGENY)
		if(person.dna.species.id != dominant_species)
			status = FAMILY_ADOPTED
		else
			//This has no purpose other than to add their TRUE PARENTS to their DNA/blood
			person.MixDNA(patriarch, matriarch, override = TRUE)
	//Add the human as a key then assign its value as its familial role.
	temp_list += person
	temp_list[person] = status
	family.Add(temp_list)
	//Your now part of the family. Hold onto this datum so we can always call upon the old blood!
	person.family_datum = src
	var/checkmarriage = FALSE
	//Spagetti code.
	if(!patriarch && status == FAMILY_FATHER)
		patriarch = person
		checkmarriage = TRUE
	if(!matriarch && status == FAMILY_MOTHER)
		matriarch = person
		checkmarriage = TRUE
	if(patriarch && matriarch && checkmarriage)
		patriarch.MarryTo(matriarch)
	//Adds a preset hud icon to the heritage datum. Helps with rapidly adding the icon to family members UI.
	AddFamilyIcon(person)
	//This goes through the family and "logically" sorts out true heirs to bastards.
	BloodTies()

/*
* Returns text to human examine
* based on their familial relation to
* The Looker.
*/
/datum/heritage/proc/ReturnRelation(mob/living/carbon/human/lookee, mob/living/carbon/human/looker)
	if(lookee == looker)
		return
	/*
	* Perspective: Looker is looking at Lookee (A --> B)
	* So the tone returned is "Lookee is my Father"
	*/
	var/familialrole_a = family[looker]
	var/familialrole_b = family[lookee]
	/*
	* Familytree Subsystem Recognition
	* H is who examines us so the
	* perspective is looker looking at lookee.
	*/
	var/txt = ""
	if(familialrole_a == FAMILY_FATHER || familialrole_a == FAMILY_MOTHER)
		if(familialrole_b == FAMILY_PROGENY)
			txt += "It's my progeny."
		if(familialrole_b == FAMILY_ADOPTED)
			if(looker.dna.species == lookee.dna.species && familialrole_a == FAMILY_FATHER)
				txt += "It's my bastard."
			else
				txt += "It's the adopted one."

	if(familialrole_a == FAMILY_PROGENY || familialrole_a == FAMILY_ADOPTED)
		if(familialrole_b == FAMILY_FATHER)
			txt += "It's my father."
		if(familialrole_b == FAMILY_MOTHER)
			txt += "It's my mother."
		if(familialrole_b == FAMILY_PROGENY || familialrole_b == FAMILY_ADOPTED)
			txt += "It's my sibling."
	return span_nicegreen("<B>[txt]</B>")

/*
* Transfers someone from another family to
* our family.
*/
/datum/heritage/proc/TransferFamilies(mob/living/carbon/human/outsider, status, expel = FALSE)
	var/datum/heritage/old_house = outsider.family_datum
	if(old_house && expel)
		old_house.ExpelFromHouse(outsider)
	addToHouse(outsider, status)
	to_chat(outsider, "Youve been accepted into the [housename] household.")

/*
* Currently unused except in TransferFamilies.
* Expels a family member from the family.
* What this means is upto the expeller.
*/
/datum/heritage/proc/ExpelFromHouse(mob/living/carbon/human/shunned)
	family.Remove(shunned)
	to_chat(src, "Your no longer part of the [housename] household.")

/*
* Mechanical proc for listing families.
* This is seperate from Formate Family List
* so that admins can click a verb and see
* all families.
*/
/datum/heritage/proc/ListFamily(mob/living/carbon/human/checker)
	if(!checker)
		return
	if(!family.len)
		return
	var/contents = FormatFamilyList()
	var/datum/browser/popup = new(checker, "FAMILYDISPLAY", "", 260, 400)
	popup.set_content(contents)
	popup.open()

/*
* This proc returns text of each family house.
* You may be wondering why i seperated this
* from ListFamily and it was to mass return
* information from every family for the admin
* ListAllFamlies verb.
*/
/datum/heritage/proc/FormatFamilyList()
	var/household = uppertext(housename)
	var/house_title = "THE [household] HOUSE"
	. = "<center>[household ? house_title : "Nameless House"]:</center><BR>"
	. += "-----<br>"
	for(var/P in family)
		. += "<B><font color=#[COLOR_RED];text-shadow:0 0 10px #8d5958, 0 0 20px #8d5958, 0 0 30px #8d5958, 0 0 40px #8d5958, 0 0 50px #e60073, 0 0 60px #8d5958, 0 0 70px #8d5958;>\
			[P]</font></B> [capitalize(family[P])]<BR>"
	. += "----------<br>"

/*
* This proc goes through the family
* and considers if each of the children
* are related to the patriarch and matriarch.
*/
/datum/heritage/proc/BloodTies()
	if(!patriarch || !matriarch)
		return
	for(var/mob/living/carbon/human/H in family)
		var/our_role = family[H]
		if(our_role == FAMILY_FATHER || our_role == FAMILY_MOTHER)
			continue
		if(SpeciesCalculation(H, patriarch, matriarch))
			family[H] = FAMILY_PROGENY
			BloodRevelation(H)
		else
			family[H] = FAMILY_ADOPTED

/*
* Causes the offspring to have the
* matriarch and patriarch as their
* biological parents.
*/
/datum/heritage/proc/BloodRevelation(mob/living/carbon/human/progeny)
	progeny.MixDNA(patriarch, matriarch)

/*
* If the parents of the individual lead to this species
*/
/datum/heritage/proc/SpeciesCalculation(datum/species/fledgling_species, datum/species/dad_species, datum/species/mom_species)
	var/list/mixes = list(
		"human+elf+" = /datum/species/human/halfelf,
		)
	var/mix_text = ""
	//Extremely straightforward basic parentage
	if(istype(dad_species, mom_species))
		if(istype(fledgling_species, dad_species))
			return TRUE
	//Essentially making a bar code.
	if(istype(dad_species, /datum/species/human/northern) || istype(mom_species, /datum/species/human/northern))
		mix_text += "human+"
	if(istype(dad_species, /datum/species/elf) || istype(mom_species, /datum/species/elf))
		mix_text += "elf+"
	//If new hyrbids are made add the logic of their conception here.
	if(istype(fledgling_species, mixes[mix_text]))
		return TRUE

/*
* Taken from marriage alter. This formats a name into its surname
* if there is one.
*/
/datum/heritage/proc/SurnameFormatting(mob/living/carbon/human/person)
	//Alright now for the boring surname formatting.
	var/surname2use
	var/index = findtext(person.real_name, " ")
	person.original_name = person.real_name
	if(!index)
		surname2use = person.dna.species.random_surname()
	else
		/*
		* This code prevents inheriting the last name of
		* " of wolves" or " the wolf"
		* remove this if you want "Skibbins of wolves" to
		* have his bride become "Sarah of wolves".
		*/
		if(findtext(person.real_name, " of ") || findtext(person.real_name, " the "))
			surname2use = person.dna.species.random_surname()
		else
			surname2use = copytext(person.real_name, index)
	return surname2use

/*
* Currently unused. Replaces the surname of someone with
* their houses surname. Essentially if Dan Jobbers became
* Prince and his household name was "Glimmals" then he would
* become Dan Glimmals.
*/
/datum/heritage/proc/ForceSurname(mob/living/carbon/human/person, surname2use = housename)
	if(findtext(person.real_name, surname2use))
		return
	//Alright now for the boring surname formatting.
	var/index = findtext(person.real_name, " ")
	var/firstname = person.real_name
	//Titles override the forced surname
	if(findtext(firstname, " of ") || findtext(firstname, " the "))
		return
	else
		person.change_name(copytext(firstname, 1,index))
	return person.change_name(firstname + surname2use)

/*
* ISSUE: This applies a prexisting list of icons to a human hud.
* If the human ghosts then all the icons will dissapear.
* If a human is removed from the family while these icons are up
* there is a chance that the icon will remain and be unremovable.
*/
/datum/heritage/proc/ApplyUI(mob/living/carbon/human/iconer, toggle_true = FALSE)
	if(!iconer.client)
		return FALSE
	for(var/mob/living/carbon/human/H in family_icons)
		if(toggle_true)
			iconer.family_UI = FALSE
			iconer.client.images.Remove(family_icons[H])
			continue
		if(!H || H == iconer)
			continue
		iconer.family_UI = TRUE
		iconer.client.images.Add(family_icons[H])

//Adds family icon to the list.
/datum/heritage/proc/AddFamilyIcon(mob/living/carbon/human/famicon)
	var/family_role = family[famicon]
	var/newfamly_icon = CalcFamilyIcon(family_role)
	if(!family_role)
		return FALSE
	var/image/I = new('icons/relations.dmi', loc = famicon, icon_state = newfamly_icon)
	if(famicon in family_icons)
		family_icons.Remove(famicon)
	family_icons.Add(famicon)
	family_icons[famicon] = I
	return list(famicon = I)

/*
* Returns what UI icon this person should have.
*/
/datum/heritage/proc/CalcFamilyIcon(famrole)
	. = "related"
	if(famrole == FAMILY_ADOPTED)
		return "adopted"

//Lists the users family. Unsure where to put this other than here.
/mob/living/carbon/human/verb/ReturnFamilyList()
	set name = "List Family"
	set category = "Memory"
	if(family_datum)
		family_datum.ListFamily(src)
	else
		to_chat(src, "Your not part of any notable family.")

//Applies UI indicators for family members.
/mob/living/carbon/human/verb/ToggleFamilyUI()
	set name = "Toggle Family UI"
	set category = "Memory"
	if(family_datum)
		family_datum.ApplyUI(src, family_UI)
		to_chat(src, "FamilyUI Toggled [family_UI ? "On" : "Off"]")
	else
		to_chat(src, "Your not part of any notable family.")
