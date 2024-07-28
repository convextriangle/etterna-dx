local y_fudge = -30

local t = Def.ActorFrame{
	--P1 NUMBERS

    -- shows Perfect, Great, Good, Almost (Bad), Boo (Miss) count
	LoadFont("Evaluation Numbers")..{
	InitCommand=function(self)
		self:horizalign(right):vertalign(top):x(173):y(SCREEN_CENTER_Y+59)
	end;

	OnCommand=function(self,params)
		local stats = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1)
		local w2 = stats:GetTapNoteScores('TapNoteScore_W2');
			str = string.format("%4d\n%4d\n%4d\n%4d\n%4d",
			stats:GetTapNoteScores('TapNoteScore_W2'),
			stats:GetTapNoteScores('TapNoteScore_W3'),
			stats:GetTapNoteScores('TapNoteScore_W4'),
			stats:GetTapNoteScores('TapNoteScore_W5'),
			stats:GetTapNoteScores('TapNoteScore_Miss')
			)
		self:settext(str)
	end;
	};

    -- shows OK (held note) count
	LoadFont("Evaluation Numbers")..{
	InitCommand=function(self)
		self:horizalign(right):vertalign(top):x(173):y(SCREEN_CENTER_Y+174)
	end;
	OnCommand=function(self,params)
		local stats = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1)
			str = string.format("%4d",
			stats:GetHoldNoteScores('HoldNoteScore_Held')
			)
		self:settext(str)
	end;
	};

    -- shows Max Combo and Marvelous count
	LoadFont("Evaluation Numbers")..{
	InitCommand=function(self)
		self:horizalign(left):vertalign(top):x(122):y(SCREEN_CENTER_Y-12)
	end;
	OnCommand=function(self,params)
		local stats = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1)
		local radar = GAMESTATE:GetCurrentSteps(PLAYER_1):GetRadarValues(PLAYER_1)
			str = string.format("\n%4d\n%4d",
			stats:MaxCombo(),
			stats:GetTapNoteScores('TapNoteScore_W1')
			)
		self:settext(str)
	end;
	};
};

return t;
