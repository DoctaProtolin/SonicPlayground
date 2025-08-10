        
    if (obj_player.debug) {
        return;
    }

    if (obj_player.state != ST_WEB) {
        instance_destroy();
    }

    if (obj_player.webIndex == id) {
        endPoint = getPosVec(obj_player);
    }

    var length = getMag(subVec(endPoint, startPoint));

    show_debug_message("Grounded?" + string(obj_player.ground));

    if (length > restLength) {
        var displacement = abs(length - restLength);
        var idealForce = normalize(subVec(endPoint, startPoint));
        idealForce = multVec(idealForce, -displacement * SPRING_CONSTANT);
        
        var dampingFactor = 0.99;
        
        with (obj_player) {
            x_speed += idealForce.x;
            y_speed += idealForce.y;
            
            x_speed *= dampingFactor;
            y_speed *= dampingFactor;
        }
    }
