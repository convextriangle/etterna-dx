local t = Def.ActorFrame{
	LoadActor("failed")..{
	InitCommand=function(self)
		self:zoomx(SCREEN_WIDTH/640)
	end;
	};
};

return t;