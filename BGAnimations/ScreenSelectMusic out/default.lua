local t = Def.ActorFrame {
	LoadActor(THEME:GetPathB("", "STAGE")) .. {
		InitCommand = function(self)
			self:zoomx(SCREEN_WIDTH / 640)
		end,
	},
	LoadActor("decide.ogg") .. {
		OnCommand = function(self)
			self:stop()
		end,
		OffCommand = function(self)
			self:play()
		end,
	},
};

return t;
