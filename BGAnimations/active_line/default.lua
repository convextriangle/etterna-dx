return Def.ActorFrame {
	LoadActor("song")..{
	InitCommand=function(self)
		self:visible(true)
	end;
	};
	
}