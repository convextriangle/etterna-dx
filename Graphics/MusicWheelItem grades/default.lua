-- the flashy thingy near the music wheel item

local grades = {
	Grade_Tier01 = 0; -- AAAAA

	Grade_Tier02 = 1; -- AAAA:
	Grade_Tier03 = 2; -- AAAA.
	Grade_Tier04 = 3; -- AAAA

	Grade_Tier05 = 4; -- AAA:
	Grade_Tier06 = 5; -- AAA.
	Grade_Tier07 = 6; -- AAA

	Grade_Tier08 = 7; -- AA:
	Grade_Tier09 = 8; -- AA.
	Grade_Tier10 = 9; -- AA

	Grade_Tier11 = 10; -- A:
	Grade_Tier12 = 11; -- A.
	Grade_Tier13 = 12; -- A

	Grade_Tier14 = 13; -- B
	Grade_Tier15 = 14; -- C
	Grade_Tier16 = 15; -- D

	Grade_Tier17 = 16; -- ?????????

	Grade_Failed = 17; -- F

	Grade_None = nil;
};

local t = LoadActor( "grades" ) .. {
	InitCommand=function(self)
		self:blend('BlendMode_Add'):pause();
		self:diffuseshift();
		self:effectperiod(1.25);
	end;
	SetGradeCommand=function(self, params)
		local state = grades[params.Grade];
		if state ~= nil then
			self:visible( true );

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
	end;
};

return t;