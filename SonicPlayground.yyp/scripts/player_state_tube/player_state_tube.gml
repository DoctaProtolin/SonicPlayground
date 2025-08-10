
function player_state_tube() {
    if (state != ST_TUBE) return;
    
    x_speed = 0;
    y_speed = 0;
    
    tube_pos += 0.005;
    
    x = path_get_x(tube_index, tube_pos);
    y = path_get_y(tube_index, tube_pos);
    
    if (tube_pos >= 1) {
        state = ST_JUMP;
        
        var past_x = path_get_x(tube_index, 0.99);
        var past_y = path_get_y(tube_index, 0.99);
        
        var x_dir = x - past_x;
        var y_dir = y - past_y;
        
        var mag = sqrt(sqr(x_dir) + sqr(y_dir));
        
        x_dir = x_dir/mag;
        y_dir = y_dir/mag;
        
        // I think this only fails when holding an input
        
        x_speed = x_dir * 10;
        y_speed = y_dir * 10;
    }
    
}