local t = Def.ActorFrame{
	LoadActor("transition")..{
	InitCommand=function(self)
		self:zoomx(SCREEN_WIDTH/640)
	end;
	};
};

return t;
