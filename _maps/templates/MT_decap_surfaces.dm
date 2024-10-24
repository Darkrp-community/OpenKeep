//Note: The template DM (like this file) should be included (checkmarked) in DM!
//The map files themselves (.dmms) should NOT be included, just placed anywhere.
//For ease of file management, the dmms can be placed in a subfolder (in this case "lil_bog_shack")


//First, set the landmark so it can be easily placed
//Note: You can place multiple of the same map mark, it will pick and load them multiple times just fine
//Other note: Loading a .dmm will overwrite whatever was on the tiles but will not delete objects, so clear an area of trees etc in the area you want to make.

/obj/effect/landmark/map_load_mark/mt_decap_surface

	//Name can be anything, it doesn't matter
	name = "mount decapitation surface areas"

	//This uses the "IDs" as below -- they should not have spaces in them though since they're strings it won't matter much
	//It needs at least 1 to do anything, no limit in max number of templates
	templates = list( "makers_camp_1","randomized_1" )

//The template path as directly below should be unique, though doesn't matter what it's actually named since we use the ID for everything.

/datum/map_template/makers_camp_1
	name = "hetsman house"
	//Your IDs must be unique! Make sure you don't just copy and paste and forget to change it!
	id = "makers_camp_1"
	//Mapppath is a direct pointer to the DMM file of your mini map, make sure no typos! The map file can be anywhere as long as this is set properly.
	//Do NOT include (checkmark) the .dmm file! Just stick it in a folder and you're done with it.
	mappath = "_maps/map_files/templates/mtdecap_area/makers_camp_surface_1.dmm"

/datum/map_template/randomized_1
	name = "prospector den"
	id = "randomized_1"
	mappath = "_maps/map_files/templates/mtdecap_area/random_zone_1.dmm"

/obj/effect/landmark/map_load_mark/mt_decap_surface/surface_area

	//Name can be anything, it doesn't matter
	name = "mount decapitation surface areas"

	//This uses the "IDs" as below -- they should not have spaces in them though since they're strings it won't matter much
	//It needs at least 1 to do anything, no limit in max number of templates
	templates = list( "makers_camp_1","randomized_1" )

//The template path as directly below should be unique, though doesn't matter what it's actually named since we use the ID for everything.

/datum/map_template/makers_camp_1
	name = "hetsman house"
	//Your IDs must be unique! Make sure you don't just copy and paste and forget to change it!
	id = "makers_camp_1"
	//Mapppath is a direct pointer to the DMM file of your mini map, make sure no typos! The map file can be anywhere as long as this is set properly.
	//Do NOT include (checkmark) the .dmm file! Just stick it in a folder and you're done with it.
	mappath = "_maps/map_files/templates/mtdecap_area/makers_camp_surface_1.dmm"

/datum/map_template/randomized_1
	name = "prospector den"
	id = "randomized_1"
	mappath = "_maps/map_files/templates/mtdecap_area/random_zone_1.dmm"
