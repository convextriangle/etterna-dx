local StageToFrame = {
	Stage_1st		= 0,
	Stage_2nd		= 1,
	Stage_3rd		= 2,
	Stage_4th		= 3,
	Stage_5th		= 4,
	Stage_6th		= 5,
	Stage_Next		= 6,
	Stage_Final		= 7,
	Stage_Extra1	= 8,
	Stage_Extra2	= 9,
	Stage_Nonstop	= 10,
	Stage_Oni		= 11,
	Stage_Endless	= 12,
	Stage_Event		= 13,
	Stage_Demo		= 14,
};
return Def.ActorFrame{
	LoadActor("_stage 1x15.png")..{
	InitCommand=function(self)
		self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y):animate(false):setstate(0):addy(-14):croptop(1):diffusealpha(0):sleep(0):diffusealpha(1):croptop(0):cropbottom(1)
	end;
	AnimateMessageCommand=function(self)
		self:x(192):y(449):sleep(2):linear(.35):addy(-14):croptop(1):diffusealpha(0):sleep(0):diffusealpha(1):croptop(0):cropbottom(1):sleep(.1):addy(28):linear(.35):addy(-14):cropbottom(0):queuecommand("Animate")
	end;
	OnCommand=function(self)
		MESSAGEMAN:Broadcast("Animate")
		self:setstate(StageToFrame["Stage_Event"]);
	end;
	};
};