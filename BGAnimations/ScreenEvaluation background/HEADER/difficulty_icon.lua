local DifficultyToFrame = {
	Difficulty_Beginner	 = 0,
	Difficulty_Easy		 = 1,
	Difficulty_Medium	 = 2,
	Difficulty_Hard		 = 3,
	Difficulty_Challenge = 4,
	Difficulty_Edit		 = 5,
};
return Def.ActorFrame{
	LoadActor("Difficulty icons 1x6.png")..{
	InitCommand=function(self)
		self:x(154):y(207):animate(false):setstate(0):diffusealpha(0):cropbottom(1):sleep(0.2):linear(0.2):diffusealpha(1):cropbottom(0)
	end;
	Condition=GAMESTATE:IsPlayerEnabled(PLAYER_1);
	BeginCommand=function(self)
		self:player(PLAYER_1)
	end;
	OnCommand=function(self)
		if GAMESTATE:GetCurrentSong() then
			local StepsOrTrail;
			StepsOrTrail = GAMESTATE:GetCurrentSteps(PLAYER_1);
			if StepsOrTrail then
				self:setstate(DifficultyToFrame[StepsOrTrail:GetDifficulty()]);
				self:visible(true)
			else
				self:visible(false)
			end;
		else
			self:visible(false)
		end;
	end;
	};
};
