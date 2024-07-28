local t = Def.ActorFrame {
	LoadActor("model")..{
	};
	LoadActor("bg.lua")..{
		InitCommand=function(self)
			self:zoomx(SCREEN_WIDTH/640)
		end;
	};
};
return t;