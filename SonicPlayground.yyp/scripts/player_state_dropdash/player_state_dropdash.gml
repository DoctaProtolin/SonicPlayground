
#macro DROPDASH_INIT -1


function player_state_dropdash(){
	//If global value for dropdash is diabled don't execute
    
    var dropdash_max_strength = 60 * 3;
	//Add dropdash timer
	if(character == CHAR_SONIC)
	{
        
        var initialize = press_action && dropdash_timer < dropdash_max_strength && !ground && shield_timer < 1;
        var increase_if_started = hold_action && dropdash_timer != DROPDASH_INIT && !ground;
        var bubble_shield = hold_action && shield_bounced && !ground && shield_timer < 1 && ability > MOVE_DISABLE;
        
		if (initialize || increase_if_started || bubble_shield)
		{
			dropdash_timer += 0.2;
            
            if (bubble_shield) {
                ability = MOVE_NORMAL;
            }
            
		}
	}
    
    // show_debug_message("Dropdash timer: " + string(floor(dropdash_timer)));
    
	//Trigger the dropdash state
	if(dropdash_timer > 0 && state != ST_DROPDASH && ability == MOVE_NORMAL)
	{
		play_sound(sfx_dropdash);
		state = ST_DROPDASH;
        ability --;
	}
	
	//Reset the timer
	if (!ability && state != ST_DROPDASH)
	{
		
		dropdash_timer = DROPDASH_INIT;
	}
    
	//If not dropdash stop
	if (state != ST_DROPDASH) exit;
	
	//Animate dropdash
    image_xscale = -facing;
	animation_play(animator, ANIM_DROPDASH);
	
	//Make it attack
	attacking = true;
	
	//Go back to jump when not holding the button
	if(!hold_action)
	{
		dropdash_timer = DROPDASH_INIT;
		state = ST_JUMP;
        ability = MOVE_NORMAL;
	}
	
	//Land the dropdash
	if(!landed && ground && dropdash_timer > 0)
	{
        
		//Dropdash speeds
		var dashspeed = clamp(dropdash_timer, 8, 15);
        
        var maxspeed = 12.0;
		
		if (facing == -1) {
            if(x_speed <= 0.0)
                ground_speed = max(-maxspeed, -dashspeed + (ground_speed / 4.0));
            else if (ground_angle != 0)
                ground_speed = -dashspeed + (ground_speed / 2.0);
            else
                ground_speed = -dashspeed;
        } else {
            if (x_speed >= 0.0)
                ground_speed = min(maxspeed, dashspeed + (ground_speed / 4.0));
            else if (ground_angle != 0)
                ground_speed = dashspeed + (ground_speed / 2.0);
            else
                ground_speed = dashspeed;
        }
		
		//Roll state
		state = ST_ROLL; 
		play_sound(sfx_release);
		
		//Camera lag
		obj_camera.h_lag = 8;
		
		//Create effect
		if (global.chaotix_dust_effect)
		{
			for (var i = 0; i < 8; ++i) 
			{
			     create_effect(x - hitbox_w * facing, y + hitbox_h, spr_dust_effect, 0.4, depth-1, (2.5 * facing) * dcos(random_range(180, 270)), 2.5 * dsin(random_range(180, 270)));
			}
		}
		else
		{
			var o = create_effect(floor(x) - hitbox_w * facing, floor(y) + hitbox_h, spr_effects_dropdash_dust, 0.4, depth-1);
			o.image_xscale = facing;
		}
        
        dropdash_timer = DROPDASH_INIT;
	}
	
}