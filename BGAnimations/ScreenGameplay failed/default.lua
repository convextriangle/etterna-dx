local t = Def.ActorFrame {
	Def.Sprite {
		InitCommand = function(self)
			self:LoadBackground(THEME:GetPathG("", "_failed.mp4"))
			self:scaletocover(0, 0, SCREEN_WIDTH, SCREEN_BOTTOM)
			self:sleep(2)
			self:smooth(0.5)
			self:diffusealpha(1)
		end
	}
};

return t;
