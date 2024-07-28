local t = Def.ActorFrame {
	LoadActor( "_Fullcombolight01" ) .. {
		InitCommand=function(self)
			self:spin():effectmagnitude(0,0,150)
		end;
	};
	LoadActor( "_Fullcombolight02" ) .. {
		InitCommand=function(self)
			self:spin():effectmagnitude(0,0,-150)
		end;
	};
};
return t;