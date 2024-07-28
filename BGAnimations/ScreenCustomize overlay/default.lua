local t = Def.ActorFrame{
	LoadActor("_config.lua")..{
		InitCommand=function(self)
			self:zoomx(SCREEN_WIDTH/640)
		end;
	};
	LoadActor(THEME:GetPathG("","_shared header"))..{};
	
	LoadActor("CUSTOM.png")..{
		InitCommand=function(self)
			self:x(WideScale(SCREEN_CENTER_X-245,SCREEN_CENTER_X-345)):y(SCREEN_CENTER_Y-214)
		end;
		OnCommand=function(self)
			self:addx(-10):diffusealpha(0):sleep(0.5):linear(0.3):addx(10):diffusealpha(1)
		end;
	};
};
return t;