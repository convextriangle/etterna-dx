return Def.ActorFrame {
	LoadActor("_bar.png") .. {
		InitCommand = function(self)
			self:visible(true)
			self:zoomx(284 / 800)
			self:zoomy(28 / 60)
		end,
	},
}
