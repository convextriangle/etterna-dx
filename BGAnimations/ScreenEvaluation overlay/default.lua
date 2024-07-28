local t = Def.ActorFrame {}
-- Controls the topmost layer of ScreenEvaluation

local song = GAMESTATE:GetCurrentSong()
local steps = GAMESTATE:GetCurrentSteps()
local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats()
local score = pss:GetHighScore()

local judges = {
    "TapNoteScore_W1",
    "TapNoteScore_W2",
    "TapNoteScore_W3",
    "TapNoteScore_W4",
    "TapNoteScore_W5",
    "TapNoteScore_Miss"
}

-- the "everything" container
t[#t+1] = Def.ActorFrame {
    InitCommand = function(self)
        -- children are relative to the center of the screen (relative to this position)
        self:xy(SCREEN_CENTER_X + 230, SCREEN_CENTER_Y - 180)
    end,

    LoadFont("Common Normal") .. {
        InitCommand = function(self)
            self:valign(1)
            self:settextf("%.6f%%", score:GetWifeScore()*100)
        end
    },
    LoadFont("Common Normal") .. {
        InitCommand = function(self)
            self:y(30)
            self:settextf("%5.2f -> %5.2f", steps:GetMSD(getCurRateValue(), 1), score:GetSkillsetSSR("Overall"))
        end
    },
    LoadFont("Common Normal") .. {
        InitCommand = function(self)
            self:y(5):valign(0)
            self:settext(score:GetModifiers() .. ", Judge " .. GetTimingDifficulty())
            self:zoom(.4)
        end
    },
    LoadFont("Common Normal") .. {
        InitCommand = function(self)
            self:y(15):valign(0):zoom(.4)
            self:settext(getRateString(getCurRateValue()))
        end
    },
    LoadFont("Common Normal") .. {
        InitCommand = function(self)
            self:y(45):valign(0):zoom(.4)

            local str = string.format("Pack: %s", song:GetGroupName())
            self:settext(str)
        end
    }
}


return t
