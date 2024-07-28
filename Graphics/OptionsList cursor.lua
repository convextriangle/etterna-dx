return Def.ActorFrame {
	LoadActor("OptionsCursorP1 Left")..{
		InitCommand=function(self)
			self:zoomx(35):x(70):y(-2)
		end;
	};
	LoadActor("OptionsCursorP1 Left")..{
		InitCommand=function(self)
			self:zoomx(-1):x(178):y(-2)
		end;
	};
};