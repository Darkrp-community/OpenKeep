#define PRINTER_COOLDOWN 60

/obj/machinery/printingpress
	name = "printing press"
	icon = 'icons/roguetown/misc/machines.dmi'
	icon_state = "print_press"
	desc = "The Archivist's wonder. Gears, ink, and wood blocks can turn the written word to the printed word."
	density = TRUE
	var/cooldown = 0

/obj/machinery/printingpress/proc/upload_manuscript(mob/user, obj/item/paper/manuscript/M)
	/*
	if (!SSdbcore.Connect())
		alert("Noc has abandoned you. Connection to the divine intellect has been severed.")
		return
	*/
	var/sqltitle = sanitizeSQL(M.name)
	var/sqlauthor = sanitizeSQL(M.author)
	var/sqlcontent = sanitizeSQL(M.content)
	var/sqlcategory = sanitizeSQL(M.category)
	var/sqlckey = sanitizeSQL(M.ckey)
	
	// Simulating SQL interaction with testing() for upload
	testing("UPLOAD QUERY: INSERT INTO library (author, title, content, category, ckey, datetime, round_id_created, approved) VALUES ('[sqlauthor]', '[sqltitle]', '[sqlcontent]', '[sqlcategory]', '[sqlckey]', Now(), '[GLOB.round_id]', 0)")

	// Simulating successful upload
	alert("Upload Complete. The manuscript has been uploaded to the Archive.")
	
	user.visible_message("<span class='notice'>[user] uploads a manuscript to the archive.</span>")
	qdel(M)

/obj/machinery/printingpress/proc/print_manuscript(mob/user, var/id)
	if (cooldown > world.time)
		user << "The printing press is still recalibrating."
		return
	/*
	if (!SSdbcore.Connect())
		user << "Noc has abandoned you. Connection to the divine intellect has been severed."
		return
	*/

	var/sqlid = sanitizeSQL(id)
	
	// Simulating SQL interaction with testing() for print
	testing("PRINT QUERY: SELECT author, title, content, category FROM library WHERE id = [sqlid] AND isnull(deleted)")


	// Simulating data retrieval from database
	var/title = "Test Manuscript Title"
	var/author = "Test Author"
	var/content = "This is a test manuscript content."

	if (!QDELETED(src))
		var/obj/item/book/B = new(src.loc)
		B.name = "Book: [title]"
		B.title = title
		B.author = author
		B.dat = content
		B.icon_state = "book[rand(1,8)]"
		visible_message("<span class='notice'>The printing press hums as it produces a bound manuscript titled [title].</span>")
	
	// Cooldown period
	cooldown = world.time + PRINTER_COOLDOWN

/obj/machinery/printingpress/proc/search_manuscripts(mob/user, var/search_title, var/search_author, var/search_category)
	/*
	if (!SSdbcore.Connect())
		alert("Noc has abandoned you. Connection to the divine intellect has been severed.")
		return
	*/
	
	// Simulating the SQL search query
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
	dat += "<table><tr><th>ID</th><th>Author</th><th>Title</th><th>Category</th><th>Print</th></tr>"
	
	// Simulating found entries
	dat += "<tr><td>1</td><td>Test Author</td><td>Test Manuscript Title</td><td>Apocrypha & Grimoires</td><td><a href='?src=[REF(src)];print=1'>Print</a></td></tr>"
	
	dat += "</table>"
	user << browse(dat, "window=search_results")

/obj/machinery/printingpress/attackby(obj/item/paper/manuscript/O, mob/user, params)
	if (istype(O, /obj/item/paper/manuscript) && O.written)
		upload_manuscript(user, O)
		return TRUE
	return ..()

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
	sleep(rand(200, 400))
	busy = FALSE

	var/obj/item/book/B = new(src.loc)
	B.name = M.name
	B.title = M.name
	B.author = M.author
	B.dat = M.content
	B.icon_state = "book[rand(1,7)]"
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
	var/written = FALSE

/obj/item/paper/manuscript/attackby(obj/item/P, mob/living/carbon/human/user, params)
	if(istype(P, /obj/item/natural/feather) && !written)
		// Prompt user to populate manuscript fields
		var/newtitle = input(user, "Enter the title of the manuscript:") as text|null
		var/newauthor = input(user, "Enter the author's name:") as text|null
		var/newcontent = input(user, "Enter the content of the manuscript:") as text|null
		var/newcategory = input(user, "Select the category of the manuscript:") in list("Apocrypha & Grimoires", "Myths & Tales", "Legends & Accounts", "Thesis", "Eoratica")

		if (newtitle && newauthor && newcontent && newcategory)
			name = newtitle
			author = newauthor
			content = newcontent
			category = newcategory
			ckey = user.ckey
			written = TRUE
			user << "<span class='notice'>You have successfully written the manuscript.</span>"
		else
			user << "<span class='warning'>You must fill out all fields to complete the manuscript.</span>"
		return TRUE
	return ..()


