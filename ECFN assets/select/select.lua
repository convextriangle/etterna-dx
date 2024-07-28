local header = {
	type = 5,
	name = "EC:FN / MusicSelect",
  w = 1920,
  h = 1080,
  input = 2000,
  fadeout = 500,
  scene =  3600000,
    property = {
		{name = "シャッター", def = "ON", item = {
			{name = "ON", op = 910},
			{name = "OFF", op = 911},
		}},
		{name = "動画を使用する", def = "ON", item = {
			{name = "ON", op = 920},
			{name = "OFF", op = 921},
		}},
		{name = "判定詳細ウィンドウを使用する", def = "OFF", item = {
			{name = "OFF", op = 940},
			{name = "ON", op = 941},
		}},
		{name = "IRウィンドウを使用する", def = "OFF", item = {
			{name = "OFF", op = 930},
			{name = "ON", op = 931},
		}},
		{name = "IRウィンドウ位置", def = "OFF", item = {
			{name = "TYPE-A", op = 932},
			{name = "TYPE-B", op = 933},
		}},
    },
    filepath = {
        -- カスタムファイル
	{name = "BG", path = "background/*.png"},
	{name = "MV", path = "mv/*.mp4"},
    },
    offset = {
        -- カスタムオフセット
    }
}

local function irwindow_A()
	return skin_config.option["IRウィンドウ位置"] == 932
end
local function irwindow_B()
	return skin_config.option["IRウィンドウ位置"] == 933
end




local main_state = require("main_state")

local function main()
    -- ヘッダ情報をスキン本体にコピーします
    local skin = {}
    for k, v in pairs(header) do
        skin[k] = v
    end
    -- 以下でスキン本体のデータを定義します
    skin.source = {
		{id = "mv", path = "mv/*.mp4"},
		{id = 1, path = "background/*.png"},
		{id = 2, path = "bar.png"},
		{id = 3, path = "lamp.png"},
		{id = 5, path = "option.png"},
		{id = 9, path = "system_.png"},
		{id = 10, path = "shadow.png"},
		{id = 11, path = "BG＿Noise.png"},
		{id = 12, path = "main＿Noise.png"},	
		{id = 13, path = "Particle.png"},
		{id = 14, path = "Shutter2.png"},	
    }
    skin.font = {
        {id = 0, path = "../_font/FLOPDesignFont.ttf"},
		{id = 1, path = "../_font/barfont.fnt"},
		{id = 2, path = "../_font/Artist.fnt"},
		{id = 3, path = "../_font/folder.fnt"},
		{id = 4, path = "../_font/barfontfolder.fnt"},
		{id = 5, path = "../_font/barfonttable.fnt"},
		{id = 6, path = "../_font/barfontsearch.fnt"},
		{id = 7, path = "../_font/selectsongname.fnt"},
		{id = 8, path = "../_font/dir.fnt"},
		{id = 9, path = "../_font/Genre-Art.fnt"},
		{id = 10, path = "../_font/subtitle.fnt"},
		{id = 11, path = "../_font/barfontloot.fnt"},
		{id = 12, path = "../_font/song.fnt"},	
		{id = 13, path = "../_font/target.fnt"},
    }
    skin.image = {

  		{id = "shutter", src = 14, x = 0, y = 0, w = 7680, h = 5400,divx = 4 , divy = 5 , cycle = 800},

 		{id = "bg", src = 1, x = 0, y = 0, w = 1920, h = 1080},
 		{id = "mv", src = "mv", x = 0, y = 0, w = 1920, h = 1080},
 		{id = "Particle", src = 13, x = 0, y = 0, w = -1, h = -1, divy = 60 , cycle = 2000},
  		{id = "shadow", src = 10, x = 0, y = 0, w = 1920, h = 1080},
  		{id = "upper", src = 9, x = 0, y = 1000, w = 1811, h = 85},
   		{id = "upper_light", src = 9, x = 0, y = 2796, w = 1068, h = 189},
 		{id = "select_folder", src = 9, x = 119, y = 29, w = 176, h = 26},
		{id = "songs_font", src = 9, x = 295, y = 29, w = 158, h = 26},
		{id = "song_flash", src = 9, x = 896, y = 0, w = 61, h = 134 , divx = 61 , cycle = 80},
  		{id = "under_frame", src = 9, x = 0, y = 929, w = 1920, h = 71},

  		{id = "day_bar", src = 9, x = 146, y = 798, w = 15, h = 20},
		--BMSモード
		{id = "7keys_info", src = 9, x = 0, y = 1085, w = 384, h = 57 },
		{id = "14keys_info", src = 9, x = 384, y = 1085, w = 384, h = 57 },
		{id = "5keys_info", src = 9, x = 768, y = 1085, w = 384, h = 57 },
		{id = "10keys_info", src = 9, x = 1152, y = 1085, w = 384, h = 57 },
		{id = "9keys_info", src = 9, x = 1536, y = 1085, w = 384, h = 57 },
		{id = "24keys_info", src = 9, x = 0, y = 1085+57, w = 384, h = 57},
		{id = "24keysDP_info", src = 9, x = 384, y = 1085+57,  w = 384, h = 57},
		--BMSデータ向け
  		{id = "bms_data_detail", src = 9, x = 392, y = 545, w = 80, h = 68},
  		{id = "time_dot", src = 9, x = 472, y = 595, w = 9, h = 14},
  		{id = "jud_veasy", src = 9, x = 195, y = 523, w = 78, h = 22},
  		{id = "jud_easy", src = 9, x = 195+79*1, y = 523, w = 78, h = 22},
   		{id = "jud_normal", src = 9, x = 195+79*2, y = 523, w = 78, h = 22},
  		{id = "jud_hard", src = 9, x = 195+79*3, y = 523, w = 78, h = 22},
  		{id = "jud_vhard", src = 9, x = 195+79*4, y = 523, w = 78, h = 22},
  		{id = "bga_ico", src = 9, x = 246, y = 546, w = 44, h = 22},
  		{id = "txt_ico", src = 9, x = 195, y = 546, w = 50, h = 22},
		--ソングバー
  		{id = "song_slider", src = 9, x = 1583, y = 0, w = 65, h = 764},
		--コース用
		{id = "courseframe", src = 9, x = 0, y = 2996, w = 622, h = 453},

		{id = "COURSE-GAUGEOFF", src = 9, x = 1, y = 3452, w = 219, h = 58},
		{id = "COURSE-GAUGELR2", src = 9, x = 1, y = 3452+58*1, w = 219, h = 58},
		{id = "COURSE-GAUGE5K", src = 9, x = 1, y = 3452+58*2, w = 219, h = 58},
		{id = "COURSE-GAUGE7K", src = 9, x = 1, y = 3452+58*3, w = 219, h = 58},
		{id = "COURSE-GAUGE9K", src = 9, x = 1, y = 3452+58*4, w = 219, h = 58},
		{id = "COURSE-GAUGE24K", src = 9, x = 1, y = 3452+58*5, w = 219, h = 58},

		{id = "COURSE-OPTIONOFF", src = 9, x = 482, y = 3452, w = 86, h = 58},
		{id = "COURSE-CLASS", src = 9, x = 221, y = 3452, w = 86, h = 58},
		{id = "COURSE-MIRROR", src = 9, x = 221, y = 3452+58*1, w = 86, h = 58},
		{id = "COURSE-RANDOM", src = 9, x = 221, y = 3452+58*2, w = 86, h = 58},
		{id = "COURSE-NOSPEED", src = 9, x = 482, y = 3452+58*1, w = 86, h = 58},
		{id = "COURSE-NOGOOD", src = 9, x = 395, y = 3452, w = 86, h = 58},
		{id = "COURSE-NOGREAT", src = 9, x = 395, y = 3452+58*1, w = 86, h = 58},
		{id = "COURSE-LN", src = 9, x = 308, y = 3452, w = 86, h = 58},
		{id = "COURSE-CN", src = 9, x = 308, y = 3452+58*1, w = 86, h = 58},
		{id = "COURSE-HCN", src = 9, x = 308, y = 3452+58*2, w = 86, h = 58},

		--ソート用
		{id = "allkeys", src = 9, x = 960, y = 55, w = 158, h = 40},
		{id = "5keys", src = 9, x = 960, y = 55 + 40*1, w = 158, h = 40},
		{id = "7keys", src = 9, x = 960, y = 55 + 40*2, w = 158, h = 40},
		{id = "10keys", src = 9, x = 960, y = 55 + 40*3, w = 158, h = 40},
		{id = "14keys", src = 9, x = 960, y = 55 + 40*4, w = 158, h = 40},
		{id = "9keys", src = 9, x = 960, y = 55 + 40*5, w = 158, h = 40},
		{id = "24keys", src = 9, x = 960, y = 55 + 40*6, w = 158, h = 40},
		{id = "24keysDP", src = 9, x = 960, y = 55 + 40*7, w = 158, h = 40},
		{id = "sortset", src = 9, x = 1119, y = 55, w = 158, h = 320, divy = 8, len = 8, ref = 12, act = 12},
		{id = "lnmodeset", src = 9, x = 1278, y = 55, w = 158, h = 120, divy = 3, len = 3, ref = 308, act = 308},
		{id = "search_window", src = 9, x = 960, y = 378, w = 332, h = 47},
		{id = "search_ico", src = 9, x = 960, y = 426, w = 47, h = 47},
		{id = "sort_ico", src = 9, x = 1009, y = 426, w = 47, h = 40},
		{id = "skin_select", src = 9, x = 1107, y = 426, w = 47, h = 47, act = 14},
		{id = "keyconfig", src = 9, x = 1058, y = 426, w = 47, h = 47, act = 13},
		{id = "text_button", src = 9, x = 1156, y = 426, w = 47, h = 47, act = 17},
		--ライバル用		
		{id = "rivalwindow", src = 9, x = 960, y = 474, w = 561, h = 32},
		{id = "rival_infowindow", src = 9, x = 385, y = 127, w = 366, h = 100},
		{id = "rival_win", src = 9, x = 384, y = 228, w = 86, h = 18},
		{id = "rival_lose", src = 9, x = 384, y = 246, w = 108, h = 18},
		{id = "rival_draw", src = 9, x = 384, y = 264, w = 62, h = 18},
		{id = "state_rival_clear", src = 9, x = 624, y = 2996, w = 327, h = 209, divx = 3, divy = 11, cycle = 200, len = 11, ref = 371},
		--スコアグラフ
 		{id = "score_graph_frame", src = 9, x = 960, y = 778, w = 415, h = 30},
 		{id = "score_graph_back", src = 9, x = 960, y = 806, w = 381, h = 16},
  		{id = "score_bar", src = 9, x = 146, y = 798, w = 15, h = 98},
  		{id = "score_center_bar", src = 9, x = 394, y = 798, w = 1, h = 101},
  		{id = "score_per", src = 9, x = 166, y = 885, w = 57, h = 14},

 		{id = "bms_info", src = 9, x = 0, y = 69, w = 384, h = 453},
 		{id = "pattern_info", src = 9, x = 960, y = 613, w = 620, h = 165},

 		{id = "line", src = 9, x = 770, y = 69, w = 2, h = 515},
		{id = "bpm", src = 9, x = 0, y = 29, w = 118, h = 28},
		{id = "bpm_bar", src = 9, x = 0, y = 57, w = 23, h = 10},
		{id = "playlevel", src = 0, x = 0, y = 790, w = 120, h = 24},
	
		{id = "zero", src = 9, x = 287, y = 588, w = 104, h = 24},
		{id = "zero_count", src = 9, x = 332, y = 849, w = 60, h = 15},
		--DJRANK
		{id = "rank_aaa", src = 9, x = 773, y = 280, w = 122, h = 39},
		{id = "rank_aa", src = 9, x = 773, y = 240, w = 122, h = 39},
		{id = "rank_a", src = 9, x = 773, y = 200, w = 122, h = 39},
		{id = "rank_b", src = 9, x = 773, y = 160, w = 122, h = 39},
		{id = "rank_c", src = 9, x = 773, y = 120, w = 122, h = 39},
		{id = "rank_d", src = 9, x = 773, y = 80, w = 122, h = 39},
		{id = "rank_e", src = 9, x = 773, y = 40, w = 122, h = 39},
		{id = "rank_f", src = 9, x = 773, y = 0, w = 122, h = 39},
		--DJRANK_差分用
		{id = "RANK_s_MAX", src = 9, x = 911, y = 612, w = 45, h = 19},
		{id = "RANK_s_AAA", src = 9, x = 911, y = 612 + 19 * 1, w = 45, h = 19},
		{id = "RANK_s_AA", src = 9, x = 911, y = 612 + 19 * 2, w = 45, h = 19},
		{id = "RANK_s_A", src = 9, x = 911, y = 612 + 19 * 3, w = 45, h = 19},
		{id = "RANK_s_B", src = 9, x = 911, y = 612 + 19 * 4, w = 45, h = 19},
		{id = "RANK_s_C", src = 9, x = 911, y = 612 + 19 * 5, w = 45, h = 19},
		{id = "RANK_s_D", src = 9, x = 911, y = 612 + 19 * 6, w = 45, h = 19},
		{id = "RANK_s_E", src = 9, x = 911, y = 612 + 19 * 7, w = 45, h = 19},
		{id = "RANK_s_F", src = 9, x = 911, y = 612 + 19 * 8, w = 45, h = 19},

		--スコアウィンドウ
		{id = "score_window", src = 9, x = 0, y = 613, w = 584, h = 183},
		{id = "score", src = 9, x = 0, y = 797, w = 145, h = 22},
		{id = "misscount", src = 9, x = 0, y = 823, w = 145, h = 22},
		{id = "maxcombo", src = 9, x = 0, y = 849, w = 145, h = 22},
		{id = "playcount", src = 9, x = 0, y = 875, w = 145, h = 22},
		{id = "state_clear", src = 9, x = 584, y = 613, w = 327, h = 209, divx = 3, divy = 11, cycle = 200, len = 11, ref = 370},
		--スコア内訳
		{id = "playdata_window", src = 9, x = 965, y = 2995, w = 281, h = 183},
		--IRウィンドウ
		{id = "irdata_window", src = 9, x = 965, y = 3179, w = 261, h = 183},
		{id = "irwait", src = 9, x = 1227, y = 3181, w = 244, h = 148},

		{id = "button_play_off", src = 9, x = 0, y = 552, w = 48, h = 35},
		{id = "button_autoplay_off", src = 9, x = 0+49*1, y = 552, w = 48, h = 35},
		{id = "button_practice_off", src = 9, x = 0+49*2, y = 552, w = 48, h = 35},
		{id = "button_play", src = 9, x = 0, y = 552, w = 48, h = 35, act = 15},
		{id = "button_autoplay", src = 9, x = 0+49*1, y = 552, w = 48, h = 35, act = 16},
		{id = "button_practice", src = 9, x = 0+49*2, y = 552, w = 48, h = 35, act = 315},
		{id = "button_replay", src = 9, x = 91, y = 522, w = 25, h = 29, act = 19},
		{id = "button_replay2", src = 9, x = 91+25*1, y = 522, w = 25, h = 29, act = 316},
		{id = "button_replay3", src = 9, x = 91+25*2, y = 522, w = 25, h = 29, act = 317},
		{id = "button_replay4", src = 9, x = 91+25*3, y = 522, w = 25, h = 29, act = 318},

		{id = "totalplay", src = 0, x = 0, y = 720, w = 96, h = 24},
		{id = "totalnotes", src = 0, x = 0, y = 744, w = 120, h = 24},

		{id = "cursor", src = 2, x = 0, y = 481, w = 812, h = 95},

		{id = "bar-song", src = 2, x = 0, y = 0, w = 800, h = 60},
		{id = "bar-nosong", src = 2, x = 0, y = 420, w = 800, h = 60},
		{id = "bar-folder", src = 2, x = 0, y = 60, w = 800, h = 60},
		{id = "bar-table", src = 2, x = 0, y = 360, w = 800, h = 60},
		{id = "bar-grade", src = 2, x = 0, y = 180, w = 800, h = 60},
		{id = "bar-nograde", src = 2, x = 0, y = 240, w = 800, h = 60},
		{id = "bar-command", src = 2, x = 0, y = 300, w = 800, h = 60},
		{id = "bar-search", src = 2, x = 0, y = 120, w = 800, h = 60},




		--クリアランプシングル
		{id = "lamp-noplay", src = 2, x = 0, y = 0, w = 0, h = 0},
		{id = "lamp-failed", src = 2, x = 0, y = 576, w = 106, h = 80, divx = 2, cycle = 80},
		{id = "lamp-assist", src = 2, x = 0, y = 576+80*1, w = 46, h = 68, divx = 1},
		{id = "lamp-lassist", src = 2, x = 0, y = 576+80*2, w = 46, h = 68, divx = 1},
		{id = "lamp-easy", src = 2, x = 0, y = 576+80*3, w = 46, h = 68, divx = 1},
		{id = "lamp-normal", src = 2, x = 0, y = 576+80*4, w = 46, h = 68, divx = 1},
		{id = "lamp-hard", src = 2, x = 0, y = 576+80*5, w = 46, h = 68, divx = 1},
		{id = "lamp-exhard", src = 2, x = 0, y = 576+80*6, w = 106, h = 80, divx = 2, cycle = 100},
		{id = "lamp-fc", src = 2, x = 0, y = 576+80*7, w = 159, h = 80, divx = 3, cycle = 100},
		{id = "lamp-perfect", src = 2, x = 0, y = 576+80*8, w = 159, h = 80, divx = 3, cycle = 100},
		{id = "lamp-max", src = 2, x = 0, y = 576+80*9, w = 159, h = 80, divx = 3, cycle = 100},
		--クリアランプライバル1P
		{id = "lamp-noplay1", src = 2, x = 0, y = 0, w = 0, h = 0},
		{id = "lamp-failed1", src = 2, x = 0, y = 576, w = 106, h = 40, divx = 2, cycle = 80},
		{id = "lamp-assist1", src = 2, x = 0, y = 576+80*1, w = 46, h = 40, divx = 1},
		{id = "lamp-lassist1", src = 2, x = 0, y = 576+80*2, w = 46, h = 40, divx = 1},
		{id = "lamp-easy1", src = 2, x = 0, y = 576+80*3, w = 46, h = 40, divx = 1},
		{id = "lamp-normal1", src = 2, x = 0, y = 576+80*4, w = 46, h = 40, divx = 1},
		{id = "lamp-hard1", src = 2, x = 0, y = 576+80*5, w = 46, h = 40, divx = 1},
		{id = "lamp-exhard1", src = 2, x = 0, y = 576+80*6, w = 106, h = 40, divx = 2, cycle = 100},
		{id = "lamp-fc1", src = 2, x = 0, y = 576+80*7, w = 159, h = 40, divx = 3, cycle = 100},
		{id = "lamp-perfect1", src = 2, x = 0, y = 576+80*8, w = 159, h = 40, divx = 3, cycle = 100},
		{id = "lamp-max1", src = 2, x = 0, y = 576+80*9, w = 159, h = 40, divx = 3, cycle = 100},
		--クリアランプライバル	2P
		{id = "lamp-noplay2", src = 2, x = 0, y = 0, w = 0, h = 0},
		{id = "lamp-failed2", src = 2, x = 0, y = 616, w = 106, h = 40, divx = 2, cycle = 80},
		{id = "lamp-assist2", src = 2, x = 0, y = 616+80*1, w = 46, h = 40, divx = 1},
		{id = "lamp-lassist2", src = 2, x = 0, y = 616+80*2, w = 46, h = 40, divx = 1},
		{id = "lamp-easy2", src = 2, x = 0, y = 616+80*3, w = 46, h = 40, divx = 1},
		{id = "lamp-normal2", src = 2, x = 0, y = 616+80*4, w = 46, h = 40, divx = 1},
		{id = "lamp-hard2", src = 2, x = 0, y = 616+80*5, w = 46, h = 40, divx = 1},
		{id = "lamp-exhard2", src = 2, x = 0, y = 616+80*6, w = 106, h = 40, divx = 2, cycle = 100},
		{id = "lamp-fc2", src = 2, x = 0, y = 616+80*7, w = 159, h = 40, divx = 3, cycle = 100},
		{id = "lamp-perfect2", src = 2, x = 0, y = 616+80*8, w = 159, h = 40, divx = 3, cycle = 100},
		{id = "lamp-max2", src = 2, x = 0, y = 616+80*9, w = 159, h = 40, divx = 3, cycle = 100},


		{id = "trophy-bronze", src = 2, x = 252, y = 872, w = 44, h = 44},
		{id = "trophy-silver", src = 2, x = 207, y = 872, w = 44, h = 44},
		{id = "trophy-gold", src = 2, x = 162, y = 872, w = 44, h = 44},

		{id = "label-ln", src = 2, x = 160, y = 799, w = 80, h = 24},
		{id = "label-random", src = 2, x = 161, y = 848, w = 81, h = 25},
		{id = "label-mine", src = 2, x = 161, y = 823, w = 81, h = 25},





		{id = "lamp", src = 0, x = 400, y = 648, w = 96, h = 24},

		{id = "blank", src = 0, x = 8, y = 0, w = 8, h = 8},
		--オプション窓関連
		{id = "assist_caution", src = 5, x = 934, y = 723, w = 659, h = 42},
		{id = "option-panel1", src = 5, x = 0, y = 0, w = 932, h = 903},
		{id = "option-subpanel1", src = 5, x = 2042, y = 775, w = 360, h = 903},
		{id = "option-subcursor", src = 5, x = 2403, y = 1424, w = 416, h = 50},
		{id = "option-subcursor2", src = 5, x = 2403, y = 1474, w = 416, h = 50},
		{id = "option-key1", src = 5, x = 933, y = 0, w = 318, h = 225},
		{id = "option-detail1", src = 5, x = 933, y = 226, w = 209, h = 496},
		{id = "option-detail2", src = 5, x = 1143, y = 226, w = 209, h = 328},
		{id = "option-detail3", src = 5, x = 1353, y = 226, w = 209, h = 286},
		{id = "option-detail4", src = 5, x = 1563, y = 226, w = 209, h = 496},
		{id = "option-detail5", src = 5, x = 1773, y = 226, w = 209, h = 244},
		{id = "option-terget1", src = 5, x = 0, y = 1809, w = 363, h = 450},
		{id = "option-terget2", src = 5, x = 363, y = 1809, w = 363, h = 450},
		{id = "option-terget3", src = 5, x = 363*2, y = 1809, w = 363, h = 450},
		{id = "option-terget4", src = 5, x = 363*3, y = 1809, w = 363, h = 450},
		{id = "option-terget5", src = 5, x = 363*4, y = 1809, w = 363, h = 450},
		{id = "option-terget6", src = 5, x = 363*5, y = 1809, w = 363, h = 450},
		{id = "option-terget7", src = 5, x = 363*6, y = 1809, w = 363, h = 450},
		{id = "option-terget8", src = 5, x = 363*7, y = 1809, w = 363, h = 450},
		{id = "option-terget9", src = 5, x = 363*8, y = 1809, w = 363, h = 450},
		{id = "option-terget10", src = 5, x = 363*9, y = 1809, w = 363, h = 450},
		{id = "option-terget11", src = 5, x = 363*10, y = 1809, w = 363, h = 450},
		--アシスト窓関連
		{id = "assist-panel1", src = 5, x = 0, y = 905, w = 932, h = 903},
		{id = "assist-key1", src = 5, x = 1252, y = 0, w = 318, h = 225},
		{id = "assist-detail1", src = 5, x = 1983, y = 226, w = 209, h = 198},
		{id = "assist-detail2", src = 5, x = 1983+210*1, y = 226, w = 209, h = 198},
		{id = "assist-detail3", src = 5, x = 1983+210*2, y = 226, w = 209, h = 198},
		{id = "assist-detail4", src = 5, x = 1983+210*3, y = 226, w = 209, h = 198},
		{id = "assist-detail5", src = 5, x = 1983+210*4, y = 226, w = 209, h = 198},
		{id = "assist-detail6", src = 5, x = 1983+210*5, y = 226, w = 209, h = 198},
		{id = "assist-detail7", src = 5, x = 1983+210*6, y = 226, w = 209, h = 198},
		--サブオプション窓関連
		{id = "subop-panel1", src = 5, x = 2403, y = 425, w = 932, h = 903},
		{id = "subop-subpanel1", src = 5, x = 3336, y = 425, w = 360, h = 903},
		{id = "subop-subdetail", src = 5, x = 3453, y = 0, w = 159, h = 262},
		{id = "subop-rect", src = 5, x = 3613, y = 0, w = 179, h = 37},
		{id = "subop-slider", src = 5, x = 3697, y = 458, w = 176, h = 2}, 
		{id = "subop-subdetail1", src = 5, x = 3813, y = 274, w = 179, h = 111 , divy = 3,len = 3, ref = 341, act = 341},
		{id = "subop-subdetail2", src = 5, x = 3453, y = 274, w = 179, h = 74 , divy = 2, len = 2, ref = 330, act = 330},
		{id = "subop-subdetail3", src = 5, x = 3453, y = 274, w = 179, h = 74 , divy = 2, len = 2, ref = 331, act = 331},
		{id = "subop-subdetail4", src = 5, x = 3453, y = 274, w = 179, h = 74 , divy = 2, len = 2, ref = 332, act = 332},
		{id = "subop-subdetail5", src = 5, x = 3453, y = 274, w = 179, h = 74 , divy = 2, len = 2, ref = 342, act = 342},
		{id = "subop-subdetail6", src = 5, x = 3633, y = 274, w = 179, h = 111 , divy = 3, len = 3, ref = 340, act = 340},
		{id = "subop-key1", src = 5, x = 1571, y = 0, w = 318, h = 225},
		{id = "subop-detail1", src = 5, x = 2193, y = 425, w = 209, h = 349},
		{id = "subop-detail2", src = 5, x = 1890, y = 0, w = 506, h = 198},
		{id = "subop-detail3", src = 5, x = 2904, y = 0, w = 209, h = 202},
		{id = "subop-detail4", src = 5, x = 3242, y = 0, w = 209, h = 198},
		{id = "subop-detail5", src = 5, x = 2397, y = 0, w = 433, h = 198},
		--ランダムオプションカーソル
		{id = "option-selector101", src = 5, x = 933, y = 1147, w = 175, h = 415},
		{id = "option-selector102", src = 5, x = 933, y = 1147-42*1, w = 175, h = 415},
		{id = "option-selector103", src = 5, x = 933, y = 1147-42*2, w = 175, h = 415},
		{id = "option-selector104", src = 5, x = 933, y = 1147-42*3, w = 175, h = 415},
		{id = "option-selector105", src = 5, x = 933, y = 1147-42*4, w = 175, h = 415},
		{id = "option-selector106", src = 5, x = 933, y = 1147-42*5, w = 175, h = 415},
		{id = "option-selector107", src = 5, x = 933, y = 1147-42*6, w = 175, h = 415},
		{id = "option-selector108", src = 5, x = 933, y = 1147-42*7, w = 175, h = 415},
		{id = "option-selector109", src = 5, x = 933, y = 1147-42*8, w = 175, h = 415},
		{id = "option-selector1010", src = 5, x = 933, y = 1147-42*9, w = 175, h = 415},
		--アシストオプションカーソル	
		{id = "option-selector21", src = 5, x = 1814, y = 811, w = 175, h = 79},
		{id = "option-selector22", src = 5, x = 1814, y = 811-42*1, w = 175, h = 79},
		--ダブルオプションカーソル			
		{id = "option-selector31", src = 5, x = 1462, y = 895, w = 175, h = 163},
		{id = "option-selector32", src = 5, x = 1462, y = 895-42*1, w = 175, h = 163},
		{id = "option-selector33", src = 5, x = 1462, y = 895-42*2, w = 175, h = 163},
		{id = "option-selector34", src = 5, x = 1462, y = 895-42*3, w = 175, h = 163},
		--ハイスピオプションカーソル		
		{id = "option-selector51", src = 5, x = 1286, y = 937, w = 175, h = 205},
		{id = "option-selector52", src = 5, x = 1286, y = 937-42*1, w = 175, h = 205},
		{id = "option-selector53", src = 5, x = 1286, y = 937-42*2, w = 175, h = 205},
		{id = "option-selector54", src = 5, x = 1286, y = 937-42*3, w = 175, h = 205},
		{id = "option-selector55", src = 5, x = 1286, y = 937-42*4, w = 175, h = 205},
		--ゲージオプションカーソル
		{id = "option-selector61", src = 5, x = 1110, y = 979, w = 175, h = 247},
		{id = "option-selector62", src = 5, x = 1110, y = 979-42*1, w = 175, h = 247},
		{id = "option-selector63", src = 5, x = 1110, y = 979-42*2, w = 175, h = 247},
		{id = "option-selector64", src = 5, x = 1110, y = 979-42*3, w = 175, h = 247},
		{id = "option-selector65", src = 5, x = 1110, y = 979-42*4, w = 175, h = 247},
		{id = "option-selector66", src = 5, x = 1110, y = 979-42*5, w = 175, h = 247},
		--GASインフォ	
		{id = "gasinfo1", src = 5, x = 2403, y = 1329, w = 205, h = 70},
		{id = "gasinfo2", src = 5, x = 2403+205*1, y = 1329, w = 205, h = 70},
		{id = "gasinfo3", src = 5, x = 2403+205*2, y = 1329, w = 205, h = 70},
		{id = "gasinfo4", src = 5, x = 2403+205*3, y = 1329, w = 205, h = 70},
		{id = "gasinfo5", src = 5, x = 2403+205*4, y = 1329, w = 205, h = 70},

		{id = "const-random", src = 8, x = 0, y = 0, w = 200, h = 24},
		{id = "const-mirror", src = 8, x = 0, y = 24, w = 200, h = 24},
		{id = "const-nospeed", src = 8, x = 0, y = 48, w = 200, h = 24},
		{id = "const-nogood", src = 8, x = 0, y = 72, w = 200, h = 24},
		{id = "const-nogreat", src = 8, x = 0, y = 96, w = 200, h = 24},
		


    }
	skin.imageset = {
		{id = "bar", images = {"bar-song","bar-folder","bar-table","bar-grade","bar-nograde","bar-command","bar-search","bar-nosong"}},
		{id = "modeset", ref = 11, images = {"allkeys","5keys","7keys","10keys","14keys","9keys","24keys","24keysDP"}, act = 11},
		{id = "modeset_bmsdata", ref = 11, images = {"allkeys_b","5keys_b","7keys_b","10keys_b","14keys_b","9keys_b","24keys_b","24keysDP_b"}, act = 11},
		{id = "option-exjudge", ref = 301, images = {"option-selector21","option-selector22"}},
		{id = "option-constant", ref = 302, images = {"option-selector21","option-selector22"}},
		{id = "option-judgearea", ref = 303, images = {"option-selector21","option-selector22"}},
		{id = "option-legacy", ref = 304, images = {"option-selector21","option-selector22"}},
		{id = "option-marknote", ref = 305, images = {"option-selector21","option-selector22"}},
		{id = "option-bpmguide", ref = 306, images = {"option-selector21","option-selector22"}},
		{id = "option-nomine", ref = 307, images = {"option-selector21","option-selector22"}},
		{id = "option-random", ref = 42, images = {"option-selector101","option-selector102","option-selector103",
		"option-selector104","option-selector105","option-selector106","option-selector107","option-selector108","option-selector109","option-selector1010"}},
		{id = "option-gauge", ref = 40, images = {"option-selector61","option-selector62","option-selector63","option-selector64","option-selector65","option-selector66"}},
		{id = "option-hsfix", ref = 55, images = {"option-selector51","option-selector52","option-selector53","option-selector54","option-selector55"}},
		{id = "option-gas", ref = 78, images = {"option-selector51","option-selector52","option-selector53","option-selector54","option-selector55"}},
		{id = "option-gasinfo", ref = 78, images = {"gasinfo1","gasinfo2","gasinfo3","gasinfo4","gasinfo5"}},
		{id = "option-random2", ref = 43, images = {"option-selector101","option-selector102","option-selector103",
		"option-selector104","option-selector105","option-selector106","option-selector107","option-selector108","option-selector109","option-selector1010"}},
		{id = "option-dp", ref = 54, images = {"option-selector31","option-selector32","option-selector33", "option-selector34"}},
		{id = "option-bga", ref = 72, images = {"option-selector31","option-selector32","option-selector33"}},
		{id = "option-adjust", ref = 75, images = {"option-selector21","option-selector22"}},
		{id = "option-terget", ref = 77, images = {"option-terget1","option-terget2","option-terget3","option-terget4","option-terget5",
		"option-terget6","option-terget7","option-terget8","option-terget9","option-terget10","option-terget11",}},
	}



	skin.value = {
		{id = "songs_count", src = 9, x = 0, y = 588, w = 286, h = 24, divx = 11,  digit = 5, ref = 300},
		{id = "maxbpm", src = 9, x = 0, y = 0, w = 390, h = 28, divx = 10,  digit = 3, ref = 90, align = 2},
		{id = "minbpm", src = 9, x = 0, y = 0, w = 390, h = 28, divx = 10,  digit = 3, ref = 91, align = 2},
		{id = "playlevel_count", src = 6, x = 0, y = 0, w = 240, h = 24, divx = 10,  digit = 3, ref = 96},

		-- BMSデータ文字
		{id = "bms_time_m", src = 9, x = 166, y = 865, w = 220, h = 18, divx = 11,  digit = 2, ref = 1163, align = 1},
		{id = "bms_time_s", src = 9, x = 166, y = 865, w = 200, h = 18, divx = 10,  digit = 2, ref = 1164, align = 1, padding = 1},
		{id = "bms_total", src = 9, x = 166, y = 865, w = 220, h = 18, divx = 11,  digit = 4, ref = 368, align = 1},
		{id = "bms_notes", src = 9, x = 166, y = 865, w = 220, h = 18, divx = 11,  digit = 4, ref = 74, align = 1},
		-- 譜面データ文字
		{id = "mainbpm", src = 9, x = 166, y = 849, w = 165, h = 15, divx = 11,  digit = 3, ref = 92, align = 1},
		{id = "totalnote_count", src = 9, x = 166, y = 849, w = 165, h = 15, divx = 11,  digit = 4, ref = 74, align = 1},
		{id = "peak_density", src = 9, x = 166, y = 849, w = 165, h = 15, divx = 11,  digit = 3, ref = 360, align = 1},
		{id = "end_density", src = 9, x = 166, y = 849, w = 165, h = 15, divx = 11,  digit = 3, ref = 362, align = 1},
		{id = "ave_density", src = 9, x = 166, y = 849, w = 165, h = 15, divx = 11,  digit = 3, ref = 364, align = 1},

		{id = "note_count", src = 9, x = 166, y = 849, w = 165, h = 15, divx = 11,  digit = 4, ref = 350, align = 2},
		{id = "long_count", src = 9, x = 166, y = 849, w = 165, h = 15, divx = 11,  digit = 4, ref = 351, align = 2},
		{id = "scratch_count", src = 9, x = 166, y = 849, w = 165, h = 15, divx = 11,  digit = 4, ref = 352, align = 2},
		{id = "bbs_count", src = 9, x = 166, y = 849, w = 165, h = 15, divx = 11,  digit = 4, ref = 353, align = 2},
		{id = "mines_count", src = 9, x = 166, y = 849, w = 165, h = 15, divx = 11,  digit = 4, ref = 354, align = 2},
		-- ランク差分スコア
		{id = "RANK_Diff_Exscore", src = 9,x = 166, y = 797, w = 216, h = 36, divx = 12, digit = 4, divy = 2, ref = 154, align = 0, zeropadding = 2},
		-- ライバルスコア比較用
		{id = "score_rival", src = 9, x = 166, y = 865, w = 220, h = 18, divx = 11,  digit = 4, ref = 271, align = 1},
		{id = "miss_rival", src = 9, x = 166, y = 865, w = 220, h = 18, divx = 11,  digit = 4, align = 1,value = function()
			local v1 = main_state.number(283)
			local v2 = main_state.number(284)
			if v1 >= 0 and v2 >= 0 then
				return v1 + v2
			else
				return 0
			end
		end},
		{id = "score_rival_diff", src = 9,x = 386, y = 320, w = 216, h = 36, divx = 12, digit = 5, divy = 2, align = 0, zeropadding = 2,value = function()
			local v1 = main_state.number(71)
			local v2 = main_state.number(271)
			if v1 < 0 then v1 = 0 end
			if v2 < 0 then v2 = 0 end
			return v1 - v2
				end,},
		{id = "miss_rival_diff", src = 9,x = 386, y = 283, w = 216, h = 36, divx = 12, digit = 5, divy = 2, align = 0, zeropadding = 2,value = function()
			local v1 = main_state.number(76)
			local v2 = main_state.number(283)
			local v3 = main_state.number(284)
			local v4 = main_state.number(271)
			if v1 < 0 then 
				if v4 <= 0 then
					v1 = 0
				else
					v1 = main_state.number(74)
				end
			end
			if v2 < 0 then v2 = 0 end
			if v3 < 0 then v3 = 0 end
			return v1 - (v2 + v3)
		end},

		{id = "scorerate_count", src = 9, x = 166, y = 834, w = 165, h = 14, divx = 11,  digit = 3, ref = 102},
		{id = "scorerate_dot_count", src = 9, x = 166, y = 834, w = 150, h = 14, divx = 10,  digit = 2, ref = 103, padding = 1},

		{id = "score_count", src = 9, x = 0, y = 588, w = 286, h = 24, divx = 11,  digit = 4, ref = 71, zeropadding = 2},
		{id = "score_max", src = 9, x = 0, y = 588, w = 286, h = 24, divx = 11,  digit = 4, ref = 72},
		{id = "miss_count", src = 9, x = 0, y = 588, w = 286, h = 24, divx = 11,  digit = 4, ref = 76},
		{id = "combo_break", src = 9, x = 0, y = 588, w = 286, h = 24, divx = 11,  digit = 4, ref = 425},
		{id = "combo_count", src = 9, x = 0, y = 588, w = 286, h = 24, divx = 11,  digit = 4, ref = 75},
		{id = "total_notes", src = 9, x = 0, y = 588, w = 286, h = 24, divx = 11,  digit = 4, ref = 74},
		{id = "clear_count", src = 9, x = 0, y = 588, w = 286, h = 24, divx = 11,  digit = 4, ref = 78},
		{id = "play_count", src = 9, x = 0, y = 588, w = 286, h = 24, divx = 11,  digit = 4, ref = 77},


		{id = "playdata_pgreat", src = 9,x = 166, y = 797, w = 198, h = 18, divx = 11, digit = 4, ref = 110},
		{id = "playdata_great", src = 9,x = 166, y = 797, w = 198, h = 18, divx = 11, digit = 4, ref = 111},
		{id = "playdata_good", src = 9,x = 166, y = 797, w = 198, h = 18, divx = 11, digit = 4, ref = 112},
		{id = "playdata_bad", src = 9,x = 166, y = 797, w = 198, h = 18, divx = 11, digit = 4, ref = 113},
		{id = "playdata_poor", src = 9,x = 166, y = 797, w = 198, h = 18, divx = 11, digit = 4, ref = 426},
		{id = "playdata_fast", src = 9,x = 166, y = 797, w = 198, h = 18, divx = 11, digit = 4,value = function()
			local v1 = main_state.number(412)
			local v2 = main_state.number(414)
			local v3 = main_state.number(416)
			local v4 = main_state.number(418)
			local v5 = main_state.number(421)
			return v1 + v2 + v3 + v4 + v5
		end},
		{id = "playdata_slow", src = 9,x = 166, y = 797, w = 198, h = 18, divx = 11, digit = 4,value = function()
			local v1 = main_state.number(413)
			local v2 = main_state.number(415)
			local v3 = main_state.number(417)
			local v4 = main_state.number(419)
			local v5 = main_state.number(422)
			return v1 + v2 + v3 + v4 + v5
		end},

		{id = "ir_1", src = 9,x = 166, y = 797, w = 198, h = 18, divx = 11, digit = 4, ref = 380},
		{id = "ir_2", src = 9,x = 166, y = 797, w = 198, h = 18, divx = 11, digit = 4, ref = 381},
		{id = "ir_3", src = 9,x = 166, y = 797, w = 198, h = 18, divx = 11, digit = 4, ref = 382},
		{id = "ir_4", src = 9,x = 166, y = 797, w = 198, h = 18, divx = 11, digit = 4, ref = 383},
		{id = "ir_5", src = 9,x = 166, y = 797, w = 198, h = 18, divx = 11, digit = 4, ref = 384},
		{id = "ir_rank", src = 9,x = 166, y = 797, w = 198, h = 18, divx = 11, digit = 4, ref = 179},
		{id = "ir_ranktotal", src = 9,x = 166, y = 797, w = 198, h = 18, divx = 11, digit = 4, ref = 180},
		{id = "ir_clearrate1", src = 9,x = 166, y = 797, w = 198, h = 18, divx = 11, digit = 3, ref = 227},
		{id = "ir_clearrate2", src = 9,x = 398, y = 865, w = 198, h = 18, divx = 11, digit = 2, ref = 241},

		{id = "totalplay_count", src = 6, x = 166, y = 834, w = 165, h = 14, divx = 11,  digit = 6, ref = 30},
		{id = "totalnotes_count", src = 6, x = 166, y = 834, w = 165, h = 14, divx = 11,  digit = 10, ref = 333},

		{id = "playlevel_OTHER", src = 2, x = 159, y = 576, w = 460, h = 37, divx = 10,  digit = 2, align = 2,},
		{id = "playlevel_BEGINNER", src = 2, x = 159, y = 576+37*1, w = 460, h = 37, divx = 10,  digit = 2, align = 2,},
		{id = "playlevel_NORMAL", src = 2, x = 159, y = 576+37*2, w = 460, h = 37, divx = 10,  digit = 2, align = 2,},
		{id = "playlevel_HYPER", src = 2, x = 159, y = 576+37*3, w = 460, h = 37, divx = 10,  digit = 2, align = 2,},
		{id = "playlevel_ANOTHER", src = 2, x = 159, y = 576+37*4, w = 460, h = 37, divx = 10,  digit = 2, align = 2,},
		{id = "playlevel_INSANE", src = 2, x = 159, y = 576+37*5, w = 460, h = 37, divx = 10,  digit = 2, align = 2,},

		{id = "time_year", src = 9, x = 166, y = 849, w = 165, h = 15, divx = 11,  digit = 4, ref = 21},
		{id = "time_month", src = 9, x = 166, y = 849, w = 165, h = 15, divx = 11,  digit = 2,  padding = 1, ref = 22},
		{id = "time_day", src = 9, x = 166, y = 849, w = 165, h = 15, divx = 11, digit = 2,  padding = 1, ref = 23},
		{id = "time_hour", src = 9, x = 166, y = 849, w = 165, h = 15, divx = 11, digit = 2,  padding = 1, ref = 24},
		{id = "time_minute", src = 9, x = 166, y = 849, w = 165, h = 15, divx = 11,  digit = 2,  padding = 1, ref = 25},
		{id = "time_second", src = 9, x = 166, y = 849, w = 165, h = 15, divx = 11,  digit = 2,  padding = 1, ref = 26},

		{id = "master_num", src = 5, x = 3114, y = 0, w = 99, h = 12, divx = 10,  digit = 3, ref = 57 , align = 2},
		{id = "bg_num", src = 5, x = 3114, y = 0, w = 99, h = 12, divx = 10,  digit = 3, ref = 58 , align = 2},
		{id = "key_num", src = 5, x = 3114, y = 0, w = 99, h = 12, divx = 10,  digit = 3, ref = 59 , align = 2},


		{id = "green_num", src = 5, x = 3114, y = 12, w = 99, h = 12, divx = 10,  digit = 4, ref = 313 , align = 2},
		{id = "duration", src = 5, x = 3114, y = 0, w = 99, h = 12, divx = 10,  digit = 4, ref = 312 , align = 2},
		{id = "judgetiming", src = 5, x = 3114, y = 25, w = 108, h = 24, divx = 12, divy = 2,  digit = 4, ref = 12 , align = 2},
		
		{id = "mainbpm-num", src = 0, x = 130, y = 565, w = 99, h = 13, divx = 11, divy = 1,  digit = 7, ref = 92},
	}

	skin.text = {
		{id = "dir", font = 8, size = 18, overflow = 1, ref = 1000},
		{id = "genre", font = 9, size = 20, overflow = 1, ref = 13},
		{id = "title", font = 7, size = 50, overflow = 1, ref = 10},
		{id = "subtitle", font = 10, size = 20, overflow = 1, ref = 11},
		{id = "artist", font = 9, size = 20, overflow = 1, ref = 16},
		{id = "coursedir", font = 1, size = 18, overflow = 1, ref = 1000},
		{id = "course1", font = 12, size = 18, overflow = 1, ref = 150},
		{id = "course2", font = 12, size = 18, overflow = 1, ref = 151},
		{id = "course3", font = 12, size = 18, overflow = 1, ref = 152},
		{id = "course4", font = 12, size = 18, overflow = 1, ref = 153},
		{id = "course5", font = 12, size = 18, overflow = 1, ref = 154},

		{id = "ex_ir1", font = 2, size = 12, align = 0, overflow = 1, ref = 120},
		{id = "ex_ir2", font = 2, size = 12, align = 0, overflow = 1, ref = 121},
		{id = "ex_ir3", font = 2, size = 12, align = 0, overflow = 1, ref = 122},
		{id = "ex_ir4", font = 2, size = 12, align = 0, overflow = 1, ref = 123},
		{id = "ex_ir5", font = 2, size = 12, align = 0, overflow = 1, ref = 124},



		{id = "irname", font = 9, size = 12, overflow = 1, ref = 1020},
		{id = "rivalname", font = 9, size = 12, overflow = 1, ref = 1, align = 1},

		{id = "bartext", font = 1, size = 25},
		{id = "bartext1", font = 4, size = 25},
		{id = "bartext2", font = 5, size = 25},
		{id = "bartext3", font = 6, size = 25},
		{id = "bartext4", font = 11, size = 25},
		{id = "search", font = 0, size = 24, ref = 30},
	}
    skin.slider = {
        -- {id = 1050, src = 0, x = 0, y = 289, w = 14, h = 20, angle = 2, range = 520,type = 6}
        {id = "song_slider_main", src = 9, x = 1650, y = 0, w = 69, h = 48, angle = 2, range = 522 , type = 1},
		{id = "master_slider", src = 5, x = 3697, y = 425, w = 31, h = 31, angle = 1, range = 176 , type = 17},    
		{id = "key_slider", src = 5, x = 3697, y = 425, w = 31, h = 31, angle = 1, range = 176 , type = 18},  
		{id = "bg_slider", src = 5, x = 3697, y = 425, w = 31, h = 31, angle = 1, range = 176 , type = 19},  
    }

	skin.graph = {
		{id = "master_g_slider", src = 5, x = 3697, y = 458, w = 176, h = 2, angle = 2, type = 17},    
		{id = "key_g_slider", src = 5, x = 3697, y = 458, w = 176, h = 2, angle = 2, type = 18},  
		{id = "bg_g_slider", src = 5, x = 3697, y = 458, w = 176, h = 2, angle = 2, type = 19},  


		{id = "playdata_graph_pgreat", src = 9, x = 1248, y = 2995, w = 96, h = 12, angle = 0, type = 140},  
		{id = "playdata_graph_great", src = 9, x = 1248, y = 2995 + 13*1, w = 96, h = 12, angle = 0, type = 141}, 
		{id = "playdata_graph_good", src = 9, x = 1248, y = 2995 + 13*2, w = 96, h = 12, angle = 0, type = 142}, 
		{id = "playdata_graph_bad", src = 9, x = 1248, y = 2995 + 13*3, w = 96, h = 12, angle = 0, type = 143}, 
		{id = "playdata_graph_poor", src = 9, x = 1248, y = 2995 + 13*4, w = 96, h = 12, angle = 0, type = 144}, 
		{id = "playdata_graph_fast", src = 9, x = 1248, y = 2995 + 13*5, w = 96, h = 12, angle = 0,  value = function()
			local fastall = main_state.number(410)+main_state.number(412)+main_state.number(414)+main_state.number(416)+main_state.number(418)+main_state.number(421)
			local slowall = main_state.number(411)+main_state.number(413)+main_state.number(415)+main_state.number(417)+main_state.number(419)+main_state.number(422)
			local fsall = main_state.number(410)+main_state.number(412)+main_state.number(414)+main_state.number(416)+main_state.number(418)+main_state.number(421)+main_state.number(411)+main_state.number(413)+main_state.number(415)+main_state.number(417)+main_state.number(419)+main_state.number(422)
			return fastall / fsall
		end},  
		{id = "playdata_graph_slow", src = 9, x = 1248, y = 2995 + 13*6, w = 96, h = 12, angle = 0, value = function()
			local fastall = main_state.number(410)+main_state.number(412)+main_state.number(414)+main_state.number(416)+main_state.number(418)+main_state.number(421)
			local slowall = main_state.number(411)+main_state.number(413)+main_state.number(415)+main_state.number(417)+main_state.number(419)+main_state.number(422)
			local fsall = main_state.number(410)+main_state.number(412)+main_state.number(414)+main_state.number(416)+main_state.number(418)+main_state.number(421)+main_state.number(411)+main_state.number(413)+main_state.number(415)+main_state.number(417)+main_state.number(419)+main_state.number(422)
			return slowall / fsall
		end}, 

		{id = "graph-lamp", src = 3, x = 0, y = 330, w = 11, h = 30, divx = 11, divy = 2, cycle = 100, type = -1},
		{id = "graph-rank", type = -2},
 		{id = "score_graph", src = 9, x = 960, y = 823, w = 381, h = 16, type = 147,angle = 0},
	}

	skin.judgegraph = {
		{id = "notes-graph", type = 0}
	}
	skin.bpmgraph = {
		{id = "bpmgraph"}
	}

local 
iroffset = 0
	if irwindow_A() then
		iroffset = 0

	elseif irwindow_B() then
		iroffset = 715
end


	skin.songlist = {
		id = "songlist",
		center = 11,
		clickable = {4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23},
		listoff = {
			{id = "bar",dst = {
			{x = 1258, y = 1110, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1258, y = 1110-52*1, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1258, y = 1110-52*2, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1258, y = 1110-52*3, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1258, y = 1110-52*4, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1258, y = 1110-52*5, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1258, y = 1110-52*6, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1258, y = 1110-52*7, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1258, y = 1110-52*8, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1258, y = 1110-52*9, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1258, y = 1110-52*10, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1258, y = 1110-52*11, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1258, y = 1110-52*12, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1258, y = 1110-52*13, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1258, y = 1110-52*14, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1258, y = 1110-52*15, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1258, y = 1110-52*16, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1258, y = 1110-52*17, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1258, y = 1110-52*18, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1258, y = 1110-52*19, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1258, y = 1110-52*20, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1258, y = 1110-52*21, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1258, y = 1110-52*22, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1258, y = 1110-52*23, w = 730, h = 52},
			}},
		},

		liston = {
			{id = "bar", dst = {
			{x = 1218, y = 1110, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1218, y = 1110-52*1, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1218, y = 1110-52*2, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1218, y = 1110-52*3, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1218, y = 1110-52*4, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1218, y = 1110-52*5, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1218, y = 1110-52*6, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1218, y = 1110-52*7, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1218, y = 1110-52*8, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1218, y = 1110-52*9, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1218, y = 1110-52*10, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1218, y = 1110-52*11, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1218, y = 1110-52*12, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1218, y = 1110-52*13, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1218, y = 1110-52*14, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1218, y = 1110-52*15, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1218, y = 1110-52*16, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1218, y = 1110-52*17, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1218, y = 1110-52*18, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1218, y = 1110-52*19, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1218, y = 1110-52*20, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1218, y = 1110-52*21, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1218, y = 1110-52*22, w = 730, h = 52},
			}},
			{id = "bar", dst = {
			{x = 1218, y = 1110-52*23, w = 730, h = 52},
			}},
		},
		text = {
			{id = "bartext", filter = 1, dst = {{x = 155, y = 13, w = 580, h = 24}}},-- 通常
			{id = "bartext", filter = 1, dst = {{x = 155, y = 13, w = 580, h = 24}}},-- 新規
			{id = "bartext", filter = 1, dst = {{x = 155, y = 13, w = 580, h = 24}}},-- SongBar通常
			{id = "bartext", filter = 1, dst = {{x = 155, y = 13, w = 580, h = 24}}},-- SongBar新規
			{id = "bartext4", filter = 1, dst = {{x = 50, y = 13, w = 580, h = 24}}},-- FolderBar通常
			{id = "bartext4", filter = 1, dst = {{x = 50, y = 13, w = 580, h = 24}}},-- FolderBar新規
			{id = "bartext1", filter = 1, dst = {{x = 50, y = 13, w = 580, h = 24}}},-- TableBar or HashBar
			{id = "bartext", filter = 1, dst = {{x = 155, y = 13, w = 580, h = 24}}},-- GradeBar
			{id = "bartext", filter = 1, dst = {{x = 155, y = 13, w = 580, h = 24}}},-- SongBar or GradeBar（曲未所持）
			{id = "bartext2", filter = 1, dst = {{x = 50, y = 13, w = 580, h = 24}}},-- CommandBar or ContainerBar			
			{id = "bartext3", filter = 1, dst = {{x = 50, y = 13, w = 580, h = 24}}},-- SearchWordBar
		},
		level = {
			{id = "playlevel_OTHER",filter = 1 ,  dst = {
				{x = 37, y = 12, w = 38, h = 30}
			}},
			{id = "playlevel_BEGINNER",filter = 1 ,  dst = {
				{x = 37, y = 12, w = 38, h = 30}
			}},
			{id = "playlevel_NORMAL",filter = 1 ,  dst = {
				{x = 37, y = 12, w = 38, h = 30}
			}},
			{id = "playlevel_HYPER",filter = 1 ,  dst = {
				{x = 37, y = 12, w = 38, h = 30}
			}},
			{id = "playlevel_ANOTHER",filter = 1 , dst = {
				{x = 37, y = 12, w = 38, h = 30}
			}},
			{id = "playlevel_INSANE",filter = 1 ,  dst = {
				{x = 37, y = 12, w = 38, h = 30}
			}},
			{id = "playlevel_OTHER",filter = 1 ,  dst = {
				{x = 37, y = 12, w = 38, h = 30}
			}},
		},
			lamp = {
			{id = "lamp-noplay", filter = 1 ,  dst = {
				{x = 0, y = 2, w = 46, h = 68}
			}},
			{id = "lamp-failed", filter = 1 ,  dst = {
				{x = -7, y = -8, w = 46, h = 68, a = 100}
			}},
			{id = "lamp-assist", filter = 1 ,  dst = {
				{x = -7, y = 2, w = 40, h = 58}
			}},
			{id = "lamp-lassist", filter = 1 ,  dst = {
				{x = -7, y = 2, w = 40, h = 58}
			}},
			{id = "lamp-easy", filter = 1 , dst = {
				{x = -7, y = 2, w = 40, h = 58}
			}},
			{id = "lamp-normal", filter = 1 ,  dst = {
				{x = -7, y = 2, w = 40, h = 58}
			}},
			{id = "lamp-hard", filter = 1 ,  dst = {
				{x = -7, y = 2, w = 40, h = 58}
			}},
			{id = "lamp-exhard", filter = 1 ,  dst = {
				{x = -7, y = -8, w = 46, h = 68}
			}},
			{id = "lamp-fc", filter = 1 ,  dst = {
				{x = -7, y = -8, w = 46, h = 68}
			}},
			{id = "lamp-perfect", filter = 1 ,  dst = {
				{x = -7, y = -8, w = 46, h = 68}
			}},
			{id = "lamp-max", filter = 1 ,  dst = {
				{x = -7, y = -8, w = 46, h = 68}
			}},
		},
				playerlamp = {
			{id = "lamp-noplay1", filter = 1 , dst = {
				{x = -7, y = 28, w = 46, h = 34}
			}},
			{id = "lamp-failed1", filter = 1 ,  dst = {
				{x = -7, y = 26, w = 46, h = 34, a = 100}
			}},
			{id = "lamp-assist1", filter = 1 ,  dst = {
				{x = -7, y = 26, w = 40, h = 34}
			}},
			{id = "lamp-lassist1", filter = 1 ,  dst = {
				{x = -7, y = 26, w = 40, h = 34}
			}},
			{id = "lamp-easy1", filter = 1 ,  dst = {
				{x = -7, y = 26, w = 40, h = 34}
			}},
			{id = "lamp-normal1", filter = 1 ,  dst = {
				{x = -7, y = 26, w = 40, h = 34}
			}},
			{id = "lamp-hard1", filter = 1 ,  dst = {
				{x = -7, y = 26, w = 40, h = 34}
			}},
			{id = "lamp-exhard1", filter = 1 ,  dst = {
				{x = -7, y = 26, w = 46, h = 34}
			}},
			{id = "lamp-fc1", filter = 1 ,  dst = {
				{x = -7, y = 26, w = 46, h = 34}
			}},
			{id = "lamp-perfect1", filter = 1 ,  dst = {
				{x = -7, y = 26, w = 46, h = 34}
			}},
			{id = "lamp-max1", filter = 1 ,  dst = {
				{x = -7, y = 26, w = 46, h = 34}
			}},
		},
		rivallamp = {
			{id = "lamp-noplay2", filter = 1 ,  dst = {
				{x = -7, y = 28, w = 46, h = 34}
			}},
			{id = "lamp-failed2", filter = 1 ,  dst = {
				{x = -7, y = -8, w = 46, h = 34, a = 100}
			}},
			{id = "lamp-assist2", filter = 1 ,  dst = {
				{x = -7, y = -8, w = 40, h = 34}
			}},
			{id = "lamp-lassist2", filter = 1 ,  dst = {
				{x = -7, y = -8, w = 40, h = 34}
			}},
			{id = "lamp-easy2", filter = 1 ,  dst = {
				{x = -7, y = -8, w = 40, h = 34}
			}},
			{id = "lamp-normal2", filter = 1 ,  dst = {
				{x = -7, y = -8, w = 40, h = 34}
			}},
			{id = "lamp-hard2", filter = 1 ,  dst = {
				{x = -7, y = -8, w = 40, h = 34}
			}},
			{id = "lamp-exhard2", filter = 1 ,  dst = {
				{x = -7, y = -8, w = 46, h = 34}
			}},
			{id = "lamp-fc2", filter = 1 ,  dst = {
				{x = -7, y = -8, w = 46, h = 34}
			}},
			{id = "lamp-perfect2", filter = 1 ,  dst = {
				{x = -7, y = -8, w = 46, h = 34}
			}},
			{id = "lamp-max2", filter = 1 ,  dst = {
				{x = -7, y = -8, w = 46, h = 34}
			}},
		},
		trophy = {
			{id = "trophy-bronze", dst = {
				{x = 57, y = 4, w = 44, h = 44}
			}},
			{id = "trophy-silver", dst = {
				{x = 57, y = 4, w = 44, h = 44}
			}},
			{id = "trophy-gold", dst = {
				{x = 57, y = 4, w = 44, h = 44}
			}},
		},
		label = {
			{id = "label-ln", dst = {
				{x = -88, y = 17, w = 80, h = 24}
			}},
			{id = "label-random", dst = {
				{time = 0 , x = 578, y = 5, w = 81, h = 25 , a = 0},
				{time = 1000 , a = 255},
				{time = 2000 , a = 255},
				{time = 3000 , a = 0},
			}},
			{id = "label-mine", dst = {
				{time = 0 , x = 578, y = 30, w = 81, h = 25 , a = 0},
				{time = 1000 , a = 255},
				{time = 2000 , a = 255},
				{time = 3000 , a = 0},
			}},
		},

		graph = {id = "graph-lamp", dst = {{x = 35, y = 3, w = 400, h = 4}}},
	}

    skin.destination = {

    --BG
        {id = "bg", dst = { 
        {x = 0, y = 0, w = 1920, h = 1080} 
        }},
		{ id = "Particle", blend = 2 , filter = 1 , dst = {
			{ x = 0, y = 0, w = 1920, h = 700 , a = 40 },
		}},
		{ id = "Particle", blend = 2 , filter = 1 ,loop = 200 , dst = {
			{time = 0 , x = 0, y = 0, w = 2194, h = 800 , a = 255 },
			{time = 200 , a = 0 },
		}},

        {id = "mv", op = {920} , dst = { 
        {x = 0, y = 0, w = 1920, h = 1080} 
        }},

        {id = "dev",blend=2, dst = { 
        {x = 2, y = 24, w = 260, h = 13, a = 180} 
        }},

	--曲バーと影とカーソル
		{id = "songlist"},

		{id = "shadow", dst = {{x = 0, y = 0, w = 1920, h = 1080}}},
		{id = "shadow", dst = {{x = 0, y = 0, w = 1920, h = 1080}}},
		{id = "shadow", dst = {{x = 0, y = 0, w = 1920, h = 1080}}},

        {id = "cursor", filter = 1 , dst = { 
        {x = 1208, y = 522, w = 712, h = 83} 
        }},
        {id = "cursor", filter = 1 , blend = 2 , acc = 2 , dst = { 
        {time = 0, x = 1208, y = 522, w = 712, h = 83 , a = 0 },
        {time = 400, w = 712, h = 83 , a = 0 },
        {time = 800, w = 712, h = 83 , a = 150 },
        {time = 2000, w = 712, h = 83 , a = 0 },
        {time = 3000, w = 712, h = 83 , a = 0 },
        }},

		{id = "song_slider", dst = {
			{x = 1855, y = 187, w = 65, h = 764}
		}},
		{id = "song_slider_main", blend = 2 , dst = {
			{x = 1851, y = 805, w = 69, h = 48}
		}},
		{id = "song_slider_main", blend = 2 , dst = {
			{x = 1851, y = 805, w = 69, h = 48, a = 0 },
	        {time = 0, a = 0 },
	        {time = 400, a = 0 },
	        {time = 800,a = 150 },
	        {time = 2000, a = 0 },
	        {time = 3000,a = 0 },
		}},
    --コース関連
		{id = "courseframe" , op = {3} , dst = {
			{x = 434, y = 405, w = 622, h = 453}
		}},

		{id = "coursedir",filter = 1 , timer = 11 , loop = 200 , acc = 2 , op = {3}, dst = {
			{time = 0 , x = 451+10, y = 834-21, w = 640, h = 24 , a = 0, acc = 2 },
			{time = 200 , x = 451, y = 834-21, w = 640, h = 24 , a = 255, acc = 2 },
		}},

		{id = "course1",filter = 1 , timer = 11 , loop = 200 , acc = 2 , dst = {
			{x = 569, y = 756, w = 465, h = 24, a = 0},
			{time = 200,x = 559, a = 255},
		}},
		{id = "course2",filter = 1 , timer = 11 , loop = 250 , acc = 2 , dst = {
			{time = 50,x = 569, y = 756-57*1, w = 465, h = 24, a = 0},
			{time = 250,x = 559, a = 255},
		}},
		{id = "course3",filter = 1 , timer = 11 , loop = 300 , acc = 2 , dst = {
			{time = 100,x = 569, y = 756-57*2, w = 465, h = 24, a = 0},
			{time = 300,x = 559, a = 255},
		}},
		{id = "course4",filter = 1 , timer = 11 , loop = 350 , acc = 2 , dst = {
			{time = 150,x = 569, y = 756-57*3, w = 465, h = 24, a = 0},
			{time = 350,x = 559, a = 255},
		}},
		{id = "course5",filter = 1 , timer = 11 , loop = 400 , acc = 2 , dst = {
			{time = 200,x = 569, y = 756-57*4, w = 465, h = 24, a = 0},
			{time = 400,x = 559, a = 255},
		}},

		{id = "COURSE-GAUGEOFF" , op = {3,-1010,-1011,-1012,-1013,-1014} , timer = 11 , loop = 200 ,  acc = 2 , dst = {
			{time = 0, x = 443, y = 415, w = 219, h = 58, a = 0},
			{time = 200, a = 200},		
		}},
		{id = "COURSE-GAUGELR2" , op = {3,1010} , timer = 11 , loop = 200 ,  acc = 2 ,  dst = {
			{time = 0, x = 443, y = 415, w = 219, h = 58, a = 0},
			{time = 200, a = 200},		
		}},
		{id = "COURSE-GAUGE5K" , op = {3,1011} , timer = 11 , loop = 200 ,  acc = 2 ,  dst = {
			{time = 0, x = 443, y = 415, w = 219, h = 58, a = 0},
			{time = 200, a = 200},	
		}},
		{id = "COURSE-GAUGE7K" , op = {3,1012} , timer = 11 , loop = 200 ,  acc = 2 ,  dst = {
			{time = 0, x = 443, y = 415, w = 219, h = 58, a = 0},
			{time = 200, a = 200},	
		}},
		{id = "COURSE-GAUGE9K" , op = {3,1013} , timer = 11 , loop = 200 ,  acc = 2 ,  dst = {
			{time = 0, x = 443, y = 415, w = 219, h = 58, a = 0},
			{time = 200, a = 200},		
		}},
		{id = "COURSE-GAUGE24K" , op = {3,1014} , timer = 11 , loop = 200 ,  acc = 2 ,  dst = {
			{time = 0, x = 443, y = 415, w = 219, h = 58, a = 0},
			{time = 200, a = 200},		
		}},

		{id = "COURSE-OPTIONOFF" , op = {3,-1002,-1003,-1004} , timer = 11 , loop = 200 ,  acc = 2 ,  dst = {
			{time = 0,x = 674, y = 415, w = 86, h = 58, a = 0},
			{time = 200, a = 200},	
		}},
		{id = "COURSE-CLASS" , op = {3,1002} , timer = 11 , loop = 200 ,  acc = 2 ,  dst = {
			{time = 0,x = 674, y = 415, w = 86, h = 58, a = 0},
			{time = 200, a = 200},	
		}},
		{id = "COURSE-MIRROR" , op = {3,1003} , timer = 11 , loop = 200 ,  acc = 2 ,  dst = {
			{time = 0,x = 674, y = 415, w = 86, h = 58, a = 0},
			{time = 200, a = 200},	
		}},
		{id = "COURSE-RANDOM" , op = {3,1004} ,  timer = 11 , loop = 200 ,  acc = 2 , dst = {
			{time = 0,x = 674, y = 415, w = 86, h = 58, a = 0},
			{time = 200, a = 200},	
		}},

		{id = "COURSE-OPTIONOFF" , op = {3,-1005} ,  timer = 11 , loop = 200 ,  acc = 2 ,  dst = {
			{time = 0,x = 770, y = 415, w = 86, h = 58, a = 0},
			{time = 200, a = 200},	
		}},
		{id = "COURSE-NOSPEED" , op = {3,1005} ,  timer = 11 , loop = 200 ,  acc = 2 ,  dst = {
			{time = 0,x = 770, y = 415, w = 86, h = 58, a = 0},
			{time = 200, a = 200},	
		}},

		{id = "COURSE-OPTIONOFF" , op = {3,-1006,-1007} ,  timer = 11 , loop = 200 ,  acc = 2 ,   dst = {
			{time = 0 , x = 866, y = 415, w = 86, h = 58, a = 0},
			{time = 200, a = 200},	
		}},
		{id = "COURSE-NOGOOD" , op = {3,1006} ,  timer = 11 , loop = 200 ,  acc = 2 ,   dst = {
			{time = 0 , x = 866, y = 415, w = 86, h = 58, a = 0},
			{time = 200, a = 200},	
		}},
		{id = "COURSE-NOGREAT" , op = {3,1007} ,  timer = 11 , loop = 200 ,  acc = 2 ,   dst = {
			{time = 0 , x = 866, y = 415, w = 86, h = 58, a = 0},
			{time = 200, a = 200},	
		}},

		{id = "COURSE-OPTIONOFF" , op = {3,-1015,-1016,-1017} ,  timer = 11 , loop = 200 ,  acc = 2 ,   dst = {
			{time = 0 ,x = 962, y = 415, w = 86, h = 58, a = 0},
			{time = 200, a = 200},	
		}},
		{id = "COURSE-LN" , op = {3,1015} ,  timer = 11 , loop = 200 ,  acc = 2 ,   dst = {
			{time = 0 ,x = 962, y = 415, w = 86, h = 58, a = 0},
			{time = 200, a = 200},	
		}},		
		{id = "COURSE-CN" , op = {3,1016} ,  timer = 11 , loop = 200 ,  acc = 2 ,   dst = {
			{time = 0 ,x = 962, y = 415, w = 86, h = 58, a = 0},
			{time = 200, a = 200},	
		}},		
		{id = "COURSE-HCN" , op = {3,1017} ,  timer = 11 , loop = 200 ,  acc = 2 ,   dst = {
			{time = 0 ,x = 962, y = 415, w = 86, h = 58, a = 0},
			{time = 200, a = 200},	
		}},		

 --[[
		{id = "const-random", op = {1004}, dst = {{x = 180+451, y = 602+150, w = 150, h = 18, b = 0}}},
		{id = "const-mirror", op = {1003}, dst = {{x = 180+451, y = 602+150, w = 150, h = 18, b = 0}}},
		{id = "const-nospeed", op = {1005}, dst = {{x = 330+451, y = 602+150, w = 150, h = 18, b = 0}}},
		{id = "const-nogood", op = {1006}, dst = {{x = 480+451, y = 602+150, w = 150, h = 18, b = 0}}},
		{id = "const-nogreat", op = {1007}, dst = {{x = 480+451, y = 602+150, w = 150, h = 18, b = 0}}},
]]--		
    --ライバルスコア窓
		{id = "rival_infowindow", op = {2,625} ,  dst = {
			{x = 1505, y = 826, w = 366, h = 100}
		}},
		{id = "score_rival", filter = 1 , op = {2,625}, dst = {
			{x = 1678, y = 877, w = 18, h = 18}
		}},
		{id = "miss_rival", filter = 1 , op = {2,625}, dst = {
			{x = 1678, y = 857, w = 18, h = 18}
		}},
		{id = "score_rival_diff", filter = 1 , op = {2,625}, dst = {
			{x = 1768, y = 877, w = 18, h = 18}
		}},
		{id = "miss_rival_diff", filter = 1 , op = {2,625}, dst = {
			{x = 1768, y = 857, w = 18, h = 18}
		}},

		{id = "rival_draw", filter = 1 , op = {2,625,354}, dst = {
			{x = 1796, y = 837, w = 62, h = 18}
		}},
		{id = "rival_win", filter = 1 , op = {2,625,352}, dst = {
			{x = 1772, y = 837, w = 86, h = 18}
		}},
		{id = "rival_lose", filter = 1 , op = {2,625,353}, dst = {
			{x = 1750, y = 837, w = 108, h = 18}
		}},

		{id = "state_rival_clear", filter = 1 , op = {2,625}, dst = {
			{x = 1519, y = 838, w = 97, h = 16}
		}},	
    --スコア窓


		{id = "score_window", dst = {
			{x = 30, y = 108-30, w = 584, h = 183}
		}},
		{id = "score_bar", dst = {
			{x = 315, y = 155-30, w = 15, h = 98}
		}},
		{id = "score_center_bar", dst = {
			{x = 453, y = 156-30, w = 1, h = 101, a = 140}
		}},
		{id = "score_per", op = {2} , dst = {
			{x = 537, y = 138-30, w = 57, h = 14}
		}},



		{id = "state_clear", dst = {{x = 475, y = 177-30, w = 109, h = 19}}},	

		{id = "rank_aaa", op = {200} , timer = 11 , loop = 200 , dst = {
			{time = 0 , x = 468, y = 210-30, w = 122, h = 39, a = 0, acc = 2},
			{time = 200 , y = 200-30, a = 255, acc = 2},
		}},
		{id = "rank_aa", op = {201},timer = 11,loop = 200, dst = {
			{time = 0 , x = 468, y = 210-30, w = 122, h = 39, a = 0, acc = 2},
			{time = 200 , y = 200-30, a = 255, acc = 2},
		}},
		{id = "rank_a", op = {202},timer = 11,loop = 200, dst = {
			{time = 0 , x = 468, y = 210-30, w = 122, h = 39, a = 0, acc = 2},
			{time = 200 , y = 200-30, a = 255, acc = 2},
		}},
		{id = "rank_b", op = {203},timer = 11,loop = 200, dst = {
			{time = 0 , x = 468, y = 210-30, w = 122, h = 39, a = 0, acc = 2},
			{time = 200 , y = 200-30, a = 255, acc = 2},
		}},
		{id = "rank_c", op = {204},timer = 11,loop = 200, dst = {
			{time = 0 , x = 468, y = 210-30, w = 122, h = 39, a = 0, acc = 2},
			{time = 200 , y = 200-30, a = 255, acc = 2},
		}},
		{id = "rank_d", op = {205},timer = 11,loop = 200, dst = {
			{time = 0 , x = 468, y = 210-30, w = 122, h = 39, a = 0, acc = 2},
			{time = 200 , y = 200-30, a = 255, acc = 2},
		}},
		{id = "rank_e", op = {206},timer = 11,loop = 200, dst = {
			{time = 0 , x = 468, y = 210-30, w = 122, h = 39, a = 0, acc = 2},
			{time = 200 , y = 200-30, a = 255, acc = 2},
		}},
		{id = "rank_f", op = {207},timer = 11,loop = 200, dst = {
			{time = 0 , x = 468, y = 210-30, w = 122, h = 39, a = 0, acc = 2},
			{time = 200 , y = 200-30, a = 255, acc = 2},
		}},

		{id = "RANK_s_MAX", loop = 300 , op = {300}, dst = {
			{time = 100 , x= 470 , y = 155-30, w = 45, h = 19 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_s_AAA", loop = 300 , op = {301}, dst = {
			{time = 100 , x= 470 , y = 155-30, w = 45, h = 19 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_s_AA", loop = 300 , op = {302}, dst = {
			{time = 100 , x= 470 , y = 155-30, w = 45, h = 19 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_s_A", loop = 300 , op = {303}, dst = {
			{time = 100 , x= 470 , y = 155-30, w = 45, h = 19 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_s_B", loop = 300 , op = {304}, dst = {
			{time = 100 , x= 470 , y = 155-30, w = 45, h = 19 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_s_C", loop = 300 , op = {305}, dst = {
			{time = 100 , x= 470 , y = 155-30, w = 45, h = 19 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_s_D", loop = 300 , op = {306}, dst = {
			{time = 100 , x= 470 , y = 155-30, w = 45, h = 19 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_s_E", loop = 300 , op = {307}, dst = {
			{time = 100 , x= 470 , y = 155-30, w = 45, h = 19 , a = 0},
			{time = 300 , a = 255},
		}},
		--ランク差分-EXSCORE
		{id = "RANK_Diff_Exscore",draw = function()
		local Playcount = main_state.number(77)
		local Score = main_state.number(150)
		return Playcount > 0 or Score > 0
		end,
		dst = {
			{x = 516 , y = 155-30, w = 18, h = 18 , a = 255}
		}},
		{id = "scorerate_count", dst = {
			{x = 490, y = 138-30, w = 15, h = 14}
		}},
		{id = "scorerate_dot_count", dst = {
			{x = 545, y = 138-30, w = 15, h = 14}
		}},

		{id = "score", dst = {
			{x = 45, y = 234-30, w = 145, h = 22}
		}},
		{id = "misscount", dst = {
			{x = 45, y = 234-26*1-30, w = 145, h = 22}
		}},
		{id = "maxcombo", dst = {
			{x = 45, y = 234-26*2-30, w = 145, h = 22}
		}},
		{id = "playcount", dst = {
			{x = 45, y = 234-26*3-30, w = 145, h = 22}
		}},
		{id = "zero",draw = function()
		local Playcount = main_state.number(77)
		local Score = main_state.number(150)
		return Playcount < 0 or Score < 0
		end,
		dst = {
			{x = 203, y = 233-30, w = 104, h = 24}
		}},
		{id = "score_count", dst = {
			{x = 203, y = 233-30, w = 26, h = 24}
		}},
		{id = "score_max", dst = {
			{x = 338, y = 233-30, w = 26, h = 24}
		}},		

		{id = "zero",draw = function()
		local Playcount = main_state.number(77)
		local Score = main_state.number(150)
		return Playcount < 0 or Score < 0
		end,
		dst = {
			{x = 203, y = 207-30, w = 104, h = 24}
		}},
		{id = "miss_count", dst = {
			{x = 203, y = 207-30, w = 26, h = 24}
		}},
		{id = "combo_break", dst = {
			{x = 338, y = 207-30, w = 26, h = 24}
		}},

		{id = "zero",draw = function()
		local Playcount = main_state.number(77)
		local Score = main_state.number(150)
		return Playcount < 0 or Score < 0
		end,
		dst = {
			{x = 203, y = 181-30, w = 104, h = 24}
		}},
		{id = "zero",op = {1},dst = {
			{x = 338, y = 181-30, w = 104, h = 24}
		}},
		{id = "combo_count", dst = {
			{x = 203, y = 181-30, w = 26, h = 24}
		}},
		{id = "total_notes", dst = {
			{x = 338, y = 181-30, w = 26, h = 24}
		}},

		{id = "zero",draw = function()
		local Playcount = main_state.number(77)
		local Score = main_state.number(150)
		return Playcount < 0 or Score < 0
		end,
		dst = {
			{x = 203, y = 155-30, w = 104, h = 24}
		}},
		{id = "zero",draw = function()
		local Playcount = main_state.number(77)
		local Score = main_state.number(150)
		return Playcount < 0 or Score < 0
		end,
		dst = {
			{x = 338, y = 155-30, w = 104, h = 24}
		}},
		{id = "clear_count", dst = {
			{x = 203, y = 155-30, w = 26, h = 24}
		}},
		{id = "play_count", dst = {
			{x = 338, y = 155-30, w = 26, h = 24}
		}},

		{id = "clear", op = {2}, dst = {
			{x = 80, y = 312-30, w = 100, h = 18}
		}},
		{id = "clear", op = {3}, dst = {
			{x = 80, y = 312-30, w = 100, h = 18}
		}},

		{id = "score_graph_back", dst = {
			{x = 60, y = 126-30, w = 381, h = 16}
		}},
		{id = "score_graph", blend = 2, dst = {
			{time = 0,x = 60, y = 127-30, w = 381, h = 16, a = 60,acc = 2},
			{time = 310,a = 60,acc = 2},
			{time = 1210,a = 90,acc = 2},
		}},
		{id = "score_graph_frame", dst = {
			{x = 41, y = 119-30, w = 415, h = 30}
		}},
    --詳細スコア内訳
		{id = "playdata_window", op = {941} , dst = {
			{x = 614, y = 108-30, w = 281, h = 183}
		}},
		{id = "playdata_pgreat", filter = 1 , op = {941} ,  dst = {
			{x = 708, y = 243-30, w = 17, h = 17}
		}},
		{id = "playdata_great", filter = 1 , op = {941} ,  dst = {
			{x = 708, y = 243 -20*1-30, w = 17, h = 17}
		}},
		{id = "playdata_good", filter = 1 , op = {941} ,  dst = {
			{x = 708, y = 243 -20*2-30, w = 17, h = 17}
		}},
		{id = "playdata_bad", filter = 1 , op = {941} ,  dst = {
			{x = 708, y = 243 -20*3-30, w = 17, h = 17}
		}},
		{id = "playdata_poor", filter = 1 , op = {941} ,  dst = {
			{x = 708, y = 243 -20*4-30, w = 17, h = 17}
		}},
		{id = "playdata_fast", filter = 1 , op = {941} ,  dst = {
			{x = 708, y = 139-30, w = 17, h = 17}
		}},
		{id = "playdata_slow", filter = 1 , op = {941} ,  dst = {
			{x = 708, y = 139 -20*1-30, w = 17, h = 17}
		}},
		{id = "playdata_graph_pgreat" , op = {941} ,  dst = {
			{time = 0, x = 786, y = 247-30, w = 94, h = 10, a = 150},
			{time = 310, a = 150},
			{time = 1210, a = 210},
			{time = 1710, a = 150},
		}},
		{id = "playdata_graph_great" , op = {941} ,  dst = {
			{time = 0, x = 786, y = 247 - 20*1-30, w = 94, h = 10, a = 150},
			{time = 310, a = 150},
			{time = 1210, a = 210},
			{time = 1710, a = 150},
		}},
		{id = "playdata_graph_good" , op = {941} ,  dst = {
			{time = 0, x = 786, y = 247 - 20*2-30, w = 94, h = 10, a = 150},
			{time = 310, a = 150},
			{time = 1210, a = 210},
			{time = 1710, a = 150},
		}},
		{id = "playdata_graph_bad" , op = {941} ,  dst = {
			{time = 0, x = 786, y = 247 - 20*3-30, w = 94, h = 10, a = 150},
			{time = 310, a = 150},
			{time = 1210, a = 210},
			{time = 1710, a = 150},
		}},
		{id = "playdata_graph_poor" , op = {941} ,  dst = {
			{time = 0, x = 786, y = 247 - 20*4-30, w = 94, h = 10, a = 150},
			{time = 310, a = 150},
			{time = 1210, a = 210},
			{time = 1710, a = 150},
		}},
		{id = "playdata_graph_fast" , op = {941} ,  dst = {
			{time = 0, x = 786, y = 143-30, w = 94, h = 10, a = 150},
			{time = 310, a = 150},
			{time = 1210, a = 210},
			{time = 1710, a = 150},
		}},
		{id = "playdata_graph_slow" , op = {941} ,  dst = {
			{time = 0, x = 786, y = 143 - 20-30, w = 94, h = 10, a = 150},
			{time = 310, a = 150},
			{time = 1210, a = 210},
			{time = 1710, a = 150},
		}},
	--IR窓
		{id = "irdata_window", op = {2,931} , dst = {
			{x = 895 + iroffset, y = 108-30, w = 261, h = 183}
		}},
		{id = "irdata_window", op = {3,931} , dst = {
			{x = 895 + iroffset, y = 108-30, w = 261, h = 183}
		}},
		{id = "ex_ir1", loop = 200  ,filter = 1 , op = {931} ,  dst ={
			{time = 100 , x = 958 + iroffset, y = 244-30, w = 93, h = 14 , a = 0 },
			{time = 200 , a = 255},
		}},	
		{id = "ex_ir2", loop = 200  ,filter = 1 , op = {931} ,  dst ={
			{time = 100 , x = 958 + iroffset, y = 244 - 20*1-30, w = 93, h = 14 , a = 0 },
			{time = 200 , a = 255},
		}},	
		{id = "ex_ir3", loop = 200  ,filter = 1 , op = {931} ,  dst ={
			{time = 100 , x = 958 + iroffset, y = 244 - 20*2-30, w = 93, h = 14 , a = 0 },
			{time = 200 , a = 255},
		}},	
		{id = "ex_ir4", loop = 200  ,filter = 1 , op = {931} ,  dst ={
			{time = 100 , x = 958 + iroffset, y = 244 - 20*3-30, w = 93, h = 14 , a = 0 },
			{time = 200 , a = 255},
		}},	
		{id = "ex_ir5", loop = 200  ,filter = 1 , op = {931} ,  dst ={
			{time = 100 , x = 958 + iroffset, y = 244 - 20*4-30, w = 93, h = 14 , a = 0 },
			{time = 200 , a = 255},
		}},	
		{id = "ir_1", filter = 1 , op = {931} ,  dst = {
			{x = 1074 + iroffset, y = 243-30, w = 17, h = 17}
		}},
		{id = "ir_2", filter = 1 , op = {931} ,  dst = {
			{x = 1074 + iroffset, y = 243 -20*1-30, w = 17, h = 17}
		}},
		{id = "ir_3", filter = 1 , op = {931} ,  dst = {
			{x = 1074 + iroffset, y = 243 -20*2-30, w = 17, h = 17}
		}},
		{id = "ir_4", filter = 1 , op = {931} ,  dst = {
			{x = 1074 + iroffset, y = 243 -20*3-30, w = 17, h = 17}
		}},
		{id = "ir_5", filter = 1 , op = {931} ,  dst = {
			{x = 1074 + iroffset, y = 243 -20*4-30, w = 17, h = 17}
		}},
		{id = "ir_rank", filter = 1 , op = {931} ,  dst = {
			{x = 995 + iroffset, y = 139-30 , w = 17, h = 17}
		}},
		{id = "ir_ranktotal", filter = 1 , op = {931} ,  dst = {
			{x = 1074 + iroffset, y = 139-30 , w = 17, h = 17}
		}},
		{id = "ir_clearrate1", filter = 1 , op = {931} ,  dst = {
			{x = 1039 + iroffset, y = 119-30 , w = 17, h = 17}
		}},
		{id = "ir_clearrate2", filter = 1 , op = {931} ,  dst = {
			{x = 1095 + iroffset, y = 119-30 , w = 17, h = 17}
		}},
		{id = "irwait", loop = 200 ,op = {606,2,931} , dst = {
			{time = 0 , x = 904 + iroffset, y = 116-30, w = 244, h = 148, a = 0},
			{time = 200 , a = 255},
		}},   
		{id = "irwait", loop = 200 ,op = {606,3,931} , dst = {
			{time = 0 , x = 904 + iroffset, y = 116-30, w = 244, h = 148, a = 0},
			{time = 200 , a = 255},
		}},  

	--曲名表示部分
		{id = "select_folder", op = {1} , timer = 11 , loop = 200 , dst = {
			{time = 0 ,x = 438, y = 781-80, w = 176, h = 26 , a = 0, acc = 2 },
			{time = 200 , x = 448, a = 255, acc = 2 },
		}},
		{id = "songs_font", op = {1}, timer = 11 , loop = 200 , dst = {
			{x = 436, y = 645-80, w = 158, h = 26 , a = 0, acc = 2 },
			{time = 200 , x = 446, a = 255, acc = 2 },
		}},
		{id = "songs_count", op = {1}, timer = 11 , loop = 200 , dst = {
			{x = 619, y = 646-80, w = 26, h = 24 , a = 0, acc = 2 },
			{time = 200 , x = 629, a = 255, acc = 2 },
		}},
		{id = "dir",filter = 1 , timer = 11 , loop = 200 , acc = 2 , op = {1}, dst = {
			{time = 0 , x = 451, y = 844-80, w = 640, h = 24 , a = 0, acc = 2 },
			{time = 200 , x = 451, y = 834-80, w = 640, h = 24 , a = 255, acc = 2 },
		}},
		{id = "genre",filter = 1 , timer = 11 , loop = 200 , acc = 2 , op = {1}, dst = {
			{time = 0 , x = 441, y = 787-80, w = 640, h = 20 , a = 0, acc = 2 },
			{time = 200 , x = 451, y = 787-80, w = 640, h = 20 , a = 255, acc = 2 },
		}},
		{id = "title", filter = 1 , timer = 11 , loop = 200 , acc = 2 , op = {1}, dst = {
			{time = 0 , x = 441, y = 742-80, w = 640, h = 24 , a = 0, acc = 2 },
			{time = 200 , x = 451, y = 742-80, w = 640, h = 24 , a = 255, acc = 2 },
		}},
		{id = "subtitle", filter = 1 , timer = 11 , loop = 200 , acc = 2 , op = {1}, dst = {
			{time = 0 , x = 441, y = 685-80, w = 640, h = 24 , a = 0, acc = 2 },
			{time = 200 , x = 451, y = 685-80, w = 640, h = 24 , a = 255, acc = 2 },
		}},
		{id = "artist", filter = 1 , timer = 11 , loop = 200 , acc = 2 , op = {1},  dst = {
			{time = 0 , x = 441, y = 649-80, w = 640, h = 20 , a = 0, acc = 2 },
			{time = 200 , x = 451, y = 649-80, w = 640, h = 20 , a = 255, acc = 2 },
		}},
		{id = "song_flash", blend = 2 , timer = 11 , loop = -1 , op = {1},  dst = {
			{time = 0 , x = 0, y = 288 + 240, w = 2220, h = 246 , a = 230},
			{time = 300 , x = -1500, y = 419 + 240, w = 6700, h = 0 , a = 0},
		}},
		--楽曲選択時

		{id = "dir",filter = 1 , timer = 11 , loop = 200 , acc = 2 , op = {2}, dst = {
			{time = 0 , x = 451, y = 844, w = 640, h = 24 , a = 0, acc = 2 },
			{time = 200 , x = 451, y = 834, w = 640, h = 24 , a = 255, acc = 2 },
		}},
		{id = "genre",filter = 1 , timer = 11 , loop = 200 , acc = 2 , op = {2}, dst = {
			{time = 0 , x = 441, y = 787, w = 640, h = 20 , a = 0, acc = 2 },
			{time = 200 , x = 451, y = 787, w = 640, h = 20 , a = 255, acc = 2 },
		}},
		{id = "title", filter = 1 , timer = 11 , loop = 200 , acc = 2 , op = {2}, dst = {
			{time = 0 , x = 441, y = 742, w = 640, h = 24 , a = 0, acc = 2 },
			{time = 200 , x = 451, y = 742, w = 640, h = 24 , a = 255, acc = 2 },
		}},
		{id = "subtitle", filter = 1 , timer = 11 , loop = 200 , acc = 2 , op = {2}, dst = {
			{time = 0 , x = 441, y = 685, w = 640, h = 24 , a = 0, acc = 2 },
			{time = 200 , x = 451, y = 685, w = 640, h = 24 , a = 255, acc = 2 },
		}},
		{id = "artist", filter = 1 , timer = 11 , loop = 200 , acc = 2 , op = {2},  dst = {
			{time = 0 , x = 441, y = 649, w = 640, h = 20 , a = 0, acc = 2 },
			{time = 200 , x = 451, y = 649, w = 640, h = 20 , a = 255, acc = 2 },
		}},
		{id = "song_flash", blend = 2 , timer = 11 , loop = -1 , op = {2},  dst = {
			{time = 0 , x = 0, y = 288 + 320, w = 2220, h = 246 , a = 230},
			{time = 300 , x = -1500, y = 419 + 320, w = 6700, h = 0 , a = 0},
		}},



		--BPM
		{id = "bpm", op = {2}, dst = {
			{x = 741, y = 589, w = 118, h = 28}
		}},
		{id = "bpm_bar", op = {2}, dst = {
			{x = 577, y = 597, w = 23, h = 10}
		}},
		{id = "minbpm",op = {2}, dst = {
			{x = 447, y = 589, w = 39, h = 28}
		}},
		{id = "maxbpm",op = {2}, dst = {
			{x = 611, y = 589, w = 39, h = 28}
		}},
		--仕切り
		{ id = "line", filter = 1 , dst = {
		{ x = 424, y = 405, w = 2, h = 453 }
		}},

	--BMSデータ
		{ id = "bms_info", dst = {
		{ x = 30, y = 405, w = 384, h = 453 }
		}},
		--BMS側モード
		{id = "5keys_info", op = {161}, dst = {
			{x = 30, y = 801, w = 384, h = 57}
		}},
		{id = "7keys_info", op = {160}, dst = {
			{x = 30, y = 801, w = 384, h = 57}
		}},
		{id = "10keys_info", op = {163}, dst = {
			{x = 30, y = 801, w = 384, h = 57}
		}},
		{id = "14keys_info", op = {162}, dst = {
			{x = 30, y = 801, w = 384, h = 57}
		}},
		{id = "9keys_info", op = {164}, dst = {
			{x = 30, y = 801, w = 384, h = 57}
		}},
		{id = "24keys_info", op = {1160}, dst = {
			{x = 30, y = 801, w = 384, h = 57}
		}},
		{id = "24keysDP_info", op = {1161}, dst = {
			{x = 30, y = 801, w = 384, h = 57}
		}},
		--STAGEFILEあり
		{ id = -110, op = {191}, dst = {
		{ x = 30, y = 513, w = 384, h = 288 }
		}},
		{ id = -100, op = {191}, dst = {
		{ x = 30, y = 513, w = 384, h = 288 }
		}},
		--BMSデータ数値とか
		{id = "bms_data_detail", op = {2}, dst = {
			{x = 221, y = 411, w = 80, h = 68}
		}},
		{id = "time_dot", op = {2}, dst = {
			{x = 357, y = 461, w = 9, h = 14}
		}},
		--BMSデータ数値		
		{id = "bms_time_m", filter = 1 , op = {2}, dst = {
			{x = 320, y = 459, w = 18, h = 18}
		}},
		{id = "bms_time_s", filter = 1 , op = {2}, dst = {
			{x = 367, y = 459, w = 18, h = 18}
		}},
		{id = "bms_total", filter = 1 , op = {2}, dst = {
			{x = 331, y = 436, w = 18, h = 18}
		}},		
		{id = "bms_notes", filter = 1 , op = {2}, dst = {
			{x = 331, y = 413, w = 18, h = 18}
		}},		
		--判定
		{id = "jud_veasy", op = {2,184}, dst = {
			{x = 223, y = 485, w = 78, h = 22}
		}},
		{id = "jud_easy", op = {2,183}, dst = {
			{x = 223, y = 485, w = 78, h = 22}
		}},
		{id = "jud_normal", op = {2,182}, dst = {
			{x = 223, y = 485, w = 78, h = 22}
		}},
		{id = "jud_hard", op = {2,181}, dst = {
			{x = 223, y = 485, w = 78, h = 22}
		}},
		{id = "jud_vhard", op = {2,180}, dst = {
			{x = 223, y = 485, w = 78, h = 22}
		}},
		--BGAとテキスト
		{id = "bga_ico", op = {2,170}, dst = {
			{x = 305, y = 485, w = 44, h = 22, a = 60}
		}},
		{id = "bga_ico", op = {2,171}, dst = {
			{x = 305, y = 485, w = 44, h = 22, a = 230}
		}},		
		{id = "txt_ico", op = {2,174}, dst = {
			{x = 353, y = 485, w = 50, h = 22, a = 60}
		}},
		{id = "txt_ico", op = {2,175}, dst = {
			{x = 353, y = 485, w = 50, h = 22, a = 230}
		}},

		--オートプレイとかのスイッチ
		{id = "play", op = {2}, dst = {
			{x = 200, y = 312, w = 100, h = 18, a = 180}
		}},
		{id = "play", op = {3}, dst = {
			{x = 200, y = 312, w = 100, h = 18, a = 180}
		}},
		{id = "button_play_off", dst = {
			{x = 40, y = 472, w = 48, h = 35, a = 70}
		}},
		{id = "button_play", op = {2}, dst = {
			{x = 40, y = 472, w = 48, h = 35, a = 180}
		}},
		{id = "button_play", op = {3}, dst = {
			{x = 40, y = 472, w = 48, h = 35, a = 1805}
		}},
		{id = "button_practice_off", dst = {
			{x = 96, y = 472, w = 48, h = 35, a = 70}
		}},
		{id = "button_practice", op = {2}, dst = {
			{x = 96, y = 472, w = 48, h = 35, a = 180}
		}},
		{id = "button_autoplay_off", dst = {
			{x = 153, y = 472, w = 48, h = 35, a = 70}
		}},
		{id = "button_autoplay", op = {2}, dst = {
			{x = 153, y = 472, w = 48, h = 35, a = 180}
		}},
		{id = "button_autoplay", op = {3}, dst = {
			{x = 153, y = 472, w = 48, h = 35, a = 180}
		}},
		--リプレイ		
		{id = "button_replay", dst = {
			{time = 0, x = 56, y = 424, w = 25, h = 29, a = 75}
		}},
		{id = "button_replay", op = {1205}, dst = {
			{time = 0, x = 56, y = 424, w = 25, h = 29, a = 255},
			{time = 150, a = 0},
			{time = 300, a = 255},
		}},
		{id = "button_replay", op = {197,-1205}, dst = {
			{time = 0, x = 56, y = 424, w = 25, h = 29}
		}},
		{id = "button_replay2", dst = {
			{time = 0, x = 91, y = 424, w = 25, h = 29, a = 75}
		}},
		{id = "button_replay2", op = {1206}, dst = {
			{time = 0, x = 91, y = 424, w = 25, h = 29, a = 255},
			{time = 150, a = 0},
			{time = 300, a = 255},
		}},
			{id = "button_replay2", op = {1197,-1206}, dst = {
			{x = 91, y = 424, w = 25, h = 29}
		}},
		{id = "button_replay3", dst = {
			{time = 0, x = 126, y = 424, w = 25, h = 29, a = 75}
		}},		
		{id = "button_replay3", op = {1207}, dst = {
			{time = 0, x = 126, y = 424, w = 25, h = 29, a = 255},
			{time = 150, a = 0},
			{time = 300, a = 255},
		}},
			{id = "button_replay3", op = {1200,-1207}, dst = {
			{x = 126, y = 424, w = 25, h = 29}
		}},
		{id = "button_replay4", dst = {
			{time = 0, x = 161, y = 424, w = 25, h = 29, a = 75}
		}},		
		{id = "button_replay4", op = {1208}, dst = {
			{time = 0, x = 161, y = 424, w = 25, h = 29, a = 255},
			{time = 150, a = 0},
			{time = 300, a = 255},
		}},
			{id = "button_replay4", op = {1203,-1208}, dst = {
			{x = 161, y = 424, w = 25, h = 29}
		}},

	--パターン情報ゾーン
		{ id = "pattern_info", op = {2}, dst = {
		{ x = 441, y = 405, w = 620, h = 165}
		}},
		--左数値
		{ id = "mainbpm", filter = 1 , op = {2}, dst = {
		{ x = 553, y = 530, w = 13, h = 15}
		}},
		{ id = "totalnote_count", filter = 1 , op = {2}, dst = {
		{ x = 540, y = 506, w = 13, h = 15}
		}},
		{ id = "peak_density", filter = 1 , op = {2}, dst = {
		{ x = 553, y = 462, w = 13, h = 15}
		}},
		{ id = "end_density", filter = 1 , op = {2}, dst = {
		{ x = 553, y = 438, w = 13, h = 15}
		}},
		{ id = "ave_density", filter = 1 , op = {2}, dst = {
		{ x = 553, y = 414, w = 13, h = 15}
		}},
		--右数値
		{ id = "note_count", filter = 1 , op = {2}, dst = {
		{ x = 618, y = 414, w = 15, h = 15}
		}},
		{ id = "long_count", filter = 1 , op = {2}, dst = {
		{ x = 709, y = 414, w = 15, h = 15}
		}},
		{ id = "scratch_count", filter = 1 , op = {2}, dst = {
		{ x = 800, y = 414, w = 15, h = 15}
		}},
		{ id = "bbs_count", filter = 1 , op = {2}, dst = {
		{ x = 891, y = 414, w = 15, h = 15}
		}},
		{ id = "mines_count", filter = 1 , op = {2}, dst = {
		{ x = 982, y = 414, w = 15, h = 15}
		}},
		--グラフ
		{id = "notes-graph", op = {2}, dst = {
			{x = 606, y = 458, w = 448, h = 106 , a = 200 }
		}},
		{id = "bpmgraph", op = {177,-1177,2}, dst = {
			{x = 606, y = 458, w = 448, h = 106 , a = 200 }
		}},
		{id = "bpmgraph", op = {1177,2}, dst = {
			{x = 606, y = 458, w = 448, h = 106 , a = 200 }
		}},



		--フレーム
		{id = "upper", dst = {
		{x = 25, y = 995, w = 1811, h = 85}
		}},
		{ id = "under_frame", dst = {
		{ x = 0, y = 0, w = 1920, h = 71 }
		}},

		--ソート関連
		{id = "modeset", dst = {
			{x = 1364, y = 964, w = 158, h = 40}
		}},
		{id = "sortset", dst = {
			{x = 1538, y = 964, w = 158, h = 40}
		}},
		{id = "lnmodeset", dst = {
			{x = 1711, y = 964, w = 158, h = 40}
		}},

		{id = "search_window", dst = {
			{x = 1364, y = 1009, w = 332, h = 47}
		}},
		{id = "search_ico", dst = {
			{x = 1308, y = 1009,  w = 47, h = 47}
		}},

		{id = "sort_ico", dst = {
			{x = 1308, y = 964, w = 47, h = 40}
		}},
		{id = "search",time = 550 , dst = {
			{time = 400 ,x = 1378, y = 1023, w = 318, h = 20, a = 0},
			{time = 550 ,a = 255},
		}},

		{id = "skin_select", dst = {
			{x = 1821, y = 1009,  w = 47, h = 47}
		}},
		{id = "keyconfig", dst = {
			{x = 1767, y = 1009,  w = 47, h = 47}
		}},
		{id = "text_button", dst = {
			{x = 1712, y = 1009,  w = 47, h = 47}
		}},

		--ライバル窓
		{id = "rivalwindow", op = {625} ,dst = {
			{x = 1308, y = 928, w = 561, h = 32}
		}},
		{id = "rivalname", op = {625} ,dst = {
			{x = 1670, y = 937, w = 250, h = 14, a = 240}
		}},




		--ここからオプション
		{id = -110, loop = 200, op = {21}, timer = 21, dst = {
			{time = 0, x = 0, y = 0, w = 1920, h = 1080, a = 0},
			{time = 200, a = 160},
		}},
		{id = "option-panel1", loop = 200, op = {21}, timer = 21,  dst = {
			{time = 0, x = 494, y = 115, w = 932, h = 903, a = 0},
			{time = 200, a = 255},
		}},
		{id = "option-subpanel1", loop = 200, op = {21}, timer = 21,  dst = {
			{time = 0, x = 116, y = 115, w = 360, h = 903, a = 0},
			{time = 200, a = 255},
		}},
		{id = "option-subcursor", loop = 200, op = {21}, timer = 21,  dst = {
			{time = 0, x = 60, y = 629, w = 416, h = 50, a = 0},
			{time = 200, a = 255},
		}},
		{id = "option-subcursor2", loop = 200, blend = 2 , op = {21}, timer = 21,  dst = {
			{time = 0, x = 60, y = 629, w = 416, h = 50, a = 0},
			{time = 200, a = 50},
			{time = 1200, a = 0},
			{time = 2200, a = 50},
		}},		
		{id = "option-key1", loop = 200, op = {21}, timer = 21,  dst = {
			{time = 0, x = 792, y = 663, w = 318, h = 225, a = 0},
			{time = 200, a = 255},
		}},

		{id = "assist_caution", loop = 200, op = {21,60}, timer = 21,  dst = {
			{time = 0, x = 501, y = 909, w = 659, h = 42, a = 0},
			{time = 200, a = 255},
		}},


		{id = "option-terget", loop = 200, op = {21}, timer = 21,  dst = {
			{time = 0, x = 107, y = 429, w = 363, h = 450, a = 0},
			{time = 200, a = 255},
		}},

		--オプション種類
		{id = "option-detail1", loop = 200, op = {21}, timer = 21,  dst = {
			{time = 0, x = 516, y = 137, w = 209, h = 496, a = 0},
			{time = 200, a = 255},
		}},
		{id = "option-detail2", loop = 200, op = {21}, timer = 21,  dst = {
			{time = 0, x = 737, y = 305, w = 209, h = 328, a = 0},
			{time = 200, a = 255},
		}},
		{id = "option-detail3", loop = 200, op = {21}, timer = 21,  dst = {
			{time = 0, x = 958, y = 347, w = 209, h = 286, a = 0},
			{time = 200, a = 255},
		}},
		{id = "option-detail4", loop = 200, op = {21}, timer = 21,  dst = {
			{time = 0, x = 1179, y = 137, w = 209, h = 496, a = 0},
			{time = 200, a = 255},
		}},
		{id = "option-detail5", loop = 200, op = {21}, timer = 21,  dst = {
			{time = 0, x = 1179, y = 659, w = 209, h = 244, a = 0},
			{time = 200, a = 255},
		}},
		--オプションカーソル
		{id = "option-random", loop = 200, blend = 2 , op = {21}, timer = 21, dst = {
			{time = 0, x = 534, y = 154, w = 175, h = 415, a = 0},
			{time = 200, a = 255},
			{time = 1200, a = 170},
			{time = 2200, a = 255},
		}},
		{id = "option-gauge", loop = 200, blend = 2 , op = {21}, timer = 21, dst = {
			{time = 0, x = 755, y = 322, w = 175, h = 247, a = 0},
			{time = 200, a = 255},
			{time = 1200, a = 170},
			{time = 2200, a = 255},
		}},
		{id = "option-hsfix", loop = 200, blend = 2 , op = {21}, timer = 21, dst = {
			{time = 0, x = 976, y = 364, w = 175, h = 205, a = 0},
			{time = 200, a = 255},
			{time = 1200, a = 170},
			{time = 2200, a = 255},
		}},
		{id = "option-random2", loop = 200, blend = 2 , op = {21}, timer = 21, dst = {
			{time = 0, x = 1197, y = 154, w = 175, h = 415, a = 0},
			{time = 200, a = 255},
			{time = 1200, a = 170},
			{time = 2200, a = 255},
		}},
		{id = "option-dp", loop = 200, blend = 2 , op = {21}, timer = 21, dst = {
			{time = 0, x = 1197, y = 676, w = 175, h = 163, a = 0},
			{time = 200, a = 255},
			{time = 1200, a = 170},
			{time = 2200, a = 255},
		}},

		--ここからアシスト
		{id = -110, loop = 200, op = {22}, timer = 22, dst = {
			{time = 0, x = 0, y = 0, w = 1920, h = 1080, a = 0},
			{time = 200, a = 160},
		}},
		{id = "assist-panel1", loop = 200, op = {22}, timer = 22,  dst = {
			{time = 0, x = 494, y = 115, w = 932, h = 903, a = 0},
			{time = 200, a = 255},
		}},
		{id = "assist-key1", loop = 200, op = {22}, timer = 22,  dst = {
			{time = 0, x = 792, y = 407, w = 318, h = 225, a = 0},
			{time = 200, a = 255},
		}},
		--オプション種類
		{id = "assist-detail1", loop = 200, op = {22}, timer = 22,  dst = {
			{time = 0, x = 566, y = 674, w = 209, h = 198, a = 0},
			{time = 200, a = 255},
		}},
		{id = "assist-detail2", loop = 200, op = {22}, timer = 22,  dst = {
			{time = 0, x = 847, y = 674, w = 209, h = 198, a = 0},
			{time = 200, a = 255},
		}},
		{id = "assist-detail3", loop = 200, op = {22}, timer = 22,  dst = {
			{time = 0, x = 1144, y = 674, w = 209, h = 198, a = 0},
			{time = 200, a = 255},
		}},
		{id = "assist-detail4", loop = 200, op = {22}, timer = 22,  dst = {
			{time = 0, x = 519, y = 164, w = 209, h = 198, a = 0},
			{time = 200, a = 255},
		}},
		{id = "assist-detail5", loop = 200, op = {22}, timer = 22,  dst = {
			{time = 0, x = 743, y = 164, w = 209, h = 198, a = 0},
			{time = 200, a = 255},
		}},
		{id = "assist-detail6", loop = 200, op = {22}, timer = 22,  dst = {
			{time = 0, x = 967, y = 164, w = 209, h = 198, a = 0},
			{time = 200, a = 255},
		}},
		{id = "assist-detail7", loop = 200, op = {22}, timer = 22,  dst = {
			{time = 0, x = 1191, y = 164, w = 209, h = 198, a = 0},
			{time = 200, a = 255},
		}},

		{id = "option-constant", loop = 200, blend = 2 , op = {22}, timer = 22, dst = {
			{x = 584, y = 691, w = 175, h = 79, a = 0},
			{time = 200, a = 255},
			{time = 1200, a = 170},
			{time = 2200, a = 255},
		}},
		{id = "option-legacy", loop = 200, blend = 2 , op = {22}, timer = 22, dst = {
			{x = 865, y = 691, w = 175, h = 79, a = 0},
			{time = 200, a = 255},
			{time = 1200, a = 170},
			{time = 2200, a = 255},
		}},		
		{id = "option-bpmguide", loop = 200, blend = 2 , op = {22}, timer = 22, dst = {
			{x = 1162, y = 691, w = 175, h = 79, a = 0},
			{time = 200, a = 255},
			{time = 1200, a = 170},
			{time = 2200, a = 255},
		}},
		{id = "option-exjudge", loop = 200, blend = 2 , op = {22}, timer = 22, dst = {
			{x = 537, y = 181, w = 175, h = 79, a = 0},
			{time = 200, a = 255},
			{time = 1200, a = 170},
			{time = 2200, a = 255},
		}},
		{id = "option-judgearea", loop = 200, blend = 2 , op = {22}, timer = 22, dst = {
			{x = 761, y = 181, w = 175, h = 79, a = 0},
			{time = 200, a = 255},
			{time = 1200, a = 170},
			{time = 2200, a = 255},
		}},
		{id = "option-marknote", loop = 200, blend = 2 , op = {22}, timer = 22, dst = {
			{x = 985, y = 181, w = 175, h = 79, a = 0},
			{time = 200, a = 255},
			{time = 1200, a = 170},
			{time = 2200, a = 255},
		}},
		{id = "option-nomine", loop = 200, blend = 2 , op = {22}, timer = 22, dst = {
			{x = 1209, y = 181, w = 175, h = 79 , a = 0},
			{time = 200, a = 255},
			{time = 1200, a = 170},
			{time = 2200, a = 255},
		}},


		--ここからサブオプション
		{id = -110, loop = 200, op = {23}, timer = 23, dst = {
			{time = 0, x = 0, y = 0, w = 1920, h = 1080, a = 0},
			{time = 200, a = 160},
		}},
		{id = "subop-panel1", loop = 200, op = {23}, timer = 23, dst = {
			{time = 0, x = 494, y = 115, w = 932, h = 903, a = 0},
			{time = 200, a = 255},
		}},
		{id = "subop-subpanel1", loop = 200, op = {23}, timer = 23,  dst = {
			{time = 0, x = 116, y = 115, w = 360, h = 903, a = 0},
			{time = 200, a = 255},
		}},	
		{id = "subop-subdetail", loop = 200, op = {23}, timer = 23,  dst = {
			{time = 0, x = 125, y = 612, w = 159, h = 262, a = 0},
			{time = 200, a = 255},
		}},		
		{id = "subop-key1", loop = 200, op = {23}, timer = 23, dst = {
			{time = 0, x = 792, y = 407, w = 318, h = 225, a = 0},
			{time = 200, a = 255},
		}},
		--サブオプション種類

		--サブオプション_音量

		{id = "master_num", loop = 200, op = {23}, timer = 23,  dst = {
			{x = 428, y = 469, w = 9, h = 12, a = 0},
			{time = 200, a = 200},
		}},
		{id = "key_num", loop = 200, op = {23}, timer = 23,  dst = {
			{x = 428, y = 469-103, w = 9, h = 12, a = 0},
			{time = 200, a = 200},
		}},
		{id = "bg_num", loop = 200, op = {23}, timer = 23,  dst = {
			{x = 428, y = 469-51, w = 9, h = 12, a = 0},
			{time = 200, a = 200},
		}},


		{id = "subop-slider", loop = 200, op = {23}, timer = 23,  dst = {
			{time = 0, x = 232, y = 473, w = 176, h = 2, a = 0},
			{time = 200, a = 60},
		}},
		{id = "master_g_slider", loop = 200, op = {23}, timer = 23,  dst = {
			{time = 0, x = 232, y = 473, w = 176, h = 2, a = 0},
			{time = 200, a = 150},
		}},
		{id = "master_slider", loop = 200, op = {23}, timer = 23,  dst = {
			{time = 0, x = 212, y = 458, w = 31, h = 31, a = 0},
			{time = 200, a = 255},
		}},
		{id = "subop-slider", loop = 200, op = {23}, timer = 23,  dst = {
			{time = 0, x = 232, y = 473-51, w = 176, h = 2, a = 0},
			{time = 200, a = 60},
		}},
		{id = "key_g_slider", loop = 200, op = {23}, timer = 23,  dst = {
			{time = 0, x = 232, y = 473-51, w = 176, h = 2, a = 0},
			{time = 200, a = 150},
		}},
		{id = "key_slider", loop = 200, op = {23}, timer = 23,  dst = {
			{time = 0, x = 212, y = 458-51, w = 31, h = 31, a = 0},
			{time = 200, a = 255},
		}},
		{id = "subop-slider", loop = 200, op = {23}, timer = 23,  dst = {
			{time = 0, x = 232, y = 473-103, w = 176, h = 2, a = 0},
			{time = 200, a = 60},			
		}},
		{id = "bg_g_slider", loop = 200, op = {23}, timer = 23,  dst = {
			{time = 0, x = 232, y = 473-103, w = 176, h = 2, a = 0},
			{time = 200, a = 150},
		}},
		{id = "bg_slider", loop = 200, op = {23}, timer = 23,  dst = {
			{time = 0, x = 212, y = 458-103, w = 31, h = 31, a = 0},
			{time = 200, a = 255},			
		}},


		{id = "subop-subdetail1", loop = 200, op = {23}, timer = 23,  dst = {
			{time = 0, x = 291, y = 837, w = 179, h = 37, a = 0},
			{time = 200, a = 255},
		}},
		{id = "subop-rect", blend = 2 , op = {23}, timer = 23,  dst = {
		{x = 291, y = 837, w = 179, h = 37}}, 
		mouseRect = {x = 0, y = 0, w = 179, h = 37}},	

		{id = "subop-subdetail2", loop = 200, op = {23}, timer = 23,  dst = {
			{time = 0, x = 291, y = 792, w = 179, h = 37, a = 0},
			{time = 200, a = 255},
		}},
		{id = "subop-rect", blend = 2 , op = {23}, timer = 23,  dst = {
		{x = 291, y = 792, w = 179, h = 37}}, 
		mouseRect = {x = 0, y = 0, w = 179, h = 37}},	

		{id = "subop-subdetail3", loop = 200, op = {23}, timer = 23,  dst = {
			{time = 0, x = 291, y = 747, w = 179, h = 37, a = 0},
			{time = 200, a = 255},
		}},	
		{id = "subop-rect", blend = 2 , op = {23}, timer = 23,  dst = {
		{x = 291, y = 747, w = 179, h = 37}}, 
		mouseRect = {x = 0, y = 0, w = 179, h = 37}},	

		{id = "subop-subdetail4", loop = 200, op = {23}, timer = 23,  dst = {
			{time = 0, x = 291, y = 702, w = 179, h = 37, a = 0},
			{time = 200, a = 255},
		}},	
		{id = "subop-rect", blend = 2 , op = {23}, timer = 23,  dst = {
		{x = 291, y = 702, w = 179, h = 37}}, 
		mouseRect = {x = 0, y = 0, w = 179, h = 37}},	

		{id = "subop-subdetail5", loop = 200, op = {23}, timer = 23,  dst = {
			{time = 0, x = 291, y = 657, w = 179, h = 37, a = 0},
			{time = 200, a = 255},
		}},	
		{id = "subop-rect", blend = 2 , op = {23}, timer = 23,  dst = {
		{x = 291, y = 657, w = 179, h = 37}}, 
		mouseRect = {x = 0, y = 0, w = 179, h = 37}},	

		{id = "subop-subdetail6", loop = 200, op = {23}, timer = 23,  dst = {
			{time = 0, x = 291, y = 612, w = 179, h = 37, a = 0},
			{time = 200, a = 255},
		}},	
		{id = "subop-rect", blend = 2 , op = {23}, timer = 23,  dst = {
		{x = 291, y = 612, w = 179, h = 37}}, 
		mouseRect = {x = 0, y = 0, w = 179, h = 37}},		



		--オプション種類
		{id = "subop-detail1", loop = 200, op = {23}, timer = 23, dst = {
			{time = 0, x = 566, y = 523, w = 209, h = 349, a = 0},
			{time = 200, a = 255},
		}},
		{id = "subop-detail2", loop = 200, op = {23}, timer = 23, dst = {
			{time = 0, x = 847, y = 674, w = 506, h = 198, a = 0},
			{time = 200, a = 255},
		}},
		{id = "subop-detail3", loop = 200, op = {23}, timer = 23, dst = {
			{time = 0, x = 519, y = 160, w = 209, h = 202, a = 0},
			{time = 200, a = 255},
		}},
		{id = "subop-detail4", loop = 200, op = {23}, timer = 23, dst = {
			{time = 0, x = 743, y = 164, w = 209, h = 198, a = 0},
			{time = 200, a = 255},
		}},
		{id = "subop-detail5", loop = 200, op = {23}, timer = 23, dst = {
			{time = 0, x = 967, y = 164, w = 433, h = 198, a = 0},
			{time = 200, a = 255},
		}},

		{id = "option-gasinfo", loop = 200, op = {23}, timer = 23,  dst = {
			{x = 568, y = 745, w = 205, h = 70, a = 0},
			{time = 200, a = 255},
		}},		
		{id = "option-gas", loop = 200, blend = 2 , op = {23}, timer = 23,  dst = {
			{x = 584, y = 540, w = 175, h = 205, a = 0},
			{time = 200, a = 255},
			{time = 1200, a = 170},
			{time = 2200, a = 255},
		}},		
		{id = "option-bga", loop = 200, blend = 2 , op = {23}, timer = 23,  dst = {
			{x = 537, y = 135, w = 175, h = 163, a = 0},
			{time = 200, a = 255},
			{time = 1200, a = 170},
			{time = 2200, a = 255},
		}},
		{id = "option-adjust", loop = 200, blend = 2 , op = {23}, timer = 23,  dst = {
			{x = 761, y = 181, w = 175, h = 79, a = 0},
			{time = 200, a = 255},
			{time = 1200, a = 170},
			{time = 2200, a = 255},
		}},
		{id = "green_num", loop = 200, op = {23}, timer = 23,  dst = {
			{x = 1175, y = 704, w = 9, h = 12, a = 0},
			{time = 200, a = 255},
		}},
		{id = "duration", loop = 200, op = {23}, timer = 23,  dst = {
			{x = 1175, y = 746, w = 9, h = 12, a = 0},
			{time = 200, a = 255},
		}},
		{id = "judgetiming", loop = 200, op = {23}, timer = 23,  dst = {
			{x = 1257, y = 200, w = 9, h = 12, a = 0},
			{time = 200, a = 255},
		}},


		{id = "time_dot",dst = {
			{x = 1844, y = 0, w = 9, h = 14}
		}},
		{id = "time_dot", dst = {
			{x = 1880, y = 0, w = 9, h = 14}
		}},		
		{id = "day_bar",filter = 1, dst = {
			{x = 1757, y = 1, w = 10, h = 13}
		}},		
		{id = "time_year", dst = {{x = 1028+640, y = 0, w = 13, h = 15}}},
		{id = "time_month", dst = {{x = 1088+640, y = 0, w = 13, h = 15}}},
		{id = "time_day", dst = {{x = 1130+640, y = 0, w = 13, h = 15}}},
		{id = "time_hour", dst = {{x = 1178+640, y = 0, w = 13, h = 15}}},
		{id = "time_minute", dst = {{x = 1214+640, y = 0, w = 13, h = 15}}},
		{id = "time_second", dst = {{x = 1250+640, y = 0, w = 13, h = 15}}},

		{id = "irname", op = {51} ,dst = {
			{x = 8, y = 0, w = 250, h = 14,a = 160}
		}},

		{id = -110, loop = -1, op = {911}, dst = {
			{time = 0, x = 0, y = 0, w = 1920, h = 1080, a = 255, acc = 2},
			{time = 400, a = 0, acc = 2},
		}},

		{id = "shutter", loop = 800, op = {910},dst = {
			{time = 0 ,x = 0, y = 0, w = 1920, h = 1080},
			{time = 790 },
			{time = 800 , a = 0},
		}},
    }

	local function createTarget()
		local baseX = 110
		local baseY = 640
		for i = 205, 209 do
			table.insert(skin.text, { id = "target" .. i, font = 13, size = 12, overflow = 1, ref = i })
			table.insert(skin.destination, { id = "target" .. i, op = { 21 }, timer = 21, dst = {
				{ x = baseX + 30, y = baseY - 7 + (i - 209 - 1) * 40, w = 150, h = 20 , a = 160 },
			} })
		end
		for i = 210, 214 do
			table.insert(skin.text, { id = "target" .. i, font = 13, size = 12, overflow = 1, ref = i })
			table.insert(skin.destination, { id = "target" .. i, op = { 21 }, timer = 21, dst = {
				{ x = baseX + 30, y = baseY + 6 + (i - 210 + 1) * 40, w = 150, h = 20 , a = 160 },
			} })
		end
		table.insert(skin.text, { id = "target", font = 13, size = 12, overflow = 1, ref = 3 })
		table.insert(skin.destination, { id = "target", op = { 21 }, timer = 21, dst = {
			{ x = baseX+ 30, y = baseY, w = 150, h = 20 },
		} })
	end
	
	createTarget()


   
    return skin
end

return {
    header = header,
    main = main
}