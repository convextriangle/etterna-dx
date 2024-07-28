-- Manages song background changes

local brightness = 0.3
t = Def.ActorFrame {
	-- older bg thingies
	--[[LoadActor("bg.lua")..{
		InitCommand=function(self)
			self:zoomx(SCREEN_WIDTH/640)
		end;
	};]]

	-- from Til' Death
	Def.Sprite {
		CurrentSongChangedMessageCommand = function(self)
			self:finishtweening():smooth(0.5):diffusealpha(0):sleep(0.2):queuecommand("ModifySongBackground")
		end,
		ModifySongBackgroundCommand = function(self)
			self:finishtweening()
			if GAMESTATE:GetCurrentSong() and GAMESTATE:GetCurrentSong():GetBackgroundPath() then
				self:finishtweening()
				self:visible(true)
				self:LoadBackground(GAMESTATE:GetCurrentSong():GetBackgroundPath())
				self:scaletocover(0, 0, SCREEN_WIDTH, SCREEN_BOTTOM)
				self:sleep(0.25)
				self:smooth(0.5)
				self:diffusealpha(brightness)
			else
				self:visible(false)
			end
		end,
		OffCommand = function(self)
			self:smooth(0.5):diffusealpha(0)
		end,
		BGOffMessageCommand = function(self)
			self:finishtweening()
			self:visible(false)
		end
	};
};

return t;
