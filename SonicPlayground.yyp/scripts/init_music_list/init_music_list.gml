function init_music_list()
{
	//Menu background music:
	music_add(BGM_MENU, bgm_menu, 0.565, 49.87);
    music_add(BGM_COLUMNS, bgm_columns, 0.352, 49.762);
	
	//Stage background music:
	music_add(BGM_ARBOREAL_1, bgm_arboreal_agate1);
	music_add(BGM_ARBOREAL_2, bgm_arboreal_agate2);
    music_add(BGM_HILL_TOP_1, bgm_hill_top1, 11.837, 98.01);
    
    music_add(BGM_FUTURAMA, bgm_futurama);
    music_add(BGM_GENIUS_IN_FRANCE, bgm_genius_in_france);
    
    //music_add(BGM_ENTERTAINER, bgm_entertainer);
    
	//music_add(BGM_FLIGHT_THRILLS, bgm_flight_thrills);
	//music_add(BGM_ESPRESSO_WITH_BAYONETTA, bgm_espresso_with_bayonetta, 0.80, 93.45, true);
	
	//Game jingles:
	music_add(J_GAME_OVER, j_game_over, 0.00, 0.00, false);
	music_add(J_INVINCIBLE, j_invincible, 0.00, 0.00, false);
	music_add(J_SPEEDSHOE, j_speedshoe, 0.00, 0.00, false);
	music_add(J_ACT_CLEAR, jingle_zone_complete, 0.00, 0.00, false);
    
    
}

	//Setup macros for music ID
	#macro BGM_MENU              0
	#macro BGM_ARBOREAL_1        1
	#macro BGM_ARBOREAL_2        2
	#macro J_GAME_OVER           3
	#macro J_INVINCIBLE          4
	#macro J_SPEEDSHOE           5
	#macro J_ACT_CLEAR           6

    #macro BGM_COLUMNS           7
    #macro BGM_HILL_TOP_1        8
    #macro BGM_FUTURAMA          9
    #macro BGM_GENIUS_IN_FRANCE  10

    //#macro BGM_FUTURAMA          8
    //#macro BGM_COLUMNS           9
    //#macro BGM_ENTERTAINER       16
	//#macro BGM_MANTRA            17
    //#macro BGM_GENIUS_IN_FRANCE  18
	//#macro BGM_FLIGHT_THRILLS    19
	//#macro BGM_ESPRESSO_WITH_BAYONETTA 20

