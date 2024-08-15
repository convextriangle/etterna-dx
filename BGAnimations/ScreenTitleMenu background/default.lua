local t = Def.ActorFrame {
	Def.Sprite {
		InitCommand = function(self)
			self:LoadBackground(THEME:GetPathG("", "_selectbg.mp4"))
			self:scaletocover(0, 0, SCREEN_WIDTH, SCREEN_BOTTOM)
			self:sleep(0.25)
			self:smooth(0.5)
			self:diffusealpha(1)
		end
	},

	-- [Layer1]
	LoadFont("01/01 48px") .. {
		InitCommand = function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
			self:settextf("Etterna...")
		end,
	}
};
return t
