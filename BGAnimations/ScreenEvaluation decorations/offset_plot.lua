-- from spawncamping-wallhack

local song = GAMESTATE:GetCurrentSong()
local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats()
local steps = GAMESTATE:GetCurrentSteps()

-- etc timing info
local nrv = pss:GetNoteRowVector()
local dvt = pss:GetOffsetVector()
local ctt = pss:GetTrackVector()
local ntt = pss:GetTapNoteTypeVector()
local totalTaps = pss:GetTotalTaps()

local frameWidth = SCREEN_CENTER_X-WideScale(get43size(40),40)
local frameHeight = 300

local offsetParamX = SCREEN_CENTER_X*3/2-frameWidth/2
local offsetParamY = SCREEN_HEIGHT - 180
local offsetParamZoom = 0.5
local offsetParamWidth = frameWidth
local offsetParamHeight = 150

local altOffsetParamX = 41/1066 * SCREEN_WIDTH
local altOffsetParamY = offsetY2
local altOffsetParamZoom = 0.5
local altOffsetParamWidth = offsetWidth2
local altOffsetParamHeight = offsetHeight2

local localparamscopy = {}
local selectedparamscopy = {}

local x_fudge = -40
local y_fudge = -75

-- im stupid
local function setOffsetParams()
	if usingSimpleScreen then
		offsetParamX = altOffsetParamX + x_fudge
		offsetParamY = altOffsetParamY + y_fudge
		offsetParamZoom = altOffsetParamZoom
		offsetParamWidth = altOffsetParamWidth
		offsetParamHeight = altOffsetParamHeight
	else
		offsetParamX = SCREEN_CENTER_X*3/2-frameWidth/2 + x_fudge
		offsetParamY = SCREEN_HEIGHT - 180 + y_fudge
		offsetParamZoom = 0.5
		offsetParamWidth = frameWidth
		offsetParamHeight = 150
	end
end
setOffsetParams()

local t = Def.ActorFrame {}
local function offsetInput(event)
	if event.type == "InputEventType_FirstPress" then
		local outputName = ""
		if event.button == "EffectUp" then
			outputName = "NextJudge"
		elseif event.button == "EffectDown" then
			outputName = "PrevJudge"
		elseif event.button == "MenuDown" then
			outputName = "ToggleHands"
		elseif event.button == "MenuUp" then
			outputName = "ResetJudge"
		end

		if outputName ~= "" then
			MESSAGEMAN:Broadcast("OffsetPlotModification", {Name = outputName})
		end

		if (INPUTFILTER:IsBeingPressed("left ctrl") or INPUTFILTER:IsBeingPressed("right ctrl")) and
		event.DeviceInput.button == "DeviceButton_a" then
			usingSimpleScreen = not usingSimpleScreen
			MESSAGEMAN:Broadcast("SwitchEvalTypes")
		end
	end
end

t[#t+1] = LoadActor(THEME:GetPathG("","OffsetGraph"))..{
	InitCommand = function(self, params)
		self:xy(offsetParamX, offsetParamY)
		self:zoom(offsetParamZoom)

		local pn = GAMESTATE:GetEnabledPlayers()[1]
		local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats()
		local steps = GAMESTATE:GetCurrentSteps()

		self:RunCommandsOnChildren(function(self)
			local params = 	{width = offsetParamWidth, 
							height = offsetParamHeight,
							song = song, 
							steps = steps, 
							nrv = nrv,
							dvt = dvt,
							ctt = ctt,
							ntt = ntt,
							columns = steps:GetNumColumns()}
			localparamscopy = params
			self:playcommand("Update", params) end
		)
	end,
	ShowScoreOffsetMessageCommand = function(self, params)
		if scoreList[offsetIndex]:HasReplayData() then
			if not offsetisLocal then
				DLMAN:RequestOnlineScoreReplayData(
					scoreList[offsetIndex],
					function()
						MESSAGEMAN:Broadcast("DelayedShowOffset")
					end
				)
			else
				MESSAGEMAN:Broadcast("DelayedShowOffset")
			end
		else
			self:RunCommandsOnChildren(function(self) self:playcommand("Update", {width = offsetParamWidth, height = offsetParamHeight}) end)
		end
	end,
	DelayedShowOffsetMessageCommand = function(self)
		self:RunCommandsOnChildren(function(self)
			local params = 	{width = offsetParamWidth, 
							height = offsetParamHeight, 
							song = song, 
							steps = steps, 
							nrv = scoreList[offsetIndex]:GetNoteRowVector(),
							dvt = scoreList[offsetIndex]:GetOffsetVector(),
							ctt = scoreList[offsetIndex]:GetTrackVector(),
							ntt = scoreList[offsetIndex]:GetTapNoteTypeVector(),
							columns = steps:GetNumColumns()}
			selectedparamscopy = params
			self:playcommand("Update", params) end
		)
	end,
	OnCommand = function(self)
		self:stoptweening()
		self:zoom(1)
		self:addy(25)
		self:addy(-25)
		self:xy(offsetParamX, offsetParamY)
		self:diffusealpha(1)
		SCREENMAN:GetTopScreen():AddInputCallback(offsetInput)
	end,
	OffCommand = function(self)
		self:stoptweening()
		self:x(offsetParamX + 100)
		self:diffusealpha(0)
	end
}

-- Missing noterows text
t[#t+1] = LoadFont("Common Normal") .. {
	InitCommand = function(self)
		self:xy(SCREEN_WIDTH * 3/4, SCREEN_HEIGHT * 3/4)
		self:settext("Missing Noterows from Online Replay\n(゜´Д｀゜)")
		self:zoom(0.4)
		self:diffuse(color(colorConfig:get_data().selectMusic.TabContentText)):diffusealpha(0.6)
		self:visible(false)
	end,
	DelayedShowOffsetMessageCommand = function(self)
		if scoreList[offsetIndex]:GetNoteRowVector() == nil then
			self:visible(true)
		else
			self:visible(false)
		end
	end
}

return t
