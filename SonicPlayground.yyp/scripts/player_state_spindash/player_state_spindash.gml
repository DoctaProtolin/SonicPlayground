
function player_state_spindash(){
	//Trigger the spindash
	if (state == ST_LOOKDOWN && press_action) {
		//Reset the spindash pitch
		audio_sound_pitch(sfx_spindash, 1);
		
		//Change animation
		animation_play(animator, ANIM_SPINDASH);
	
		//Reset variables
		spindash_rev = 0;
		spindash_pitch = 0;
		spindash_dust_frames = 0;
		
		//Update the state
		state = ST_SPINDASH;
	}
	
	//Stop executing if not spindashing
	if (state != ST_SPINDASH) {
		exit;
	}
	
	//Create dust effect
	if(global.object_timer mod 4 == 0 && global.chaotix_dust_effect) 
	{
		create_effect(x - hitbox_w * facing, y + hitbox_h, spr_dust_effect, 0.4, depth-1, (2.5 * facing) * dcos(random_range(180, 270)), 2.5 * dsin(random_range(180, 270)));
	}
	
	//Animate spindash dust effect
	spindash_dust_frames += 0.5;
	spindash_dust_frames %= sprite_get_number(spr_effect_spindash);
	
	//Stop the movement
	ground_speed = 0;
	
	//Change flags
	// direction_allow = 1 - ground;
	movement_allow = 1 - ground;
	attacking = true;
    
	//Subtract the spindash rev
    // spindash_rev -= spindash_rev / 32;
	// spindash_pitch -= spindash_pitch / 28;
    
    if (press_left) facing = -1;
    if (press_right) facing = 1;
	
    var stored_speed = 8+(floor(spindash_rev)/2);
    
    //Change animation
	if (stored_speed <= 11.5)       animation_play(animator, ANIM_SPINDASH);
    else                            animation_play(animator, ANIM_MAXSPINDASH);
    
	//Rev up!
	if (hold_action && !(--spindash_pause_timer) && stored_speed < 12)
	{
		//Play spindash sound
		play_sound(sfx_spindash);
		
		//Reset the spindash frame
		if(animation_is_playing(animator, ANIM_SPINDASH) || animation_play(animator, ANIM_MAXSPINDASH))
		{
			animation_set_frame(animator, 0);
		}
		
		//Update spindash rev
		spindash_pitch = min(spindash_pitch + 1, 10);
		spindash_rev = min(spindash_rev + 2, 12.5);
        
        spindash_pause_timer = 7;
		
		//Change the spindash sound pitch
		if(spindash_pitch != 1) 
		{
			audio_sound_pitch(sfx_spindash, 1 + spindash_pitch / 13);
		}
        
        spindash_cancel_timer = 40;
	} else if (stored_speed >= 12 && press_action && spindash_cancel_timer == 0) {
        can_jump = true;
        player_state_jump();
        return;
    }
    
    if(spindash_cancel_timer > 0) spindash_cancel_timer --;
    
    stored_speed = 8+(floor(spindash_rev)/2); // Update stored speed
    
	//Release the spindash
	if (!hold_down) {
		//Stop the spindash sound
		audio_stop_sound(sfx_spindash);
		
		//Play the release sound
		play_sound(sfx_release);
		
		//Lag the camera
		camera_set_lag(20 - spindash_rev);
		
		//Set the ground speed and update the state
		if(ground)
		{
			ground_speed = stored_speed * facing;
		}
		else
		{
			x_speed = stored_speed * facing;
		}
		state = ST_ROLL;
        spindash_pause_timer = 0;
	}
}