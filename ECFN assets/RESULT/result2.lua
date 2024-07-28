local header = {
	type = 7,
	name = "TYPE-M_OldStyle_2P(Not_Support)",
	w = 1920,
	h = 1080,
	fadeout = 700,
	scene = 3600000,
	input = 500,
	property = {
	},

	filepath = {
		{ name = "---AAA", path = "BG/AAA/*.png", def = "Random" },
		{ name = "---AA", path = "BG/AA/*.png", def = "Random" },
		{ name = "---A", path = "BG/A/*.png", def = "Random" },
		{ name = "---RANK", path = "RANK/*.png", def = "DEFAULT" },
	},
}


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
		}

	--フォントの読み込み
	skin.font = {
		{id = 0, path = "font/song.fnt"},
		{id = 1, path = "font/Artist.fnt"},
		{id = 2, path = "font/folder.fnt"},
	}


--ここから切り出し関連
	skin.image = {
		--背景
		{id = "black", src = 11, x = 163, y = 359, w = 10, h = 10},
		{id = "BG_ALL", src = 0-1, x = 0, y = 0, w = -1, h = -1},
		{id = "BG_A", src = 0-2, x = 0, y = 0, w = -1, h = -1},
		{id = "BG_AA", src = 0-3, x = 0, y = 0, w = -1, h = -1},	
		{id = "BG_AAA", src = 0-4, x = 0, y = 0, w = -1, h = -1},
		{id = "BG_CLEAR", src = 5, x = 0, y = 0, w = -1, h = -1},
		{id = "BG_FAILED", src = 6, x = 0, y = 0, w = -1, h = -1},
		{id = "Particle", src = 8, x = 0, y = 0, w = -1, h = -1, divy = 60 , cycle = 2000},
		--リザルト上部用
		{id = "stageresult", src = 10, x = 0, y = 1179, w = 597, h = 50},
		{id = "stageresult_f", src = 10, x = 0, y = 1229, w = 597, h = 50},
		--下部情報用
		{id = "NAME_LINE_ACC", src = 10, x = 856, y = 0, w = 70, h = 194},
		{id = "NAME_LINE", src = 10, x = 0, y = 213, w = 853, h = 20},
     	{id = "DIFF_KEYS_INFO", src = 10, x = 569, y = 0, w = 285, h = 31},	
		{id = "NOTES_INFO", src = 10, x = 569, y = 33, w = 180, h = 31},
		--パーセント文字
		{id = "SCORE_PER1", src = 10, x = 569, y = 83, w = 38, h = 14},
		{id = "SCORE_PER2", src = 10, x = 569, y = 68, w = 38, h = 14},
		{id = "TERGET_PER1", src = 10, x = 569, y = 98, w = 50, h = 18},
		{id = "TERGET_PER2", src = 10, x = 566, y = 117, w = 47, h = 18},
		--グルーヴゲージ
		{id = "Groove_main", src = 10, x = 528, y = 815, w = 565, h = 309},
		{id = "Gauge_frame", src = 10, x = 566, y = 545, w = 527, h = 267},
		--メインフレーム周り
		{id = "SCORE_FRAME", src = 10, x = 1116, y = 233, w = 485, h = 345},
		{id = "judge_detail", src = 10, x = 0, y = 582, w = 514, h = 369},		
		{id = "p_great", src = 10, x = 755, y = 34, w = 91, h = 88, divy = 4 , cycle = 250},
		--スコアフレーム文字
		{id = "cleartype_font", src = 10, x = 626, y = 68, w = 123, h = 19},
		{id = "djlevel_font", src = 10, x = 626, y = 87, w = 94, h = 19},
		{id = "score_font", src = 10, x = 626, y = 177, w = 80, h = 33},
		{id = "misscount_font", src = 10, x = 626, y = 106, w = 128, h = 19},
		{id = "target_font", src = 10, x = 626, y = 125, w = 80, h = 19},
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
		{id = "DATA_KEYS_SP", src = 10, x = 0, y = 125, w = 58, h = 21},
		{id = "DATA_KEYS_DP", src = 10, x = 0, y = 370 + 28, w = 72, h = 28},
		{id = "DATA_KEYS_9K", src = 10, x = 0, y = 370 + 56, w = 72, h = 28},
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
		--記録更新用
		{id = "NEWRECORD_1", src = 10, x = 0, y = 951, w = 196, h = 56},
		{id = "NEWRECORD_2", src = 10, x = 0, y = 1007, w = 196, h = 52},
		{id = "NEWRECORD_3", src = 10, x = 0, y = 1059, w = 196, h = 64},
		{id = "NEWRECORD_4", src = 10, x = 0, y = 1123, w = 196, h = 56},
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
				{id = "folder", font = 2, size = 13, align = 1, overflow = 1, ref = 1003},

	}


	skin.judgegraph = {
		{id = "judgegraph", noGap = 0, orderReverse = 1, type = 1, backTexOff = 0},
	}

	skin.timingdistributiongraph = {
			{id = "timingdistributiongraph", backTexOff = 1}
	}

		--数字関連
		skin.value = {
		-- 自己べ_EXSCORE
				{id = "Best_Exscore", src = 9, x = 0, y = 202, w = 220, h = 20, divx = 11, digit = 4, ref = 170, align = 0,},
		-- 今回_EXSCORE
				{id = "Current_Exscore", src = 9, x = 0, y = 222, w = 220, h = 20, divx = 11, digit = 4, ref = 171, align = 0,},
		-- ベストスコアレート
				{id = "Best_Exscore_Acc", src = 9, x = 0, y = 262, w = 165, h = 14, divx = 11, digit = 3, ref = 183, align = 0,},
				{id = "Best_Exscore_Acc2", src = 9, x = 0, y = 262, w = 165, h = 14, divx = 11, digit = 1, ref = 184, align = 0,},
		-- 今回のスコアレート
				{id = "Current_Exscore_Acc", src = 9, x = 0, y = 276, w = 165, h = 14, divx = 11, digit = 3, ref = 102, align = 0,},
				{id = "Current_Exscore_Acc2", src = 9, x = 0, y = 276, w = 165, h = 14, divx = 11, digit = 1, ref = 103, align = 0,},
		-- 自己べ_ミスカウント
				{id = "Best_Misscount", src = 9, x = 0, y = 202, w = 220, h = 20, divx = 11, digit = 4, ref = 176, align = 0,},
		-- 今回_ミスカウント
				{id = "Current_Misscount", src = 9, x = 0, y = 222, w = 220, h = 20, divx = 11, digit = 4, ref = 76, align = 0,},
		--ターゲットスコア
				{id = "TARGETSCORE", src = 9, x = 0, y = 242, w = 220, h = 20, divx = 11, digit = 4, ref = 151, align = 0,},
		--ターゲットのレート
				{id = "TARGETRATE1", src = 9, x = 0, y = 242, w = 220, h = 20, divx = 11, digit = 3, ref = 157, align = 0,},
				{id = "TARGETRATE2", src = 9, x = 0, y = 242, w = 220, h = 20, divx = 11, digit = 1, ref = 158, align = 0,},
		--差分_ミスカウント
				{id = "Diff_Misscount",  src = 9, x = 0, y = 292, w = 228, h = 36, divx = 12, divy = 2, digit = 5, ref = 178, align = 0, zeropadding = 2},
		-- 差分_EXSCORE
				{id = "Diff_Exscore", src = 9, x = 0, y = 165, w = 228, h = 36, divx = 12, divy = 2, digit = 5, ref = 172, align = 0, zeropadding = 2},
		-- ランク差分スコア
				{id = "RANK_Diff_Exscore", src = 9,x = 0, y = 292, w = 228, h = 36, divx = 12, digit = 5, divy = 2, ref = 154, align = 0, zeropadding = 2},
		--ターゲット差分スコア
				{id = "Diff_TARGETSCORE", src = 9, x = 0, y = 165, w = 228, h = 36, divx = 12, divy = 2, digit = 5, ref = 153, align = 0, zeropadding = 2},
				{id = "TARGET_MYRATE1", src = 9, x = 0, y = 165, w = 209, h = 18, divx = 11, divy = 1, digit = 3, ref = 102, align = 0},
				{id = "TARGET_MYRATE2", src = 9, x = 0, y = 165, w = 209, h = 18, divx = 11, divy = 1, digit = 1, ref = 103, align = 0},
		--COMBO BREAK
				{id = "COMBOBREAK", src = 9, x = 0, y = 151, w = 154, h = 13, divx = 11, digit = 4, ref = 425, align = 0},
		--MAX COMBO
				{id = "MAXCOMBO", src = 9, x = 0, y = 151, w = 154, h = 13, divx = 11, digit = 4, ref = 75, align = 0},
		--判定数
		--通常
				{id = "JUDGE_PG", src = 9, x = 0, y = 130, w = 242, h = 20, divx = 11, digit = 4, ref = 110, align = 0,},
				{id = "JUDGE_GR", src = 9, x = 0, y = 130, w = 242, h = 20, divx = 11, digit = 4, ref = 111, align = 0,},
				{id = "JUDGE_GD", src = 9, x = 0, y = 130, w = 242, h = 20, divx = 11, digit = 4, ref = 112, align = 0,},
				{id = "JUDGE_BD", src = 9, x = 0, y = 130, w = 242, h = 20, divx = 11, digit = 4, ref = 113, align = 0,},
				{id = "JUDGE_PR", src = 9, x = 0, y = 130, w = 242, h = 20, divx = 11, digit = 4, ref = 114, align = 0,},
				{id = "JUDGE_MS", src = 9, x = 0, y = 130, w = 242, h = 20, divx = 11, digit = 4, ref = 420, align = 0,},
		--FAST
				{id = "JUDGE_PG_F", src = 9, x = 0, y = 116, w = 154, h = 13, divx = 11, digit = 4, ref = 410, align = 0,},
				{id = "JUDGE_GR_F", src = 9, x = 0, y = 116, w = 154, h = 13, divx = 11, digit = 4, ref = 412, align = 0,},
				{id = "JUDGE_GD_F", src = 9, x = 0, y = 116, w = 154, h = 13, divx = 11, digit = 4, ref = 414, align = 0,},
				{id = "JUDGE_BD_F", src = 9, x = 0, y = 116, w = 154, h = 13, divx = 11, digit = 4, ref = 416, align = 0,},
				{id = "JUDGE_PR_F", src = 9, x = 0, y = 116, w = 154, h = 13, divx = 11, digit = 4, ref = 418, align = 0,},
				{id = "JUDGE_MS_F", src = 9, x = 0, y = 116, w = 154, h = 13, divx = 11, digit = 4, ref = 421, align = 0,},
		--SLOW
				{id = "JUDGE_PG_S", src = 9, x = 0, y = 103, w = 154, h = 13, divx = 11, digit = 4, ref = 411, align = 0,},
				{id = "JUDGE_GR_S", src = 9, x = 0, y = 103, w = 154, h = 13, divx = 11, digit = 4, ref = 413, align = 0,},
				{id = "JUDGE_GD_S", src = 9, x = 0, y = 103, w = 154, h = 13, divx = 11, digit = 4, ref = 415, align = 0,},
				{id = "JUDGE_BD_S", src = 9, x = 0, y = 103, w = 154, h = 13, divx = 11, digit = 4, ref = 417, align = 0,},
				{id = "JUDGE_PR_S", src = 9, x = 0, y = 103, w = 154, h = 13, divx = 11, digit = 4, ref = 419, align = 0,},
				{id = "JUDGE_MS_S", src = 9, x = 0, y = 103, w = 154, h = 13, divx = 11, digit = 4, ref = 422, align = 0,},
		--合計
				{id = "JUDGE_TOTAL_F", src = 9, x = 0, y = 151, w = 154, h = 13, divx = 11, digit = 4, ref = 423, align = 0,},
				{id = "JUDGE_TOTAL_S", src = 9, x = 0, y = 151, w = 154, h = 13, divx = 11, digit = 4, ref = 424, align = 0,},

		--ノーツ数とか難易度の情報枠 枠とか難易度はimageで定義
				{id = "NOTES_NUM", src = 9, x = 0, y = 328, w = 198, h = 17, divx = 11, digit = 4, ref = 74, align = 0,},
				{id = "DATA_DIFFICULITY_NUM_0", src = 9, x = 0, y = 0, w = 180, h = 17, divx = 10, digit = 2, ref = 96, align = 0,},
				{id = "DATA_DIFFICULITY_NUM_1", src = 9, x = 0, y = 0 + 17 * 2, w = 180, h = 17, divx = 10, digit = 2, ref = 96, align = 0,},
				{id = "DATA_DIFFICULITY_NUM_2", src = 9, x = 0, y = 0 + 17 * 1, w = 180, h = 17, divx = 10, digit = 2, ref = 96, align = 0,},
				{id = "DATA_DIFFICULITY_NUM_3", src = 9, x = 0, y = 0 + 17 * 3, w = 180, h = 17, divx = 10, digit = 2, ref = 96, align = 0,},
				{id = "DATA_DIFFICULITY_NUM_4", src = 9, x = 0, y = 0 + 17 * 4, w = 180, h = 17, divx = 10, digit = 2, ref = 96, align = 0,},
				{id = "DATA_DIFFICULITY_NUM_5", src = 9, x = 0, y = 0 + 17 * 5, w = 180, h = 17, divx = 10, digit = 2, ref = 96, align = 0,},
		--src終了
		}


	--ここから配置関連
		skin.destination = {
		--背景
		--FAILED_BG
		{ id = "BG_FAILED", op = {91}, dst = {
			{ x = 0, y = 0, w = 1920, h = 1080 }
		}},
		--エフェクト
		{ id = "BG_FAILED", blend = 2 , loop = -1, acc = 2 , op = {91}, dst = {
			{time = 0, x = -192, y = -108, w = 2305, h = 1296, a = 180 },
			{time = 700, x = 0, y = 0, w = 1920, h = 1080 , a = 50  },
			{time = 1200, x = 0, y = 0, w = 1920, h = 1080 , a = 0 },
		}},
		--CLEAR	
		{ id = "BG_CLEAR", op = {90}, dst = {
			{ x = 0, y = 0, w = 1920, h = 1080 }
		}},
		--エフェクト
		{ id = "BG_CLEAR", blend = 2 , loop = -1, acc = 2 , op = {90}, dst = {
			{time = 0, x = -192, y = -108, w = 2305, h = 1296, a = 180 },
			{time = 700, x = 0, y = 0, w = 1920, h = 1080 , a = 50  },
			{time = 1200, x = 0, y = 0, w = 1920, h = 1080 , a = 0 },
		}},

		{ id = "Particle", blend = 2 , filter = 1 , dst = {
			{ x = 0, y = 0, w = 1920, h = 700 , a = 40 },
		}},
		{ id = "Particle", blend = 2 , filter = 1 ,loop = 200 , dst = {
			{time = 0 , x = 0, y = 0, w = 2194, h = 800 , a = 255 },
			{time = 200 , a = 0 },
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


		--ステージリザルト
		--clear
		{id = "stageresult" , acc = 2 ,loop = 500 , op = {90}, dst = {
			{time = 200 , x = 661, y = 1006, w = 597, h = 50 , a = 0},
			{time = 500 , a = 255},
		}},
		--clearglow
		{id = "stageresult" , blend = 2 , acc = 2 , loop = 800 , op = {90}, dst = {
			{time = 0 , x = 661, y = 1006, w = 597, h = 50 , a = 0},
			{time = 800},
			{time = 1500 , a = 100},
			{time = 1600 , a = 100},
			{time = 2500 , a = 0},
			{time = 3500 , a = 0},
		}},
		--failed
		{id = "stageresult_f", acc = 2 ,loop = 500 , op = {91}, dst = {
			{time = 200 , x = 661, y = 1006, w = 597, h = 50 , a = 0},
			{time = 500 , a = 255},
		}},
		{id = "stageresult_f" , blend = 2 , acc = 2 , loop = 800 , op = {91}, dst = {
			{time = 0 , x = 661, y = 1006, w = 597, h = 50 , a = 0},
			{time = 800},
			{time = 1500 , a = 100},
			{time = 1600 , a = 100},
			{time = 2500 , a = 0},
			{time = 3500 , a = 0},
		}},


		--フレーム
		--スコア枠
		{id = "SCORE_FRAME", loop = 200 ,  dst = {
			{time = 0 , x = 23 + 1389, y = 362, w = 485, h = 345, a = 0 },
			{time = 200, a = 255 },
		}},

		{id = "SCORE_PER1", loop = 200 ,  dst = {
			{time = 0 , x = 268 - 150 + 1389 , y = 537, w = 38, h = 14, a = 0 },
			{time = 200, a = 255 },
		}},
		{id = "SCORE_PER2", loop = 200 ,  dst = {
			{time = 0 , x = 419 - 150 + 1389 , y = 537, w = 38, h = 14, a = 0 },
			{time = 200, a = 255 },
		}},
		{id = "TERGET_PER1", loop = 200 ,  dst = {
			{time = 0 , x = 421 - 301 + 1389 , y = 398, w = 50, h = 18, a = 0 },
			{time = 200, a = 255 }, loop = 300 , 
		}},
		{id = "TERGET_PER2", loop = 200 , dst = {
			{time = 0 , x = 419 - 301 + 1389 , y = 365, w = 47, h = 18, a = 0 },
			{time = 200, a = 255 },
		}},

		--スコア枠用の文字
		{id = "cleartype_font",loop = 250 , dst = {
			{time = 100, x = 57 + 294 + 1389  , y = 671, w = 123, h = 19 , a = 0},
			{time = 250, a = 255 },
		}},
		{id = "djlevel_font",loop = 250 , dst = {
			{time = 100, x = 57 + 323 + 1389 , y = 620, w = 94, h = 19 , a = 0},
			{time = 250, a = 255 },
		}},
		{id = "score_font",loop = 250 , dst = {
			{time = 100, x = 57 + 337 + 1389 , y = 537, w = 80, h = 33 , a = 0},
			{time = 250, a = 255 },
		}},
		{id = "misscount_font",loop = 250 , dst = {
			{time = 100, x = 57 + 289 + 1389 , y = 469, w = 128, h = 19 , a = 0},
			{time = 250, a = 255 },
		}},
		{id = "target_font",loop = 250 , dst = {
			{time = 100, x = 57 + 337 + 1389 , y = 397, w = 80, h = 19 , a = 0},
			{time = 250, a = 255 },
		}},


		--判定数
		{id = "judge_detail",loop = 100 , dst = {
			{time = 0, x = 3 + 1400 , y = 35, w = 514, h = 369 , a = 0},
			{time = 100, a = 255 },
		}},
		--ピカグレ文字
		{id = "p_great",loop = 100 , dst = {
			{time = 0, x = 55 + 1400 , y = 312, w = 91, h = 22 , a = 0},
			{time = 100, a = 255 },
		}},

		--フレームここまで


		--更新グロー
		--クリア
		{id = "NEWRECORD_1",loop = 200 , draw = function()
			local BESTCLEAR = main_state.number(371)
			local CURRENTCLEAR = main_state.number(370)
			return BESTCLEAR < CURRENTCLEAR and CURRENTCLEAR >= 2
		end,  dst = {
			{time = 0, x= 313 + 1098 , y = 653, w = 196, h = 56, a = 0},
			{time = 200, a = 255},
			{time = 600, a = 255},
			{time = 1400, a = 0},
			{time = 2400, a = 255},
		}},
		--DJLEVEL
		{id = "NEWRECORD_2",loop = 200 , op = {335}, dst = {
			{time = 0, x= 313 + 1098 , y = 606, w = 196, h = 52, a = 0},
			{time = 200, a = 255},
			{time = 600, a = 255},
			{time = 1400, a = 0},
			{time = 2400, a = 255},
		}},
		--スコア
		{id = "NEWRECORD_3", loop = 200, op = {330}, dst = {
			{time = 0, x= 313 + 1098 ,y = 522, w = 196, h = 64, a = 0},
			{time = 200, a = 255},
			{time = 600, a = 255},
			{time = 1400, a = 0},
			{time = 2400, a = 255},
		}},
		--ミスカウント
		{id = "NEWRECORD_4", loop = 200, op = {332}, dst = {
			{time = 0, x= 313 + 1098 , y = 451, w = 196, h = 56, a = 0},
			{time = 200, a = 255},
			{time = 600, a = 255},
			{time = 1400, a = 0},
			{time = 2400, a = 255},
		}},

		--グルーヴゲージ一式
		{id = "Groove_main", acc = 2 ,loop = 200 , dst = {
			{time = 0, x = 13 + 1329 , y = 716, w = 565, h = 309 , a = 0},
			{time = 200, x = 13 + 1329 , y = 716, w = 565, h = 309 , a = 255},
		}},
		{id = "Gauge_frame", acc = 2 ,loop = 300 , dst = {
			{time = 100 , x = 37 + 1318 , y = 879, w = 527, h = 0 , a = 0},
			{time = 300 , x = 37 + 1318 , y = 746, w = 527, h = 267, a = 255} ,
		}},
		{id = "gauge", acc = 2 ,loop = 400 , dst = {
			{time = 200 , x = 41 + 1318 , y = 750, w = 519, h = 259, a = 0},
			{time = 400 , x = 41 + 1318 , y = 750, w = 519, h = 259, a = 255},
		}},

		--DJRANK
		{id = "RANK_b_AAA", loop = 300 , op = {300}, dst = {
			{time = 100 , x = 116 + 1318, y = 825, w = 396, h = 524 , a = 0},
			{time = 300 , x = 116 + 1318, y = 825, w = 369, h = 124 , a = 255},
		}},
		{id = "RANK_b_AAA", blend = 2 , loop = 300 , op = {300}, dst = {
			{time = 300 , x = 116 + 1318, y = 825, w = 369, h = 124 , a = 0},
			{time = 700 , a = 100},
			{time = 1400 , a = 0},
			{time = 2100 , a = 0},
		}},

		{id = "RANK_b_AA", loop = 300 , op = {301}, dst = {
			{time = 100 , x = 116 + 1318, y = 825, w = 396, h = 524 , a = 0},
			{time = 300 , x = 116 + 1318, y = 825, w = 369, h = 124 , a = 255},
		}},
		{id = "RANK_b_AA", blend = 2 , loop = 300 , op = {301}, dst = {
			{time = 300 , x = 116 + 1318, y = 825, w = 369, h = 124 , a = 0},
			{time = 700 , a = 100},
			{time = 1400 , a = 0},
			{time = 2100 , a = 0},
		}},

		{id = "RANK_b_A", loop = 300 , op = {302}, dst = {
			{time = 100 , x = 116 + 1318, y = 825, w = 396, h = 524 , a = 0},
			{time = 300 , x = 116 + 1318, y = 825, w = 369, h = 124 , a = 255},
		}},
		{id = "RANK_b_A", blend = 2 , loop = 300 , op = {302}, dst = {
			{time = 300 , x = 116 + 1318, y = 825, w = 369, h = 124 , a = 0},
			{time = 700 , a = 100},
			{time = 1400 , a = 0},
			{time = 2100 , a = 0},
		}},

		{id = "RANK_b_B", loop = 300 , op = {303}, dst = {
			{time = 100 , x = 116 + 1318, y = 825, w = 396, h = 524 , a = 0},
			{time = 300 , x = 116 + 1318, y = 825, w = 369, h = 124 , a = 255},
		}},
		{id = "RANK_b_B", blend = 2 , loop = 300 , op = {303}, dst = {
			{time = 300 , x = 116 + 1318, y = 825, w = 369, h = 124 , a = 0},
			{time = 700 , a = 100},
			{time = 1400 , a = 0},
			{time = 2100 , a = 0},
		}},


		{id = "RANK_b_C", loop = 300 , op = {304}, dst = {
			{time = 100 , x = 116 + 1318, y = 825, w = 396, h = 524 , a = 0},
			{time = 300 , x = 116 + 1318, y = 825, w = 369, h = 124 , a = 255},
		}},

		{id = "RANK_b_C", blend = 2 , loop = 300 , op = {304}, dst = {
			{time = 300 , x = 116 + 1318, y = 825, w = 369, h = 124 , a = 0},
			{time = 700 , a = 100},
			{time = 1400 , a = 0},
			{time = 2100 , a = 0},
		}},

		{id = "RANK_b_D", loop = 300 , op = {305}, dst = {
			{time = 100 , x = 116 + 1318, y = 825, w = 396, h = 524 , a = 0},
			{time = 300 , x = 116 + 1318, y = 825, w = 369, h = 124 , a = 255},
		}},
		{id = "RANK_b_E", blend = 2 , loop = 300 , op = {306}, dst = {
			{time = 300 , x = 116 + 1318, y = 825, w = 369, h = 124 , a = 0},
			{time = 700 , a = 100},
			{time = 1400 , a = 0},
			{time = 2100 , a = 0},
		}},

		{id = "RANK_b_E", loop = 300 , op = {306}, dst = {
			{time = 100 , x = 116 + 1318, y = 825, w = 396, h = 524 , a = 0},
			{time = 300 , x = 116 + 1318, y = 825, w = 369, h = 124 , a = 255},
		}},
		{id = "RANK_b_E", blend = 2 , loop = 300 , op = {306}, dst = {
			{time = 300 , x = 116 + 1318, y = 825, w = 369, h = 124 , a = 0},
			{time = 700 , a = 100},
			{time = 1400 , a = 0},
			{time = 2100 , a = 0},
		}},

		{id = "RANK_b_F", loop = 300 , acc = 2 , op = {307}, dst = {
			{time = 100 , x = 116 + 1318, y = 825, w = 396, h = 524 , a = 0},
			{time = 300 , x = 116 + 1318, y = 825, w = 369, h = 124 , a = 255},
		}},
		{id = "RANK_b_F", blend = 2 , loop = 300 , acc = 2 , op = {307}, dst = {
			{time = 300 , x = 116 + 1318, y = 825, w = 369, h = 124 , a = 0},
			{time = 700 , a = 100},
			{time = 1400 , a = 0},
			{time = 2100 , a = 0},
		}},

		--ランク自己ベスト
		{id = "RANK_m_AAA", loop = 300 , op = {320}, dst = {
			{time = 100 , x = ( 227 - 150 ) + 1389  , y = 619, w = 69, h = 23 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_m_AA", loop = 300 , op = {321}, dst = {
			{time = 100 , x = ( 227 - 150 ) + 1389  , y = 619, w = 69, h = 23 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_m_A", loop = 300 , op = {322}, dst = {
			{time = 100 , x = ( 227 - 150 ) + 1389  , y = 619, w = 69, h = 23 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_m_B", loop = 300 , op = {323}, dst = {
			{time = 100 , x = ( 227 - 150 ) + 1389  , y = 619, w = 69, h = 23 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_m_C", loop = 300 , op = {324}, dst = {
			{time = 100 , x = ( 227 - 150 ) + 1389  , y = 619, w = 69, h = 23 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_m_D", loop = 300 , op = {325}, dst = {
			{time = 100 , x = ( 227 - 150 ) + 1389  , y = 619, w = 69, h = 23 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_m_E", loop = 300 , op = {326}, dst = {
			{time = 100 , x = ( 227 - 150 ) + 1389  , y = 619, w = 69, h = 23 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_m_F", loop = 300 , op = {327}, dst = {
			{time = 100 , x = ( 227 - 150 ) + 1389  , y = 619, w = 69, h = 23 , a = 0},
			{time = 300 , a = 255},
		}},
		--ランク今回
		{id = "RANK_m_AAA", loop = 300 , op = {300}, dst = {
			{time = 100 , x = ( 383 - 150 ) + 1389  , y = 619,w = 69, h = 23 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_m_AA", loop = 300 , op = {301}, dst = {
			{time = 100 , x = ( 383 - 150 ) + 1389  , y = 619,w = 69, h = 23 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_m_A", loop = 300 , op = {302}, dst = {
			{time = 100 , x = ( 383 - 150 ) + 1389  , y = 619,w = 69, h = 23 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_m_B", loop = 300 , op = {303}, dst = {
			{time = 100 , x = ( 383 - 150 ) + 1389  , y = 619,w = 69, h = 23 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_m_C", loop = 300 , op = {304}, dst = {
			{time = 100 , x = ( 383 - 150 ) + 1389  , y = 619,w = 69, h = 23 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_m_D", loop = 300 , op = {305}, dst = {
			{time = 100 , x = ( 383 - 150 ) + 1389  , y = 619,w = 69, h = 23 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_m_E", loop = 300 , op = {306}, dst = {
			{time = 100 , x = ( 383 - 150 ) + 1389  , y = 619,w = 69, h = 23 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_m_F", loop = 300 , op = {307}, dst = {
			{time = 100 , x = ( 383 - 150 ) + 1389  , y = 619,w = 69, h = 23 , a = 0},
			{time = 300 , a = 255},
		}},
		--ランク差分
		{id = "RANK_s_MAX", loop = 300 , op = {300}, dst = {
			{time = 100 , x= ( 321 - 250 ) + 1389  , y = 588, w = 45, h = 19 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_s_AAA", loop = 300 , op = {301}, dst = {
			{time = 100 , x= ( 321 - 250 ) + 1389  , y = 588, w = 45, h = 19 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_s_AA", loop = 300 , op = {302}, dst = {
			{time = 100 , x= ( 321 - 250 ) + 1389  , y = 588, w = 45, h = 19 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_s_A", loop = 300 , op = {303}, dst = {
			{time = 100 , x= ( 321 - 250 ) + 1389  , y = 588, w = 45, h = 19 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_s_B", loop = 300 , op = {304}, dst = {
			{time = 100 , x= ( 321 - 250 ) + 1389  , y = 588, w = 45, h = 19 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_s_C", loop = 300 , op = {305}, dst = {
			{time = 100 , x= ( 321 - 250 ) + 1389  , y = 588, w = 45, h = 19 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_s_D", loop = 300 , op = {306}, dst = {
			{time = 100 , x= ( 321 - 250 ) + 1389  , y = 588, w = 45, h = 19 , a = 0},
			{time = 300 , a = 255},
		}},
		{id = "RANK_s_E", loop = 300 , op = {307}, dst = {
			{time = 100 , x= ( 321 - 250 ) + 1389  , y = 588, w = 45, h = 19 , a = 0},
			{time = 300 , a = 255},
		}},
		--ランク差分-EXSCORE
		{id = "RANK_Diff_Exscore", loop = 300 , dst = {
			{time = 100 , x= 368  - 250 + 1389  , y = 588, w = 19, h = 18 , a = 0},
			{time = 300 , a = 255},
		}},

		--自己べクリアランプ
		{id = "best-clear", loop = 400 ,acc = 2, dst = {
			{time = 350 , x = (210 - 150)+ 1389  , y = 680, w = 109, h = 0 , a = 0},
			{time = 400 , y = 671, h = 19, a = 255},
		}},
		--今回クリアランプ
		{id = "current-clear", loop = 400 ,acc = 2, dst = {
			{time = 350 , x= ( 362 - 150 )+ 1389  , y = 680, w = 109, h = 0 , a = 0},
			{time = 400 , y = 671, h = 19, a = 255},
		}},

		--自己べ_EXSCORE
		{id = "Best_Exscore", loop = 300 , dst ={
			{time = 100 , x = 225 - 150 + 1389 , y = 551, w = 20, h = 20 , a = 0 },
			{time = 300 , a = 255},
		}},
		--自己ベストスコアレート
		{id = "Best_Exscore_Acc", loop = 300 , dst ={
			{time = 100 ,x = 225 - 150 + 1389 , y = 537, w = 15, h = 14 , a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "Best_Exscore_Acc2", loop = 300 , dst ={
			{time = 100 ,x = 274 - 150 + 1389 , y = 537, w = 15, h = 14 , a = 0 },
			{time = 300 , a = 255},
		}},
		--今回_EXSCORE
		{id = "Current_Exscore", loop = 300 , dst ={
			{time = 100 ,x = 376 - 150 + 1389 , y = 551, w = 20, h = 20 , a = 0 },
			{time = 300 , a = 255},
		}},
		--今回のスコアレート
		{id = "Current_Exscore_Acc", loop = 300 , dst ={
			{time = 100 ,x = 376 - 150 + 1389 , y = 537, w = 15, h = 14 , a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "Current_Exscore_Acc2", loop = 300 , dst ={
			{time = 100 ,x = 425 - 150 + 1389 , y = 537, w = 15, h = 14 , a = 0 },
			{time = 300 , a = 255},
		}},
		--差分EXSCORE
		{id = "Diff_Exscore", loop = 300 , dst = {
			{time = 100 , x= 368 - 300 + 1389 , y = 508, w = 19, h = 18 , a = 0 },
			{time = 300 , a = 255},
		}},


		--ミスカウント_初回用
		{id = "MISSCOUNT_F", loop = 300 , dst ={
			{time = 100 , x = 225 - 150 + 1389 , y =  469, w = 80, h = 20 , a = 0 },
			{time = 300 , a = 255},
		}},
		--ミスカウント差分_初回用
		{id = "MISSCOUNT_SF", loop = 300 , dst ={
			{time = 100 , x = 370 - 304 + 1389   , y =  443, w = 94, h = 7 , a = 0 },
			{time = 300 , a = 255},
		}},



		--自己べ_ミスカウント
		{id = "Best_Misscount", loop = 300 , dst ={
			{time = 100 , x = 225 - 150 + 1389  , y =  469, w = 20, h = 20 , a = 0 },
			{time = 300 , a = 255},
		}},
		--今回_ミスカウント
		{id = "Current_Misscount", loop = 300 , dst = {
			{time = 100 , x = 376 - 150 + 1389  , y =  469, w = 20, h = 20 , a = 0 },
			{time = 300 , a = 255},
		}},
		--差分_ミスカウント
		{id = "Diff_Misscount", loop = 300 , dst = {
			{time = 100 , x= 368 - 300 + 1389  , y = 437, w = 19, h = 18 , a = 0 },
			{time = 300 , a = 255},
		}},



		--ターゲット_EXスコア
		{id = "TARGETSCORE", loop = 300 , dst ={
			{time = 100 , x = 225 + 2 + 1389  , y = 397, w = 20, h = 20 , a = 0 },
			{time = 300 , a = 255},
		}},
		--差分_ターゲット
		{id = "Diff_TARGETSCORE", loop = 300 , dst = {
			{time = 100 , x= 214 + 5 + 1389  , y = 365, w = 19, h = 18 , a = 0 },
			{time = 300 , a = 255},
		}},
		--ターゲット_スコアレート
		{id = "TARGETRATE1", loop = 300 , dst ={
			{time = 100 , x = 362 - 301 + 1389  , y = 397, w = 20, h = 20 , a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "TARGETRATE2", loop = 300 , dst ={
			{time = 100 , x = 428 - 301 + 1389  , y = 397, w = 20, h = 20 , a = 0 },
			{time = 300 , a = 255},
		}},
		--ターゲット_自分のスコアレート
		{id = "TARGET_MYRATE1", loop = 300 , dst = {
			{time = 100 , x= 364 - 301 + 1389  , y = 365, w = 19, h = 18 , a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "TARGET_MYRATE2", loop = 300 , dst = {
			{time = 100 , x= 426 - 301 + 1389  , y = 365, w = 19, h = 18 , a = 0 },
			{time = 300 , a = 255},
		}},


		--判定数
		--通常
		{id = "JUDGE_PG", loop = 300 , dst ={
			{time = 100 , x = 170 + 1400 , y = 313, w = 22, h = 20 , a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "JUDGE_GR", loop = 300 , dst ={
			{time = 100 , x = 170 + 1400 , y = 313 - ( 34 * 1 ), w = 22, h = 20 , a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "JUDGE_GD", loop = 300 , dst ={
			{time = 100 , x = 170 + 1400 , y = 313 - ( 34 * 2 ), w = 22, h = 20 , a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "JUDGE_BD", loop = 300 , dst ={
			{time = 100 , x = 170 + 1400 , y = 313 - ( 34 * 3 ), w = 22, h = 20 , a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "JUDGE_PR", loop = 300 , dst ={
			{time = 100 , x = 170 + 1400 , y = 313 - ( 34 * 4 ), w = 22, h = 20 , a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "JUDGE_MS", loop = 300 , dst ={
			{time = 100 , x = 170 + 1400 , y = 313 - ( 34 * 5 ), w = 22, h = 20 , a = 0 },
			{time = 300 , a = 255},
		}},

		--FAST
		{id = "JUDGE_PG_F", loop = 300 ,  dst ={
			{time = 100 , x = 390 + 1400 , y = 317, w = 14, h = 13, a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "JUDGE_GR_F", loop = 300 ,  dst ={
			{time = 100 , x = 390  + 1400 , y = 317 - ( 34 * 1 ), w = 14, h = 13, a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "JUDGE_GD_F", loop = 300 ,  dst ={
			{time = 100 , x = 390  + 1400 , y = 317 - ( 34 * 2 ), w = 14, h = 13, a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "JUDGE_BD_F", loop = 300 ,  dst ={
			{time = 100 , x = 390  + 1400 , y = 317 - ( 34 * 3 ), w = 14, h = 13, a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "JUDGE_PR_F", loop = 300 ,  dst ={
			{time = 100 , x = 390  + 1400 , y = 317 - ( 34 * 4 ), w = 14, h = 13, a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "JUDGE_MS_F", loop = 300 ,  dst ={
			{time = 100 , x = 390  + 1400 , y = 317 - ( 34 * 5 ), w = 14, h = 13, a = 0 },
			{time = 300 , a = 255},
		}},

		--SLOW
		{id = "JUDGE_PG_S", loop = 300 ,  dst ={
			{time = 100 , x = 308  + 1400 , y = 317, w = 14, h = 13, a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "JUDGE_GR_S", loop = 300 ,  dst ={
			{time = 100 , x = 308  + 1400 , y = 317 - ( 34 * 1 ), w = 14, h = 13, a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "JUDGE_GD_S", loop = 300 ,  dst ={
			{time = 100 , x = 308  + 1400 , y = 317 - ( 34 * 2 ), w = 14, h = 13, a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "JUDGE_BD_S", loop = 300 ,  dst ={
			{time = 100 , x = 308  + 1400 , y = 317 - ( 34 * 3 ), w = 14, h = 13, a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "JUDGE_PR_S", loop = 300 ,  dst ={
			{time = 100 , x = 308  + 1400 , y = 317 - ( 34 * 4 ), w = 14, h = 13, a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "JUDGE_MS_S", loop = 300 ,  dst ={
			{time = 100 , x = 308  + 1400 , y = 317 - ( 34 * 5 ), w = 14, h = 13, a = 0 },
			{time = 300 , a = 255},
		}},

		--MAXCOMBO
		{id = "MAXCOMBO", loop = 300 ,  dst ={
			{time = 100 , x = 199 + 1400 , y = 113, w = 14, h = 13, a = 0 },
			{time = 300 , a = 255},
		}},
		--COMBOBREAK
		{id = "COMBOBREAK", loop = 300 ,  dst ={
			{time = 100 , x = 199 + 1400 , y = 90, w = 14, h = 13, a = 0 },
			{time = 300 , a = 255},
		}},
		--FAST&SLOW
		{id = "JUDGE_TOTAL_F", loop = 300 ,  dst ={
			{time = 100 , x = 390 + 1400 , y = 113, w = 14, h = 13, a = 0 },
			{time = 300 , a = 255},
		}},
		{id = "JUDGE_TOTAL_S", loop = 300 ,  dst ={
			{time = 100 , x = 390 + 1400 , y = 90, w = 14, h = 13, a = 0 },
			{time = 300 , a = 255},
		}},




		--ここから画面下部情報

		--装飾
		{id = "NAME_LINE_ACC", loop = 250 ,  dst ={
			{time = 100 , x = 925, y = 11, w = 70, h = 194 , a = 0},
			{time = 250 , x = 925, y = 11, w = 70, h = 194 , a = 255},
		}},
		--装飾フラッシュ
		{id = "NAME_LINE_ACC", loop = -1 , blend = 2 , acc = 2 ,  dst ={
			{time = 200 , x = 925, y = 11, w = 70, h = 194 , a = 255},
			{time = 400 , a = 0},
		}},
		--曲名下ライン
		{id = "NAME_LINE", loop = 200 , dst ={
			{time = 0 , x = 534 + 425, y = 53, w = 0, h = 20 , a = 0},
			{time = 200 , x = 534 , w = 853 , a = 255},
		}},

		--難易度フレーム	
		{id = "DIFF_KEYS_INFO", loop = 300 , dst ={
			{time = 200 , x = 724, y = 23, w = 285, h = 31 , a = 0},
			{time = 300 , a = 255},
		}},
		--ノート数フレーム
		{id = "NOTES_INFO", loop = 300 , dst ={
			{time = 200 , x = 1015, y = 23, w = 180, h = 31 , a = 0},
			{time = 300 , a = 255},
		}},

		--鍵盤数
		{id = "DATA_KEYS_SP", loop = 400 , op = {160}, dst ={
			{time = 300 , x = 729 , y = 28 , w = 58, h = 21 , a = 0},
			{time = 400 , a = 255},
		}},
		{id = "DATA_KEYS_SP", loop = 400 , op = {161}, dst ={
			{time = 300 , x = 729 , y = 28 , w = 58, h = 21 , a = 0},
			{time = 400 , a = 255},
		}},
		{id = "DATA_KEYS_DP", loop = 400 , op = {162}, dst ={
			{time = 300 , x = 729 , y = 28 , w = 58, h = 21 , a = 0},
			{time = 400 , a = 255},
		}},
		{id = "DATA_KEYS_DP", loop = 400 , op = {163}, dst ={
			{time = 300 , x = 729 , y = 28 , w = 58, h = 21 , a = 0},
			{time = 400 , a = 255},
		}},
		{id = "DATA_KEYS_9K", loop = 400 , op = {164}, dst ={
			{time = 300 , x = 729 , y = 28 , w = 58, h = 21 , a = 0},
			{time = 400 , a = 255},
		}},

		--判定
		{id = "P_JUDGE_VEASY", loop = 400 , op = {184}, dst ={
			{time = 300 , x = 790 , y = 28 , w = 58, h = 21 , a = 0},
			{time = 400 , a = 255},
		}},
		{id = "P_JUDGE_EASY", loop = 400 , op = {183}, dst ={
			{time = 300 , x = 790 , y = 28 , w = 58, h = 21 , a = 0},
			{time = 400 , a = 255},
		}},
		{id = "P_JUDGE_NORMAL", loop = 400 , op = {182}, dst ={
			{time = 300 , x = 790 , y = 28 , w = 58, h = 21 , a = 0},
			{time = 400 , a = 255},
		}},
		{id = "P_JUDGE_HARD", loop = 400 , op = {181}, dst ={
			{time = 300 , x = 790 , y = 28 , w = 58, h = 21 , a = 0},
			{time = 400 , a = 255},
		}},
		{id = "P_JUDGE_VHARD", loop = 400 , op = {180}, dst ={
			{time = 300 , x = 790 , y = 28 , w = 58, h = 21 , a = 0},
			{time = 400 , a = 255},
		}},

		--数字
		{id = "DATA_DIFFICULITY_NUM_0", loop = 400 , op = {150}, dst ={
			{time = 300 , x = 964, y = 30, w = 18, h = 17 , a = 0},
			{time = 400 , a = 255},
		}},
		{id = "DATA_DIFFICULITY_NUM_1", loop = 400 , op = {151}, dst ={
			{time = 300 , x = 964, y = 30, w = 18, h = 17 , a = 0},
			{time = 400 , a = 255},
		}},
		{id = "DATA_DIFFICULITY_NUM_2", loop = 400 , op = {152}, dst ={
			{time = 300 , x = 964, y = 30, w = 18, h = 17 , a = 0},
			{time = 400 , a = 255},
		}},
		{id = "DATA_DIFFICULITY_NUM_3", loop = 400 , op = {153}, dst ={
			{time = 300 , x = 964, y = 30, w = 18, h = 17 , a = 0},
			{time = 400 , a = 255},
		}},
		{id = "DATA_DIFFICULITY_NUM_4", loop = 400 , op = {154}, dst ={
			{time = 300 , x = 964, y = 30, w = 18, h = 17 , a = 0},
			{time = 400 , a = 255},
		}},
		{id = "DATA_DIFFICULITY_NUM_5", loop = 400 , op = {155}, dst ={
			{time = 300 , x = 964, y = 30, w = 18, h = 17 , a = 0},
			{time = 400 , a = 255},
		}},
		--難易度文字
		{id = "DATA_DIFFICULTY_U", loop = 400 , op = {150}, dst ={
			{time = 300 , x = 855, y = 30, w = 104, h = 17 , a = 0},
			{time = 400 , a = 255},
		}},
		{id = "DATA_DIFFICULTY_B", loop = 400 , op = {151}, dst ={
			{time = 300 , x = 855, y = 30, w = 104, h = 17 , a = 0},
			{time = 400 , a = 255},
		}},
		{id = "DATA_DIFFICULTY_N", loop = 400 , op = {152}, dst ={
			{time = 300 , x = 855, y = 30, w = 104, h = 17 , a = 0},
			{time = 400 , a = 255},
		}},
		{id = "DATA_DIFFICULTY_H", loop = 400 , op = {153}, dst ={
			{time = 300 , x = 855, y = 30, w = 104, h = 17 , a = 0},
			{time = 400 , a = 255},
		}},
		{id = "DATA_DIFFICULTY_A", loop = 400 , op = {154}, dst ={
			{time = 300 , x = 855, y = 30, w = 104, h = 17 , a = 0},
			{time = 400 , a = 255},
		}},
		{id = "DATA_DIFFICULTY_I", loop = 400 , op = {155}, dst ={
			{time = 300 , x = 855, y = 30, w = 104, h = 17 , a = 0},
			{time = 400 , a = 255},
		}},

		--数字
		{id = "NOTES_NUM", loop = 400 , dst ={
			{time = 300 , x = 1035, y = 30, w = 18, h = 17 , a = 0},
			{time = 400 , a = 255},
		}},

		--文字表記（曲名　アーティスト名）
		{id = "songname", loop = 500 , dst ={
			{time = 400 , x = 960, y = 115, w = 800, h = 23 , a = 0},
			{time = 500 , a = 255},
		}},
		{id = "artist", loop = 550 , dst ={
			{time = 450 , x = 960, y = 80, w = 800, h = 28 , a = 0},
			{time = 550 , a = 255},
		}},
		{id = "folder", loop = 600 , dst ={
			{time = 500 , x = 960, y = 57, w = 800, h = 28 , a = 0},
			{time = 600 , a = 255},
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
			{time = 250, x = -232, y = 461, w = 2383, h = 196 , a = 0 ,acc = 2},
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
			{time = 250, x = -200, y = 461, w = 2321, h = 196 , a = 0 ,acc = 2},
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
			{time = 250, x = -200, y = 461, w = 2321, h = 196 , a = 0 ,acc = 2},
			{time = 1100},
		}},



		{id = "black", loop = 500, timer = 2, acc = 2, dst = {
			{time = 0, x = 0, y = 0, w = 1920, h = 1080, a = 0, r = 0, g = 0, b = 0},
			{time = 500, a = 255},
		}},	


		--dst記述終了
	}



	return skin
end

return {
    header = header,
    main = main
}