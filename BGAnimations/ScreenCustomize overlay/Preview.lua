local t = Def.ActorFrame{
	-----------
	-- Frame
	Def.Sprite{
		InitCommand=function(self)
			self:horizalign(left):x(20):y(240):animate(false)
		end;
		BeginCommand=function(self)
			self:Load(THEME:GetPathB("ScreenCustomize","overlay/frame/"..GetUserPref("IIDX15Frame")));
		end;
		IIDX15FrameChangedMessageCommand=function(self,param)
			self:Load(THEME:GetPathB("ScreenCustomize","overlay/frame/"..param.NewIIDX15Frame));
		end;
	};
	-----------
	-- Turntable
	Def.Sprite{
		InitCommand=function(self)
			self:horizalign(left):x(51):y(SCREEN_CENTER_Y+107):animate(true)
		end;
		BeginCommand=function(self)
			self:Load(THEME:GetPathB("ScreenCustomize","overlay/turntable/"..GetUserPref("IIDX15Turntable")));
			self:SetAllStateDelays(0.02)
		end;
		IIDX15TurntableChangedMessageCommand=function(self,param)
			self:Load(THEME:GetPathB("ScreenCustomize","overlay/turntable/"..param.NewIIDX15Turntable));
			self:SetAllStateDelays(0.02)
		end;
	};
	-----------
	-- Explosion
	Def.Sprite{
		InitCommand=function(self)
			self:blend('BlendMode_Add'):x(119):y(SCREEN_CENTER_Y+82):animate(true)
		end;
		BeginCommand=function(self)
			self:Load(THEME:GetPathB("ScreenCustomize","overlay/explosion/"..GetUserPref("IIDX15Explosion")));
			self:SetAllStateDelays(0.03)
		end;
		IIDX15ExplosionChangedMessageCommand=function(self,param)
			self:Load(THEME:GetPathB("ScreenCustomize","overlay/explosion/"..param.NewIIDX15Explosion));
			self:SetAllStateDelays(0.03)
		end;
	};
};

return t;