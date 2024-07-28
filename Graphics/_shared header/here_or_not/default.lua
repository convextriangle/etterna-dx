local t = Def.ActorFrame {
	LoadActor("not-here1")..{
		InitCommand=function(self)
			self:x(WideScale(SCREEN_CENTER_X-197,SCREEN_CENTER_X-297)):y(SCREEN_CENTER_Y+188)
		end;
		OnCommand=function(self)
			self:addx(-300):linear(0.25):addx(300)
		end;
	};
	LoadActor("not-here2")..{
		InitCommand=function(self)
			self:x(WideScale(SCREEN_CENTER_X+197,SCREEN_CENTER_X+297)):y(SCREEN_CENTER_Y+188)
		end;
		OnCommand=function(self)
			self:addx(300):linear(0.25):addx(-300)
		end;
	};
	LoadActor("here1.png")..{
		InitCommand=function(self)
			self:x(WideScale(SCREEN_CENTER_X-197,SCREEN_CENTER_X-297)):y(SCREEN_CENTER_Y+188)
		end;
		OnCommand=function(self)
			self:addx(-300):linear(0.25):addx(300)
		end;
		Condition=GAMESTATE:IsSideJoined(PLAYER_1);
	};
	LoadActor("here2.png")..{
		InitCommand=function(self)
			self:x(WideScale(SCREEN_CENTER_X+197,SCREEN_CENTER_X+297)):y(SCREEN_CENTER_Y+188)
		end;
		OnCommand=function(self)
			self:addx(300):linear(0.25):addx(-300)
		end;
		Condition=GAMESTATE:IsSideJoined(PLAYER_2);
	};
};

return t;