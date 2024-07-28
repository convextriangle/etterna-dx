return Def.ActorFrame{
	LoadActor("BANNER.png")..{
	InitCommand=function(self)
		self:x(0):y(0)
	end;
	};
	Def.Sprite{
	InitCommand=function(self)
		self:x(0):y(0)
	end;
	BeginCommand=function(self)
		local song = GAMESTATE:GetCurrentSong()
		if song then
			local bnpath = song:GetBannerPath()
			if not bnpath then
				bnpath = THEME:GetPathG("Common", "fallback banner")
			end
			self:LoadBackground(bnpath)
		end
		self:zoomtowidth(128)
		self:zoomtoheight(40)
		end;
	};
}