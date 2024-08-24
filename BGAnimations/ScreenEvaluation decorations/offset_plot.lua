-- from spawncamping-wallhack

local song = GAMESTATE:GetCurrentSong()
local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats()
local steps = GAMESTATE:GetCurrentSteps()

-- etc timing info
local nrv = pss:GetNoteRowVector()
local dvt = pss:GetOffsetVector()
local ctt = pss:GetTrackVector()
local ntt = pss:GetTapNoteTypeVector()

local frameWidth = SCREEN_CENTER_X - WideScale(get43size(40), 40)
local frameHeight = 300

local offsetParamX = SCREEN_CENTER_X + 100
local offsetParamY = SCREEN_CENTER_Y + 50
local offsetParamZoom = 0.75
local offsetParamWidth = frameWidth * offsetParamZoom
local offsetParamHeight = 150 * offsetParamZoom

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
			MESSAGEMAN:Broadcast("OffsetPlotModification", { Name = outputName })
		end

		if (INPUTFILTER:IsBeingPressed("left ctrl") or INPUTFILTER:IsBeingPressed("right ctrl")) and
			event.DeviceInput.button == "DeviceButton_a" then
			usingSimpleScreen = not usingSimpleScreen
			MESSAGEMAN:Broadcast("SwitchEvalTypes")
		end
	end
end

t[#t + 1] = LoadActor(THEME:GetPathG("", "OffsetGraph")) .. {
	InitCommand = function(self, params)
		self:xy(offsetParamX, offsetParamY)
		self:zoom(offsetParamZoom)

		local pn = GAMESTATE:GetEnabledPlayers()[1]
		local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats()
		local steps = GAMESTATE:GetCurrentSteps()

		self:RunCommandsOnChildren(function(self)
			local params = {
				width = offsetParamWidth,
				height = offsetParamHeight,
				song = song,
				steps = steps,
				nrv = nrv,
				dvt = dvt,
				ctt = ctt,
				ntt = ntt,
				columns = steps:GetNumColumns()
			}
			localparamscopy = params
			self:playcommand("Update", params)
		end
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
			self:RunCommandsOnChildren(function(self)
				self:playcommand("Update",
					{ width = offsetParamWidth, height = offsetParamHeight })
			end)
		end
	end,
	DelayedShowOffsetMessageCommand = function(self)
		self:RunCommandsOnChildren(function(self)
			local params = {
				width = offsetParamWidth,
				height = offsetParamHeight,
				song = song,
				steps = steps,
				nrv = scoreList[offsetIndex]:GetNoteRowVector(),
				dvt = scoreList[offsetIndex]:GetOffsetVector(),
				ctt = scoreList[offsetIndex]:GetTrackVector(),
				ntt = scoreList[offsetIndex]:GetTapNoteTypeVector(),
				columns = steps:GetNumColumns()
			}
			selectedparamscopy = params
			self:playcommand("Update", params)
		end
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

return t
