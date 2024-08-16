local t = Def.ActorFrame {
	LoadActor("epic_triangle") .. {
		InitCommand = function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end
	},
	LoadActor("file_info") .. {
		InitCommand = function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end
	},
	LoadActor("free_stage_result") .. {
		InitCommand = function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end
	},
	LoadActor("game_type") .. {
		InitCommand = function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end
	},
	LoadActor("judge_detail") .. {
		InitCommand = function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end
	},
	LoadActor("nm") .. {
		InitCommand = function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end
	},
	LoadActor("note_count") .. {
		InitCommand = function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end
	},
	LoadActor("player_hp_frame") .. {
		InitCommand = function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end
	},
	LoadActor("player_info") .. {
		InitCommand = function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end
	},
	LoadActor("score_info") .. {
		InitCommand = function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end
	},
	LoadActor("separator") .. {
		InitCommand = function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
		end
	},
	LoadActor("song_info_bar") .. {
		InitCommand = function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
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
