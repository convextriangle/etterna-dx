local t = Def.ActorFrame{
	LoadActor("BG_FRAME_TOP")..{
	InitCommand=function(self)
		self:vertalign(top):x(320):y(SCREEN_TOP)
	end;
	OnCommand=function(self)
		self:addy(-60):diffusealpha(0):linear(.25):addy(60):diffusealpha(1)
	end;
	};
	LoadActor("BG_FRAME_DOWN")..{
	InitCommand=function(self)
		self:vertalign(bottom):x(320):y(SCREEN_BOTTOM + 10)
	end;
	OnCommand=function(self)
		self:addy(60):diffusealpha(0):linear(.25):addy(-60):diffusealpha(1)
	end;
	};
	LoadActor("grade frame p1")..{
	InitCommand=function(self)
		self:horizalign(left):vertalign(top):x(-3):y(18)
	end;
	OnCommand=function(self)
		self:rotationz(-90):diffusealpha(0):linear(.25):rotationz(0):diffusealpha(0.9)
	end;
	};
	LoadActor("GRA_ITA.png")..{
	InitCommand=function(self)
		self:x(137):y(111):diffusealpha(.5):zoomy(0):sleep(.3):linear(.25):zoomy(1)
	end;
	};
	LoadActor("p1 score report.png")..{
	InitCommand=function(self)
		self:x(108):y(15):addx(-20):diffusealpha(0):linear(0.2):addx(20):diffusealpha(1)
	end;
	};
	LoadActor("difficulty.png")..{
	InitCommand=function(self)
		self:visible(GAMESTATE:IsPlayerEnabled(PLAYER_1)):x(70):y(206):addx(-20):diffusealpha(0):linear(0.2):addx(20):diffusealpha(1)
	end;
	};
	LoadActor("difficulty_icon.lua")..{
	};
};

return t;
