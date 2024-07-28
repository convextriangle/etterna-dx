return Def.ActorFrame {
	LoadActor("_MusicWheel highlight_normal.png")..{
	InitCommand=function(self)
		self:blend('BlendMode_Add'):visible(true)
	end;
	};
	
}