local t = Def.ActorFrame{
	LoadActor("1.lua")..{
	InitCommand=function(self)
		self:x(320):y(SCREEN_CENTER_Y)
	end;
	Condition=Second() <= 10;
	};
	LoadActor("2.lua")..{
	InitCommand=function(self)
		self:x(320):y(SCREEN_CENTER_Y)
	end;
	Condition=Second() > 10 and Second() <=20;
	};
	LoadActor("3.lua")..{
	InitCommand=function(self)
		self:x(320):y(SCREEN_CENTER_Y)
	end;
	Condition=Second() > 20 and Second() <=30;
	};
	LoadActor("4.lua")..{
	InitCommand=function(self)
		self:x(320):y(SCREEN_CENTER_Y)
	end;
	Condition=Second() > 30 and Second() <=40;
	};
	LoadActor("5.lua")..{
	InitCommand=function(self)
		self:x(320):y(SCREEN_CENTER_Y)
	end;
	Condition=Second() > 40 and Second() <=50;
	};
	LoadActor("6.lua")..{
	InitCommand=function(self)
		self:x(320):y(SCREEN_CENTER_Y)
	end;
	Condition=Second() > 50 and Second() <=60;
	};
};

return t;