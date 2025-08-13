

    if (obj_player.debug) {
        return;
    }
    
    if (obj_player.state != ST_WEB) {
        instance_destroy();
    }

    //if (obj_player.webIndex == id) {
        //endPoint = getPosVec(Player);
    //}

    //var Direction = normalize(subVec(Player, startPoint));
    
    var newPosition = createVecPolar(restLength, angle);    
    newPosition = addVec(newPosition, startPoint);
    Player.x = newPosition.x;
    Player.y = newPosition.y;

    var centripetalVel = subVec(Player, startPoint);
    centripetalVel = multVec(centripetalVel, -1);

    var theta = getHeading(centripetalVel) + 90;
    
    var tangentVel = createVecPolar(getMag(centripetalVel), theta);

    Player.x_speed = tangentVel.x;
    Player.y_speed = tangentVel.y;

    
    angle += 5;

    //webSpeed.x += 0.5 * (Input.Right - Input.Left);
//
    //if (Input.Down) {
        //webSpeed.y ++;
    //}
