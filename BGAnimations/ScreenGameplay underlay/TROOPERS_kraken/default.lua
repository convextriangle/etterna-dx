local t = Def.ActorFrame{
	Def.Quad{
		OnCommand=function(self,param)
			SCREENMAN:GetTopScreen():GetChild("SongBackground"):zoomto(.5,.88)
			SCREENMAN:GetTopScreen():GetChild("SongBackground"):x(SCREEN_WIDTH/4)
		end;
	};
	Def.Quad{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y):zoomtowidth(SCREEN_WIDTH):zoomtoheight(SCREEN_HEIGHT)
		end;
		OnCommand=function(self)
			self:diffuse(color("#FFFFFF")):sleep(.9):sleep(2.2):linear(.3):diffusealpha(0)
		end;
	};
	LoadFont("title")..{
		InitCommand=function(self)
			self:diffuse(color("#000000")):x(320):y(SCREEN_CENTER_Y-60):horizalign(center):zoomy(1.6):shadowlength(0):maxwidth(290):sleep(.9):sleep(2.2):linear(.3):diffusealpha(0)
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
	LoadFont("Gameplay Genre")..{
		InitCommand=function(self)
			self:diffuse(color("#000000")):x(320):y(SCREEN_CENTER_Y-120):horizalign(center):shadowlength(0):maxwidth(290):diffusealpha(1):sleep(.9):sleep(2.2):linear(.3):diffusealpha(0)
		end;
		OnCommand=function(self)
			local song = GAMESTATE:GetCurrentSong()
			if not song
				then self:visible(false)
				return
			end
			self:visible(true)
		end
	};
	LoadFont("artist 16px")..{
		InitCommand=function(self)
			self:x(320):y(SCREEN_CENTER_Y+50):horizalign(center):zoom(0.7):shadowlength(0):maxwidth(310):diffusealpha(1):sleep(.9):sleep(2.2):linear(.3):diffusealpha(0)
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
	LoadActor("BG")..{
	InitCommand=function(self)
		self:x(320):y(240)
	end;
	};
	LoadActor(THEME:GetPathB("", "SONG_INFO/DIFFICULTY"))..{
	};
	LoadActor(THEME:GetPathB("", "SONG_INFO/STAGE"))..{
	};
	LoadActor(THEME:GetPathB("", "SONG_INFO/MODE"))..{
	InitCommand=function(self)
		self:y(-200)
	end;
	};
	LoadActor("TIME_DISPLAY")..{
	InitCommand=function(self)
		self:x(20):y(162):rotationz(90):draworder(1):halign(0.5)
	end;
	};
	LoadActor("P1")..{
	};
	Def.Quad{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y):zoomtowidth(SCREEN_WIDTH):zoomtoheight(SCREEN_HEIGHT)
		end;
		OnCommand=function(self)
			self:diffuse(color("#000000")):diffusealpha(1):linear(.4):diffusealpha(0)
		end;
	};
	LoadActor("../_troopers_fullcombo")..{
	};
};

return t;