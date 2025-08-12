    
    if (obj_player.debug) {
        return;
    }

    if (obj_player.state != ST_WEB) {
        instance_destroy();
    }

    if (obj_player.webIndex == id) {
        endPoint = getPosVec(Player);
    }

    var length = getMag(subVec(endPoint, startPoint));
    // var displacement = length - restLength;

    var Direction = normalize(subVec(Player, startPoint));
    
    //Direction = multVec(Direction, restLength);
    var offset = multVec(Direction, restLength);
    var newPosition = addVec(startPoint, offset);

    var centripetalForce = multVec(Direction, -1);
    
    Player.x = newPosition.x;
    Player.y = newPosition.y;

    

    webSpeed.x += centripetalForce.x;
    webSpeed.y += centripetalForce.y;

    webSpeed.x *= 0.9;
    webSpeed.y *= 0.9;

    //webSpeed.y += 0.21875;

    //webSpeed.x = clamp(webSpeed.x, -10, 10);
    //webSpeed.y = clamp(webSpeed.y, -10, 10);

    Player.x_speed = webSpeed.x;
    Player.y_speed = webSpeed.y;

    var idealForce = normalize(subVec(endPoint, startPoint));
   // idealForce = multVec(idealForce, -displacement * SPRING_CONSTANT);
    
    var dampingFactor = 0.99;

    

    show_debug_message("Direction: " + string(Direction.x) + ", " + string(Direction.y));
    
    //with (Player) {
        //
        //x = 
        //
        //x_speed += idealForce.x;
        //y_speed += idealForce.y;
        //
        //x_speed *= dampingFactor;
        //y_speed *= dampingFactor;
        //
    //}
