
function settings_save() {
    ini_open("settings.ini");
    
    ini_write_real("default", "default_character", global.character);
    ini_write_real("default", "window_size", global.window_size);
    ini_write_real("default", "resolution_index", global.resolution_index);
    ini_write_real("default", "fullscreen", global.fullscreen);
    ini_write_real("default", "unroll", global.unroll);
    
    ini_close();
}