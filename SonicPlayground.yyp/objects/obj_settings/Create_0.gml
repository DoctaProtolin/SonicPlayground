    
    #macro MENU_CHAR        0
    #macro MENU_WINDOW_SIZE 1
    #macro MENU_FULLSCREEN  3
    #macro MENU_UNROLL      4

    // Draw over stage select
    depth = 1;

    cursor = 0;
    options_num = 5;

    // Menu values
    truth_index = [];
    falsehood_index = [];

    for (var i = 0; i < options_num; i ++) {
        truth_index[i] = 0;
        falsehood_index[i] = 0;
    }

    
    enabled = false;

    // Animation values
    offset_y = -1000;
    started_music = false;
    timer = 0;

    function get_truthy_strings(index) {
        var s = ["TRUE", "AW YEAH!", "FLIP YEAH MY NEIGHBOUR", "SHALOM SHALOM"];
        
        return s[index];
    }

    function get_falsy_strings(index) {
        var s = ["FALSE", "NO", "HELL NAH", "IMMA DO MY OWN THING", "SCREW OFF!", "NOT COOL MAN"];
        
        return s[index];
    }