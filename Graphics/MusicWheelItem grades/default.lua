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


local t = Def.ActorFrame {
	LoadActor("grades") .. {
		InitCommand = function(self)
			self:blend('BlendMode_Add'):pause();
			self:zoomx(284 / 800);
			self:zoomy(28 / 60);
			self:addx(1.5);
		end,
		SetGradeCommand = function(self, params)
			local state = grades[params.Grade];
			if state ~= nil then
				self:visible(true);

				-- no colors for all the midgrades so
				-- just gonna use a single one for multiple

				if state > 0 and state <= 3 then
					state = 1;
				elseif state <= 6 then
					state = 2;
				elseif state <= 9 then
					state = 3;
				elseif state <= 12 then
					state = 4;
				elseif state <= 15 then
					state = 5;
				elseif state == 16 then
					state = 6;
				else
					state = 7;
				end

				state = state * 2;
				self:setstate(state);
			else
				self:visible(false);
			end
		end,
	},

	-- LoadFont('diff/diffblue') .. {
	-- 	InitCommand = function(self)
	-- 		self:settext('')
	-- 		self:zoom(0.4)
	-- 		self:addx(13.5)
	-- 	end,
	-- 	CurrentStepsChangedMessageCommand = function(self)
	-- 		local steps = GAMESTATE:GetCurrentSteps()
	-- 		if steps then
	-- 			-- displaying only overall MSD
	-- 			local meter = steps:GetMSD(getCurRateValue(), 1);
	-- 			self:settextf('%d', math.floor(meter))
	-- 		end
	-- 	end,
	-- }
}

return t;
