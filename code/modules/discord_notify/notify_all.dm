/datum/config_entry/string/webhook_roundstart
    protection = CONFIG_ENTRY_HIDDEN

SUBSYSTEM_DEF(discord_notify)
    name = "Notifier"
    wait = 3000
    init_order = INIT_ORDER_DEFAULT

/datum/controller/subsystem/discord_notify/Initialize(start_timeofday)
    if (!CONFIG_GET(flag/hub))
        can_fire = 0 // We dont want excess firing
        return ..()
    var/datum/http_request/R = new()
    
    R.prepare(RUSTG_HTTP_METHOD_POST, CONFIG_GET(string/webhook_roundstart),
    "{\"content\":\"<@&1254782534626312203>\\n\",\"embeds\":\[{\"title\":\"Раунд [GLOB.rogue_round_id] скоро начнётся!!\",\"description\":\"\",\"color\":16711680}\]}",
    list("Content-Type" = "application/json"), "")

    __send_http_request(R, FALSE)
    can_fire = 0 // We dont want excess firing
    return ..()
