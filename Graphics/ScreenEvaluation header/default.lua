local t = Def.ActorFrame{
	-- CLEAR --
	LoadActor("_CLEAR")..{
	InitCommand=function(self)
		self:zoomx(SCREEN_WIDTH/640)
	end;
	Condition=STATSMAN:GetBestGrade() < 6;
	};
	-- FAILED --
	LoadActor("_FAILED")..{
	InitCommand=function(self)
		self:zoomx(SCREEN_WIDTH/640)
	end;
	Condition=STATSMAN:GetBestGrade() >= 6;
	};
};

return t;