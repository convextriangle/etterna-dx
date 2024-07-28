local t = Def.ActorFrame {
	InitCommand=function(self)
		self:fov(120)
	end,
	LoadActor("a.txt")..{
		OnCommand=function(self)
			self:x(320):y(240):addx(0):linear(.8):zoom(100):rotationy(-40):rotationx(-25):addz(5)
		end;
	};
	LoadActor("b.txt")..{
		OnCommand=function(self)
			self:x(320):y(240):addx(0):linear(.8):zoom(100):rotationy(-40):rotationx(-25):addz(5)
		end;
	};
};
return t;