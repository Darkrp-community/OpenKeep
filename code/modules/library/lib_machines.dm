#define PRINTER_COOLDOWN 600 // The time between printing manuscripts and binding books
#define PRINTING_TIME 250 // The time it takes to actually print something using the printing press

#define PRINTER_COOLDOWN 60 // The time between printing manuscripts and binding books
#define PRINTING_TIME 250 // Simulate 25 seconds (25 seconds * 10 ticks per second)

/obj/machinery/printingpress
	name = "printing press"
	icon = 'icons/roguetown/misc/machines.dmi'
	icon_state = "Ppress_Clean"
	desc = "The Archivist's wonder. Gears, ink, and wood blocks can turn the written word to the printed word."
	density = TRUE
	var/cooldown = 0
	var/printing = FALSE
	var/has_paper = FALSE
	var/obj/item/paper/loaded_paper
	var/obj/item/output_item // Variable to store the printed item

/obj/machinery/printingpress/attackby(obj/item/O, mob/user, params)
	if(printing)
		user << "<span class='warning'>The printing press is currently printing. Please wait.</span>"
		return TRUE
	if(output_item)
		user << "<span class='notice'>Please retrieve the printed item before inserting new paper.</span>"
		return TRUE
	if(istype(O, /obj/item/paper) && !has_paper)
		// Attempt to transfer the paper to the printing press
		qdel(O)
		has_paper = TRUE
		loaded_paper = O
		src.icon_state = "Ppress_Prepared"
		user << "<span class='notice'>You insert the blank paper into the printing press.</span>"
		// Delete the paper as it's consumed
		del O
		return TRUE
	if(istype(O, /obj/item/paper/manuscript))
		var/obj/item/paper/manuscript/M = O
		if(M.written)
			// Upload manuscript to the archive
			upload_manuscript(user, M)
			return TRUE
		else
			user << "<span class='notice'>You need to fill out the manuscript before you can transfer it to the archives.</span>"
			return TRUE
	return ..()

/obj/machinery/printingpress/attack_hand(mob/user)
	if(printing)
		user << "<span class='warning'>The printing press is currently printing. Please wait.</span>"
		return
	if(output_item)
		// Try to put the item into the user's hands
		if(!user.put_in_hands(output_item))
			user << "<span class='warning'>Your hands are full. You cannot retrieve the printed item.</span>"
			return
		user << "<span class='notice'>You retrieve [output_item] from the printing press.</span>"
		user.visible_message("<span class='notice'>[user] retrieves [output_item] from the printing press.</span>")
		// Reset the press
		output_item = null
		src.icon_state = "Ppress_Clean"
		return
	else
		// Default interaction or message
		user << "<span class='notice'>The printing press is empty.</span>"
		return

/obj/machinery/printingpress/attack_right(mob/user)
	if(printing)
		user << "<span class='warning'>The printing press is currently printing. Please wait.</span>"
		return
	if(output_item)
		user << "<span class='notice'>There is a finished product in the printing press. Use an empty hand to retrieve it.</span>"
		return
	if(!has_paper)
		user << "<span class='warning'>The printing press requires a blank piece of paper to print.</span>"
		return
	var/choice = input(user, "Choose an option for the printing press") in list("Print The Book", "Print a Tome of Justice", "Print from the Archive")
	switch(choice)
		if ("Print The Book")
			start_printing(user, "bibble")
		if ("Print a Tome of Justice")
			start_printing(user, "justice")
		if ("Print from the Archive")
			choose_search_parameters(user)

/obj/machinery/printingpress/proc/start_printing(mob/user, var/print_type, var/id = null)
	if(cooldown > world.time)
		user << "<span class='warning'>The printing press is still recalibrating.</span>"
		return
	printing = TRUE
	src.icon_state = "Ppress_Printing"
	user << "<span class='notice'>The [src] starts printing...</span>"
	playsound(src.loc, 'sound/misc/ppress.ogg', 100, FALSE)
	sleep(PRINTING_TIME)
	if(print_type == "bibble")
		print_bibble(user)
	else if(print_type == "justice")
		print_justice(user)
	else if(print_type == "archive")
		print_manuscript(user, id)
	// Printing is done
	printing = FALSE
	src.icon_state = "Ppress_Done"
	user << "<span class='notice'>The printing press has finished printing.</span>"
	cooldown = world.time + PRINTER_COOLDOWN
	// Do not eject the product immediately; wait for the user to retrieve it
	// Remove has_paper flag since the paper has been used
	has_paper = FALSE

/obj/machinery/printingpress/proc/upload_manuscript(mob/user, obj/item/paper/manuscript/M)
	// Simulating SQL interaction with testing() for upload
	testing("UPLOAD QUERY: INSERT INTO library (author, title, content, category, ckey, datetime, round_id_created, approved) VALUES ('[M.author]', '[M.name]', '[M.content]', '[M.category]', '[M.ckey]', Now(), [GLOB.round_id], 0)")

	// Simulating successful upload
	user << "<span class='notice'>Upload Complete. The manuscript has been uploaded to the Archive.</span>"
	user.visible_message("<span class='notice'>[user] uploads a manuscript to the archive.</span>")
	qdel(M)

/obj/machinery/printingpress/proc/print_bibble(mob/user)
	// Creates a static book (Bibble)
	var/obj/item/book/rogue/bibble/B = new()
	output_item = B
	visible_message("<span class='notice'>The printing press hums as it produces [B.name].</span>")

/obj/machinery/printingpress/proc/print_justice(mob/user)
	// Creates a static book (Tome of Justice)
	var/obj/item/book/rogue/law/B = new()
	output_item = B
	visible_message("<span class='notice'>The printing press hums as it produces the [B.name].</span>")

/obj/machinery/printingpress/proc/print_manuscript(mob/user, var/id)
	var/sqlid = sanitizeSQL(id)

	// Simulating SQL interaction with testing() for print
	testing("PRINT QUERY: SELECT author, title, content, category, ckey, select_icon FROM library WHERE id = [sqlid] AND isnull(deleted)")

	// Simulated data retrieval from database
	var/title = "Test Manuscript Title"
	var/author = "Test Author"
	var/content = "This is a test manuscript content."
	var/category = "Test Category"
	var/ckey = "test_ckey"
	var/select_icon = "basic_book" // Should match one of the manuscript's book_icons

	// Create a new manuscript object
	var/obj/item/paper/manuscript/M = new()
	M.name = title
	M.author = author
	M.content = content
	M.category = category
	M.ckey = ckey
	M.select_icon = select_icon
	M.written = TRUE
	M.info = M.parsepencode(content)

	output_item = M

	visible_message("<span class='notice'>The printing press hums as it produces a manuscript titled [title].</span>")

/obj/machinery/printingpress/proc/choose_search_parameters(mob/user)
	var/search_title = input(user, "Enter the title (optional):") as text|null
	var/search_author = input(user, "Enter the author (optional):") as text|null
	var/search_category = input(user, "Select a category (optional):") in list("Any", "Apocrypha & Grimoires", "Myths & Tales", "Legends & Accounts", "Thesis", "Erotica")

	// Pass the selected parameters to search_manuscripts
	search_manuscripts(user, search_title, search_author, search_category)

/obj/machinery/printingpress/proc/search_manuscripts(mob/user, var/search_title, var/search_author, var/search_category)
	var/sqlquery = "SELECT id, author, title, category FROM library WHERE isnull(deleted)"

	if (search_author != "")
		sqlquery += " AND author LIKE '%[sanitizeSQL(search_author)]%'"
	if (search_title != "")
		sqlquery += " AND title LIKE '%[sanitizeSQL(search_title)]%'"
	if (search_category != "Any")
		sqlquery += " AND category = '[sanitizeSQL(search_category)]'"

	testing("SEARCH QUERY: " + sqlquery)

	// Simulating search results
	var/dat = "<h3>Manuscript Search Results:</h3><br>"
	dat += "<table><tr><th>Author</th><th>Title</th><th>Category</th><th>Print</th></tr>"

	// Simulating found entries with the ID field
	var/id = 1 // Simulated ID
	dat += "<tr><td>Test Author</td><td>Test Manuscript Title</td><td>Apocrypha & Grimoires</td><td><a href='?src=[REF(src)];print=1;id=[id]'>Print</a></td></tr>"

	dat += "</table>"
	user << browse(dat, "window=search_results")

/obj/machinery/printingpress/Topic(href, href_list)
	if(printing)
		return // Ignore interactions while printing

	if("print" in href_list)
		var/id = href_list["id"]
		start_printing(usr, "archive", id)

/obj/machinery/bookbinder
	name = "book binder"
	icon = 'icons/roguetown/misc/machines.dmi'
	icon_state = "book_binder"
	desc = "A machine that binds loose manuscripts into finished books."
	density = TRUE
	var/busy = FALSE

/obj/machinery/bookbinder/proc/bind_book(mob/user, obj/item/paper/manuscript/M)
	if (busy)
		to_chat(user, "<span class='warning'>The book binding bench is already pressing a book!</span>")
		return

	if (!user.transferItemToLoc(M, src))
		return

	user.visible_message("<span class='notice'>[user] places a manuscript into the book binder and screws the press.</span>")
	busy = TRUE
	sleep(rand(50, 100))
	busy = FALSE

	var/obj/item/book/rogue/B = new(src.loc)
	B.name = M.name
	B.title = M.name
	B.author = M.author
	B.pages = list("<b3><h3>Title: [B.title]<br>Author: [B.author]</b><h3>[M.info]")
	B.icon_state = "[M.select_icon]_0"
	B.base_icon_state = "[M.select_icon]"
	qdel(M)

	visible_message("<span class='notice'>[B.title] has been produced from the manuscript!</span>")

/obj/machinery/bookbinder/attackby(obj/O, mob/user, params)
	if (istype(O, /obj/item/paper/manuscript))
		bind_book(user, O)
		return TRUE
	return ..()

/obj/item/paper/manuscript
	name = "manuscript"
	desc = "A loose manuscript yet to be bound."
	var/author = "anonymous"
	var/content = ""
	var/category = "Unspecified"
	var/ckey = ""
	var/newicon = "basic_book_0"
	var/written = FALSE
	var/select_icon = "basic_book"
	var/list/book_icons = list(
	"Simple green" = "basic_book",
	"Simple black" = "book",
	"Simple red" = "book2",
	"Simple blue" = "book3",
	"Simple dark yellow" = "book4",
	"Brown with dark corners" = "book5",
	"Heavy purple with dark corners" = "book6",
	"Light purple with gold leaf" = "book7",
	"Light blue with gold leaf" = "book8",
	"Grey with gold leaf" = "knowledge")

/obj/item/paper/attack_right(mob/user)
	if(istype(user, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = user
		if(H.mind.get_skill_level(/datum/skill/misc/reading) <= 0)
			to_chat(user, "<span class='warning'>I don't know how to do this!</span>")
			return
		if(!user.is_holding(src))
			to_chat(user, "<span class='warning'>I need to hold the [src] to turn it into a manuscript!</span>")
			return
		if(info)
			to_chat(user, "<span class='warning'>The paper already has content!</span>")
			return
		user.temporarilyRemoveItemFromInventory(src) // Remove the paper

		var/obj/item/paper/manuscript/new_manuscript = new /obj/item/paper/manuscript // Create a new manuscript object
		user.put_in_hands(new_manuscript) // Place the manuscript into the user's hands

		to_chat(user, "<span class='notice'>You have turned the paper into a blank manuscript.</span>")

/obj/item/paper/manuscript/attackby(obj/item/P, mob/living/carbon/human/user, params)
	if(istype(P, /obj/item/natural/feather) && !written)
		// Prompt user to populate manuscript fields
		var/newtitle = dd_limittext(sanitize_hear_message(input(user, "Enter the title of the manuscript:")), MAX_NAME_LEN) as text|null
		var/newauthor = sanitize_hear_message(input(user, "Enter the author's name:")) as text|null
		var/newcontent = "<p>[input(user, "Enter the content of the manuscript:")]</p>" as text|null
		var/newcategory = input(user, "Select the category of the manuscript:") in list("Apocrypha & Grimoires", "Myths & Tales", "Legends & Accounts", "Thesis", "Eoratica")
		var/newicon = book_icons[input(user, "Choose a book style", "Book Style") as anything in book_icons]

		if (newtitle && newauthor && newcontent && newcategory)
			name = newtitle
			author = newauthor
			content = newcontent
			category = newcategory
			ckey = user.ckey
			select_icon = newicon
			written = TRUE
			info = parsepencode(content)
			icon_state = "paperwrite"
			user << "<span class='notice'>You have successfully written the manuscript.</span>"
		else
			user << "<span class='warning'>You must fill out all fields to complete the manuscript.</span>"
		return
	else if(istype(P, /obj/item/natural/feather) && written)
		user << "<span class='warning'>The manuscript has already been written.</span>"
		return
	return ..()