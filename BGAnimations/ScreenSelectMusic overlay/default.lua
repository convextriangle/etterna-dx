local t = Def.ActorFrame {}

t[#t+1] = LoadActor("utils")
t[#t+1] = LoadActor("bgm")

t[#t+1] = LoadActor(THEME:GetPathG("","_shared header"))..{
}

t[#t+1] = LoadActor("RED_LIGHT.png")..{
	InitCommand=function(self)
		self:x(SCREEN_CENTER_X):y(SCREEN_TOP):vertalign(top)
        self:zoomtowidth(SCREEN_WIDTH):zoomtoheight(SCREEN_HEIGHT)
	end;
	OnCommand=function(self)
		self:diffusealpha(0):playcommand("Animate")
	end;
	AnimateCommand=function(self)
		self:blend('BlendMode_Add'):visible(false):linear(1)
        self:diffusealpha(0):linear(0):diffusealpha(1):queuecommand("Animate")
	end
}

t[#t+1] = LoadActor("MUSIC_T.png")..{
	InitCommand=function(self)
		self:x(WideScale(SCREEN_CENTER_X-245,SCREEN_CENTER_X-345)):y(SCREEN_CENTER_Y-214):visible(true)
	end;
	OnCommand=function(self)
		self:addx(-10):diffusealpha(0):sleep(0.5):linear(0.3):addx(10):diffusealpha(1)
	end;
}


return t
