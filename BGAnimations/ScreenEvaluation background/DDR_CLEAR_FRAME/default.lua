local y_fudge = -30 -- should be the same value as in _P1_NUMBERS.lua

local t = Def.ActorFrame{
	LoadActor("1P_MAXCOMBO")..{
	InitCommand=function(self)
		self:horizalign(left):x(25):y(SCREEN_CENTER_Y+19 + y_fudge)
	end;
	OnCommand=function(self)
		self:diffusealpha(.9):addx(-320):sleep(.05):linear(0.2):addx(320)
	end;
	};
	LoadActor("1P_MARVS")..{
	InitCommand=function(self)
		self:horizalign(left):x(25):y(SCREEN_CENTER_Y+43 + y_fudge)
	end;
	OnCommand=function(self)
		self:diffusealpha(.9):addx(-320):sleep(.1):linear(0.2):addx(320)
	end;
	};
	------------------------------------------------------------------------
	LoadActor("1P_PIKAGRE")..{ --PERFECT--
	InitCommand=function(self)
		self:horizalign(left):x(25):y(SCREEN_CENTER_Y+66 + y_fudge)
	end;
	OnCommand=function(self)
		self:diffusealpha(.9):addx(-320):sleep(.15):linear(0.2):addx(320)
	end;
	};
	Def.Sprite {
		Texture="_GREAT 1x3.png";
			Frame0000=0;
			Delay0000=0.01;
			Frame0001=1;
			Delay0001=0.01;
			Frame0002=2;
			Delay0002=0.01;
	InitCommand=function(self)
		self:horizalign(left):x(34):y(SCREEN_CENTER_Y+41 + y_fudge):addx(-320):sleep(.15):linear(0.2):addx(320)
	end;
	};
	------------------------------------------------------------------------
	LoadActor("1P_GRE")..{
	InitCommand=function(self)
		self:horizalign(left):x(25):y(SCREEN_CENTER_Y+89 + y_fudge)
	end;
	OnCommand=function(self)
		self:diffusealpha(.9):addx(-320):sleep(.2):linear(0.2):addx(320)
	end;
	};
	LoadActor("1P_GOOD")..{
	InitCommand=function(self)
		self:horizalign(left):x(25):y(SCREEN_CENTER_Y+112 + y_fudge)
	end;
	OnCommand=function(self)
		self:diffusealpha(.9):addx(-320):sleep(.25):linear(0.2):addx(320)
	end;
	};
	LoadActor("1P_BAD")..{
	InitCommand=function(self)
		self:horizalign(left):x(25):y(SCREEN_CENTER_Y+135 + y_fudge)
	end;
	OnCommand=function(self)
		self:diffusealpha(.9):addx(-320):sleep(.3):linear(0.2):addx(320)
	end;
	};
	LoadActor("1P_POOR")..{
	InitCommand=function(self)
		self:horizalign(left):x(25):y(SCREEN_CENTER_Y+159 + y_fudge)
	end;
	OnCommand=function(self)
		self:diffusealpha(.9):addx(-320):sleep(.35):linear(0.2):addx(320)
	end;
	};
	LoadActor("ok p1")..{
	InitCommand=function(self)
		self:horizalign(left):x(25):y(SCREEN_CENTER_Y+181 + y_fudge)
	end;
	OnCommand=function(self)
		self:diffusealpha(.9):addx(-320):sleep(.35):linear(0.2):addx(320)
	end;
	};
	LoadActor("GLOW.png")..{
	InitCommand=function(self)
		self:x(28):blend('BlendMode_Add'):diffuseblink():effectperiod(0.05):effectcolor1(color("1,1,1,1")):effectcolor2(color("1,1,1,0")):visible(GAMESTATE:IsPlayerEnabled(PLAYER_1)):diffusealpha(0):sleep(.4):diffusealpha(1)
	end;
	OnCommand=function(self,params)
		local stats = STATSMAN:GetCurStageStats():GetPlayerStageStats(PLAYER_1)
		local w1 = stats:GetTapNoteScores('TapNoteScore_W1')
		local w2 = stats:GetTapNoteScores('TapNoteScore_W2')
		local w3 = stats:GetTapNoteScores('TapNoteScore_W3')
		local w4 = stats:GetTapNoteScores('TapNoteScore_W4')
		local w5 = stats:GetTapNoteScores('TapNoteScore_W5')
		local miss = stats:GetTapNoteScores('TapNoteScore_Miss')
		if w1 >= w2 and w1 > w3 and w1 > w4 and w1 > w5 and w1 > miss then
			self:y(SCREEN_CENTER_Y+41 + y_fudge)
			end;
		if w2 > w1 and w2 > w2 and w2 > w3 and w2 > w4 and w2 > miss then
			self:y(SCREEN_CENTER_Y+65 + y_fudge)
			end;
		if w3 > w1 and w3 > w2 and w3 > w4 and w3 > w5 and w3 > miss then
			self:y(SCREEN_CENTER_Y+88 + y_fudge)
			end;
		if w4 > w1 and w4 > w2 and w4 > w3 and w4 > w5 and w4 > miss then
			self:y(SCREEN_CENTER_Y+111 + y_fudge)
			end;
		if w5 > w1 and w5 > w2 and w5 > w3 and w5 > w4 and w5 > miss then
			self:y(SCREEN_CENTER_Y+134 + y_fudge)
			end;
		if miss > w1 and miss > w2 and miss > w3 and miss > w4 and miss > w5 then
			self:y(SCREEN_CENTER_Y+157 + y_fudge)
			end;
		end;
	};
	
	LoadActor("_P1_NUMBERS")..{
	InitCommand=function(self)
		self:y(999):sleep(.6):y(-4 + y_fudge)
	end;
	Condition=GAMESTATE:IsPlayerEnabled(PLAYER_1);
	};
};

return t;
