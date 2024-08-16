return Def.ActorFrame {
	LoadFont("01/01 48px") .. {
		Text = "artist",
		InitCommand = function(self)
			self:blend('BlendMode_Add'):x(320):y(SCREEN_CENTER_Y - 54):playcommand("Set"):shadowlength(0):maxwidth(500)
		end,
		OnCommand = function(self)
			self:finishtweening():playcommand("Set")
		end,
		OffCommand = function(self)
			self:finishtweening():playcommand("Set")
		end,
		CurrentSongChangedMessageCommand = function(self)
			self:finishtweening():playcommand("Set")
		end,
		SetCommand = function(self)
			local song = GAMESTATE:GetCurrentSong()
			if not song
			then
				self:visible(false)
				return
			end
			self:visible(true)
			self:y(SCREEN_CENTER_Y - 54)
			self:zoom(.9)
			self:addy(10)
			self:diffusealpha(0)
			self:sleep(.2)
			self:linear(0.15)
			self:addy(-10)
			self:diffusealpha(1)
			self:sleep(2.05)
			self:decelerate(.7)
			self:zoom(.7)
			self:y(SCREEN_CENTER_Y - 55)
			self:settext(song:GetDisplayMainTitle())
		end
	},
	-- Artist/1
	LoadFont("artist 16px") .. {
		Text = "artist",
		InitCommand = function(self)
			self:x(320):y(SCREEN_CENTER_Y - 10):playcommand("Set"):zoom(0.7):shadowlength(0):maxwidth(290)
		end,
		OnCommand = function(self)
			self:finishtweening():playcommand("Set")
		end,
		OffCommand = function(self)
			self:finishtweening():playcommand("Set")
		end,
		CurrentSongChangedMessageCommand = function(self)
			self:finishtweening():playcommand("Set")
		end,
		SetCommand = function(self)
			local song = GAMESTATE:GetCurrentSong()
			if not song
			then
				self:visible(false)
				return
			end
			self:visible(true)
			self:y(SCREEN_CENTER_Y - 10)
			self:zoom(.7)
			self:addy(10)
			self:diffusealpha(0)
			self:sleep(.2)
			self:linear(0.15)
			self:addy(-10)
			self:diffusealpha(1)
			self:sleep(2.05)
			self:decelerate(.7)
			self:zoom(.5)
			self:y(SCREEN_CENTER_Y - 11)
			self:settext(song:GetDisplayArtist())
		end
	},

	LoadFont("artist 16px") .. {
		Text = "playeroptions",
		InitCommand = function(self)
			self:x(320):y(SCREEN_CENTER_Y + 30):playcommand("Set"):zoom(0.7):shadowlength(0):maxwidth(290)
		end,
		OnCommand = function(self)
			self:finishtweening():playcommand("Set")
		end,
		OffCommand = function(self)
			self:finishtweening():playcommand("Set")
		end,
		CurrentSongChangedMessageCommand = function(self)
			self:finishtweening():playcommand("Set")
		end,
		SetCommand = function(self)
			local song = GAMESTATE:GetCurrentSong()
			if not song
			then
				self:visible(false)
				return
			end
			self:visible(true)
			self:y(SCREEN_CENTER_Y + 30)
			self:zoom(.7)
			self:addy(10)
			self:diffusealpha(0)
			self:sleep(.2)
			self:linear(0.15)
			self:addy(-10)
			self:diffusealpha(1)
			self:sleep(2.05)
			self:decelerate(.7)
			self:zoom(.5)
			self:y(SCREEN_CENTER_Y + 29)
			self:settext("Press ENTER to go to Player Options!")
		end
	},
}
