
function settings_load() {
    ini_open("settings.ini");
    
    global.character = ini_read_real("default", "default_character", CHAR_SONIC);
    global.window_size = ini_read_real("default", "window_size", 2);
    global.resolution_index = ini_read_real("default", "resolution_index", 1);
    global.fullscreen = ini_read_real("default", "fullscreen", false);
    global.unroll = ini_read_real("default", "unroll", 1);
    
    ini_close();
}