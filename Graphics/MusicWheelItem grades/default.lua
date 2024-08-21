-- the flashy thingy near the music wheel item

local grades = {
	Grade_Tier01 = 8, -- AAAAA

	Grade_Tier02 = 7, -- AAAA:
	Grade_Tier03 = 7, -- AAAA.
	Grade_Tier04 = 7, -- AAAA

	Grade_Tier05 = 6, -- AAA:
	Grade_Tier06 = 6, -- AAA.
	Grade_Tier07 = 6, -- AAA

	Grade_Tier08 = 5, -- AA:
	Grade_Tier09 = 5, -- AA.
	Grade_Tier10 = 5, -- AA

	Grade_Tier11 = 4, -- A:
	Grade_Tier12 = 4, -- A.
	Grade_Tier13 = 4, -- A

	Grade_Tier14 = 3, -- B
	Grade_Tier15 = 2, -- C
	Grade_Tier16 = 1, -- D

	Grade_Tier17 = 0, -- ?????????

	Grade_Failed = 0, -- F

	Grade_None = nil,
};

local get_max_msd = function(song)
	local steps_list = song:GetAllSteps()

	local max_msd = 0
	for i = 1, #steps_list, 1 do
		max_msd = math.max(max_msd, math.floor(steps_list[i]:GetMSD(getCurRateValue(), 1)))
	end

	return max_msd
end

local t = Def.ActorFrame {
	LoadActor("grades") .. {
		InitCommand = function(self)
			self:blend('BlendMode_Add'):pause();
			self:zoomx(284 / 800);
			self:zoomy(28 / 60);
			self:addx(1);
		end,
		SetGradeCommand = function(self, params)
			local state = grades[params.Grade];

			if state ~= nil then
				self:visible(true);
				self:setstate(state);
			else
				self:visible(false);
			end
		end,
	},

	LoadFont('diff/diff') .. {
		InitCommand = function(self)
			self:settext('')
			self:zoom(0.4)
			self:addx(13.5)
		end,
		SetCommand = function(self, params)
			if params.Song == nil then
				return
			end
			local max_msd = get_max_msd(params.Song)

			local text_color = color("#FFFFFF")
			local bottom_color = color("#FFFFFF")
			if max_msd < 7 then -- gray
				text_color = color("#AAAAAA")
				bottom_color = color("#AAAAAA")
			elseif max_msd < 14 then -- blue
				text_color = color("#08B5FF")
				bottom_color = color("#01E6FF")
			elseif max_msd < 21 then -- green
				text_color = color("#21FB57")
				bottom_color = color("#3BF890")
			elseif max_msd < 28 then -- orange
				text_color = color("#FC7F1F")
				bottom_color = color("#FFBE43")
			elseif max_msd < 35 then -- red
				text_color = color("#DC2205")
				bottom_color = color("#EB631A")
			else -- violet
				text_color = color("#8308FE")
				bottom_color = color("#B700EB")
			end

			local colors = {}
			colors[1] = text_color
			colors[2] = text_color
			colors[3] = bottom_color
			colors[4] = bottom_color
			self:AddAttribute(0, { Length = -1, Diffuses = colors, })
			self:settextf('%d', math.floor(max_msd))
		end,
	},
}

return t;
