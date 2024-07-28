return 	Def.ActorFrame {

	Def.SongMeterDisplay {
		StreamWidth=269;

		Stream=Def.Quad {
			InitCommand=function(self)
				self:diffusealpha(0)
			end;
		};

		Tip=LoadActor("SONG_TIP")..{
			InitCommand=function(self)
				self:blend('BlendMode_Add'):diffuseshift():effectclock('bgm'):effectperiod(2):effectcolor1(1,1,1,1):effectcolor2(1,1,1,.5)
			end;
			OnCommand=function(self)
				self:addx(134):diffusealpha(0):sleep(.4):linear(.2):diffusealpha(1):decelerate(1):addx(-134)
			end;
			OffCommand=function(self)
				self:diffusealpha(1)
			end;
		};
	};

};