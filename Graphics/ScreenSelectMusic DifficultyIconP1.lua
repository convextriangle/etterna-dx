-- player 1
local DifficultyToFrame = {
	Difficulty_Beginner	 = 0,
	Difficulty_Easy		 = 1,
	Difficulty_Medium	 = 2,
	Difficulty_Hard		 = 3,
	Difficulty_Challenge = 4,
	Difficulty_Edit		 = 5,
};
return LoadActor("_difficulty")..{
	InitCommand=function(self)
		self:animate(false):setstate(0)
	end;
	BeginCommand=function(self)
		self:player(PLAYER_1)
	end;
	SetCommand=function(self)
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
	CurrentStepsP1ChangedMessageCommand=function(self)
		self:playcommand("Set")
	end;
	CurrentTrailP1ChangedMessageCommand=function(self)
		self:playcommand("Set")
	end;
	CurrentSongChangedChangedMessageCommand=function(self)
		self:playcommand("Set")
	end;
};