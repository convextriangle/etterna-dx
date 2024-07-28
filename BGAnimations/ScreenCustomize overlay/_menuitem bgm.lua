local t = Def.ActorFrame{
	LoadActor("menuitem bgm")..{
	};
	Def.Sprite{
		InitCommand=function(self)
			self:cropbottom(.5):x(-106):y(5):zoom(1)
		end;
		BeginCommand=function(self)
			self:Load(THEME:GetPathB("ScreenCustomize","overlay/_bgm_"..GetUserPref("IIDX15BGM")));
		end;
		IIDX15BGMChangedMessageCommand=function(self,param)
			self:Load(THEME:GetPathB("ScreenCustomize","overlay/_bgm_"..param.NewIIDX15BGM));
		end;
	};
};

return t;