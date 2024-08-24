local steps = GAMESTATE:GetCurrentSteps()
local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats()
local score = pss:GetHighScore()
local older_pb = nil
local rateTable = getRateTable()

-- there must be a better way to do this...
for rate, high_score in pairs(rateTable[getRate(score)]) do
    if high_score == nil then
        break
    end

    if older_pb == nil then
        if score:GetWifePoints() ~= high_score:GetWifePoints() then
            older_pb = high_score
        end
        goto continue
    end

    local current = high_score:GetWifeScore()
    local older = older_pb:GetWifeScore()
    if current > older and score:GetWifePoints() ~= high_score:GetWifePoints() then
        older_pb = high_score
    end
    ::continue::
end

local clear = {
    Grade_Tier01 = "MAX",    -- AAAAA

    Grade_Tier02 = "CLEAR",  -- AAAA:
    Grade_Tier03 = "CLEAR",  -- AAAA.
    Grade_Tier04 = "CLEAR",  -- AAAA

    Grade_Tier05 = "CLEAR",  -- AAA:
    Grade_Tier06 = "CLEAR",  -- AAA.
    Grade_Tier07 = "CLEAR",  -- AAA

    Grade_Tier08 = "CLEAR",  -- AA:
    Grade_Tier09 = "CLEAR",  -- AA.
    Grade_Tier10 = "CLEAR",  -- AA

    Grade_Tier11 = "CLEAR",  -- A:
    Grade_Tier12 = "CLEAR",  -- A.
    Grade_Tier13 = "CLEAR",  -- A

    Grade_Tier14 = "CLEAR",  -- B
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

local get_signed = function(number, float)
    local sign = ""
    if number >= 0 then
        sign = "+"
    end

    if float then
        return sign .. string.format("%.2f", number)
    end
    return sign .. string.format("%d", number)
end

local target = playerConfig:get_data(pn_to_profile_slot(PLAYER_1)).TargetGoal
if target == nil then
    target = 93
end

local function getRescoreElements(pss, score)
    local o = {}
    o["dvt"] = dvt
    o["totalHolds"] = pss:GetRadarPossible():GetValue("RadarCategory_Holds") +
        pss:GetRadarPossible():GetValue("RadarCategory_Rolls")
    o["holdsHit"] = score:GetRadarValues():GetValue("RadarCategory_Holds") +
        score:GetRadarValues():GetValue("RadarCategory_Rolls")
    o["holdsMissed"] = o["totalHolds"] - o["holdsHit"]
    o["minesHit"] = pss:GetRadarPossible():GetValue("RadarCategory_Mines") -
        score:GetRadarValues():GetValue("RadarCategory_Mines")
    o["totalTaps"] = totalTaps
    return o
end

local judgeSetting = (PREFSMAN:GetPreference("SortBySSRNormPercent") and 4 or GetTimingDifficulty())
-- keep track of the current displayed score so we can refer back to it
local chosenScore
local mostRecentScore = SCOREMAN:GetMostRecentScore()
local screen
local usingCustomWindows = false

local t = Def.ActorFrame {
}

t[#t + 1] = LoadActor("offset_plot") .. {
    OnCommand = function(self)
        self:zoom(1)
    end
}

t[#t + 1] = Def.GraphDisplay {
    InitCommand = function(self)
        self:xy(SCREEN_CENTER_X - 285, SCREEN_CENTER_Y - 155)
        self:zoomx(1.085):zoomy(0.675)
        self:Load("GraphDisplay"):draworder(3)
    end,
    BeginCommand = function(self)
        local ss = SCREENMAN:GetTopScreen():GetStageStats()
        self:Set(ss, ss:GetPlayerStageStats())
        self:diffusealpha(0.7)
        self:draworder(3)
    end,
}

local offsets = pss:GetOffsetVector()

-- score stats
t[#t + 1] = Def.ActorFrame {
    BeginCommand = function(self)
        screen = SCREENMAN:GetTopScreen()
        screen:AddInputCallback(function(event)
            if event.type == "InputEventType_FirstPress" then
                local btn = event.GameButton
                if btn ~= nil then
                    local dir = 0
                    if btn == "EffectUp" then
                        -- judge window increase
                        dir = 1
                    elseif btn == "EffectDown" then
                        -- judge window decrease
                        dir = -1
                    end

                    if dir ~= 0 and not usingCustomWindows then
                        judgeSetting = clamp(judgeSetting + dir, 4, 9)
                        self:playcommand("JudgeWindowChanged")
                    elseif dir ~= 0 and usingCustomWindows then
                        self:playcommand("MoveCustomWindowIndex", { direction = dir })
                    end
                end
            end
        end)
    end,

    OnCommand = function(self)
        -- use this to force J4 init for SSRNorm
        local forcedScreenEntryJudgeWindow = nil
        if PREFSMAN:GetPreference("SortBySSRNormPercent") then
            forcedScreenEntryJudgeWindow = 4
        end
        -- update replaysnapshots and pss for current score being rejudged to whatever judge
        screen:RescoreReplay(pss, GAMESTATE:GetTimingScales()[forcedScreenEntryJudgeWindow or judgeSetting], score,
            usingCustomWindows)

        --- propagate set command through children with the song
        self:playcommand("Set", {
            song = GAMESTATE:GetCurrentSong(),
            steps = GAMESTATE:GetCurrentSteps(),
            score = score,
            judgeSetting = forcedScreenEntryJudgeWindow
        })
    end,

    JudgeWindowChangedCommand = function(self)
        self:playcommand("UpdateScore", {
            judgeSetting = judgeSetting,
            rejudged = true,
        })
    end,

    LoadFont("handel/handel 24px") .. {
        InitCommand = function(self)
            self:xy(SCREEN_CENTER_X - 285, SCREEN_CENTER_Y - 87)
            self:settext(score:GetModifiers() .. ", Judge " .. GetTimingDifficulty())
            self:zoom(.3)
        end,
        UpdateScoreCommand = function(self, params)
            self:settext(score:GetModifiers() .. ", Judge " .. params.judgeSetting)
        end,
    },

    LoadFont("handel/handel 24px") .. {
        InitCommand = function(self)
            self:xy(SCREEN_CENTER_X - 230, SCREEN_CENTER_Y - 66)
            self:settext(clear[score:GetWifeGrade()]):zoom(0.5)
        end,
    },
    LoadFont("handel/handel 24px") .. {
        InitCommand = function(self)
            self:xy(SCREEN_CENTER_X - 230, SCREEN_CENTER_Y - 44)
            self:settext(THEME:GetString("Grade", score:GetWifeGrade())):zoom(0.5)
        end,
    },
    LoadFont("pattern_num") .. {
        InitCommand = function(self)
            self:xy(SCREEN_CENTER_X - 230, SCREEN_CENTER_Y - 14.5)
            self:settextf("%.2f", score:GetSkillsetSSR("Overall")):zoom(0.45)
        end,
    },
    LoadFont("pattern_num") .. {
        InitCommand = function(self)
            self:xy(SCREEN_CENTER_X - 230, SCREEN_CENTER_Y - 5)
            self:settextf("%.2f%%", score:GetWifeScore() * 100):zoom(0.3)
        end,
        UpdateScoreCommand = function(self, params)
            local rst = getRescoreElements(pss, pss:GetHighScore())

            self:settextf("%.2f%%", getRescoredWife3Judge(3, params.judgeSetting, rst))
        end,
    },
    LoadFont("pattern_num") .. {
        InitCommand = function(self)
            local cb_count = score:GetTapNoteScore('TapNoteScore_W4') +
                score:GetTapNoteScore('TapNoteScore_W5') +
                score:GetTapNoteScore('TapNoteScore_Miss')

            self:xy(SCREEN_CENTER_X - 230, SCREEN_CENTER_Y + 24)
            self:settextf("%d", cb_count):zoom(0.5)
        end,
        UpdateScoreCommand = function(self, params)
            local cb_count = getRescoredJudge(offsets, params.judgeSetting, 4) +
                getRescoredJudge(offsets, params.judgeSetting, 5) +
                score:GetTapNoteScore('TapNoteScore_Miss')

            self:settextf("%d", cb_count)
        end,
    },

    LoadFont("pattern_num") .. {
        InitCommand = function(self)
            self:xy(SCREEN_CENTER_X - 230, SCREEN_CENTER_Y + 56)
            self:settextf("%.2f%%", target):zoom(0.5)
        end,
    },

    LoadFont("pattern_num") .. {
        InitCommand = function(self)
            self:xy(SCREEN_CENTER_X - 230, SCREEN_CENTER_Y + 72)
            self:settextf(get_signed(score:GetWifeScore() * 100 - target, true) .. "%%"):zoom(0.3)
        end,
        UpdateScoreCommand = function(self, params)
            local rst = getRescoreElements(pss, pss:GetHighScore())

            self:settextf(get_signed(getRescoredWife3Judge(3, params.judgeSetting, rst) - target, true) .. "%%")
        end,
    },

    LoadFont("pattern_num") .. {
        InitCommand = function(self)
            self:xy(SCREEN_CENTER_X - 320, SCREEN_CENTER_Y + 101)
            self:settextf("%d", score:GetTapNoteScore('TapNoteScore_W1')):zoom(0.5)
        end,
        UpdateScoreCommand = function(self, params)
            self:settextf("%d", getRescoredJudge(offsets, params.judgeSetting, 1))
        end,
    },

    LoadFont("pattern_num") .. {
        InitCommand = function(self)
            self:xy(SCREEN_CENTER_X - 320, SCREEN_CENTER_Y + 118)
            self:settextf("%d", score:GetTapNoteScore('TapNoteScore_W2')):zoom(0.5)
        end,
        UpdateScoreCommand = function(self, params)
            self:settextf("%d", getRescoredJudge(offsets, params.judgeSetting, 2))
        end,
    },

    LoadFont("pattern_num") .. {
        InitCommand = function(self)
            self:xy(SCREEN_CENTER_X - 320, SCREEN_CENTER_Y + 133)
            self:settextf("%d", score:GetTapNoteScore('TapNoteScore_W3')):zoom(0.5)
        end,
        UpdateScoreCommand = function(self, params)
            self:settextf("%d", getRescoredJudge(offsets, params.judgeSetting, 3))
        end,
    },

    LoadFont("pattern_num") .. {
        InitCommand = function(self)
            self:xy(SCREEN_CENTER_X - 320, SCREEN_CENTER_Y + 149)
            self:settextf("%d", score:GetTapNoteScore('TapNoteScore_W4')):zoom(0.5)
        end,
        UpdateScoreCommand = function(self, params)
            self:settextf("%d", getRescoredJudge(offsets, params.judgeSetting, 4))
        end,
    },

    LoadFont("pattern_num") .. {
        InitCommand = function(self)
            self:xy(SCREEN_CENTER_X - 320, SCREEN_CENTER_Y + 164)
            self:settextf("%d", score:GetTapNoteScore('TapNoteScore_W5')):zoom(0.5)
        end,
        UpdateScoreCommand = function(self, params)
            self:settextf("%d", getRescoredJudge(offsets, params.judgeSetting, 5))
        end,
    },

    LoadFont("pattern_num") .. {
        InitCommand = function(self)
            self:xy(SCREEN_CENTER_X - 320, SCREEN_CENTER_Y + 180)
            self:settextf("%d", score:GetTapNoteScore('TapNoteScore_Miss')):zoom(0.5)
        end,
    },

    LoadFont("pattern_num") .. {
        InitCommand = function(self)
            self:xy(SCREEN_CENTER_X - 310, SCREEN_CENTER_Y + 194)
            self:settextf("%d", pss:MaxCombo()):zoom(0.5)
        end,
    },

    LoadFont("pattern_num") .. {
        InitCommand = function(self)
            self:xy(SCREEN_CENTER_X + 60, SCREEN_BOTTOM - 20)
            self:settextf("%d", steps:GetRadarValues():GetValue("RadarCategory_Notes")):zoom(0.5)
        end,
    },

    LoadFont("handel/handel 24px") .. {
        InitCommand = function(self)
            self:xy(SCREEN_CENTER_X - 25, SCREEN_BOTTOM - 20)
            self:settextf("%s %d", difficulty[steps:GetDifficulty()], steps:GetMeter()):zoom(0.4)
        end,
    },
}

-- older score stats

if older_pb ~= nil then
    t[#t + 1] = Def.ActorFrame {
        LoadFont("handel/handel 24px") .. {
            InitCommand = function(self)
                self:xy(SCREEN_CENTER_X - 310, SCREEN_CENTER_Y - 66)
                self:settext(clear[older_pb:GetWifeGrade()]):zoom(0.5)
            end,
        },
        LoadFont("handel/handel 24px") .. {
            InitCommand = function(self)
                self:xy(SCREEN_CENTER_X - 310, SCREEN_CENTER_Y - 44)
                self:settext(THEME:GetString("Grade", older_pb:GetWifeGrade())):zoom(0.5)
            end
        },
        LoadFont("pattern_num") .. {
            InitCommand = function(self)
                self:xy(SCREEN_CENTER_X - 310, SCREEN_CENTER_Y - 14.5)
                self:settextf("%.2f", older_pb:GetSkillsetSSR("Overall")):zoom(0.45)
            end
        },
        LoadFont("pattern_num") .. {
            InitCommand = function(self)
                self:xy(SCREEN_CENTER_X - 310, SCREEN_CENTER_Y - 5)
                self:settextf("%.2f%%", older_pb:GetWifeScore() * 100):zoom(0.3)
            end
        },
        LoadFont("pattern_num") .. {
            InitCommand = function(self)
                local cb_count = older_pb:GetTapNoteScore('TapNoteScore_W4') +
                    older_pb:GetTapNoteScore('TapNoteScore_W5') +
                    older_pb:GetTapNoteScore('TapNoteScore_Miss')

                self:xy(SCREEN_CENTER_X - 310, SCREEN_CENTER_Y + 24)
                self:settextf("%d", cb_count):zoom(0.5)
            end
        },

        LoadFont("pattern_num") .. {
            InitCommand = function(self)
                self:xy(SCREEN_CENTER_X - 310, SCREEN_CENTER_Y + 56)
                self:settextf("%.2f%%", target):zoom(0.5)
            end
        },

        LoadFont("pattern_num") .. {
            InitCommand = function(self)
                self:xy(SCREEN_CENTER_X - 310, SCREEN_CENTER_Y + 72)
                self:settextf(get_signed(older_pb:GetWifeScore() * 100 - target, true) .. "%%"):zoom(0.3)
            end
        },

        LoadFont("pattern_num") .. {
            InitCommand = function(self)
                self:xy(SCREEN_CENTER_X - 250, SCREEN_CENTER_Y + 101)
                self:settextf(
                    get_signed(pss:GetTapNoteScores('TapNoteScore_W1') - older_pb:GetTapNoteScore('TapNoteScore_W1'),
                        false)):zoom(0.5)
            end
        },

        LoadFont("pattern_num") .. {
            InitCommand = function(self)
                self:xy(SCREEN_CENTER_X - 250, SCREEN_CENTER_Y + 118)
                self:settextf(get_signed(
                    pss:GetTapNoteScores('TapNoteScore_W2') - older_pb:GetTapNoteScore('TapNoteScore_W2'),
                    false)):zoom(0.5)
            end
        },

        LoadFont("pattern_num") .. {
            InitCommand = function(self)
                self:xy(SCREEN_CENTER_X - 250, SCREEN_CENTER_Y + 133)
                self:settextf(get_signed(
                    pss:GetTapNoteScores('TapNoteScore_W3') - older_pb:GetTapNoteScore('TapNoteScore_W3'),
                    false)):zoom(0.5)
            end
        },

        LoadFont("pattern_num") .. {
            InitCommand = function(self)
                self:xy(SCREEN_CENTER_X - 250, SCREEN_CENTER_Y + 149)
                self:settextf(get_signed(
                    pss:GetTapNoteScores('TapNoteScore_W4') - older_pb:GetTapNoteScore('TapNoteScore_W4'),
                    false)):zoom(0.5)
            end
        },

        LoadFont("pattern_num") .. {
            InitCommand = function(self)
                self:xy(SCREEN_CENTER_X - 250, SCREEN_CENTER_Y + 164)
                self:settextf(get_signed(
                    pss:GetTapNoteScores('TapNoteScore_W5') - older_pb:GetTapNoteScore('TapNoteScore_W5'),
                    false)):zoom(0.5)
            end
        },

        LoadFont("pattern_num") .. {
            InitCommand = function(self)
                self:xy(SCREEN_CENTER_X - 250, SCREEN_CENTER_Y + 180)
                self:settextf(get_signed(
                    pss:GetTapNoteScores('TapNoteScore_Miss') - older_pb:GetTapNoteScore('TapNoteScore_Miss'),
                    false)):zoom(0.5)
            end
        },
    }
end

return t
