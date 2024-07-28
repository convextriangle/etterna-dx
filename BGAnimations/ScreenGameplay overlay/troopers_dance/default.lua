local t = Def.ActorFrame{
	Def.Quad{
	InitCommand=function(self)
		self:diffuse(color("#000000")):zoomtowidth(SCREEN_WIDTH):zoomtoheight(SCREEN_HEIGHT):x(SCREEN_CENTER_X):y(240):sleep(1):linear(.4):diffusealpha(0)
	end;
	};
	Def.Quad{
	InitCommand=function(self)
		self:zoomtowidth(SCREEN_WIDTH):zoomtoheight(220):x(SCREEN_CENTER_X):y(250):diffusealpha(0):sleep(1):linear(.2):diffusealpha(0.5):sleep(1.8):linear(.2):diffusealpha(0)
	end;
	};
	Def.Quad{
	InitCommand=function(self)
		self:zoomtowidth(SCREEN_WIDTH):zoomtoheight(220):x(SCREEN_CENTER_X):y(250):diffusealpha(0):sleep(3):linear(0):diffusealpha(1):linear(.3):zoomy(0)
	end;
	};
	----------------------------------------------------------------------------------------------------------
	--REGULAR--
	--Only P1 (Regular)--
	LoadActor("_ONLY P1.lua")..{
	InitCommand=function(self)
		self:x(0):y(0)
	end;
	Condition=GAMESTATE:IsPlayerEnabled(PLAYER_1) and not GAMESTATE:IsPlayerEnabled(PLAYER_2)
	};
	--[[LoadActor("_BANNER.lua")..{
	InitCommand=function(self)
		self:x(320):y(452)
	end;
	OnCommand=function(self)
		self:addy(50):linear(.2):addy(-50):sleep(.1):linear(.05):addy(2):linear(.05):addy(-2)
	end;
	};]]
	LoadActor("_LIFE_P1.lua")..{
	InitCommand=function(self)
		self:x(139):y(27)
	end;
	OnCommand=function(self)
		self:addx(-260):linear(.2):addx(260):linear(.05):addy(-2):linear(.05):addy(2)
	end;
	};
	LoadActor("_LIFE_P2.lua")..{
	InitCommand=function(self)
		self:x(501):y(27)
	end;
	OnCommand=function(self)
		self:addx(260):linear(.2):addx(-260):linear(.05):addy(-2):linear(.05):addy(2)
	end;
	};
	LoadActor("BPM.png")..{
	InitCommand=function(self)
		self:x(321):y(31)
	end;
	OnCommand=function(self)
		self:addy(-50):linear(.2):addy(50):linear(.05):addy(-2):linear(.05):addy(2)
	end;
	};
	Def.SongBPMDisplay {
	File=THEME:GetPathF("", "Gameplay BPM");
	Name="BPMDisplay";
	InitCommand=function(self)
		self:x(320):y(94):diffusealpha(1)
	end;
	OnCommand=function(self)
        self:SetFromGameState()
    end;
	};
	--[[LoadActor("HIBANA")..{
	};
	LoadActor(THEME:GetPathB("", "SONG_INFO/DIFFICULTY"))..{
	InitCommand=function(self)
		self:x(-3):y(-1)
	end;
	};
	LoadActor(THEME:GetPathB("", "SONG_INFO/STAGE"))..{
	InitCommand=function(self)
		self:x(3):y(-1)
	end;
	};
	LoadActor(THEME:GetPathB("", "SONG_INFO/MODE"))..{
	InitCommand=function(self)
		self:y(-80)
	end;
	};]]
	LoadActor("TIME_DISPLAY")..{
	InitCommand=function(self)
		self:x(320):y(18)
	end;
	};
	---------------------------------------------------------------------	
	LoadFont("title")..{
		InitCommand=function(self)
			self:diffuse(color("#000000")):x(320):y(260):horizalign(center):zoomy(1.6):shadowlength(0):maxwidth(290):sleep(.9):sleep(2.1):linear(0.2):diffusealpha(0)
		end;
		OnCommand=function(self)
			local song = GAMESTATE:GetCurrentSong()
			if not song
				then self:visible(false)
				return
			end;
			self:visible(true)
			self:settext(song:GetDisplayMainTitle())
		end;
	};
	LoadFont("art-nostroke 16px")..{
		InitCommand=function(self)
			self:diffuse(color("#000000")):x(320):y(330):horizalign(center):zoom(0.7):shadowlength(0):maxwidth(310):diffusealpha(0):sleep(.6):linear(.3):diffusealpha(1):sleep(2.1):linear(0.2):diffusealpha(0)
		end,
		OnCommand=function(self)
			local song = GAMESTATE:GetCurrentSong()
			if not song
				then self:visible(false)
				return
			end
			self:visible(true)
			self:settext(song:GetDisplayArtist())
		end
	},
};

return t;
