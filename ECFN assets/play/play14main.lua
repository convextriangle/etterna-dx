local main_state = require("main_state")



local function append_all(list, list1)
	for i, v in ipairs(list1) do
		table.insert(list, v)
	end
end

local property = {
	{name = "プレーサイド", item = {
		{name = "1P", op = 920},
		{name = "2P", op = 921}
	}},
	{name = "スコアグラフ", item = {
		{name = "Off", op = 900},
		{name = "On", op = 901}
	}},
	{name = "ジャッジカウント", item = {
		{name = "Off", op = 905},
		{name = "On", op = 906}
	}},
	{name = "手元用クロマキー", item = {
		{name = "Off", op = 924},
		{name = "On", op = 925}
	}},
	{name = "スコア差分", item = {
		{name = "Off", op = 907},
		{name = "mybest", op = 908},
		{name = "pacemaker", op = 909}
	}},
	{name = "スコア差分表示方法", item = {
		{name = "Default", op = 940},
		{name = "Single", op = 941},
	}},

	{name = "判定タイミング表示", item = {
		{name = "Off", op = 910},
		{name = "EARLY/LATE", op = 911},
		{name = "+-ms", op = 912}
	}},
	{name = "判定タイミング値表示(グラフ必須)", item = {
		{name = "Off", op = 913},
		{name = "On", op = 914}
	}},
		{name = "ステージファイル表示", item = {
		{name = "Off", op = 926},
		{name = "On", op = 927}
	}},
		{name = "BGA表示方法", item = {
		{name = "Full", op = 929},
		{name = "KeepAspect", op = 928}
	}},
		{name = "閉店アニメ", item = {
		{name = "Full(重いです)", op = 930},
		{name = "Light(従来の物です)", op = 931}
	}},



}
local function is_left_side()
	return skin_config.option["プレーサイド"] == 920
end
local function is_right_side()
	return skin_config.option["プレーサイド"] == 921
end
local function is_left_scratch()
	return skin_config.option["プレーサイド"] == 920
end
local function is_right_scratch()
	return skin_config.option["プレーサイド"] == 921
end
local function is_score_graph_disabled()
	return skin_config.option["スコアグラフ"] == 900
end
local function is_score_graph_enabled()
	return skin_config.option["スコアグラフ"] == 901
end
local function is_judge_count_disabled()
	return skin_config.option["ジャッジカウント"] == 905
end
local function is_judge_count_enabled()
	return skin_config.option["ジャッジカウント"] == 906
end
local function is_judge_detail_early_late()
	return skin_config.option["判定タイミング表示"] == 911
end
local function is_judge_detail_ms()
	return skin_config.option["判定タイミング表示"] == 912
end

local function timer_key_bomb(index)
	if index == 8 then
		return 50
	else
		return 50 + index
	end
end

local function timer_key_hold(index)
	if index == 8 then
		return 70
	else
		return 70 + index
	end
end

local function timer_key_bomb1(index)
	if index == 8 or index == 16 then
		return 60
	elseif index > 8 then
		return 60 + index - 8
	else
		return 60 + index 
	end
end

local function timer_key_hold1(index)
	if index == 8 or index == 16 then
		return 80
	elseif index > 8 then
		return 80 + index - 8
	else
		return 80 + index 
	end
end

local function timer_key_on(index)
	if index == 8 then
		return 100
	else
		return 100 + index
	end
end

local function timer_key_off(index)
	if index == 8 then
		return 120
	else
		return 120 + index
	end
end

local function value_judge(index)
	if index == 8 then
		return 500
	else
		return 500 + index
	end
end

local function value_judge1(index)
	if index == 8 then
		return 510
	else
		return 510 + index
	end
end


local filepath = {
	{name = "Frame", path = "frame/DP/*.png"},
	{name = "Note", path = "notes/*.png"},
	{name = "Bomb", path = "bomb/*.png"},
	{name = "Truntable", path = "truntable/*.png"},
	{name = "Gauge", path = "gauge/*.png"},
	{name = "Judge", path = "judge/legacy/*.png"},
	{name = "Laser", path = "laser/*.png"},
	{name = "Lanecover", path = "lanecover/*.png"},
	{name = "Lift", path = "lift/*.png"},
	{name = "GraphBG", path = "graph_BG/DP/*.png"},
	{name = "glow", path = "glow/*.png"},
	{name = "FullCombo", path = "fullcombo/*.png"},
}

local offset = {
	{name = "Laser Offset", id = 40, x = false, y = false, w = false, h = true, r = false, a = true},
	{name = "Bomb Offset", id = 41, x = true, y = true, w = true, h = true, r = false, a = true},
	{name = "Judge Count Offset", id = 42, x = true, y = true, w = false, h = false, r = false, a = true},
	{name = "BGA Brightness Offset", id = 43, x = false, y = false, w = false, h = false, r = false, a = true},
	{name = "Lane Background Offset", id = 44, x = false, y = false, w = false, h = false, r = false, a = true},
	{name = "ScoreDiff Offset", id = 45, x = true, y = true, w = false, h = false, r = false, a = false},
	{name = "RealTimeJudge Offset", id = 46, x = true, y = true, w = true, h = false, r = false, a = true},
	{name = "judgetiming_window Offset", id = 47, x = false, y = true, w = false, h = false, r = false, a = true},
}

local header = {
	type = 2,
	name = "FC:FN(14K)",
	w = 1920,
	h = 1080,
	loadend = 3000,
	playstart = 1500,
	scene = 3600000,
	input = 500,
	close = 3000,
	fadeout = 1000,
	property = property,
	filepath = filepath,
	offset = offset
}




local key_wbs = { 0, 1, 0, 1, 0, 1, 0, 2, 2, 0, 1, 0, 1, 0, 1, 0 }
local function get_key_wbs(i)
	return key_wbs[(i - 1) % 8 + 1]
end
local function get_key_wbss(i)
	return key_wbs[(i - 1) % 8 + 1]
end

local keybeam_order = { 1, 2, 3, 4, 5, 6, 7, 8, 9,10,11,12,13,14}




local function main()

	local play_parts = require("play_parts")
	local skin = {}
	for k, v in pairs(header) do
		skin[k] = v
	end

	local geometry = {}

	-- 文字スクロール調整
	local title = main_state.text(12)
	local title_len = string.len(title)
	-- いい塩梅が不明	
	if title_len <= 22 then
		geometry.title_move = 12

	-- 30文字以下20文字以上			
	elseif title_len < 30 and title_len >= 23 then 
		geometry.title_move = -100

	-- 40文字以下30文字以上		
	elseif title_len < 40 and title_len >= 30 then 
		geometry.title_move = -130

	-- 40文字以上
	elseif title_len > 40 then 
		geometry.title_move = -230
	end

	-- 文字スクロール調整
	local artist = main_state.text(16)
	local artist_txt = string.len(artist)
	-- いい塩梅が不明	
	if artist_txt <= 30 then
		geometry.artist_txt_move = 12
	-- 30文字以下20文字以上			
	elseif  30 < artist_txt then 
		geometry.artist_txt_move = -50
	end


	if is_left_side() then
		geometry.diffside_x = 0
		geometry.diffsidesrc_x = 0
		geometry.keybeamside_x = 0
		geometry.scbeamside_x = 0
		geometry.keyfrashside_x = 0

		geometry.scoreside_x = 0
		geometry.hispeedside_x = 0

		geometry.turntable_x = 83
		geometry.fullcomboside_x = 384
		geometry.fullcomboside2_x = 953
		geometry.graphside_x = 990
		geometry.judside_x = -478

		geometry.subframe_x = 498
		geometry.mainframe_x = 0
		geometry.mainframesrc_x = 0
		geometry.lanesrc_x = 0
		geometry.progress_x = 426
		geometry.lanes_x = 460
		geometry.lanes_w = 439
		geometry.lane_w_width = 51
		geometry.lane_b_width = 39
		geometry.lane_s_width = 89
		geometry.note_w_width = 51
		geometry.note_b_width = 39
		geometry.note_s_width = 89

		geometry.title_align = 0


		geometry.judgecount_x = 476
		geometry.judgecount_y = 50

		geometry.keybeam_y = 357

		geometry.ready_x = 40
		geometry.title_x = 450
		geometry.gauge_x = 54
		geometry.gauge_w = 450
		geometry.gaugevalue_x = 334
		geometry.gaugeflash_x = 502

		geometry.minbpm_x = 1057 + 132 -396
		geometry.nowbpm_x = 1165 + 132 -396
		geometry.maxbpm_x = 1300 + 132 -396

		geometry.stage_x = 2

		geometry.song_title_x = 200
		geometry.song_title_w = 600
		geometry.song_artist_x = 200
		geometry.song_artist_w = 400
		geometry.song_folde_x = 200
		geometry.song_folde_w = 380

		geometry.bga_x = 825
		geometry.bga_y = 148
		geometry.bga_w = 1086
		geometry.bga_h = 720

		geometry.bga_nograph_x = 584
		geometry.bga_nograph_y = 148
		geometry.bga_nograph_w = 1280
		geometry.bga_nograph_h = 720

		geometry.judgegraph_x = 740
		geometry.judgegraph_y = 100
		geometry.judgegraph_w = 450
		geometry.judgegraph_h = 100
		geometry.timing_x = 740
		geometry.timing_y = 50
		geometry.timing_w = 450
		geometry.timing_h = 50
		geometry.progress_y = 140
		geometry.progress_w = 16
		geometry.progress_h = 540

		geometry.judgefs_y = 3165
	end
	if is_right_side() then
		geometry.diffside_x = 1487
		geometry.diffsidesrc_x = 420
		geometry.keybeamside_x = 1245
		geometry.scbeamside_x = 1679
		geometry.keyfrashside_x = 1245

		geometry.scoreside_x = 1113
		geometry.hispeedside_x = 1065
			
		geometry.turntable_x = 1802
		geometry.fullcomboside_x = 1337
		geometry.graphside_x = 574
		geometry.subframe_x = -318
		geometry.mainframe_x = 1385
		geometry.mainframesrc_x = 1920
		geometry.lanesrc_x = 440
		geometry.progress_x = 1854
		geometry.lanes_x = 1413
		geometry.lanes_w = 439
		geometry.lane_w_width = 51
		geometry.lane_b_width = 39
		geometry.lane_s_width = 89
		geometry.note_w_width = 51
		geometry.note_b_width = 39
		geometry.note_s_width = 89

		geometry.title_align = 0


		geometry.judgecount_x = 476
		geometry.judgecount_y = 50

		geometry.keybeam_y = 357

		geometry.ready_x = 40
		geometry.title_x = 450
		geometry.gauge_x = 54+1363+450
		geometry.gauge_w = -450
		geometry.gaugevalue_x = 334+1079
		geometry.gaugeflash_x = 1398

		geometry.minbpm_x = 1057 + 132-817
		geometry.nowbpm_x = 1165 + 132-817
		geometry.maxbpm_x = 1300 + 132-817

		geometry.stage_x = 1043 + 132-817

		geometry.song_title_x = 200
		geometry.song_title_w = 600
		geometry.song_artist_x = 200
		geometry.song_artist_w = 400
		geometry.song_folde_x = 200
		geometry.song_folde_w = 400

		geometry.bga_x = 9
		geometry.bga_y = 148
		geometry.bga_w = 1086
		geometry.bga_h = 720

		geometry.bga_nograph_x = 584
		geometry.bga_nograph_y = 148
		geometry.bga_nograph_w = 1280
		geometry.bga_nograph_h = 720

		geometry.judgegraph_x = 740
		geometry.judgegraph_y = 100
		geometry.judgegraph_w = 450
		geometry.judgegraph_h = 100
		geometry.timing_x = 740
		geometry.timing_y = 50
		geometry.timing_w = 450
		geometry.timing_h = 50
		geometry.progress_y = 140
		geometry.progress_w = 16
		geometry.progress_h = 540

		geometry.judgefs_y = 3165
--[[	
		geometry.lanes_x = 870
		geometry.lanes_w = 390
		geometry.lane_w_width = 50
		geometry.lane_b_width = 40
		geometry.lane_s_width = 70
		geometry.note_w_width = 50
		geometry.note_b_width = 40
		geometry.note_s_width = 70
		geometry.title_align = 2
		geometry.judge_x = 965
		geometry.judgedetail_x = 1050
		geometry.judgedetail_y = 290
		geometry.judgecount_x = 720
		geometry.judgecount_y = 50
		geometry.ready_x = 890
		geometry.title_x = 840
		geometry.gauge_x = 1260
		geometry.gauge_w = -390
		geometry.gaugevalue_x = 870

		geometry.bga_x = 40
		geometry.bga_y = 50
		geometry.bga_w = 800
		geometry.bga_h = 650

		geometry.bga_nograph_x = 40
		geometry.bga_nograph_y = 50
		geometry.bga_nograph_w = 800
		geometry.bga_nograph_h = 650

		geometry.judgegraph_x = 90
		geometry.judgegraph_y = 100
		geometry.judgegraph_w = 450
		geometry.judgegraph_h = 100
		geometry.timing_x = 90
		geometry.timing_y = 50
		geometry.timing_w = 450
		geometry.timing_h = 50
		geometry.progress_x = 1262
		geometry.progress_y = 140
		geometry.progress_w = 16
		geometry.progress_h = 540
]]--
	end
	geometry.judge_x = 692
	geometry.judge1_x = 1260
	geometry.judgedetail1_x = 755
	geometry.judgedetail1_y = 558
	geometry.judgedetail2_x = 1285
	geometry.judgedetail2_y = 558

	geometry.diffscore1_x = 555
	geometry.diffscore1_y = 558
	geometry.diffscore2_x =1085
	geometry.diffscore2_y = 558
	if is_score_graph_enabled() then
    	if is_left_side() then
    		geometry.graph_x = geometry.lanes_x + geometry.lanes_w
    		geometry.title_x = geometry.title_x + 90
    		geometry.judgecount_x = geometry.judgecount_x + 90
    	else
    		geometry.graph_x = geometry.lanes_x - 90
    		geometry.title_x = geometry.title_x - 90
    		geometry.judgecount_x = geometry.judgecount_x - 90
    	end
		geometry.graph_y = 220
		geometry.graph_w = 90
		geometry.graph_h = 480
	else
		geometry.graph_x = 0
		geometry.graph_y = 0
		geometry.graph_w = 0
		geometry.graph_h = 0
	end
	do
		geometry.notes_x = {}
		geometry.notes_w = {}
		geometry.lanes_center_x = {}
		local x = geometry.lanes_x
		--if is_left_scratcthen
			geometry.lanebg_x = geometry.lanes_x
			geometry.lanebg_w = geometry.lanes_w
			x = x + geometry.lane_s_width + 3 ;
			geometry.notes_x[8] = geometry.lanes_x
			geometry.notes_w[8] = geometry.lane_s_width
		--end
		local adjust_w = (geometry.note_w_width - geometry.lane_w_width) / 2 
		local adjust_b = (geometry.note_b_width - geometry.lane_b_width) / 2 
		for i = 1, 7 do
			if get_key_wbs(i) == 0 then
				geometry.notes_x[i] = x - adjust_w
				geometry.notes_w[i] = geometry.note_w_width
				x = x + geometry.lane_w_width + 3
			else
				geometry.notes_x[i] = x - adjust_b
				geometry.notes_w[i] = geometry.note_b_width
				x = x + geometry.lane_b_width + 3
			end
		end
		for i = 1, 8 do
			geometry.lanes_center_x[i] = geometry.notes_x[i] + geometry.notes_w[i] / 2
		end
		for i = 9, 15 do
			if get_key_wbs(i) == 0 then
				geometry.notes_x[i] = x - adjust_w
				geometry.notes_w[i] = geometry.note_w_width
				x = x + geometry.lane_w_width + 3
			else
				geometry.notes_x[i] = x - adjust_b
				geometry.notes_w[i] = geometry.note_b_width
				x = x + geometry.lane_b_width + 3
			end
		end
		--if is_right_scratch() then
			geometry.lanebg_x = geometry.lanes_x + geometry.lanes_w
			geometry.lanebg_w = -geometry.lanes_w
			geometry.notes_x[16] = x 
			geometry.notes_w[16] = geometry.lane_s_width
		--end
		for i = 9, 16 do
			geometry.lanes_center_x[i] = geometry.notes_x[i] + geometry.notes_w[i] / 2
		end
	end



	skin.source = {
		{id = 0, path = "system.png"},
		{id = "bg", path = "frame/DP/*.png"},
		{id = 2, path = "playbg.png"},
		{id = 3, path = "gauge/*.png"},
		{id = 4, path = "judge/legacy/*.png"},
		{id = 5, path = "number.png"},
		{id = 6, path = "laser/*.png"},
		{id = 7, path = "notes/*.png"},
		{id = 8, path = "close.png"},
		{id = 9, path = "graph.png"},
		{id = 10, path = "bomb/*.png"},
		{id = 11, path = "ready.png"},
		{id = 12, path = "lanecover/*.png"},
		{id = 13, path = "judgedetail.png"},
		{id = 14, path = "lane/default.png"},
		{id = 18, path = "progress/default.png"},
		{id = 19, path = "truntable/*.png"},
		{id = 20, path = "keyflash/default.png"},
		{id = 21, path = "graph_BG/DP/*.png"},
		{id = 22, path = "lift/*.png"},
		{id = "glow", path = "glow/*.png"},
		{id = "closed", path = "close_m.png"},
		{id = "close", path = "close.png"},
		{id = "fullcombo", path = "fullcombo/*.png"},
		{id = "cam", path = "chroma_key.png"},
	}
	skin.font = {
				{id = 0, path = "../_font/song.fnt"},
				{id = 1, path = "../_font/Artist.fnt"},
				{id = 2, path = "../_font/folder.fnt"},
				{id = 3, path = "../_font/selectsongname.fnt"},
				{id = 4, path = "../_font/Genre-Art.fnt"},
				{id = 5, path = "../_font/artist_big.fnt"},
				{id = 6, path = "../_font/subtitle.fnt"},
				{id = 7, path = "../_font/p_genre.fnt"},
	}

	skin.image = {
		{id = "chroma_key", src = "cam", x = 0, y = 0, w = -1, h = -1},
		{id = "black", src = "bg", x = 391, y = 1080, w = 8, h = 8},
		{id = "background", src = "bg", x = 497+217, y = 2164, w = 1920, h = 1080},
		{id = "bga-frame", src = "bg", x = 714, y = 1082, w = 1920, h = 1080},
		{id = "groove_flash", src = "bg", x = 0, y = 3247, w = 20, h = 20},
		{id = "sub_frame", src = "bg", x = 715, y = 1082, w = 1740, h = 1080},
		{id = "BGA_titleback", src = "bg", x = 1288, y = 0, w = 632, h = 632},
		{id = 1, src = 2, x = 0, y = 0, w = 1280, h = 720},
		{id = "ready", src = "bg", x = 546, y = 920, w = 379, h = 160},
		{id = "finish", src = "bg", x = 546, y = 758, w = 379, h = 160},
		{id = "loading", src = "bg", x = 546, y = 661, w = 379, h = 50},
		{id = 7, src = 0, x = 0, y = 0, w = 8, h = 8},
		{id = "close1", src = 8, x = 0, y = 500, w = 640, h = 240},
		{id = "close2", src = 8, x = 0, y = 740, w = 640, h = 240},

		{id = "bomb_" , src = 10, x = 0, y = 0, w = 6000, h = 300, divx = 20, cycle = 300},

		{id = "lane-bg", src = 14, x = 0, y = 0, w = 439, h = 727},
		{id = "lane-bg1", src = 14, x = 440, y = 0, w = 439, h = 727},

		{id = "graph-frame", src = "bg", x = 0, y = 0, w = 404, h = 1080},
		{id = "graph-AAA", src = "bg", x = 0, y = 2499, w = 402, h = 18},
		{id = "graph-AA", src = "bg", x = 0, y = 2518, w = 402, h = 18},
		{id = "graph-A", src = "bg", x = 0, y = 2537, w = 402, h = 18},
		{id = "graph-AAA-pass", src = "bg", x = 0, y = 2556, w = 402, h = 18},
		{id = "graph-AA-pass", src = "bg", x = 0, y = 2575, w = 402, h = 18},
		{id = "graph-A-pass", src = "bg", x = 0, y = 2594, w = 402, h = 18},
		{id = "graph-BG", src = 21, x = 0, y = 0, w = 402, h = 971},
		{id = "graph_OP_you", src = "bg", x = 133, y = 2675, w = 98, h = 130, divy = 10, len = 10, ref = 42, act = 42},
		{id = "graph_TARGET", src = "bg", x = 0, y = 2675, w = 132, h = 143, divy = 11, len = 11, ref = 77, act = 77},
		{id = "liftcover", src = 22, x = 0, y = 0, w = 431, h = 723},
		{id = 12, src = 0, x = 0, y = 0, w = 431, h = 723},
		{id = 13, src = 0, x = 10, y = 10, w = 10, h = 251},
		{id = 15, src = 0, x = 16, y = 0, w = 8, h = 8},

		{id = 100, src = 6, x = 47, y = 0, w = 28, h = 255},
		{id = 101, src = 6, x = 75, y = 0, w = 21, h = 255},
		{id = 102, src = 6, x = 0, y = 0, w = 47, h = 255},
		{id = "keybeam-w", src = 6, x = 48, y = 0, w = 27, h = 255},
		{id = "keybeam-b", src = 6, x = 76, y = 0, w = 20, h = 255},
		{id = "keybeam-s", src = 6, x = 0, y = 0, w = 47, h = 255},
		{id = "keybeam-w-pg", src = 6, x = 145, y = 0, w = 27, h = 255},
		{id = "keybeam-b-pg", src = 6, x = 173, y = 0, w = 20, h = 255},
		{id = "keybeam-s-pg", src = 6, x = 97, y = 0, w = 47, h = 255},
		{id = "turntable", src = 19, x = 0, y = 0, w = 35, h = 35},

		{id = "freestage", src = "bg", x = 0, y = 1523, w = 387, h = 32},
		{id = "1st_stage", src = "bg", x = 291, y = 1566, w = 387, h = 32},
		{id = "2nd_stage", src = "bg", x = 291, y = 1566 + 34 * 1, w = 387, h = 32},
		{id = "3rd_stage", src = "bg", x = 291, y = 1566 + 34 * 2, w = 387, h = 32},
		{id = "4th_stage", src = "bg", x = 291, y = 1566 + 34 * 3, w = 387, h = 32},
		{id = "final_stage", src = "bg", x = 291, y = 1566 + 34 * 4, w = 387, h = 32},

		{id = "keyflash-w", src = 20, x = 0, y = 0, w = 67, h = 96},
		{id = "keyflash-b", src = 20, x = 67, y = 0, w = 56, h = 88},

		{id = "rank_AAA", src = "bg", x = 233, y = 2675, w = 69, h = 23},
		{id = "rank_AA", src = "bg", x = 233, y = 2675 + 23 * 1, w = 69, h = 23},
		{id = "rank_A", src = "bg", x = 233, y = 2675 + 23 * 2, w = 69, h = 23},
		{id = "rank_B", src = "bg", x = 233, y = 2675 + 23 * 3, w = 69, h = 23},
		{id = "rank_C", src = "bg", x = 233, y = 2675 + 23 * 4, w = 69, h = 23},
		{id = "rank_D", src = "bg", x = 233, y = 2675 + 23 * 5, w = 69, h = 23},
		{id = "rank_E", src = "bg", x = 233, y = 2675 + 23 * 6, w = 69, h = 23},
		{id = "rank_F", src = "bg", x = 233, y = 2675 + 23 * 7, w = 69, h = 23},

		{id = "diff_0", src = "bg", x = 0 , y = 1210, w = 223, h = 52},
		{id = "diff_1", src = "bg", x = 0 , y = 1210 + 52*1, w = 223, h = 52},
		{id = "diff_2", src = "bg", x = 0 , y = 1210 + 52*2, w = 223, h = 52},
		{id = "diff_3", src = "bg", x = 0 , y = 1210 + 52*3, w = 223, h = 52},
		{id = "diff_4", src = "bg", x = 0 , y = 1210 + 52*4, w = 223, h = 52},
		{id = "diff_5", src = "bg", x = 0 , y = 1210 + 52*5, w = 223, h = 52},

		{id = "jud_0", src = "bg", x = 226, y = 1305, w = 87, h = 7},
		{id = "jud_1", src = "bg", x = 226, y = 1305 + 7*1, w = 87, h = 7},
		{id = "jud_2", src = "bg", x = 226, y = 1305 + 7*2, w = 87, h = 7},
		{id = "jud_3", src = "bg", x = 226, y = 1305 + 7*3, w = 87, h = 7},
		{id = "jud_4", src = "bg", x = 226, y = 1305 + 7*4, w = 87, h = 7},
--h=23px改変 lnsとlneがつぶれるやつの対策 要画像差し替え　ついでにlnbチカチカ さらについでにhcnの挙動それっぽく
		{id = "note-b", src = 7, x = 233, y = 2, w = 39, h = 23},
		{id = "note-w", src = 7, x = 181, y = 2, w = 51, h = 23},
		{id = "note-s", src = 7, x = 91, y = 2, w = 89, h = 23},
		
		{id = "note-b", src = 7, x = 233, y = 1, w = 39, h = 24},
		{id = "note-w", src = 7, x = 181, y = 1, w = 51, h = 24},
		{id = "note-s", src = 7, x = 91, y = 1, w = 89, h = 24},
		
		{id = "lns-b", src = 7, x = 233, y = 76, w = 39, h = 24},
		{id = "lns-w", src = 7, x = 181, y = 76, w = 51, h = 24},
		{id = "lns-s", src = 7, x = 91, y = 76, w = 89, h = 24},

		{id = "lne-b", src = 7, x = 233, y = 51, w = 39, h = 24},
		{id = "lne-w", src = 7, x = 181, y = 51, w = 51, h = 24},
		{id = "lne-s", src = 7, x = 91, y = 51, w = 89, h = 24},
		
		{id = "lnb-b", src = 7, x = 233, y = 102, w = 39, h = 2, divy = 2, cycle = 266},
		{id = "lnb-w", src = 7, x = 181, y = 102, w = 51, h = 2, divy = 2, cycle = 266},
		{id = "lnb-s", src = 7, x = 91, y = 102, w = 89, h = 2, divy = 2, cycle = 266},

		{id = "lna-b", src = 7, x = 233, y = 101, w = 39, h = 1},
		{id = "lna-w", src = 7, x = 181, y = 101, w = 51, h = 1},
		{id = "lna-s", src = 7, x = 91, y = 101, w = 89, h = 1},

		{id = "hcns-b", src = 7, x = 233, y = 130, w = 39, h = 24},
		{id = "hcns-w", src = 7, x = 181, y = 130, w = 51, h = 24},
		{id = "hcns-s", src = 7, x = 91, y = 130, w = 89, h = 24},

		{id = "hcne-b", src = 7, x = 233, y = 105, w = 39, h = 24},
		{id = "hcne-w", src = 7, x = 181, y = 105, w = 51, h = 24},
		{id = "hcne-s", src = 7, x = 91, y = 105, w = 89, h = 24},

		{id = "hcnb-b", src = 7, x = 233, y = 158, w = 39, h = 2, divy = 2, cycle = 266},
		{id = "hcnb-w", src = 7, x = 181, y = 158, w = 51, h = 2, divy = 2, cycle = 266},
		{id = "hcnb-s", src = 7, x = 91, y = 158, w = 89, h = 2, divy = 2, cycle = 266},

		{id = "hcna-b", src = 7, x = 233, y = 155, w = 39, h = 1},
		{id = "hcna-w", src = 7, x = 181, y = 155, w = 51, h = 1},
		{id = "hcna-s", src = 7, x = 91, y = 155, w = 89, h = 1},
		
		{id = "hcnd-b", src = 7, x = 233, y = 158, w = 39, h = 2, divy = 2, cycle = 266},
		{id = "hcnd-w", src = 7, x = 181, y = 158, w = 51, h = 2, divy = 2, cycle = 266},
		{id = "hcnd-s", src = 7, x = 91, y = 158, w = 89, h = 2, divy = 2, cycle = 266},

		{id = "hcnr-b", src = 7, x = 233, y = 156, w = 39, h = 2, divy = 2, cycle = 100},
		{id = "hcnr-w", src = 7, x = 181, y = 156, w = 51, h = 2, divy = 2, cycle = 100},
		{id = "hcnr-s", src = 7, x = 91, y = 156, w = 89, h = 2, divy = 2, cycle = 100},
	
		{id = "mine-b", src = 7, x = 233, y = 26, w = 39, h = 24},
		{id = "mine-w", src = 7, x = 181, y = 26, w = 51, h = 24},
		{id = "mine-s", src = 7, x = 91, y = 26, w = 89, h = 24},

		{id = "section-line", src = 0, x = 0, y = 0, w = 1, h = 1},
		{id = "glow_base", src = "glow", x = 0, y = 0, w = 431, h = 59},

		--閉店パーツ
		{id = "close_p1", src = "closed", x = 1528, y = 0, w = 885, h = 1438},
		{id = "close_p2", src = "closed", x = 0, y = 0, w = 664*2, h = 85, divx = 2, cycle = 60},
		{id = "close_p3", src = "closed", x = 0, y = 87, w = 1769, h = 42},
		{id = "close_p4", src = "closed", x = 0, y = 129, w = 625, h = 78},
		{id = "close_p5", src = "closed", x = 0, y = 214, w = 1228, h = 691},
		{id = "close_p6", src = "closed", x = 2, y = 1503, w = 1874, h = 95},
		--グルーヴゲージの切り出し		
		{id = "gauge-r1", src = 3, x = 0, y = 0, w = 9, h = 33},
		{id = "gauge-r2", src = 3, x = 18, y = 0, w = 9, h = 33},
		{id = "gauge-r3", src = 3, x = 0, y = 0, w = 9, h = 33},

		{id = "gauge-b1", src = 3, x = 9, y = 0, w = 9, h = 33},
		{id = "gauge-b2", src = 3, x = 27, y = 0, w = 9, h = 33},
		{id = "gauge-b3", src = 3, x = 9, y = 0, w = 9, h = 33},

		{id = "gauge-y1", src = 3, x = 0, y = 33, w = 9, h = 33},
		{id = "gauge-y2", src = 3, x = 18, y = 33, w = 9, h = 33},
		{id = "gauge-y3", src = 3, x = 0, y = 33, w = 9, h = 33},

		{id = "gauge-p1", src = 3, x = 9, y = 33, w = 9, h = 33},
		{id = "gauge-p2", src = 3, x = 27, y = 33, w = 9, h = 33},
		{id = "gauge-p3", src = 3, x = 9, y = 33, w = 9, h = 33},

		{id = "gauge-g1", src = 3, x = 45, y = 0, w = 9, h = 33},
		{id = "gauge-g2", src = 3, x = 63, y = 0, w = 9, h = 33},
		{id = "gauge-g3", src = 3, x = 45, y = 0, w = 9, h = 33},

		{id = "gauge-w1", src = 3, x = 36, y = 33, w = 9, h = 33},
		{id = "gauge-w2", src = 3, x = 45, y = 33, w = 9, h = 33},
		{id = "gauge-w3", src = 3, x = 36, y = 33, w = 9, h = 33},
		--判定文字
		--光らせる為に改変 要画像差し替え
		{id = "judgef-pg", src = 4, x = 0, y = 0, w = 231, h = 504, divy = 6, cycle = 100},
		{id = "judgef-gr", src = 4, x = 0, y = 505, w = 231, h = 168, divy = 2, cycle = 60},
		{id = "judgef-gd", src = 4, x = 0, y = 674 + 85 * 0, w = 186 * 2, h = 84, divx = 2, cycle = 60},
		{id = "judgef-bd", src = 4, x = 0, y = 674 + 85 * 1, w = 142 * 2, h = 84, divx = 2, cycle = 60},
		{id = "judgef-pr", src = 4, x = 0, y = 674 + 85 * 2, w = 186 * 2, h = 84, divx = 2, cycle = 60},
		{id = "judgef-ms", src = 4, x = 0, y = 674 + 85 * 3, w = 162 * 2, h = 84, divx = 2, cycle = 60},
--
		--judgetiming
		{id = "judgetiming", src = "bg", x = 297, y = 1758, w = 284, h = 71 , act = 74 },
		--Fast&Slow
		{id = "judge-early", src = "bg", x = 0, y = 2871, w = 74, h = 18},
		{id = "judge-late", src = "bg", x = 0, y = 2890, w = 74, h = 18},
		--ジャッジカウント用
		{id = "judge-frame", src = "bg", x = 0, y = 2909, w = 284, h = 141},
		{id = "judge-main", src = "bg", x = 0, y = 3051, w = 257, h = 113},
		--ジャッジカウントFS用
		{id = "PF_F", src = "bg", x = 0, y = 3165, w = 73, h = 16},
		{id = "PF_S", src = "bg", x = 0, y = 3165 + 16 * 1, w = 73, h = 16},
		{id = "PF_N", src = "bg", x = 0, y = 3165 + 16 * 2, w = 73, h = 16},
		{id = "GR_F", src = "bg", x = 0, y = 3165, w = 73, h = 16},
		{id = "GR_S", src = "bg", x = 0, y = 3165 + 16 * 1, w = 73, h = 16},
		{id = "GR_N", src = "bg", x = 0, y = 3165 + 16 * 2, w = 73, h = 16},
		{id = "GD_F", src = "bg", x = 0, y = 3165, w = 73, h = 16},
		{id = "GD_S", src = "bg", x = 0, y = 3165 + 16 * 1, w = 73, h = 16},
		{id = "GD_N", src = "bg", x = 0, y = 3165 + 16 * 2, w = 73, h = 16},
		{id = "BD_F", src = "bg", x = 0, y = 3165, w = 73, h = 16},
		{id = "BD_S", src = "bg", x = 0, y = 3165 + 16 * 1, w = 73, h = 16},
		{id = "BD_N", src = "bg", x = 0, y = 3165 + 16 * 2, w = 73, h = 16},
		{id = "PR_F", src = "bg", x = 0, y = 3165, w = 73, h = 16},
		{id = "PR_S", src = "bg", x = 0, y = 3165 + 16 * 1, w = 73, h = 16},
		{id = "PR_N", src = "bg", x = 0, y = 3165 + 16 * 2, w = 73, h = 16},
		{id = "FL_F", src = "bg", x = 0, y = 3165, w = 73, h = 16},
		{id = "FL_S", src = "bg", x = 0, y = 3165 + 16 * 1, w = 73, h = 16},
		{id = "FL_N", src = "bg", x = 0, y = 3165 + 16 * 2, w = 73, h = 16},

		--フルコン用
		{id = "FC-header1", src = "fullcombo", x = 0, y = 2330, w = 217, h = 92 , divy = 2 , cycle = 34},
		{id = "FC-header2", src = "fullcombo", x = 218, y = 2330, w = 274, h = 92 , divy = 2 , cycle = 34},
		{id = "FC-upperglow", src = "fullcombo", x = 14, y = 0, w = 2, h = 347},
		{id = "FC-main1", src = "fullcombo", x = 0, y = 0, w = 4, h = 507},
		{id = "FC-main2", src = "fullcombo", x = 5, y = 0, w = 1, h = 482},
		{id = "FC-main3", src = "fullcombo", x = 17, y = 0, w = 458, h = 151},
		{id = "FC-main4", src = "fullcombo", x = 211, y = 0, w = 60, h = 151},
		{id = "FC-flash1", src = "fullcombo", x = 17, y = 152, w = 200, h = 173},
		{id = "FC-flash2", src = "fullcombo", x = 17, y = 152, w = 400, h = 173, divx = 2 , cycle = 34},
		{id = "FC-flash3", src = "fullcombo", x = 17, y = 326, w = 640, h = 640},
		{id = "FC-ring1", src = "fullcombo", x = 476, y = 0, w = 368, h = 304},
		{id = "FC-ring2", src = "fullcombo", x = 845, y = 0, w = 538, h = 316},
		{id = "FC-ring3", src = "fullcombo", x = 0, y = 967, w = 1445, h = 698},
		{id = "FC-glow", src = "fullcombo", x = 418, y = 152, w = 27, h = 155, divyS = 5 , cycle = 83},

		--閉店(テスト)
		{id = "an_close_acc", src = "close", x = 0, y = 7920, w = 806, h = 21},
		{id = "an_close1", src = "close", x = 0+1280*0, y = 0+720*0, w = 1280, h = 720},
		{id = "an_close2", src = "close", x = 0+1280*1, y = 0+720*0, w = 1280, h = 720},
		{id = "an_close3", src = "close", x = 0+1280*2, y = 0+720*0, w = 1280, h = 720},
		{id = "an_close4", src = "close", x = 0+1280*3, y = 0+720*0, w = 1280, h = 720},
		{id = "an_close5", src = "close", x = 0+1280*4, y = 0+720*0, w = 1280, h = 720},

		{id = "an_close6", src = "close", x = 0+1280*0, y = 0+720*1, w = 1280, h = 720},
		{id = "an_close7", src = "close", x = 0+1280*1, y = 0+720*1, w = 1280, h = 720},
		{id = "an_close8", src = "close", x = 0+1280*2, y = 0+720*1, w = 1280, h = 720},
		{id = "an_close9", src = "close", x = 0+1280*3, y = 0+720*1, w = 1280, h = 720},
		{id = "an_close10", src = "close", x = 0+1280*4, y = 0+720*1, w = 1280, h = 720},

		{id = "an_close11", src = "close", x = 0+1280*0, y = 0+720*2, w = 1280, h = 720},
		{id = "an_close12", src = "close", x = 0+1280*1, y = 0+720*2, w = 1280, h = 720},
		{id = "an_close13", src = "close", x = 0+1280*2, y = 0+720*2, w = 1280, h = 720},
		{id = "an_close14", src = "close", x = 0+1280*3, y = 0+720*2, w = 1280, h = 720},
		{id = "an_close15", src = "close", x = 0+1280*4, y = 0+720*2, w = 1280, h = 720},

		{id = "an_close16", src = "close", x = 0+1280*0, y = 0+720*3, w = 1280, h = 720},
		{id = "an_close17", src = "close", x = 0+1280*1, y = 0+720*3, w = 1280, h = 720},
		{id = "an_close18", src = "close", x = 0+1280*2, y = 0+720*3, w = 1280, h = 720},
		{id = "an_close19", src = "close", x = 0+1280*3, y = 0+720*3, w = 1280, h = 720},
		{id = "an_close20", src = "close", x = 0+1280*4, y = 0+720*3, w = 1280, h = 720},

		{id = "an_close21", src = "close", x = 0+1280*0, y = 0+720*4, w = 1280, h = 720},
		{id = "an_close22", src = "close", x = 0+1280*1, y = 0+720*4, w = 1280, h = 720},
		{id = "an_close23", src = "close", x = 0+1280*2, y = 0+720*4, w = 1280, h = 720},
		{id = "an_close24", src = "close", x = 0+1280*3, y = 0+720*4, w = 1280, h = 720},
		{id = "an_close25", src = "close", x = 0+1280*4, y = 0+720*4, w = 1280, h = 720},

		{id = "an_close26", src = "close", x = 0+1280*0, y = 0+720*5, w = 1280, h = 720},
		{id = "an_close27", src = "close", x = 0+1280*1, y = 0+720*5, w = 1280, h = 720},
		{id = "an_close28", src = "close", x = 0+1280*2, y = 0+720*5, w = 1280, h = 720},
		{id = "an_close29", src = "close", x = 0+1280*3, y = 0+720*5, w = 1280, h = 720},
		{id = "an_close30", src = "close", x = 0+1280*4, y = 0+720*5, w = 1280, h = 720},

		{id = "an_close31", src = "close", x = 0+1280*0, y = 0+720*6, w = 1280, h = 720},
		{id = "an_close32", src = "close", x = 0+1280*1, y = 0+720*6, w = 1280, h = 720},
		{id = "an_close33", src = "close", x = 0+1280*2, y = 0+720*6, w = 1280, h = 720},
		{id = "an_close34", src = "close", x = 0+1280*3, y = 0+720*6, w = 1280, h = 720},
		{id = "an_close35", src = "close", x = 0+1280*4, y = 0+720*6, w = 1280, h = 720},

		{id = "an_close36", src = "close", x = 0+1280*0, y = 0+720*7, w = 1280, h = 720},
		{id = "an_close37", src = "close", x = 0+1280*1, y = 0+720*7, w = 1280, h = 720},
		{id = "an_close38", src = "close", x = 0+1280*2, y = 0+720*7, w = 1280, h = 720},
		{id = "an_close39", src = "close", x = 0+1280*3, y = 0+720*7, w = 1280, h = 720},
		{id = "an_close40", src = "close", x = 0+1280*4, y = 0+720*7, w = 1280, h = 720},

		{id = "an_close41", src = "close", x = 0+1280*0, y = 0+720*8, w = 1280, h = 720},
		{id = "an_close42", src = "close", x = 0+1280*1, y = 0+720*8, w = 1280, h = 720},
		{id = "an_close43", src = "close", x = 0+1280*2, y = 0+720*8, w = 1280, h = 720},
		{id = "an_close44", src = "close", x = 0+1280*3, y = 0+720*8, w = 1280, h = 720},
		{id = "an_close45", src = "close", x = 0+1280*4, y = 0+720*8, w = 1280, h = 720},

		{id = "an_close46", src = "close", x = 0+1280*0, y = 0+720*9, w = 1280, h = 720},
		{id = "an_close47", src = "close", x = 0+1280*1, y = 0+720*9, w = 1280, h = 720},
		{id = "an_close48", src = "close", x = 0+1280*2, y = 0+720*9, w = 1280, h = 720},
		{id = "an_close49", src = "close", x = 0+1280*3, y = 0+720*9, w = 1280, h = 720},
		{id = "an_close50", src = "close", x = 0+1280*4, y = 0+720*9, w = 1280, h = 720},

		{id = "an_close51", src = "close", x = 0+1280*0, y = 0+720*10, w = 1280, h = 720},
		{id = "an_close52", src = "close", x = 0+1280*1, y = 0+720*10, w = 1280, h = 720},
		{id = "an_close53", src = "close", x = 0+1280*2, y = 0+720*10, w = 1280, h = 720},
		{id = "an_close54", src = "close", x = 0+1280*3, y = 0+720*10, w = 1280, h = 720},
		{id = "an_close55", src = "close", x = 0+1280*4, y = 0+720*10, w = 1280, h = 720},

	}

	local function bomb_image1(index, prefix, src_y, timer_func)
		local name = index
		if index == 25 then
			name = "su"
		elseif index == 26 then
			name = "sd"
		end
		return {id = prefix..name, src = 10, x = 0, y = src_y, w = 6000, h = 300, divx = 20, timer = timer_func(index), cycle = 300}
	end
	for i = 1, 8 do
		table.insert(skin.image, bomb_image1(i, "bomb1-", 0, timer_key_bomb))
		table.insert(skin.image, bomb_image1(i, "bomb2-", 0, timer_key_bomb))
		table.insert(skin.image, bomb_image1(i, "bomb3-", 0, timer_key_bomb))
	end
	for i = 9, 16 do
		table.insert(skin.image, bomb_image1(i, "bomb1-", 0, timer_key_bomb1))
		table.insert(skin.image, bomb_image1(i, "bomb2-", 0, timer_key_bomb1))
		table.insert(skin.image, bomb_image1(i, "bomb3-", 0, timer_key_bomb1))
	end

	local function bomb_image2(index, prefix, src_y, timer_func)
		local name = index
		if index == 25 then
			name = "su"
		elseif index == 26 then
			name = "sd"
		end
		return {id = prefix..name, src = 10, x = 0, y = src_y, w = 1500, h = 300, divx = 5, timer = timer_func(index), cycle = 80}
	end
	for i = 1, 8 do
		table.insert(skin.image, bomb_image2(i, "hold-", 0, timer_key_hold))
	end
	for i = 9, 16 do
		table.insert(skin.image, bomb_image2(i, "hold-", 0, timer_key_hold1))
	end

	skin.imageset = {}
	do
		local wbs = { "w", "b", "s" }
		for i = 1, 8 do
			local name = i
			if i == 25 then
				name = "su"
			elseif i == 26 then
				name = "sd"
			end
			local img_suffix = wbs[get_key_wbs(i) + 1]
			table.insert(skin.imageset, {
				id = "keybeam"..name,
				ref = value_judge(i),
				images = { "keybeam-"..img_suffix, "keybeam-"..img_suffix.."-pg" }
			})
		end
	end
	for i = 1, 8 do
		local name = i
		if i == 25 then
			name = "su"
		elseif i == 26 then
			name = "sd"
		end
		table.insert(skin.imageset, {
			id = i + 109,
			ref = value_judge(i),
			images = { "bomb1-"..name, "bomb2-"..name, "bomb1-"..name, "bomb3-"..name }
		})
	end
	for i = 9, 16 do
		local name = i
		if i == 25 then
			name = "su"
		elseif i == 26 then
			name = "sd"
		end
		table.insert(skin.imageset, {
			id = i + 209 - 8,
			ref = value_judge1(i -8),
			images = { "bomb1-"..name, "bomb2-"..name, "bomb1-"..name, "bomb3-"..name }
		})
	end
	skin.value = {
		{id = "judge_timing", src = "bg", x = 297, y = 1830, w = 108, h = 24, divx = 12, divy = 2,  digit = 4, ref = 12 , align = 2},
		--BPM
		{id = "minbpm", src = "bg", x = 0, y = 1181, w = 390, h = 25, divx = 10, digit = 3, align = 3 , ref = 91},
		{id = "nowbpm", src = "bg", x = 0, y = 1181, w = 390, h = 25, divx = 10, digit = 3, align = 3 , ref = 160},
		{id = "maxbpm", src = "bg", x = 0, y = 1181, w = 390, h = 25, divx = 10, digit = 3, align = 3 , ref = 90},
		--スコアとか
		{id = "ex_score", src = "bg", x = 0, y = 1181, w = 429, h = 25, divx = 11, digit = 4, ref = 71},
		{id = "timeleft-m", src = "bg", x = 0, y = 2820, w = 176, h = 16, divx = 11, digit = 2, ref = 163},
		{id = "timeleft-s", src = "bg", x = 0, y = 2820, w = 176, h = 16, divx = 11, digit = 2, padding = 1, ref = 164},
		{id = "hispeed", src = "bg", x = 0, y = 1128, w = 260, h = 24, divx = 10, digit = 2, ref = 310},
		{id = "hispeed-d", src = "bg", x = 0, y = 1128, w = 260, h = 24, divx = 10, digit = 2, padding = 1, ref = 311},
		{id = "gaugevalue", src = "bg", x = 0, y = 1080, w = 390, h = 28, divx = 10, digit = 3, ref = 107},
		{id = "gaugevalue-d", src = "bg", x = 0, y = 1108, w = 250, h = 20, divx = 10, digit = 1, ref = 407},
		--グラフ周りの数値
		{id = "graphvalue-upper-you", src = "bg", x = 0, y = 2613, w = 242, h = 22, divx = 11, digit = 4, ref = 71},
		{id = "graphvalue-rate-you", src = "bg", x = 0, y = 2658, w = 154, h = 16, divx = 11, digit = 3, ref = 102},
		{id = "graphvalue-rate-dot-you", src = "bg", x = 0, y = 2658, w = 140, h = 16, divx = 10, digit = 2, padding = 1 , ref = 103},

		{id = "graphvalue-upper-pacemaker", src = "bg", x = 0, y = 2613, w = 242, h = 22, divx = 11, digit = 4, ref = 151},
		{id = "graphvalue-mybest", src = "bg", x = 0, y = 2613, w = 242, h = 22, divx = 11, digit = 4, ref = 150},
		{id = "graphvalue-rate-mybest", src = "bg", x = 0, y = 2658, w = 154, h = 16, divx = 11, digit = 3, ref = 183},
		{id = "graphvalue-rate-dot-mybest", src = "bg", x = 0, y = 2658, w = 140, h = 16, divx = 10, digit = 2, padding = 1 , ref = 184},

		{id = "graphvalue-diff-mybest", src = "bg", x = 0, y = 2613, w = 264, h = 44, divx = 12, divy = 2, digit = 5,zeropadding = 1, ref = 152},
		{id = "graphvalue-diff-pacemaker", src = "bg", x = 0, y = 2613, w = 264, h = 44, divx = 12, divy = 2,  digit = 5,zeropadding = 1, ref = 153},
		{id = "graphvalue-rate-pacemaker", src = "bg", x = 0, y = 2658, w = 154, h = 16, divx = 11, digit = 3, ref = 122},
		{id = "graphvalue-rate-dot-pacemaker", src = "bg", x = 0, y = 2658, w = 140, h = 16, divx = 10, digit = 2, padding = 1 , ref = 123},
		--スコア差分	
		{id = "score_diff_mybest", src = "bg", x = 0, y = 3214, w = 192, h = 32, divx = 12, divy = 2, digit = 5, zeropadding = 1 , ref = 152},
		{id = "score_diff_pacemaker", src = "bg", x = 0, y = 3214, w = 192, h = 32, divx = 12, divy = 2, digit = 5, zeropadding = 1 , ref = 153},
		--難易度数値	
		{id = "diffnum_1", src = "bg", x = 226, y = 1210, w = 190, h = 18, divx = 10, digit = 2, ref = 96},
		{id = "diffnum_2", src = "bg", x = 226, y = 1210 + 19*1, w = 190, h = 18, divx = 10, digit = 2, ref = 96},
		{id = "diffnum_3", src = "bg", x = 226, y = 1210 + 19*2, w = 190, h = 18, divx = 10, digit = 2, ref = 96},
		{id = "diffnum_4", src = "bg", x = 226, y = 1210 + 19*3, w = 190, h = 18, divx = 10, digit = 2, ref = 96},
		{id = "diffnum_5", src = "bg", x = 226, y = 1210 + 19*4, w = 190, h = 18, divx = 10, digit = 2, ref = 96},
		--レーンカバーの数値
		{id = "lanecover-value", src = "bg", x = 0, y = 2820, w = 160, h = 16, divx = 10, digit = 3, ref = 14},
		{id = "lift-value", src = "bg", x = 0, y = 2820, w = 160, h = 16, divx = 10, digit = 3, ref = 314},
		{id = "lanecover-green", src = "bg", x = 0, y = 2837, w = 160, h = 16, divx = 10, digit = 4, ref = 313},
		{id = "lanecover-duration", src = "bg", x = 0, y = 2854, w = 160, h = 16, divx = 10, digit = 4, ref = 312},
		--コンボ数値
		--光らせる為に改変 要画像差し替え
		{id = "judgen-pg", src = 4, x = 232, y = 0, w = 560, h = 504, divx = 10, divy = 6, digit = 6, ref = 75, space = 0, cycle = 100},
		{id = "judgen-gr", src = 4, x = 232, y = 505, w = 560, h = 84 * 2, divx = 10, divy = 2, digit = 6, ref = 75, space = 0, cycle = 60},
		{id = "judgen-gd", src = 4, x = 232, y = 505, w = 560, h = 84 * 2, divx = 10, divy = 2, digit = 6, ref = 75, space = 0, cycle = 60},
		{id = "judgen-bd", src = 4, x = 232, y = 505, w = 560, h = 84 * 2, divx = 10, divy = 2, digit = 6, ref = 75, space = 0, cycle = 60},
		{id = "judgen-pr", src = 4, x = 232, y = 505, w = 560, h = 84 * 2, divx = 10, divy = 2, digit = 6, ref = 75, space = 0, cycle = 60},
		{id = "judgen-ms", src = 4, x = 232, y = 505, w = 560, h = 84 * 2, divx = 10, divy = 2, digit = 6, ref = 75, space = 0, cycle = 60},
--
		--FS判定用数値(未使用)
		{id = "judgems-1pp", src = 13, x = 0, y = 20, w = 120, h = 40, divx = 12, divy = 2, digit = 4, ref = 525},
		{id = "judgems-1pg", src = 13, x = 0, y = 60, w = 120, h = 40, divx = 12, divy = 2, digit = 4, ref = 525},
		--ジャッジカウント用数値
		{id = "judge-count-pg", src = "bg", x = 0, y = 2820, w = 160, h = 16, divx = 10, digit = 4 , ref = 110},
		{id = "judge-count-gr", src = "bg", x = 0, y = 2820, w = 160, h = 16, divx = 10, digit = 4 , ref = 111},
		{id = "judge-count-gd", src = "bg", x = 0, y = 2820, w = 160, h = 16, divx = 10, digit = 4 , ref = 112},
		{id = "judge-count-bd", src = "bg", x = 0, y = 2820, w = 160, h = 16, divx = 10, digit = 4, ref = 113},
		{id = "judge-count-pr", src = "bg", x = 0, y = 2820, w = 160, h = 16, divx = 10, digit = 4, ref = 114},
		{id = "judge-count-fl", src = "bg", x = 0, y = 2820, w = 160, h = 16, divx = 10, digit = 4 , ref = 420},
		{id = "judge-count-cb", src = "bg", x = 0, y = 2820, w = 160, h = 16, divx = 10, digit = 4 , ref = 425},
		{id = "judge-count-remain", src = "bg", x = 0, y = 2820, w = 160, h = 16, divx = 10, digit = 4 , value = function()
			local total = main_state.number(106)
			local pf = main_state.number(110)
			local gr = main_state.number(111)
			local gd = main_state.number(112)
			local bd = main_state.number(113)
			local pr = main_state.number(114)	
			local run = pf + gr + gd + bd + pr
			return total - run
		end},
		{id = "judge-count-notes", src = "bg", x = 0, y = 2820, w = 160, h = 16, divx = 10, digit = 4 , ref = 106},
		{id = "judge-count-fast", src = "bg", x = 0, y = 2820, w = 160, h = 16, divx = 10, digit = 4 , ref = 423},
		{id = "judge-count-slow", src = "bg", x = 0, y = 2820, w = 160, h = 16, divx = 10, digit = 4 , ref = 424},
	}

	skin.text = {
		{id = "song-title", font = 0, size = 23,overflow = 1, ref = 12},
		{id = "artist", font = 1, size = 17,overflow = 1, ref = 16},
		{id = "folder", font = 2, size = 13,overflow = 1, ref = 1003},
		{id = "song-title_big", font = 3, size = 50, align = 1,overflow = 1, ref = 10},
		{id = "song-title_sub", font = 6, size = 20, align = 1,overflow = 1, ref = 11},
		{id = "artist_big", font = 4, size = 20, align = 1,overflow = 1, ref = 16},
		{id = "genre_big", font = 7, size = 24, align = 1,overflow = 1, ref = 13},
	}
	skin.slider = {
		{id = "musicprogress", src = 18, x = 0, y = 0, w = 24, h = 36, angle = 2, range = 610 ,type = 6},
		{id = "musicprogress-fin", src = 18, x = 0, y = 0, w = 24, h = 36, angle = 2, range = 610 ,type = 6},
		{id = "lanecover", src = 12, x = 0, y = 0, w = 431, h = 723, angle = 2, range = 723,type = 4},
	}
	skin.hiddenCover = {
		{id = "hidden-cover", src = 12, x = 0, y = 0, w = 390, h = 580, disapearLine = 140, isDisapearLineLinkLift = true}
	}
	skin.graph = {
		{id = "graph-now", src = 9, x = 0, y = 0, w = 896, h = 448, divx = 896, divy = 1 , cycle = 10000, type = 110},
		{id = "graph-best", src = 9, x = 897, y = 0, w = 62, h = 612,type = 113},
		{id = "graph-target", src = 9, x = 897, y = 0, w = 62, h = 612, type = 115},
		{id = "graph-best-now", src = 9, x = 0, y = 449, w = 896, h = 448, divx = 896, divy = 1 , cycle = 10000, type = 112},
		{id = "graph-target-now", src = 9, x = 0, y = 898, w = 896, h = 448, divx = 896, divy = 1 , cycle = 10000, type = 114},
		{id = "load-progress", src = 0, x = 0, y = 0, w = 8, h = 8, angle = 0, type = 102}
	}
	skin.note = {
		id = "notes",
		note = {"note-w", "note-b", "note-w", "note-b", "note-w", "note-b", "note-w", "note-s","note-w", "note-b", "note-w", "note-b", "note-w", "note-b", "note-w", "note-s"},
		lnend = {"lne-w", "lne-b", "lne-w", "lne-b", "lne-w", "lne-b", "lne-w", "lne-s","lne-w", "lne-b", "lne-w", "lne-b", "lne-w", "lne-b", "lne-w", "lne-s"},
		lnstart = {"lns-w", "lns-b", "lns-w", "lns-b", "lns-w", "lns-b", "lns-w", "lns-s","lns-w", "lns-b", "lns-w", "lns-b", "lns-w", "lns-b", "lns-w", "lns-s"},
		lnbody = {"lnb-w", "lnb-b", "lnb-w", "lnb-b", "lnb-w", "lnb-b", "lnb-w", "lnb-s","lnb-w", "lnb-b", "lnb-w", "lnb-b", "lnb-w", "lnb-b", "lnb-w", "lnb-s"},
		lnactive = {"lna-w", "lna-b", "lna-w", "lna-b", "lna-w", "lna-b", "lna-w", "lna-s","lna-w", "lna-b", "lna-w", "lna-b", "lna-w", "lna-b", "lna-w", "lna-s"},
		hcnend = {"hcne-w", "hcne-b", "hcne-w", "hcne-b", "hcne-w", "hcne-b", "hcne-w", "hcne-s","hcne-w", "hcne-b", "hcne-w", "hcne-b", "hcne-w", "hcne-b", "hcne-w", "hcne-s"},
		hcnstart = {"hcns-w", "hcns-b", "hcns-w", "hcns-b", "hcns-w", "hcns-b", "hcns-w", "hcns-s","hcns-w", "hcns-b", "hcns-w", "hcns-b", "hcns-w", "hcns-b", "hcns-w", "hcns-s"},
		hcnbody = {"hcnb-w", "hcnb-b", "hcnb-w", "hcnb-b", "hcnb-w", "hcnb-b", "hcnb-w", "hcnb-s","hcnb-w", "hcnb-b", "hcnb-w", "hcnb-b", "hcnb-w", "hcnb-b", "hcnb-w", "hcnb-s"},
		hcnactive = {"hcna-w", "hcna-b", "hcna-w", "hcna-b", "hcna-w", "hcna-b", "hcna-w", "hcna-s","hcna-w", "hcna-b", "hcna-w", "hcna-b", "hcna-w", "hcna-b", "hcna-w", "hcna-s"},
		hcndamage = {"hcnd-w", "hcnd-b", "hcnd-w", "hcnd-b", "hcnd-w", "hcnd-b", "hcnd-w", "hcnd-s","hcnd-w", "hcnd-b", "hcnd-w", "hcnd-b", "hcnd-w", "hcnd-b", "hcnd-w", "hcnd-s"},
		hcnreactive = {"hcnr-w", "hcnr-b", "hcnr-w", "hcnr-b", "hcnr-w", "hcnr-b", "hcnr-w", "hcnr-s","hcnr-w", "hcnr-b", "hcnr-w", "hcnr-b", "hcnr-w", "hcnr-b", "hcnr-w", "hcnr-s"},
		mine = {"mine-w", "mine-b", "mine-w", "mine-b", "mine-w", "mine-b", "mine-w", "mine-s","mine-w", "mine-b", "mine-w", "mine-b", "mine-w", "mine-b", "mine-w", "mine-s"},
		hidden = {},
		processed = {},
		group = {
			{id = "section-line", offset = 3, dst = {
				{x = geometry.lanes_x, y = 357, w = 431, h = 1, r = 128, g = 128, b = 128},
			}},
			{id = "section-line", offset = 3, dst = {
				{x = geometry.lanes_x + 571, y = 357, w = 431, h = 1, r = 128, g = 128, b = 128},
			}}
		},
		time = {
			{id = "section-line", offset = 3, dst = {
				{x = geometry.lanes_x, y = 357, w = 431, h = 1, r = 64, g = 192, b = 192}
			}},
			{id = "section-line", offset = 3, dst = {
				{x = geometry.lanes_x + 571, y = 357, w = 431, h = 1, r = 64, g = 192, b = 192}
			}}
		},
		bpm = {
			{id = "section-line", offset = 3, dst = {
				{x = geometry.lanes_x + 200, y = 357, w = 431, h = 2, r = 0, g = 192, b = 0}
			}},
			{id = "section-line", offset = 3, dst = {
				{x = geometry.lanes_x + 771, y = 357, w = 431, h = 2, r = 0, g = 192, b = 0}
			}}
		},
		stop = {
			{id = "section-line", offset = 3, dst = {
				{x = geometry.lanes_x, y = 357, w = 431, h = 2, r = 192, g = 192, b = 0}
			}},
			{id = "section-line", offset = 3, dst = {
				{x = geometry.lanes_x + 571, y = 357, w = 431, h = 2, r = 192, g = 192, b = 0}
			}}
		}
	}
	skin.note.dst = {
           -- L1鍵
            {x = 552, y = 357, w = geometry.note_w_width, h = 723},
            -- L2鍵
            {x = 606, y = 357, w = geometry.note_b_width, h = 723},
            -- L3鍵
            {x = 648, y = 357, w = geometry.note_w_width, h = 723},
            -- L4鍵
            {x = 702, y = 357, w = geometry.note_b_width, h = 723},
            -- L5鍵
            {x = 744, y =357, w = geometry.note_w_width, h = 723},
            -- L6鍵
            {x = 798, y = 357, w = geometry.note_b_width, h = 723},
            -- L7鍵
            {x = 840, y = 357, w = geometry.note_w_width, h = 723},
            -- L皿
            {x = 460, y = 357, w = geometry.note_s_width, h = 723},
            -- R1鍵
            {x = 1029, y = 357, w = geometry.note_w_width, h = 723},
            -- R2鍵
            {x = 1083, y = 357, w = geometry.note_b_width, h = 723},
            -- R3鍵
            {x = 1125, y = 357, w = geometry.note_w_width, h = 723},
            -- R4鍵
            {x = 1179, y = 357, w = geometry.note_b_width, h = 723},
            -- R5鍵
            {x = 1221, y = 357, w = geometry.note_w_width, h = 723},
            -- R6鍵
            {x = 1275, y = 357, w = geometry.note_b_width, h = 723},
            -- R7鍵
            {x = 1317, y = 357, w = geometry.note_w_width, h = 723},
            -- R皿
            {x = 1371, y = 357, w = geometry.note_s_width, h = 723},
	}



	skin.gauge = {
		id = "gauge",
		nodes = {
		-- 並び順はoverclear(明),underclear(明),overclear(暗),underclear(暗),先端の色(明),先端の色(暗)
		-- アシストイージーゲージ
		"gauge-r1","gauge-p1","gauge-r2","gauge-p2","gauge-r3","gauge-p3",
		-- イージーゲージ
		"gauge-r1","gauge-g1","gauge-r2","gauge-g2","gauge-r3","gauge-g3",
		-- ノーマルゲージ
		"gauge-r1","gauge-b1","gauge-r2","gauge-b2","gauge-r3","gauge-b3",
		-- ハードゲージ(2,4,6番目はダミー？)
		"gauge-r1","gauge-p1","gauge-r2","gauge-p2","gauge-r3","gauge-p3",
		-- EXハードゲージ(2,4,6番目はダミー？)
		"gauge-y1","gauge-p1","gauge-y2","gauge-p2","gauge-y3","gauge-p3",
		-- ハザードゲージ(2,4,6番目はダミー？)
		"gauge-w1","gauge-w1","gauge-w2","gauge-w2","gauge-w3","gauge-w3"
		}
	}
	--光らせる為に改変
	skin.judge = {
		{
			id = "judge",
			index = 0,
			images = {
				{id = "judgef-pg", loop = -1, timer = 46 ,offsets = {3, 32}, dst = {
					{time = 0, x = geometry.judge_x - 120 - 18, y = 470 - 18, w = 231, h = 84},
					{time = 500}
				}},
				{id = "judgef-gr", loop = -1, timer = 46 ,offsets = {3, 32}, dst = {
					{time = 0, x = geometry.judge_x - 120 - 18, y = 470 - 18, w = 231, h = 84},
					{time = 500}
				}},
				{id = "judgef-gd", loop = -1, timer = 46 ,offsets = {3, 32}, dst = {
					{time = 0, x = geometry.judge_x - 92 - 18, y = 470 - 18, w = 186, h = 84},
					{time = 500}
				}},
				{id = "judgef-bd", loop = -1, timer = 46 ,offsets = {3, 32}, dst = {
					{time = 0, x = geometry.judge_x - 72 - 18, y = 470 - 18, w = 142, h = 84},
					{time = 500}
				}},
				{id = "judgef-pr", loop = -1, timer = 46 ,offsets = {3, 32}, dst = {
					{time = 0, x = geometry.judge_x - 92 - 18, y = 470 - 18, w = 186, h = 84},
					{time = 500}
				}},
				{id = "judgef-ms", loop = -1, timer = 46 ,offsets = {3, 32}, dst = {
					{time = 0, x = geometry.judge_x - 80 - 18, y = 470 - 18, w = 162, h = 84},
					{time = 500}
				}}
			},
			numbers = {
				{id = "judgen-pg", loop = -1, timer = 46,offsets = {32},  dst = {
					{time = 0, x = 242, y = 0, w = 56, h = 84},
					{time = 500}
				}},
				{id = "judgen-gr", loop = -1, timer = 46,offsets = {32},  dst = {
					{time = 0, x = 242, y = 0, w = 56, h = 84},
					{time = 500}
				}},
				{id = "judgen-gd", loop = -1, timer = 46,offsets = {32},  dst = {
					{time = 0, x = 242 - 45, y = 0, w = 56, h = 84},
					{time = 500}
				}},
				{id = "judgen-bd", loop = -1, timer = 46,offsets = {32},  dst = {
					{time = 0, x = 242, y = 0, w = 56, h = 84},
					{time = 500}
				}},
				{id = "judgen-pr", loop = -1, timer = 46,offsets = {32},  dst = {
					{time = 0, x = 242, y = 0, w = 56, h = 84},
					{time = 500}
				}},
				{id = "judgen-ms", loop = -1, timer = 46,offsets = {32},  dst = {
					{time = 0, x = 242, y = 0, w = 56, h = 84},
					{time = 500}
				}}
			},
			shift = true
		},
		{
			id = "judge1",
			index = 1,
			images = {
				{id = "judgef-pg", loop = -1, timer = 47 ,offsets = {3, 32}, dst = {
					{time = 0, x = geometry.judge1_x - 120 - 18, y = 470 - 18, w = 231, h = 84},
					{time = 500}
				}},
				{id = "judgef-gr", loop = -1, timer = 47 ,offsets = {3, 32}, dst = {
					{time = 0, x = geometry.judge1_x - 120 - 18, y = 470 - 18, w = 231, h = 84},
					{time = 500}
				}},
				{id = "judgef-gd", loop = -1, timer = 47 ,offsets = {3, 32}, dst = {
					{time = 0, x = geometry.judge1_x - 92 - 18, y = 470 - 18, w = 186, h = 84},
					{time = 500}
				}},
				{id = "judgef-bd", loop = -1, timer = 47 ,offsets = {3, 32}, dst = {
					{time = 0, x = geometry.judge1_x - 72 - 18, y = 470 - 18, w = 142, h = 84},
					{time = 500}
				}},
				{id = "judgef-pr", loop = -1, timer = 47 ,offsets = {3, 32}, dst = {
					{time = 0, x = geometry.judge1_x - 92 - 18, y = 470 - 18, w = 186, h = 84},
					{time = 500}
				}},
				{id = "judgef-ms", loop = -1, timer = 47 ,offsets = {3, 32}, dst = {
					{time = 0, x = geometry.judge1_x - 80 - 18, y = 470 - 18, w = 162, h = 84},
					{time = 500}
				}}
			},
			numbers = {
				{id = "judgen-pg", loop = -1, timer = 47,offsets = {32},  dst = {
					{time = 0, x = 242, y = 0, w = 56, h = 84},
					{time = 500}
				}},
				{id = "judgen-gr", loop = -1, timer = 47,offsets = {32},  dst = {
					{time = 0, x = 242, y = 0, w = 56, h = 84},
					{time = 500}
				}},
				{id = "judgen-gd", loop = -1, timer = 47,offsets = {32},  dst = {
					{time = 0, x = 242 - 45, y = 0, w = 56, h = 84},
					{time = 500}
				}},
				{id = "judgen-bd", loop = -1, timer = 47,offsets = {32},  dst = {
					{time = 0, x = 242, y = 0, w = 56, h = 84},
					{time = 500}
				}},
				{id = "judgen-pr", loop = -1, timer = 47,offsets = {32},  dst = {
					{time = 0, x = 242, y = 0, w = 56, h = 84},
					{time = 500}
				}},
				{id = "judgen-ms", loop = -1, timer = 47,offsets = {32},  dst = {
					{time = 0, x = 242, y = 0, w = 56, h = 84},
					{time = 500}
				}}
			},
			shift = true
		},

	}
--
	skin.bga = {
		id = "bga"
	}
	skin.judgegraph = {
		{id = "judgegraph", type = 1, backTexOff = 1}
	}
	skin.bpmgraph = {
		{id = "bpmgraph"}
	}
	skin.timingvisualizer = {
		{id = "timing"}
	}



	skin.destination = {


		{id = "bga-frame", dst = {
			{x = 0, y = 0, w = 1920, h = 1080}
		}},

--曲情報
		{id = "song-title", loop = 0 , dst = {
			{time = 0, x = 12, y = 992, w = geometry.song_title_w, h = 23 , a = 0},
			{time = 400 ,a = 255 },
			{time = 3400},
			{time = 8400 , x = geometry.title_move },
			{time = 11400 },
			{time = 11800 ,a = 0 },

		}},
		{id = "artist", loop = 0 , dst = {
			{time = 0, x =  12, y = 962, w = geometry.song_artist_w, h = 17 , a = 0},
			{time = 400 ,a = 255 },
			{time = 3400},
			{time = 8400 , x = geometry.artist_txt_move },
			{time = 11400 },
			{time = 11800 ,a = 0 },
		}},


		{id = "folder", loop = 400 , dst = {
			{time = 0, x =  12, y = 942, w = geometry.song_folde_w, h = 13 , a = 0},
			{time = 400 ,a = 255 },
		}},



		--BGA領域
		--KeepAspect
			{id = "bga", stretch = 3,op = {928}, dst = {
			{time = 0, x = 19, y = 569, w = 348, h = 256, a = 60},		
		}},
		{id = "bga",op = {928},dst = {
			{time = 0, x = 19, y = 569, w = 348, h = 256},		
		}},
			{id = "bga", stretch = 3,op = {928}, dst = {
			{time = 0, x = 19, y = 247, w = 348, h = 256, a = 60},		
		}},
		{id = "bga",op = {928},dst = {
			{time = 0, x = 19, y = 247, w = 348, h = 256},		
		}},
			{id = "bga", stretch = 3,op = {928}, dst = {
			{time = 0, x = 1550, y = 569, w = 348, h = 256, a = 60},		
		}},
		{id = "bga",op = {928},dst = {
			{time = 0, x = 1550, y = 569, w = 348, h = 256},		
		}},
			{id = "bga", stretch = 3,op = {928}, dst = {
			{time = 0, x = 1550, y = 247, w = 348, h = 256, a = 60},		
		}},
		{id = "bga",op = {928},dst = {
			{time = 0, x = 1550, y = 247, w = 348, h = 256},		
		}},
		--Full
			{id = "bga", stretch = 3,op = {929}, dst = {
			{time = 0, x = 19, y = 569, w = 348, h = 256},		
		}},
			{id = "bga", stretch = 3,op = {929}, dst = {
			{time = 0, x = 19, y = 247, w = 348, h = 256},		
		}},
			{id = "bga", stretch = 3,op = {929}, dst = {
			{time = 0, x = 1550, y = 569, w = 348, h = 256},		
		}},
			{id = "bga", stretch = 3,op = {929}, dst = {
			{time = 0, x = 1550, y = 247, w = 348, h = 256},		
		}},

		{id = -110, offset = 43, dst = {
			{time = 0, x = 19, y = 569, w = 348, h = 256 , a = 0 },	
		}},
		{id = -110, offset = 43, dst = {
			{time = 0, x = 19, y = 247, w = 348, h = 256 , a = 0 },	
		}},
		{id = -110, offset = 43, dst = {
			{time = 0, x = 1550, y = 569, w = 348, h = 256 , a = 0 },	
		}},
		{id = -110, offset = 43, dst = {
			{time = 0, x = 1550, y = 247, w = 348, h = 256 , a = 0 },	
		}},

		{id = "chroma_key", op = {925}, dst = {
			{time = 0, x = 19, y = 247, w = 348, h = 256 },	
		}},
		--暗転時のクロマキー用フタ
		{id = "-110", timer = 2, dst = {
			{time = 0, x = 19, y = 247, w = 348, h = 256, acc = 2},
		}},
		{id = "-110", timer = 3, dst = {
			{time = 0, x = 19, y = 247, w = 348, h = 256, acc = 2},
		}},

		{id = "lane-bg", loop = 1000, dst = {
			{time = 0, x = 456, y = 353, w = geometry.lanes_w, h = 727, a = 0},
			{time = 1000, h = 727, a = 255}
		}},
		{id = "lane-bg1", loop = 1000, dst = {
			{time = 0, x = 1025, y = 353, w = geometry.lanes_w, h = 727, a = 0},
			{time = 1000, h = 727, a = 255}
		}},


		{id = -110, loop = 1000, offset = 44, dst = {
			{time = 0, x = 456, y = 357, w = 431, h = 723, a = 0},
			{time = 1000, h = 723, a = 0}
		}},
		{id = -110, loop = 1000, offset = 44, dst = {
			{time = 0, x = 1025, y = 357, w = 431, h = 723, a = 0},
			{time = 1000, h = 723, a = 0}
		}},



--リフト
		{id = "liftcover", offset = 3 , dst = {
			{x = 460, y = -366, w = 431 , h = 723}
		}},

		{id = "lift-value", offset = 3, op = {270},dst = {
			{time = 0, x = 460 + geometry.lanes_w / 3 - 24, y = 338, w = 16, h = 16}
		}},
		{id = "lanecover-green", offset = 3, op = {270},dst = {
			{time = 0, x = 460 + geometry.lanes_w * 2 / 3 - 48, y = 338, w = 16, h = 16}
		}},
		{id = "lanecover-duration", offset = 3, op = {270},dst = {
			{time = 0, x = 460 + geometry.lanes_w * 1 - 120, y = 338, w = 16, h = 16}
		}},

		{id = "liftcover", offset = 3 , dst = {
			{x = 1029, y = -366, w = 431 , h = 723}
		}},

		{id = "lift-value", offset = 3, op = {270},dst = {
			{time = 0, x = 1020 + geometry.lanes_w / 3 - 24, y = 338, w = 16, h = 16}
		}},
		{id = "lanecover-green", offset = 3, op = {270},dst = {
			{time = 0, x = 1020 + geometry.lanes_w * 2 / 3 - 48, y = 338, w = 16, h = 16}
		}},
		{id = "lanecover-duration", offset = 3, op = {270},dst = {
			{time = 0, x = 1020 + geometry.lanes_w * 1 - 120, y = 338, w = 16, h = 16}
		}},

--リフト見えるの対策用カバー　今度いい感じのものを考える
		{id = "black", dst = {
			{x = 460, y = -366, w = 431 , h = 723}
		}},
		{id = "black", dst = {
			{x = 1020, y = -366, w = 431 , h = 723}
		}},


		{id = "background", dst = {
			{x = 0, y = 0, w = 1920, h = 1080}
		}},




--スコアグラフ

		{id = "graph-BG", op = {901},dst = {
			{x = 528 + geometry.graphside_x, y = 8, w = 402, h = 971}
		}},


		{id = "graph-frame", op = {901},dst = {
			{x = 528 + geometry.graphside_x, y = 0, w = 404, h = 1080}
		}},

		{id = "graph-A", op = {901,-222} , dst = {
			{x = 528 + geometry.graphside_x, y = 763, w = 402, h = 18}
		}},

		{id = "graph-A-pass", op = {901,222} , timer= 40 ,  dst = {
			{x = 528 + geometry.graphside_x, y = 763, w = 402, h = 18}
		}},

		{id = "graph-AA", op = {901,-221} , dst = {
			{x = 528 + geometry.graphside_x, y = 832, w = 402, h = 18}
		}},

		{id = "graph-AA-pass", op = {901,221} , timer= 40 ,  dst = {
			{x = 528 + geometry.graphside_x, y = 832, w = 402, h = 18}
		}},

		{id = "graph-AAA", op = {901,-220} , dst = {
			{x = 528 + geometry.graphside_x, y = 900, w = 402, h = 18}
		}},

		{id = "graph-AAA-pass", op = {901,220} , timer= 40 ,  dst = {
			{x = 528 + geometry.graphside_x, y = 900, w = 402, h = 18}
		}},

		--現在のランク表示
		{id = "rank_AAA", op = {901,200},dst = {
			{x = 736 + geometry.graphside_x +114, y = 293, w = 69, h = 23}
		}},
		{id = "rank_AA", op = {901,201},dst = {
			{x = 736 + geometry.graphside_x +114, y = 293, w = 69, h = 23}
		}},
		{id = "rank_A", op = {901,202},dst = {
			{x = 736 + geometry.graphside_x +114, y = 293, w = 69, h = 23}
		}},
		{id = "rank_B", op = {901,203},dst = {
			{x = 736 + geometry.graphside_x +114, y = 293, w = 69, h = 23}
		}},
		{id = "rank_C", op = {901,204},dst = {
			{x = 736 + geometry.graphside_x +114, y = 293, w = 69, h = 23}
		}},
		{id = "rank_D", op = {901,205},dst = {
			{x = 736 + geometry.graphside_x +114, y = 293, w = 69, h = 23}
		}},
		{id = "rank_E", op = {901,206},dst = {
			{x = 736 + geometry.graphside_x +114, y = 293, w = 69, h = 23}
		}},
		{id = "rank_F", op = {901,207},dst = {
			{x = 736 + geometry.graphside_x +114, y = 293, w = 69, h = 23}
		}},	

		{id = "graph-now", op = {901,920},dst = {
			{x = 590 + geometry.graphside_x, y = 360, w = 90, h = 611}
		}},

		{id = "graph-best", op = {901,920}, filter = 1 , dst = {
			{x = 703 + geometry.graphside_x, y = 360, w = 92, h = 612}
		}},
		{id = "graph-target", op = {901,920}, filter = 1 , dst = {
			{x = 817 + geometry.graphside_x, y = 360, w = 92, h = 612}
		}},

		{id = "graph-best-now", op = {901,920},dst = {
			{x = 704 + geometry.graphside_x, y = 360, w = 90, h = 611}
		}},
		{id = "graph-target-now", op = {901,920},dst = {
			{x = 818 + geometry.graphside_x, y = 360, w = 90, h = 611}
		}},


		{id = "graph-now", op = {901,921},dst = {
			{x = 734 + geometry.graphside_x, y = 360, w = 60, h = 611}
		}},

		{id = "graph-best", op = {901,921}, filter = 1 , dst = {
			{x = 661 + geometry.graphside_x, y = 360, w = 62, h = 612}
		}},
		{id = "graph-target", op = {901,921}, filter = 1 , dst = {
			{x = 590 + geometry.graphside_x, y = 360, w = 62, h = 612}
		}},

		{id = "graph-best-now", op = {901,921},dst = {
			{x = 662 + geometry.graphside_x, y = 360, w = 60, h = 611}
		}},
		{id = "graph-target-now", op = {901,921},dst = {
			{x = 591 + geometry.graphside_x, y = 360, w = 60, h = 611}
		}},


		{id = "graphvalue-upper-you", op = {901},dst = {
			{x = 718 + geometry.graphside_x +114, y = 1018, w = 22, h = 22}
		}},
		{id = "graphvalue-upper-pacemaker", op = {901},dst = {
			{x = 718 + geometry.graphside_x +114, y = 992, w = 22, h = 22}
		}},


		{id = "graphvalue-upper-you", op = {901},dst = {
			{x = 716 + geometry.graphside_x +114, y = 323, w = 22, h = 22}
		}},

		{id = "graph_OP_you", op = {901},dst = {
			{x = 542 + geometry.graphside_x, y = 290, w = 98, h = 13}
		}},

		{id = "graphvalue-rate-you", op = {901},dst = {
			{x = 544 + geometry.graphside_x, y = 304, w = 14, h = 16}
		}},
		{id = "graphvalue-rate-dot-you", op = {901},dst = {
			{x = 590 + geometry.graphside_x, y = 304, w = 14, h = 16}
		}},

		{id = "graphvalue-mybest", op = {901},dst = {
			{x = 716 + geometry.graphside_x +114, y = 256, w = 22, h = 22}
		}},
		{id = "graphvalue-diff-mybest", op = {901},dst = {
			{x = 696 + geometry.graphside_x +114, y = 226, w = 22, h = 22}
		}},
		{id = "graphvalue-rate-mybest", op = {901},dst = {
			{x = 544 + geometry.graphside_x, y = 237, w = 14, h = 16}
		}},
		{id = "graphvalue-rate-dot-mybest", op = {901},dst = {
			{x = 590 + geometry.graphside_x, y = 237, w = 14, h = 16}
		}},

		{id = "graphvalue-upper-pacemaker", op = {901},dst = {
			{x = 716 + geometry.graphside_x +114, y = 189, w = 22, h = 22}
		}},
		{id = "graph_TARGET", op = {901},dst = {
			{x = 542 + geometry.graphside_x, y = 156, w = 132, h = 13}
		}},		
		{id = "graphvalue-diff-pacemaker", op = {901},dst = {
			{x = 696 + geometry.graphside_x +114, y = 159, w = 22, h = 22}
		}},
		{id = "graphvalue-rate-pacemaker", op = {901},dst = {
			{x = 544 + geometry.graphside_x, y = 170, w = 14, h = 16}
		}},
		{id = "graphvalue-rate-dot-pacemaker", op = {901},dst = {
			{x = 590 + geometry.graphside_x, y = 170, w = 14, h = 16}
		}},



--ジャッジカウント
		{id = "judge-frame", op = {906},dst = {
			{x = 531 + geometry.judside_x, y = 4 + 94 , w = 284, h = 141}
		}},
		{id = "judge-main", op = {906},dst = {
			{x = 538 + geometry.judside_x, y = 13 + 94 , w = 257, h = 113}
		}},
		{id = "judge-count-pg",op = {906}, dst = {
			{x = 578 + geometry.judside_x, y = 109 + 94 , w = 16, h = 16}
		}},
		{id = "judge-count-gr",op = {906}, dst = {
			{x = 578 + geometry.judside_x, y = 109 - 16 * 1 + 94 , w = 16, h = 16}
		}},
		{id = "judge-count-gd",op = {906}, dst = {
			{x = 578 + geometry.judside_x, y = 109 - 16 * 2 + 94 , w = 16, h = 16}
		}},
		{id = "judge-count-bd",op = {906}, dst = {
			{x = 578 + geometry.judside_x, y = 109 - 16 * 3 + 94 , w = 16, h = 16}
		}},
		{id = "judge-count-pr",op = {906}, dst = {
			{x = 578 + geometry.judside_x, y = 109 - 16 * 4 + 94 , w = 16, h = 16}
		}},
		{id = "judge-count-fl",op = {906}, dst = {
			{x = 578 + geometry.judside_x, y = 109 - 16 * 5 + 94 , w = 16, h = 16}
		}},
		{id = "judge-count-cb",op = {906}, dst = {
			{x = 578 + geometry.judside_x, y = 109 - 16 * 6 + 94 , w = 16, h = 16}
		}},

		{id = "judge-count-remain",op = {906}, dst = {
			{x = 742 + geometry.judside_x, y = 109 - 16 * 1 + 94 , w = 16, h = 16}
		}},
		{id = "judge-count-notes",op = {906}, dst = {
			{x = 742 + geometry.judside_x, y = 109 - 16 * 2 + 94 , w = 16, h = 16 , a = 150}
		}},
		{id = "judge-count-fast",op = {906}, dst = {
			{x = 742 + geometry.judside_x, y = 109 - 16 * 4 + 94 , w = 16, h = 16}
		}},
		{id = "judge-count-slow",op = {906}, dst = {
			{x = 742 + geometry.judside_x, y = 109 - 16 * 6 + 94 , w = 16, h = 16}
		}},



		{id = "PF_N",loop =300,op = {906}, draw = function()
		local pf_total = main_state.number(110)
		local pf_early = main_state.number(410)
		local pf_late = main_state.number(411)
		return is_judge_count_enabled() and (pf_early == pf_late or pf_total == pf_early )
		end , dst =  {
			{time = 0,x = 646 + geometry.judside_x, y = 109 + 94 , w = 73, h = 16,a = 0},
			{time = 300,x = 646 + geometry.judside_x, y = 109 + 94 , w = 73, h = 16,a = 255},
		}},
		{id = "PF_F",loop =300,op = {906}, draw = function()
		local pf_total = main_state.number(110)
		local pf_early = main_state.number(410)
		local pf_late = main_state.number(411)
		return is_judge_count_enabled() and ( pf_early > pf_late and pf_late >= 1)
		end , dst =  {
			{time = 0,x = 646 + geometry.judside_x, y = 109 + 94 , w = 73, h = 16,a = 0},
			{time = 300,x = 646 + geometry.judside_x, y = 109 + 94 , w = 73, h = 16,a = 255},
		}},
		{id = "PF_S",loop =300,op = {906}, draw = function()
		local pf_total = main_state.number(110)
		local pf_early = main_state.number(410)
		local pf_late = main_state.number(411)
		return is_judge_count_enabled() and (pf_late > pf_early)
		end , dst =  {
			{time = 0,x = 646 + geometry.judside_x, y = 109 + 94 , w = 73, h = 16,a = 0},
			{time = 300,x = 646 + geometry.judside_x, y = 109 + 94 , w = 73, h = 16,a = 255},
		}},
		{id = "GR_N", loop =300,op = {906}, draw = function()
		local pf_total = main_state.number(111)
		local pf_early = main_state.number(412)
		local pf_late = main_state.number(413)
		return is_judge_count_enabled() and (pf_early == pf_late)
		end , dst =  {
			{x = 646 + geometry.judside_x, y = 109 - 16 * 1 + 94 , w = 73, h = 16,a = 0},
			{time = 300,x = 646 + geometry.judside_x, y = 109- 16 * 1 + 94 , w = 73, h = 16,a = 255},
		}},
		{id = "GR_F", loop =300,op = {906}, draw = function()
		local pf_total = main_state.number(111)
		local pf_early = main_state.number(412)
		local pf_late = main_state.number(413)
		return is_judge_count_enabled() and (pf_early > pf_late)
		end , dst =  {
			{x = 646 + geometry.judside_x, y = 109 - 16 * 1 + 94 , w = 73, h = 16,a = 0},
			{time = 300,x = 646 + geometry.judside_x, y = 109- 16 * 1 + 94 , w = 73, h = 16,a = 255},
		}},
		{id = "GR_S", loop =300,op = {906}, draw = function()
		local pf_total = main_state.number(111)
		local pf_early = main_state.number(412)
		local pf_late = main_state.number(413)
		return is_judge_count_enabled() and (pf_late > pf_early)
		end , dst =  {
			{x = 646 + geometry.judside_x, y = 109 - 16 * 1 + 94 , w = 73, h = 16,a = 0},
			{time = 300,x = 646 + geometry.judside_x, y = 109- 16 * 1 + 94 , w = 73, h = 16,a = 255},
		}},


		{id = "GD_N", loop =300,op = {906}, draw = function()
		local pf_total = main_state.number(112)
		local pf_early = main_state.number(414)
		local pf_late = main_state.number(415)
		return is_judge_count_enabled() and (pf_early == pf_late)
		end , dst =  {
			{x = 646 + geometry.judside_x, y = 109 - 16 * 2 + 94 , w = 73, h = 16,a = 0},
			{time = 300,x = 646 + geometry.judside_x, y = 109- 16 * 2 + 94 , w = 73, h = 16,a = 255},
		}},
		{id = "GD_F", loop =300,op = {906}, draw = function()
		local pf_total = main_state.number(112)
		local pf_early = main_state.number(414)
		local pf_late = main_state.number(415)
		return is_judge_count_enabled() and (pf_early > pf_late)
		end , dst =  {
			{x = 646 + geometry.judside_x, y = 109 - 16 * 2 + 94 , w = 73, h = 16,a = 0},
			{time = 300,x = 646 + geometry.judside_x, y = 109- 16 * 2 + 94 , w = 73, h = 16,a = 255},
		}},
		{id = "GD_S", loop =300,op = {906}, draw = function()
		local pf_total = main_state.number(112)
		local pf_early = main_state.number(414)
		local pf_late = main_state.number(415)
		return is_judge_count_enabled() and (pf_late > pf_early)
		end , dst =  {
			{x = 646 + geometry.judside_x, y = 109 - 16 * 2 + 94 , w = 73, h = 16,a = 0},
			{time = 300,x = 646 + geometry.judside_x, y = 109- 16 * 2 + 94 , w = 73, h = 16,a = 255},
		}},



		{id = "BD_N", loop =300,op = {906}, draw = function()
		local pf_total = main_state.number(113)
		local pf_early = main_state.number(416)
		local pf_late = main_state.number(417)
		return is_judge_count_enabled() and (pf_early == pf_late)
		end , dst =  {
			{x = 646 + geometry.judside_x, y = 109 - 16 * 3 + 94 , w = 73, h = 16,a = 0},
			{time = 300,x = 646 + geometry.judside_x, y = 109- 16 * 3 + 94 , w = 73, h = 16,a = 255},
		}},
		{id = "BD_F", loop =300,op = {906}, draw = function()
		local pf_total = main_state.number(113)
		local pf_early = main_state.number(416)
		local pf_late = main_state.number(417)
		return is_judge_count_enabled() and (pf_early > pf_late)
		end , dst =  {
			{x = 646 + geometry.judside_x, y = 109 - 16 * 3 + 94 , w = 73, h = 16,a = 0},
			{time = 300,x = 646 + geometry.judside_x, y = 109- 16 * 3 + 94 , w = 73, h = 16,a = 255},
		}},
		{id = "BD_S", loop =300,op = {906}, draw = function()
		local pf_total = main_state.number(113)
		local pf_early = main_state.number(416)
		local pf_late = main_state.number(417)
		return is_judge_count_enabled() and (pf_late > pf_early)
		end , dst =  {
			{x = 646 + geometry.judside_x, y = 109 - 16 * 3 + 94 , w = 73, h = 16,a = 0},
			{time = 300,x = 646 + geometry.judside_x, y = 109- 16 * 3 + 94 , w = 73, h = 16,a = 255},
		}},

		{id = "PR_N", loop =300,op = {906}, draw = function()
		local pf_total = main_state.number(114)
		local pf_early = main_state.number(418)
		local pf_late = main_state.number(419)
		return is_judge_count_enabled() and (pf_early == pf_late)
		end , dst =  {
			{x = 646 + geometry.judside_x, y = 109 - 16 * 4 + 94 , w = 73, h = 16,a = 0},
			{time = 300,x = 646 + geometry.judside_x, y = 109- 16 * 4 + 94 , w = 73, h = 16,a = 255},
		}},
		{id = "PR_F", loop =300,op = {906}, draw = function()
		local pf_total = main_state.number(114)
		local pf_early = main_state.number(418)
		local pf_late = main_state.number(419)
		return is_judge_count_enabled() and (pf_early > pf_late)
		end , dst =  {
			{x = 646 + geometry.judside_x, y = 109 - 16 * 4 + 94 , w = 73, h = 16,a = 0},
			{time = 300,x = 646 + geometry.judside_x, y = 109- 16 * 4 + 94 , w = 73, h = 16,a = 255},
		}},
		{id = "PR_S", loop =300,op = {906}, draw = function()
		local pf_total = main_state.number(114)
		local pf_early = main_state.number(418)
		local pf_late = main_state.number(419)
		return is_judge_count_enabled() and (pf_late > pf_early)
		end , dst =  {
			{x = 646 + geometry.judside_x, y = 109 - 16 * 4 + 94 , w = 73, h = 16,a = 0},
			{time = 300,x = 646 + geometry.judside_x, y = 109- 16 * 4 + 94 , w = 73, h = 16,a = 255},
		}},


		{id = "FL_N", loop =300,op = {906}, draw = function()
		local pf_total = main_state.number(420)
		local pf_early = main_state.number(421)
		local pf_late = main_state.number(422)
		return is_judge_count_enabled() and (pf_early == pf_late)
		end , dst =  {
			{x = 646 + geometry.judside_x, y = 109 - 16 * 5 + 94 , w = 73, h = 16,a = 0},
			{time = 300,x = 646 + geometry.judside_x, y = 109- 16 * 5 + 94 , w = 73, h = 16,a = 255},
		}},
		{id = "FL_F", loop =300,op = {906}, draw = function()
		local pf_total = main_state.number(420)
		local pf_early = main_state.number(421)
		local pf_late = main_state.number(422)
		return is_judge_count_enabled() and (pf_early > pf_late)
		end , dst =  {
			{x = 646 + geometry.judside_x, y = 109 - 16 * 5 + 94 , w = 73, h = 16,a = 0},
			{time = 300,x = 646 + geometry.judside_x, y = 109- 16 * 5 + 94 , w = 73, h = 16,a = 255},
		}},
		{id = "FL_S", loop =300,op = {906}, draw = function()
		local pf_total = main_state.number(420)
		local pf_early = main_state.number(421)
		local pf_late = main_state.number(422)
		return is_judge_count_enabled() and (pf_late > pf_early)
		end , dst =  {
			{x = 646 + geometry.judside_x, y = 109 - 16 * 5 + 94 , w = 73, h = 16,a = 0},
			{time = 300,x = 646 + geometry.judside_x, y = 109- 16 * 5 + 94 , w = 73, h = 16,a = 255},
		}},


--ジャッジカウントここまで



		{id = "minbpm", op = {177} , dst = {
			{x = geometry.minbpm_x, y = 100-11, w = 30, h = 21}
		}},
		{id = "nowbpm", dst = {
			{x = geometry.nowbpm_x, y = 100-8, w = 39, h = 25}
		}},
		{id = "maxbpm", op = {177} , dst = {
			{x = geometry.maxbpm_x, y = 100-11, w = 30, h = 21}
		}},

	
		{id = "hispeed", dst = {
			{x = 359+901, y = 87+88, w = 26, h = 24}
		}},
		{id = "hispeed-d", dst = {
			{x = 421+901, y = 87+88, w = 26, h = 24}
		}},
		{id = "ex_score", dst = {
			{x = 325+915, y = 45+88, w = 39, h = 25}
		}},

--ステージ表記

		{id = "freestage" ,loop = 500 , op = {-290}, dst = {
			{time = 200 , x = geometry.stage_x, y = 1037, w = 387, h = 32 , a = 0},
			{time = 500 , a = 255},
			{time = 3500 , a = 255},
			{time = 4500 , a = 80},	
			{time = 5500 , a = 255},			
		}},

		{id = "1st_stage" ,loop = 500 , op = {290,280}, dst = {
			{time = 200 , x = geometry.stage_x, y = 1037, w = 387, h = 32 , a = 0},
			{time = 500 , a = 255},
			{time = 3500 , a = 255},
			{time = 4500 , a = 80},	
			{time = 5500 , a = 255},			
		}},
		{id = "2nd_stage" ,loop = 500 , op = {290,281}, dst = {
			{time = 200 , x = geometry.stage_x, y = 1037, w = 387, h = 32 , a = 0},
			{time = 500 , a = 255},
			{time = 3500 , a = 255},
			{time = 4500 , a = 80},	
			{time = 5500 , a = 255},			
		}},
		{id = "3rd_stage" ,loop = 500 , op = {290,282}, dst = {
			{time = 200 , x = geometry.stage_x, y = 1037, w = 387, h = 32 , a = 0},
			{time = 500 , a = 255},
			{time = 3500 , a = 255},
			{time = 4500 , a = 80},	
			{time = 5500 , a = 255},			
		}},
		{id = "4th_stage" ,loop = 500 , op = {290,283}, dst = {
			{time = 200 , x = geometry.stage_x, y = 1037, w = 387, h = 32 , a = 0},
			{time = 500 , a = 255},
			{time = 3500 , a = 255},
			{time = 4500 , a = 80},	
			{time = 5500 , a = 255},			
		}},
		{id = "final_stage" ,loop = 500 , op = {290,289}, dst = {
			{time = 200 , x = geometry.stage_x, y = 1037, w = 387, h = 32 , a = 0},
			{time = 500 , a = 255},
			{time = 3500 , a = 255},
			{time = 4500 , a = 80},	
			{time = 5500 , a = 255},			
		}},

--キーフラッシュゾーン

		{id = "keyflash-w", timer = 101 , blend = 2 , dst = {
			{x = 160 + 384 , y = 258, w = 67, h = 96}
		}},
		{id = "keyflash-b", timer = 102 , blend = 2 ,  dst = {
			{x = 214 + 384 , y = 272, w = 56, h = 88}
		}},
		{id = "keyflash-w", timer = 103 , blend = 2 ,  dst = {
			{x = 256 + 384, y = 258, w = 67, h = 96}
		}},
		{id = "keyflash-b", timer = 104 , blend = 2 ,  dst = {
			{x = 310 + 384, y = 272, w = 56, h = 88}
		}},
		{id = "keyflash-w", timer = 105 , blend = 2 ,  dst = {
			{x = 352 + 384, y = 258, w = 67, h = 96}
		}},
		{id = "keyflash-b", timer = 106 , blend = 2 ,  dst = {
			{x = 406 + 384, y = 272, w = 56, h = 88}
		}},
		{id = "keyflash-w", timer = 107 , blend = 2 ,  dst = {
			{x = 448 + 384, y = 258, w = 67, h = 96}
		}},

		{id = "keyflash-w", timer = 111 , blend = 2 , dst = {
			{x = 1021 , y = 258, w = 67, h = 96}
		}},
		{id = "keyflash-b", timer = 112 , blend = 2 ,  dst = {
			{x = 1075 , y = 272, w = 56, h = 88}
		}},
		{id = "keyflash-w", timer = 113 , blend = 2 ,  dst = {
			{x = 1117, y = 258, w = 67, h = 96}
		}},
		{id = "keyflash-b", timer = 114 , blend = 2 ,  dst = {
			{x = 1170, y = 272, w = 56, h = 88}
		}},
		{id = "keyflash-w", timer = 115 , blend = 2 ,  dst = {
			{x = 1213, y = 258, w = 67, h = 96}
		}},
		{id = "keyflash-b", timer = 116 , blend = 2 ,  dst = {
			{x = 1266, y = 272, w = 56, h = 88}
		}},
		{id = "keyflash-w", timer = 117 , blend = 2 ,  dst = {
			{x = 1309, y = 258, w = 67, h = 96}
		}},


--難易度表記ゾーン

		{id = "diff_0",op = {150}, dst = {
			{x = 104 + 361 , y = 64 + 88, w = 223, h = 52}
		}},

		{id = "diff_1",op = {151}, dst = {
			{x = 104 + 361 , y = 64 + 88, w = 223, h = 52}
		}},
		{id = "diffnum_1",op = {151}, dst = {
			{x = 263 + 361 , y = 80 + 88, w = 19, h = 18}
		}},

		{id = "diff_2",op = {152}, dst = {
			{x = 104 + 361 , y = 64 + 88, w = 223, h = 52}
		}},
		{id = "diffnum_2",op = {152}, dst = {
			{x = 263 + 361 , y = 80 + 88, w = 19, h = 18}
		}},

		{id = "diff_3",op = {153}, dst = {
			{x = 104 + 361 , y = 64 + 88, w = 223, h = 52}
		}},
		{id = "diffnum_3",op = {153}, dst = {
			{x = 263 + 361 , y = 80 + 88, w = 19, h = 18}
		}},

		{id = "diff_4",op = {154}, dst = {
			{x = 104 + 361 , y = 64 + 88, w = 223, h = 52}
		}},
		{id = "diffnum_4",op = {154}, dst = {
			{x = 263 + 361, y = 80 + 88, w = 19, h = 18}
		}},

		{id = "diff_5",op = {155}, dst = {
			{x = 104 + 361 , y = 64 + 88, w = 223, h = 52}
		}},
		{id = "diffnum_5",op = {155}, dst = {
			{x = 263 + 361 , y = 80 + 88, w = 19, h = 18}
		}},

		{id = "jud_0",op = {184}, dst = {
			{x = 131 + 361 , y = 80 + 88, w = 87, h = 7}
		}},
		{id = "jud_1",op = {183}, dst = {
			{x = 131 + 361 , y = 80 + 88, w = 87, h = 7}
		}},
		{id = "jud_2",op = {182}, dst = {
			{x = 131 + 361 , y = 80 + 88, w = 87, h = 7}
		}},
		{id = "jud_3",op = {181}, dst = {
			{x = 131 + 361 , y = 80 + 88, w = 87, h = 7}
		}},		
		{id = "jud_4",op = {180}, dst = {
			{x = 131 + 361 , y = 80 + 88, w = 87, h = 7}
		}},

--難易度表記ゾーンここまで


		{id = "turntable",filter = 1, offset = 1, dst = {
			{time = 0, x = geometry.turntable_x + 384 , y = 278, w = 35, h = 35},
		}},
		{id = "turntable",filter = 1, offset = 1, dst = {
			{time = 0, x = geometry.turntable_x + 384 + 951 , y = 278, w = 35, h = 35},
		}},


		--1P 皿ビーム
		{id = "keybeam-s", loop= -1, timer = 100, offset = 3 ,op = {32}, dst = {
			{time = 0, x = 460, y = geometry.keybeam_y, w = 90, h = 0},
			{time = 50, x = 460, y = geometry.keybeam_y, w = 90, h = 723},
			{time = 83, x = 460, y = geometry.keybeam_y, w = 90, h = 723},
			{time = 167, x = 460 + 25, y = geometry.keybeam_y, w = 0, h = 723,a= 0},
		}},
		{id = "keybeam-s", timer = 100,loop= 50, offset = 3 ,op = {33}, dst = {
			{time = 0, x = 460, y = geometry.keybeam_y, w = 90, h = 0},
			{time = 50, x = 460, y = geometry.keybeam_y, w = 90, h = 723},
		}},
		{id = "keybeam-s", timer = 120,loop= -1, offset = 3 ,op = {33}, dst = {
			{time = 0, x = 460, y = geometry.keybeam_y, w = 90, h = 723},
			{time = 83, x = 460 + 25, y = geometry.keybeam_y, w = 0, h = 723,a = 0},
		}},

		--2P 皿ビーム
		{id = "keybeam-s", loop= -1, timer = 110, offset = 3 ,op = {32}, dst = {
			{time = 0, x = 460 + 910, y = geometry.keybeam_y, w = 90, h = 0},
			{time = 50, x = 460 + 910, y = geometry.keybeam_y, w = 90, h = 723},
			{time = 83, x = 460 + 910, y = geometry.keybeam_y, w = 90, h = 723},
			{time = 167, x = 460 + 25 + 910, y = geometry.keybeam_y, w = 0, h = 723,a= 0},
		}},
		{id = "keybeam-s", timer = 110,loop= 50, offset = 3 ,op = {33}, dst = {
			{time = 0, x = 460 + 910, y = geometry.keybeam_y, w = 90, h = 0},
			{time = 50, x = 460 + 910, y = geometry.keybeam_y, w = 90, h = 723},
		}},
		{id = "keybeam-s", timer = 130,loop= -1, offset = 3 ,op = {33}, dst = {
			{time = 0, x = 460 + 910, y = geometry.keybeam_y, w = 90, h = 723},
			{time = 83, x = 460 + 25 + 910, y = geometry.keybeam_y, w = 0, h = 723,a = 0},
		}},

		-- 1P 1-7
		{id = "keybeam-w", timer = 101 , offset = 3 , dst = {
			{time = 0, x = 552, y = geometry.keybeam_y, w = 51, h = 723},
		}},
		{id = "keybeam-w", timer = 121,loop= -1 , offset = 3 , dst = {
			{time = 0, x = 552, y = geometry.keybeam_y, w = 51, h = 723},
			{time = 83, x = 552 + 25, y = geometry.keybeam_y, w = 0, h = 723,a = 0},
		}},
		{id = "keybeam-b", timer = 102, offset = 3 , dst = {
			{time = 0, x = 606, y = geometry.keybeam_y, w = 39, h = 723},
		}},
		{id = "keybeam-b", timer = 122 , loop= -1, offset = 3 , dst = {
			{time = 0, x = 606, y = geometry.keybeam_y, w = 39, h = 723},
			{time = 83, x = 606 + 19, y = geometry.keybeam_y, w = 0, h = 723,a = 0},
		}},
		{id = "keybeam-w", timer = 103, offset = 3 , dst = {
			{time = 0, x = 648, y = geometry.keybeam_y, w = 51, h = 723},
		}},
		{id = "keybeam-w", timer = 123,loop= -1, offset = 3 , dst = {
			{time = 0, x = 648, y = geometry.keybeam_y, w = 51, h = 723},
			{time = 83, x = 648 + 25, y = geometry.keybeam_y, w = 0, h = 723,a = 0},
		}},
		{id = "keybeam-b", timer = 104, offset = 3 , dst = {
			{time = 0, x = 702, y = geometry.keybeam_y, w = 39, h = 723},
		}},
		{id = "keybeam-b", timer = 124,loop= -1, offset = 3 , dst = {
			{time = 0, x = 702, y = geometry.keybeam_y, w = 39, h = 723},
			{time = 83, x = 702 + 19, y = geometry.keybeam_y, w = 0, h = 723,a = 0},
		}},
		{id = "keybeam-w", timer = 105, offset = 3 , dst = {
			{time = 0, x = 744 + geometry.keybeamside_x, y = geometry.keybeam_y, w = 51, h = 723},
		}},
		{id = "keybeam-w", timer = 125,loop= -1, offset = 3 , dst = {
			{time = 0, x = 744, y = geometry.keybeam_y, w = 51, h = 723},
			{time = 83, x = 744 + 25, y = geometry.keybeam_y, w = 0, h = 723,a = 0},
		}},
		{id = "keybeam-b", timer = 106, offset = 3 , dst = {
			{time = 0, x = 798, y = geometry.keybeam_y, w = 39, h = 723},
		}},
		{id = "keybeam-b", timer = 126,loop= -1, offset = 3 , dst = {
			{time = 0, x = 798, y = geometry.keybeam_y, w = 39, h = 723},
			{time = 83, x = 798 + 19, y = geometry.keybeam_y, w = 0, h = 723,a = 0},
		}},
		{id = "keybeam-w", timer = 107, offset = 3 , dst = {
			{time = 0, x = 840, y = geometry.keybeam_y, w = 51, h = 723},
		}},
		{id = "keybeam-w", timer = 127,loop= -1, offset = 3 , dst = {
			{time = 0, x = 840, y = geometry.keybeam_y, w = 51, h = 723},
			{time = 83, x = 840 + 25, y = geometry.keybeam_y, w = 0, h = 723,a = 0},
		}},

		--2P 1-7
		{id = "keybeam-w", timer = 111 , offset = 3 , dst = {
			{time = 0, x = 552 + 477, y = geometry.keybeam_y, w = 51, h = 723},
		}},
		{id = "keybeam-w", timer = 131,loop= -1 , offset = 3 , dst = {
			{time = 0, x = 552 + 477, y = geometry.keybeam_y, w = 51, h = 723},
			{time = 83, x = 552 + 25 + 477, y = geometry.keybeam_y, w = 0, h = 723,a = 0},
		}},
		{id = "keybeam-b", timer = 112, offset = 3 , dst = {
			{time = 0, x = 606 + 477, y = geometry.keybeam_y, w = 39, h = 723},
		}},
		{id = "keybeam-b", timer = 132 , loop= -1, offset = 3 , dst = {
			{time = 0, x = 606 + 477, y = geometry.keybeam_y, w = 39, h = 723},
			{time = 83, x = 606 + 19 + 477, y = geometry.keybeam_y, w = 0, h = 723,a = 0},
		}},
		{id = "keybeam-w", timer = 113, offset = 3 , dst = {
			{time = 0, x = 648 + 477, y = geometry.keybeam_y, w = 51, h = 723},
		}},
		{id = "keybeam-w", timer = 133,loop= -1, offset = 3 , dst = {
			{time = 0, x = 648 + 477, y = geometry.keybeam_y, w = 51, h = 723},
			{time = 83, x = 648 + 25 + 477, y = geometry.keybeam_y, w = 0, h = 723,a = 0},
		}},
		{id = "keybeam-b", timer = 114, offset = 3 , dst = {
			{time = 0, x = 702 + 477, y = geometry.keybeam_y, w = 39, h = 723},
		}},
		{id = "keybeam-b", timer = 134,loop= -1, offset = 3 , dst = {
			{time = 0, x = 702 + 477, y = geometry.keybeam_y, w = 39, h = 723},
			{time = 83, x = 702 + 19 + 477, y = geometry.keybeam_y, w = 0, h = 723,a = 0},
		}},
		{id = "keybeam-w", timer = 115, offset = 3 , dst = {
			{time = 0, x = 744 + 477, y = geometry.keybeam_y, w = 51, h = 723},
		}},
		{id = "keybeam-w", timer = 135,loop= -1, offset = 3 , dst = {
			{time = 0, x = 744 + 477, y = geometry.keybeam_y, w = 51, h = 723},
			{time = 83, x = 744 + 25 + 477, y = geometry.keybeam_y, w = 0, h = 723,a = 0},
		}},
		{id = "keybeam-b", timer = 116, offset = 3 , dst = {
			{time = 0, x = 798 + 477, y = geometry.keybeam_y, w = 39, h = 723},
		}},
		{id = "keybeam-b", timer = 136,loop= -1, offset = 3 , dst = {
			{time = 0, x = 798 + 477, y = geometry.keybeam_y, w = 39, h = 723},
			{time = 83, x = 798 + 19 + 477, y = geometry.keybeam_y, w = 0, h = 723,a = 0},
		}},
		{id = "keybeam-w", timer = 117, offset = 3 , dst = {
			{time = 0, x = 840 + 477, y = geometry.keybeam_y, w = 51, h = 723},
		}},
		{id = "keybeam-w", timer = 137,loop= -1, offset = 3 , dst = {
			{time = 0, x = 840 + 477, y = geometry.keybeam_y, w = 51, h = 723},
			{time = 83, x = 840 + 25 + 477, y = geometry.keybeam_y, w = 0, h = 723,a = 0},
		}},

		{id = "keys", dst = {
			{x = geometry.lanes_x, y = 100, w = geometry.lanes_w, h = 80}
		}},


		{id = "glow_base", blend = 2, offset = 3 , dst = {
			{x = geometry.lanes_x, y = 357 , w = 431 , h = 59, a = 150}
		}},

		{id = "glow_base", blend = 2, offset = 3 , timer = 140 ,dst = {
			{time = 0 ,x = geometry.lanes_x, y = 357 , w = 431 , h = 59 , a = 255 },
			{time = 750 ,x = geometry.lanes_x, y = 357 , w = 431 , h = 59 , a = 0 },
			{time = 1000 ,x = geometry.lanes_x, y = 357 , w = 431 , h = 59 , a = 0 },
		}},

		{id = "glow_base", blend = 2, offset = 3 , dst = {
			{x = geometry.lanes_x + 569 , y = 357 , w = 431 , h = 59, a = 150}
		}},

		{id = "glow_base", blend = 2, offset = 3 , timer = 140 ,dst = {
			{time = 0 ,x = geometry.lanes_x + 569 , y = 357 , w = 431 , h = 59 , a = 255 },
			{time = 750 ,x = geometry.lanes_x + 569 , y = 357 , w = 431 , h = 59 , a = 0 },
			{time = 1000 ,x = geometry.lanes_x + 569 , y = 357 , w = 431 , h = 59 , a = 0 },
		}},


		--スコア差分文字

		{id = "score_diff_mybest", loop = -1, timer = 46, op = {908,940}, offset = 45 , dst = {
			{time = 0, x = geometry.diffscore1_x, y = geometry.diffscore1_y, w = 16, h = 16},
			{time = 500}
		}},
		{id = "score_diff_mybest", loop = -1,timer = 47, op = {908,940}, offset = 45 , dst = {
			{time = 0,x = geometry.diffscore2_x, y = geometry.diffscore2_y, w = 16, h = 16},
			{time = 500}
		}},

		{id = "score_diff_pacemaker", loop = -1,timer = 46, op = {909,940}, offset = 45 , dst = {
			{time = 0,x = geometry.diffscore1_x, y = geometry.diffscore1_y, w = 16, h = 16},
			{time = 500}
		}},
		{id = "score_diff_pacemaker", loop = -1,timer = 47, op = {909,940}, offset = 45 , dst = {
			{time = 0,x = geometry.diffscore2_x, y = geometry.diffscore2_y, w = 16, h = 16},
			{time = 500}
		}},

		{id = "score_diff_mybest", loop = -1, timer = 46, op = {908,941}, offset = 45 , dst = {
			{time = 0, x = geometry.diffscore1_x, y = geometry.diffscore1_y, w = 16, h = 16},
			{time = 500}
		}},
		{id = "score_diff_pacemaker", loop = -1,timer = 46, op = {909,941}, offset = 45 , dst = {
			{time = 0,x = geometry.diffscore1_x, y = geometry.diffscore1_y, w = 16, h = 16},
			{time = 500}
		}},



		--ジャッジタイミング
		{id = "judgetiming",op = {901,914} ,offsets = {47}, dst = {
			{x = 531 + geometry.graphside_x, y = 361, w = 284, h = 71}
		}},
		{id = "judge_timing",op = {901,914} ,offsets = {47}, dst = {
			{x = 731 + geometry.graphside_x, y = 379, w = 9, h = 12}
		}},





	}

	table.insert(skin.destination, {id = 15, offset = 3, dst = { {x = geometry.lanes_x, y = 357, w = 431, h = 8} }})
	table.insert(skin.destination, {id = 15, offset = 3, dst = { {x = geometry.lanes_x+569, y = 357, w = 431, h = 8} }})
	table.insert(skin.destination, {id = "notes", offset = 30})

	-- 1Pボムタイマー
	for i = 1, 8 do
		table.insert(skin.destination, {
			id = 109 + i,
			timer = timer_key_bomb(i),
			blend = 2,
			loop = -1,
			offsets = {3, 41},
			dst = {
				{ time = 0, x = geometry.lanes_center_x[i] - 150, y = 212 , w = 300, h = 300 },
				{ time = 300 }
			}
		})
	end

	-- 1P LNエフェクト
	for i = 1, 8 do
		name = i
		if i == 25 then
			name = "su"
		elseif i == 26 then
			name = "sd"
		end
		table.insert(skin.destination, {
			id = "hold-"..name,
			timer = timer_key_hold(i),
			blend = 2,
			offset = 3,
			dst = {
				{ time = 0, x = geometry.lanes_center_x[i] - 150, y = 212 , w = 300, h = 300 }
			}
		})
	end

	-- 2Pボムタイマー
	for i = 1, 8 do
		table.insert(skin.destination, {
			id = 209 + i,
			timer = timer_key_bomb1(i),
			blend = 2,
			loop = -1,
			offsets = {3, 41},
			dst = {
				{ time = 0, x = geometry.lanes_center_x[i+8] - 15, y = 212 , w = 300, h = 300 },
				{ time = 300 }
			}
		})
	end

	-- 2P LNエフェクト
	for i = 9, 16 do
		name = i
		if i == 25 then
			name = "su"
		elseif i == 26 then
			name = "sd"
		end
		table.insert(skin.destination, {
			id = "hold-"..name,
			timer = timer_key_hold1(i),
			blend = 2,
			offset = 3,
			dst = {
				{ time = 0, x = geometry.lanes_center_x[i] - 15, y = 212 , w = 300, h = 300 }
			}
		})
	end

	append_all(skin.destination, {
		{id = "lanecover", dst = {
			{x = 460, y = 1080, w = 431 , h = 723}
		}},
		{id = "lanecover", dst = {
			{x = 1029, y = 1080, w = 431 , h = 723}
		}},
	})	


	append_all(skin.destination, {
		{id = "judge"},
		{id = "judge1"},

		-- 1P側　
		{id = "judge-early", loop = -1, timer = 46 ,op = {911,1242},offsets = {3, 33}, dst = {
			{time = 0, x = geometry.judgedetail1_x, y = geometry.judgedetail1_y, w = 74, h = 18},
			{time = 500}
		}},
		{id = "judge-late", loop = -1, timer = 46 ,op = {911,1243},offsets = {3, 33}, dst = {
			{time = 0, x = geometry.judgedetail1_x, y = geometry.judgedetail1_y, w = 74, h = 18},
			{time = 500}
		}},
		{id = "judgems-1pp", loop = -1, timer = 46 ,op = {912,241},offsets = {3, 33}, dst = {
			{time = 0, x = geometry.judgedetail1_x, y = geometry.judgedetail1_y, w = 10, h = 20},
			{time = 500}
		}},
		{id = "judgems-1pg", loop = -1, timer = 46 ,op = {912,-241},offsets = {3, 33}, dst = {
			{time = 0, x = geometry.judgedetail1_x, y = geometry.judgedetail1_y, w = 10, h = 20},
			{time = 500}
		}},

		-- 2P側
		{id = "judge-early", loop = -1, timer = 47 ,op = {911,1262},offsets = {3, 33}, dst = {
			{time = 0, x = geometry.judgedetail2_x, y = geometry.judgedetail2_y, w = 74, h = 18},
			{time = 500}
		}},
		{id = "judge-late", loop = -1, timer = 47 ,op = {911,1263},offsets = {3, 33}, dst = {
			{time = 0, x = geometry.judgedetail2_x, y = geometry.judgedetail2_y, w = 74, h = 18},
			{time = 500}
		}},
		{id = "judgems-1pp", loop = -1, timer = 47 ,op = {912,261},offsets = {3, 33}, dst = {
			{time = 0, x = geometry.judgedetail2_x, y = geometry.judgedetail2_y, w = 10, h = 20},
			{time = 500}
		}},
		{id = "judgems-1pg", loop = -1, timer = 47 ,op = {912,-261},offsets = {3, 33}, dst = {
			{time = 0, x = geometry.judgedetail2_x, y = geometry.judgedetail2_y, w = 10, h = 20},
			{time = 500}
		}},

		{id = "gauge", loop = 700 , dst = {
			{time = 500, x = geometry.gauge_x + 683, y = 171, w = geometry.gauge_w, h = 33 , a = 0},
			{time = 700, x = geometry.gauge_x + 683, y = 171, w = geometry.gauge_w, h = 33 , a = 255},
		}},
		{id = "gauge",blend = 2 ,loop = 700 , draw = function()
			local GAUGETYPE = main_state.gauge_type()
			return GAUGETYPE == 4 or GAUGETYPE == 5
 		end,  dst = { 
			{time = 700, x = geometry.gauge_x + 683, y = 171, w = geometry.gauge_w, h = 33 , a = 0 },
			{time = 1200, a = 80 },
			{time = 1500, a = 0 },
		}},

		{id = "gaugevalue", dst = {
			{time = 0, x = 874, y = 211, w = 39, h = 28}
		}},
		{id = "gaugevalue-d", dst = {
			{time = 0, x = 1000, y = 210, w = 25, h = 20}
		}}
	})
	append_all(skin.destination, {





--[[		
		{id = "judgegraph", dst = {
			{time = 0, x = geometry.judgegraph_x, y = geometry.judgegraph_y, w = geometry.judgegraph_w, h = geometry.judgegraph_h}
		}},
		{id = "bpmgraph", dst = {
			{time = 0, x = geometry.judgegraph_x, y = geometry.judgegraph_y, w = geometry.judgegraph_w, h = geometry.judgegraph_h}
		}},
]]




--BGA内曲情報_読み込み



		{id = -101, loop = 400 ,op = {80,195} ,filter = 1,blend = 2, dst = {
			{time = 0, x = 680, y = 311, w = 560, h = 560, a = 0},
			{time = 400 ,a = 255 },
		}},


		{id = "genre_big", loop = 400 ,op = {80,194}, dst = {
			{time = 0, x = 954, y = 850, w = geometry.bga_w - 80, h = 25 , a = 0},
			{time = 400 ,a = 255 },
		}},

		{id = "song-title_big", loop = 400 ,op = {80,194}, dst = {
			{time = 0, x = 954, y = 738, w = 1000, h = 60 , a = 0},
			{time = 400 ,a = 255 },
		}},
		{id = "song-title_sub", loop = 400 ,op = {80,194}, dst = {
			{time = 0, x = 954, y = 688, w = geometry.bga_w - 80, h = 30 , a = 0},
			{time = 400 ,a = 255 },
		}},
		{id = "artist_big", loop = 400 ,op = {80,194}, dst = {
			{time = 0, x = 954, y = 424, w = geometry.bga_w - 80, h = 25 , a = 0},
			{time = 400 ,a = 255 },
		}},
--BGA内曲情報_読み込み完了

--[[
		{id = -101, loop = -1,op = {195} ,filter = 1,blend = 2, timer = 40, dst = {
			{time = 0, x = 954 - 299, y = 302, w = 612, h = 716, a = 255},
			{time = 400 ,a = 0 },
		}},

		{id = "BGA_titleback", loop = -1, timer = 40,op = {194}, dst = {
			{time = 0, x = 954 - 310, y = 342, w = 632, h = 632, a = 150},
			{time = 400 ,a = 0 },
		}},

		{id = -100, loop = -1 , timer = 40,op = {194,927} ,filter = 1,blend = 1, dst = {
			{time = 0, x = 954, y = 298, w = geometry.bga_w, h = geometry.bga_h, a = 80},
			{time = 400 ,a = 0 },
		}},

]]--

		{id = -101, loop = 400 ,op = {195} ,filter = 1,blend = 2,timer = 40, dst = {
			{time = 0, x = 680, y = 311, w = 560, h = 560, a = 255},
			{time = 400 ,a = 0 },
		}},


		{id = "genre_big", loop = -1, timer = 40,op = {194}, dst = {
			{time = 0, x = 954, y = 850, w = geometry.bga_w - 80, h = 25 , a = 255},
			{time = 400 ,a = 0 },
		}},

		{id = "song-title_big", loop = -1, timer = 40,op = {194}, dst = {
			{time = 0, x = 954, y = 738, w = 1000, h = 60 , a = 255},
			{time = 400 ,a = 0 },
		}},
		{id = "song-title_sub", loop = -1, timer = 40,op = {194}, dst = {
			{time = 0, x = 954, y = 688, w = geometry.bga_w - 80, h = 30 , a = 255},
			{time = 400 ,a = 0 },
		}},
		{id = "artist_big", loop = -1, timer = 40,op = {194}, dst = {
			{time = 0, x = 954, y = 424, w = geometry.bga_w - 80, h = 25 , a = 255},
			{time = 400 ,a = 0 },
		}},

		{id = "musicprogress", dst = {
			{x = geometry.progress_x, y = 997 , w = 24 , h = 36}
		}},

		{id = "musicprogress", blend = 2, timer = 140 ,dst = {
			{time = 0 ,x = geometry.progress_x, y = 997 , w = 24 , h = 36 , a = 128 },
			{time = 750 ,x = geometry.progress_x, y = 997 , w = 24 , h = 36 , a = 0 },
			{time = 1000 ,x = geometry.progress_x, y = 997 , w = 24 , h = 36 , a = 0 },
		}},

		{id = "musicprogress", dst = {
			{x = geometry.progress_x + 1044, y = 997 , w = 24 , h = 36}
		}},

		{id = "musicprogress", blend = 2, timer = 140 ,dst = {
			{time = 0 ,x = geometry.progress_x + 1044, y = 997 , w = 24 , h = 36 , a = 128 },
			{time = 750 ,x = geometry.progress_x + 1044, y = 997 , w = 24 , h = 36 , a = 0 },
			{time = 1000 ,x = geometry.progress_x + 1044, y = 997 , w = 24 , h = 36 , a = 0 },
		}},
	})


--レーンカバー数値関連
	append_all(skin.destination, play_parts.judge_count_destinations("judge-count-", geometry.judgecount_x, geometry.judgecount_y, {906}, 42))
	append_all(skin.destination, {
		{id = "lanecover-value", offset = 4, op = {270},dst = {
			{time = 0, x = 460 + geometry.lanes_w / 3 - 24, y = 1082, w = 16, h = 16}
		}},
		{id = "lanecover-green", offset = 4, op = {270},dst = {
			{time = 0, x = 460 + geometry.lanes_w * 2 / 3 - 48, y = 1082, w = 16, h = 16}
		}},
		{id = "lanecover-duration", offset = 4, op = {270},dst = {
			{time = 0, x = 460 + geometry.lanes_w * 1 - 120, y = 1082, w = 16, h = 16}
		}},
		{id = "lanecover-value", offset = 4, op = {270},dst = {
			{time = 0, x = 1029 + geometry.lanes_w / 3 - 24, y = 1082, w = 16, h = 16}
		}},
		{id = "lanecover-green", offset = 4, op = {270},dst = {
			{time = 0, x = 1029 + geometry.lanes_w * 2 / 3 - 48, y = 1082, w = 16, h = 16}
		}},
		{id = "lanecover-duration", offset = 4, op = {270},dst = {
			{time = 0, x = 1029 + geometry.lanes_w * 1 - 120, y = 1082, w = 16, h = 16}
		}},



--ロードバー
		{id = "loading", loop = 600, op = {80}, dst = {
			{time = 500, x = geometry.lanes_x + 26 , y = 477, w = 379, h = 50, a = 0},
			{time = 600, x = geometry.lanes_x + 26 , y = 477, w = 379, h = 50, a = 255},
			{time = 1600, x = geometry.lanes_x + 26 , y = 477, w = 379, h = 50, a = 100},
			{time = 2600, x = geometry.lanes_x + 26 , y = 477, w = 379, h = 50, a = 255},
		}},
		{id = "loading", loop = 600, op = {80}, dst = {
			{time = 500, x = geometry.lanes_x + 26 + 569 , y = 477, w = 379, h = 50, a = 0},
			{time = 600, x = geometry.lanes_x + 26 + 569 , y = 477, w = 379, h = 50, a = 255},
			{time = 1600, x = geometry.lanes_x + 26 + 569 , y = 477, w = 379, h = 50, a = 100},
			{time = 2600, x = geometry.lanes_x + 26 + 569 , y = 477, w = 379, h = 50, a = 255},
		}},
--準備完了
		{id = "ready", loop = -1, timer = 40, acc = 2 , dst = {
			{time = 0, x = geometry.lanes_x + 26 , y = 417, w = 379, h = 160, a = 0, acc = 2},
			{time = 250, x = geometry.lanes_x + 26 , y = 417, w = 379, h = 160, a = 255, acc = 2},
			{time = 750, a = 255, acc = 2},
			{time = 950, y = 417, a = 0, acc = 2},
			{time = 1000}
		}},
		{id = "ready", loop = -1, timer = 40, blend = 2 , dst = {
			{time = 0, x = geometry.lanes_x - 100 , y = 417, w = 579, h = 160, a = 155, acc = 2},
			{time = 250, x = geometry.lanes_x + 26 , y = 417, w = 379, h = 160, a = 0, acc = 2},
		}},
		{id = "ready", loop = -1, timer = 40, blend = 2 , dst = {
			{time = 250, x = geometry.lanes_x + 26 , y = 417, w = 379, h = 160, a = 155, acc = 2},
			{time = 650, a = 0, acc = 2},
		}},

		{id = "ready", loop = -1, timer = 40, acc = 2 , dst = {
			{time = 0, x = geometry.lanes_x + 26 + 569, y = 417, w = 379, h = 160, a = 0, acc = 2},
			{time = 250, x = geometry.lanes_x + 26 + 569, y = 417, w = 379, h = 160, a = 255, acc = 2},
			{time = 750, a = 255, acc = 2},
			{time = 950, y = 417, a = 0, acc = 2},
			{time = 1000}
		}},
		{id = "ready", loop = -1, timer = 40, blend = 2 , dst = {
			{time = 0, x = geometry.lanes_x - 100 + 569, y = 417, w = 579, h = 160, a = 155, acc = 2},
			{time = 250, x = geometry.lanes_x + 26 + 569, y = 417, w = 379, h = 160, a = 0, acc = 2},
		}},
		{id = "ready", loop = -1, timer = 40, blend = 2 , dst = {
			{time = 250, x = geometry.lanes_x + 26 + 569, y = 417, w = 379, h = 160, a = 155, acc = 2},
			{time = 650, a = 0, acc = 2},
		}},
--演奏終了_drawでフルコンの時のみ消すようにした
		{id = "finish", loop = -1, timer = 143, acc = 2 , draw = function()
			local CB = main_state.number(425)
			return CB > 0
		end,  dst = {
			{time = 500, x = geometry.lanes_x + 26 , y = 417, w = 379, h = 160, a = 0, acc = 2},
			{time = 750, x = geometry.lanes_x + 26 , y = 417, w = 379, h = 160, a = 255, acc = 2},
			{time = 1250, a = 255, acc = 2},
			{time = 1450, y = 417, a = 0, acc = 2},
			{time = 1500}
		}},
		{id = "finish", loop = -1, timer = 143, blend = 2 , draw = function()
			local CB = main_state.number(425)
			return CB > 0
		end,  dst = {
			{time = 500, x = geometry.lanes_x - 100 , y = 417, w = 579, h = 160, a = 155, acc = 2},
			{time = 750, x = geometry.lanes_x + 26 , y = 417, w = 379, h = 160, a = 0, acc = 2},
		}},
		{id = "finish", loop = -1, timer = 143, blend = 2 , draw = function()
			local CB = main_state.number(425)
			return CB > 0
		end,  dst = {
			{time = 750, x = geometry.lanes_x + 26 , y = 417, w = 379, h = 160, a = 155, acc = 2},
			{time = 1150, a = 0, acc = 2},
		}},
		{id = "finish", loop = -1, timer = 143, acc = 2 , draw = function()
			local CB = main_state.number(425)
			return CB > 0
		end,  dst = {
			{time = 500, x = geometry.lanes_x + 26 + 569 , y = 417, w = 379, h = 160, a = 0, acc = 2},
			{time = 750, x = geometry.lanes_x + 26 + 569, y = 417, w = 379, h = 160, a = 255, acc = 2},
			{time = 1250, a = 255, acc = 2},
			{time = 1450, y = 417, a = 0, acc = 2},
			{time = 1500}
		}},
		{id = "finish", loop = -1, timer = 143, blend = 2 , draw = function()
			local CB = main_state.number(425)
			return CB > 0
		end,  dst = {
			{time = 500, x = geometry.lanes_x - 100 + 569, y = 417, w = 579, h = 160, a = 155, acc = 2},
			{time = 750, x = geometry.lanes_x + 26 + 569, y = 417, w = 379, h = 160, a = 0, acc = 2},
		}},
		{id = "finish", loop = -1, timer = 143, blend = 2 , draw = function()
			local CB = main_state.number(425)
			return CB > 0
		end,  dst = {
			{time = 750, x = geometry.lanes_x + 26 + 569, y = 417, w = 379, h = 160, a = 155, acc = 2},
			{time = 1150, a = 0, acc = 2},
		}},


--フルコン
		{id = "FC-header1", loop = -1, timer = 48,filter = 1, dst = {
			{time = 516, x = -108 + geometry.fullcomboside_x, y = 674, w = 325, h = 69 , a = 0},
			{time = 683, x = 27 + geometry.fullcomboside_x, a = 255},
			{time = 850, x = 34 + geometry.fullcomboside_x, a = 255},
			{time = 1150, x = 49 + geometry.fullcomboside_x, a = 255},
			{time = 1683, x = 75 + geometry.fullcomboside_x, a = 255},
			{time = 1850, x = 336 + geometry.fullcomboside_x, a = 0},
		}},

		{id = "FC-header2", loop = -1, timer = 48,filter = 1, dst = {
			{time = 516, x = 261 + geometry.fullcomboside_x, y = 620, w = 411, h = 69 , a = 0},
			{time = 683, x = 126 + geometry.fullcomboside_x, a = 255},
			{time = 850, x = 118 + geometry.fullcomboside_x, a = 255},
			{time = 1150, x = 103 + geometry.fullcomboside_x, a = 255},
			{time = 1683, x = 78 + geometry.fullcomboside_x, a = 255},
			{time = 1850, x = -186 + geometry.fullcomboside_x, a = 0},
		}},

		{id = "FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 33, x = 123 + geometry.fullcomboside_x, y = 428, w = 3, h = -71 },
			{time = 133, y = 900, h = -520 },
			{time = 266, y = 1530, h = -520 },
		}},
		{id = "FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 33, x = 249 + geometry.fullcomboside_x, y = 375, w = 3, h = -18 },
			{time = 383, x = 249 + geometry.fullcomboside_x, y = 906, h = -520 },
			{time = 833, x = 249 + geometry.fullcomboside_x, y = 1587, h = -521 },
		}},
		{id = "FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 33, x = 289 + geometry.fullcomboside_x, y = 389, w = 3, h = -32 },
			{time = 216, y = 888, h = -520 },
			{time = 466, y = 1568, h = -521 },
		}},
		{id = "FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 83, x = 199 + geometry.fullcomboside_x, y = 441, w = 3, h = -84 },
			{time = 166, y = 972, h = -520 },
			{time = 250, y = 1503, h = -520 },
		}},
		{id = "FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 116, x = 424 + geometry.fullcomboside_x, y = 401, w = 3, h = -44 },
			{time = 283, y = 915, h = -520 },
			{time = 500,  y = 1584, h = -521 },
		}},
		{id = "FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 183, x = 364 + geometry.fullcomboside_x, y = 453, w = 3, h = -96 },
			{time = 266, y = 980, h = -520 },
			{time = 350, y = 1505, h = -521 },
		}},
		{id = "FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 216, x = 313 + geometry.fullcomboside_x, y = 402, w = 3, h = -45 },
			{time = 383, y = 927, h = -520 },
			{time = 583, y = 1556, h = -520 },
		}},
		{id = "FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 233, x = 163 + geometry.fullcomboside_x, y = 426, w = 3, h = -69 },
			{time = 333, y = 899, h = -520 },
			{time = 466, y = 1530, h = -521 },
		}},
		{id = "FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 250, x = 108 + geometry.fullcomboside_x, y = 399, w = 3, h = -42 },
			{time = 416, y = 905, h = -520 },
			{time = 633, y = 1562, h = -521 },
		}},
		{id = "FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 400, x = 199 + geometry.fullcomboside_x, y = 387, w = 3, h = -30 },
			{time = 616, y = 900, h = -520 },
			{time = 900, y = 1571, h = -520 },
		}},
		{id = "FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 416, x = 364 + geometry.fullcomboside_x, y = 423, w = 3, h = -66 },
			{time = 516, y = 899, h = -520 },
			{time = 650,  y = 1533, h = -521 },
		}},
		{id = "FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 450, x = 477 + geometry.fullcomboside_x, y = 419, w = 3, h = -62 },
			{time = 550, y = 896, h = -520 },
			{time = 683, y = 1530, h = -521 },
		}},
		{id = "FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 450, x = 153 + geometry.fullcomboside_x, y = 377, w = 3, h = -20 },
			{time = 750, y = 881, h = -520 },
			{time = 1166, y = 1580, h = -521 },
		}},

		{id = "FC-main1", loop = -1, timer = 48,blend = 2, dst = {
			{time = 16, x = 75 + geometry.fullcomboside_x, y = 357, w = 432, h = 0, a = 255 },
			{time = 116, x = 75 + geometry.fullcomboside_x, y = 1118, w = 432, h = -761, a = 255 },
			{time = 583, x = 289 + geometry.fullcomboside_x, y = 1118, w = 3, h = -761, a = 255 },
			{time = 833, x = 289 + geometry.fullcomboside_x, y = 1118, w = 3, h = -761, a = 130 },
			{time = 1233, x = 289 + geometry.fullcomboside_x, y = 1118, w = 3, h = -761, a = 0 },
		}},
		{id = "FC-main2", loop = -1, timer = 48,blend = 2, dst = {
			{time = 16, x = 75 + geometry.fullcomboside_x, y = 1080, w = 432, h = -723, a = 0 },
			{time = 183, x = 75 + geometry.fullcomboside_x, y = 1080, w = 432, h = -723, a = 255 },
			{time = 333, x = 75 + geometry.fullcomboside_x, y = 1080, w = 432, h = -723, a = 255 },
			{time = 683, x = 75 + geometry.fullcomboside_x, y = 1080, w = 432, h = -723, a = 0 },
		}},
		{id = "FC-main3", loop = -1, timer = 48,blend = 2, dst = {
			{time = 33, x = -56 + geometry.fullcomboside_x, y = 245, w = 687, h = 226, a = 40 },
			{time = 133, x = -56 + geometry.fullcomboside_x, y = -97, w = 687, h = 906, a = 255 },
			{time = 516, x = -56 + geometry.fullcomboside_x, y = 27, w = 687, h = 659, a = 250 },
			{time = 833, x = -56 + geometry.fullcomboside_x, y = 131, w = 687, h = 453, a = 150 },
			{time = 1316, x = -56 + geometry.fullcomboside_x, y = 131, w = 687, h = 453, a = 0 },
		}},
		{id = "FC-main4", loop = -1, timer = 48,blend = 2, dst = {
			{time = 366, x = -72 + geometry.fullcomboside_x, y = 542, w = 723, h = 352, a = 30 },
			{time = 500, x = -72 + geometry.fullcomboside_x, y = 584, w = 723, h = 271, a = 255 },
			{time = 816, x = -72 + geometry.fullcomboside_x, y = 680, w = 723, h = 76, a = 100 },
			{time = 1050, x = -72 + geometry.fullcomboside_x, y = 680, w = 723, h = 76, a = 0 },
		}},

		{id = "FC-flash1", loop = -1, timer = 48,blend = 2, dst = {
			{time = 16, x = -312 + geometry.fullcomboside_x, y = -156, w = 1200, h = 1038, a = 255 },
			{time = 116, x = -12 + geometry.fullcomboside_x, y = 105, w = 600, h = 519, a = 255 },
			{time = 283, x = -12 + geometry.fullcomboside_x, y = 105, w = 600, h = 519, a = 0 },
			{time = 515, x = -162 + geometry.fullcomboside_x, y = -25, w = 900, h = 778, a = 0 },
			{time = 516, x = -162 + geometry.fullcomboside_x, y = -25, w = 900, h = 778, a = 255 },
			{time = 633, x = -12 + geometry.fullcomboside_x, y = 105, w = 600, h = 519, a = 255 },
			{time = 1016, x = -12 + geometry.fullcomboside_x, y = 105, w = 600, h = 519, a = 0 },
		}},
		{id = "FC-flash2", loop = -1, timer = 48,blend = 2, dst = {
			{time = 16, x = -162 + geometry.fullcomboside_x, y = -25, w = 778, h = 778, a = 0},
			{time = 116, x = -87 + geometry.fullcomboside_x, y = 47, w = 649, h = 649, a = 255 },
			{time = 283, x = 63 + geometry.fullcomboside_x, y = 173, w = 390, h = 390, a = 255 },
			{time = 283, x = 138 + geometry.fullcomboside_x, y = 240, w = 300, h = 260, a = 0 },
		}},
		{id = "FC-flash3", loop = -1, timer = 48,blend = 2, dst = {
			{time = 16, x = 42 + geometry.fullcomboside_x, y = 156, w = 480, h = 480, a = 255},
			{time = 183, x = -414 + geometry.fullcomboside_x, y = -303, w = 1395, h = 1395, a = 255 },
			{time = 350, x = -678 + geometry.fullcomboside_x, y = -564, w = 1920, h = 1920, a = 0 },
		}},

		{id = "FC-ring1", loop = -1, timer = 48,blend = 2, dst = {
			{time = 16, x = 148 + geometry.fullcomboside_x, y = 276, w = 278, h = 230, a = 255 },
			{time = 116, x = 25 + geometry.fullcomboside_x, y = 174, w = 525, h = 434, a = 255 },
			{time = 350, x = -237 + geometry.fullcomboside_x, y = -43, w = 1050, h = 867, a = 0 },
			{time = 1015, x = 4 + geometry.fullcomboside_x, y = 156, w = 552, h = 456, a = 0 },
			{time = 1016, x = 4 + geometry.fullcomboside_x, y = 156, w = 552, h = 456, a = 255 },
			{time = 1966, x = -237 + geometry.fullcomboside_x, y = -43, w = 1050, h = 867, a = 0 },
		}},
		{id = "FC-ring2", loop = -1, timer = 48,blend = 2, dst = {
			{time = 516, x = 183 + geometry.fullcomboside_x, y = 308, w = 210, h = 123, a = 255 },
			{time = 1016, x = -131 + geometry.fullcomboside_x, y = 122, w = 807, h = 474, a = 255 },
			{time = 1533, x = -291 + geometry.fullcomboside_x, y = 17, w = 1129, h = 663, a = 0 },
		}},
		{id = "FC-ring3", loop = -1, timer = 48,blend = 2, dst = {
			{time = 583, x = 223 + geometry.fullcomboside_x, y = 338, w = 135, h = 64, a = 255 },
			{time = 1083, x = -806 + geometry.fullcomboside_x, y = -267, w = 2168, h = 1047, a = 255 },
			{time = 1533, x = -914 + geometry.fullcomboside_x, y = -331, w = 2385, h = 1152, a = 0 },
		}},

--フルコン2
		{id = "FC-header1", loop = -1, timer = 48,filter = 1, dst = {
			{time = 516, x = -108 + geometry.fullcomboside2_x, y = 674, w = 325, h = 69 , a = 0},
			{time = 683, x = 27 + geometry.fullcomboside2_x, a = 255},
			{time = 850, x = 34 + geometry.fullcomboside2_x, a = 255},
			{time = 1150, x = 49 + geometry.fullcomboside2_x, a = 255},
			{time = 1683, x = 75 + geometry.fullcomboside2_x, a = 255},
			{time = 1850, x = 336 + geometry.fullcomboside2_x, a = 0},
		}},

		{id = "FC-header2", loop = -1, timer = 48,filter = 1, dst = {
			{time = 516, x = 261 + geometry.fullcomboside2_x, y = 620, w = 411, h = 69 , a = 0},
			{time = 683, x = 126 + geometry.fullcomboside2_x, a = 255},
			{time = 850, x = 118 + geometry.fullcomboside2_x, a = 255},
			{time = 1150, x = 103 + geometry.fullcomboside2_x, a = 255},
			{time = 1683, x = 78 + geometry.fullcomboside2_x, a = 255},
			{time = 1850, x = -186 + geometry.fullcomboside2_x, a = 0},
		}},

		{id = "FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 33, x = 123 + geometry.fullcomboside2_x, y = 428, w = 3, h = -71 },
			{time = 133, y = 900, h = -520 },
			{time = 266, y = 1530, h = -520 },
		}},
		{id = "FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 33, x = 249 + geometry.fullcomboside2_x, y = 375, w = 3, h = -18 },
			{time = 383, x = 249 + geometry.fullcomboside2_x, y = 906, h = -520 },
			{time = 833, x = 249 + geometry.fullcomboside2_x, y = 1587, h = -521 },
		}},
		{id = "FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 33, x = 289 + geometry.fullcomboside2_x, y = 389, w = 3, h = -32 },
			{time = 216, y = 888, h = -520 },
			{time = 466, y = 1568, h = -521 },
		}},
		{id = "FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 83, x = 199 + geometry.fullcomboside2_x, y = 441, w = 3, h = -84 },
			{time = 166, y = 972, h = -520 },
			{time = 250, y = 1503, h = -520 },
		}},
		{id = "FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 116, x = 424 + geometry.fullcomboside2_x, y = 401, w = 3, h = -44 },
			{time = 283, y = 915, h = -520 },
			{time = 500,  y = 1584, h = -521 },
		}},
		{id = "FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 183, x = 364 + geometry.fullcomboside2_x, y = 453, w = 3, h = -96 },
			{time = 266, y = 980, h = -520 },
			{time = 350, y = 1505, h = -521 },
		}},
		{id = "FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 216, x = 313 + geometry.fullcomboside2_x, y = 402, w = 3, h = -45 },
			{time = 383, y = 927, h = -520 },
			{time = 583, y = 1556, h = -520 },
		}},
		{id = "FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 233, x = 163 + geometry.fullcomboside2_x, y = 426, w = 3, h = -69 },
			{time = 333, y = 899, h = -520 },
			{time = 466, y = 1530, h = -521 },
		}},
		{id = "FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 250, x = 108 + geometry.fullcomboside2_x, y = 399, w = 3, h = -42 },
			{time = 416, y = 905, h = -520 },
			{time = 633, y = 1562, h = -521 },
		}},
		{id = "FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 400, x = 199 + geometry.fullcomboside2_x, y = 387, w = 3, h = -30 },
			{time = 616, y = 900, h = -520 },
			{time = 900, y = 1571, h = -520 },
		}},
		{id = "FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 416, x = 364 + geometry.fullcomboside2_x, y = 423, w = 3, h = -66 },
			{time = 516, y = 899, h = -520 },
			{time = 650,  y = 1533, h = -521 },
		}},
		{id = "FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 450, x = 477 + geometry.fullcomboside2_x, y = 419, w = 3, h = -62 },
			{time = 550, y = 896, h = -520 },
			{time = 683, y = 1530, h = -521 },
		}},
		{id = "FC-glow", loop = -1, timer = 48,blend = 2, dst = {
			{time = 450, x = 153 + geometry.fullcomboside2_x, y = 377, w = 3, h = -20 },
			{time = 750, y = 881, h = -520 },
			{time = 1166, y = 1580, h = -521 },
		}},

		{id = "FC-main1", loop = -1, timer = 48,blend = 2, dst = {
			{time = 16, x = 75 + geometry.fullcomboside2_x, y = 357, w = 432, h = 0, a = 255 },
			{time = 116, x = 75 + geometry.fullcomboside2_x, y = 1118, w = 432, h = -761, a = 255 },
			{time = 583, x = 289 + geometry.fullcomboside2_x, y = 1118, w = 3, h = -761, a = 255 },
			{time = 833, x = 289 + geometry.fullcomboside2_x, y = 1118, w = 3, h = -761, a = 130 },
			{time = 1233, x = 289 + geometry.fullcomboside2_x, y = 1118, w = 3, h = -761, a = 0 },
		}},
		{id = "FC-main2", loop = -1, timer = 48,blend = 2, dst = {
			{time = 16, x = 75 + geometry.fullcomboside2_x, y = 1080, w = 432, h = -723, a = 0 },
			{time = 183, x = 75 + geometry.fullcomboside2_x, y = 1080, w = 432, h = -723, a = 255 },
			{time = 333, x = 75 + geometry.fullcomboside2_x, y = 1080, w = 432, h = -723, a = 255 },
			{time = 683, x = 75 + geometry.fullcomboside2_x, y = 1080, w = 432, h = -723, a = 0 },
		}},
		{id = "FC-main3", loop = -1, timer = 48,blend = 2, dst = {
			{time = 33, x = -56 + geometry.fullcomboside2_x, y = 245, w = 687, h = 226, a = 40 },
			{time = 133, x = -56 + geometry.fullcomboside2_x, y = -97, w = 687, h = 906, a = 255 },
			{time = 516, x = -56 + geometry.fullcomboside2_x, y = 27, w = 687, h = 659, a = 250 },
			{time = 833, x = -56 + geometry.fullcomboside2_x, y = 131, w = 687, h = 453, a = 150 },
			{time = 1316, x = -56 + geometry.fullcomboside2_x, y = 131, w = 687, h = 453, a = 0 },
		}},
		{id = "FC-main4", loop = -1, timer = 48,blend = 2, dst = {
			{time = 366, x = -72 + geometry.fullcomboside2_x, y = 542, w = 723, h = 352, a = 30 },
			{time = 500, x = -72 + geometry.fullcomboside2_x, y = 584, w = 723, h = 271, a = 255 },
			{time = 816, x = -72 + geometry.fullcomboside2_x, y = 680, w = 723, h = 76, a = 100 },
			{time = 1050, x = -72 + geometry.fullcomboside2_x, y = 680, w = 723, h = 76, a = 0 },
		}},

		{id = "FC-flash1", loop = -1, timer = 48,blend = 2, dst = {
			{time = 16, x = -312 + geometry.fullcomboside2_x, y = -156, w = 1200, h = 1038, a = 255 },
			{time = 116, x = -12 + geometry.fullcomboside2_x, y = 105, w = 600, h = 519, a = 255 },
			{time = 283, x = -12 + geometry.fullcomboside2_x, y = 105, w = 600, h = 519, a = 0 },
			{time = 515, x = -162 + geometry.fullcomboside2_x, y = -25, w = 900, h = 778, a = 0 },
			{time = 516, x = -162 + geometry.fullcomboside2_x, y = -25, w = 900, h = 778, a = 255 },
			{time = 633, x = -12 + geometry.fullcomboside2_x, y = 105, w = 600, h = 519, a = 255 },
			{time = 1016, x = -12 + geometry.fullcomboside2_x, y = 105, w = 600, h = 519, a = 0 },
		}},
		{id = "FC-flash2", loop = -1, timer = 48,blend = 2, dst = {
			{time = 16, x = -162 + geometry.fullcomboside2_x, y = -25, w = 778, h = 778, a = 0},
			{time = 116, x = -87 + geometry.fullcomboside2_x, y = 47, w = 649, h = 649, a = 255 },
			{time = 283, x = 63 + geometry.fullcomboside2_x, y = 173, w = 390, h = 390, a = 255 },
			{time = 283, x = 138 + geometry.fullcomboside2_x, y = 240, w = 300, h = 260, a = 0 },
		}},
		{id = "FC-flash3", loop = -1, timer = 48,blend = 2, dst = {
			{time = 16, x = 42 + geometry.fullcomboside2_x, y = 156, w = 480, h = 480, a = 255},
			{time = 183, x = -414 + geometry.fullcomboside2_x, y = -303, w = 1395, h = 1395, a = 255 },
			{time = 350, x = -678 + geometry.fullcomboside2_x, y = -564, w = 1920, h = 1920, a = 0 },
		}},

		{id = "FC-ring1", loop = -1, timer = 48,blend = 2, dst = {
			{time = 16, x = 148 + geometry.fullcomboside2_x, y = 276, w = 278, h = 230, a = 255 },
			{time = 116, x = 25 + geometry.fullcomboside2_x, y = 174, w = 525, h = 434, a = 255 },
			{time = 350, x = -237 + geometry.fullcomboside2_x, y = -43, w = 1050, h = 867, a = 0 },
			{time = 1015, x = 4 + geometry.fullcomboside2_x, y = 156, w = 552, h = 456, a = 0 },
			{time = 1016, x = 4 + geometry.fullcomboside2_x, y = 156, w = 552, h = 456, a = 255 },
			{time = 1966, x = -237 + geometry.fullcomboside2_x, y = -43, w = 1050, h = 867, a = 0 },
		}},
		{id = "FC-ring2", loop = -1, timer = 48,blend = 2, dst = {
			{time = 516, x = 183 + geometry.fullcomboside2_x, y = 308, w = 210, h = 123, a = 255 },
			{time = 1016, x = -131 + geometry.fullcomboside2_x, y = 122, w = 807, h = 474, a = 255 },
			{time = 1533, x = -291 + geometry.fullcomboside2_x, y = 17, w = 1129, h = 663, a = 0 },
		}},
		{id = "FC-ring3", loop = -1, timer = 48,blend = 2, dst = {
			{time = 583, x = 223 + geometry.fullcomboside2_x, y = 338, w = 135, h = 64, a = 255 },
			{time = 1083, x = -806 + geometry.fullcomboside2_x, y = -267, w = 2168, h = 1047, a = 255 },
			{time = 1533, x = -914 + geometry.fullcomboside2_x, y = -331, w = 2385, h = 1152, a = 0 },
		}},


--閉店
		{id = -111, loop = -1, timer = 3, dst = {
			{time = 0, x = 0, y = 0, w = 1920, h = 1080 , a = 200},
			{time = 400, a = 0},
		}},

		{id = -110, loop = 1000, timer = 3 ,op = {931} , dst = {
			{time = 0, x = 0, y = 0, w = 1920, h = 1080 , a = 0},
			{time = 1000, a = 255},
		}},

		{id = "close_p5", loop = 1400, timer = 3 ,op = {931} , dst = {
			{time = 700, x = 331, y = 230, w = 1228, h = 691, a = 0},
			{time = 1400, a = 255},
		}},

		{id = "close_p2", loop = 1400, timer = 3 ,op = {931} , dst = {
			{time = 1100, x = 658, y = 528, w = 664, h = 85, a = 0},
			{time = 1400, a = 255},
		}},
		{id = "close_p3", loop = 1400, timer = 3 ,op = {931} , dst = {
			{time = 800, x = 76+896, y = 517, w = 0, h = 42, a = 0},
			{time = 1400,x = 76, w = 1792, a = 255},
		}},
		{id = "close_p4", loop = 1300, timer = 3 ,op = {931} , dst = {
			{time = 900, x = 663, y = 531, w = 626, h = 78, a = 0,acc = 2},
			{time = 1300,x = 663, a = 255,acc = 2},
		}},

		{id = "close_p6", loop = -1, timer = 3,blend= 2 ,op = {931} , dst = {
			{time = 800, x = 0, y = 518, w = 1874, h = 95, a = 255,acc = 2},
			{time = 1600, a = 0,acc = 2},
		}},

		{id = -110, loop = 2500, timer = 3 ,op = {931} , dst = {
			{time = 2000, x = 0, y = 0, w = 1920, h = 1080 , a = 0},
			{time = 2500, a = 255},
		}},

		--閉店(full)
		{id = "an_close1", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 0,x = 0, y = 0, w = 1920, h = 1080},
			{time = 40},
		}},
		{id = "an_close2", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 40,x = 0, y = 0, w = 1920, h = 1080},
			{time = 80},
		}},
		{id = "an_close3", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 80,x = 0, y = 0, w = 1920, h = 1080},
			{time = 120},
		}},
		{id = "an_close4", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 120,x = 0, y = 0, w = 1920, h = 1080},
			{time = 160},
		}},
		{id = "an_close5", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 160,x = 0, y = 0, w = 1920, h = 1080},
			{time = 200},
		}},
		{id = "an_close6", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 200,x = 0, y = 0, w = 1920, h = 1080},
			{time = 240},
		}},
		{id = "an_close7", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 240,x = 0, y = 0, w = 1920, h = 1080},
			{time = 280},
		}},
		{id = "an_close8", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 280,x = 0, y = 0, w = 1920, h = 1080},
			{time = 320},
		}},
		{id = "an_close9", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 320,x = 0, y = 0, w = 1920, h = 1080},
			{time = 360},
		}},
		{id = "an_close10", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 360,x = 0, y = 0, w = 1920, h = 1080},
			{time = 400},
		}},
		{id = "an_close11", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 400,x = 0, y = 0, w = 1920, h = 1080},
			{time = 440},
		}},
		{id = "an_close12", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 440,x = 0, y = 0, w = 1920, h = 1080},
			{time = 480},
		}},
		{id = "an_close13", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 480,x = 0, y = 0, w = 1920, h = 1080},
			{time = 520},
		}},
		{id = "an_close14", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 520,x = 0, y = 0, w = 1920, h = 1080},
			{time = 560},
		}},
		{id = "an_close15", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 560,x = 0, y = 0, w = 1920, h = 1080},
			{time = 600},
		}},
		{id = "an_close16", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 600,x = 0, y = 0, w = 1920, h = 1080},
			{time = 640},
		}},
		{id = "an_close17", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 640,x = 0, y = 0, w = 1920, h = 1080},
			{time = 680},
		}},
		{id = "an_close18", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 680,x = 0, y = 0, w = 1920, h = 1080},
			{time = 720},
		}},
		{id = "an_close19", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 720,x = 0, y = 0, w = 1920, h = 1080},
			{time = 760},
		}},
		{id = "an_close20", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 760,x = 0, y = 0, w = 1920, h = 1080},
			{time = 800},
		}},
		{id = "an_close21", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 800,x = 0, y = 0, w = 1920, h = 1080},
			{time = 842},
		}},
		{id = "an_close22", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 840,x = 0, y = 0, w = 1920, h = 1080},
			{time = 882},
		}},
		{id = "an_close23", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 880,x = 0, y = 0, w = 1920, h = 1080},
			{time = 922},
		}},
		{id = "an_close24", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 920,x = 0, y = 0, w = 1920, h = 1080},
			{time = 962},
		}},
		{id = "an_close25", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 960,x = 0, y = 0, w = 1920, h = 1080},
			{time = 1002},
		}},
		{id = "an_close26", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 1000,x = 0, y = 0, w = 1920, h = 1080},
			{time = 1042},
		}},
		{id = "an_close27", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 1040,x = 0, y = 0, w = 1920, h = 1080},
			{time = 1082},
		}},
		{id = "an_close28", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 1080,x = 0, y = 0, w = 1920, h = 1080},
			{time = 1122},
		}},
		{id = "an_close29", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 1120,x = 0, y = 0, w = 1920, h = 1080},
			{time = 1162},
		}},

		{id = "an_close30", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 1160,x = 0, y = 0, w = 1920, h = 1080},
			{time = 1202},
		}},
		{id = "an_close31", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 1200,x = 0, y = 0, w = 1920, h = 1080},
			{time = 1242},
		}},
		{id = "an_close32", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 1240,x = 0, y = 0, w = 1920, h = 1080},
			{time = 1282},
		}},
		{id = "an_close33", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 1280,x = 0, y = 0, w = 1920, h = 1080},
			{time = 1322},
		}},
		{id = "an_close34", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 1320,x = 0, y = 0, w = 1920, h = 1080},
			{time = 1362},
		}},
		{id = "an_close35", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 1360,x = 0, y = 0, w = 1920, h = 1080},
			{time = 1402},
		}},
		{id = "an_close36", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 1400,x = 0, y = 0, w = 1920, h = 1080},
			{time = 1442},
		}},
		{id = "an_close37", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 1440,x = 0, y = 0, w = 1920, h = 1080},
			{time = 1482},
		}},
		{id = "an_close38", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 1480,x = 0, y = 0, w = 1920, h = 1080},
			{time = 1522},
		}},
		{id = "an_close39", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 1520,x = 0, y = 0, w = 1920, h = 1080},
			{time = 1562},
		}},
		{id = "an_close40", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 1560,x = 0, y = 0, w = 1920, h = 1080},
			{time = 1602},
		}},
		{id = "an_close41", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 1600,x = 0, y = 0, w = 1920, h = 1080},
			{time = 1642},
		}},
		{id = "an_close42", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 1640,x = 0, y = 0, w = 1920, h = 1080},
			{time = 1682},
		}},
		{id = "an_close43", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 1680,x = 0, y = 0, w = 1920, h = 1080},
			{time = 1722},
		}},
		{id = "an_close44", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 1720,x = 0, y = 0, w = 1920, h = 1080},
			{time = 1762},
		}},
		{id = "an_close45", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 1760,x = 0, y = 0, w = 1920, h = 1080},
			{time = 1802},
		}},
		{id = "an_close46", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 1800,x = 0, y = 0, w = 1920, h = 1080},
			{time = 1842},
		}},
		{id = "an_close47", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 1840,x = 0, y = 0, w = 1920, h = 1080},
			{time = 1882},
		}},
		{id = "an_close48", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 1880,x = 0, y = 0, w = 1920, h = 1080},
			{time = 1922},
		}},
		{id = "an_close49", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 1920,x = 0, y = 0, w = 1920, h = 1080},
			{time = 1962},
		}},
		{id = "an_close50", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 1960,x = 0, y = 0, w = 1920, h = 1080},
			{time = 2002},
		}},
		{id = "an_close51", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 2000,x = 0, y = 0, w = 1920, h = 1080},
			{time = 2042},
		}},
		{id = "an_close52", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 2040,x = 0, y = 0, w = 1920, h = 1080},
			{time = 2082},
		}},
		{id = "an_close53", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 2080,x = 0, y = 0, w = 1920, h = 1080},
			{time = 2122},
		}},
		{id = "an_close54", filter = 1 , loop = -1,timer = 3,op = {930},dst = {
			{time = 2120,x = 0, y = 0, w = 1920, h = 1080},
			{time = 2162},
		}},
		{id = "an_close55", filter = 1 , loop = 2200,timer = 3,op = {930},dst = {
			{time = 2160,x = 0, y = 0, w = 1920, h = 1080},
			{time = 2200},
		}},


		{id = -110, loop = 500, timer = 2, dst = {
			{time = 0, x = 0, y = 0, w = 1920, h = 1080, a = 0},
			{time = 500, a = 255},
		}},
		{id = -110, loop = -1, dst = {
			{time = 0, x = 0, y = 0, w = 1920, h = 1080, a = 255},
			{time = 200, a = 0},
		}},

		{id = "shutter", loop = 600, op = {281},dst = {
			{time = 0 ,x = 0, y = 0, w = 1920, h = 1080},
			{time = 590 },
			{time = 600 , a = 0},
		}},
		{id = "shutter", loop = 600, op = {282},dst = {
			{time = 0 ,x = 0, y = 0, w = 1920, h = 1080},
			{time = 590 },
			{time = 600 , a = 0},
		}},
		{id = "shutter", loop = 600, op = {283},dst = {
			{time = 0 ,x = 0, y = 0, w = 1920, h = 1080},
			{time = 590 },
			{time = 600 , a = 0},
		}},
		{id = "shutter", loop = 600, op = {289},dst = {
			{time = 0 ,x = 0, y = 0, w = 1920, h = 1080},
			{time = 590 },
			{time = 600 , a = 0},
		}},
	})
	return skin
end

return {
	header = header,
	main = main
}
