function player_states(){	
	//Default flags:
    
	if (flag_override) {
		direction_allow = true;
		movement_allow = true;
		collision_allow = true;
		attacking = false;
		gravity_allow = true;
		hitbox_allow = true;
	}
	
	// State allowing flags:
	can_jump = false;
	can_roll = false;
    
    // Performs checks to reset ability properly
    player_reset_ability();
    
    player_state_web();
    
	//Sonic states:
	player_state_peelout();
	player_state_dropdash();
	
	//Tails states:
	player_state_tailsfly();
    
    
    // Disable gravity for certain Knuckles moves
    // knux_gravity = !array_contains([ST_WALLDASH, ST_KNUXGLIDE, ST_KNUXLEDGE, ST_KNUXCLIMB], state);
	
	//Knuckles states:
	player_state_glide();
	player_state_wallclimb();
	player_state_ledgeclimb();

	//Common states:
	player_state_normal();
	player_state_jump();
    player_state_spindash();
    player_state_roll();
    player_state_lookdown();
    player_state_lookup();
    player_state_spring();
    player_state_skid();
    player_state_tube();
    // player_state_drift();
    
	player_state_knockout();
    
    // Enable gravity when exiting glide or climb states
    //if (state != ST_KNUXGLIDE && state != ST_KNUXCLIMB) {
        //if (last_state == ST_KNUXGLIDE || last_state == ST_KNUXCLIMB) {
            //gravity_allow = true;
        //}
    //}
    
    // Enable collison after knuckles climbs a ledge
    if (state != ST_KNUXLEDGE && last_state == ST_KNUXLEDGE) {
        collision_allow = true;
    }
	
	//Tails object
	player_handle_tails();
    
    last_state = state;
}