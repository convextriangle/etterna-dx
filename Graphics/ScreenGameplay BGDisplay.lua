local t = LoadFallbackB();

t[#t+1] = Def.ActorFrame{
	Def.Quad{
		InitCommand=function(self)
			self:x(320):y(240)
		end;
		OnCommand=function(self,param)
			SCREENMAN:GetTopScreen():GetChild("SongBackground"):zoomto(.7,1)
		end;
	};
};

return t;