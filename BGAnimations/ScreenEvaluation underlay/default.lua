-- i forgot about lua argument passing rules so idk if this always works
local function transform(self)
	self:zoom(0.45)
end

local t = Def.ActorFrame {
	LoadActor(THEME:GetPathG("", "_shared header")),

	LoadActor("score_no") .. {
		InitCommand = function(self)
			self:xy(SCREEN_CENTER_X - 310, SCREEN_CENTER_Y - 10):zoom(0.8):draworder(2)
		end,
		HidePreviousScoreCommand = function(self)
			self:visible(false)
		end
	},

	LoadActor("score_no") .. {
		InitCommand = function(self)
			self:xy(SCREEN_CENTER_X - 310, SCREEN_CENTER_Y - 44):zoom(0.8):draworder(2)
		end,
		HidePreviousScoreCommand = function(self)
			self:visible(false)
		end
	},

	LoadActor("score_no") .. {
		InitCommand = function(self)
			self:xy(SCREEN_CENTER_X - 310, SCREEN_CENTER_Y - 66):zoom(0.8):draworder(2)
		end,
		HidePreviousScoreCommand = function(self)
			self:visible(false)
		end
	},

	LoadActor("score_no") .. {
		InitCommand = function(self)
			self:xy(SCREEN_CENTER_X - 310, SCREEN_CENTER_Y + 24):zoom(0.8):draworder(2)
		end,
		HidePreviousScoreCommand = function(self)
			self:visible(false)
		end
	},

	LoadActor("score_no") .. {
		InitCommand = function(self)
			self:xy(SCREEN_CENTER_X - 310, SCREEN_CENTER_Y + 56):zoom(0.8):draworder(2)
		end,
		HidePreviousScoreCommand = function(self)
			self:visible(false)
		end
	},

	LoadActor("score_no") .. {
		InitCommand = function(self)
			self:xy(SCREEN_CENTER_X - 255, SCREEN_CENTER_Y + 102):zoom(0.6):draworder(2)
		end,
		HidePreviousScoreCommand = function(self)
			self:visible(false)
		end
	},

	LoadActor("score_no") .. {
		InitCommand = function(self)
			self:xy(SCREEN_CENTER_X - 255, SCREEN_CENTER_Y + 117):zoom(0.6):draworder(2)
		end,
		HidePreviousScoreCommand = function(self)
			self:visible(false)
		end
	},

	LoadActor("score_no") .. {
		InitCommand = function(self)
			self:xy(SCREEN_CENTER_X - 255, SCREEN_CENTER_Y + 132):zoom(0.6):draworder(2)
		end,
		HidePreviousScoreCommand = function(self)
			self:visible(false)
		end
	},

	LoadActor("score_no") .. {
		InitCommand = function(self)
			self:xy(SCREEN_CENTER_X - 255, SCREEN_CENTER_Y + 148):zoom(0.6):draworder(2)
		end,
		HidePreviousScoreCommand = function(self)
			self:visible(false)
		end
	},

	LoadActor("score_no") .. {
		InitCommand = function(self)
			self:xy(SCREEN_CENTER_X - 255, SCREEN_CENTER_Y + 164):zoom(0.6):draworder(2)
		end,
		HidePreviousScoreCommand = function(self)
			self:visible(false)
		end
	},

	LoadActor("score_no") .. {
		InitCommand = function(self)
			self:xy(SCREEN_CENTER_X - 255, SCREEN_CENTER_Y + 180):zoom(0.6):draworder(2)
		end,
		HidePreviousScoreCommand = function(self)
			self:visible(false)
		end
	},

	LoadActor("epic_triangle") .. {
		InitCommand = function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_TOP + 10)
			transform(self)
		end
	},
	LoadActor("file_info") .. {
		InitCommand = function(self)
			self:x(SCREEN_CENTER_X + 250):y(SCREEN_CENTER_Y - 100)
			transform(self)
		end
	},
	LoadActor("free_stage_result") .. {
		InitCommand = function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_TOP + 10)
			transform(self)
		end
	},
	LoadActor("game_type") .. {
		InitCommand = function(self)
			self:x(SCREEN_CENTER_X - 98):y(SCREEN_BOTTOM - 20)
			transform(self)
			self:setstate(GAMESTATE:GetCurrentStyle():ColumnsPerPlayer() - 4):pause()
		end
	},
	LoadActor("judge_detail") .. {
		InitCommand = function(self)
			self:x(SCREEN_CENTER_X - 300):y(SCREEN_CENTER_Y + 150)
			transform(self)
		end
	},
	LoadActor("nm") .. {
		InitCommand = function(self)
			self:x(SCREEN_CENTER_X - 70):y(SCREEN_BOTTOM - 20)
			transform(self)
		end
	},
	LoadActor("note_count") .. {
		InitCommand = function(self)
			self:x(SCREEN_CENTER_X + 70):y(SCREEN_BOTTOM - 20)
			transform(self)
		end
	},
	LoadActor("player_hp_frame") .. {
		InitCommand = function(self)
			self:x(SCREEN_CENTER_X - 285):y(SCREEN_CENTER_Y - 155):draworder(2)
			transform(self)
		end
	},

	-- duplicate for offset plot
	LoadActor("player_hp_frame") .. {
		InitCommand = function(self)
			self:x(SCREEN_CENTER_X + 245.25):y(SCREEN_CENTER_Y + 106):draworder(2)
			self:zoomx(0.56):zoomy(0.435)
		end
	},
	LoadActor("player_info") .. {
		InitCommand = function(self)
			self:x(SCREEN_CENTER_X - 285):y(SCREEN_CENTER_Y - 150):draworder(1)
			transform(self)
		end
	},
	LoadActor("score_info") .. {
		InitCommand = function(self)
			self:x(SCREEN_CENTER_X - 300):y(SCREEN_CENTER_Y)
			transform(self)
		end
	},
	LoadActor("separator") .. {
		InitCommand = function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_BOTTOM - 30)
			transform(self)
		end
	},
	LoadActor("song_info_bar") .. {
		InitCommand = function(self)
			self:x(SCREEN_CENTER_X - 50):y(SCREEN_BOTTOM - 20)
			transform(self)
		end
	},

	Def.Sprite {
		OnCommand = function(self)
			local banner = GAMESTATE:GetCurrentSong():GetBannerPath()
			self:LoadBackground(banner)
			self:xy(SCREEN_CENTER_X + 191, SCREEN_TOP + 47.25)
			self:zoom(0.45)
		end
	},

	LoadFont("01/01 24px") .. {
		Text = "song",
		InitCommand = function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_BOTTOM - 70):maxwidth(512):diffusealpha(0):sleep(.2):linear(.2)
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

			local str = string.format("%s\n%s", song:GetDisplayArtist(), song:GetDisplayMainTitle())

			self:settext(str)
		end
	},
};

return t;
