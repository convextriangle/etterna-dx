-- Controls the title menu choices

local gc = Var("GameCommand");
return Def.ActorFrame {
	Def.BitmapText { File = "choices.ini" }..{
		Name="Main";
		Text=gc:GetText();
		InitCommand=function(self)
			self:y(60)--:diffuseblink():effectperiod(0.5):effectcolor1(color("1,1,1,1")):effectcolor2(color("1,1,1,0"))
		end;
		GainFocusCommand=function(self)
			self:stoptweening():diffusealpha(1)
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():diffusealpha(0)
		end;
	};
};