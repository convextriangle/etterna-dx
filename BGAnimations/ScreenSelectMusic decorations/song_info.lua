local t = Def.ActorFrame {}

-- from bare-frames
-- Controls the song info relevant children of the ScreenSelectMusic decorations actorframe

local meter
local steps
local song

-- functionally make skillset rating text to save space
local function makeSSes()
    local ss = Def.ActorFrame {}
    ss[#ss+1] = LoadFont("artist 16px") .. {
            InitCommand = function(self)
                self:zoom(0.6)
                self:halign(0)
            end,
            SetStuffCommand = function(self)
                if not steps or not meter then
                    self:settextf("Overall: ------")
                else 
                    self:settextf("Overall: %5.2f", meter)
                end
            end
    };

    return ss;
end

-- MSD display
t[#t+1] = Def.ActorFrame {
    InitCommand = function(self)
        self:x(SCREEN_CENTER_X-260)
        self:y(SCREEN_CENTER_Y+80)
    end,
    CurrentStepsChangedMessageCommand = function(self)
        steps = GAMESTATE:GetCurrentSteps()
        song = GAMESTATE:GetCurrentSong()
        if steps then
            -- displaying only overall MSD
            meter = steps:GetMSD(getCurRateValue(), 1);
        end
        self:playcommand("SetStuff")
    end,

    makeSSes() .. {
        InitCommand = function(self)
            self:y(10)
        end
    }

}

-- Rate text
t[#t+1] = LoadFont("artist 16px") .. {
	Name="RateDisplay",
	InitCommand = function(self)
		self:x(SCREEN_CENTER_X-230)
        self:y(SCREEN_CENTER_Y+110)

		self:zoom(0.45)
		self:maxwidth(capWideScale(get43size(340),340)/0.45)
        self:settext("1.0xMusic")
	end,
	SetCommand = function(self)
		self:settext(getCurRateDisplayString())
	end,
	CurrentRateChangedMessageCommand = function(self) self:playcommand("Set") end
}

return t
