return Def.ActorFrame{
	LoadActor("SCORE_P1.png")..{
	InitCommand=function(self)
		self:horizalign(left):vertalign(bottom):x(SCREEN_LEFT):y(SCREEN_BOTTOM)
	end;
	};
	Def.BitmapText { File = "NUMBERS.ini" }..{
	InitCommand=function(self)
		self:horizalign(right):vertalign(bottom):x(SCREEN_LEFT+142):y(SCREEN_BOTTOM+50)
	end;
	Text="     0";
		JudgmentMessageCommand=function(self,params)
			local stats = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1)
			local score = stats:GetScore();
			self:settext(string.format("%6d",score))
	end;
	};
	Def.BitmapText { File = "NUMBERS.ini" }..{
	InitCommand=function(self)
		self:horizalign(right):vertalign(bottom):x(SCREEN_LEFT+142):y(SCREEN_BOTTOM+66)
	end;
	Text="   0";
		JudgmentMessageCommand=function(self,params)
			local stats = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1)
			local maxCombo = stats:MaxCombo();
			self:settext(string.format("%4d",maxCombo + 1))
	end;
	};
}