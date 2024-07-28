local t = Def.ActorFrame{
	LoadActor("5.png")..{
	InitCommand=function(self)
		self:zoom(3):linear(0.3):zoom(1)
	end;
	};
	LoadActor("5.png")..{
	InitCommand=function(self)
		self:zoom(3):diffusealpha(0.5):sleep(0.03):linear(0.3):zoom(1):linear(0.1):diffusealpha(0)
	end;
	};
	LoadActor("5.png")..{
	InitCommand=function(self)
		self:zoom(3):diffusealpha(0.5):sleep(0.06):linear(0.3):zoom(1):linear(0.1):diffusealpha(0)
	end;
	};
	LoadActor("5.png")..{
	InitCommand=function(self)
		self:blend('BlendMode_Add'):zoom(3):linear(0.3):zoom(1):linear(0.1):diffusealpha(0)
	end;
	};
};

return t;