local t = Def.ActorFrame{
	LoadActor("menuitem explosion")..{
	};
	Def.Sprite{
		InitCommand=function(self)
			self:cropbottom(.26):x(-121):y(7):zoom(.88)
		end;
		BeginCommand=function(self)
			self:Load(THEME:GetPathB("ScreenCustomize","overlay/ex"..GetUserPref("IIDX15Explosion")));
		end;
		IIDX15ExplosionChangedMessageCommand=function(self,param)
			self:Load(THEME:GetPathB("ScreenCustomize","overlay/ex"..param.NewIIDX15Explosion));
		end;
	};
};

return t;