local t = Def.ActorFrame {}
-- Controls the topmost layer of ScreenEvaluation

local song = GAMESTATE:GetCurrentSong()
local steps = GAMESTATE:GetCurrentSteps()
local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats()
local score = pss:GetHighScore()

local grades = {
    Grade_Tier01 = "quint",  -- AAAAA

    Grade_Tier02 = "quad",   -- AAAA:
    Grade_Tier03 = "quad",   -- AAAA.
    Grade_Tier04 = "quad",   -- AAAA

    Grade_Tier05 = "triple", -- AAA:
    Grade_Tier06 = "triple", -- AAA.
    Grade_Tier07 = "triple", -- AAA

    Grade_Tier08 = "double", -- AA:
    Grade_Tier09 = "double", -- AA.
    Grade_Tier10 = "double", -- AA

    Grade_Tier11 = "A",      -- A:
    Grade_Tier12 = "A",      -- A.
    Grade_Tier13 = "A",      -- A

    Grade_Tier14 = "B",      -- B
    Grade_Tier15 = "C",      -- C
    Grade_Tier16 = "D",      -- D

    Grade_Tier17 = "E",      -- ?????????

    Grade_Failed = "F",      -- F

    Grade_None = nil,
};

-- song info
t[#t + 1] = Def.ActorFrame {
    InitCommand = function(self)
        -- children are relative to the center of the screen (relative to this position)
        self:xy(SCREEN_CENTER_X + 250, SCREEN_CENTER_Y - 180)
        self:zoom(0.9)
    end,

    LoadFont("artist 16px") .. {
        InitCommand = function(self)
            self:y(15):valign(0):zoom(.4)
            self:settext("RATE: " .. getRateString(getCurRateValue()))
        end
    },
    LoadFont("artist 16px") .. {
        InitCommand = function(self)
            self:y(34):zoom(.4)
            self:settextf("MSD: %5.2f", steps:GetMSD(getCurRateValue(), 1))
        end
    },
    LoadFont("artist 16px") .. {
        InitCommand = function(self)
            self:y(45):valign(0):zoom(.4)

            self:settextf("PACK: %s", song:GetGroupName())
        end
    },
    LoadFont("artist 16px") .. {
        InitCommand = function(self)
            self:y(60):valign(0):zoom(.4)

            self:settextf("CHART AUTHOR: %s", song:GetOrTryAtLeastToGetSimfileAuthor())
        end
    },
    LoadFont("artist 16px") .. {
        InitCommand = function(self)
            self:y(75):valign(0):zoom(.4)

            self:settextf("MEAN: %.2f ms", wifeMean(score:GetOffsetVector()))
        end
    },
    LoadFont("artist 16px") .. {
        InitCommand = function(self)
            self:y(90):valign(0):zoom(.4)

            self:settextf("STANDARD DEVIATION: %.2f ms", wifeSd(score:GetOffsetVector()))
        end
    },
    LoadFont("artist 16px") .. {
        InitCommand = function(self)
            self:y(105):valign(0):zoom(.4)

            self:settextf("MA (J%d): %.2f:1", GetTimingDifficulty(),
                score:GetTapNoteScore("TapNoteScore_W1") / score:GetTapNoteScore("TapNoteScore_W2"))
        end
    },
    LoadFont("artist 16px") .. {
        InitCommand = function(self)
            self:y(120):valign(0):zoom(.4)

            self:settextf("PA (J%d): %.2f:1", GetTimingDifficulty(),
                score:GetTapNoteScore("TapNoteScore_W2") / score:GetTapNoteScore("TapNoteScore_W3"))
        end
    },
}

t[#t + 1] = Def.ActorFrame {
    LoadActor("grade/" .. grades[score:GetWifeGrade()]) .. {
        InitCommand = function(self)
            self:xy(SCREEN_CENTER_X - 285, SCREEN_CENTER_Y - 120):zoom(0.5):draworder(1)
        end,
    },
}

return t
