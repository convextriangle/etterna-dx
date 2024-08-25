local screen

local title_style = function(self)
	local colors = {}
	colors[1] = color("#FFFFFF")
	colors[2] = color("#FFFFFF")
	colors[3] = color("#232323")
	colors[4] = color("#232323")

	self:AddAttribute(0, { Length = -1, Diffuses = colors })
end

-- Difficulty selection banner, song subtitle, title and artist
local t = Def.ActorFrame {
	LoadActor("play_data.png") .. {
		InitCommand = function(self)
			self:x(SCREEN_CENTER_X - 85):y(SCREEN_CENTER_Y + 175)
			self:zoom(0.45)
		end,
		CurrentSongChangedMessageCommand = function(self)
			local song = GAMESTATE:GetCurrentSong()
			if not song then
				self:visible(false)
				return
			end
			self:visible(true)
		end,
	},
	LoadActor("score_data.png") .. {
		InitCommand = function(self)
			self:x(SCREEN_CENTER_X - 280):y(SCREEN_CENTER_Y + 175)
			self:zoom(0.45)
		end,
		CurrentSongChangedMessageCommand = function(self)
			local song = GAMESTATE:GetCurrentSong()
			if not song then
				self:visible(false)
				return
			end
			self:visible(true)
		end,
	},
	-- LoadActor("song_info.png") .. {
	-- 	InitCommand = function(self)
	-- 		self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
	-- 		self:zoom(0.45)
	-- 	end
	-- },
	-- LoadActor("separator.png") .. {
	-- 	InitCommand = function(self)
	-- 		self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y)
	-- 		self:zoom(0.45)
	-- 	end
	-- },
	LoadActor("bottom") .. {
		InitCommand = function(self)
			self:x(SCREEN_CENTER_X):y(SCREEN_BOTTOM - 10):visible(true)
			self:zoom(0.45)
			self:draworder(1024)
		end
	},
	LoadActor("DIFF_WAKU") .. {
		InitCommand = function(self)
			self:x(SCREEN_CENTER_X - 120):y(SCREEN_CENTER_Y + 46):visible(true)
		end,
		OnCommand = function(self)
			self:zoomy(0):sleep(0.2):linear(0.2):zoomy(1)
		end,
		CurrentSongChangedMessageCommand = function(self)
			local song = GAMESTATE:GetCurrentSong()
			if not song then
				self:visible(false)
				return
			end

			self:visible(true)
		end,
		SetChartPreviewStateMessageCommand = function(self, params)
			self:visible(not params.visible)
		end,
	},
	LoadFont("artist 16px") .. {
		Text = "stepartist_subtitle",
		InitCommand = function(self)
			self:x(SCREEN_CENTER_X + 30):y(SCREEN_CENTER_Y - 100):playcommand("Set"):horizalign(right):zoom(0.7)
				:shadowlength(0):maxwidth(500)
		end,
		OnCommand = function(self)
			self:diffusealpha(0):linear(0.5):diffusealpha(1)
		end,
		OffCommand = function(self)
			self:linear(0.5):diffusealpha(0)
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
			self:addx(-5)
			self:addy(-5)
			self:diffusealpha(0)
			self:sleep(0.1)
			self:linear(0.1)
			self:addx(5)
			self:addy(5)
			self:diffusealpha(1)
			self:settext(song:GetDisplaySubTitle() .. " // " .. song:GetOrTryAtLeastToGetSimfileAuthor())
		end,
		SetChartPreviewStateMessageCommand = function(self, params)
			self:visible(not params.visible)
		end,
	},
	LoadFont("artist 16px") .. {
		Text = "artist",
		InitCommand = function(self)
			self:x(SCREEN_CENTER_X + 30):y(SCREEN_CENTER_Y - 25):playcommand("Set"):horizalign(right):zoom(0.7)
				:shadowlength(0):maxwidth(290)
		end,
		OnCommand = function(self)
			self:diffusealpha(0):linear(0.5):diffusealpha(1)
		end,
		OffCommand = function(self)
			self:linear(0.5):diffusealpha(0)
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
			self:addx(-5)
			self:addy(-5)
			self:diffusealpha(0)
			self:sleep(0.1)
			self:linear(0.1)
			self:addx(5)
			self:addy(5)
			self:diffusealpha(1)
			self:settext(song:GetDisplayArtist())
		end,
		SetChartPreviewStateMessageCommand = function(self, params)
			self:visible(not params.visible)
		end,
	},
	LoadFont("01/01 48px") .. {
		Text = "title",
		InitCommand = function(self)
			self:x(SCREEN_CENTER_X + 30):y(SCREEN_CENTER_Y - 60):playcommand("Set"):horizalign(right):zoom(.9):zoomy(1)
				:shadowlength(0):maxwidth(480)
			title_style(self)
		end,
		OnCommand = function(self)
			self:diffusealpha(0):linear(0.5):diffusealpha(1)
			title_style(self)
		end,
		OffCommand = function(self)
			self:linear(0.5):diffusealpha(0)
			title_style(self)
		end,
		CurrentSongChangedMessageCommand = function(self)
			self:finishtweening():playcommand("Set")
			title_style(self)
		end,
		SetCommand = function(self)
			local song = GAMESTATE:GetCurrentSong()
			if not song then
				self:visible(false)
				return
			end
			self:visible(true)
			self:addx(-5)
			self:addy(5)
			self:diffusealpha(0)
			self:linear(0.1)
			self:addx(5)
			self:addy(-5)
			self:diffusealpha(1)

			self:settext(song:GetDisplayMainTitle())
			title_style(self)
		end,
		SetChartPreviewStateMessageCommand = function(self, params)
			self:visible(not params.visible)
		end,
	},
};


return t;
