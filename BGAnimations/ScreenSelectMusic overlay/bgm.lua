-- from spawncamping-wallhack

local curSong = nil
local start = 0
local delay = 0.02
local startFromPreview = true
local loop = true
local curPath = ""
local sampleStart = 0
local musicLength = 0
local loops = 0
local musicNotPaused = 1
local goNow = false
local nah = false

local sampleEvent = false

local deltaSum = 0
local function playMusic(self, delta)
	deltaSum = deltaSum + delta * musicNotPaused
	if musicLength + 3 < GAMESTATE:GetSongPosition():GetMusicSeconds() then
		goNow = true
	end

	-- dont override sample music with this if in chart preview mode
	local tscr = SCREENMAN:GetTopScreen()
	nah = tscr ~= nil and tscr:GetName() == "ScreenChartPreview"
	if nah then return end

	if (deltaSum > delay and sampleEvent) or goNow then
		goNow = false
		local s = SCREENMAN:GetTopScreen()
		if s:GetName() == "ScreenSelectMusic" then
			if s:GetMusicWheel():IsSettled() and loops <= 1 then
				deltaSum = 0
				if curSong and curPath then
					if startFromPreview then -- When starting from preview point
						amountOfWait = musicLength - sampleStart
						
						SOUND:PlayMusicPart(curPath,sampleStart,amountOfWait,2,2,loop,true,true)
						self:SetUpdateFunctionInterval(amountOfWait)

						if themeConfig:get_data().global.SongPreview == 3 then 
							startFromPreview = false
						end

					else -- When starting from start of from exit point.
						amountOfWait = musicLength - start

						if loops == 1 then
							SOUND:PlayMusicPart(curPath,start,amountOfWait,2,2,true,true,false)
						else
							SOUND:PlayMusicPart(curPath,start,amountOfWait,2,2,false,true,false)
						end
						self:SetUpdateFunctionInterval(math.max(0.02, amountOfWait))
						start = 0

						if themeConfig:get_data().global.SongPreview == 2 then
							startFromPreview = true
						end

					end
					loops = loops + 1
				end
			end
		end
	else
		self:SetUpdateFunctionInterval(0.025)
	end
end

local t = Def.ActorFrame{
	InitCommand = function(self)
		if themeConfig:get_data().global.SongPreview ~= 1 then
			self:SetUpdateFunction(playMusic)
		end
	end,
	CurrentSongChangedMessageCommand = function(self)
		musicNotPaused = 1
		goNow = false
		sampleEvent = false
		loops = 0
		SOUND:StopMusic()
		deltaSum = 0
		curSong = GAMESTATE:GetCurrentSong()
		if curSong ~= nil then
			curPath = curSong:GetMusicPath()
			if not curPath then
				SCREENMAN:SystemMessage("Invalid music file path.")
				return
			end
			sampleStart = curSong:GetSampleStart()
			musicLength = curSong:MusicLengthSeconds()
			startFromPreview = start == 0
			if themeConfig:get_data().global.SongPreview ~= 1 then
				self:SetUpdateFunctionInterval(0.002)
			end
		end
	end,
	PlayingSampleMusicMessageCommand = function(self)
		local tscr = SCREENMAN:GetTopScreen()
		nah = tscr ~= nil and tscr:GetName() == "ScreenChartPreview"

		musicNotPaused = 1
		goNow = false
		sampleEvent = true
		if not nah and themeConfig:get_data().global.SongPreview ~= 1 then
			self:SetUpdateFunctionInterval(0.002)
			SOUND:StopMusic()
		end
	end,
	CurrentRateChangedMessageCommand = function(self, params)
		if themeConfig:get_data().global.SongPreview ~= 1 then
			amountOfWait = amountOfWait / (1 / params.oldRate) / params.rate -- fun math, this works.
			self:SetUpdateFunctionInterval(amountOfWait)
		end
	end,
	PreviewPausedMessageCommand = function(self)
		if themeConfig:get_data().global.SongPreview ~= 1 then
			if musicNotPaused == 1 then
				musicNotPaused = 0
				goNow = false
			else
				musicNotPaused = 1
				sampleEvent = true
				startFromPreview = false
				loops = 0
				start = GAMESTATE:GetSongPosition():GetMusicSeconds()
				self:SetUpdateFunctionInterval(0.002)
				SOUND:StopMusic()
				goNow = true
			end
		end
	end,
	PreviewNoteFieldDeletedMessageCommand = function(self)
		musicNotPaused = 1
		goNow = false
		sampleEvent = true
		loops = 0
		if themeConfig:get_data().global.SongPreview ~= 1 then
			self:SetUpdateFunctionInterval(0.002)
			SOUND:StopMusic()
		end
	end
}

return t
