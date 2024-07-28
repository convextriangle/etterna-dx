local t = Def.ActorFrame {
	-- [Layer1]
	LoadActor("CARD_BG")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y):zoomtowidth(SCREEN_WIDTH):zoomtoheight(SCREEN_HEIGHT)
		end;
		OnCommand=function(self)
			self:addy(-10):diffusealpha(0):linear(.4):addy(10):diffusealpha(1)
		end;
	};
	-- [Layer2]
	LoadActor("KYOTAI")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y+9)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):diffusealpha(0):zoomy(4):sleep(0.2):linear(0.1):diffusealpha(0.8):zoomy(0.9):linear(0.1):zoomy(1)
		end;
	};
	-- [Layer3]
	LoadActor("CARD_SEL_FRAME")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y-179):zoomtowidth(SCREEN_WIDTH):zoomtoheight(SCREEN_HEIGHT)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):addy(10):diffusealpha(0):linear(.4):addy(-10):diffusealpha(1)
		end;
	};
	-- [Layer5]
	LoadActor("RED_LIGHT")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_TOP):vertalign(top):zoomtowidth(SCREEN_WIDTH):zoomtoheight(SCREEN_HEIGHT)
		end;
		OnCommand=function(self)
			self:diffusealpha(1):playcommand("Animate")
		end;
		AnimateCommand=function(self)
			self:blend('BlendMode_Add'):linear(1):diffusealpha(0):linear(0):diffusealpha(1):queuecommand("Animate")
		end;
	};
	-- [Layer7]
	LoadActor("ILINE1.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_TOP):zoomtowidth(600)
		end;
		OnCommand=function(self)
			self:linear(0.3):zoomx(0):diffusealpha(0)
		end;
	};
	-- [Layer8]
	Def.Sprite {
		Texture="WSQU 5x4.png";
			Frame0000=0;
			Delay0000=0.02;
			Frame0001=1;
			Delay0001=0.02;
			Frame0002=2;
			Delay0002=0.02;
			Frame0003=3;
			Delay0003=0.02;
			Frame0004=4;
			Delay0004=0.02;
			Frame0005=5;
			Delay0005=0.02;
			Frame0006=6;
			Delay0006=0.02;
			Frame0007=7;
			Delay0007=0.02;
			Frame0008=8;
			Delay0008=0.02;
			Frame0009=9;
			Delay0009=0.02;
			Frame0010=10;
			Delay0010=0.02;
			Frame0011=11;
			Delay0011=0.02;			
			Frame0012=12;
			Delay0012=0.02;
			Frame0013=13;
			Delay0013=0.02;
			Frame0014=14;
			Delay0014=0.02;
			Frame0015=15;
			Delay0015=0.02;
			Frame0016=16;
			Delay0016=0.02;
			Frame0017=17;
			Delay0017=0.02;
			Frame0018=18;
			Delay0018=0.02;
			Frame0019=19;
			Delay0019=0.02;
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-29):y(SCREEN_CENTER_Y+3)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):sleep(0.4):diffusealpha(0)
		end;
		};
	-- [Layer9]
	Def.Sprite {
		Texture="WSQU 5x4.png";
			Frame0000=0;
			Delay0000=0.02;
			Frame0001=1;
			Delay0001=0.02;
			Frame0002=2;
			Delay0002=0.02;
			Frame0003=3;
			Delay0003=0.02;
			Frame0004=4;
			Delay0004=0.02;
			Frame0005=5;
			Delay0005=0.02;
			Frame0006=6;
			Delay0006=0.02;
			Frame0007=7;
			Delay0007=0.02;
			Frame0008=8;
			Delay0008=0.02;
			Frame0009=9;
			Delay0009=0.02;
			Frame0010=10;
			Delay0010=0.02;
			Frame0011=11;
			Delay0011=0.02;			
			Frame0012=12;
			Delay0012=0.02;
			Frame0013=13;
			Delay0013=0.02;
			Frame0014=14;
			Delay0014=0.02;
			Frame0015=15;
			Delay0015=0.02;
			Frame0016=16;
			Delay0016=0.02;
			Frame0017=17;
			Delay0017=0.02;
			Frame0018=18;
			Delay0018=0.02;
			Frame0019=19;
			Delay0019=0.02;
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+28):y(SCREEN_CENTER_Y+3)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):sleep(0.4):diffusealpha(0)
		end;
		};
	-- [Layer10]
	LoadActor("I_WAKU.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-160):y(SCREEN_CENTER_Y+29)
		end;
		OnCommand=function(self)
			self:zoomy(0):diffusealpha(0):sleep(.1):linear(0.3):zoomy(1):diffusealpha(.8)
		end;
	};
	-- [Layer11]
	LoadActor("I_WAKU.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+160):y(SCREEN_CENTER_Y+29)
		end;
		OnCommand=function(self)
			self:zoomy(0):diffusealpha(0):sleep(.1):linear(0.3):zoomy(1):diffusealpha(.8)
		end;
	};
	-- [Layer12]
	LoadActor("ILINE2.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-156):y(SCREEN_CENTER_Y-77)
		end;
		OnCommand=function(self)
			self:cropleft(1):croptop(1):sleep(0.2):linear(.1):cropleft(0.98):croptop(.995):linear(.2):croptop(0):linear(.2):cropleft(0)
		end;
	};
	-- [Layer13]
	LoadActor("ILINE3.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+154):y(SCREEN_CENTER_Y-77)
		end;
		OnCommand=function(self)
			self:cropright(1):croptop(1):sleep(0.2):linear(.1):cropright(0.98):croptop(.995):linear(.2):croptop(0):linear(.2):cropright(0)
		end;
	};
	-- [Layer14]
	LoadActor("ILINE4.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-271):y(SCREEN_CENTER_Y+28)
		end;
		OnCommand=function(self)
			self:addx(30):diffusealpha(0):linear(0.4):addx(-30):diffusealpha(.6)
		end;
	};
	-- [Layer15]
	LoadActor("ILINE4.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+49):y(SCREEN_CENTER_Y+28)
		end;
		OnCommand=function(self)
			self:addx(30):diffusealpha(0):linear(0.4):addx(-30):diffusealpha(.6)
		end;
	};
	-- [Layer16]
	LoadActor("ILINE5.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-50):y(SCREEN_CENTER_Y+28)
		end;
		OnCommand=function(self)
			self:addx(-30):diffusealpha(0):linear(0.4):addx(30):diffusealpha(.6)
		end;
	};
	-- [Layer17]
	LoadActor("ILINE5.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+270):y(SCREEN_CENTER_Y+28)
		end;
		OnCommand=function(self)
			self:addx(-30):diffusealpha(0):linear(0.4):addx(30):diffusealpha(.6)
		end;
	};
	-- [Layer20]
	LoadActor("B_SHADOW.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-160):y(SCREEN_CENTER_Y+29)
		end;
		OnCommand=function(self)
			self:diffusealpha(0.6):zoom(0):addx(-110):addy(-165):sleep(0.4):linear(0.2):zoom(1):addx(110):addy(165)
		end;
	};
	-- [Layer21]
	LoadActor("B_SHADOW.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+160):y(SCREEN_CENTER_Y+29)
		end;
		OnCommand=function(self)
			self:diffusealpha(0.6):zoom(0):addx(-110):addy(-165):sleep(0.4):linear(0.2):zoom(1):addx(110):addy(165)
		end;
	};
	-- [Layer22]
	LoadActor("SANKASYA.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-244):y(SCREEN_CENTER_Y-207)
		end;
		OnCommand=function(self)
			self:addx(10):diffusealpha(0):linear(0.3):addx(-10):diffusealpha(1)
		end;
	};
	-- [Layer23]
	LoadActor("pad.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end;
		OnCommand=function(self)
			self:cropright(0.5):diffusealpha(0):addx(20):sleep(0.5):linear(0.2):addx(-20):diffusealpha(1)
		end;
	};
	-- [Layer24]
	LoadActor("pad.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end;
		OnCommand=function(self)
			self:cropleft(0.5):diffusealpha(0):addx(-20):sleep(0.5):linear(0.2):addx(20):diffusealpha(1)
		end;
	};
	-- [Layer25]
	LoadActor("INFOLINE.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-160):y(SCREEN_CENTER_Y+26)
		end;
		OnCommand=function(self)
			self:zoomx(0):sleep(0.4):linear(0.3):zoomx(1)
		end;
	};
	-- [Layer26]
	LoadActor("INFOLINE.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+160):y(SCREEN_CENTER_Y+26)
		end;
		OnCommand=function(self)
			self:zoomx(0):sleep(0.4):linear(0.3):zoomx(1)
		end;
	};
	-- [Layer28]
	LoadActor("1PLAYER.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-160):y(SCREEN_CENTER_Y+35)
		end;
		OnCommand=function(self)
			self:addy(-11):diffusealpha(0):sleep(0.4):linear(0.3):addy(11):diffusealpha(1)
		end;
	};
	-- [Layer29]
	LoadActor("2PLAYER.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+160):y(SCREEN_CENTER_Y+35)
		end;
		OnCommand=function(self)
			self:addy(-11):diffusealpha(0):sleep(0.4):linear(0.3):addy(11):diffusealpha(1)
		end;
	};
	-- [Layer32]
	LoadActor("T_GSTART.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-159):y(SCREEN_CENTER_Y+11)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):addy(11):diffusealpha(0):sleep(0.4):linear(0.3):addy(-11):diffusealpha(1)
		end;
	};
	-- [Layer33]
	LoadActor("T_JOIN.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+160):y(SCREEN_CENTER_Y+11)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):addy(11):diffusealpha(0):sleep(0.4):linear(0.3):addy(-11):diffusealpha(1)
		end;
	};
};
return t