return Def.ActorFrame {
	LoadFont("system")..{
		InitCommand=function(self)
			self:x(320):y(340)
		end;
		CurrentStepsP1ChangedMessageCommand=function(self)
			self:finishtweening():playcommand("Set")
		end,
		SetCommand=function(self)
			local steps = GAMESTATE:GetCurrentSteps(PLAYER_1):GetRadarValues(PLAYER_1)
			local TapsAndHolds = steps:GetValue('RadarCategory_TapsAndHolds')
			self:settext(TapsAndHolds)
		end
	},
	LoadFont("system")..{
		InitCommand=function(self)
			self:x(320):y(350)
		end;
		CurrentStepsP1ChangedMessageCommand=function(self)
			self:finishtweening():playcommand("Set")
		end,
		SetCommand=function(self)
			local steps = GAMESTATE:GetCurrentSteps(PLAYER_1):GetRadarValues(PLAYER_1)
			local Jumps = steps:GetValue('RadarCategory_Jumps')
			self:settext(Jumps)
		end
	},
	LoadFont("system")..{
		InitCommand=function(self)
			self:x(320):y(360)
		end;
		CurrentStepsP1ChangedMessageCommand=function(self)
			self:finishtweening():playcommand("Set")
		end,
		SetCommand=function(self)
			local steps = GAMESTATE:GetCurrentSteps(PLAYER_1):GetRadarValues(PLAYER_1)
			local Hands = steps:GetValue('RadarCategory_Hands')
			self:settext(Hands)
		end
	},
	LoadFont("system")..{
		InitCommand=function(self)
			self:x(320):y(370)
		end;
		CurrentStepsP1ChangedMessageCommand=function(self)
			self:finishtweening():playcommand("Set")
		end,
		SetCommand=function(self)
			local steps = GAMESTATE:GetCurrentSteps(PLAYER_1):GetRadarValues(PLAYER_1)
			local Holds = steps:GetValue('RadarCategory_Holds')
			self:settext(Holds)
		end
	},
	LoadFont("system")..{
		InitCommand=function(self)
			self:x(320):y(390)
		end;
		CurrentStepsP1ChangedMessageCommand=function(self)
			self:finishtweening():playcommand("Set")
		end,
		SetCommand=function(self)
			local steps = GAMESTATE:GetCurrentSteps(PLAYER_1):GetRadarValues(PLAYER_1)
			local TapsAndHolds = steps:GetValue('RadarCategory_TapsAndHolds')
			local Jumps = steps:GetValue('RadarCategory_Jumps')
			local Hands = steps:GetValue('RadarCategory_Hands')
			local Holds = steps:GetValue('RadarCategory_Holds')
			self:settext(TapsAndHolds + Jumps + Hands + Holds)
		end
	},
}