local header = {
	type = 15,
	name = "EC:FN",
	w = 1920,
	h = 1080,
	fadeout = 3000,
	scene = 3600000,
	input = 1000,
	property = {
		{name = "LEGACY_VER", def = "OFF", item = {
			{name = "OFF", op = 923},
			{name = "ON", op = 924},
		}},
		{name = "Playside", def = "1P", item = {
			{name = "1P", op = 918},
			{name = "2P", op = 919},
		}},
		{name = "ExtendFrame", def = "OFF", item = {
			{name = "OFF", op = 916},
			{name = "ON", op = 917},
		}},
		{name = "LightBG", def = "OFF", item = {
			{name = "OFF", op = 920},
			{name = "ON", op = 921},
		}},		
		{name = "Stage_file", def = "OFF", item = {
			{name = "OFF", op = 930},
			{name = "UNDER_A", op = 931},
			{name = "ALL", op = 932},
		}},						
		{name = "シャッター", def = "ON", item = {
			{name = "ON", op = 940},
			{name = "OFF", op = 941},
		}},
		{name = "FS_list", def = "Default", item = {
			{name = "Default", op = 910},
			{name = "Reverse", op = 911},
		}},
		{name = "Particle", def = "ON", item = {
			{name = "ON", op = 912},
			{name = "OFF", op = 913},
		}},
		{name = "CLEAR_EFFECT", def = "ON", item = {
			{name = "ON", op = 914},
			{name = "OFF", op = 915},
		}},
	},

	filepath = {
		{ name = "---AAA", path = "BG/AAA/*.png", def = "Random" },
		{ name = "---AA", path = "BG/AA/*.png", def = "Random" },
		{ name = "---A", path = "BG/A/*.png", def = "Random" },
		{ name = "---RANK", path = "RANK/*.png", def = "DEFAULT" },
	},
}



--skinconfigの変換用
local function is_side_1P()
	return skin_config.option["Playside"] == 918
end
local function is_side_2P()
	return skin_config.option["Playside"] == 919
end

local function is_FS_Default()
	return skin_config.option["FS_list"] == 910
end
local function is_FS_Reverse()
	return skin_config.option["FS_list"] == 911
end
local function is_IR_OFF()
	return skin_config.option["IR_Extend"] == 916
end
local function is_IR_ON()
	return skin_config.option["IR_Extend"] == 917
end


--skinconfigの変換用ここまで



local common = {}

common.title_x = 1280
common.ave_x = 1590
common.peak_x = 870
common.end_x = 1230

local main_state = require("main_state")

local function main()
    -- ヘッダ情報コピー
    local skin = {}
    for k, v in pairs(header) do
        skin[k] = v
    end

    --ソース読み込み
        skin.source = {
    	{id = 0-2, path = "BG/A/*.png"},
    	{id = 0-3, path = "BG/AA/*.png"},
    	{id = 0-4, path = "BG/AAA/*.png"},
    	{id = 5, path = "BG/CLEAR.png"},
    	{id = 6, path = "BG/FAILED.png"},
    	{id = 7, path = "RANK/*.png"},
		{id = 8, path = "parts/Particle.png"},
     	{id = 9, path = "parts/num.png"},
		{id = 10, path = "parts/main.png"},
		{id = 11, path = "parts/clear_failed.png"},
		{id = 12, path = "parts/result_startacc.png"},
		{id = 13, path = "parts/shutter.png"},	
		{id = 14, path = "parts/shutter_.png"},	
    	{id = 15, path = "BG/light/CLEAR.png"},
    	{id = 16, path = "BG/light/FAILED.png"},
		{id = 17, path = "parts/Shutter2.png"},	
		}

	--フォントの読み込み
	skin.font = {
		{id = 0, path = "font/song.fnt"},
		{id = 1, path = "font/Artist.fnt"},
		{id = 2, path = "font/folder.fnt"},
	}



--0の時だけ白色にする処理
--ランク差分
local nextRankDiff = main_state.number(154)
	local NextRank_Num_y = 292
		if nextRankDiff == 0 then
			NextRank_Num_y = 165
			end
--ミスカン差分
local nextMissDiff = main_state.number(178)
	local Misscount_Num_y = 345
		if nextMissDiff == 0 then
			Misscount_Num_y = 165
			end

--変換等したものの数値代入用
--プレイサイド
local 
s_groove_frame_side = 0
groove_frame_side = 0
groove_op_side = 0
groove_side = 0
playside_score = 0
playside_judge = 0
playside_extend = 0

	if is_side_1P() then
		s_groove_frame_side = 0
		groove_frame_side = 0
		groove_op_side = 0
		groove_side = 0
		playside_score = 0
		playside_judge = 0
		playside_extend = 0

	elseif is_side_2P() then
		s_groove_frame_side = 581
		groove_frame_side = 1329
		groove_op_side = 1319
		groove_side = 1318
		playside_score = 1389
		playside_judge = 1400
		playside_extend = 1361
	end
--fast&slowの位置反転
local 
	FS_position1 = 390
	FS_position2 = 308

	if is_FS_Default() then
		FS_position1 = 390
		FS_position2 = 308

	elseif is_FS_Reverse() then
		FS_position1 = 308
		FS_position2 = 390
	end

--WaitTimer暴発防止用
local WAIT_OPTION = 0
	if is_IR_OFF() then
		WAIT_OPTION = 0
	elseif is_IR_ON()  then
		WAIT_OPTION = 1
	end


local
	ir_wait_w = 0
	if main_state.option(50) then
		ir_wait_w = 0
	elseif main_state.option(51) then
		ir_wait_w = 123
	end

--変換等したものの数値代入用ここまで

local function isMyFrame(indexNum)
	local indexRank = main_state.number(389 + indexNum)
	local myRank = main_state.number(MAIN.NUM.IR_RANK)
	local flg = main_state.text(119 + indexNum) == "YOU"
	return (indexRank == myRank) and flg
end



--ここから切り出し関連
	skin.image = {
		{id = "shutter", src = 17, x = 0, y = 0, w = 7680, h = 5400,divx = 4 , divy = 5 , cycle = 600},
		{id = "shutter1", src = 13, x = 0, y = 0, w = 1920, h = 1080},
		{id = "shutter2", src = 13, x = 1920*1, y = 0, w = 1920, h = 1080},
		{id = "shutter3", src = 13, x = 1920*2, y = 0, w = 1920, h = 1080},
		{id = "shutter4", src = 13, x = 1920*3, y = 0, w = 1920, h = 1080},
		{id = "shutter5", src = 13, x = 0, y = 1080, w = 1920, h = 1080},
		{id = "shutter6", src = 13, x = 1920*1, y = 1080, w = 1920, h = 1080},
		{id = "shutter7", src = 13, x = 1920*2, y = 1080, w = 1920, h = 1080},
		{id = "shutter8", src = 13, x = 1920*3, y = 1080, w = 1920, h = 1080},
		{id = "shutter9", src = 13, x = 0, y = 1080*2, w = 1920, h = 1080},
		{id = "shutter10", src = 13, x = 1920*1, y = 1080*2, w = 1920, h = 1080},
		{id = "shutter11", src = 13, x = 1920*2, y = 1080*2, w = 1920, h = 1080},
		{id = "shutter12", src = 13, x = 1920*3, y = 1080*2, w = 1920, h = 1080},
		{id = "shutter13", src = 13, x = 0, y = 1080*3, w = 1920, h = 1080},
		{id = "shutter14", src = 13, x = 1920*1, y = 1080*3, w = 1920, h = 1080},
		{id = "shutter15", src = 13, x = 1920*2, y = 1080*3, w = 1920, h = 1080},
		{id = "shutter16", src = 13, x = 1920*3, y = 1080*3, w = 1920, h = 1080},
		{id = "shutter17", src = 13, x = 0, y = 1080*4, w = 1920, h = 1080},
		{id = "shutter18", src = 13, x = 1920*1, y = 1080*4, w = 1920, h = 1080},
  		{id = "shutter_", src = 14, x = 0, y = 0, w = 1920, h = 1080},
		--背景
		{id = "black", src = 11, x = 163, y = 359, w = 10, h = 10},
		{id = "BG_ALL", src = 0-1, x = 0, y = 0, w = -1, h = -1},
		{id = "BG_A", src = 0-2, x = 0, y = 0, w = -1, h = -1},
		{id = "BG_AA", src = 0-3, x = 0, y = 0, w = -1, h = -1},	
		{id = "BG_AAA", src = 0-4, x = 0, y = 0, w = -1, h = -1},
		{id = "BG_CLEAR_light", src = 15, x = 0, y = 0, w = -1, h = -1},
		{id = "BG_FAILED_light", src = 16, x = 0, y = 0, w = -1, h = -1},
		{id = "BG_CLEAR", src = 5, x = 0, y = 0, w = 6400, h = 8640 , divx = 5 , divy = 12 , cycle = 2200},
		--{id = "BG_CLEAR_parts", src = 5, x = 0, y = 8640, w = 476, h = 205},
		{id = "BG_CLEAR_parts", src = 5, x = 0, y = 8640, w = 156, h = 216},
		{id = "BG_FAILED", src = 6, x = 0, y = 0, w = 6400, h = 8640 , divx = 5 , divy = 12 , cycle = 2200},
		{id = "BG_FAILED_parts", src = 6, x = 0, y = 8640, w = 156, h = 216},
		{id = "Particle", src = 8, x = 0, y = 0, w = -1, h = -1, divy = 60 , cycle = 2000},
		{id = "result_startacc", src = 12, x = 0, y = 0, w = 1920, h = 2139},
		{id = "result_startacc2", src = 12, x = 0, y = 2139, w = 1920, h = 2139},
		--リザルト上部用
		{id = "stageresult_upper", src = 10, x = 0, y = 2164, w = 1811, h = 165},
		{id = "stageresult_upper_f", src = 10, x = 0, y = 2329, w = 1811, h = 165},	

		{id = "stageresult", src = 10, x = 0, y = 1200 - 25*2 , w = 462, h = 24},
		{id = "stageresult_f",src = 10, x = 0, y = 1200 - 25*1 , w = 462, h = 24},
		--下部情報用
		{id = "NAME_LINE_ACC", src = 10, x = 856, y = 0, w = 70, h = 194},
		{id = "NAME_LINE", src = 10, x = 0, y = 213, w = 853, h = 20},
     	{id = "DIFF_KEYS_INFO", src = 10, x = 940, y = 67, w = 245, h = 31},
		{id = "NOTES_INFO", src = 10, x = 569, y = 33, w = 180, h = 31},
		{id = "stageresult_under_base", src = 10, x = 0, y = 2562, w = 870, h = 62},
		--パーセント文字
		{id = "SCORE_PER1", src = 10, x = 567, y = 152, w = 45, h = 13},
		{id = "SCORE_PER2", src = 10, x = 567, y = 165, w = 45, h = 13},

		{id = "TERGET_PER1", src = 10, x = 593, y = 98, w = 26, h = 18},
		{id = "TERGET_PER2", src = 10, x = 593, y = 117, w = 23, h = 18},
		{id = "TERGET_PER_dot1", src = 10, x = 569, y = 98, w = 8, h = 18},
		{id = "TERGET_PER_dot2", src = 10, x = 566, y = 117, w = 7, h = 18},
		--グルーヴゲージ
		{id = "Groove_main", src = 10, x = 528, y = 234 + s_groove_frame_side , w = 565, h = 309},
		{id = "Gauge_frame", src = 10, x = 566, y = 545, w = 527, h = 267},
		--追加フレーム
		{id = "extend_frame", src = 10, x = 616+550, y = 1179, w = 550, h = 971},
		{id = "timing", src = 10, x = 0, y = 1838, w = 522, h = 312},
		{id = "dot", src = 10, x = 567, y = 159, w = 7, h = 6},
		{id = "bpm_bar", src = 10, x = 1022, y = 0, w = 94, h = 7},
		{id = "ir_frame", src = 10, x = 0, y = 1803, w = 522, h = 34},
		{id = "ir_wait1", src = 10, x = 0, y = 1567, w = 517, h = 31},
		{id = "ir_comp", src = 10, x = 0, y = 1598, w = 517, h = 31},
		{id = "ir_fail", src = 10, x = 0, y = 1629, w = 517, h = 31},
		--メインフレーム周り
		{id = "button_info", src = 10, x = 0, y = 1761, w = 572, h = 42},		
		{id = "SCORE_FRAME", src = 10, x = 0, y = 234, w = 485, h = 345},
		{id = "judge_detail", src = 10, x = 0, y = 582, w = 514, h = 369},
		{id = "judge_detail_EX", src = 10, x = 1102, y = 593, w = 514 , h = 393},
		{id = "detail_slow", src = 10, x = 755, y = 123, w = 36, h = 8},	
		{id = "detail_fast", src = 10, x = 755, y = 132, w = 31, h = 8},	
		{id = "p_great", src = 10, x = 755, y = 34, w = 91, h = 88, divy = 4 , cycle = 250},
		--スコアフレーム文字
		{id = "cleartype_font", src = 10, x = 626, y = 68, w = 123, h = 19},
		{id = "djlevel_font", src = 10, x = 626, y = 87, w = 94, h = 19},
		{id = "score_font", src = 10, x = 626, y = 144, w = 80, h = 33},
		{id = "misscount_font", src = 10, x = 626, y = 106, w = 128, h = 19},
		{id = "target_font", src = 10, x = 626, y = 125, w = 80, h = 19},
		--IR関連

		{id = "IR_UNCONNECTED", src = 10, x = 1123, y = 36, w = 123, h = 9},
		{id = "IR_WAIT", src = 10, x = 1123, y = 45, w = ir_wait_w, h = 9},
		{id = "IR_FAILED", src = 10, x = 1123, y = 54, w = 123, h = 9},
		--DJRANK
		{id = "RANK_b_AAA", src = 7, x = 0, y = 0, w = 369, h = 124},
		{id = "RANK_b_AA", src = 7, x = 0, y = 124 * 1, w = 369, h = 124},
		{id = "RANK_b_A", src = 7, x = 0, y = 124 * 2, w = 369, h = 124},
		{id = "RANK_b_B", src = 7, x = 0, y = 124 * 3, w = 369, h = 124},
		{id = "RANK_b_C", src = 7, x = 0, y = 124 * 4, w = 369, h = 124},
		{id = "RANK_b_D", src = 7, x = 0, y = 124 * 5, w = 369, h = 124},
		{id = "RANK_b_E", src = 7, x = 0, y = 124 * 6, w = 369, h = 124},
		{id = "RANK_b_F", src = 7, x = 0, y = 124 * 7, w = 369, h = 124},
		--DJRANK_スコア用
		{id = "RANK_m_AAA", src = 10, x = 493, y = 0, w = 69, h = 23},
		{id = "RANK_m_AA", src = 10, x = 493, y = 23 * 1, w = 69, h = 23},
		{id = "RANK_m_A", src = 10, x = 493, y = 23 * 2, w = 69, h = 23},
		{id = "RANK_m_B", src = 10, x = 493, y = 23 * 3, w = 69, h = 23},
		{id = "RANK_m_C", src = 10, x = 493, y = 23 * 4, w = 69, h = 23},
		{id = "RANK_m_D", src = 10, x = 493, y = 23 * 5, w = 69, h = 23},
		{id = "RANK_m_E", src = 10, x = 493, y = 23 * 6, w = 69, h = 23},
		{id = "RANK_m_F", src = 10, x = 493, y = 23 * 7, w = 69, h = 23},
		--DJRANK_差分用
		{id = "RANK_s_MAX", src = 10, x = 447, y = 0, w = 45, h = 19},
		{id = "RANK_s_AAA", src = 10, x = 447, y = 19 * 1, w = 45, h = 19},
		{id = "RANK_s_AA", src = 10, x = 447, y = 19 * 2, w = 45, h = 19},
		{id = "RANK_s_A", src = 10, x = 447, y = 19 * 3, w = 45, h = 19},
		{id = "RANK_s_B", src = 10, x = 447, y = 19 * 4, w = 45, h = 19},
		{id = "RANK_s_C", src = 10, x = 447, y = 19 * 5, w = 45, h = 19},
		{id = "RANK_s_D", src = 10, x = 447, y = 19 * 6, w = 45, h = 19},
		{id = "RANK_s_E", src = 10, x = 447, y = 19 * 7, w = 45, h = 19},
		{id = "RANK_s_F", src = 10, x = 447, y = 19 * 8, w = 45, h = 19},
		--クリア
		{id = "best-clear", src = 10, x = 120, y = 0, w = 327, h = 209, divx = 3, divy = 11, cycle = 200, len = 11, ref = 371},
		{id = "current-clear", src = 10, x = 120, y = 0, w = 327, h = 209, divx = 3, divy = 11, cycle = 200, len = 11, ref = 370},
		--ミスカン初回用
		{id = "MISSCOUNT_F", src = 10, x = 940, y = 0, w = 80, h = 220, divx = 1, divy = 11, cycle = 200, len = 11, ref = 371},
		--ミスカン差分初回用
		{id = "MISSCOUNT_SF", src = 10, x = 1022, y = 0, w = 94, h = 77, divx = 1, divy = 11, cycle = 200, len = 11, ref = 371},
		--鍵盤数
		{id = "DATA_KEYS_5K", src = 10, x = 0, y = 103, w = 58, h = 21},
		{id = "DATA_KEYS_7K", src = 10, x = 0, y = 103 + 22 * 1, w = 58, h = 21},
		{id = "DATA_KEYS_10K", src = 10, x = 0, y = 103 + 22 * 2, w = 58, h = 21},
		{id = "DATA_KEYS_14K", src = 10, x = 0, y = 103 + 22 * 3, w = 58, h = 21},
		{id = "DATA_KEYS_9K", src = 10, x = 0, y = 103 + 22 * 4, w = 58, h = 21},
		--判定難易度
		{id = "P_JUDGE_VEASY", src = 10, x = 59, y = 103, w = 58, h = 21},
		{id = "P_JUDGE_EASY", src = 10, x = 59, y = 103 + (22 * 1), w = 58, h = 21},
		{id = "P_JUDGE_NORMAL", src = 10, x = 59, y = 103 + (22 * 2), w = 58, h = 21},
		{id = "P_JUDGE_HARD", src = 10, x = 59, y = 103 + (22 * 3), w = 58, h = 21},
		{id = "P_JUDGE_VHARD", src = 10, x = 59, y = 103 + (22 * 4), w = 58, h = 21},
		--難易度
		{id = "DATA_DIFFICULTY_U", src = 10, x = 0, y = 0, w = 104, h = 17},
		{id = "DATA_DIFFICULTY_B", src = 10, x = 0, y = 0 + 17*1, w = 104, h = 17},
		{id = "DATA_DIFFICULTY_N", src = 10, x = 0, y = 0 + 17*2, w = 104, h = 17},
		{id = "DATA_DIFFICULTY_H", src = 10, x = 0, y = 0 + 17*3, w = 104, h = 17},
		{id = "DATA_DIFFICULTY_A", src = 10, x = 0, y = 0 + 17*4, w = 104, h = 17},
		{id = "DATA_DIFFICULTY_I", src = 10, x = 0, y = 0 + 17*5, w = 104, h = 17},
		--ランダムオプション
		{id = "RANDOM_OP", src = 10, x = 1249, y = 0, w = 130, h = 120, divy = 10, len = 10, ref = 42, act = 42},
		--記録更新用
		{id = "NEWRECORD_1", src = 10, x = 0, y = 950, w = 166, h = 51},
		{id = "NEWRECORD_2", src = 10, x = 0, y = 1006, w = 166, h = 57},
		--CLEARとFAILED
		{id = "CLEAR_main", src = 11, x = 0, y = 900, w = 1219, h = 196},
		{id = "CLEAR_glow", src = 11, x = 0, y = 1096, w = 1221, h = 198},
		{id = "CLEAR_blur", src = 11, x = 0, y = 1294, w = 1517, h = 196},
		{id = "CLEAR_flash", src = 11, x = 0, y = 1490, w = 1329, h = 306},
		{id = "FAILED_main", src = 11, x = 0, y = 0, w = 1283, h = 196},
		{id = "FAILED_glow", src = 11, x = 0, y = 196, w = 1285, h = 198},
		{id = "FAILED_blur", src = 11, x = 0, y = 394, w = 1583, h = 196},
		{id = "FAILED_flash", src = 11, x = 0, y = 590, w = 1393, h = 306},	
	}

	--ゲージグラフ
	skin.gaugegraph = {
			{id = "gauge",  assistClearBGColor = "440044aa",
			 				assistAndEasyFailBGColor = "004444aa",
			 				grooveFailBGColor = "004400aa",
			 				grooveClearAndHardBGColor = "440000aa",
			 				exHardBGColor = "444400aa",
			 				hazardBGColor = "444444aa",
			 				borderColor = "440000aa"
			}

	   }

	--文字関連
	skin.text = {
				{id = "songname", font = 0, size = 23, align = 1, overflow = 1, ref = 12},
				{id = "artist", font = 1, size = 17, align = 1, overflow = 1, ref = 16},
				{id = "folder", font = 2, size = 16, align = 1, overflow = 1, ref = 1003},
				--追加フレーム向け
				{id = "ex_title", font = 1, size = 14, align = 2, overflow = 1, ref = 150},
				{id = "ex_title2", font = 1, size = 14, align = 2, overflow = 1, ref = 151},
				{id = "ex_title3", font = 1, size = 14, align = 2, overflow = 1, ref = 152},
				{id = "ex_title4", font = 1, size = 14, align = 2, overflow = 1, ref = 153},
				{id = "ex_title5", font = 1, size = 14, align = 2, overflow = 1, ref = 154},

				{id = "ex_artist", font = 1, size = 16, align = 2, overflow = 1, ref = 14},
				{id = "ex_ir", font = 1, size = 13, align = 2, overflow = 1, ref = 1020},

				{id = "ex_ir1", font = 1, size = 16, align = 0, overflow = 1, ref = 120},
				{id = "ex_ir2", font = 1, size = 16, align = 0, overflow = 1, ref = 121},
				{id = "ex_ir3", font = 1, size = 16, align = 0, overflow = 1, ref = 122},
				{id = "ex_ir4", font = 1, size = 16, align = 0, overflow = 1, ref = 123},
				{id = "ex_ir5", font = 1, size = 16, align = 0, overflow = 1, ref = 124},
				{id = "ex_ir6", font = 1, size = 16, align = 0, overflow = 1, ref = 125},
				{id = "ex_ir7", font = 1, size = 16, align = 0, overflow = 1, ref = 126},
				{id = "ex_ir8", font = 1, size = 16, align = 0, overflow = 1, ref = 127},
				{id = "ex_ir9", font = 1, size = 16, align = 0, overflow = 1, ref = 128},
				{id = "ex_ir10", font = 1, size = 16, align = 0, overflow = 1, ref = 129},

	}


	skin.judgegraph = {
		{id = "judgegraph", noGap = 0, orderReverse = 1, type = 1, backTexOff = 1},
		{id = "fsgraph", noGap = 0, orderReverse = 1, type = 2, backTexOff = 1},
	}








	skin.timingdistributiongraph = {
		{id = "timingGraph", backTexOff = 1, graphColor = "f5f5f5"},
	}

		--数字関連
		skin.value = {
		-- 自己べ_EXSCORE
				{id = "Best_Exscore", src = 9, x = 0, y = 202, w = 220, h = 20, divx = 11, digit = 5, ref = 170, align = 0,},
		-- 今回_EXSCORE
				{id = "Current_Exscore", src = 9, x = 0, y = 222, w = 220, h = 20, divx = 11, digit = 5, ref = 171, align = 0,},
		-- ベストスコアレート
				{id = "Best_Exscore_Acc", src = 9, x = 0, y = 381, w = 143, h = 14, divx = 11, digit = 3, ref = 183, align = 0,},
				{id = "Best_Exscore_Acc2", src = 9, x = 0, y = 381, w = 130, h = 14, divx = 10, digit = 2, ref = 184, align = 0, padding = 1},
		-- 今回のスコアレート
				{id = "Current_Exscore_Acc", src = 9, x = 0, y = 395, w = 143, h = 14, divx = 11, digit = 3, ref = 102, align = 0,},
				{id = "Current_Exscore_Acc2", src = 9, x = 0, y = 395, w = 130, h = 14, divx = 10, digit = 2, ref = 103, align = 0, padding = 1},
		-- 自己べ_ミスカウント
				{id = "Best_Misscount", src = 9, x = 0, y = 202, w = 220, h = 20, divx = 11, digit = 5, ref = 176, align = 0,},
		-- 今回_ミスカウント
				{id = "Current_Misscount", src = 9, x = 0, y = 222, w = 220, h = 20, divx = 11, digit = 5, ref = 76, align = 0,},
		--ターゲットスコア
				{id = "TARGETSCORE", src = 9, x = 0, y = 242, w = 220, h = 20, divx = 11, digit = 5, ref = 151, align = 0,},
		--ターゲットのレート
				{id = "TARGETRATE1", src = 9, x = 0, y = 242, w = 220, h = 20, divx = 11, digit = 3, ref = 157, align = 0,},
				{id = "TARGETRATE2", src = 9, x = 0, y = 242, w = 200, h = 20, divx = 10, digit = 2, ref = 158, align = 0, padding = 1},
		--差分_ミスカウント
				{id = "Diff_Misscount",  src = 9, x = 0, y = Misscount_Num_y, w = 228, h = 36, divx = 12, divy = 2, digit = 5, ref = 178, align = 0, zeropadding = 2},
		-- 差分_EXSCORE
				{id = "Diff_Exscore", src = 9, x = 0, y = 165, w = 228, h = 36, divx = 12, divy = 2, digit = 5, ref = 172, align = 0, zeropadding = 2},
		-- ランク差分スコア
				{id = "RANK_Diff_Exscore", src = 9,x = 0, y = NextRank_Num_y, w = 228, h = 36, divx = 12, digit = 5, divy = 2, ref = 154, align = 0, zeropadding = 2},
		--ターゲット差分スコア
				{id = "Diff_TARGETSCORE", src = 9, x = 0, y = 165, w = 228, h = 36, divx = 12, divy = 2, digit = 5, ref = 153, align = 0, zeropadding = 2},
				{id = "TARGET_MYRATE1", src = 9, x = 0, y = 165, w = 209, h = 18, divx = 11, divy = 1, digit = 3, ref = 102, align = 0},
				{id = "TARGET_MYRATE2", src = 9, x = 0, y = 165, w = 190, h = 18, divx = 10, divy = 1, digit = 2, ref = 103, align = 0, padding = 1},
		--COMBO BREAK
				{id = "COMBOBREAK", src = 9, x = 0, y = 151, w = 154, h = 13, divx = 11, digit = 5, ref = 425, align = 0},
		--MAX COMBO
				{id = "MAXCOMBO", src = 9, x = 0, y = 151, w = 154, h = 13, divx = 11, digit = 5, ref = 75, align = 0},
		--IR関連
				{id = "IR_TOTAL", src = 9, x = 0, y = 130, w = 242, h = 20, divx = 11, digit = 4, ref = 180, align = 0,},
				{id = "IR_BEST", src = 9, x = 0, y = 130, w = 242, h = 20, divx = 11, digit = 4, ref = 182, align = 0,},
				{id = "IR_CURRENT", src = 9, x = 0, y = 130, w = 242, h = 20, divx = 11, digit = 4, ref = 179, align = 0,},

		-- 追加フレーム向け
				{id = "ex_bpm1", src = 9, x = 0, y = 202, w = 220, h = 20, divx = 11, digit = 3, ref = 90, align = 2,},
				{id = "ex_bpm2", src = 9, x = 0, y = 202, w = 220, h = 20, divx = 11, digit = 3, ref = 91, align = 2,},
				{id = "ex_duration1", src = 9, x = 0, y = 202, w = 220, h = 20, divx = 11, digit = 2, ref = 1163, align = 2,},
				{id = "ex_duration2", src = 9, x = 0, y = 410, w = 220, h = 20, divx = 11, digit = 2, ref = 1164, align = 2,},
				{id = "ex_total", src = 9, x = 0, y = 202, w = 220, h = 20, divx = 11, digit = 4, ref = 368, align = 2,},

				{id = "ex_irrank1", src = 9, x = 0, y = 202, w = 220, h = 20, divx = 11, digit = 4, ref = 390, align = 2,},
				{id = "ex_irrank2", src = 9, x = 0, y = 202, w = 220, h = 20, divx = 11, digit = 4, ref = 391, align = 2,},
				{id = "ex_irrank3", src = 9, x = 0, y = 202, w = 220, h = 20, divx = 11, digit = 4, ref = 392, align = 2,},
				{id = "ex_irrank4", src = 9, x = 0, y = 202, w = 220, h = 20, divx = 11, digit = 4, ref = 393, align = 2,},
				{id = "ex_irrank5", src = 9, x = 0, y = 202, w = 220, h = 20, divx = 11, digit = 4, ref = 394, align = 2,},
				{id = "ex_irrank6", src = 9, x = 0, y = 202, w = 220, h = 20, divx = 11, digit = 4, ref = 395, align = 2,},
				{id = "ex_irrank7", src = 9, x = 0, y = 202, w = 220, h = 20, divx = 11, digit = 4, ref = 396, align = 2,},
				{id = "ex_irrank8", src = 9, x = 0, y = 202, w = 220, h = 20, divx = 11, digit = 4, ref = 397, align = 2,},
				{id = "ex_irrank9", src = 9, x = 0, y = 202, w = 220, h = 20, divx = 11, digit = 4, ref = 398, align = 2,},
				{id = "ex_irrank10", src = 9, x = 0, y = 202, w = 220, h = 20, divx = 11, digit = 4, ref = 399, align = 2,},

				{id = "ex_irex1", src = 9, x = 0, y = 202, w = 220, h = 20, divx = 11, digit = 4, ref = 380, align = 2,},
				{id = "ex_irex2", src = 9, x = 0, y = 202, w = 220, h = 20, divx = 11, digit = 4, ref = 381, align = 2,},
				{id = "ex_irex3", src = 9, x = 0, y = 202, w = 220, h = 20, divx = 11, digit = 4, ref = 382, align = 2,},
				{id = "ex_irex4", src = 9, x = 0, y = 202, w = 220, h = 20, divx = 11, digit = 4, ref = 383, align = 2,},
				{id = "ex_irex5", src = 9, x = 0, y = 202, w = 220, h = 20, divx = 11, digit = 4, ref = 384, align = 2,},
				{id = "ex_irex6", src = 9, x = 0, y = 202, w = 220, h = 20, divx = 11, digit = 4, ref = 385, align = 2,},
				{id = "ex_irex7", src = 9, x = 0, y = 202, w = 220, h = 20, divx = 11, digit = 4, ref = 386, align = 2,},
				{id = "ex_irex8", src = 9, x = 0, y = 202, w = 220, h = 20, divx = 11, digit = 4, ref = 387, align = 2,},
				{id = "ex_irex9", src = 9, x = 0, y = 202, w = 220, h = 20, divx = 11, digit = 4, ref = 388, align = 2,},
				{id = "ex_irex10", src = 9, x = 0, y = 202, w = 220, h = 20, divx = 11, digit = 4, ref = 389, align = 2,},
		-- 差分_irscore
				{id = "ex_irex1_sb", src = 9, x = 0, y = 165, w = 228, h = 36, divx = 12, divy = 2, digit = 5,align = 0, zeropadding = 2 ,value = function()
					return main_state.number(171) - (main_state.number(380))
				end,
				},
				{id = "ex_irex2_sb", src = 9, x = 0, y = 165, w = 228, h = 36, divx = 12, divy = 2, digit = 5,align = 0, zeropadding = 2 ,value = function()
					return main_state.number(171) - (main_state.number(381))
				end,
				},
				{id = "ex_irex3_sb", src = 9, x = 0, y = 165, w = 228, h = 36, divx = 12, divy = 2, digit = 5,align = 0, zeropadding = 2 ,value = function()
					return main_state.number(171) - (main_state.number(382))
				end,
				},
				{id = "ex_irex4_sb", src = 9, x = 0, y = 165, w = 228, h = 36, divx = 12, divy = 2, digit = 5,align = 0, zeropadding = 2 ,value = function()
					return main_state.number(171) - (main_state.number(383))
				end,
				},
				{id = "ex_irex5_sb", src = 9, x = 0, y = 165, w = 228, h = 36, divx = 12, divy = 2, digit = 5,align = 0, zeropadding = 2 ,value = function()
					return main_state.number(171) - (main_state.number(384))
				end,
				},
				{id = "ex_irex6_sb", src = 9, x = 0, y = 165, w = 228, h = 36, divx = 12, divy = 2, digit = 5,align = 0, zeropadding = 2 ,value = function()
					return main_state.number(171) - (main_state.number(385))
				end,
				},
				{id = "ex_irex7_sb", src = 9, x = 0, y = 165, w = 228, h = 36, divx = 12, divy = 2, digit = 5,align = 0, zeropadding = 2 ,value = function()
					return main_state.number(171) - (main_state.number(386))
				end,
				},
				{id = "ex_irex8_sb", src = 9, x = 0, y = 165, w = 228, h = 36, divx = 12, divy = 2, digit = 5,align = 0, zeropadding = 2 ,value = function()
					return main_state.number(171) - (main_state.number(387))
				end,
				},
				{id = "ex_irex9_sb", src = 9, x = 0, y = 165, w = 228, h = 36, divx = 12, divy = 2, digit = 5,align = 0, zeropadding = 2 ,value = function()
					return main_state.number(171) - (main_state.number(388))
				end,
				},
				{id = "ex_irex10_sb", src = 9, x = 0, y = 165, w = 228, h = 36, divx = 12, divy = 2, digit = 5,align = 0, zeropadding = 2 ,value = function()
					return main_state.number(171) - (main_state.number(389))
				end,
				},


		--判定数
		--通常
				{id = "JUDGE_PG", src = 9, x = 0, y = 130, w = 242, h = 20, divx = 11, digit = 5, ref = 110, align = 0,},
				{id = "JUDGE_GR", src = 9, x = 0, y = 130, w = 242, h = 20, divx = 11, digit = 5, ref = 111, align = 0,},
				{id = "JUDGE_GD", src = 9, x = 0, y = 130, w = 242, h = 20, divx = 11, digit = 5, ref = 112, align = 0,},
				{id = "JUDGE_BD", src = 9, x = 0, y = 130, w = 242, h = 20, divx = 11, digit = 5, ref = 113, align = 0,},
				{id = "JUDGE_PR", src = 9, x = 0, y = 130, w = 242, h = 20, divx = 11, digit = 5, ref = 114, align = 0,},
				{id = "JUDGE_MS", src = 9, x = 0, y = 130, w = 242, h = 20, divx = 11, digit = 5, ref = 420, align = 0,},
		--FAST
				{id = "JUDGE_PG_F", src = 9, x = 0, y = 116, w = 154, h = 13, divx = 11, digit = 5, ref = 410, align = 0,},
				{id = "JUDGE_GR_F", src = 9, x = 0, y = 116, w = 154, h = 13, divx = 11, digit = 5, ref = 412, align = 0,},
				{id = "JUDGE_GD_F", src = 9, x = 0, y = 116, w = 154, h = 13, divx = 11, digit = 5, ref = 414, align = 0,},
				{id = "JUDGE_BD_F", src = 9, x = 0, y = 116, w = 154, h = 13, divx = 11, digit = 5, ref = 416, align = 0,},
				{id = "JUDGE_PR_F", src = 9, x = 0, y = 116, w = 154, h = 13, divx = 11, digit = 5, ref = 418, align = 0,},
				{id = "JUDGE_MS_F", src = 9, x = 0, y = 116, w = 154, h = 13, divx = 11, digit = 5, ref = 421, align = 0,},
		--SLOW
				{id = "JUDGE_PG_S", src = 9, x = 0, y = 103, w = 154, h = 13, divx = 11, digit = 5, ref = 411, align = 0,},
				{id = "JUDGE_GR_S", src = 9, x = 0, y = 103, w = 154, h = 13, divx = 11, digit = 5, ref = 413, align = 0,},
				{id = "JUDGE_GD_S", src = 9, x = 0, y = 103, w = 154, h = 13, divx = 11, digit = 5, ref = 415, align = 0,},
				{id = "JUDGE_BD_S", src = 9, x = 0, y = 103, w = 154, h = 13, divx = 11, digit = 5, ref = 417, align = 0,},
				{id = "JUDGE_PR_S", src = 9, x = 0, y = 103, w = 154, h = 13, divx = 11, digit = 5, ref = 419, align = 0,},
				{id = "JUDGE_MS_S", src = 9, x = 0, y = 103, w = 154, h = 13, divx = 11, digit = 5, ref = 422, align = 0,},
		--合計
				{id = "JUDGE_TOTAL_F", src = 9, x = 0, y = 151, w = 154, h = 13, divx = 11, digit = 5, ref = 423, align = 0,},
				{id = "JUDGE_TOTAL_S", src = 9, x = 0, y = 151, w = 154, h = 13, divx = 11, digit = 5, ref = 424, align = 0,},

		--ノーツ数とか難易度の情報枠 枠とか難易度はimageで定義
				{id = "NOTES_NUM", src = 9, x = 0, y = 328, w = 198, h = 17, divx = 11, digit = 5, ref = 74, align = 0,},
		--src終了
		}


	--ここから配置関連
		skin.destination = {

		{id = "shutter",loop=900,dst = {
			{x = 0, y = 1920, w = 1920, h = 1080},
		}},
		--背景
		--FAILED_BG
		{ id = "BG_FAILED", op = {91,920}, dst = {
			{ x = 0, y = 0, w = 1920, h = 1080 }
		}},
		--エフェクト
		{ id = "BG_FAILED", blend = 2 , loop = -1, acc = 2 , op = {91,920}, dst = {
			{time = 0, x = -192, y = -108, w = 2305, h = 1296, a = 180 },
			{time = 700, x = 0, y = 0, w = 1920, h = 1080 , a = 50  },
			{time = 1200, x = 0, y = 0, w = 1920, h = 1080 , a = 0 },
		}},
		{ id = "BG_FAILED_parts", op = {91,920}, dst = {
			{ x = 882, y = 395, w = 156, h = 216 }
		}},

		--FAILED_BG(軽量)
		{ id = "BG_FAILED_light", op = {91,921}, dst = {
			{ x = 0, y = 0, w = 1920, h = 1080 }
		}},
		--エフェクト
		{ id = "BG_FAILED_light", blend = 2 , loop = -1, acc = 2 , op = {91,921}, dst = {
			{time = 0, x = -192, y = -108, w = 2305, h = 1296, a = 180 },
			{time = 700, x = 0, y = 0, w = 1920, h = 1080 , a = 50  },
			{time = 1200, x = 0, y = 0, w = 1920, h = 1080 , a = 0 },
		}},


		--CLEAR	
		{ id = "BG_CLEAR", op = {90,920}, dst = {
			{ x = 0, y = 0, w = 1920, h = 1080 }
		}},
		--エフェクト
		{ id = "BG_CLEAR", blend = 2 , loop = -1, acc = 2 , op = {90,920}, dst = {
			{time = 0, x = -192, y = -108, w = 2305, h = 1296, a = 180 },
			{time = 700, x = 0, y = 0, w = 1920, h = 1080 , a = 50  },
			{time = 1200, x = 0, y = 0, w = 1920, h = 1080 , a = 0 },
		}},
		{ id = "BG_CLEAR_parts", op = {90,920}, dst = {
			{ x = 882, y = 395, w = 156, h = 216 }
		}},
		--CLEAR_BG(軽量)
		{ id = "BG_CLEAR_light", op = {90,921}, dst = {
			{ x = 0, y = 0, w = 1920, h = 1080 }
		}},
		--エフェクト
		{ id = "BG_CLEAR_light", blend = 2 , loop = -1, acc = 2 , op = {90,921}, dst = {
			{time = 0, x = -192, y = -108, w = 2305, h = 1296, a = 180 },
			{time = 700, x = 0, y = 0, w = 1920, h = 1080 , a = 50  },
			{time = 1200, x = 0, y = 0, w = 1920, h = 1080 , a = 0 },
		}},


		--CLEAR(Stage_file)
			{ id = -110, op = {90,931,191} , dst = {
			{ x = 0, y = 0, w = 1920, h = 1080 }
		}},
			{ id = -100, op = {90,931,191},filter = 1 , stretch = 3 , dst = {
			{ x = 0, y = 0, w = 1920, h = 1080, a = 180 }
		}},
			{ id = -100, op = {90,931,191},filter = 1 , stretch = 1 , dst = {
			{ x = 0, y = 0, w = 1920, h = 1080 }
		}},


		{ id = "BG_A", filter = 1 , op = {90, 302}, dst = {
			{ x = 0, y = 0, w = 1920, h = 1080 }
		}},
		{ id = "BG_A", blend = 2 , loop = -1, acc = 2 , op = {90, 302}, dst = {
			{time = 0, x = -192, y = -108, w = 2305, h = 1296, a = 180 },
			{time = 700, x = 0, y = 0, w = 1920, h = 1080 , a = 50  },
			{time = 1200, x = 0, y = 0, w = 1920, h = 1080 , a = 0 },
		}},

		{ id = "BG_AA", filter = 1 ,  op = {90, 301}, dst = {
			{ x = 0, y = 0, w = 1920, h = 1080 }
		}},
		{ id = "BG_AA", blend = 2 , loop = -1, acc = 2 , op = {90, 301}, dst = {
			{time = 0, x = -192, y = -108, w = 2305, h = 1296, a = 180 },
			{time = 700, x = 0, y = 0, w = 1920, h = 1080 , a = 50  },
			{time = 1200, x = 0, y = 0, w = 1920, h = 1080 , a = 0 },
		}},

		{ id = "BG_AAA", filter = 1 , op = {90, 300}, dst = {
			{ x = 0, y = 0, w = 1920, h = 1080 }
		}},
		{ id = "BG_AAA", blend = 2 , loop = -1, acc = 2 , op = {90, 300}, dst = {
			{time = 0, x = -192, y = -108, w = 2305, h = 1296, a = 180 },
			{time = 700, x = 0, y = 0, w = 1920, h = 1080 , a = 50  },
			{time = 1200, x = 0, y = 0, w = 1920, h = 1080 , a = 0 },
		}},

		--CLEAR(Stage_file)
			{ id = -110, op = {90,932,191} , dst = {
			{ x = 0, y = 0, w = 1920, h = 1080 }
		}},
			{ id = -100, op = {90,932,191},filter = 1 , stretch = 3 , dst = {
			{ x = 0, y = 0, w = 1920, h = 1080, a = 150 }
		}},
			{ id = -100, op = {90,932,191},filter = 1 , stretch = 1 , dst = {
			{ x = 0, y = 0, w = 1920, h = 1080 }
		}},

		--ステージリザルト
		--upperbase
		{id = "stageresult_under_base" ,loop = 500 , dst = {
			{time = 200 , x = 525, y = -10, w = 870, h = 62 , a = 0},
			{time = 500 , a = 200},
		}},		
		--clearupper
		{id = "stageresult_upper" , acc = 2 ,loop = 500 , op = {90,923}, dst = {
			{time = 200 , x = 55, y = 915, w = 1811, h = 165 , a = 0},
			{time = 500 , a = 255},
		}},
		--failedupper
		{id = "stageresult_upper_f", acc = 2 ,loop = 500 , op = {91,923}, dst = {
			{time = 200 , x = 55, y = 915, w = 1811, h = 165 , a = 0},
			{time = 500 , a = 255},
		}},
		
		
		--clear
		{id = "stageresult" , acc = 2 ,loop = 500 , op = {90,923}, dst = {
			{time = 200 , x = 729, y = 1043, w = 462, h = 24 , a = 0},
			{time = 500 , a = 255},
		}},
		--clearglow
		{id = "stageresult" , blend = 2 , acc = 2 , loop = 800 , op = {90,923}, dst = {
			{time = 0 ,  x = 729, y = 1043, w = 462, h = 24 , a = 0},
			{time = 800},
			{time = 1500 , a = 100},
			{time = 1600 , a = 100},
			{time = 2500 , a = 0},
			{time = 3500 , a = 0},
		}},

		--failed		
		{id = "stageresult_f", acc = 2 ,loop = 500 , op = {91,923}, dst = {
			{time = 200 ,  x = 729, y = 1043,w = 462, h = 24 , a = 0},
			{time = 500 , a = 255},
		}},
		{id = "stageresult_f" , blend = 2 , acc = 2 , loop = 800 , op = {91,923}, dst = {
			{time = 0 ,  x = 729, y = 1043,w = 462, h = 24 , a = 0},
			{time = 800},
			{time = 1500 , a = 100},
			{time = 1600 , a = 100},
			{time = 2500 , a = 0},
			{time = 3500 , a = 0},
		}},

	



		--ステージリザルト(レガシーバージョン用)
		--clearupper
		{id = "stageresult_upper" , acc = 2 ,loop = 500 , op = {90,924}, dst = {
			{time = 200 , x = 55, y = 915, w = 1811, h = 165 , a = 0},
			{time = 500 , a = 255},
		}},		
		--clear
		{id = "stageresult" , acc = 2 ,loop = 500 , op = {90,924}, dst = {
			{time = 200 ,  x = 729, y = 1043, w = 462, h = 24 , a = 0},
			{time = 500 , a = 255},
		}},
		--clearglow
		{id = "stageresult" , blend = 2 , acc = 2 , loop = 800 , op = {90,924}, dst = {
			{time = 0 ,  x = 729, y = 1043,w = 462, h = 24 , a = 0},
			{time = 800},
			{time = 1500 , a = 100},
			{time = 1600 , a = 100},
			{time = 2500 , a = 0},
			{time = 3500 , a = 0},
		}},
		--failedupper
		{id = "stageresult_upper_f", acc = 2 ,loop = 500 , op = {91,924}, dst = {
			{time = 200 , x = 55, y = 915, w = 1811, h = 165 , a = 0},
			{time = 500 , a = 255},
		}},
		--failed		
		{id = "stageresult_f", acc = 2 ,loop = 500 , op = {91,924}, dst = {
			{time = 200 ,  x = 729, y = 1043,w = 462, h = 24 , a = 0},
			{time = 500 , a = 255},
		}},
		{id = "stageresult_f" , blend = 2 , acc = 2 , loop = 800 , op = {91,924}, dst = {
			{time = 0 ,  x = 729, y = 1043, w = 462, h = 24 , a = 0},
			{time = 800},
			{time = 1500 , a = 100},
			{time = 1600 , a = 100},
			{time = 2500 , a = 0},
			{time = 3500 , a = 0},
		}},



		--追加フレーム
		{id = "extend_frame", loop = 200 , op = {917} ,  dst = {
			{time = 0 , x = 1365 - playside_extend , y = 56, w = 550, h = 971, a = 0 },
			{time = 200, a = 255 },
		}},
		{id = "ex_title", loop = 200 , op = {917} ,   dst = {
			{time = 0 , x = 1890 - playside_extend , y = 904, w = 250, h = 82, a = 0 },
			{time = 200, a = 255 },
		}},
		{id = "ex_title2", loop = 200 , op = {917} ,   dst = {
			{time = 0 , x = 1890 - playside_extend , y = 904 - 29*1, w = 250, h = 82, a = 0 },
			{time = 200, a = 255 },
		}},
		{id = "ex_title3", loop = 200 , op = {917} ,   dst = {
			{time = 0 , x = 1890 - playside_extend , y = 904 - 29*2, w = 250, h = 82, a = 0 },
			{time = 200, a = 255 },
		}},
		{id = "ex_title4", loop = 200 , op = {917} ,   dst = {
			{time = 0 , x = 1890 - playside_extend , y = 904 - 29*3, w = 250, h = 82, a = 0 },
			{time = 200, a = 255 },
		}},
		{id = "ex_title5", loop = 200 , op = {917} ,   dst = {
			{time = 0 , x = 1890 - playside_extend , y = 904 - 29*4, w = 250, h = 82, a = 0 },
			{time = 200, a = 255 },
		}},

		--ここからIR
		{id = "ex_ir", loop = 200 , op = {917} , dst = {
			{time = 0 , x = 1900 - playside_extend , y = 436, w = 250, h = 82, a = 0 },
			{time = 200, a = 255 },
		}},	
		{id = "IR_BEST", loop = 200 , op = {917} , dst = {
			{time = 0 , x = 1424 - playside_extend , y = 460, w = 22, h = 20, a = 0 },
			{time = 200, a = 255 },
		}},	
		{id = "IR_CURRENT", loop = 200 , op = {917} , dst = {
			{time = 0 , x = 1585 - playside_extend , y = 460, w = 22, h = 20, a = 0 },
			{time = 200, a = 255 },
		}},	
		{id = "IR_TOTAL", loop = 200 , op = {917} , dst = {
			{time = 0 , x = 1764 - playside_extend , y = 460, w = 22, h = 20, a = 0 },
			{time = 200, a = 255 },
		}},	

		{id = "ir_wait1", loop = 300 , op = {51,917}, draw = function()
		local wait_timer = main_state.timer(173)
		local wait_op = WAIT_OPTION
		return wait_timer == main_state.timer_off_value and wait_op == 1 
		end , dst ={
			{time = 100 , x = 1383 - playside_extend, y = 426, w = 517, h = 31, a = 0 },
			{time = 300 , a = 255},
			{time = 1300 , a = 0},
			{time = 2300 , a = 255},
		}},
		{id = "ir_fail", loop = 300 , timer = 174 , op = {51,917} , dst ={
			{time = 100 , x = 1383 - playside_extend, y = 426, w = 517, h = 31, a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "ir_comp", loop = 300 , timer = 173 , op = {51,917} , dst ={
			{time = 100 , x = 1383 - playside_extend, y = 426, w = 517, h = 31, a = 0 },
			{time = 300 , a = 255},
		}},

		{id = "ir_frame", loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1380 - playside_extend, y = 383, w = 522, h = 34 , a = 0 },
			{time = 200 , a = 255},
		}},	
		{id = "ir_frame", loop = 220 ,op = {917} , dst ={
			{time = 100 , x = 1380 - playside_extend, y = 383 - 35*1 , w = 522, h = 34 , a = 0 },
			{time = 220 , a = 255},
		}},	
		{id = "ir_frame", loop = 240 ,op = {917} , dst ={
			{time = 100 , x = 1380 - playside_extend, y = 383 - 35*2 , w = 522, h = 34 , a = 0 },
			{time = 240 , a = 255},
		}},	
		{id = "ir_frame", loop = 260 ,op = {917} , dst ={
			{time = 100 , x = 1380 - playside_extend, y = 383 - 35*3 , w = 522, h = 34 , a = 0 },
			{time = 260 , a = 255},
		}},	
		{id = "ir_frame", loop = 280 ,op = {917} , dst ={
			{time = 100 , x = 1380 - playside_extend, y = 383 - 35*4 , w = 522, h = 34 , a = 0 },
			{time = 280 , a = 255},
		}},	
		{id = "ir_frame", loop = 300 ,op = {917} , dst ={
			{time = 100 , x = 1380 - playside_extend, y = 383 - 35*5 , w = 522, h = 34 , a = 0 },
			{time = 300 , a = 255},
		}},	
		{id = "ir_frame", loop = 320 ,op = {917} , dst ={
			{time = 100 , x = 1380 - playside_extend, y = 383 - 35*6 , w = 522, h = 34 , a = 0 },
			{time = 320 , a = 255},
		}},	
		{id = "ir_frame", loop = 340 ,op = {917} , dst ={
			{time = 100 , x = 1380 - playside_extend, y = 383 - 35*7 , w = 522, h = 34 , a = 0 },
			{time = 340 , a = 255},
		}},	
		{id = "ir_frame", loop = 360 ,op = {917} , dst ={
			{time = 100 , x = 1380 - playside_extend, y = 383 - 35*8 , w = 522, h = 34 , a = 0 },
			{time = 360 , a = 255},
		}},	
		{id = "ir_frame", loop = 380 ,op = {917} , dst ={
			{time = 100 , x = 1380 - playside_extend, y = 383 - 35*9 , w = 522, h = 34 , a = 0 },
			{time = 380 , a = 255},
		}},	

		{id = "ex_ir1", loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1474 - playside_extend, y = 376, w = 145, h = 32 , a = 0 },
			{time = 200 , a = 255},
		}},	
		{id = "ex_ir2", loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1474 - playside_extend, y = 376 - 35*1, w = 145, h = 32 , a = 0 },
			{time = 200 , a = 255},
		}},	
		{id = "ex_ir3", loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1474 - playside_extend, y = 376 - 35*2, w = 145, h = 32 , a = 0 },
			{time = 200 , a = 255},
		}},	
		{id = "ex_ir4", loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1474 - playside_extend, y = 376 - 35*3, w = 145, h = 32 , a = 0 },
			{time = 200 , a = 255},
		}},	
		{id = "ex_ir5", loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1474 - playside_extend, y = 376 - 35*4, w = 145, h = 32 , a = 0 },
			{time = 200 , a = 255},
		}},	
		{id = "ex_ir6", loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1474 - playside_extend, y = 376 - 35*5, w = 145, h = 32 , a = 0 },
			{time = 200 , a = 255},
		}},	
		{id = "ex_ir7", loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1474 - playside_extend, y = 376 - 35*6, w = 145, h = 32 , a = 0 },
			{time = 200 , a = 255},
		}},	
		{id = "ex_ir8", loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1474 - playside_extend, y = 376 - 35*7, w = 145, h = 32 , a = 0 },
			{time = 200 , a = 255},
		}},	
		{id = "ex_ir9", loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1474 - playside_extend, y = 376 - 35*8, w = 145, h = 32 , a = 0 },
			{time = 200 , a = 255},
		}},	
		{id = "ex_ir10", loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1474 - playside_extend, y = 376 - 35*9, w = 145, h = 32 , a = 0 },
			{time = 200 , a = 255},
		}},	

		{id = "ex_irrank1",filter = 1, loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1388 - playside_extend, y = 390, w = 17, h = 20 , a = 0 },
			{time = 200 , a = 255},
		}},	
		{id = "ex_irrank2",filter = 1, loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1388 - playside_extend, y = 390 - 35*1, w = 17, h = 20 , a = 0 },
			{time = 200 , a = 255},
		}},	
		{id = "ex_irrank3",filter = 1, loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1388 - playside_extend, y = 390 - 35*2, w = 17, h = 20 , a = 0 },
			{time = 200 , a = 255},
		}},	
		{id = "ex_irrank4",filter = 1, loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1388 - playside_extend, y = 390 - 35*3, w = 17, h = 20 , a = 0 },
			{time = 200 , a = 255},
		}},	
		{id = "ex_irrank5",filter = 1, loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1388 - playside_extend, y = 390 - 35*4, w = 17, h = 20 , a = 0 },
			{time = 200 , a = 255},
		}},	
		{id = "ex_irrank6",filter = 1, loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1388 - playside_extend, y = 390 - 35*5, w = 17, h = 20 , a = 0 },
			{time = 200 , a = 255},
		}},	
		{id = "ex_irrank7",filter = 1, loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1388 - playside_extend, y = 390 - 35*6, w = 17, h = 20 , a = 0 },
			{time = 200 , a = 255},
		}},	
		{id = "ex_irrank8",filter = 1, loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1388 - playside_extend, y = 390 - 35*7, w = 17, h = 20 , a = 0 },
			{time = 200 , a = 255},
		}},	
		{id = "ex_irrank9",filter = 1, loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1388 - playside_extend, y = 390 - 35*8, w = 17, h = 20 , a = 0 },
			{time = 200 , a = 255},
		}},	
		{id = "ex_irrank10",filter = 1, loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1388 - playside_extend, y = 390 - 35*9, w = 17, h = 20 , a = 0 },
			{time = 200 , a = 255},
		}},	


		{id = "ex_irex1",filter = 1, loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1717 - playside_extend, y = 390, w = 18, h = 20 , a = 0 },
			{time = 200 , a = 255},
		}},		
		{id = "ex_irex2",filter = 1, loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1717 - playside_extend, y = 390 - 35*1, w = 18, h = 20 , a = 0 },
			{time = 200 , a = 255},
		}},		
		{id = "ex_irex3",filter = 1, loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1717 - playside_extend, y = 390 - 35*2, w = 18, h = 20 , a = 0 },
			{time = 200 , a = 255},
		}},		
		{id = "ex_irex4",filter = 1, loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1717 - playside_extend, y = 390 - 35*3, w = 18, h = 20 , a = 0 },
			{time = 200 , a = 255},
		}},		
		{id = "ex_irex5",filter = 1, loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1717 - playside_extend, y = 390 - 35*4, w = 18, h = 20 , a = 0 },
			{time = 200 , a = 255},
		}},		
		{id = "ex_irex6",filter = 1, loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1717 - playside_extend, y = 390 - 35*5, w = 18, h = 20 , a = 0 },
			{time = 200 , a = 255},
		}},		
		{id = "ex_irex7",filter = 1, loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1717 - playside_extend, y = 390 - 35*6, w = 18, h = 20 , a = 0 },
			{time = 200 , a = 255},
		}},		
		{id = "ex_irex8",filter = 1, loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1717 - playside_extend, y = 390 - 35*7, w = 18, h = 20 , a = 0 },
			{time = 200 , a = 255},
		}},		
		{id = "ex_irex9",filter = 1, loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1717 - playside_extend, y = 390 - 35*8, w = 18, h = 20 , a = 0 },
			{time = 200 , a = 255},
		}},	
		{id = "ex_irex10",filter = 1, loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1717 - playside_extend, y = 390 - 35*9, w = 18, h = 20 , a = 0 },
			{time = 200 , a = 255},
		}},	

		{id = "ex_irex1_sb",filter = 1, loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1804 - playside_extend, y = 390, w = 18, h = 20 , a = 0 },
			{time = 200 , a = 255},
		}},	
		{id = "ex_irex2_sb",filter = 1, loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1804 - playside_extend, y = 390 - 35*1, w = 18, h = 20 , a = 0 },
			{time = 200 , a = 255},
		}},	
		{id = "ex_irex3_sb",filter = 1, loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1804 - playside_extend, y = 390 - 35*2, w = 18, h = 20 , a = 0 },
			{time = 200 , a = 255},
		}},	
		{id = "ex_irex4_sb",filter = 1, loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1804 - playside_extend, y = 390 - 35*3, w = 18, h = 20 , a = 0 },
			{time = 200 , a = 255},
		}},	
		{id = "ex_irex5_sb",filter = 1, loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1804 - playside_extend, y = 390 - 35*4, w = 18, h = 20 , a = 0 },
			{time = 200 , a = 255},
		}},	
		{id = "ex_irex6_sb",filter = 1, loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1804 - playside_extend, y = 390 - 35*5, w = 18, h = 20 , a = 0 },
			{time = 200 , a = 255},
		}},	
		{id = "ex_irex7_sb",filter = 1, loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1804 - playside_extend, y = 390 - 35*6, w = 18, h = 20 , a = 0 },
			{time = 200 , a = 255},
		}},	
		{id = "ex_irex8_sb",filter = 1, loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1804 - playside_extend, y = 390 - 35*7, w = 18, h = 20 , a = 0 },
			{time = 200 , a = 255},
		}},	
		{id = "ex_irex9_sb",filter = 1, loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1804 - playside_extend, y = 390 - 35*8, w = 18, h = 20 , a = 0 },
			{time = 200 , a = 255},
		}},	
		{id = "ex_irex10_sb",filter = 1, loop = 200 ,op = {917} , dst ={
			{time = 100 , x = 1804 - playside_extend, y = 390 - 35*9, w = 18, h = 20 , a = 0 },
			{time = 200 , a = 255},
		}},	

		--グラフ一式
		{id = "judgegraph", loop = 200 , op = {917} ,  dst = {
			{time = 0 , x = 1381 - playside_extend , y = 740, w = 520, h = 82, a = 0 },
			{time = 200, a = 255 },
		}},
		{id = "fsgraph", loop = 200 , op = {917} , dst = {
			{time = 0 , x = 1381 - playside_extend , y = 635, w = 520, h = 82, a = 0 },
			{time = 200, a = 255 },
		}},
		{id = "timingGraph", loop = 200 , op = {917} , dst = {
			{time = 0 , x = 1381 - playside_extend , y = 530, w = 520, h = 82, a = 0 },
			{time = 200, a = 140 },
		}},
		{id = "timing", loop = 200 , op = {917} , dst = {
			{time = 0 , x = 1380 - playside_extend , y = 529, w = 522, h = 312, a = 0 },
			{time = 200, a = 255 },
		}},



		--フレーム
		--スコア枠
		{id = "SCORE_FRAME", loop = 200 ,  dst = {
			{time = 0 , x = 23 + playside_score , y = 362, w = 485, h = 345, a = 0 },
			{time = 200, a = 255 },
		}},

		{id = "SCORE_PER1", loop = 200 ,  dst = {
			{time = 0 , x = 262 + playside_score , y = 539, w = 45, h = 13, a = 0 },
			{time = 200, a = 255 },
		}},
		{id = "SCORE_PER2", loop = 200 ,  dst = {
			{time = 0 , x = 413 + playside_score , y = 539, w = 45, h = 13, a = 0 },
			{time = 200, a = 255 },
		}},
		{id = "TERGET_PER1", loop = 200 ,  dst = {
			{time = 0 , x = 446+8 + playside_score , y = 400, w = 26, h = 18, a = 0 },
			{time = 200, a = 255 },
		}},
		{id = "TERGET_PER2", loop = 200 , dst = {
			{time = 0 , x = 446 + playside_score , y = 365, w = 23, h = 18, a = 0 },
			{time = 200, a = 255 },
		}},
		{id = "TERGET_PER_dot1", loop = 200 ,  dst = {
			{time = 0 , x = 403+8 + playside_score , y = 398, w = 8, h = 18, a = 0 },
			{time = 200, a = 255 },
		}},
		{id = "TERGET_PER_dot2", loop = 200 , dst = {
			{time = 0 , x = 404 + playside_score , y = 365, w = 7, h = 18, a = 0 },
			{time = 200, a = 255 },
		}},


		--judge_detail欄
		--判定数_IR-OFF
		{id = "judge_detail",loop = 100, dst = {
			{time = 0, x = 3 + playside_judge, y = 35, w = 514, h = 369 , a = 0},
			{time = 100, a = 255 },
		}},

		--ピカグレ文字
		{id = "p_great",loop = 100 , dst = {
			{time = 0, x = 55 + playside_judge, y = 312, w = 91, h = 22 , a = 0},
			{time = 100, a = 255 },
		}},
	
		--グルーヴゲージ一式
		{id = "Groove_main", acc = 2 ,loop = 200 , dst = {
			{time = 0, x = 13 + groove_frame_side , y = 716, w = 565, h = 309 , a = 0},
			{time = 200, x = 13 + groove_frame_side , y = 716, w = 565, h = 309 , a = 255},
		}},
		{id = "Gauge_frame", acc = 2 ,loop = 300 , dst = {
			{time = 100 , x = 37 + groove_side , y = 879, w = 527, h = 0 , a = 0},
			{time = 300 , x = 37 + groove_side , y = 746, w = 527, h = 267, a = 255} ,
		}},
		{id = "gauge", acc = 2 ,loop = 400 , dst = {
			{time = 200 , x = 41 + groove_side , y = 750, w = 519, h = 259, a = 0},
			{time = 400 , x = 41 + groove_side , y = 750, w = 519, h = 259, a = 200},
		}},
		{id = "RANDOM_OP", acc = 2 ,loop = 300 , dst = {
			{time = 100 , x = 38 + groove_op_side , y = 725, w = 130, h = 12 , a = 0},
			{time = 300 , x = 38 + groove_op_side , y = 725, w = 130, h = 12, a = 255} ,
		}},		

		--フレームここまで


		--更新グロー
		--クリア
		{id = "NEWRECORD_1",loop = 200 , draw = function()
			local BESTCLEAR = main_state.number(371)
			local CURRENTCLEAR = main_state.number(370)
			return BESTCLEAR < CURRENTCLEAR and CURRENTCLEAR >= 2
		end,  dst = {
			{time = 0, x= 341 + playside_score , y = 655, w = 166, h = 51, a = 0},
			{time = 200, a = 255},
			{time = 600, a = 255},
			{time = 1400, a = 0},
			{time = 2400, a = 255},
		}},
		--DJLEVEL
		{id = "NEWRECORD_1",loop = 200 , op = {335}, dst = {
			{time = 0, x= 341 + playside_score , y = 606,  w = 166, h = 51, a = 0},
			{time = 200, a = 255},
			{time = 600, a = 255},
			{time = 1400, a = 0},
			{time = 2400, a = 255},
		}},
		--スコア
		{id = "NEWRECORD_2", loop = 200, op = {330}, dst = {
			{time = 0, x= 341 + playside_score ,y = 528, w = 166, h = 57, a = 0},
			{time = 200, a = 255},
			{time = 600, a = 255},
			{time = 1400, a = 0},
			{time = 2400, a = 255},
		}},
		--ミスカウント
		{id = "NEWRECORD_1", loop = 200, op = {332}, dst = {
			{time = 0, x= 341 + playside_score , y = 456,  w = 166, h = 51, a = 0},
			{time = 200, a = 255},
			{time = 600, a = 255},
			{time = 1400, a = 0},
			{time = 2400, a = 255},
		}},

		--DJRANK
		{id = "RANK_b_AAA", loop = 300 , op = {300}, dst = {
			{time = 100 , x = 116 + groove_side , y = 825, w = 396, h = 524 , a = 0},
			{time = 300 , x = 116 + groove_side , y = 825, w = 369, h = 124 , a = 255},
		}},
		{id = "RANK_b_AAA", blend = 2 , loop = 300 , op = {300}, dst = {
			{time = 300 , x = 116 + groove_side , y = 825, w = 369, h = 124 , a = 0},
			{time = 700 , a = 100},
			{time = 1400 , a = 0},
			{time = 2100 , a = 0},
		}},

		{id = "RANK_b_AA", loop = 300 , op = {301}, dst = {
			{time = 100 , x = 116 + groove_side , y = 825, w = 396, h = 524 , a = 0},
			{time = 300 , x = 116 + groove_side , y = 825, w = 369, h = 124 , a = 255},
		}},
		{id = "RANK_b_AA", blend = 2 , loop = 300 , op = {301}, dst = {
			{time = 300 , x = 116 + groove_side , y = 825, w = 369, h = 124 , a = 0},
			{time = 700 , a = 100},
			{time = 1400 , a = 0},
			{time = 2100 , a = 0},
		}},

		{id = "RANK_b_A", loop = 300 , op = {302}, dst = {
			{time = 100 , x = 116 + groove_side , y = 825, w = 396, h = 524 , a = 0},
			{time = 300 , x = 116 + groove_side , y = 825, w = 369, h = 124 , a = 255},
		}},
		{id = "RANK_b_A", blend = 2 , loop = 300 , op = {302}, dst = {
			{time = 300 , x = 116 + groove_side , y = 825, w = 369, h = 124 , a = 0},
			{time = 700 , a = 100},
			{time = 1400 , a = 0},
			{time = 2100 , a = 0},
		}},

		{id = "RANK_b_B", loop = 300 , op = {303}, dst = {
			{time = 100 , x = 116 + groove_side , y = 825, w = 396, h = 524 , a = 0},
			{time = 300 , x = 116 + groove_side , y = 825, w = 369, h = 124 , a = 255},
		}},
		{id = "RANK_b_B", blend = 2 , loop = 300 , op = {303}, dst = {
			{time = 300 , x = 116 + groove_side , y = 825, w = 369, h = 124 , a = 0},
			{time = 700 , a = 100},
			{time = 1400 , a = 0},
			{time = 2100 , a = 0},
		}},


		{id = "RANK_b_C", loop = 300 , op = {304}, dst = {
			{time = 100 , x = 116 + groove_side , y = 825, w = 396, h = 524 , a = 0},
			{time = 300 , x = 116 + groove_side , y = 825, w = 369, h = 124 , a = 255},
		}},

		{id = "RANK_b_C", blend = 2 , loop = 300 , op = {304}, dst = {
			{time = 300 , x = 116 + groove_side , y = 825, w = 369, h = 124 , a = 0},
			{time = 700 , a = 100},
			{time = 1400 , a = 0},
			{time = 2100 , a = 0},
		}},

		{id = "RANK_b_D", loop = 300 , op = {305}, dst = {
			{time = 100 , x = 116 + groove_side , y = 825, w = 396, h = 524 , a = 0},
			{time = 300 , x = 116 + groove_side , y = 825, w = 369, h = 124 , a = 255},
		}},
		{id = "RANK_b_E", blend = 2 , loop = 300 , op = {306}, dst = {
			{time = 300 , x = 116 + groove_side , y = 825, w = 369, h = 124 , a = 0},
			{time = 700 , a = 100},
			{time = 1400 , a = 0},
			{time = 2100 , a = 0},
		}},

		{id = "RANK_b_E", loop = 300 , op = {306}, dst = {
			{time = 100 , x = 116 + groove_side , y = 825, w = 396, h = 524 , a = 0},
			{time = 300 , x = 116 + groove_side , y = 825, w = 369, h = 124 , a = 255},
		}},
		{id = "RANK_b_E", blend = 2 , loop = 300 , op = {306}, dst = {
			{time = 300 , x = 116 + groove_side , y = 825, w = 369, h = 124 , a = 0},
			{time = 700 , a = 100},
			{time = 1400 , a = 0},
			{time = 2100 , a = 0},
		}},

		{id = "RANK_b_F", loop = 300 , acc = 2 , op = {307}, dst = {
			{time = 100 , x = 116 + groove_side , y = 825, w = 396, h = 524 , a = 0},
			{time = 300 , x = 116 + groove_side , y = 825, w = 369, h = 124 , a = 255},
		}},
		{id = "RANK_b_F", blend = 2 , loop = 300 , acc = 2 , op = {307}, dst = {
			{time = 300 , x = 116 + groove_side , y = 825, w = 369, h = 124 , a = 0},
			{time = 700 , a = 100},
			{time = 1400 , a = 0},
			{time = 2100 , a = 0},
		}},

		--ランク自己ベスト
		{id = "RANK_m_AAA", loop = 300 , op = {320}, dst = {
			{time = 100 , x= 227 + playside_score , y = 620, w = 69, h = 23 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_m_AA", loop = 300 , op = {321}, dst = {
			{time = 100 , x= 227 + playside_score , y = 620, w = 69, h = 23 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_m_A", loop = 300 , op = {322}, dst = {
			{time = 100 , x= 227 + playside_score , y = 620, w = 69, h = 23 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_m_B", loop = 300 , op = {323}, dst = {
			{time = 100 , x= 227 + playside_score , y = 620, w = 69, h = 23 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_m_C", loop = 300 , op = {324}, dst = {
			{time = 100 , x= 227 + playside_score , y = 620, w = 69, h = 23 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_m_D", loop = 300 , op = {325}, dst = {
			{time = 100 , x= 227 + playside_score , y = 620, w = 69, h = 23 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_m_E", loop = 300 , op = {326}, dst = {
			{time = 100 , x= 227 + playside_score , y = 620, w = 69, h = 23 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_m_F", loop = 300 , op = {327}, dst = {
			{time = 100 , x= 227 + playside_score , y = 620, w = 69, h = 23 , a = 0},
			{time = 300 , a = 255},
		}},
		--ランク今回
		{id = "RANK_m_AAA", loop = 300 , op = {300}, dst = {
			{time = 100 , x= 383 + playside_score , y = 620,w = 69, h = 23 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_m_AA", loop = 300 , op = {301}, dst = {
			{time = 100 , x= 383 + playside_score , y = 620,w = 69, h = 23 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_m_A", loop = 300 , op = {302}, dst = {
			{time = 100 , x= 383 + playside_score , y = 620,w = 69, h = 23 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_m_B", loop = 300 , op = {303}, dst = {
			{time = 100 , x= 383 + playside_score , y = 620,w = 69, h = 23 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_m_C", loop = 300 , op = {304}, dst = {
			{time = 100 , x= 383 + playside_score , y = 620,w = 69, h = 23 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_m_D", loop = 300 , op = {305}, dst = {
			{time = 100 , x= 383 + playside_score , y = 620,w = 69, h = 23 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_m_E", loop = 300 , op = {306}, dst = {
			{time = 100 , x= 383 + playside_score , y = 620,w = 69, h = 23 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_m_F", loop = 300 , op = {307}, dst = {
			{time = 100 , x= 383 + playside_score , y = 620,w = 69, h = 23 , a = 0},
			{time = 300 , a = 255},
		}},
		--ランク差分
		{id = "RANK_s_MAX", loop = 300 , op = {300}, dst = {
			{time = 100 , x= 321 + playside_score , y = 587, w = 45, h = 19 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_s_AAA", loop = 300 , op = {301}, dst = {
			{time = 100 , x= 321 + playside_score , y = 587, w = 45, h = 19 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_s_AA", loop = 300 , op = {302}, dst = {
			{time = 100 , x= 321 + playside_score , y = 587, w = 45, h = 19 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_s_A", loop = 300 , op = {303}, dst = {
			{time = 100 , x= 321 + playside_score , y = 587, w = 45, h = 19 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_s_B", loop = 300 , op = {304}, dst = {
			{time = 100 , x= 321 + playside_score , y = 587, w = 45, h = 19 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_s_C", loop = 300 , op = {305}, dst = {
			{time = 100 , x= 321 + playside_score , y = 587, w = 45, h = 19 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_s_D", loop = 300 , op = {306}, dst = {
			{time = 100 , x= 321 + playside_score , y = 587, w = 45, h = 19 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_s_E", loop = 300 , op = {307}, dst = {
			{time = 100 , x= 321 + playside_score , y = 587, w = 45, h = 19 , a = 0},
			{time = 300 , a = 255},
		}},
		--ランク差分-EXSCORE
		{id = "RANK_Diff_Exscore", loop = 300 , dst = {
			{time = 100 , x= 368 + playside_score , y = 587, w = 19, h = 18 , a = 0},
			{time = 300 , a = 255},
		}},


		--自己べクリアランプ
		{id = "best-clear", loop = 400 ,acc = 2, dst = {
			{time = 350 , x = 210 + playside_score , y = 680, w = 109, h = 0 , a = 0},
			{time = 400 , y = 671, h = 19, a = 255},
		}},
		--今回クリアランプ
		{id = "current-clear", loop = 400 ,acc = 2, dst = {
			{time = 350 , x= 362 + playside_score , y = 680, w = 109, h = 0 , a = 0},
			{time = 400 , y = 671, h = 19, a = 255},
		}},


		--自己べ_EXSCORE
		{id = "Best_Exscore", loop = 300 , dst ={
			{time = 100 , x = 215 + playside_score , y = 553, w = 20, h = 20 , a = 0 },
			{time = 300 , a = 255},
		}},
		--自己ベストスコアレート
		{id = "Best_Exscore_Acc", loop = 300 , dst ={
			{time = 100 ,x = 225 + playside_score , y = 539, w = 13, h = 14 , a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "Best_Exscore_Acc2", loop = 300 , dst ={
			{time = 100 ,x = 267 + playside_score , y = 539, w = 13, h = 14 , a = 0 },
			{time = 300 , a = 255},
		}},
		--今回_EXSCORE
		{id = "Current_Exscore", loop = 300 , dst ={
			{time = 100 ,x = 366 + playside_score , y = 553, w = 20, h = 20 , a = 0 },
			{time = 300 , a = 255},
		}},
		--今回のスコアレート
		{id = "Current_Exscore_Acc", loop = 300 , dst ={
			{time = 100 ,x = 376 + playside_score , y = 539, w = 13, h = 14 , a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "Current_Exscore_Acc2", loop = 300 , dst ={
			{time = 100 ,x = 418 + playside_score , y = 539, w = 13, h = 14 , a = 0 },
			{time = 300 , a = 255},
		}},
		--差分EXSCORE
		{id = "Diff_Exscore", loop = 300 , dst = {
			{time = 100 , x= 368 + playside_score , y = 509, w = 19, h = 18 , a = 0 },
			{time = 300 , a = 255},
		}},

		--ミスカウント_初回用
		{id = "MISSCOUNT_F", draw = function()
		local Playcount = main_state.number(71)
		local Score = main_state.number(150)
		return Playcount == 0 or Score == 0
		end,
		loop = 300 , dst ={
			{time = 100 , x = 225 + playside_score , y =  451, w = 80, h = 20 , a = 0 },
			{time = 300 , a = 255},
		}},
		--ミスカウント差分_初回用
		{id = "MISSCOUNT_SF", draw = function()
		local Playcount = main_state.number(71)
		local Score = main_state.number(150)
		return Playcount == 0 or Score == 0
		end,
		loop = 300 , dst ={
			{time = 100 , x = 370 + playside_score , y =  443, w = 94, h = 7 , a = 0 },
			{time = 300 , a = 255},
		}},


		--自己べ_ミスカウント
		{id = "Best_Misscount", loop = 300 , dst ={
			{time = 100 , x = 215 + playside_score , y =  471, w = 20, h = 20 , a = 0 },
			{time = 300 , a = 255},
		}},
		--今回_ミスカウント
		{id = "Current_Misscount", loop = 300 , dst = {
			{time = 100 , x = 366 + playside_score , y =  471, w = 20, h = 20 , a = 0 },
			{time = 300 , a = 255},
		}},
		--差分_ミスカウント
		{id = "Diff_Misscount", loop = 300 , dst = {
			{time = 100 , x= 368 + playside_score , y = 437, w = 19, h = 18 , a = 0 },
			{time = 300 , a = 255},
		}},




		--ターゲット_EXスコア
		{id = "TARGETSCORE", loop = 300 , dst ={
			{time = 100 , x = 215 + playside_score , y = 399, w = 20, h = 20 , a = 0 },
			{time = 300 , a = 255},
		}},
		--差分_ターゲット
		{id = "Diff_TARGETSCORE", loop = 300 , dst = {
			{time = 100 , x= 214 + playside_score , y = 365, w = 19, h = 18 , a = 0 },
			{time = 300 , a = 255},
		}},
		--ターゲット_スコアレート
		{id = "TARGETRATE1", filter = 1 ,  loop = 300 , dst ={
			{time = 100 , x = 351+8 + playside_score , y = 399, w = 18, h = 20 , a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "TARGETRATE2", filter = 1 ,  loop = 300 , dst ={
			{time = 100 , x = 410+8 + playside_score , y = 399, w = 18, h = 20 , a = 0 },
			{time = 300 , a = 255},
		}},
		--ターゲット_自分のスコアレート
		{id = "TARGET_MYRATE1", filter = 1 , loop = 300 , dst = {
			{time = 100 , x= 357 + playside_score , y = 365, w = 17, h = 18 , a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "TARGET_MYRATE2", filter = 1 ,  loop = 300 , dst = {
			{time = 100 , x= 413 + playside_score , y = 365, w = 17, h = 18 , a = 0 },
			{time = 300 , a = 255},
		}},


		--判定数
		--通常
		{id = "JUDGE_PG", loop = 300 , dst ={
			{time = 100 , x = 160 + playside_judge, y = 313, w = 22, h = 20 , a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "JUDGE_GR", loop = 300 , dst ={
			{time = 100 , x = 160 + playside_judge, y = 313 - ( 34 * 1 ), w = 22, h = 20 , a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "JUDGE_GD", loop = 300 , dst ={
			{time = 100 , x = 160 + playside_judge, y = 313 - ( 34 * 2 ), w = 22, h = 20 , a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "JUDGE_BD", loop = 300 , dst ={
			{time = 100 , x = 160 + playside_judge, y = 313 - ( 34 * 3 ), w = 22, h = 20 , a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "JUDGE_PR", loop = 300 , dst ={
			{time = 100 , x = 160 + playside_judge, y = 313 - ( 34 * 4 ), w = 22, h = 20 , a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "JUDGE_MS", loop = 300 , dst ={
			{time = 100 , x = 160 + playside_judge, y = 313 - ( 34 * 5 ), w = 22, h = 20 , a = 0 },
			{time = 300 , a = 255},
		}},



		--FAST
		{id = "detail_fast", loop = 300 ,  dst ={
			{time = 100 , x = FS_position1 + playside_judge + 13 , y = 340, w = 31, h = 8, a = 0 },
			{time = 300 , a = 255},
		}},

		{id = "JUDGE_PG_F", loop = 300 ,  dst ={
			{time = 100 , x = FS_position1 + playside_judge, y = 317, w = 14, h = 13, a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "JUDGE_GR_F", loop = 300 ,  dst ={
			{time = 100 , x = FS_position1 + playside_judge, y = 317 - ( 34 * 1 ), w = 14, h = 13, a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "JUDGE_GD_F", loop = 300 ,  dst ={
			{time = 100 , x = FS_position1 + playside_judge, y = 317 - ( 34 * 2 ), w = 14, h = 13, a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "JUDGE_BD_F", loop = 300 ,  dst ={
			{time = 100 , x = FS_position1 + playside_judge, y = 317 - ( 34 * 3 ), w = 14, h = 13, a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "JUDGE_PR_F", loop = 300 ,  dst ={
			{time = 100 , x = FS_position1 + playside_judge, y = 317 - ( 34 * 4 ), w = 14, h = 13, a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "JUDGE_MS_F", loop = 300 ,  dst ={
			{time = 100 , x = FS_position1 + playside_judge, y = 317 - ( 34 * 5 ), w = 14, h = 13, a = 0 },
			{time = 300 , a = 255},
		}},

		--SLOW
		{id = "detail_slow", loop = 300 ,  dst ={
			{time = 100 , x = FS_position2 + playside_judge + 9 , y = 340, w = 36, h = 8, a = 0 },
			{time = 300 , a = 255},
		}},

		{id = "JUDGE_PG_S", loop = 300 ,  dst ={
			{time = 100 , x = FS_position2 + playside_judge, y = 317, w = 14, h = 13, a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "JUDGE_GR_S", loop = 300 ,  dst ={
			{time = 100 , x = FS_position2 + playside_judge, y = 317 - ( 34 * 1 ), w = 14, h = 13, a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "JUDGE_GD_S", loop = 300 ,  dst ={
			{time = 100 , x = FS_position2 + playside_judge, y = 317 - ( 34 * 2 ), w = 14, h = 13, a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "JUDGE_BD_S", loop = 300 ,  dst ={
			{time = 100 , x = FS_position2 + playside_judge, y = 317 - ( 34 * 3 ), w = 14, h = 13, a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "JUDGE_PR_S", loop = 300 ,  dst ={
			{time = 100 , x = FS_position2 + playside_judge, y = 317 - ( 34 * 4 ), w = 14, h = 13, a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "JUDGE_MS_S", loop = 300 ,  dst ={
			{time = 100 , x = FS_position2 + playside_judge, y = 317 - ( 34 * 5 ), w = 14, h = 13, a = 0 },
			{time = 300 , a = 255},
		}},

		--MAXCOMBO
		{id = "MAXCOMBO", loop = 300 ,  dst ={
			{time = 100 , x = 199 + playside_judge, y = 113, w = 14, h = 13, a = 0 },
			{time = 300 , a = 255},
		}},
		--COMBOBREAK
		{id = "COMBOBREAK", loop = 300 ,  dst ={
			{time = 100 , x = 199 + playside_judge, y = 90, w = 14, h = 13, a = 0 },
			{time = 300 , a = 255},
		}},
		--FAST&SLOW
		{id = "JUDGE_TOTAL_F", loop = 300 ,  dst ={
			{time = 100 , x = 380 + playside_judge, y = 113, w = 14, h = 13, a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "JUDGE_TOTAL_S", loop = 300 ,  dst ={
			{time = 100 , x = 380 + playside_judge, y = 90, w = 14, h = 13, a = 0 },
			{time = 300 , a = 255},
		}},



		--ここから画面下部情報
		--曲名下ライン
		{id = "NAME_LINE", loop = 200 , dst ={
			{time = 0 , x = 534 + 425, y = 43, w = 0, h = 20 , a = 0},
			{time = 200 , x = 534 , w = 853 , a = 255},
		}},

		--難易度フレーム	
		{id = "DIFF_KEYS_INFO", loop = 300 , dst ={
			{time = 200 , x = 837, y = 23-9, w = 245, h = 31 , a = 0},
			{time = 300 , a = 255},
		}},

		--鍵盤数
		{id = "DATA_KEYS_7K", loop = 400 , op = {160}, dst ={
			{time = 300 , x = 842 , y = 28-9 , w = 58, h = 21 , a = 0},
			{time = 400 , a = 255},
		}},
		{id = "DATA_KEYS_5K", loop = 400 , op = {161}, dst ={
			{time = 300 , x = 842 , y = 28-9 , w = 58, h = 21 , a = 0},
			{time = 400 , a = 255},
		}},
		{id = "DATA_KEYS_14K", loop = 400 , op = {162}, dst ={
			{time = 300 , x = 842 , y = 28-9 , w = 58, h = 21 , a = 0},
			{time = 400 , a = 255},
		}},
		{id = "DATA_KEYS_10K", loop = 400 , op = {163}, dst ={
			{time = 300 , x = 842 , y = 28-9 , w = 58, h = 21 , a = 0},
			{time = 400 , a = 255},
		}},
		{id = "DATA_KEYS_9K", loop = 400 , op = {164}, dst ={
			{time = 300 , x = 842 , y = 28-9 , w = 58, h = 21 , a = 0},
			{time = 400 , a = 255},
		}},

		--数字
		{id = "NOTES_NUM", loop = 400 , dst ={
			{time = 300 , x = 910, y = 30-9, w = 18, h = 17 , a = 0},
			{time = 400 , a = 255},
		}},

		--文字表記（テーブル）
		{id = "songname", loop = 500 , dst ={
			{time = 400 , x = 960, y = 115-25, w = 800, h = 23 , a = 0},
			{time = 500 , a = 255},
		}},


		--画面下部情報ここまで



		--CLEARとFAILED
		--FAILED
		{id = "FAILED_main", filter = 1,acc = 2 ,loop = -1,op = {91}, dst = {
			{time = 0, x = 318, y = 461, w = 1293, h = 196 , a = 0},
			{time = 300, x = 318, y = 461, w = 1293, h = 196 , a = 255},
			{time = 900 , acc = 2},
			{time = 1100, x = 318, y = 561, w = 1293, h = 196 , a = 0 ,acc = 2},
		}},

		{id = "FAILED_glow", blend = 2,acc = 2 ,loop = -1,op = {91}, dst = {
			{time = 100, x = 318, y = 462, w = 1285, h = 198 , a = 255},
			{time = 500, x = 318, y = 462, w = 1285, h = 198 , a = 0 ,acc = 2},
			{time = 1100},
		}},

		{id = "FAILED_flash", blend = 2,acc = 2 ,loop = -1,op = {91}, dst = {
			{time = 100, x = 263, y = 406, w = 1393, h = 306 , a = 255},
			{time = 800, x = 263, y = 406, w = 1393, h = 306 , a = 120 ,acc = 2},
			{time = 900},
			{time = 1100, x = 263, y = 506, w = 1393, h = 306 , a = 0 ,acc = 2},
		}},


		{id = "FAILED_blur", blend = 2 , filter = 1 ,loop = -1,op = {91}, dst = {
			{time = 50, x = 168, y = 461, w = 1583, h = 196 , a = 255,acc = 2},
			{time = 450, x = -232, y = 461, w = 2383, h = 196 , a = 0 ,acc = 2},
			{time = 1100},
		}},

		--CLEAR
		{id = "CLEAR_main", filter = 1,acc = 2 ,loop = -1,op = {90, 2245, -2244}, dst = {
			{time = 0, x = 350, y = 461, w = 1219, h = 196 , a = 0},
			{time = 300, x = 350, y = 461, w = 1219, h = 196 , a = 255},
			{time = 900 , acc = 2},
			{time = 1100, x = 350, y = 561, w = 1219, h = 196 , a = 0 ,acc = 2},
		}},

		{id = "CLEAR_glow", blend = 2,acc = 2 ,loop = -1,op = {90, 2245, -2244}, dst = {
			{time = 100, x = 349, y = 462, w = 1219, h = 196 , a = 255},
			{time = 500, x = 349, y = 462, w = 1219, h = 196 , a = 0 ,acc = 2},
			{time = 1100},
		}},

		{id = "CLEAR_flash", blend = 2,acc = 2 ,loop = -1,op = {90, 2245, -2244}, dst = {
			{time = 100, x = 295, y = 406, w = 1329, h = 306 , a = 255},
			{time = 800, x = 295, y = 406, w = 1329, h = 306 , a = 120 ,acc = 2},
			{time = 900},
			{time = 1100, x = 295, y = 506, w = 1329, h = 306 , a = 0 ,acc = 2},
		}},


		{id = "CLEAR_blur", blend = 2 , filter = 1 ,loop = -1,op = {90, 2245, -2244}, dst = {
			{time = 50, x = 201, y = 461, w = 1517, h = 196 , a = 255,acc = 2},
			{time = 250, x = -200, y = 461, w = 2321, h = 196 , a = 0 ,acc = 2},
			{time = 1100},
		}},
		--CLEARその2
		{id = "CLEAR_main", filter = 1,acc = 2 ,loop = -1,op = {90, 2244}, dst = {
			{time = 0, x = 350, y = 461, w = 1219, h = 196 , a = 0},
			{time = 300, x = 350, y = 461, w = 1219, h = 196 , a = 255},
			{time = 900 , acc = 2},
			{time = 1100, x = 350, y = 561, w = 1219, h = 196 , a = 0 ,acc = 2},
		}},

		{id = "CLEAR_glow", blend = 2,acc = 2 ,loop = -1,op = {90, 2244}, dst = {
			{time = 100, x = 349, y = 462, w = 1219, h = 196 , a = 255},
			{time = 500, x = 349, y = 462, w = 1219, h = 196 , a = 0 ,acc = 2},
			{time = 1100},
		}},

		{id = "CLEAR_flash", blend = 2,acc = 2 ,loop = -1,op = {90, 2244}, dst = {
			{time = 100, x = 295, y = 406, w = 1329, h = 306 , a = 255},
			{time = 800, x = 295, y = 406, w = 1329, h = 306 , a = 60 ,acc = 2},
			{time = 900},
			{time = 1100, x = 295, y = 506, w = 1329, h = 306 , a = 0 ,acc = 2},
		}},


		{id = "CLEAR_blur", blend = 2 , filter = 1 ,loop = -1,op = {90, 2244}, dst = {
			{time = 50, x = 201, y = 461, w = 1517, h = 196 , a = 255,acc = 2},
			{time = 450, x = -200, y = 461, w = 2321, h = 196 , a = 0 ,acc = 2},
			{time = 1100},
		}},

		--FULLCOMBO予定地いまはCLEAR
		{id = "CLEAR_main", filter = 1,acc = 2 ,loop = -1,op = {90, -2244, -2245}, dst = {
			{time = 0, x = 350, y = 461, w = 1219, h = 196 , a = 0},
			{time = 300, x = 350, y = 461, w = 1219, h = 196 , a = 255},
			{time = 900 , acc = 2},
			{time = 1100, x = 350, y = 561, w = 1219, h = 196 , a = 0 ,acc = 2},
		}},

		{id = "CLEAR_glow", blend = 2,acc = 2 ,loop = -1,op = {90, -2244, -2245}, dst = {
			{time = 100, x = 349, y = 462, w = 1219, h = 196 , a = 255},
			{time = 500, x = 349, y = 462, w = 1219, h = 196 , a = 0 ,acc = 2},
			{time = 1100},
		}},

		{id = "CLEAR_flash", blend = 2,acc = 2 ,loop = -1,op = {90, -2244, -2245}, dst = {
			{time = 100, x = 295, y = 406, w = 1329, h = 306 , a = 255},
			{time = 800, x = 295, y = 406, w = 1329, h = 306 , a = 60 ,acc = 2},
			{time = 900},
			{time = 1100, x = 295, y = 506, w = 1329, h = 306 , a = 0 ,acc = 2},
		}},


		{id = "CLEAR_blur", blend = 2 , filter = 1 ,loop = -1,op = {90, -2244, -2245}, dst = {
			{time = 50, x = 201, y = 461, w = 1517, h = 196 , a = 255,acc = 2},
			{time = 450, x = -200, y = 461, w = 2321, h = 196 , a = 0 ,acc = 2},
			{time = 1100},
		}},



		{id = "black", loop = 1000, timer = 2, acc = 2, dst = {
			{time = 0, x = 0, y = 0, w = 1920, h = 1080, a = 0, r = 0, g = 0, b = 0},
			{time = 1000, a = 255},
		}},	
--[[
		{id = "shutter_",loop = 900,timer = 2,dst = {
			{time = 400 , x = 0, y = 0, w = 1920, h = 1080, a = 255},
			{time = 900, a = 255},
		}},

		{id = "shutter", loop = -1,timer = 2,dst = {
			{time = 0,x = 0, y = 0, w = 1920, h = 1080},
			{time = 900},
		}},
]]--

		{id = "shutter1", loop = -1,timer = 2,op = {940},dst = {
			{time = 0,x = 0, y = 0, w = 1920, h = 1080},
			{time = 42},
		}},
		{id = "shutter2", loop = -1,timer = 2,op = {940},dst = {
			{time = 40,x = 0, y = 0, w = 1920, h = 1080},
			{time = 82},
		}},
		{id = "shutter3", loop = -1,timer = 2,op = {940},dst = {
			{time = 80,x = 0, y = 0, w = 1920, h = 1080},
			{time = 122},
		}},
		{id = "shutter4", loop = -1,timer = 2,op = {940},dst = {
			{time = 120,x = 0, y = 0, w = 1920, h = 1080},
			{time = 162},
		}},
		{id = "shutter5", loop = -1,timer = 2,op = {940},dst = {
			{time = 160,x = 0, y = 0, w = 1920, h = 1080},
			{time = 202},
		}},
		{id = "shutter6", loop = -1,timer = 2,op = {940},dst = {
			{time = 200,x = 0, y = 0, w = 1920, h = 1080},
			{time = 242},
		}},
		{id = "shutter7", loop = -1,timer = 2,op = {940},dst = {
			{time = 240,x = 0, y = 0, w = 1920, h = 1080},
			{time = 282},
		}},
		{id = "shutter8", loop = -1,timer = 2,op = {940},dst = {
			{time = 280,x = 0, y = 0, w = 1920, h = 1080},
			{time = 322},
		}},
		{id = "shutter9", loop = -1,timer = 2,op = {940},dst = {
			{time = 320,x = 0, y = 0, w = 1920, h = 1080},
			{time = 362},
		}},
		{id = "shutter10", loop = -1,timer = 2,op = {940},dst = {
			{time = 360,x = 0, y = 0, w = 1920, h = 1080},
			{time = 402},
		}},
		{id = "shutter11", loop = -1,timer = 2,op = {940},dst = {
			{time = 400,x = 0, y = 0, w = 1920, h = 1080},
			{time = 442},
		}},
		{id = "shutter12", loop = -1,timer = 2,op = {940},dst = {
			{time = 440,x = 0, y = 0, w = 1920, h = 1080},
			{time = 482},
		}},
		{id = "shutter13", loop = -1,timer = 2,op = {940},dst = {
			{time = 480,x = 0, y = 0, w = 1920, h = 1080},
			{time = 522},
		}},
		{id = "shutter14", loop = -1,timer = 2,op = {940},dst = {
			{time = 520,x = 0, y = 0, w = 1920, h = 1080},
			{time = 562},
		}},
		{id = "shutter15", loop = -1,timer = 2,op = {940},dst = {
			{time = 560,x = 0, y = 0, w = 1920, h = 1080},
			{time = 602},
		}},
		{id = "shutter16", loop = -1,timer = 2,op = {940},dst = {
			{time = 600,x = 0, y = 0, w = 1920, h = 1080},
			{time = 642},
		}},
		{id = "shutter17", loop = -1,timer = 2,op = {940},dst = {
			{time = 640,x = 0, y = 0, w = 1920, h = 1080},
			{time = 682},
		}},
		{id = "shutter18", loop = 720,timer = 2,op = {940},dst = {
			{time = 680,x = 0, y = 0, w = 1920, h = 1080},
			{time = 720},
		}},	

		{id = "shutter", loop = 600, op = {940},dst = {
			{time = 0 ,x = 0, y = 0, w = 1920, h = 1080},
			{time = 590 },
			{time = 600 , a = 0},
		}},


		--dst記述終了
	}



	return skin
end

return {
    header = header,
    main = main
}