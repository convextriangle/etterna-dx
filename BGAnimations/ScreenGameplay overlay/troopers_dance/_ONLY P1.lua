return Def.ActorFrame{
	LoadActor("_LEFT_SCORE.lua")..{
	InitCommand=function(self)
		self:x(135):y(448)
	end;
	OnCommand=function(self)
		self:addx(-260):sleep(.05):linear(.25):addx(260):linear(.05):addy(2):linear(.05):addy(-2)
	end;
	};
	LoadActor("_RIGHT_MAXCOMBO.lua")..{
	InitCommand=function(self)
		self:x(505):y(448)
	end;
	OnCommand=function(self)
		self:addx(260):sleep(.05):linear(.25):addx(-260):linear(.05):addy(2):linear(.05):addy(-2)
	end;
	};
}