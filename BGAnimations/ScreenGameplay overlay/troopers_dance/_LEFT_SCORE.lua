return Def.ActorFrame{
	LoadActor("LEFT_SCORE.png")..{
	InitCommand=function(self)
		self:x(0):y(0)
	end;
	};
	LoadFont("ScoreDisplayNormal Text")..{
	InitCommand=function(self)
		self:x(10):y(50):horizalign(right)
	end;
	Text="     0";
		JudgmentMessageCommand=function(self,params)
			local stats = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1)
			local score = stats:GetScore();
			self:settext(string.format("%6d",score))
	end;
	};
}