GLOBAL_LIST_EMPTY(__http_requests)

/datum/http_request
	var/id
	var/in_progress = FALSE

	var/method
	var/body
	var/headers
	var/url
	/// If present response body will be saved to this file.
	var/output_file

	var/_raw_response

/datum/http_request/Destroy(force)
	if(in_progress)
		CRASH("Deleting an asynchronous HTTP request leads to a memory leak. Waiting until completion...")

	while(!is_complete())
		stoplag()

	GLOB.__http_requests -= src
	STOP_PROCESSING(SSfastprocess, src)
	. = ..()

/datum/http_request/process()
	if(!in_progress)
		qdel(src)
		return
	if(is_complete())
		GLOB.__http_requests -= src
		qdel(src)
		return

/datum/http_request/proc/prepare(method, url, body = "", list/headers, output_file)
	if (!length(headers))
		headers = ""
	else
		headers = json_encode(headers)

	src.method = method
	src.url = url
	src.body = body
	src.headers = headers
	src.output_file = output_file

/datum/http_request/proc/execute_blocking()
	_raw_response = rustg_http_request_blocking(method, url, body, headers)

/datum/http_request/proc/begin_async()
	if (in_progress)
		CRASH("Attempted to re-use a request object.")

	id = rustg_http_request_async(method, url, body, headers)

	if (isnull(text2num(id)))
		CRASH("Proc error: [id]")
		_raw_response = "Proc error: [id]"
	else
		in_progress = TRUE

	GLOB.__http_requests += src
	START_PROCESSING(SSfastprocess, src)

/datum/http_request/proc/is_complete()
	if (isnull(id))
		return TRUE

	if (!in_progress)
		return TRUE

	var/r = rustg_http_check_request(id)

	if (r == RUSTG_JOB_NO_RESULTS_YET)
		return FALSE
	else
		_raw_response = r
		in_progress = FALSE
		return TRUE

/datum/http_request/proc/into_response()
	var/datum/http_response/R = new()

	try
		var/list/L = json_decode(_raw_response)
		R.status_code = L["status_code"]
		R.headers = L["headers"]
		R.body = L["body"]
	catch
		R.errored = TRUE
		R.error = _raw_response

	return R

/datum/http_response
	var/status_code
	var/body
	var/list/headers

	var/errored = FALSE
	var/error

proc/__send_http_request(datum/http_request/R, wait = TRUE)
	R.begin_async()

	if(!wait)
		return

	while(!R.is_complete())
		stoplag()

	return R.into_response()