return Def.ActorFrame {
		LoadFont("system") .. {
		InitCommand=function(self)
			self:zoom(1):horizalign(left)
		end;
		OnCommand=function(self)
			self:settext("VERSION: " ..ProductID().." "..ProductVersion())
		end;
	};
		LoadFont("system") .. {
		InitCommand=function(self)
			self:zoom(1):horizalign(left):addy(12)
		end;
		OnCommand=function(self)
			self:settext("THEME by DJ.TONY BETA V1.0")
		end;
	};
};