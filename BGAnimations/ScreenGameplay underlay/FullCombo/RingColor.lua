local t = Def.ActorFrame {
	LoadActor( "_Fullcombo01" ) .. {
		InitCommand=function(self)
			self:spin():effectmagnitude(0,0,150)
		end;
	};
	LoadActor( "_Fullcombo02" ) .. {
		InitCommand=function(self)
			self:spin():effectmagnitude(0,0,-150)
		end;
	};
};
return t;