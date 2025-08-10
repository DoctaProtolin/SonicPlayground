
function player_reset_ability() {
    var has_ability_shield = shield != S_NONE && shield != S_NORMAL;
	
    // Reset player ability
    if (ground || state == ST_KNUXCLIMB) {
        ability = has_ability_shield ? MOVE_SHIELD : MOVE_NORMAL;
    }
    
    // Disable air moves when K.O'd
    if (knockout_type) ability = MOVE_DISABLE;
    
    // For dropdash while having a bubble shield
    if (shield != S_BUBBLE) shield_bounced = false;
    shield_timer = has_ability_shield ? max(0, shield_timer - 1) : 0;
    
    // Temporary Knuckles fix for shields
    if (character == CHAR_KNUX && ability > MOVE_NORMAL) ability = MOVE_NORMAL; 
    
}