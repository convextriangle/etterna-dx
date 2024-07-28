-- from spawncamping-wallhack

local timingWindowScale = PREFSMAN:GetPreference("TimingWindowScale")
local W5Window = PREFSMAN:GetPreference("TimingWindowSecondsW5") -- Timing window for Bads

local dotWidth = 2
local dotHeight = 2

-- shamelessly lifted straight from Til Death in Etterna .64:
local judges = {"marv", "perf", "great", "good", "boo", "miss"}
local tst = ms.JudgeScalers
local judge = (PREFSMAN:GetPreference("SortBySSRNormPercent") and 4 or GetTimingDifficulty())
local tso = tst[judge]
local maxOffset = math.max(180, 180 * tso)

local function clampJudge()
	if judge < 4 then judge = 4 end
	if judge > 9 then judge = 9 end
end
clampJudge()

local dvt = {} -- offset vector
local nrt = {} -- noterow vector
local ctt = {} -- track vector
local ntt = {} -- tap note type vector
local wuab = {} -- time corrected tap notes (?)
local columns = 4 -- the number of columns because we dont keep track of this i guess
local finalSecond = GAMESTATE:GetCurrentSong():GetLastSecond()
local td = GAMESTATE:GetCurrentSteps():GetTimingData()
local oddColumns = false
local middleColumn = 1.5 -- middle column for 4k but accounting for trackvector indexing at 0

local handspecific = false
local left = false
local middle = false
local setWidth = 0
local setHeight = 0
local setSong
local setSteps

local function fitX(x) -- Scale time values to fit within plot width.
	if finalSecond == 0 then
		return 0
	end
	return x / finalSecond * setWidth - setWidth / 2
end

local function fitY(y) -- Scale offset values to fit within plot height
	return -1 * y / maxOffset * setHeight / 2
end
local function setOffsetVerts(vt, x, y, c, alpha)
	vt[#vt + 1] = {{x - dotWidth/2, y + dotWidth/2, 0}, c}
	vt[#vt + 1] = {{x + dotWidth/2, y + dotWidth/2, 0}, c}
	vt[#vt + 1] = {{x + dotWidth/2, y - dotWidth/2, 0}, c}
	vt[#vt + 1] = {{x - dotWidth/2, y - dotWidth/2, 0}, c}
end

-- convert a plot x position to a noterow
local function convertXToRow(x)
	local output = x
	output = output / setWidth


	if output < 0 then output = 0 end
	if output > 1 then output = 1 end

	-- the 48 here is how many noterows there are per beat
	-- this is a const defined in the game
	-- and i sure hope it doesnt ever change
	local td = GAMESTATE:GetCurrentSteps():GetTimingData()
	local row = td:GetBeatFromElapsedTime(output * finalSecond) * 48

	return row
end
-----

local function HighlightUpdaterThing(self)
	self:GetChild("Background"):queuecommand("Highlight")
end

local baralpha = 0.4

local t = Def.ActorFrame{
	InitCommand = function(self)
		self:RunCommandsOnChildren(function(self)
			local params = {width = 0, height = 0, song = nil, steps = nil, nrv = {}, dvt = {}, ctt = {}, ntt = {}}
			self:playcommand("Update", params) end
		)
	end,
	OnCommand = function(self)
		local name = SCREENMAN:GetTopScreen():GetName()
		if name == "ScreenEvaluationNormal" or name == "ScreenNetEvaluation" then
			local allowHovering = not SCREENMAN:GetTopScreen():ScoreUsedInvalidModifier()
			if allowHovering then
				self:SetUpdateFunction(HighlightUpdaterThing)
			end
		end
	end,
	OffsetPlotModificationMessageCommand = function(self, params)
		if params.Name == "PrevJudge" and judge > 1 then
			judge = judge - 1
			clampJudge()
			tso = tst[judge]
		elseif params.Name == "NextJudge" and judge < 9 then
			judge = judge + 1
			clampJudge()
			tso = tst[judge]
		elseif params.Name == "ToggleHands" and #ctt > 0 then --super ghetto toggle -mina
			if not handspecific then -- moving from none to left 
				handspecific = true 
				left = true
			elseif handspecific and left then -- moving from left to middle 
				if oddColumns then 
					middle = true
				end 
				left = false 
			elseif handspecific and middle then -- moving from middle to right 
				middle = false
			elseif handspecific and not left then -- moving from right to none 
				handspecific = false
			end 
		end
		if params.Name == "ResetJudge" then
			judge =  PREFSMAN:GetPreference("SortBySSRNormPercent") and 4 or GetTimingDifficulty()
			clampJudge()
			tso = tst[(PREFSMAN:GetPreference("SortBySSRNormPercent") and 4 or GetTimingDifficulty())]
		end
		if params.Name ~= "ResetJudge" and params.Name ~= "PrevJudge" and params.Name ~= "NextJudge" and params.Name ~= "ToggleHands" then return end
		maxOffset = math.max(180, 180 * tso)
		MESSAGEMAN:Broadcast("JudgeDisplayChanged")
	end
}

-- Plot BG
t[#t+1] = Def.Quad{
	Name = "Background",
	InitCommand = function(self)
		self:halign(0):valign(0)
		self:diffuse(getMainColor("frame")):diffusealpha(0.8)
	end,
	UpdateCommand = function(self, params)
		setWidth = params.width
		setHeight = params.height
		setSong = params.song
		setSteps = params.steps
		dvt = params.dvt
		nrv = params.nrv
		ctt = params.ctt
		ntt = params.ntt
		columns = params.columns
		self:zoomto(params.width, params.height)
	end,
	HighlightCommand = function(self)
		local bar = self:GetParent():GetChild("PosBar")
		local txt = self:GetParent():GetChild("PosText")
		local bg = self:GetParent():GetChild("PosBG")
		if isOver(self) then
			local xpos = INPUTFILTER:GetMouseX() - self:GetParent():GetX()
			bar:visible(true)
			txt:visible(true)
			bg:visible(true)
			bar:x(xpos)
			txt:x(xpos - 2)
			bg:x(xpos)
			bg:zoomto(txt:GetZoomedWidth() + 4, txt:GetZoomedHeight() + 4)
			local row = convertXToRow(xpos)
			local judgments = SCREENMAN:GetTopScreen():GetReplaySnapshotJudgmentsForNoterow(row)
			local wifescore = SCREENMAN:GetTopScreen():GetReplaySnapshotWifePercentForNoterow(row) * 100
			local mean = SCREENMAN:GetTopScreen():GetReplaySnapshotMeanForNoterow(row)
			local sd = SCREENMAN:GetTopScreen():GetReplaySnapshotSDForNoterow(row)
			local timebro = td:GetElapsedTimeFromNoteRow(row) / getCurRateValue()

			local marvCount = judgments[10]
			local perfCount = judgments[9]
			local greatCount = judgments[8]
			local goodCount = judgments[7]
			local badCount = judgments[6]
			local missCount = judgments[5]

			--txt:settextf("x %f\nrow %f\nbeat %f\nfinalsecond %f", xpos, row, row/48, finalSecond)
			-- The odd formatting here is in case we want to add translation support.
			txt:settextf("%f%%\n%s: %d\n%s: %d\n%s: %d\n%s: %d\n%s: %d\n%s: %d\n%s: %0.2fms\n%s: %0.2fms\n%s: %0.2fs",
				wifescore,
				"Marvelous", marvCount,
				"Perfect", perfCount,
				"Great", greatCount,
				"Good", goodCount,
				"Bad", badCount,
				"Miss", missCount,
				"Std. Dev", sd,
				"Mean", mean,
				"Time", timebro
			)
		else
			bar:visible(false)
			txt:visible(false)
			bg:visible(false)
		end
	end
}

-- Plot center horizontal line
t[#t+1] = Def.Quad{
	Name = "Center Line",
	InitCommand = function(self)
		self:halign(0):valign(0)
		self:diffusealpha(baralpha)
	end,
	UpdateCommand = function(self, params)
		self:xy(0,params.height/2)
		self:zoomto(params.width,1)
	end
}

local function checkParams(params)
	local fixedparams = params
	if params.width == nil then
		fixedparams = {width = setWidth, 
		height = setHeight, 
		song = setSong, 
		steps = setSteps, 
		nrv = nrv,
		dvt = dvt,
		ctt = ctt,
		ntt = ntt,
		columns = columns}
	end
	oddColumns = GAMESTATE:GetCurrentStyle():ColumnsPerPlayer() % 2 ~= 0
	middleColumn = (GAMESTATE:GetCurrentStyle():ColumnsPerPlayer() - 1) / 2.0
	return fixedparams
end

-- this section creates the bars for different judgment levels
local fantabars = {22.5, 45, 90, 135}
local bantafars = {"TapNoteScore_W2", "TapNoteScore_W3", "TapNoteScore_W4", "TapNoteScore_W5"}
for i = 1, #fantabars do
	t[#t + 1] =
		Def.Quad {
		InitCommand = function(self)
			self:halign(0):valign(0)
		end,
		UpdateCommand = function(self, params)
			params = checkParams(params)
			self:zoomto(params.width, 1):diffuse(byJudgment(bantafars[i])):diffusealpha(baralpha)
			local fit = tso * fantabars[i]
			self:y(fitY(fit) + params.height/2)
		end,
		JudgeDisplayChangedMessageCommand = function(self)
			self:queuecommand("Update")
		end
	}
	t[#t + 1] =
		Def.Quad {
		InitCommand = function(self)
			self:halign(0):valign(0)
		end,
		UpdateCommand = function(self, params)
			params = checkParams(params)
			self:zoomto(params.width, 1):diffuse(byJudgment(bantafars[i])):diffusealpha(baralpha)
			local fit = tso * fantabars[i]
			self:y(fitY(-fit) + params.height/2)
		end,
		JudgeDisplayChangedMessageCommand = function(self)
			self:queuecommand("Update")
		end
	}
end

t[#t+1] = Def.Quad {
	Name = "PosBar",
	InitCommand = function(self)
		self:visible(false)
		self:zoomto(2, setHeight):diffuse(color("0.5,0.5,0.5,1"))
		self:valign(0)
	end,
	UpdateCommand = function(self, params)
		params = checkParams(params)
		self:zoomto(2, params.height)
	end
}
 
-- Late ms text
t[#t+1] = LoadFont("artist 16px")..{
	InitCommand=function(self)
		self:zoom(0.3):halign(0):valign(0):diffusealpha(0.4)
	end,
	UpdateCommand = function(self)
		self:xy(5,5)
		self:settextf("Late (+%d ms)", maxOffset)
	end,
	JudgeDisplayChangedMessageCommand = function(self)
		self:queuecommand("Update")
	end
}

-- Early ms text
t[#t+1] = LoadFont("artist 16px")..{
	InitCommand=function(self)
		self:zoom(0.3):halign(0):valign(1):diffusealpha(0.4)
	end,
	UpdateCommand = function(self, params)
		params = checkParams(params)
		self:xy(5,params.height-5)
		self:settextf("Early (-%d ms)", maxOffset)
	end,
	JudgeDisplayChangedMessageCommand = function(self)
		self:queuecommand("Update")
	end
}

-- Highlight info text
t[#t+1] = LoadFont("artist 16px") .. {
	InitCommand = function(self)
		self:zoom(0.3):diffusealpha(0.4)
		self:settext("")
	end,
	UpdateCommand = function(self, params)
		params = checkParams(params)
		self:xy(params.width/2, params.height - 10)
		if ntt ~= nil and #ntt > 0 then
			if handspecific then
				if left then
					self:settext("Highlighting left hand taps")
				elseif middle then
					self:settext("Highlighting middle column taps")
				else
					self:settext("Highlighting right hand taps")
				end
			else
				self:settext("Down toggles highlights")
			end
		else
			self:settext("")
		end
	end,
	JudgeDisplayChangedMessageCommand = function(self)
		self:queuecommand("Update")
	end
}

-- the dots.
t[#t+1] = Def.ActorMultiVertex{
	UpdateCommand = function(self, params)
		params = checkParams(params)
		local verts = {}
		
		if params.song == nil or params.steps == nil or params.nrv == nil or params.dvt == nil then
			self:SetVertices(verts)
			self:SetDrawState{Mode="DrawMode_Quads", First = 1, Num = #verts}
			return
		end

		for i = 1, #params.nrv do
			wuab[i] = td:GetElapsedTimeFromNoteRow(params.nrv[i])
		end

		local songLength = params.song:GetLastSecond()

		for i=1, #params.nrv do
			if params.dvt[i] ~= nil then
				local timestamp = params.steps:GetTimingData():GetElapsedTimeFromNoteRow(params.nrv[i])
				local offset = params.dvt[i]/1000

				local color = offsetToJudgeColor(params.dvt[i], tst[judge])
				color[4] = 1 -- force alpha = 1

				local x = fitX(wuab[i]) + params.width / 2
				local y = fitY(params.dvt[i]) + params.height / 2
				--local x = (timestamp/songLength) * params.width
				--local y = (offset/W5Window/2/timingWindowScale) * params.height + (params.height/2)
				local alpha = 1 -- 1 is the default, 0.1 is the non highlight version

				if handspecific and left then
					if ctt[i] >= middleColumn then -- highlighting left
						alpha = 0.1
					end
				elseif handspecific and middle then
					if ctt[i] ~= middleColumn then -- highlighting middle
						alpha = 0.1
					end
				elseif handspecific then
					if ctt[i] <= middleColumn then -- highlighting right
						alpha = 0.1
					end
				end
				if math.abs(offset) >= 1 then
					-- Misses
					if alpha == 1 then alpha = 0.3 else alpha = 0.1 end
					verts[#verts+1] = {{x-dotWidth/4, params.height,0}, Alpha(color, alpha)}
					verts[#verts+1] = {{x+dotWidth/4, params.height,0}, Alpha(color, alpha)}
					verts[#verts+1] = {{x+dotWidth/4, 0,0}, Alpha(color, alpha)}
					verts[#verts+1] = {{x-dotWidth/4, 0,0}, Alpha(color, alpha)}
				else
					-- Everything else
					setOffsetVerts(verts, x, y, Alpha(color, alpha))
				end

			end
		end

		self:SetVertices(verts)
		self:SetDrawState{Mode="DrawMode_Quads", First = 1, Num = #verts}
	end,
	JudgeDisplayChangedMessageCommand = function(self)
		self:queuecommand("Update")
	end
}

t[#t+1] = Def.Quad {
	Name = "PosBG",
	InitCommand = function(self)
		self:valign(1):halign(1):zoomto(30,30):diffuse(color(".1,.1,.1,.45"))
		self:visible(false)
	end
}

t[#t+1] = LoadFont("Common Normal") .. {
	Name = "PosText",
	InitCommand = function(self)
		self:valign(1):halign(1):zoom(0.4)
	end
}

return t
