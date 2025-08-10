
    if (enabled) {
        visible = true;
        
        if (!started_music) {
            // Play based music
            if (!audio_is_playing(bgm_genius_in_france)) audio_stop_all();
            audio_play_sound(bgm_genius_in_france, 1, true);
            
            offset_y = -1000;
            vel = 0;
            started_music = true;
            timer = 0;
        } else {
            timer ++;
        }
        
        if (offset_y < 0) {
            offset_y = -1000 + 1000/2916 * timer * timer; // Quadratic equation!!! For display animation!!!
            
            show_debug_message("offset_y: " + string(offset_y) + " timer: " + string(timer));
            
            offset_y = min(0, offset_y);
            
            
        }
        
    } else {
        visible = false;
        offset_y = -1000;
        return;
    }

    var press_x = Input.RightPress - Input.LeftPress;
    var press_y = Input.DownPress - Input.UpPress;

    if (press_y != 0) {
        cursor = (cursor + press_y) % options_num;
        if (cursor < 0) cursor = options_num-1;
    }

    // Save and exit to Stage Select
    if (Input.StartPress || Input.ActionPress) {
        enabled = false;
        settings_save();
        
        // Prevents instantly selecting SETTINGS on stage select screen
        Input.StartPress = false;
        Input.ActionPress = false;
        
        return;
    }
    
    // Menu conrols
    switch (cursor) {
        case MENU_CHAR:
            global.character += press_x;
            global.character %= 3;
            
            if (global.character < 0) global.character = CHAR_KNUX;
        break;
        
        case MENU_WINDOW_SIZE:
            global.window_size += press_x * 0.2;
            global.window_size = clamp(global.window_size, 0.4, 4);
            if (press_x != 0) window_resize();
        break;
        
        case MENU_FULLSCREEN:
            if (press_x != 0) {
                global.fullscreen = !global.fullscreen;
                window_resize();
            
                truth_index[MENU_FULLSCREEN] = floor(random(4));
                falsehood_index[MENU_FULLSCREEN] = floor(random(5));
            }
        break;
        
        case MENU_UNROLL:
            if (Input.LeftPress || Input.RightPress) {
                global.unroll = !global.unroll;
                
                truth_index[MENU_UNROLL] = floor(random(4));
                falsehood_index[MENU_UNROLL] = floor(random(6));
            }
        break;
    }

    

