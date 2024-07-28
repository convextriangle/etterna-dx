
local t = Def.ActorFrame{};

local IsUsingSoloSingles = PREFSMAN:GetPreference('Center1Player');
local NumPlayers = GAMESTATE:GetNumPlayersEnabled();
local NumSides = GAMESTATE:GetNumSidesJoined();

local pStats = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1);

t[#t+1] = LoadActor("_fullcombo") .. {	
	OffCommand=function(self)
		if pStats:FullCombo() then
			self:visible(true);
		else
			self:visible(false);
		end;
	end;
};

return t;