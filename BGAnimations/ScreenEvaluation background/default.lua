local t = Def.ActorFrame{
	LoadActor(THEME:GetPathS("","LOSE"))..{
		OnCommand=function(self)
			self:play()
		end;
		OffCommand=function(self)
			self:stop()
		end;
		Condition=STATSMAN:GetBestGrade() >= 15; -- grade D or lower
	};
	LoadActor(THEME:GetPathS("","WIN"))..{
		OnCommand=function(self)
			self:play()
		end;
		OffCommand=function(self)
			self:stop()
		end;
		Condition=STATSMAN:GetBestGrade() < 15; -- grade C or higher
	};

	-- A --
	LoadActor("A")..{
	InitCommand=function(self)
		self:zoomx(SCREEN_WIDTH/640)
	end;
    -- A and midgrades
	Condition=STATSMAN:GetBestGrade() >= 10 and STATSMAN:GetBestGrade() <= 12;
	};

	-- AA --
	LoadActor("AA")..{
	InitCommand=function(self)
		self:zoomx(SCREEN_WIDTH/640)
	end;
     -- AA and midgrades
	Condition=STATSMAN:GetBestGrade() >= 7 and STATSMAN:GetBestGrade() <= 9;
	};

	-- AAA --
	LoadActor("AAA")..{
	InitCommand=function(self)
		self:zoomx(SCREEN_WIDTH/640)
	end;
    --- AAA, AAAA, AAAAA and midgrades
	Condition=STATSMAN:GetBestGrade() <= 6;
	};

	-- _CLEAR --
	LoadActor("_CLEAR")..{
	InitCommand=function(self)
		self:zoomx(SCREEN_WIDTH/640)
	end;
    -- grade B or C
	Condition=STATSMAN:GetBestGrade() == 13 or STATSMAN:GetBestGrade() == 14;
	};

	-- _FAILED --
	LoadActor("_FAILED")..{
	InitCommand=function(self)
		self:zoomx(SCREEN_WIDTH/640)
	end;
    -- grade D or lower
	Condition=STATSMAN:GetBestGrade() >= 15;
	};

	-- HEADER --
	LoadActor("HEADER")..{
	InitCommand=function(self)
		self:zoomx(SCREEN_WIDTH/640)
	end;
	};

	LoadActor("DDR_CLEAR_FRAME")..{
	InitCommand=function(self)
		self:zoomx(SCREEN_WIDTH/640)
	end;
	};

 	LoadFont("TextBanner text") .. {
		Text="song";
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_BOTTOM-55):maxwidth(512):diffusealpha(0):sleep(.2):linear(.2):diffusealpha(1)
		end;
		OnCommand=function(self)
			local song = GAMESTATE:GetCurrentSong()
			if not song
				then self:visible(false)
				return
			end
			self:visible(true)

            local str = string.format("%s - %s", song:GetDisplayArtist(), song:GetDisplayMainTitle())

			self:settext(str)
		end
	};
};

return t;
