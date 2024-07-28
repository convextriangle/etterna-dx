return Def.ActorFrame {
	LoadActor("1.png")..{
	InitCommand=function(self)
		self:visible(true)
	end;
	};
	--[[LoadActor("course_wheel.png")..{
	InitCommand=function(self)
		self:visible(true):addx(-16)
	end;
	};]]
}
