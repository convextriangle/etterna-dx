local t = Def.ActorFrame {
	-- [Layer1]
	LoadActor("TITLE_BG1")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end;
		OnCommand=function(self)
			self:texcoordvelocity(0.5,0):zoomy(0.1):linear(1.8):zoomy(0.5):linear(0.1):zoomy(1.2):linear(0.1):zoomy(1)
		end;
	};
	-- [Layer2]
	LoadActor("TITLE_BG2")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):zoomy(0.1):linear(1.8):zoomy(0.5):texcoordvelocity(-.5,0):linear(0.1):zoomy(1.2):linear(0.1):zoomy(1)
		end;
	};	
	-- [Layer3]
	LoadActor("TITLE_BG3")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):zoomy(0.1):linear(1.8):zoomy(0.5):texcoordvelocity(0.5,0):diffusealpha(0.5)
		end;
	};	
	-- [Layer4]
	Def.Quad{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y):zoomtowidth(SCREEN_WIDTH):zoomtoheight(SCREEN_HEIGHT):diffuse(color("#000000"))
		end;
		OnCommand=function(self)
			self:diffusealpha(0):sleep(2):diffusealpha(1)
		end;
	};	
	-- [Layer5]
	LoadActor("TITLE_BG1")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end;
		OnCommand=function(self)
			self:texcoordvelocity(0.1,0):zoomy(0.1):diffusealpha(0):sleep(1.8):diffusealpha(1):zoomy(0.5):linear(0.1):zoomy(1.2):linear(0.1):zoomy(1)
		end;
	};	
	-- [Layer6]
	LoadActor("TITLE_BG2")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):texcoordvelocity(-0.1,0):zoomy(0.1):diffusealpha(0):sleep(1.8):diffusealpha(0.5):zoomy(0.5):linear(0.1):zoomy(1.2):linear(0.1):zoomy(1)
		end;
	};	
	-- [Layer7]
	LoadActor("TITLE_BG4")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-160):y(SCREEN_CENTER_Y)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):texcoordvelocity(-0.1,0):zoomy(0.1):diffusealpha(0):sleep(1.8):diffusealpha(0.8):zoomy(0.5):linear(0.1):zoomy(1.2):linear(0.1):zoomy(1):sleep(0)
		end;
	};	
	-- [Layer8]
	LoadActor("TITLE_BG3")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):texcoordvelocity(0.12,0):zoomy(0.1):diffusealpha(0):sleep(1.8):diffusealpha(0.7):zoomy(0.5):linear(0.1):zoomy(1.2):linear(0.1):zoomy(1)
		end;
	};	
	
	-- [Layer11]
	LoadActor("SITE")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):zoom(1.5):diffusealpha(0):sleep(0.6):linear(0.2):diffusealpha(0.8):zoom(1)
		end;
	};
	-- [Layer12]
	LoadActor("WHITE_GLOW")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):diffusealpha(0):sleep(1.2):linear(0.2):diffusealpha(0.8):linear(0.3):addy(-35)
		end;
	};
	-- [Layer13]
	LoadActor("LOGO.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end;
		OnCommand=function(self)
			self:zoomx(40):diffusealpha(0):sleep(1):linear(0.1):diffusealpha(1):zoomx(1):sleep(0.3):linear(0.3):addy(-35):sleep(0):diffusealpha(0)
		end;
	};
	-- [Layer14]
	LoadActor("LOGO_WIRE.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-4):y(SCREEN_CENTER_Y)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):diffusealpha(0.8):cropright(1):linear(0.8):cropright(0):linear(0.2):diffusealpha(0.5):sleep(0.4):linear(0.3):addy(-35):diffusealpha(0)
		end;
	};
	-- [Layer15]
	LoadActor("WIRE_DJ.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-183):y(SCREEN_CENTER_Y)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):zoom(3.4):diffusealpha(0):sleep(0.2):linear(0.2):zoom(1):diffusealpha(0.8):sleep(0.4):linear(0.2):diffusealpha(0.5):sleep(0.4):linear(0.3):addy(-35):diffusealpha(0)
		end;
	};
	-- [Layer16]
	LoadActor("WIRE_2DX.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+45):y(SCREEN_CENTER_Y-53)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):diffusealpha(0.8):cropright(1):sleep(0.5):linear(0.3):cropright(0):linear(0.2):diffusealpha(0.4):sleep(0.4):linear(0.3):addy(-35):diffusealpha(0)
		end;
	};
	-- [Layer18]
	LoadActor("WIRE_TROOPERS.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+46):y(SCREEN_CENTER_Y+30)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):diffusealpha(0.8):cropright(1):sleep(0.6):linear(0.3):cropright(0):linear(0.1):diffusealpha(0.4):sleep(0.4):linear(0.3):addy(-35):diffusealpha(0)
		end;
	};
	
	-- [Layer20]
	LoadActor("FLARE.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-236):y(SCREEN_CENTER_Y+28)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):zoom(0.5):diffusealpha(0):sleep(1.1):diffusealpha(1):sleep(0.05):diffusealpha(0)
		end;
	};
	-- [Layer21]
	LoadActor("P_SHOCK.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-236):y(SCREEN_CENTER_Y+28)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):zoom(0.4):diffusealpha(0):sleep(1.1):diffusealpha(1):linear(0.15):zoom(1.6):diffusealpha(0)
		end;
	};
	-- [Layer22]
	LoadActor("FLARE.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-139):y(SCREEN_CENTER_Y-81)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):zoom(0.5):diffusealpha(0):sleep(1.1):diffusealpha(1):sleep(0.05):diffusealpha(0)
		end;
	};
	-- [Layer23]
	LoadActor("P_SHOCK.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-139):y(SCREEN_CENTER_Y-81)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):diffusealpha(0):sleep(1.1):diffusealpha(1):linear(0.15):zoom(1.6):diffusealpha(0)
		end;
	};
	-- [Layer24]
	LoadActor("FLARE.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+80):y(SCREEN_CENTER_Y+84)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):zoom(0.5):diffusealpha(0):sleep(1.1):diffusealpha(1):sleep(0.05):diffusealpha(0)
		end;
	};
	-- [Layer25]
	LoadActor("P_SHOCK.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+80):y(SCREEN_CENTER_Y+84)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):diffusealpha(0):sleep(1.1):diffusealpha(1):linear(0.15):zoom(1.6):diffusealpha(0)
		end;
	};
	-- [Layer26]
	LoadActor("FLARE.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+226):y(SCREEN_CENTER_Y+20)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):zoom(0.5):diffusealpha(0):sleep(1.1):diffusealpha(1):sleep(0.05):diffusealpha(0)
		end;
	};
	-- [Layer27]
	LoadActor("P_SHOCK.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+226):y(SCREEN_CENTER_Y+20)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):diffusealpha(0):sleep(1.1):diffusealpha(1):linear(0.15):zoom(1.6):diffusealpha(0)
		end;
	};
	-- [Layer28]
	LoadActor("P_SHOCK.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):zoom(0.4):diffusealpha(0):sleep(1.1):diffusealpha(1):linear(0.15):zoom(1.6):diffusealpha(0)
		end;
	};
	-- [Layer30]
	Def.Sprite {
		Texture="HIBANA 3x4.png";
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
			self:x(SCREEN_CENTER_X-236):y(SCREEN_CENTER_Y-82)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):linear(0.23):x(SCREEN_CENTER_X-108):linear(0.02):x(SCREEN_CENTER_X-99):y(SCREEN_CENTER_Y-74):linear(0.03):x(SCREEN_CENTER_X-69):linear(0.02):x(SCREEN_CENTER_X-61):y(SCREEN_CENTER_Y-82):linear(0.05):x(SCREEN_CENTER_X-36):linear(0.02):x(SCREEN_CENTER_X-26):y(SCREEN_CENTER_Y-74):linear(0.09):x(SCREEN_CENTER_X+33):linear(0.02):x(SCREEN_CENTER_X+41):y(SCREEN_CENTER_Y-82):linear(0.31):x(SCREEN_CENTER_X+228):sleep(0.05):diffusealpha(0)
		end;
	};
	-- [Layer32]
	Def.Sprite {
		Texture="HIBANA 3x4.png";
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
			self:x(SCREEN_CENTER_X-237):y(SCREEN_CENTER_Y+29)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):linear(0.09):x(SCREEN_CENTER_X-196):y(SCREEN_CENTER_Y+84):linear(0.42):x(SCREEN_CENTER_X+64):y(SCREEN_CENTER_Y+84):linear(0.05):x(SCREEN_CENTER_X+90):y(SCREEN_CENTER_Y+50):linear(0.02):x(SCREEN_CENTER_X+95):y(SCREEN_CENTER_Y+84):linear(0.18):x(SCREEN_CENTER_X+206):y(SCREEN_CENTER_Y+84):linear(0.03):x(SCREEN_CENTER_X+228):y(SCREEN_CENTER_Y+66):sleep(0.05):diffusealpha(0)
		end;
	};
	-- [Layer34]
	LoadActor("SPARK_EF2.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+228):y(SCREEN_CENTER_Y+76):horizalign(left)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):zoom(0.4):diffusealpha(0):sleep(0.79):diffusealpha(1):linear(0.1):zoom(1):linear(0.1):zoom(1.2):diffusealpha(0)
		end;
	};
	-- [Layer36]
	LoadActor("SPARK_EF3.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+228):y(SCREEN_CENTER_Y-92):horizalign(left)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):zoom(0.4):diffusealpha(0):sleep(0.79):diffusealpha(1):linear(0.1):zoom(1):linear(0.1):zoom(1.2):diffusealpha(0)
		end;
	};
	-- [Layer39]
	Def.Quad{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y):zoomtowidth(SCREEN_WIDTH):zoomtoheight(SCREEN_HEIGHT):diffuse(color("#000000"))
		end;
		OnCommand=function(self)
			self:diffusealpha(0):sleep(2.2):diffusealpha(1)
		end;
	};
	-- [Layer40]
	LoadActor("TITLE_BG1.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end;
		OnCommand=function(self)
			self:texcoordvelocity(0.1,0):diffusealpha(0):sleep(2):diffusealpha(1)
		end;
	};
	-- [Layer41]
	LoadActor("TITLE_BG4.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-160):y(SCREEN_CENTER_Y)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):texcoordvelocity(-.1,0):diffusealpha(0):sleep(2):diffusealpha(1)
		end;
	};
	-- [Layer42]
	LoadActor("TITLE_BG3.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):texcoordvelocity(0.12,0):diffusealpha(0):sleep(2):diffusealpha(1)
		end;
	};
	-- [Layer43]
	LoadActor("SITE.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):diffusealpha(0):sleep(2):diffusealpha(0.8)
		end;
	};
	-- [Layer44]
	LoadActor("CREDIT.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y+62)
		end;
		OnCommand=function(self)
			self:addy(-10):diffusealpha(0):sleep(1.6):linear(0.2):addy(10):diffusealpha(1)
		end;
	};
	-- [Layer46]
	LoadActor("WHITE_GLOW.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):addy(-35):diffusealpha(0):sleep(2):diffusealpha(0.8)
		end;
	};
	-- [Layer47]
	LoadActor("logo.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y-35)
		end;
		OnCommand=function(self)
			self:diffusealpha(0):sleep(1.7):diffusealpha(1)
		end;
	};
	-- [Layer48]
	LoadActor("LOGO_BASE.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y-35)
		end;
		OnCommand=function(self)
			self:diffusealpha(0):playcommand("Animate")
		end;
		AnimateCommand=function(self)
			self:diffusealpha(0):sleep(3):linear(0.2):diffusealpha(0.8):sleep(1.5):linear(0.3):diffusealpha(0):queuecommand("Animate")
		end;
	};
	-- [Layer49]
	LoadActor("TITLE_BG2.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end;
		OnCommand=function(self)
			self:blend('BlendMode_Add'):texcoordvelocity(-.1,0):diffusealpha(0):sleep(2):diffusealpha(0.5)
		end;
	};
	-- [Layer50]
	LoadActor("LOGO_WIRE.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-4):y(SCREEN_CENTER_Y-35)
		end;
		OnCommand=function(self)
			self:diffusealpha(0):playcommand("Animate")
		end;
		AnimateCommand=function(self)
			self:cropright(1):blend('BlendMode_Add'):diffusealpha(0):sleep(3.2):diffusealpha(0.8):linear(0.8):cropright(0):sleep(0.5):linear(0.3):diffusealpha(0):sleep(0.2):queuecommand("Animate")
		end;
	};
	-- [Layer51]
	LoadActor("WIRE_DJ.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X-183):y(SCREEN_CENTER_Y-35)
		end;
		OnCommand=function(self)
			self:diffusealpha(0):playcommand("Animate")
		end;
		AnimateCommand=function(self)
			self:blend('BlendMode_Add'):zoom(3.4):diffusealpha(0):sleep(3.4):linear(0.2):zoom(1):diffusealpha(0.8):sleep(0.9):linear(0.3):diffusealpha(0):sleep(0.2):queuecommand("Animate")
		end;
	};
	-- [Layer52]
	LoadActor("WIRE_2DX.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+45):y(SCREEN_CENTER_Y-88)
		end;
		OnCommand=function(self)
			self:diffusealpha(0):playcommand("Animate")
		end;
		AnimateCommand=function(self)
			self:blend('BlendMode_Add'):diffusealpha(0.8):cropright(1):sleep(3.7):linear(0.3):cropright(0):sleep(0.5):linear(0.3):diffusealpha(0):sleep(0.2):queuecommand("Animate")
		end;
	};
	-- [Layer53]
	LoadActor("WIRE_TROOPERS.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+46):y(SCREEN_CENTER_Y-5)
		end;
		OnCommand=function(self)
			self:diffusealpha(0):playcommand("Animate")
		end;
		AnimateCommand=function(self)
			self:blend('BlendMode_Add'):diffusealpha(0.8):cropright(1):sleep(3.8):linear(0.3):cropright(0):sleep(0.4):linear(0.3):diffusealpha(0):sleep(.2):queuecommand("Animate")
		end;
	};
	-- [Layer55]
	Def.Sprite {
		Texture="HIBANA 3x4.png";
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
			self:x(SCREEN_CENTER_X-236):y(SCREEN_CENTER_Y-117)
		end;
		OnCommand=function(self)
			self:diffusealpha(1):playcommand("Animate")
		end;
		AnimateCommand=function(self)
			self:blend('BlendMode_Add'):x(SCREEN_CENTER_X-236):y(SCREEN_CENTER_Y-117):diffusealpha(0):sleep(3.2):diffusealpha(1):linear(0.23):x(SCREEN_CENTER_X-108):linear(0.02):x(SCREEN_CENTER_X-99):y(SCREEN_CENTER_Y-109):linear(0.03):x(SCREEN_CENTER_X-69):linear(0.02):x(SCREEN_CENTER_X-61):y(SCREEN_CENTER_Y-117):linear(0.05):x(SCREEN_CENTER_X-36):linear(0.02):x(SCREEN_CENTER_X-26):y(SCREEN_CENTER_Y-109):linear(0.09):x(SCREEN_CENTER_X+33):linear(0.02):x(SCREEN_CENTER_X+41):y(SCREEN_CENTER_Y-117):linear(0.31):x(SCREEN_CENTER_X+228):sleep(0.05):diffusealpha(0):sleep(.96):queuecommand("Animate")
		end;
	};
	-- [Layer56]
	Def.Sprite {
		Texture="HIBANA 3x4.png";
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
			self:x(SCREEN_CENTER_X-236):y(SCREEN_CENTER_Y-6)
		end;
		OnCommand=function(self)
			self:diffusealpha(1):playcommand("Animate")
		end;
		AnimateCommand=function(self)
			self:blend('BlendMode_Add'):x(SCREEN_CENTER_X-236):y(SCREEN_CENTER_Y-6):diffusealpha(0):sleep(3.2):diffusealpha(1):linear(0.09):x(SCREEN_CENTER_X-196):y(SCREEN_CENTER_Y+49):linear(0.42):x(SCREEN_CENTER_X+64):y(SCREEN_CENTER_Y+49):linear(0.05):x(SCREEN_CENTER_X+90):y(SCREEN_CENTER_Y+15):linear(0.02):x(SCREEN_CENTER_X+95):y(SCREEN_CENTER_Y+49):linear(0.18):x(SCREEN_CENTER_X+206):y(SCREEN_CENTER_Y+49):linear(0.03):x(SCREEN_CENTER_X+228):y(SCREEN_CENTER_Y+31):sleep(0.05):diffusealpha(0):sleep(.96):queuecommand("Animate")
		end;
	};
	-- [Layer57]
	LoadActor("SPARK_EF2.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+228):y(SCREEN_CENTER_Y+41):horizalign(left)
		end;
		OnCommand=function(self)
			self:diffusealpha(0):playcommand("Animate")
		end;
		AnimateCommand=function(self)
			self:blend('BlendMode_Add'):zoom(0.4):diffusealpha(0):sleep(3.99):diffusealpha(1):linear(0.1):zoom(1):linear(0.1):zoom(1.2):diffusealpha(0):sleep(.81):queuecommand("Animate")
		end;
	};
	-- [Layer59]
	LoadActor("SPARK_EF3.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+228):y(SCREEN_CENTER_Y-127):horizalign(left):rotationz(-20)
		end;
		OnCommand=function(self)
			self:diffusealpha(0):playcommand("Animate")
		end;
		AnimateCommand=function(self)
			self:blend('BlendMode_Add'):zoom(0.4):horizalign(left):diffusealpha(0):sleep(3.99):diffusealpha(1):linear(0.1):zoom(1):linear(0.1):zoom(1.2):diffusealpha(0):sleep(.81):queuecommand("Animate")
		end;
	};
	-- [Layer72]
	LoadActor("logo.png")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y-35)
		end;
		OnCommand=function(self)
			self:diffusealpha(0):sleep(1.7):diffusealpha(0):playcommand("Animate")
		end;
		AnimateCommand=function(self)
			self:diffusealpha(1):sleep(1.2):linear(0.2):diffusealpha(0):sleep(1.5):linear(0.3):diffusealpha(1):sleep(1.8):queuecommand("Animate")
		end;
	};
	-- [Layer100]
	Def.Quad{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y):zoomtowidth(SCREEN_WIDTH):zoomtoheight(SCREEN_HEIGHT):diffuse(color("#ffffff"))
		end;
		OnCommand=function(self)
			self:diffusealpha(1):linear(0.2):diffusealpha(0)
		end;
	};
};
return t
