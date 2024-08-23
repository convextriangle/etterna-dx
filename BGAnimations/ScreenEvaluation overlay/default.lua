local t = Def.ActorFrame {}
-- Controls the topmost layer of ScreenEvaluation

local song = GAMESTATE:GetCurrentSong()
local steps = GAMESTATE:GetCurrentSteps()
local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats()
local score = pss:GetHighScore()

local grades = {
    Grade_Tier01 = "AAAA", -- AAAAA

    Grade_Tier02 = "AAA",  -- AAAA:
    Grade_Tier03 = "AA",   -- AAAA.
    Grade_Tier04 = "A",    -- AAAA

    Grade_Tier05 = "B",    -- AAA:
    Grade_Tier06 = "C",    -- AAA.
    Grade_Tier07 = "D",    -- AAA

    Grade_Tier08 = "E",    -- AA:
    Grade_Tier09 = "F",    -- AA.
    Grade_Tier10 = "F",    -- AA

    Grade_Tier11 = "F",    -- A:
    Grade_Tier12 = "F",    -- A.
    Grade_Tier13 = "F",    -- A

    Grade_Tier14 = "F",    -- B
    Grade_Tier15 = "F",    -- C
    Grade_Tier16 = "F",    -- D

    Grade_Tier17 = "wtf",  -- ?????????

    Grade_Failed = "F",    -- F

    Grade_None = nil,
};

local clear = {
    Grade_Tier01 = "MAX",    -- AAAAA

    Grade_Tier02 = "CLEAR",  -- AAAA:
    Grade_Tier03 = "CLEAR",  -- AAAA.
    Grade_Tier04 = "CLEAR",  -- AAAA

    Grade_Tier05 = "CLEAR",  -- AAA:
    Grade_Tier06 = "CLEAR",  -- AAA.
    Grade_Tier07 = "FAILED", -- AAA

    Grade_Tier08 = "FAILED", -- AA:
    Grade_Tier09 = "FAILED", -- AA.
    Grade_Tier10 = "FAILED", -- AA

    Grade_Tier11 = "FAILED", -- A:
    Grade_Tier12 = "FAILED", -- A.
    Grade_Tier13 = "FAILED", -- A

    Grade_Tier14 = "FAILED", -- B
    Grade_Tier15 = "FAILED", -- C
    Grade_Tier16 = "FAILED", -- D

    Grade_Tier17 = "wtf",    -- ?????????

    Grade_Failed = "FAILED", -- F

    Grade_None = nil,
};

local difficulty = {
    Difficulty_Beginner = "BEGINNER",
    Difficulty_Easy = "EASY",
    Difficulty_Medium = "NORMAL",
    Difficulty_Hard = "HARD",
    Difficulty_Challenge = "INSANE",
    Difficulty_Edit = "EDIT",
};

-- song info
t[#t + 1] = Def.ActorFrame {
    InitCommand = function(self)
        -- children are relative to the center of the screen (relative to this position)
        self:xy(SCREEN_CENTER_X + 250, SCREEN_CENTER_Y - 130)
        self:zoom(0.85)
    end,

    LoadFont("artist 16px") .. {
        InitCommand = function(self)
            self:valign(1)
            self:settextf("%.6f%%", score:GetWifeScore() * 100)
        end
    },
    LoadFont("artist 16px") .. {
        InitCommand = function(self)
            self:y(30)
            self:settextf("%5.2f > %5.2f", steps:GetMSD(getCurRateValue(), 1), score:GetSkillsetSSR("Overall"))
        end
    },
    LoadFont("artist 16px") .. {
        InitCommand = function(self)
            self:y(5):valign(0)
            self:settext(score:GetModifiers() .. ", Judge " .. GetTimingDifficulty())
            self:zoom(.4)
        end
    },
    LoadFont("artist 16px") .. {
        InitCommand = function(self)
            self:y(15):valign(0):zoom(.4)
            self:settext(getRateString(getCurRateValue()))
        end
    },
    LoadFont("artist 16px") .. {
        InitCommand = function(self)
            self:y(45):valign(0):zoom(.4)

            local str = string.format("Pack: %s", song:GetGroupName())
            self:settext(str)
        end
    }
}

-- score stats
t[#t + 1] = Def.ActorFrame {
    LoadActor("grade/" .. grades[score:GetGrade()]) .. {
        InitCommand = function(self)
            self:xy(SCREEN_CENTER_X - 285, SCREEN_CENTER_Y - 120):zoom(0.5):draworder(1)
        end,
    },

    LoadFont("handel/handel 24px") .. {
        InitCommand = function(self)
            self:xy(SCREEN_CENTER_X - 230, SCREEN_CENTER_Y - 66)
            self:settext(clear[score:GetGrade()]):zoom(0.5)
        end
    },
    LoadFont("handel/handel 24px") .. {
        InitCommand = function(self)
            self:xy(SCREEN_CENTER_X - 230, SCREEN_CENTER_Y - 44)
            self:settext(grades[score:GetGrade()]):zoom(0.5)
        end
    },
    LoadFont("pattern_num") .. {
        InitCommand = function(self)
            self:xy(SCREEN_CENTER_X - 230, SCREEN_CENTER_Y - 14.5)
            self:settextf("%.2f", score:GetSkillsetSSR("Overall")):zoom(0.45)
        end
    },
    LoadFont("pattern_num") .. {
        InitCommand = function(self)
            self:xy(SCREEN_CENTER_X - 230, SCREEN_CENTER_Y - 5)
            self:settextf("%.2f%%", score:GetWifeScore() * 100):zoom(0.3)
        end
    },
    LoadFont("pattern_num") .. {
        InitCommand = function(self)
            local cb_count = pss:GetTapNoteScores('TapNoteScore_W4') + pss:GetTapNoteScores('TapNoteScore_W5') +
                pss:GetTapNoteScores('TapNoteScore_Miss')

            self:xy(SCREEN_CENTER_X - 230, SCREEN_CENTER_Y + 24)
            self:settextf("%d", cb_count):zoom(0.5)
        end
    },

    LoadFont("pattern_num") .. {
        InitCommand = function(self)
            self:xy(SCREEN_CENTER_X - 230, SCREEN_CENTER_Y + 56)
            self:settextf("93%%", score:GetWifeScore() * 100):zoom(0.5)
        end
    },

    LoadFont("pattern_num") .. {
        InitCommand = function(self)
            self:xy(SCREEN_CENTER_X - 230, SCREEN_CENTER_Y + 72)

            local sign = ""
            if score:GetWifeScore() * 100 >= 93 then
                sign = "+"
            end

            self:settextf(sign .. "%.2f%%", score:GetWifeScore() * 100 - 93):zoom(0.3)
        end
    },

    LoadFont("pattern_num") .. {
        InitCommand = function(self)
            self:xy(SCREEN_CENTER_X - 320, SCREEN_CENTER_Y + 101)
            self:settextf("%d", pss:GetTapNoteScores('TapNoteScore_W1')):zoom(0.5)
        end
    },

    LoadFont("pattern_num") .. {
        InitCommand = function(self)
            self:xy(SCREEN_CENTER_X - 320, SCREEN_CENTER_Y + 118)
            self:settextf("%d", pss:GetTapNoteScores('TapNoteScore_W2')):zoom(0.5)
        end
    },

    LoadFont("pattern_num") .. {
        InitCommand = function(self)
            self:xy(SCREEN_CENTER_X - 320, SCREEN_CENTER_Y + 133)
            self:settextf("%d", pss:GetTapNoteScores('TapNoteScore_W3')):zoom(0.5)
        end
    },

    LoadFont("pattern_num") .. {
        InitCommand = function(self)
            self:xy(SCREEN_CENTER_X - 320, SCREEN_CENTER_Y + 149)
            self:settextf("%d", pss:GetTapNoteScores('TapNoteScore_W4')):zoom(0.5)
        end
    },

    LoadFont("pattern_num") .. {
        InitCommand = function(self)
            self:xy(SCREEN_CENTER_X - 320, SCREEN_CENTER_Y + 164)
            self:settextf("%d", pss:GetTapNoteScores('TapNoteScore_W5')):zoom(0.5)
        end
    },

    LoadFont("pattern_num") .. {
        InitCommand = function(self)
            self:xy(SCREEN_CENTER_X - 320, SCREEN_CENTER_Y + 180)
            self:settextf("%d", pss:GetTapNoteScores('TapNoteScore_Miss')):zoom(0.5)
        end
    },

    LoadFont("pattern_num") .. {
        InitCommand = function(self)
            self:xy(SCREEN_CENTER_X - 310, SCREEN_CENTER_Y + 194)
            self:settextf("%d", pss:MaxCombo()):zoom(0.5)
        end
    },

    LoadFont("pattern_num") .. {
        InitCommand = function(self)
            self:xy(SCREEN_CENTER_X + 60, SCREEN_BOTTOM - 20)
            self:settextf("%d", steps:GetRadarValues():GetValue("RadarCategory_Notes")):zoom(0.5)
        end
    },

    LoadFont("handel/handel 24px") .. {
        InitCommand = function(self)
            self:xy(SCREEN_CENTER_X - 25, SCREEN_BOTTOM - 20)
            self:settextf("%s %d", difficulty[steps:GetDifficulty()], steps:GetMeter()):zoom(0.4)
        end
    },
}

return t
