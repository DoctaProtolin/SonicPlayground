    window_resize();
    
    //Essential values
	zone_sel = 0;
	act_sel = 0;
	sound_sel = 0;
    
    depth = 2;
	
	zone_list = [
        ["ARBOREAL AGATE", stage_arboreal_agate1, stage_arboreal_agate2],
    ];
	
	reset_stage_data();
	global.score = 0;

	quotes = [
        "THIS IS NOT SONIC HYSTERIA",
        "LIKE ZOINKS",
        "THANKS TO TOMATO TECH",
        "PLAY IT AGAIN CHILLIDAWG!",
        "BULLET YARD DID IT BETTER",
        "JARVIS, KILL THIS GUY",
        "THAT'S GLAZE",
        "THAT'S IT. NO MORE MR NICE GUY.",
        "WORK WARS",
        "SMILES FOR 1000 MILES",
        "NO ARMS. NO LEGS. HUGE FEATURES.",
        "MAKE MUSIC FUCK BITCHES",
        "LIKE A BASSLINE",
        "THE POWER OF TEAMWORK",
        "MASTER OF SHADE...",
        "THESE QUOTES ARE ASS IM ADDING MY OWN",
        "JANET IS ARRIVING.",
        "I MAY NOT BE THE SHARPEST HUNK OF CHEESE",
        "I GOT A NEGATIVE NUMBER ON MY SATS",
        "I'M NOT GOOD LOOKING AND I DON'T KNOW HOW TO DANCE",
        "BUT NEVERTHELESS AND IN SPITE OF THE EVIDENCE I AM STILL WIDELY CONSIDERED TO BE A",
    ];

    randomise();
	quote_index = floor(random(array_length(quotes)));


    show_debug_message(quote_index);
	
	//Randomize the BG
	image_speed = 0;
	image_index = 0; //irandom(image_number);
	
	fade_in_room(5);
	play_music(BGM_COLUMNS);
	
	//Create stage data
	for (var i = 0; i < 128; ++i) {
	    deform_data[i] = 12 * dsin((360 / 128) * i);
	}

    application_surface_draw_enable(true);

    quote_letter_pos = [];
