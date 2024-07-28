local t = Def.ActorFrame{
	LoadActor("warning.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y):zoomtowidth(SCREEN_WIDTH):zoomtoheight(SCREEN_HEIGHT)
		end;
		OnCommand=function(self)
			self:diffusealpha(1):sleep(3.2):linear(0.6):diffusealpha(0)
		end;
	};
	LoadActor("konami")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y):zoomtowidth(SCREEN_WIDTH):zoomtoheight(SCREEN_HEIGHT)
		end;
		OnCommand=function(self)
			self:diffusealpha(0):sleep(4.2):decelerate(0.6):diffusealpha(1):sleep(5.2):accelerate(0.6):diffusealpha(0)
		end;
	};
	LoadActor("bemani")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y):zoomtowidth(SCREEN_WIDTH):zoomtoheight(SCREEN_HEIGHT)
		end;
		OnCommand=function(self)
			self:diffusealpha(0):sleep(10.6):decelerate(0.6):diffusealpha(1):sleep(5.2):accelerate(0.6):diffusealpha(0)
		end;
	};
};

return t;