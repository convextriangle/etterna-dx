local t = Def.ActorFrame {
	InitCommand=function(self)
		self:fov(120):addy(100)
	end,
	LoadActor("box.txt")..{
		OnCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y-100):zoom(400):rotationy(60):rotationx(55):addz(140)
		end;
	};
	LoadActor("gate.txt")..{
		OnCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y-150):zoom(400):rotationy(60):rotationx(55):addz(-80)
		end;
	};
};
return t;