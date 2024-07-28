return Def.ActorFrame {
	--P2
	LoadActor("graph/BGEASY.png")..{
	InitCommand=function(self)
		self:zoomtowidth(1):zoomtoheight(1):visible((GAMESTATE:GetCurrentSteps(PLAYER_2):GetDifficulty() == 'Difficulty_Beginner'))
	end;
	};
	LoadActor("graph/BGEASY.png")..{
	InitCommand=function(self)
		self:zoomtowidth(1):zoomtoheight(1):visible((GAMESTATE:GetCurrentSteps(PLAYER_2):GetDifficulty() == 'Difficulty_Easy'))
	end;
	};
	LoadActor("graph/BGNORMAL.png")..{
	InitCommand=function(self)
		self:zoomtowidth(1):zoomtoheight(1):visible((GAMESTATE:GetCurrentSteps(PLAYER_2):GetDifficulty() == 'Difficulty_Medium'))
	end;
	};
	LoadActor("graph/BGHARD.png")..{
	InitCommand=function(self)
		self:zoomtowidth(1):zoomtoheight(1):visible((GAMESTATE:GetCurrentSteps(PLAYER_2):GetDifficulty() == 'Difficulty_Hard'))
	end;
	};
	LoadActor("graph/BGHARD.png")..{
	InitCommand=function(self)
		self:zoomtowidth(1):zoomtoheight(1):visible((GAMESTATE:GetCurrentSteps(PLAYER_2):GetDifficulty() == 'Difficulty_Challenge'))
	end;
	};
	LoadActor("graph/BGHARD.png")..{
	InitCommand=function(self)
		self:zoomtowidth(1):zoomtoheight(1):visible((GAMESTATE:GetCurrentSteps(PLAYER_2):GetDifficulty() == 'Difficulty_Edit'))
	end;
	};
}