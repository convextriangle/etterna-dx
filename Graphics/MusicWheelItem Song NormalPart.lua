return Def.ActorFrame {
	LoadActor("1.png") .. {
		InitCommand = function(self)
			self:visible(true)
		end,
	},
}
