
function player_state_web() {
    
    webActivateTimer --;
    if (state != ST_WEB) {
        if (press_action && ability == MOVE_NORMAL && !ground && !webActivateTimer) {
            ability = MOVE_DISABLE;
            state = ST_WEB;

            
            var web = instance_create_layer(0, 0, "Objects", Web);
            
            with (web) {
                startPoint = getPosVec(WebPoint);
                endPoint = getPosVec(other);
                
                restLength = getMag(subVec(endPoint, startPoint));
                
                webSpeed = {
                    x: Player.x_speed,
                    y: Player.y_speed,
                }
            }
            
            webIndex = web;
        }
        return;
    }
    
    ground = false;
    
    if (Input.Down) {
        y_speed += 0.5;
    }
    
    if (press_action) {
        state = ST_JUMP;
        webActivateTimer = 10;
        exitWeb = true;
        ability = MOVE_NORMAL;
    }
}