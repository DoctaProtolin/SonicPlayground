
    if (array_contains([ST_TUBE, ST_NULL], obj_player.state)) return;

    if (!--disable_timer and player_collide_object(C_MAIN)) {
        with (obj_player) {
            state = ST_TUBE;
            tube_index = other.tube_index;
            tube_pos = 0;
            show_debug_message("Set tube state");
        }
        
        disable_timer = 30;
    }