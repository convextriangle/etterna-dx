-- Player2 health bar just for show

local t = Def.ActorFrame{
	LoadActor("LIFE_P2")..{
		InitCommand=function(self)
			self:x(0):y(0)
		end;
	};
	LoadActor("2dx")..{
		InitCommand=function(self)
			self:rotationz(180):diffuse(.3,.3,.3,1):x(8):y(-2)
		end;
	};
};

return t;
