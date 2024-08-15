return Def.ActorFrame {
	LoadFont("system") .. {
		InitCommand = function(self)
			self:zoom(1):horizalign(left)
		end,
		OnCommand = function(self)
			self:settext("VERSION: " .. ProductID() .. " " .. ProductVersion())
		end,
	},
	LoadFont("system") .. {
		InitCommand = function(self)
			self:zoom(1):horizalign(left):addy(12)
		end,
		OnCommand = function(self)
			self:settext("ORIGINAL THEME by DJ.TONY and @Aoi_psy")
		end,
	},
};
