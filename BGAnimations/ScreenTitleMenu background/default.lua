local t = Def.ActorFrame {
	-- [Layer1]
	LoadFont("01/01 48px") .. {
		InitCommand = function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
			self:settextf("Etterna...")
		end,
	}
};
return t
