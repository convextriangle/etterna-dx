-- time multipliers for sleep() and decelerate() functions
local sleep_scale = 0.3
local decel_scale = sleep_scale

return Def.ActorFrame{
	LoadActor("ready.png")..{
	InitCommand=function(self)
		self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
	end;
	OnCommand=function(self)
		self:addy(-50):diffusealpha(0)
        self:decelerate(0.4 * decel_scale):addy(50)
        self:diffusealpha(1):sleep(1.4 * sleep_scale)
        self:decelerate(0.2 * decel_scale):diffusealpha(0)
	end;
	};
	LoadActor("ready.png")..{
	InitCommand=function(self)
		self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y):blend('BlendMode_Add')
	end;
	OnCommand=function(self)
		self:diffusealpha(0):sleep(1.8 * sleep_scale)
        self:diffusealpha(1):decelerate(0.4 * decel_scale)
        self:zoomy(1):zoomx(2)
        self:diffusealpha(0)
	end;
	};
	LoadActor("ready.png")..{
	InitCommand=function(self)
		self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y):blend('BlendMode_Add')
	end;
	OnCommand=function(self)
		self:diffusealpha(0):sleep(1.8 * sleep_scale)
        self:diffusealpha(1):decelerate(0.4 * decel_scale)
        self:zoomy(0.5):zoomx(3)
        self:diffusealpha(0)
	end;
	};
	LoadActor("ready blend.png")..{
	InitCommand=function(self)
		self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y):blend('BlendMode_Add')
	end;
	OnCommand=function(self)
		self:diffusealpha(0):sleep(1.8 * sleep_scale)
        self:diffusealpha(1):decelerate(0.4 * decel_scale)
        self:zoom(1.5):diffusealpha(0)
	end;
	};
}
