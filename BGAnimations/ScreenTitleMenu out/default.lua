local t = Def.ActorFrame{
	Def.Actor{
		OnCommand=function(self)
			self:sleep(3.5)
		end;
	};
	-- [Layer1]
	Def.Quad{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y):zoomtowidth(SCREEN_WIDTH):zoomtoheight(SCREEN_HEIGHT):diffuse(color("#000000"))
		end;
		OnCommand=function(self)
			self:diffusealpha(1)
		end;
	};
	-- [Layer5]
	LoadActor("TITLE_BG1")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y+10):texcoordvelocity(.2,0)
		end;
		OnCommand=function(self)
			self:zoom(2):linear(0.35):zoom(1):linear(0.1):zoomx(100):zoomy(0.02):sleep(0.4):zoomy(0.2):sleep(0.2):zoomy(0.1)
		end;
	};
	-- [Layer6]
	LoadActor("TITLE_BG2")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y+10):texcoordvelocity(-.2,0)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):zoom(2):linear(0.35):zoom(1):linear(0.1):zoomx(100):zoomy(0.02):sleep(0.6):zoomy(0.2):sleep(0.2):zoomy(0.1)
		end;
	};
	-- [Layer7]
	LoadActor("TITLE_BG4")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y+10):texcoordvelocity(-.2,0)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):zoom(2):linear(0.35):zoom(1):linear(0.1):zoomx(100):zoomy(0.02)
		end;
	};
	-- [Layer8]
	LoadActor("TITLE_BG3")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y+10):texcoordvelocity(.22,0)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):zoom(2):linear(0.35):zoom(1):linear(0.1):zoomx(100):zoomy(0.02):y(250)
		end;
	};
	-- [Layer9]
	LoadActor("TITLE_BG1")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y):texcoordvelocity(.2,0)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):zoom(2):linear(0.35):zoom(1):linear(0.1):zoomx(100):zoomy(0.05):diffusealpha(0)
		end;
	};
	-- [Layer15]
	LoadActor("SITE")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):zoom(0.5):linear(0.3):zoom(1):linear(0.2):zoom(1.6):diffusealpha(0)
		end;
	};
	-- [Layer16]
	LoadActor("SITE")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):zoom(0.5):linear(0.3):zoom(1):linear(0.2):zoom(1.6):diffusealpha(0)
		end;
	};
	-- [Layer20]
	LoadActor("START_TXT")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y-3)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):addx(-20):diffusealpha(0):sleep(0.7):linear(0.2):addx(20):diffusealpha(1)
		end;
	};
	-- [Layer21]
	LoadActor("FONT_YAJI")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y+23)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):addy(-10):diffusealpha(0):sleep(0.7):linear(0.2):addy(10):diffusealpha(1)
		end;
	};
	-- [Layer22]
	LoadActor("WELCOME")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y+44)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):addy(-10):diffusealpha(0):sleep(0.8):linear(0.2):addy(10):diffusealpha(1)
		end;
	};
	-- [Layer30]
	Def.Quad{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y):zoomtowidth(SCREEN_WIDTH):zoomtoheight(SCREEN_HEIGHT):diffuse(color("#ffffff"))
		end;
		OnCommand=function(self)
			self:linear(0.4):diffusealpha(0)
		end;
	};
	-- [Layer31]
	Def.Quad{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y):zoomtowidth(SCREEN_WIDTH):zoomtoheight(SCREEN_HEIGHT):diffuse(color("#000000"))
		end;
		OnCommand=function(self)
			self:diffusealpha(0):sleep(2.2):linear(0.4):diffusealpha(1)
		end;
	};
};

return t;