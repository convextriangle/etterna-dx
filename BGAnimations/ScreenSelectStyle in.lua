local t = Def.ActorFrame {
	LoadActor(THEME:GetPathS("","0Z.ogg"))..{
		OnCommand=function(self)
			self:play()
		end;
	};
};
return t