
function window_resize() {
    /// @description Resize the window
	//Screen resizing
	
    global.window_width = global.resolutions[global.resolution_index][0];
    global.window_height = global.resolutions[global.resolution_index][1];
    
    camera_set_view_size(view_camera[view_current], global.window_width, global.window_height);
    
	//Resize the window:
	window_set_size(global.window_width*global.window_size, global.window_height*global.window_size);

	//Resize the surface:
	surface_resize(application_surface, global.window_width, global.window_height);
	
	//Center the screen
	window_center();
	
	//Fullscreen
	if (window_get_fullscreen() != global.fullscreen) {
        window_set_fullscreen(global.fullscreen);
    }
	
}