// / @description Player scripts

	// Step movement for sticking on the collision
	steps = 1 + abs(floor(x_speed/13)) + abs(floor(y_speed/13));
	
	// Reset landing flag
	if (ground) {
		landed = false;
	} else {
        takeoff = false;
    }

	
	// Set angle sensor reach range
	if (!landed) {
		reach_range = 16;
	}

	// Cancel when in debug mode
	if (debug) {
		player_debug();
        last_debug = debug;
		return;	
	}

    // On the frame after debug mode ends, set these.
    // Only done once to not interfere with other behaviour.
    if (last_debug && !debug) {
        collision_allow = true;
        hitbox_allow = true;
        ground = false;
    }
    last_debug = debug;

    
	
	// Include step movement
	repeat(steps) {
        
		// Handle player movement:
		player_movement();
		
		// Handle semi solid:
        player_semisolids();
		
		// Handle player collision with solid objects:
		player_object_collision();
		
		// Handle player terrain collision:
        player_collision();
        
		// Handle how player changes floor modes:
		player_mode();
        
	}
	// Handle how player is controlled:
	player_control();

	// Handle player's hurt system
	player_handle_hurt();
	
	// Update player's animator
	animator_update(animator);
	
	// Handle player states
	player_states();
	
	// Player facing direction
	player_direction();
	
	// Handle partial visual rotation
	player_visual_angle();
	
	// Various hitbox cases
	player_hitbox();
	
	// Misc. player stuff
	player_misc();
	
	// Handle player's interaction with water
	player_water();
