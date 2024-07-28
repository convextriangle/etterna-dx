return Def.ActorFrame {
	LoadActor("_highlight.png") .. {
		InitCommand = function(self)
			self:blend('BlendMode_Add'):visible(true)
			self:zoomx(320 / 800)
			self:zoomy(40 / 86)
			self:addx(8)
		end,
	},

}
