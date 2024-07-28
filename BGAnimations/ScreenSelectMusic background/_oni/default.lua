local t = Def.ActorFrame {
	InitCommand=function(self)
		self:fov(120)
	end,
	LoadActor("../_expert/a.txt")..{
		OnCommand=function(self)
			self:x(320):y(240):addx(20):linear(.8):zoom(100):rotationy(48):rotationx(-25):addz(5):cullmode('CullMode_Back')
		end;
	};
	LoadActor("../_expert/b.txt")..{
		OnCommand=function(self)
			self:x(320):y(240):addx(20):linear(.8):zoom(100):rotationy(48):rotationx(-25):addz(5):cullmode('CullMode_Back')
		end;
	};
};
return t;