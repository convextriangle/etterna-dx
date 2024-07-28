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
	{name = "スコアグラフ位置", item = {
		{name = "default", op = 902},
		{name = "reverse", op = 903}
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
	{name = "判定タイミング表示", item = {
		{name = "Off", op = 910},
		{name = "EARLY/LATE", op = 911},
		{name = "+-ms(TYPE-A)", op = 912},
		{name = "+-ms(TYPE-B)", op = 913},
		{name = "+-ms(TYPE-C)", op = 914}
	}},
	{name = "判定タイミング値表示(グラフ必須)", item = {
		{name = "Off", op = 915},
		{name = "On", op = 916}
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
		{name = "判定文字規格", item = {
		{name = "FullHD(FullHD用)", op = 932},
		{name = "Legacy(通常)", op = 933}
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
local function is_score_graph_disable()
	return skin_config.option["スコアグラフ"] == 900
end
local function is_score_graph_enabled()
	return skin_config.option["スコアグラフ"] == 901
end
local function is_score_graph_reverse_disable()
	return skin_config.option["スコアグラフ位置"] == 902
end
local function is_score_graph_reverse_enabled()
	return skin_config.option["スコアグラフ位置"] == 903
end
local function is_cam_off()
	return skin_config.option["手元用クロマキー"] == 924
end
local function is_cam_on()
	return skin_config.option["手元用クロマキー"] == 925
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
local function is_judge_fullhd()
	return skin_config.option["判定文字規格"] == 932
end
local function is_judge_otherres()
	return skin_config.option["判定文字規格"] == 933
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

local filepath = {
	{name = "Frame", path = "frame/SP/*", def = "Type-M" },
	{name = "Note", path = "notes/*.png"},
	{name = "Bomb", path = "bomb/*.png"},
	{name = "Truntable", path = "truntable/*.png"},
	{name = "Gauge", path = "gauge/*.png"},
	{name = "Judge", path = "judge/*.png"},
	{name = "LegacyJudge", path = "judge/legacy/*.png"},
	{name = "Laser", path = "laser/*.png"},
	{name = "Lanecover", path = "lanecover/*.png"},
	{name = "Lift", path = "lift/*.png"},
	{name = "GraphBG", path = "graph_BG/*.png"},
	{name = "glow", path = "glow/*.png"},
	{name = "ProgressBar", path = "progress/*.png"},
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
	type = 0,
	name = "EC:FN(7K:AC)",
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




local key_wbs = { 0, 1, 0, 1, 0, 1, 0, 2 }
local function get_key_wbs(i)
	return key_wbs[(i - 1) % 8 + 1]
end
local function get_key_wbss(i)
	return key_wbs[(i - 1) % 8 + 1]
end

local keybeam_order = { 1, 2, 3, 4, 5, 6, 7, 8}


--[[
-- judge fs analyzer_thanks for hakuwo
-- 判定ごとにテーブル分けしてあります。
-- それぞれには合計判定数とFAST判定数を取得するための定数が入っています。
local img_set_perfect = {total = 110, early = 410, fast = "PF_F", neutral = "PF_N", slow = "PF_S"}
local img_set_great = {total = 111, early = 412, fast = "GR_F", neutral = "GR_N", slow = "GR_S"}
local img_set_good = {total = 112, early = 414, fast = "GD_F", neutral = "GD_N", slow = "GD_S"}
local img_set_bad = {total = 113, early = 416,	fast = "BD_F", neutral = "BD_N", slow = "BD_S"}
local img_set_poor = {total = 114, early = 418, fast = "PR_F", neutral = "PR_N", slow = "PR_S"}
local img_set_miss = {total = 420, early = 421, fast = "FL_F", neutral = "FL_N", slow = "FL_S"}

-- luaファイル見た感じ関数足して問題無さそうだったので関数作っちゃいました。
-- ダメそうだったら言ってください。

local function get_judge_timing_img_id(img_set)

    local early_count = main_state.number(410)
    local total_count = main_state.number(110)

--    if (total_count == 0) then
        return img_set["neutral"]
    end
--
    local ratio = early_count / total_count
    if (ratio < 48.0) then
        return img_set["slow"]
    elseif (52.0 < ratio) then
        return img_set["fast"]
    else
        return img_set["neutral"]
    end
end

--judge fs analyzerここまで
]]--


local function main()

	local play_parts = require("play_parts")
	local skin = {}
	for k, v in pairs(header) do
		skin[k] = v
	end

	local geometry = {}
	
		if is_judge_fullhd() then
		geometry.judge_space = -38
		geometry.judgef_gr_y = 744
		geometry.judgef_gd_y = 992
		geometry.judgef_bd_y = 1116
		geometry.judgef_pr_y = 1240
		geometry.judgef_ms_y = 1364
		geometry.judgef_pg_w = 271
		geometry.judgef_gr_w = 271
		geometry.judgef_gd_w = 452
		geometry.judgef_bd_w = 364
		geometry.judgef_pr_w = 452
		geometry.judgef_ms_w = 404
		geometry.judgef_pg_h = 744
		geometry.judgef_gr_h = 248
		geometry.judgef_gd_h = 124
		geometry.judgef_bd_h = 124
		geometry.judgef_pr_h = 124
		geometry.judgef_ms_h = 124
		geometry.judgen_pg_x = 271
		geometry.judgen_gr_x = 271
		geometry.judgen_gd_x = 271
		geometry.judgen_bd_x = 271
		geometry.judgen_pr_x = 271
		geometry.judgen_ms_x = 271
		geometry.judgen_pg_y = 0
		geometry.judgen_gr_y = 744
		geometry.judgen_gd_y = 744
		geometry.judgen_bd_y = 744
		geometry.judgen_pr_y = 744
		geometry.judgen_ms_y = 744
		geometry.judgen_pg_w = 960
		geometry.judgen_gr_w = 960
		geometry.judgen_gd_w = 960
		geometry.judgen_bd_w = 960
		geometry.judgen_pr_w = 960
		geometry.judgen_ms_w = 960
		geometry.judgen_pg_h = 744
		geometry.judgen_gr_h = 124 * 2
		geometry.judgen_gd_h = 124 * 2
		geometry.judgen_bd_h = 208 * 2
		geometry.judgen_pr_h = 208 * 2
		geometry.judgen_ms_h = 208 * 2
		geometry.judgef_dst_space = 18
		geometry.judgef_pg_dst_w = 271
		geometry.judgef_gr_dst_w = 271
		geometry.judgef_gd_dst_w = 226
		geometry.judgef_bd_dst_w = 182
		geometry.judgef_pr_dst_w = 226
		geometry.judgef_ms_dst_w = 202
		geometry.judgef_dst_h = 124
		geometry.judgen_pg_dst_x = 353
		geometry.judgen_gr_dst_x = 353
		geometry.judgen_gd_dst_x = 353
		geometry.judgen_bd_dst_x = 242
		geometry.judgen_pr_dst_x = 242
		geometry.judgen_ms_dst_x = 242
		geometry.judgen_dst_w = 96
		geometry.judgen_dst_h = 124
		geometry.judge_profile = 4
	end
		if is_judge_otherres() then
		geometry.judge_space = 0
		geometry.judgef_gr_y = 505
		geometry.judgef_gd_y = 674 + 85 * 0
		geometry.judgef_bd_y = 674 + 85 * 1
		geometry.judgef_pr_y = 674 + 85 * 2
		geometry.judgef_ms_y = 674 + 85 * 3
		geometry.judgef_pg_w = 231
		geometry.judgef_gr_w = 231
		geometry.judgef_gd_w = 186 * 2
		geometry.judgef_bd_w = 142 * 2
		geometry.judgef_pr_w = 186 * 2
		geometry.judgef_ms_w = 162 * 2
		geometry.judgef_pg_h = 504
		geometry.judgef_gr_h = 168
		geometry.judgef_gd_h = 84
		geometry.judgef_bd_h = 84
		geometry.judgef_pr_h = 84
		geometry.judgef_ms_h = 84
		geometry.judgen_pg_x = 232
		geometry.judgen_gr_x = 232
		geometry.judgen_gd_x = 232
		geometry.judgen_bd_x = 232
		geometry.judgen_pr_x = 232
		geometry.judgen_ms_x = 232
		geometry.judgen_pg_y = 0
		geometry.judgen_gr_y = 505
		geometry.judgen_gd_y = 505
		geometry.judgen_bd_y = 505
		geometry.judgen_pr_y = 505
		geometry.judgen_ms_y = 505
		geometry.judgen_pg_w = 560
		geometry.judgen_gr_w = 560
		geometry.judgen_gd_w = 560
		geometry.judgen_bd_w = 560
		geometry.judgen_pr_w = 560
		geometry.judgen_ms_w = 560
		geometry.judgen_pg_h = 504
		geometry.judgen_gr_h = 84 * 2
		geometry.judgen_gd_h = 84 * 2
		geometry.judgen_bd_h = 84 * 2
		geometry.judgen_pr_h = 84 * 2
		geometry.judgen_ms_h = 84 * 2
		geometry.judgef_dst_space = 0
		geometry.judgef_pg_dst_w = 231
		geometry.judgef_gr_dst_w = 231
		geometry.judgef_gd_dst_w = 186
		geometry.judgef_bd_dst_w = 142
		geometry.judgef_pr_dst_w = 186
		geometry.judgef_ms_dst_w = 162
		geometry.judgef_dst_h = 84
		geometry.judgen_pg_dst_x = 242
		geometry.judgen_gr_dst_x = 242
		geometry.judgen_gd_dst_x = 242
		geometry.judgen_bd_dst_x = 242
		geometry.judgen_pr_dst_x = 242
		geometry.judgen_ms_dst_x = 242
		geometry.judgen_dst_w = 56
		geometry.judgen_dst_h = 84
		geometry.judge_profile = "legacy_judge"
	end

	--1P
	if is_left_side()then
			geometry.diffside_x = 0
			geometry.diffsidesrc_x = 0
			geometry.keybeamside_x = 0
			geometry.scbeamside_x = 0
			geometry.keyfrashside_x = 0

 			geometry.detailside_x = 0

			geometry.scoreside_x = 0
			geometry.hispeedside_x = 0

			geometry.turntable_x = 83
			geometry.fullcomboside_x = 0
			geometry.mainframe_x = 0
			geometry.mainframesrc_x = 0
			geometry.lanesrc_x = 0
			geometry.progress_x = 42
			geometry.lanes_x = 76
			geometry.lanes_w = 439
			geometry.lane_w_width = 51
			geometry.lane_b_width = 39
			geometry.lane_s_width = 89
			geometry.note_w_width = 51
			geometry.note_b_width = 39
			geometry.note_s_width = 89

			geometry.title_align = 0
			geometry.judge_x = 291
			geometry.judgedetail_x = 255
			geometry.judgedetail_y = 558

			geometry.diffscore_x = 532
			geometry.diffscore_y = 558

			geometry.judgecount_x = 476
			geometry.judgecount_y = 50

			geometry.keybeam_y = 357

			geometry.ready_x = 40
			geometry.title_x = 450
			geometry.gauge_x = 54
			geometry.gauge_w = 450
			geometry.gaugevalue_x = 334
			geometry.gaugeflash_x = 504

			geometry.song_title_w = 1078
			geometry.song_artist_w = 1078
			geometry.song_folde_w = 1078

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


	if is_cam_on() then
		geometry.bga_x = 979
		geometry.bga_y = 431
		geometry.bga_w = 780
		geometry.bga_h = 439
	end
	if is_cam_off() then
		geometry.bga_x = 825
		geometry.bga_y = 148
		geometry.bga_w = 1086
		geometry.bga_h = 720
	end

	--1Pグラフあり
	if is_left_side() and is_score_graph_enabled() and is_score_graph_reverse_disable() then
			geometry.timeleft = 821

			geometry.subframe_x = 498-89
			geometry.graphside_x = 0

			geometry.minbpm_x = 1054 + 144
			geometry.nowbpm_x = 1166 + 144
			geometry.maxbpm_x = 1299 + 144

			geometry.stage_x = 1030 + 144

			geometry.song_title_x = 1217 + 144
			geometry.song_artist_x = 1217 + 144
			geometry.song_folde_x = 1217 + 144

    		geometry.graph_x = geometry.lanes_x + geometry.lanes_w
    		geometry.title_x = geometry.title_x + 90
    		geometry.judgecount_x = geometry.judgecount_x + 90
 
			geometry.graph_y = 220
			geometry.graph_w = 90
			geometry.graph_h = 480
	end

	--1Pグラフあり反転
	if is_left_side() and is_score_graph_enabled() and is_score_graph_reverse_enabled() then
			geometry.timeleft = 541

			geometry.subframe_x = 263-144
			geometry.graphside_x = 1102

			geometry.minbpm_x = 1054 - 144
			geometry.nowbpm_x = 1166 - 144
			geometry.maxbpm_x = 1299 - 144

			geometry.stage_x = 1030 - 144

			geometry.song_title_x = 1217 - 144
			geometry.song_artist_x = 1217 - 144
			geometry.song_folde_x = 1217 - 144

			geometry.graph_x = geometry.lanes_x + geometry.lanes_w
			geometry.title_x = geometry.title_x + 90
			geometry.judgecount_x = geometry.judgecount_x + 90

			geometry.graph_y = 220
			geometry.graph_w = 90
			geometry.graph_h = 480
	end

	--1Pグラフなし
	if is_left_side() and is_score_graph_disable() then
			geometry.subframe_x = 263
			geometry.graphside_x = 0

			geometry.timeleft = 541

			geometry.minbpm_x = 1054
			geometry.nowbpm_x = 1166
			geometry.maxbpm_x = 1299

			geometry.stage_x = 1030

			geometry.song_title_x = 1217
			geometry.song_artist_x = 1217
			geometry.song_folde_x = 1217
	end

	--2P
	if is_right_side() then
		geometry.diffside_x = 1487
		geometry.diffsidesrc_x = 420
		geometry.keybeamside_x = 1245
		geometry.scbeamside_x = 1679
		geometry.keyfrashside_x = 1245

 		geometry.detailside_x = 574

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
		geometry.judge_x = 291 + 1337
		geometry.judgedetail_x = 1592
		geometry.judgedetail_y = 558

		geometry.diffscore_x = 1308
		geometry.diffscore_y = 558

		geometry.judgecount_x = 476
		geometry.judgecount_y = 50

		geometry.keybeam_y = 357

		geometry.ready_x = 40
		geometry.title_x = 450
		geometry.gauge_x = 54+1363+450
		geometry.gauge_w = -450
		geometry.gaugevalue_x = 334+1079
		geometry.gaugeflash_x = 1396

		geometry.song_title_w = 1078
		geometry.song_artist_w = 1078
		geometry.song_folde_w = 1078

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
	--2Pグラフあり
	if is_right_side() and is_score_graph_enabled() and is_score_graph_reverse_disable() then
			geometry.timeleft = 1017

			geometry.subframe_x = 263-671
			geometry.graphside_x = 574

			geometry.minbpm_x = 1054 -671
			geometry.nowbpm_x = 1166 -671
			geometry.maxbpm_x = 1299 -671

			geometry.stage_x = 1030 -671

			geometry.song_title_x = 1217 -671
			geometry.song_artist_x = 1217 -671
			geometry.song_folde_x = 1217 -671

			geometry.graph_x = geometry.lanes_x + geometry.lanes_w
			geometry.title_x = geometry.title_x + 90
			geometry.judgecount_x = geometry.judgecount_x + 90

			geometry.graph_y = 220
			geometry.graph_w = 90
			geometry.graph_h = 480

	end
	--2Pグラフあり反転
	if is_right_side() and is_score_graph_enabled() and is_score_graph_reverse_enabled() then
			geometry.timeleft = 1300

			geometry.subframe_x = -408 + 290
			geometry.graphside_x = -528

			geometry.minbpm_x = 383 + 290
			geometry.nowbpm_x = 495 + 290
			geometry.maxbpm_x = 628 + 290

			geometry.stage_x = 359 + 290

			geometry.song_title_x = 546 + 290
			geometry.song_artist_x = 546 + 290
			geometry.song_folde_x = 546 + 290

			geometry.graph_x = geometry.lanes_x + geometry.lanes_w
			geometry.title_x = geometry.title_x + 90
			geometry.judgecount_x = geometry.judgecount_x + 90

			geometry.graph_y = 220
			geometry.graph_w = 90
			geometry.graph_h = 480

	end
	--2Pグラフなし
	if is_right_side() and is_score_graph_disable() then
			geometry.subframe_x = 263-526
			geometry.graphside_x = 0

			geometry.timeleft = 1300

			geometry.minbpm_x = 1054-526
			geometry.nowbpm_x = 1166-526
			geometry.maxbpm_x = 1299-526

			geometry.stage_x = 1030-526

			geometry.song_title_x = 1217-526
			geometry.song_artist_x = 1217-526
			geometry.song_folde_x = 1217-526
	end






	do
		geometry.notes_x = {}
		geometry.notes_w = {}
		geometry.lanes_center_x = {}
		local x = geometry.lanes_x
		if is_left_scratch() then
			geometry.lanebg_x = geometry.lanes_x
			geometry.lanebg_w = geometry.lanes_w
			x = x + geometry.lane_s_width + 3 ;
			geometry.notes_x[8] = geometry.lanes_x
			geometry.notes_w[8] = geometry.lane_s_width
		end
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
		if is_right_scratch() then
			geometry.lanebg_x = geometry.lanes_x + geometry.lanes_w
			geometry.lanebg_w = -geometry.lanes_w
			geometry.notes_x[8] = x
			geometry.notes_w[8] = geometry.lane_s_width
		end
		for i = 1, 8 do
			geometry.lanes_center_x[i] = geometry.notes_x[i] + geometry.notes_w[i] / 2
		end
	end

	skin.source = {
		{id = 0, path = "system.png"},
		{id = "bg", path = "frame/SP/*/main.png"},
		{id = 2, path = "playbg.png"},
		{id = 3, path = "gauge/*.png"},
		{id = 4, path = "judge/*.png"},
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
		{id = 18, path = "progress/*.png"},
		{id = 19, path = "truntable/*.png"},
		{id = 20, path = "keyflash/default.png"},
		{id = 21, path = "graph_BG/*.png"},
		{id = 22, path = "lift/*.png"},
		{id = "glow", path = "glow/*.png"},
		{id = "closed", path = "close_m.png"},
		{id = "close", path = "close.png"},
		{id = "fullcombo", path = "fullcombo/*.png"},
		{id = "legacy_judge", path = "judge/legacy/*.png"},
		{id = "mv", path = "generic.mp4"},
		{id = "C_Shutter", path = "Shutter2.png"},
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
				{id = "title", path = "frame/SP/*/song.fnt"},
	}

	skin.image = {
		{id = "shutter", src = "C_Shutter", x = 0, y = 0, w = 7680, h = 5400,divx = 4 , divy = 5 , cycle = 600},
		{id = "black", src = "bg", x = 391, y = 1080, w = 8, h = 8},
		{id = "background", src = "bg", x = geometry.mainframesrc_x, y = 0, w = 535, h = 1080},

		{id = "bga_cam", src = "bg", x = 715, y = 2164, w = 1102, h = 736},		
		{id = "chroma_key", src = "cam", x = 0, y = 0, w = -1, h = -1},

		{id = "generic-BGA", src = "mv", x = 0, y = 0, w = 1280, h = 720},

		{id = "groove_flash", src = "bg", x = 0, y = 3247, w = 20, h = 20},
		{id = "sub_frame", src = "bg", x = 715, y = 1082, w = 1920, h = 1080},
		{id = "BGA_titleback", src = "bg", x = 1288, y = 0, w = 632, h = 632},
		{id = 1, src = 2, x = 0, y = 0, w = 1280, h = 720},
		{id = "ready", src = "bg", x = 546, y = 920, w = 379, h = 160},
		{id = "finish", src = "bg", x = 546, y = 758, w = 379, h = 160},
		{id = "loading", src = "bg", x = 546, y = 661, w = 379, h = 50},
		{id = 7, src = 0, x = 0, y = 0, w = 8, h = 8},
		{id = "close1", src = 8, x = 0, y = 500, w = 640, h = 240},
		{id = "close2", src = 8, x = 0, y = 740, w = 640, h = 240},

		{id = "lane-bg", src = 14, x = geometry.lanesrc_x, y = 0, w = 439, h = 727},

		{id = "graph-frame", src = "bg", x = 0, y = 1565, w = 290, h = 933},
		{id = "graph-AAA", src = "bg", x = 0, y = 2499, w = 288, h = 18},
		{id = "graph-AA", src = "bg", x = 0, y = 2518, w = 288, h = 18},
		{id = "graph-A", src = "bg", x = 0, y = 2537, w = 288, h = 18},
		{id = "graph-AAA-pass", src = "bg", x = 0, y = 2556, w = 288, h = 18},
		{id = "graph-AA-pass", src = "bg", x = 0, y = 2575, w = 288, h = 18},
		{id = "graph-A-pass", src = "bg", x = 0, y = 2594, w = 288, h = 18},
		{id = "graph-BG", src = 21, x = 0, y = 0, w = 290, h = 832},
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
		{id = "judgef-pg", src = geometry.judge_profile, x = 0, y = 0, w = geometry.judgef_pg_w, h = geometry.judgef_pg_h, divy = 6, cycle = 100},
		{id = "judgef-gr", src = geometry.judge_profile, x = 0, y = geometry.judgef_gr_y, w = geometry.judgef_gr_w, h = geometry.judgef_gr_h, divy = 2, cycle = 60},
		{id = "judgef-gd", src = geometry.judge_profile, x = 0, y = geometry.judgef_gd_y, w = geometry.judgef_gd_w, h = geometry.judgef_gd_h, divx = 2, cycle = 60},
		{id = "judgef-bd", src = geometry.judge_profile, x = 0, y = geometry.judgef_bd_y, w = geometry.judgef_bd_w, h = geometry.judgef_bd_h, divx = 2, cycle = 60},
		{id = "judgef-pr", src = geometry.judge_profile, x = 0, y = geometry.judgef_pr_y, w = geometry.judgef_pr_w, h = geometry.judgef_pr_h, divx = 2, cycle = 60},
		{id = "judgef-ms", src = geometry.judge_profile, x = 0, y = geometry.judgef_ms_y, w = geometry.judgef_ms_w, h = geometry.judgef_ms_h, divx = 2, cycle = 60},
		--timeleft
		{id = "timeleft-frame", src = "bg", x = 85, y = 2871, w = 79, h = 38 },
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
		--閉店(おもい)
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

	local function bomb_image(index, prefix, src_y, timer_func)
		local name = index
		if index == 25 then
			name = "su"
		elseif index == 26 then
			name = "sd"
		end
		return {id = prefix..name, src = 10, x = 0, y = src_y, w = 6000, h = 300, divx = 20, timer = timer_func(index), cycle = 300}
	end
	for i = 1, 8 do
		table.insert(skin.image, bomb_image(i, "bomb1-", 0, timer_key_bomb))
		table.insert(skin.image, bomb_image(i, "bomb2-", 0, timer_key_bomb))
		table.insert(skin.image, bomb_image(i, "bomb3-", 0, timer_key_bomb))
	end

	local function bomb_image(index, prefix, src_y, timer_func)
		local name = index
		if index == 25 then
			name = "su"
		elseif index == 26 then
			name = "sd"
		end
		return {id = prefix..name, src = 10, x = 0, y = src_y, w = 1500, h = 300, divx = 5, timer = timer_func(index), cycle = 80}
	end
	for i = 1, 8 do
		table.insert(skin.image, bomb_image(i, "hold-", 0, timer_key_hold))
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
	skin.value = {
		{id = "judge_timing", src = "bg", x = 297, y = 1830, w = 108, h = 24, divx = 12, divy = 2,  digit = 4, ref = 12 , align = 2},
		--BPM
		{id = "minbpm", src = "bg", x = 0, y = 1181, w = 390, h = 25, divx = 10, digit = 3, align = 3 , ref = 91},
		{id = "nowbpm", src = "bg", x = 0, y = 1181, w = 390, h = 25, divx = 10, digit = 3, align = 3 , ref = 160},
		{id = "maxbpm", src = "bg", x = 0, y = 1181, w = 390, h = 25, divx = 10, digit = 3, align = 3 , ref = 90},
		--スコアとか
		{id = "ex_score", src = "bg", x = 0, y = 1181, w = 429, h = 25, divx = 11, digit = 4, ref = 71},
		{id = "timeleft-m-", src = "bg", x = 0, y = 2820, w = 176, h = 16, divx = 11, digit = 2, ref = 163},
		{id = "timeleft-s-", src = "bg", x = 0, y = 2820, w = 176, h = 16, divx = 11, digit = 2, padding = 1, ref = 164},
		{id = "hispeed", src = "bg", x = 0, y = 1128, w = 260, h = 24, divx = 10, digit = 2, ref = 310},
		{id = "hispeed-d", src = "bg", x = 0, y = 1128, w = 260, h = 24, divx = 10, digit = 2, padding = 1, ref = 311},
		{id = "gaugevalue", src = "bg", x = 0, y = 1080, w = 390, h = 28, divx = 10, digit = 3, ref = 107},
		{id = "gaugevalue-d", src = "bg", x = 0, y = 1108, w = 250, h = 20, divx = 10, digit = 1, ref = 407},

		--残り時間
		{id = "timeleft-m", src = "bg", x = 0, y = 2658, w = 140, h = 16, divx = 10, digit = 2, ref = 163},
		{id = "timeleft-s", src = "bg", x = 0, y = 2658, w = 140, h = 16, divx = 10, digit = 2, padding = 1, ref = 164},


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
		{id = "judgen-pg", src = geometry.judge_profile, x = geometry.judgen_pg_x, y = geometry.judgen_pg_y, w = geometry.judgen_pg_w, h = geometry.judgen_pg_h, divx = 10, divy = 6, digit = 6, ref = 75, space = geometry.judge_space, cycle = 100},
		{id = "judgen-gr", src = geometry.judge_profile, x = geometry.judgen_gr_x, y = geometry.judgen_gr_y, w = geometry.judgen_gr_w, h = geometry.judgen_gr_h, divx = 10, divy = 2, digit = 6, ref = 75, space = geometry.judge_space, cycle = 60},
		{id = "judgen-gd", src = geometry.judge_profile, x = geometry.judgen_gd_x, y = geometry.judgen_gd_y, w = geometry.judgen_gd_w, h = geometry.judgen_gd_h, divx = 10, divy = 2, digit = 6, ref = 75, space = geometry.judge_space, cycle = 60},
		{id = "judgen-bd", src = geometry.judge_profile, x = geometry.judgen_bd_x, y = geometry.judgen_bd_y, w = geometry.judgen_bd_w, h = geometry.judgen_bd_h, divx = 10, divy = 2, digit = 6, ref = 75, space = geometry.judge_space, cycle = 60},
		{id = "judgen-pr", src = geometry.judge_profile, x = geometry.judgen_pr_x, y = geometry.judgen_pr_y, w = geometry.judgen_pr_w, h = geometry.judgen_pr_h, divx = 10, divy = 2, digit = 6, ref = 75, space = geometry.judge_space, cycle = 60},
		{id = "judgen-ms", src = geometry.judge_profile, x = geometry.judgen_ms_x, y = geometry.judgen_ms_y, w = geometry.judgen_ms_w, h = geometry.judgen_ms_h, divx = 10, divy = 2, digit = 6, ref = 75, space = geometry.judge_space, cycle = 60},
		--FS判定用数値
		{id = "judgems-1pp", src = "bg", x = 207, y = 3214, w = 192, h = 32, divx = 12, divy = 2, digit = 4, zeropadding = 1 , ref = 525},
		{id = "judgems-1pg", src = "bg", x = 207, y = 3247, w = 192, h = 32, divx = 12, divy = 2, digit = 4, zeropadding = 1 , ref = 525},
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
		{id = "song-title", font = 0, size = 23, align = 1,overflow = 1, ref = 12},
		{id = "artist", font = 1, size = 17, align = 1,overflow = 1, ref = 16},
		{id = "folder", font = 2, size = 13, align = 1,overflow = 1, ref = 1003},
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
		note = {"note-w", "note-b", "note-w", "note-b", "note-w", "note-b", "note-w", "note-s"},
		lnend = {"lne-w", "lne-b", "lne-w", "lne-b", "lne-w", "lne-b", "lne-w", "lne-s"},
		lnstart = {"lns-w", "lns-b", "lns-w", "lns-b", "lns-w", "lns-b", "lns-w", "lns-s"},
		lnbody = {"lnb-w", "lnb-b", "lnb-w", "lnb-b", "lnb-w", "lnb-b", "lnb-w", "lnb-s"},
		lnactive = {"lna-w", "lna-b", "lna-w", "lna-b", "lna-w", "lna-b", "lna-w", "lna-s"},
		hcnend = {"hcne-w", "hcne-b", "hcne-w", "hcne-b", "hcne-w", "hcne-b", "hcne-w", "hcne-s"},
		hcnstart = {"hcns-w", "hcns-b", "hcns-w", "hcns-b", "hcns-w", "hcns-b", "hcns-w", "hcns-s"},
		hcnbody = {"hcnb-w", "hcnb-b", "hcnb-w", "hcnb-b", "hcnb-w", "hcnb-b", "hcnb-w", "hcnb-s"},
		hcnactive = {"hcna-w", "hcna-b", "hcna-w", "hcna-b", "hcna-w", "hcna-b", "hcna-w", "hcna-s"},
		hcndamage = {"hcnd-w", "hcnd-b", "hcnd-w", "hcnd-b", "hcnd-w", "hcnd-b", "hcnd-w", "hcnd-s"},
		hcnreactive = {"hcnr-w", "hcnr-b", "hcnr-w", "hcnr-b", "hcnr-w", "hcnr-b", "hcnr-w", "hcnr-s"},
		mine = {"mine-w", "mine-b", "mine-w", "mine-b", "mine-w", "mine-b", "mine-w", "mine-s"},
		hidden = {},
		processed = {},
		group = {
			{id = "section-line", offset = 3, dst = {
				{x = geometry.lanes_x, y = 357, w = 431, h = 1, r = 128, g = 128, b = 128}
			}}
		},
		time = {
			{id = "section-line", offset = 3, dst = {
				{x = geometry.lanes_x, y = 357, w = 431, h = 1, r = 64, g = 192, b = 192}
			}}
		},
		bpm = {
			{id = "section-line", offset = 3, dst = {
				{x = geometry.lanes_x, y = 357, w = 431, h = 2, r = 0, g = 192, b = 0}
			}}
		},
		stop = {
			{id = "section-line", offset = 3, dst = {
				{x = geometry.lanes_x, y = 357, w = 431, h = 2, r = 192, g = 192, b = 0}
			}}
		}
	}
	skin.note.dst = {}
	for i = 1, 8 do
		skin.note.dst[i] = {
			x = geometry.notes_x[i],
			y = 357,
			w = geometry.notes_w[i],
			h = 723,
		}
	end
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
	skin.judge = {
		{
			id = "judge",
			index = 0,
			images = {
				{id = "judgef-pg", loop = -1, timer = 46 ,offsets = {3, 32}, dst = {
					{time = 0, x = geometry.judge_x - 120 - geometry.judgef_dst_space, y = 470 - geometry.judgef_dst_space, w = geometry.judgef_pg_dst_w, h = geometry.judgef_dst_h},
					{time = 500}
				}},
				{id = "judgef-gr", loop = -1, timer = 46 ,offsets = {3, 32}, dst = {
					{time = 0, x = geometry.judge_x - 120 - geometry.judgef_dst_space, y = 470 - geometry.judgef_dst_space, w = geometry.judgef_gr_dst_w, h = geometry.judgef_dst_h},
					{time = 500}
				}},
				{id = "judgef-gd", loop = -1, timer = 46 ,offsets = {3, 32}, dst = {
					{time = 0, x = geometry.judge_x - 92 - geometry.judgef_dst_space, y = 470 - geometry.judgef_dst_space, w = geometry.judgef_gd_dst_w, h = geometry.judgef_dst_h},
					{time = 500}
				}},
				{id = "judgef-bd", loop = -1, timer = 46 ,offsets = {3, 32}, dst = {
					{time = 0, x = geometry.judge_x - 72 - geometry.judgef_dst_space, y = 470 - geometry.judgef_dst_space, w = geometry.judgef_bd_dst_w, h = geometry.judgef_dst_h},
					{time = 500}
				}},
				{id = "judgef-pr", loop = -1, timer = 46 ,offsets = {3, 32}, dst = {
					{time = 0, x = geometry.judge_x - 92 - geometry.judgef_dst_space, y = 470 - geometry.judgef_dst_space, w = geometry.judgef_pr_dst_w, h = geometry.judgef_dst_h},
					{time = 500}
				}},
				{id = "judgef-ms", loop = -1, timer = 46 ,offsets = {3, 32}, dst = {
					{time = 0, x = geometry.judge_x - 80 - geometry.judgef_dst_space, y = 470 - geometry.judgef_dst_space, w = geometry.judgef_ms_dst_w, h = geometry.judgef_dst_h},
					{time = 500}
				}}
			},
			numbers = {
				{id = "judgen-pg", loop = -1, timer = 46,offsets = {32}, dst = {
					{time = 0, x = geometry.judgen_pg_dst_x, y = 0, w = geometry.judgen_dst_w, h = geometry.judgen_dst_h},
					{time = 500}
				}},
				{id = "judgen-gr", loop = -1, timer = 46,offsets = {32},  dst = {
					{time = 0, x = geometry.judgen_gr_dst_x, y = 0, w = geometry.judgen_dst_w, h = geometry.judgen_dst_h},
					{time = 500}
				}},
				{id = "judgen-gd", loop = -1, timer = 46,offsets = {32},  dst = {
					{time = 0, x = geometry.judgen_gd_dst_x - 45, y = 0, w = geometry.judgen_dst_w, h = geometry.judgen_dst_h},
					{time = 500}
				}},
				{id = "judgen-bd", loop = -1, timer = 46,offsets = {32},  dst = {
					{time = 0, x = geometry.judgen_bd_dst_x, y = 0, w = geometry.judgen_dst_w, h = geometry.judgen_dst_h},
					{time = 500}
				}},
				{id = "judgen-pr", loop = -1, timer = 46,offsets = {32},  dst = {
					{time = 0, x = geometry.judgen_pr_dst_x, y = 0, w = geometry.judgen_dst_w, h = geometry.judgen_dst_h},
					{time = 500}
					
					
				}},
				{id = "judgen-ms", loop = -1, timer = 46,offsets = {32},  dst = {
					{time = 0, x = geometry.judgen_ms_dst_x, y = 0, w = geometry.judgen_dst_w, h = geometry.judgen_dst_h},
					{time = 500}
				}}
			},
			shift = true
		}
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
		{id = "sub_frame", dst = {
			{x = geometry.subframe_x, y = 0, w = 1920, h = 1080}
		}},
		{id = "bga_cam",op = {925}, dst = {
			{x = geometry.subframe_x + 409 , y = 140, w = 1102, h = 736}
		}},
		{id = "chroma_key",op = {925}, dst = {
			{x = geometry.subframe_x + 418 , y = 151, w = 1084, h = 274}
		}},
		--暗転時のクロマキー用フタ
		{id = "-110", timer = 2, dst = {
			{x = geometry.subframe_x + 418 , y = 151, w = 1084, h = 274, a = 255, acc = 2},
		}},
		{id = "-110", timer = 3, dst = {
			{x = geometry.subframe_x + 418 , y = 151, w = 1084, h = 274, a = 255, acc = 2},
		}},
		--BGA領域

		--KeepAspect
		{id = "bga", stretch = 3,op = {928,924}, dst = {
			{time = 0, x = geometry.subframe_x + 416 , y = geometry.bga_y, w = geometry.bga_w, h = geometry.bga_h, a = 60},		
		}},
		{id = "bga",op = {928,924},dst = {
			{time = 0, x = geometry.subframe_x + 416 , y = geometry.bga_y, w = geometry.bga_w, h = geometry.bga_h},		
		}},
		--Full
			{id = "bga", stretch = 3,op = {929,924},  dst = {
			{time = 0, x = geometry.subframe_x + 416 , y = geometry.bga_y, w = geometry.bga_w, h = geometry.bga_h},		
		}},

			{id = "generic-BGA",timer = 41, stretch = 3,op = {41,170,924}, dst = {
			{time = 0, x = geometry.subframe_x + 416 , y = geometry.bga_y, w = geometry.bga_w, h = geometry.bga_h},		
		}},		

		{id = -110, loop = 1000, offset = 43,op = {924}, dst = {
			{time = 0, x = geometry.subframe_x + 416 , y = geometry.bga_y, w = geometry.bga_w, h = geometry.bga_h},
			{time = 1000, a = 0}
		}},

		--KeepAspect
			{id = "bga", stretch = 3,op = {928,925}, dst = {
			{time = 0, x = geometry.subframe_x + 570 , y = geometry.bga_y, w = geometry.bga_w, h = geometry.bga_h, a = 60},		
		}},
			{id = "bga",op = {928,925},dst = {
			{time = 0, x = geometry.subframe_x + 570 , y = geometry.bga_y, w = geometry.bga_w, h = geometry.bga_h},		
		}},
		--Full
			{id = "bga", stretch = 3,op = {929,925},  dst = {
			{time = 0, x = geometry.subframe_x + 570 , y = geometry.bga_y, w = geometry.bga_w, h = geometry.bga_h},		
		}},

			{id = "generic-BGA",timer = 41, stretch = 3,op = {41,170,925}, dst = {
			{time = 0, x = geometry.subframe_x + 570 , y = geometry.bga_y, w = geometry.bga_w, h = geometry.bga_h},		
		}},		

		{id = -110, loop = 1000, offset = 43,op = {925}, dst = {
			{time = 0, x = geometry.subframe_x + 570 , y = geometry.bga_y, w = geometry.bga_w, h = geometry.bga_h},
			{time = 1000, a = 0}
		}},


--スコアグラフ
		{id = "graph-BG", op = {901},dst = {
			{x = 528 + geometry.graphside_x, y = 147, w = 290, h = 832}
		}},
		{id = "graph-frame", op = {901},dst = {
			{x = 528 + geometry.graphside_x, y = 147, w = 290, h = 933}
		}},

		{id = "graph-A", op = {901,-222} , dst = {
			{x = 528 + geometry.graphside_x, y = 763, w = 288, h = 18}
		}},

		{id = "graph-A-pass", op = {901,222} , timer= 40 ,  dst = {
			{x = 528 + geometry.graphside_x, y = 763, w = 288, h = 18}
		}},

		{id = "graph-AA", op = {901,-221} , dst = {
			{x = 528 + geometry.graphside_x, y = 832, w = 288, h = 18}
		}},

		{id = "graph-AA-pass", op = {901,221} , timer= 40 ,  dst = {
			{x = 528 + geometry.graphside_x, y = 832, w = 288, h = 18}
		}},

		{id = "graph-AAA", op = {901,-220} , dst = {
			{x = 528 + geometry.graphside_x, y = 900, w = 288, h = 18}
		}},

		{id = "graph-AAA-pass", op = {901,220} , timer= 40 ,  dst = {
			{x = 528 + geometry.graphside_x, y = 900, w = 288, h = 18}
		}},

		--現在のランク表示
		{id = "rank_AAA", op = {901,200},dst = {
			{x = 736 + geometry.graphside_x, y = 293, w = 69, h = 23}
		}},
		{id = "rank_AA", op = {901,201},dst = {
			{x = 736 + geometry.graphside_x, y = 293, w = 69, h = 23}
		}},
		{id = "rank_A", op = {901,202},dst = {
			{x = 736 + geometry.graphside_x, y = 293, w = 69, h = 23}
		}},
		{id = "rank_B", op = {901,203},dst = {
			{x = 736 + geometry.graphside_x, y = 293, w = 69, h = 23}
		}},
		{id = "rank_C", op = {901,204},dst = {
			{x = 736 + geometry.graphside_x, y = 293, w = 69, h = 23}
		}},
		{id = "rank_D", op = {901,205},dst = {
			{x = 736 + geometry.graphside_x, y = 293, w = 69, h = 23}
		}},
		{id = "rank_E", op = {901,206},dst = {
			{x = 736 + geometry.graphside_x, y = 293, w = 69, h = 23}
		}},
		{id = "rank_F", op = {901,207},dst = {
			{x = 736 + geometry.graphside_x, y = 293, w = 69, h = 23}
		}},	

		{id = "graph-now", op = {901,920},dst = {
			{x = 590 + geometry.graphside_x, y = 360, w = 60, h = 611}
		}},

		{id = "graph-best", op = {901,920}, filter = 1 , dst = {
			{x = 661 + geometry.graphside_x, y = 360, w = 62, h = 612}
		}},
		{id = "graph-target", op = {901,920}, filter = 1 , dst = {
			{x = 733 + geometry.graphside_x, y = 360, w = 62, h = 612}
		}},

		{id = "graph-best-now", op = {901,920},dst = {
			{x = 662 + geometry.graphside_x, y = 360, w = 60, h = 611}
		}},
		{id = "graph-target-now", op = {901,920},dst = {
			{x = 734 + geometry.graphside_x, y = 360, w = 60, h = 611}
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
			{x = 718 + geometry.graphside_x, y = 1018, w = 22, h = 22}
		}},
		{id = "graphvalue-upper-pacemaker", op = {901},dst = {
			{x = 718 + geometry.graphside_x, y = 992, w = 22, h = 22}
		}},


		{id = "graphvalue-upper-you", op = {901},dst = {
			{x = 716 + geometry.graphside_x, y = 323, w = 22, h = 22}
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
			{x = 716 + geometry.graphside_x, y = 256, w = 22, h = 22}
		}},
		{id = "graphvalue-diff-mybest", op = {901},dst = {
			{x = 696 + geometry.graphside_x, y = 226, w = 22, h = 22}
		}},
		{id = "graphvalue-rate-mybest", op = {901},dst = {
			{x = 544 + geometry.graphside_x, y = 237, w = 14, h = 16}
		}},
		{id = "graphvalue-rate-dot-mybest", op = {901},dst = {
			{x = 590 + geometry.graphside_x, y = 237, w = 14, h = 16}
		}},

		{id = "graphvalue-upper-pacemaker", op = {901},dst = {
			{x = 716 + geometry.graphside_x, y = 189, w = 22, h = 22}
		}},
		{id = "graph_TARGET", op = {901},dst = {
			{x = 542 + geometry.graphside_x, y = 156, w = 132, h = 13}
		}},		
		{id = "graphvalue-diff-pacemaker", op = {901},dst = {
			{x = 696 + geometry.graphside_x, y = 159, w = 22, h = 22}
		}},
		{id = "graphvalue-rate-pacemaker", op = {901},dst = {
			{x = 544 + geometry.graphside_x, y = 170, w = 14, h = 16}
		}},
		{id = "graphvalue-rate-dot-pacemaker", op = {901},dst = {
			{x = 590 + geometry.graphside_x, y = 170, w = 14, h = 16}
		}},

--スコア差分文字
		{id = "score_diff_mybest",op = {908}, offset = 45 , dst = {
			{x = geometry.diffscore_x, y = geometry.diffscore_y, w = 16, h = 16}
		}},
		{id = "score_diff_pacemaker",op = {909}, offset = 45 , dst = {
			{x = geometry.diffscore_x, y = geometry.diffscore_y, w = 16, h = 16}
		}},
--ジャッジタイミング
		{id = "judgetiming",op = {901,916} ,offsets = {47}, dst = {
			{x = 531 + geometry.graphside_x, y = 361, w = 284, h = 71}
		}},
		{id = "judge_timing",op = {901,916} ,offsets = {47}, dst = {
			{x = 731 + geometry.graphside_x, y = 379, w = 9, h = 12}
		}},
--ジャッジカウント

		{id = "judge-frame", op = {906},dst = {
			{x = 531 + geometry.detailside_x, y = 4, w = 284, h = 141}
		}},
		{id = "judge-main", op = {906},dst = {
			{x = 538 + geometry.detailside_x, y = 13, w = 257, h = 113}
		}},
		{id = "judge-count-pg",op = {906}, dst = {
			{x = 578 + geometry.detailside_x, y = 109, w = 16, h = 16}
		}},
		{id = "judge-count-gr",op = {906}, dst = {
			{x = 578 + geometry.detailside_x, y = 109 - 16 * 1, w = 16, h = 16}
		}},
		{id = "judge-count-gd",op = {906}, dst = {
			{x = 578 + geometry.detailside_x, y = 109 - 16 * 2, w = 16, h = 16}
		}},
		{id = "judge-count-bd",op = {906}, dst = {
			{x = 578 + geometry.detailside_x, y = 109 - 16 * 3, w = 16, h = 16}
		}},
		{id = "judge-count-pr",op = {906}, dst = {
			{x = 578 + geometry.detailside_x, y = 109 - 16 * 4, w = 16, h = 16}
		}},
		{id = "judge-count-fl",op = {906}, dst = {
			{x = 578 + geometry.detailside_x, y = 109 - 16 * 5, w = 16, h = 16}
		}},
		{id = "judge-count-cb",op = {906}, dst = {
			{x = 578 + geometry.detailside_x, y = 109 - 16 * 6, w = 16, h = 16}
		}},

		{id = "judge-count-remain",op = {906}, dst = {
			{x = 742 + geometry.detailside_x, y = 109 - 16 * 1, w = 16, h = 16}
		}},
		{id = "judge-count-notes",op = {906}, dst = {
			{x = 742 + geometry.detailside_x, y = 109 - 16 * 2, w = 16, h = 16 , a = 150}
		}},
		{id = "judge-count-fast",op = {906}, dst = {
			{x = 742 + geometry.detailside_x, y = 109 - 16 * 4, w = 16, h = 16}
		}},
		{id = "judge-count-slow",op = {906}, dst = {
			{x = 742 + geometry.detailside_x, y = 109 - 16 * 6, w = 16, h = 16}
		}},



		{id = "PF_N",loop =300,op = {906}, draw = function()
		local pf_total = main_state.number(110)
		local pf_early = main_state.number(410)
		local pf_late = main_state.number(411)
		return is_judge_count_enabled() and (pf_early == pf_late or pf_total == pf_early )
		end , dst =  {
			{time = 0,x = 646 + geometry.detailside_x, y = 109, w = 73, h = 16,a = 0},
			{time = 300,x = 646 + geometry.detailside_x, y = 109, w = 73, h = 16,a = 255},
		}},
		{id = "PF_F",loop =300,op = {906}, draw = function()
		local pf_total = main_state.number(110)
		local pf_early = main_state.number(410)
		local pf_late = main_state.number(411)
		return is_judge_count_enabled() and ( pf_early > pf_late and pf_late >= 1)
		end , dst =  {
			{time = 0,x = 646 + geometry.detailside_x, y = 109, w = 73, h = 16,a = 0},
			{time = 300,x = 646 + geometry.detailside_x, y = 109, w = 73, h = 16,a = 255},
		}},
		{id = "PF_S",loop =300,op = {906}, draw = function()
		local pf_total = main_state.number(110)
		local pf_early = main_state.number(410)
		local pf_late = main_state.number(411)
		return is_judge_count_enabled() and (pf_late > pf_early)
		end , dst =  {
			{time = 0,x = 646 + geometry.detailside_x, y = 109, w = 73, h = 16,a = 0},
			{time = 300,x = 646 + geometry.detailside_x, y = 109, w = 73, h = 16,a = 255},
		}},
		{id = "GR_N", loop =300,op = {906}, draw = function()
		local pf_total = main_state.number(111)
		local pf_early = main_state.number(412)
		local pf_late = main_state.number(413)
		return is_judge_count_enabled() and (pf_early == pf_late)
		end , dst =  {
			{x = 646 + geometry.detailside_x, y = 109 - 16 * 1, w = 73, h = 16,a = 0},
			{time = 300,x = 646 + geometry.detailside_x, y = 109- 16 * 1, w = 73, h = 16,a = 255},
		}},
		{id = "GR_F", loop =300,op = {906}, draw = function()
		local pf_total = main_state.number(111)
		local pf_early = main_state.number(412)
		local pf_late = main_state.number(413)
		return is_judge_count_enabled() and (pf_early > pf_late)
		end , dst =  {
			{x = 646 + geometry.detailside_x, y = 109 - 16 * 1, w = 73, h = 16,a = 0},
			{time = 300,x = 646 + geometry.detailside_x, y = 109- 16 * 1, w = 73, h = 16,a = 255},
		}},
		{id = "GR_S", loop =300,op = {906}, draw = function()
		local pf_total = main_state.number(111)
		local pf_early = main_state.number(412)
		local pf_late = main_state.number(413)
		return is_judge_count_enabled() and (pf_late > pf_early)
		end , dst =  {
			{x = 646 + geometry.detailside_x, y = 109 - 16 * 1, w = 73, h = 16,a = 0},
			{time = 300,x = 646 + geometry.detailside_x, y = 109- 16 * 1, w = 73, h = 16,a = 255},
		}},


		{id = "GD_N", loop =300,op = {906}, draw = function()
		local pf_total = main_state.number(112)
		local pf_early = main_state.number(414)
		local pf_late = main_state.number(415)
		return is_judge_count_enabled() and (pf_early == pf_late)
		end , dst =  {
			{x = 646 + geometry.detailside_x, y = 109 - 16 * 2, w = 73, h = 16,a = 0},
			{time = 300,x = 646 + geometry.detailside_x, y = 109- 16 * 2, w = 73, h = 16,a = 255},
		}},
		{id = "GD_F", loop =300,op = {906}, draw = function()
		local pf_total = main_state.number(112)
		local pf_early = main_state.number(414)
		local pf_late = main_state.number(415)
		return is_judge_count_enabled() and (pf_early > pf_late)
		end , dst =  {
			{x = 646 + geometry.detailside_x, y = 109 - 16 * 2, w = 73, h = 16,a = 0},
			{time = 300,x = 646 + geometry.detailside_x, y = 109- 16 * 2, w = 73, h = 16,a = 255},
		}},
		{id = "GD_S", loop =300,op = {906}, draw = function()
		local pf_total = main_state.number(112)
		local pf_early = main_state.number(414)
		local pf_late = main_state.number(415)
		return is_judge_count_enabled() and (pf_late > pf_early)
		end , dst =  {
			{x = 646 + geometry.detailside_x, y = 109 - 16 * 2, w = 73, h = 16,a = 0},
			{time = 300,x = 646 + geometry.detailside_x, y = 109- 16 * 2, w = 73, h = 16,a = 255},
		}},



		{id = "BD_N", loop =300,op = {906}, draw = function()
		local pf_total = main_state.number(113)
		local pf_early = main_state.number(416)
		local pf_late = main_state.number(417)
		return is_judge_count_enabled() and (pf_early == pf_late)
		end , dst =  {
			{x = 646 + geometry.detailside_x, y = 109 - 16 * 3, w = 73, h = 16,a = 0},
			{time = 300,x = 646 + geometry.detailside_x, y = 109- 16 * 3, w = 73, h = 16,a = 255},
		}},
		{id = "BD_F", loop =300,op = {906}, draw = function()
		local pf_total = main_state.number(113)
		local pf_early = main_state.number(416)
		local pf_late = main_state.number(417)
		return is_judge_count_enabled() and (pf_early > pf_late)
		end , dst =  {
			{x = 646 + geometry.detailside_x, y = 109 - 16 * 3, w = 73, h = 16,a = 0},
			{time = 300,x = 646 + geometry.detailside_x, y = 109- 16 * 3, w = 73, h = 16,a = 255},
		}},
		{id = "BD_S", loop =300,op = {906}, draw = function()
		local pf_total = main_state.number(113)
		local pf_early = main_state.number(416)
		local pf_late = main_state.number(417)
		return is_judge_count_enabled() and (pf_late > pf_early)
		end , dst =  {
			{x = 646 + geometry.detailside_x, y = 109 - 16 * 3, w = 73, h = 16,a = 0},
			{time = 300,x = 646 + geometry.detailside_x, y = 109- 16 * 3, w = 73, h = 16,a = 255},
		}},

		{id = "PR_N", loop =300,op = {906}, draw = function()
		local pf_total = main_state.number(114)
		local pf_early = main_state.number(418)
		local pf_late = main_state.number(419)
		return is_judge_count_enabled() and (pf_early == pf_late)
		end , dst =  {
			{x = 646 + geometry.detailside_x, y = 109 - 16 * 4, w = 73, h = 16,a = 0},
			{time = 300,x = 646 + geometry.detailside_x, y = 109- 16 * 4, w = 73, h = 16,a = 255},
		}},
		{id = "PR_F", loop =300,op = {906}, draw = function()
		local pf_total = main_state.number(114)
		local pf_early = main_state.number(418)
		local pf_late = main_state.number(419)
		return is_judge_count_enabled() and (pf_early > pf_late)
		end , dst =  {
			{x = 646 + geometry.detailside_x, y = 109 - 16 * 4, w = 73, h = 16,a = 0},
			{time = 300,x = 646 + geometry.detailside_x, y = 109- 16 * 4, w = 73, h = 16,a = 255},
		}},
		{id = "PR_S", loop =300,op = {906}, draw = function()
		local pf_total = main_state.number(114)
		local pf_early = main_state.number(418)
		local pf_late = main_state.number(419)
		return is_judge_count_enabled() and (pf_late > pf_early)
		end , dst =  {
			{x = 646 + geometry.detailside_x, y = 109 - 16 * 4, w = 73, h = 16,a = 0},
			{time = 300,x = 646 + geometry.detailside_x, y = 109- 16 * 4, w = 73, h = 16,a = 255},
		}},


		{id = "FL_N", loop =300,op = {906}, draw = function()
		local pf_total = main_state.number(420)
		local pf_early = main_state.number(421)
		local pf_late = main_state.number(422)
		return is_judge_count_enabled() and (pf_early == pf_late)
		end , dst =  {
			{x = 646 + geometry.detailside_x, y = 109 - 16 * 5, w = 73, h = 16,a = 0},
			{time = 300,x = 646 + geometry.detailside_x, y = 109- 16 * 5, w = 73, h = 16,a = 255},
		}},
		{id = "FL_F", loop =300,op = {906}, draw = function()
		local pf_total = main_state.number(420)
		local pf_early = main_state.number(421)
		local pf_late = main_state.number(422)
		return is_judge_count_enabled() and (pf_early > pf_late)
		end , dst =  {
			{x = 646 + geometry.detailside_x, y = 109 - 16 * 5, w = 73, h = 16,a = 0},
			{time = 300,x = 646 + geometry.detailside_x, y = 109- 16 * 5, w = 73, h = 16,a = 255},
		}},
		{id = "FL_S", loop =300,op = {906}, draw = function()
		local pf_total = main_state.number(420)
		local pf_early = main_state.number(421)
		local pf_late = main_state.number(422)
		return is_judge_count_enabled() and (pf_late > pf_early)
		end , dst =  {
			{x = 646 + geometry.detailside_x, y = 109 - 16 * 5, w = 73, h = 16,a = 0},
			{time = 300,x = 646 + geometry.detailside_x, y = 109- 16 * 5, w = 73, h = 16,a = 255},
		}},


--ジャッジカウントここまで

		{id = "lane-bg", loop = 100, dst = {
			{time = 0, x = geometry.lanes_x - 4, y = 353, w = geometry.lanes_w, h = 727, a = 0},
			{time = 100, h = 727, a = 255}
		}},
		{id = -110, loop = 100, offset = 44, dst = {
			{time = 0, x = geometry.lanes_x, y = 357, w = 431, h = 723, a = 0},
			{time = 100, h = 723, a = 0}
		}},

--リフト
		{id = "liftcover", offset = 3 , dst = {
			{x = geometry.lanes_x, y = -366, w = 431 , h = 723}
		}},

		{id = "lift-value", offset = 3, op = {270},dst = {
			{time = 0, x = geometry.lanes_x + geometry.lanes_w / 3 - 24, y = 338, w = 16, h = 16}
		}},
		{id = "lanecover-green", offset = 3, op = {270},dst = {
			{time = 0, x = geometry.lanes_x + geometry.lanes_w * 2 / 3 - 48, y = 338, w = 16, h = 16}
		}},
		{id = "lanecover-duration", offset = 3, op = {270},dst = {
			{time = 0, x = geometry.lanes_x + geometry.lanes_w * 1 - 120, y = 338, w = 16, h = 16}
		}},
--リフト見えるの対策用カバー　今度いい感じのものを考える
		{id = "black", dst = {
			{x = geometry.lanes_x, y = -366, w = 431 , h = 723}
		}},


		{id = "background", dst = {
			{x = geometry.mainframe_x, y = 0, w = 535, h = 1080}
		}},


		{id = "groove_flash", loop = 600, dst = {
			{time = 400, x = geometry.gaugeflash_x, y = 165, w = 20, h = 20, a = 0},
			{time = 600, x = geometry.gaugeflash_x, y = 165, w = 20, h = 20, a = 50},
		}},

		{id = "groove_flash", loop = 600,blend = 2, dst = {
			{time = 600, x = geometry.gaugeflash_x, y = 165, w = 20, h = 20, a = 50},
			{time = 650, a = 255},
			{time = 700, a = 50},
		}},

		{id = "minbpm", op = {177} , dst = {
			{x = geometry.minbpm_x, y = 90, w = 30, h = 21}
		}},
		{id = "nowbpm", dst = {
			{x = geometry.nowbpm_x, y = 92, w = 39, h = 25}
		}},
		{id = "maxbpm", op = {177} , dst = {
			{x = geometry.maxbpm_x, y = 90, w = 30, h = 21}
		}},

	
		{id = "hispeed", dst = {
			{x = 359 + geometry.hispeedside_x, y = 87, w = 26, h = 24}
		}},
		{id = "hispeed-d", dst = {
			{x = 421 + geometry.hispeedside_x, y = 87, w = 26, h = 24}
		}},
		{id = "ex_score", dst = {
			{x = 325 + geometry.scoreside_x, y = 45, w = 39, h = 25}
		}},


		{id = "timeleft-frame", dst = {
			{x = geometry.timeleft, y = 882, w = 79, h = 38}
		}},
		{id = "timeleft-m", filter = 1 , dst = {
			{x = geometry.timeleft-5, y = 883, w = 16, h = 16}
		}},
		{id = "timeleft-s", filter = 1 , dst = {
			{x = geometry.timeleft+39, y = 883, w = 16, h = 16}
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
			{x = 160 + geometry.keyfrashside_x, y = 258, w = 67, h = 96}
		}},
		{id = "keyflash-b", timer = 102 , blend = 2 ,  dst = {
			{x = 214 + geometry.keyfrashside_x, y = 272, w = 56, h = 88}
		}},
		{id = "keyflash-w", timer = 103 , blend = 2 ,  dst = {
			{x = 256 + geometry.keyfrashside_x, y = 258, w = 67, h = 96}
		}},
		{id = "keyflash-b", timer = 104 , blend = 2 ,  dst = {
			{x = 310 + geometry.keyfrashside_x, y = 272, w = 56, h = 88}
		}},
		{id = "keyflash-w", timer = 105 , blend = 2 ,  dst = {
			{x = 352 + geometry.keyfrashside_x, y = 258, w = 67, h = 96}
		}},
		{id = "keyflash-b", timer = 106 , blend = 2 ,  dst = {
			{x = 406 + geometry.keyfrashside_x, y = 272, w = 56, h = 88}
		}},
		{id = "keyflash-w", timer = 107 , blend = 2 ,  dst = {
			{x = 448 + geometry.keyfrashside_x, y = 258, w = 67, h = 96}
		}},

--難易度表記ゾーン

		{id = "diff_0",op = {150}, dst = {
			{x = 104 + geometry.diffside_x , y = 64, w = 223, h = 52}
		}},

		{id = "diff_1",op = {151}, dst = {
			{x = 104 + geometry.diffside_x , y = 64, w = 223, h = 52}
		}},
		{id = "diffnum_1",op = {151}, dst = {
			{x = 263 + geometry.diffside_x , y = 80, w = 19, h = 18}
		}},

		{id = "diff_2",op = {152}, dst = {
			{x = 104 + geometry.diffside_x , y = 64, w = 223, h = 52}
		}},
		{id = "diffnum_2",op = {152}, dst = {
			{x = 263 + geometry.diffside_x , y = 80, w = 19, h = 18}
		}},

		{id = "diff_3",op = {153}, dst = {
			{x = 104 + geometry.diffside_x , y = 64, w = 223, h = 52}
		}},
		{id = "diffnum_3",op = {153}, dst = {
			{x = 263 + geometry.diffside_x , y = 80, w = 19, h = 18}
		}},

		{id = "diff_4",op = {154}, dst = {
			{x = 104 + geometry.diffside_x , y = 64, w = 223, h = 52}
		}},
		{id = "diffnum_4",op = {154}, dst = {
			{x = 263 + geometry.diffside_x , y = 80, w = 19, h = 18}
		}},

		{id = "diff_5",op = {155}, dst = {
			{x = 104 + geometry.diffside_x , y = 64, w = 223, h = 52}
		}},
		{id = "diffnum_5",op = {155}, dst = {
			{x = 263 + geometry.diffside_x , y = 80, w = 19, h = 18}
		}},

		{id = "jud_0",op = {184}, dst = {
			{x = 131 + geometry.diffside_x , y = 80, w = 87, h = 7}
		}},
		{id = "jud_1",op = {183}, dst = {
			{x = 131 + geometry.diffside_x , y = 80, w = 87, h = 7}
		}},
		{id = "jud_2",op = {182}, dst = {
			{x = 131 + geometry.diffside_x , y = 80, w = 87, h = 7}
		}},
		{id = "jud_3",op = {181}, dst = {
			{x = 131 + geometry.diffside_x , y = 80, w = 87, h = 7}
		}},		
		{id = "jud_4",op = {180}, dst = {
			{x = 131 + geometry.diffside_x , y = 80, w = 87, h = 7}
		}},

--難易度表記ゾーンここまで


		{id = "turntable",filter = 1, offset = 1, dst = {
			{time = 0, x = geometry.turntable_x, y = 278, w = 35, h = 35},
		}},



		{id = "keybeam-s", loop= -1, timer = 100, offset = 3 ,op = {32}, dst = {
			{time = 0, x = 75 + geometry.scbeamside_x, y = geometry.keybeam_y, w = 90, h = 0},
			{time = 50, x = 75 + geometry.scbeamside_x, y = geometry.keybeam_y, w = 90, h = 723},
			{time = 83, x = 75 + geometry.scbeamside_x, y = geometry.keybeam_y, w = 90, h = 723},
			{time = 167, x = 120 + geometry.scbeamside_x, y = geometry.keybeam_y, w = 0, h = 723,a= 0},
		}},
		{id = "keybeam-s", timer = 100,loop= 50, offset = 3 ,op = {33}, dst = {
			{time = 0, x = 75 + geometry.scbeamside_x, y = geometry.keybeam_y, w = 90, h = 0},
			{time = 50, x = 75 + geometry.scbeamside_x, y = geometry.keybeam_y, w = 90, h = 723},
		}},
		{id = "keybeam-s", timer = 120,loop= -1, offset = 3 ,op = {33}, dst = {
			{time = 0, x = 75 + geometry.scbeamside_x, y = geometry.keybeam_y, w = 90, h = 723},
			{time = 83, x = 120 + geometry.scbeamside_x, y = geometry.keybeam_y, w = 0, h = 723,a = 0},
		}},
		{id = "keybeam-w", timer = 101 , offset = 3 , dst = {
			{time = 0, x = 168 + geometry.keybeamside_x, y = geometry.keybeam_y, w = 51, h = 723},
		}},
		{id = "keybeam-w", timer = 121,loop= -1 , offset = 3 , dst = {
			{time = 0, x = 168 + geometry.keybeamside_x, y = geometry.keybeam_y, w = 51, h = 723},
			{time = 83, x = 193 + geometry.keybeamside_x, y = geometry.keybeam_y, w = 0, h = 723,a = 0},
		}},
		{id = "keybeam-b", timer = 102, offset = 3 , dst = {
			{time = 0, x = 222 + geometry.keybeamside_x, y = geometry.keybeam_y, w = 39, h = 723},
		}},
		{id = "keybeam-b", timer = 122 , loop= -1, offset = 3 , dst = {
			{time = 0, x = 222 + geometry.keybeamside_x, y = geometry.keybeam_y, w = 39, h = 723},
			{time = 83, x = 241 + geometry.keybeamside_x, y = geometry.keybeam_y, w = 0, h = 723,a = 0},
		}},
		{id = "keybeam-w", timer = 103, offset = 3 , dst = {
			{time = 0, x = 264 + geometry.keybeamside_x, y = geometry.keybeam_y, w = 51, h = 723},
		}},
		{id = "keybeam-w", timer = 123,loop= -1, offset = 3 , dst = {
			{time = 0, x = 264 + geometry.keybeamside_x, y = geometry.keybeam_y, w = 51, h = 723},
			{time = 83, x = 289 + geometry.keybeamside_x, y = geometry.keybeam_y, w = 0, h = 723,a = 0},
		}},
		{id = "keybeam-b", timer = 104, offset = 3 , dst = {
			{time = 0, x = 318 + geometry.keybeamside_x, y = geometry.keybeam_y, w = 39, h = 723},
		}},
		{id = "keybeam-b", timer = 124,loop= -1, offset = 3 , dst = {
			{time = 0, x = 318 + geometry.keybeamside_x, y = geometry.keybeam_y, w = 39, h = 723},
			{time = 83, x = 337 + geometry.keybeamside_x, y = geometry.keybeam_y, w = 0, h = 723,a = 0},
		}},
		{id = "keybeam-w", timer = 105, offset = 3 , dst = {
			{time = 0, x = 360 + geometry.keybeamside_x, y = geometry.keybeam_y, w = 51, h = 723},
		}},
		{id = "keybeam-w", timer = 125,loop= -1, offset = 3 , dst = {
			{time = 0, x = 360 + geometry.keybeamside_x, y = geometry.keybeam_y, w = 51, h = 723},
			{time = 83, x = 385 + geometry.keybeamside_x, y = geometry.keybeam_y, w = 0, h = 723,a = 0},
		}},
		{id = "keybeam-b", timer = 106, offset = 3 , dst = {
			{time = 0, x = 414 + geometry.keybeamside_x, y = geometry.keybeam_y, w = 39, h = 723},
		}},
		{id = "keybeam-b", timer = 126,loop= -1, offset = 3 , dst = {
			{time = 0, x = 414 + geometry.keybeamside_x, y = geometry.keybeam_y, w = 39, h = 723},
			{time = 83, x = 433 + geometry.keybeamside_x, y = geometry.keybeam_y, w = 0, h = 723,a = 0},
		}},
		{id = "keybeam-w", timer = 107, offset = 3 , dst = {
			{time = 0, x = 456 + geometry.keybeamside_x, y = geometry.keybeam_y, w = 51, h = 723},
		}},
		{id = "keybeam-w", timer = 127,loop= -1, offset = 3 , dst = {
			{time = 0, x = 456 + geometry.keybeamside_x, y = geometry.keybeam_y, w = 51, h = 723},
			{time = 83, x = 481 + geometry.keybeamside_x, y = geometry.keybeam_y, w = 0, h = 723,a = 0},
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
		}}

	}

	table.insert(skin.destination, {id = 15, offset = 3, dst = { {x = geometry.lanes_x, y = 357, w = 431, h = 8} }})
	table.insert(skin.destination, {id = "notes", offset = 30})
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



	append_all(skin.destination, {
		{id = "lanecover", dst = {
			{x = geometry.lanes_x, y = 1080, w = 431 , h = 723}
		}},
	})	


	append_all(skin.destination, {
		{id = "judge"},
		--判定fs
		{id = "judge-early", loop = -1, timer = 46 ,op = {911,1242},offsets = {3, 33}, dst = {
			{time = 0, x = geometry.judgedetail_x, y = geometry.judgedetail_y, w = 74, h = 18},
			{time = 500}
		}},
		{id = "judge-late", loop = -1, timer = 46 ,op = {911,1243},offsets = {3, 33}, dst = {
			{time = 0, x = geometry.judgedetail_x, y = geometry.judgedetail_y, w = 74, h = 18},
			{time = 500}
		}},
		--判定ms
		{id = "judgems-1pg", filter= 1 , loop = -1, timer = 46 ,op = {912,-241},offsets = {3, 33}, dst = {
			{time = 0, x = geometry.judgedetail_x, y = geometry.judgedetail_y, w = 18, h = 18},
			{time = 500}
		}},
		--判定ms(どっちもA)
		{id = "judgems-1pp", filter= 1 , loop = -1, timer = 46 ,op = {913,241},offsets = {3, 33}, dst = {
			{time = 0, x = geometry.judgedetail_x, y = geometry.judgedetail_y, w = 18, h = 18},
			{time = 500}
		}},
		{id = "judgems-1pg", filter= 1 , loop = -1, timer = 46 ,op = {913,-241},offsets = {3, 33}, dst = {
			{time = 0, x = geometry.judgedetail_x, y = geometry.judgedetail_y, w = 18, h = 18},
			{time = 500}
		}},	
		{id = "judgems-1pg", blend = 1 , filter= 1 , loop = -1, timer = 46 ,op = {913,-241},offsets = {3, 33}, dst = {
			{time = 0, x = geometry.judgedetail_x, y = geometry.judgedetail_y, w = 18, h = 18},
			{time = 500}
		}},
		--判定ms(どっちもB)
		{id = "judgems-1pp", filter = 1 , loop = -1, timer = 46 ,op = {914,-241},offsets = {3, 33}, dst = {
			{time = 0, x = geometry.judgedetail_x, y = geometry.judgedetail_y, w = 18, h = 18},
			{time = 500}
		}},
		{id = "judgems-1pg", filter= 1 , loop = -1, timer = 46 ,op = {914,241},offsets = {3, 33}, dst = {
			{time = 0, x = geometry.judgedetail_x, y = geometry.judgedetail_y, w = 18, h = 18},
			{time = 500}
		}},	
		{id = "judgems-1pg", blend = 1 , filter= 1 , loop = -1, timer = 46 ,op = {914,241},offsets = {3, 33}, dst = {
			{time = 0, x = geometry.judgedetail_x, y = geometry.judgedetail_y, w = 18, h = 18},
			{time = 500}
		}},



		{id = "gauge", loop = 700 , dst = {
			{time = 500, x = geometry.gauge_x, y = 158, w = geometry.gauge_w, h = 33 , a = 0},
			{time = 700, x = geometry.gauge_x, y = 158, w = geometry.gauge_w, h = 33 , a = 255},
		}},
		{id = "gauge",blend = 2 ,loop = 700 , draw = function()
			local GAUGETYPE = main_state.gauge_type()
			return GAUGETYPE == 4 or GAUGETYPE == 5
 		end,  dst = { 
			{time = 700, x = geometry.gauge_x, y = 158, w = geometry.gauge_w, h = 33 , a = 0 },
			{time = 1200, a = 80 },
			{time = 1500, a = 0 },
		}},

		{id = "gaugevalue", dst = {
			{time = 0, x = geometry.gaugevalue_x, y = 195, w = 39, h = 28}
		}},
		{id = "gaugevalue-d", dst = {
			{time = 0, x = geometry.gaugevalue_x + 126, y = 194, w = 25, h = 20}
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



--曲情報
		{id = "song-title", loop = 400 , dst = {
			{time = 0, x = geometry.song_title_x + 4, y = 995, w = geometry.song_title_w, h = 23 , a = 0},
			{time = 400 ,a = 255 },
		}},
		{id = "artist", loop = 400 , dst = {
			{time = 0, x = geometry.song_artist_x + 4, y = 961, w = geometry.song_artist_w, h = 17 , a = 0},
			{time = 400 ,a = 255 },
		}},
		{id = "folder", loop = 400 , dst = {
			{time = 0, x = geometry.song_folde_x + 4, y = 942, w = geometry.song_folde_w, h = 13 , a = 0},
			{time = 400 ,a = 255 },
		}},

--BGA内曲情報_読み込み



		{id = -101, loop = 400 ,op = {80,195} ,filter = 1,blend = 2, dst = {
			{time = 0, x = geometry.song_title_x - 299, y = 152, w = 612, h = 716, a = 0},
			{time = 400 ,a = 255 },
		}},

		{id = "BGA_titleback", loop = 400 ,op = {80,194} , dst = {
			{time = 0, x = geometry.song_title_x - 310, y = 192, w = 632, h = 632, a = 0},
			{time = 400 ,a = 150 },
		}},

		{id = -100, loop = 400 ,op = {80,194,927,924} ,filter = 1,blend = 1, dst = {
			{time = 0, x = geometry.subframe_x + 416 , y = geometry.bga_y, w = geometry.bga_w, h = geometry.bga_h, a = 0},
			{time = 400 ,a = 80 },
		}},
		{id = -100, loop = 400 ,op = {80,194,927,925} ,filter = 1,blend = 1, dst = {
			{time = 0, x = geometry.subframe_x + 570 , y = geometry.bga_y, w = geometry.bga_w, h = geometry.bga_h, a = 0},
			{time = 400 ,a = 80 },
		}},


		{id = "genre_big", loop = 400 ,op = {80,194}, dst = {
			{time = 0, x = geometry.song_title_x + 12, y = 700, w = geometry.bga_w - 80, h = 25 , a = 0},
			{time = 400 ,a = 255 },
		}},

		{id = "song-title_big", loop = 400 ,op = {80,194}, dst = {
			{time = 0, x = geometry.song_title_x + 12, y = 588, w = 1000, h = 60 , a = 0},
			{time = 400 ,a = 255 },
		}},
		{id = "song-title_sub", loop = 400 ,op = {80,194}, dst = {
			{time = 0, x = geometry.song_title_x + 12, y = 538, w = geometry.bga_w - 80, h = 30 , a = 0},
			{time = 400 ,a = 255 },
		}},
		{id = "artist_big", loop = 400 ,op = {80,194}, dst = {
			{time = 0, x = geometry.song_title_x + 12, y = 274, w = geometry.bga_w - 80, h = 25 , a = 0},
			{time = 400 ,a = 255 },
		}},

--BGA内曲情報_読み込み完了
		{id = -101, loop = -1,op = {195} ,filter = 1,blend = 2, timer = 40, dst = {
			{time = 0, x = geometry.song_title_x - 299, y = 152, w = 612, h = 716, a = 255},
			{time = 400 ,a = 0 },
		}},

		{id = "BGA_titleback", loop = -1, timer = 40,op = {194}, dst = {
			{time = 0, x = geometry.song_title_x - 310, y = 192, w = 632, h = 632, a = 150},
			{time = 400 ,a = 0 },
		}},

		{id = -100, loop = -1 , timer = 40,op = {194,927,924} ,filter = 1,blend = 1, dst = {
			{time = 0, x = geometry.subframe_x + 416 , y = geometry.bga_y, w = geometry.bga_w, h = geometry.bga_h, a = 80},
			{time = 400 ,a = 0 },
		}},
		{id = -100, loop = -1 , timer = 40,op = {194,927,925} ,filter = 1,blend = 1, dst = {
			{time = 0, x = geometry.subframe_x + 570 , y = geometry.bga_y, w = geometry.bga_w, h = geometry.bga_h, a = 80},
			{time = 400 ,a = 0 },
		}},


		{id = "genre_big", loop = -1, timer = 40,op = {194}, dst = {
			{time = 0, x = geometry.song_title_x + 12, y = 700, w = geometry.bga_w - 80, h = 25 , a = 255},
			{time = 400 ,a = 0 },
		}},

		{id = "song-title_big", loop = -1, timer = 40,op = {194}, dst = {
			{time = 0, x = geometry.song_title_x + 12, y = 588, w = 1000, h = 60 , a = 255},
			{time = 400 ,a = 0 },
		}},
		{id = "song-title_sub", loop = -1, timer = 40,op = {194}, dst = {
			{time = 0, x = geometry.song_title_x + 12, y = 538, w = geometry.bga_w - 80, h = 30 , a = 255},
			{time = 400 ,a = 0 },
		}},
		{id = "artist_big", loop = -1, timer = 40,op = {194}, dst = {
			{time = 0, x = geometry.song_title_x + 12, y = 274, w = geometry.bga_w - 80, h = 25 , a = 255},
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
	})


--レーンカバー数値関連
	append_all(skin.destination, play_parts.judge_count_destinations("judge-count-", geometry.judgecount_x, geometry.judgecount_y, {906}, 42))
	append_all(skin.destination, {
		{id = "lanecover-value", offset = 4, op = {270},dst = {
			{time = 0, x = geometry.lanes_x + geometry.lanes_w / 3 - 24, y = 1082, w = 16, h = 16}
		}},
		{id = "lanecover-green", offset = 4, op = {270},dst = {
			{time = 0, x = geometry.lanes_x + geometry.lanes_w * 2 / 3 - 48, y = 1082, w = 16, h = 16}
		}},
		{id = "lanecover-duration", offset = 4, op = {270},dst = {
			{time = 0, x = geometry.lanes_x + geometry.lanes_w * 1 - 120, y = 1082, w = 16, h = 16}
		}},




--ロードバー
		{id = "loading", loop = 600, op = {80}, dst = {
			{time = 500, x = geometry.lanes_x + 26 , y = 477, w = 379, h = 50, a = 0},
			{time = 600, x = geometry.lanes_x + 26 , y = 477, w = 379, h = 50, a = 255},
			{time = 1600, x = geometry.lanes_x + 26 , y = 477, w = 379, h = 50, a = 100},
			{time = 2600, x = geometry.lanes_x + 26 , y = 477, w = 379, h = 50, a = 255},
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
