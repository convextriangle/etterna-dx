local t = Def.ActorFrame{
	LoadActor("menuitem turntable")..{
	};
	Def.Sprite{
		InitCommand=function(self)
			self:cropbottom(.26):x(-121):y(7):zoom(.88)
		end;
		BeginCommand=function(self)
			self:Load(THEME:GetPathB("ScreenCustomize","overlay/"..GetUserPref("IIDX15Turntable")));
		end;
		IIDX15TurntableChangedMessageCommand=function(self,param)
			self:Load(THEME:GetPathB("ScreenCustomize","overlay/"..param.NewIIDX15Turntable));
		end;
	};
};

return t;