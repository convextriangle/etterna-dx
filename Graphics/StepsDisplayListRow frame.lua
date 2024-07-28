local CustomDifficultyToState = {
	Beginner = 0,
	Easy = 1,
	Medium = 2,
	Hard = 3,
	Challenge = 4,
	Edit = 5
}

local DifficultyToState = {
	Difficulty_Beginner = 0,
	Difficulty_Easy = 1,
	Difficulty_Medium = 2,
	Difficulty_Hard = 3,
	Difficulty_Challenge = 4,
	Difficulty_Edit = 5,
}

local t = Def.ActorFrame{
	LoadActor(THEME:GetPathG("ScreenSelectMusic", "StepsDisplayList/_1"))..{
		Name="FrameP1";
		InitCommand=function(self)
			self:animate(false)
			self:addx(6):zoom(0.91)
		end;
		SetCommand=function(self,param)
			local curdiff = param.CustomDifficulty;
			local state = CustomDifficultyToState[curdiff] or CustomDifficultyToState["Edit"];
			self:setstate(state);
		end;
	};
};

return t;