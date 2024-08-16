local t = Def.ActorFrame {
	Def.Sprite {
		OnCommand = function(self)
			if GAMESTATE:GetCurrentSong() and GAMESTATE:GetCurrentSong():GetBackgroundPath() then
				self:finishtweening()
				self:visible(true)
				self:LoadBackground(GAMESTATE:GetCurrentSong():GetBackgroundPath())
				self:scaletocover(0, 0, SCREEN_WIDTH, SCREEN_BOTTOM)
				self:sleep(0.5)
				self:decelerate(2)
				self:diffusealpha(brightness)
			else
				self:visible(false)
			end
		end
	},

	LoadFont("TextBanner text") .. {
		Text = "song",
		InitCommand = function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_BOTTOM - 55):maxwidth(512):diffusealpha(0):sleep(.2):linear(.2)
				:diffusealpha(1)
		end,
		OnCommand = function(self)
			local song = GAMESTATE:GetCurrentSong()
			if not song
			then
				self:visible(false)
				return
			end
			self:visible(true)

			local str = string.format("%s - %s", song:GetDisplayArtist(), song:GetDisplayMainTitle())

			self:settext(str)
		end
	},
};

return t;
