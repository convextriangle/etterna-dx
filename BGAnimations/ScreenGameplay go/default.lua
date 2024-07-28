return Def.ActorFrame{
	LoadActor("_ddr")..{
	InitCommand=function(self)
		self:visible(GAMESTATE:GetCurrentGame():GetName() ~= "beat")
	end;
	};
	LoadActor("_iidx")..{
	InitCommand=function(self)
		self:visible(GAMESTATE:GetCurrentGame():GetName() == "beat"):zoomx(SCREEN_WIDTH/640)
	end;
	};
}