

local t = Def.ActorFrame{
	Def.Quad{
		InitCommand=function(self)
			self:FullScreen():diffuse(color("0,0,0,0"))
		end;
		OnCommand=function(self)
			self:sleep(3):linear(1):diffusealpha(1)
		end;
	};
};

return t;