
    draw_line_color(startPoint.x, startPoint.y, endPoint.x, endPoint.y, #ffffff, #ffffff);

    var scaledVector = multVec(testVector, 200);
    draw_line_color(Player.x, Player.y, Player.x + scaledVector.x, Player.y + scaledVector.y, #ffffff, #ffffff);