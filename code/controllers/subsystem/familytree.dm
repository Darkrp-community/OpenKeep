/*
* The familytree subsystem is supposed to be a way to
* assist RP by setting people up as related roundstart.
* This relation can be based on role (IE king and prince
* being father and son) or random chance.
*/
SUBSYSTEM_DEF(familytree)
	name = "familytree"
	flags = SS_NO_FIRE

	//People who have chosen to be first generation
	var/list/first_gen = list()
	/*
	* People who have chosen to be parents.
	* I am not 100% sure how to make lists
	* of lists so this will have to do for now.
	*/
	var/list/human_parents = list()
	var/list/elf_parents = list()
	var/list/dwarf_parents = list()

/*
* In order for us to use age in sorting of generations we would need to
* make the king & queen older than the prince.
*/
/datum/controller/subsystem/familytree/proc/AddLocal(mob/living/carbon/human/H, status)
	if(!H || !status || istype(H, /mob/living/carbon/human/dummy))
		return
	//Exclude princes and princesses from having their parentage calculated.
	if(H.job == "Prince" || H.job == "Princess")
		return
	switch(status)
		if(FAMILY_PARTIAL)
			first_gen.Add(H)
			AssignParents(H)

		if(FAMILY_FULL)
			if(H.virginity)
				//Failsafe for cleric since on spawn they are *technically* an adventurer.
				RemoveParentage(H)
				return
		/*
		* If your a server that doesnt use the virginity var
		* just do (H.job in exclude_parentage) and fill a list
		*/
			switch(H.dna.species.id)
				if("human")
					human_parents.Add(H)
				if("elf")
					elf_parents.Add(H)
				if("dwarf")
					dwarf_parents.Add(H)

/*
* Assigns a parent to a first gen.
*/
/datum/controller/subsystem/familytree/proc/AssignParents(mob/living/carbon/human/H)
	if(H.family[FAMILY_FATHER] || H.family[FAMILY_MOTHER])
		return
	var/list/eligable_parents = list()
	/*
	* We can make this more in depth by changing it to species name
	* restricting dark elves to dark elf parents but for now lets
	* keep it simple.
	*/
	switch(H.dna.species.id)
		if("human")
			eligable_parents = human_parents.Copy()
		if("elf")
			eligable_parents = elf_parents.Copy()
		if("dwarf")
			eligable_parents = dwarf_parents.Copy()
	//If no eligable parents then just assign them some default family of their type.
	if(!eligable_parents.len)
		H.family[FAMILY_FATHER] = "Unknown_[H.dna.species.id]_[rand(1,3)]"
	else
		//Select a parent from the eligable parents.
		eligable_parents = shuffle(eligable_parents)
		var/mob/living/carbon/human/parent
		for(var/mob/living/carbon/human/P in eligable_parents)
			if(P.stat != DEAD && P.age >= H.age)
				parent = P
				break

		AssumeFamily(H, parent)

/*
* Extremly quick assignment proc for
* making a offspring assume the relations
* of their parent.
*/
/datum/controller/subsystem/familytree/proc/AssumeFamily(mob/living/carbon/human/person, mob/living/carbon/human/parent, assume_spouse = FALSE)
	if(!ishuman(parent))
		return
	var/family_placement
	var/parent_male = FALSE
	if(parent.gender == MALE)
		parent_male = TRUE
	family_placement = parent_male ? FAMILY_FATHER : FAMILY_MOTHER
	person.family[family_placement] = parent
	//IF assume spouse and the parent is human and not a text variable.
	if(assume_spouse && ishuman(parent))
		var/mob/living/carbon/human/other_parent = parent.family[FAMILY_SPOUSE]
		if(!other_parent)
			return
		family_placement = parent_male ? FAMILY_MOTHER : FAMILY_FATHER
		if(person.family[family_placement])
			return
		person.family[family_placement] = other_parent

/*
* For removing someone from
* the parent lists. Sort of sloppy.
*/
/datum/controller/subsystem/familytree/proc/RemoveParentage(mob/living/carbon/human/person)
	if(!ishuman(person))
		return
	switch(person.dna.species.id)
		if("human")
			human_parents.Remove(person)
		if("elf")
			elf_parents.Remove(person)
		if("dwarf")
			dwarf_parents.Remove(person)

/*
* For altering the species of the
* offspring based on their parentage.
* Used mostly for princes.
* Its 3:16 AM when i coded this
* but its no excuse for it being
* a mess.
*/
/datum/controller/subsystem/familytree/proc/CalculateSpecies(mob/living/carbon/human/H)
	var/datum/species/new_species
	var/mob/living/carbon/human/dad = H.family[FAMILY_FATHER]
	var/mob/living/carbon/human/mom = H.family[FAMILY_MOTHER]
	if(dad == FALSE || mom == FALSE)
		return
	var/datum/species/offspring_species = H.dna.species
	var/datum/species/father_species = dad.dna.species
	var/datum/species/mother_species = mom.dna.species
	//If mother and father arnt present
	if(!father_species && !mother_species)
		return
	if(offspring_species != father_species)
		// If fathers species is null then switch to mothers species.
		new_species = father_species ? father_species : mother_species
	if(father_species && mother_species)
		new_species = CalculateMix(offspring_species, "[father_species.id] [mother_species.id]")
	if(!new_species)
		//If all of this returns null DO NOT CHANGE SPECIES.
		return
	H.set_species(new_species)

//Calculate mixture.
/datum/controller/subsystem/familytree/proc/CalculateMix(offspring, mixture)
	var/heritagehuman = findtext(mixture, "human")
	var/heritageelf = findtext(mixture, "elf")
	var/heritagedwarf = findtext(mixture, "dwarf")
	var/heritagetiefling = findtext(mixture, "tiefling")
	/*
	* Teifling blood is infused with
	* otherworldly energy so their
	* offspring are always born with
	* horns.
	*/
	if(heritagetiefling)
		return /datum/species/tieberian
	/*
	* So far humans are the only race that can
	* produce viable offspring with elves and dwarves.
	*/
	if(heritagehuman)
		if(heritageelf)
			return /datum/species/human/halfelf
		if(heritagedwarf)
			return pick(/datum/species/human/northern, /datum/species/dwarf/mountain)
