local inSongSearch = false
local transitioning = false

local lastY
local curY

local top
local wheel

local function input(event)

	if event.type == "InputEventType_FirstPress" then

		if event.button == "EffectUp" and not inSongSearch then
			changeMusicRate(0.05)
		end

		if event.button == "EffectDown" and not inSongSearch then
			changeMusicRate(-0.05)
		end

		if event.DeviceInput.button == "DeviceButton_mousewheel up" then
			wheel:Move(-1)
			wheel:Move(0)
		end

		if event.DeviceInput.button == "DeviceButton_mousewheel down" then
			wheel:Move(1)
			wheel:Move(0)
		end

		if event.DeviceInput.button == "DeviceButton_middle mouse button" then
			lastY = INPUTFILTER:GetMouseY()
		end

		local CtrlPressed = INPUTFILTER:IsBeingPressed("left ctrl") or INPUTFILTER:IsBeingPressed("right ctrl")
		local numpad = event.DeviceInput.button == "DeviceButton_KP "..event.char

		-- im fired for writing this
		if event.DeviceInput.button == "DeviceButton_g" and CtrlPressed then
			GHETTOGAMESTATE:resetGoalTable()
			wheel:Move(1)
			wheel:Move(-1)
			wheel:Move(0)
		end
	end

	if event.type == "InputEventType_Repeat" then
		if event.DeviceInput.button == "DeviceButton_middle mouse button" then
			curY = INPUTFILTER:GetMouseY()
			if curY-lastY > 0 then
				wheel:Move(math.floor((curY-lastY)/50))
			elseif curY-lastY < 0 then
				wheel:Move(math.ceil((curY-lastY)/50))
			end
			wheel:Move(0)
		end
	end

	return false

end

local t = Def.ActorFrame{
	OnCommand = function(self)
		top = SCREENMAN:GetTopScreen()
		wheel = SCREENMAN:GetTopScreen():GetMusicWheel()
		top:AddInputCallback(input)
		self:diffusealpha(0)
		self:smooth(0.5)
		self:diffusealpha(1)
	end,
	TriggerReplayBeginMessageCommand = function(self)
		transitioning = true
	end,
	OffCommand = function(self)
		transitioning = true
		self:smooth(0.5)
		self:diffusealpha(0)
	end,
	StartPlaylistMessageCommand=function(self, params)
		top:StartPlaylistAsCourse(params.playlist:GetName())
	end,
	StartSearchMessageCommand = function(self)
		inSongSearch = true
	end,
	EndSearchMessageCommand = function(self)
		inSongSearch = false
	end
}

t[#t+1] = LoadActor("../_mouse", "ScreenSelectMusic")

return t
