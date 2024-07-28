local t = Def.ActorFrame {
	LoadActor(THEME:GetPathG("","grade/D.png"))..{
	InitCommand=function(self)
		self:vertalign(bottom):x(140):y(176)
	end;
	OnCommand=function(self)
		self:zoomy(10):diffusealpha(0):sleep(2.2):linear(0.1):zoomy(1):diffusealpha(1)
	end;
	};
	Def.Sprite {
		Texture="grade/HIBANA 3x4.png";
			Frame0000=0;
			Delay0000=0.01;
			Frame0001=1;
			Delay0001=0.01;
			Frame0002=2;
			Delay0002=0.01;
			Frame0003=3;
			Delay0003=0.01;
			Frame0004=4;
			Delay0004=0.01;
			Frame0005=5;
			Delay0005=0.01;
			Frame0006=6;
			Delay0006=0.01;
			Frame0007=7;
			Delay0007=0.01;
			Frame0008=8;
			Delay0008=0.01;
			Frame0009=9;
			Delay0009=0.01;
			Frame0010=10;
			Delay0010=0.01;
			Frame0011=11;
			Delay0011=0.01;
	InitCommand=function(self)
		self:blend('BlendMode_Add')
	end;
	OnCommand=function(self)
		self:zoom(1.4):x(220):y(120):zoom(1.3):rotationz(140):diffusealpha(0):sleep(2.2):diffusealpha(1):linear(.03):addx(-8):addy(15):rotationz(160):linear(.03):addx(-10):addy(6):rotationz(180):linear(.03):addx(-8):addy(6):rotationz(200):linear(.03):addx(-10):addy(-5):rotationz(280):linear(.03):addy(-10):addx(-6):rotationz(300):linear(.03):addy(-5):linear(.05):addy(-10):addx(10):linear(.03):addy(-10):rotationz(360):linear(.03):addx(20):addy(-8):linear(.03):addy(-4):addx(24):linear(.03):addy(8):addx(4):zoom(1.2):rotationz(400):linear(.03):addy(16):addx(26):zoom(1):rotationz(450):linear(.03):addx(-4):addy(10):zoom(0.8):rotationz(480):linear(.03):addx(-10):addy(20):zoom(.5):rotationz(500):linear(.03):addx(-16):addy(20):zoom(.2):rotationz(520):linear(.01):diffusealpha(0)
	end;
	};
};
return t