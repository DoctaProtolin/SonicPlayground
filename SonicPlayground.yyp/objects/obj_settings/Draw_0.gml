
    if (!enabled) return;

    draw_set_color(c_black);
    draw_rectangle(0, offset_y, WINDOW_WIDTH+1, offset_y + WINDOW_HEIGHT + 1, false);


    draw_set_font(global.text_random);

    draw_set_halign(fa_center);

    var menu_x = WINDOW_WIDTH/2;
    var menu_y = 100 + offset_y;

    draw_set_color(c_white);
    draw_text(menu_x, menu_y - 50, "SET YER SETTINGS");

    var char_name;

    switch (global.character) {
        case CHAR_SONIC:
            char_name = "SONIC";
        break;
        
        case CHAR_TAILS:
            char_name = "TAILS";
        break;
        
        case CHAR_KNUX:
            char_name = "KNUCKLES";
        break;
    }
    
    // var options = ["DEFAULT CHARACTER: ", "WINDOW SIZE: ", "RESOLUTION: ", "FULLSCREEN: ", "UNROLL: "];
    
    var options = [];
    var data = [];
    
    // Create display data using macros
    options[MENU_CHAR] =        "CHARACTER: ";
    data[MENU_CHAR] = char_name;
    
    options[MENU_WINDOW_SIZE] = "WINDOW SIZE: ";
    data[MENU_WINDOW_SIZE] = string(global.window_size);
    
    options[MENU_FULLSCREEN] =  "FULLSCREEN: ";
    data[MENU_FULLSCREEN] = global.fullscreen ? "TRUE":"FALSE";

    options[MENU_UNROLL] =      "UNROLL: ";
    data[MENU_UNROLL] = global.unroll ? "TRUE":"FALSE";

    draw_set_halign(fa_left);
    for (var i = 0; i < array_length(options); i ++) {
        
        draw_set_color((cursor == i) ? c_yellow : c_white);
        draw_text(menu_x - WINDOW_WIDTH/3, menu_y + i * 20, options[i]);
        
        if (data[i] == "TRUE") {
            data[i] = get_truthy_strings(truth_index[i]);
            draw_set_color(make_color_rgb(0, 200, 0));
        } else if (data[i] == "FALSE") {
            data[i] = get_falsy_strings(falsehood_index[i]);
            draw_set_color(c_red);
        }
        
        draw_text(menu_x, menu_y + i * 20, data[i]);
        
    }