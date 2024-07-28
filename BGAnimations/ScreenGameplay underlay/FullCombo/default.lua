--FullCombo base from moonlight by AJ
-- if this would even be used imo a better fit would be
-- smth like the highlight from WMIX-HD or just using _troopers_fullcombo -- 000fds

local pn = ...;
assert(pn);

local t = Def.ActorFrame{};

local IsUsingSoloSingles = PREFSMAN:GetPreference('Center1Player');
local NumPlayers = GAMESTATE:GetNumPlayersEnabled();
local NumSides = GAMESTATE:GetNumSidesJoined();

local pStats = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn);

local function GetPosition(pn)
	if IsUsingSoloSingles and NumPlayers == 1 and NumSides == 1 then return SCREEN_CENTER_X; end;
	
	local strPlayer = (NumPlayers == 1) and "OnePlayer" or "TwoPlayers";
	local strSide = (NumSides == 1) and "OneSide" or "TwoSides";

	return THEME:GetMetric("ScreenGameplay","Player".. ToEnumShortString(pn) .. strPlayer .. strSide .."X");

end;

--FullComboColor from Default Extended by A.C
--フルコンボカラー設定
--StepMania\Themes\_fallback\Scripts\02 Colors.lua
local function GetFullComboEffectColor(pss)
	local r = color("0,0,0");
		if pss:FullComboOfScore('TapNoteScore_W1') == true then
			r=GameColor.Judgment["JudgmentLine_W1"];
		elseif pss:FullComboOfScore('TapNoteScore_W2') == true then
			r=GameColor.Judgment["JudgmentLine_W2"];
		elseif pss:FullComboOfScore('TapNoteScore_W3') == true then
			r=GameColor.Judgment["JudgmentLine_W3"];
		end;
	return r;
end;

--フルコンボカラー設定 リング用（通常のパーツと色が違う）
local function GetFullComboEffectColor2(pss2)
	local r = color("0,0,0");
		if pss2:FullComboOfScore('TapNoteScore_W1') == true then
			r=GameColor.Judgment["JudgmentLine_W2"];
		elseif pss2:FullComboOfScore('TapNoteScore_W2') == true then
			r=GameColor.Judgment["JudgmentLine_W1"];
		elseif pss2:FullComboOfScore('TapNoteScore_W3') == true then
			r=GameColor.Judgment["JudgmentLine_W1"];
		end;
	return r;
end;

--(フルコンボテキスト画像設定)
--フルコンボの呼び出しテキスト用
local function GetFullComboText(fct)
	local rc;
		if fct:FullComboOfScore('TapNoteScore_W1') == true then
			rc="MARVELOUS FULL COMBO!";
		elseif fct:FullComboOfScore('TapNoteScore_W2') == true then
			rc="PERFECT FULL COMBO!";
		elseif fct:FullComboOfScore('TapNoteScore_W3') == true then
			rc="FULL COMBO!";
		end;
	return rc;
end;

--フルコンボのサウンド
t[#t+1] = LoadActor("Combo_Splash") .. {	
	OffCommand=function(self)
		if pStats:FullCombo() then
			self:play();
		end;
	end;
};

--フルコンボパーツ群
t[#t+1] = Def.ActorFrame{
	OffCommand = function(self)
		local pss = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn);
		self:diffuse(GetFullComboEffectColor(pss));
	end;
	
	--フルコンボ 上のグラデーション
	LoadActor("Up") .. {
		BeginCommand=function(self)
			self:diffusealpha(0);
			self:x( GetPosition(pn) );
			self:y(SCREEN_CENTER_Y);
		end;
		OffCommand=function(self)		
			if pStats:FullCombo() then
				self:diffusealpha(0.5);
				self:zoomx(1);
				self:zoomy(0);
				self:linear(0.25);
				self:zoomx(1.25);
				self:zoomy(1);
				self:linear(0.25);
				self:zoom(1);
				self:diffusealpha(0);
			end;
		end;
	};
	
	--フルコンボ スリムバー　真ん中
	LoadActor("Slim") .. {
		BeginCommand=function(self)
			self:diffusealpha(0);
			self:x( GetPosition(pn) );
			self:y(SCREEN_CENTER_Y-160);
		end;
		OffCommand=function(self)	
			if pStats:FullCombo() then
				self:diffusealpha(0.5);
				self:zoomx(0);
				self:linear(0.1);
				self:zoom(1.25);
				self:linear(0.25);
				self:zoomx(0);
				self:diffusealpha(0);
			end;
		end;	
	};

	--フルコンボ スリムバー　左
	LoadActor("Slim") .. {
		BeginCommand=function(self)
			self:diffusealpha(0);
			self:x( GetPosition(pn) );
			self:addx(-64);
			self:y(SCREEN_CENTER_Y-160);
		end;
		OffCommand=function(self)		
			if pStats:FullCombo() then
				self:diffusealpha(0.5);
				self:zoomx(0);
				self:linear(0.1);
				self:zoom(1.25);
				self:linear(0.25);
				self:zoomx(0);
				self:diffusealpha(0);
			end;
		end;	
	};

	--フルコンボ スリムバー　右
	LoadActor("Slim") .. {
		BeginCommand=function(self)
			self:diffusealpha(0);
			self:x( GetPosition(pn) );
			self:addx(64);
			self:y(SCREEN_CENTER_Y-160);
		end;
		OffCommand=function(self)	
			if pStats:FullCombo() then
				self:diffusealpha(0.5);
				self:zoomx(0);
				self:linear(0.1);
				self:zoom(1.25);
				self:linear(0.25);
				self:zoomx(0);
				self:diffusealpha(0);
			end;
		end;	
	};

	--フルコンボ　スター
	LoadActor("Star") .. {
		BeginCommand=function(self)
			self:diffusealpha(0);
			self:x( GetPosition(pn) );
			self:y(SCREEN_CENTER_Y-160);
		end;	
		OffCommand=function(self)		
			if pStats:FullCombo() then
				self:diffusealpha(1);
				self:zoomx(0);
				self:linear(0.1);
				self:zoomx(4);
				self:zoomy(1);
				self:linear(0.3);
				self:zoomx(1);
				self:addy(240);
				self:linear(0.3);
				self:addy(240);
			end;
		end;	
	};
	
	--フルコンボ一番下のグラデーション
	LoadActor("Down") .. {
		BeginCommand=function(self)
			self:diffusealpha(0);
			self:x( GetPosition(pn) );
			self:y(SCREEN_CENTER_Y);
		end;	
		OffCommand=function(self)		
			if pStats:FullCombo() then
				self:diffusealpha(0);
				self:sleep(0.6);
				self:diffusealpha(0.5);
				self:zoomx(0);
				self:zoomy(1);
				self:bounceend(0.4);
				self:zoomx(1);
				self:linear(0.3);
				self:diffusealpha(0);
			end;
		end;	
	};

	--フルコンボグラデーション左
	LoadActor("Gradation") .. {
		InitCommand=function(self)
			self:vertalign(top):horizalign(right)
		end;
		BeginCommand=function(self)
			self:diffusealpha(0);
			self:x( GetPosition(pn) );
			self:y(SCREEN_TOP);
		end;	
		OffCommand=function(self)
			
			if pStats:FullCombo() then
				self:zoomx(0.5);
				self:zoomy(0.2);
				self:diffusealpha(0);
				self:sleep(0.1);
				self:linear(0.47);
				self:diffusealpha(0.9);
				self:zoomx(0.25);
				self:zoomy(1);
				
				self:sleep(0.07);
				self:linear(0.5);
				self:zoomx(1);
				self:linear(0.2);
				self:addx(-192);
				self:diffusealpha(0);
			end;
		end;	
	};

	--フルコンボグラデーション右
	LoadActor("Gradation") .. {
		InitCommand=function(self)
			self:vertalign(top):horizalign(right)
		end;
		BeginCommand=function(self)
			self:diffusealpha(0);
			self:x( GetPosition(pn) );
			self:y(SCREEN_TOP);
		end;	
		OffCommand=function(self)		
			if pStats:FullCombo() then
				self:zoomx(-0.5);
				self:zoomy(0.2);
				self:diffusealpha(0);
				self:sleep(0.1);
				self:linear(0.47);
				self:diffusealpha(0.9);
				self:zoomx(-0.25);
				self:zoomy(1);
				self:sleep(0.07);
				self:linear(0.5);
				self:zoomx(-1);
				self:linear(0.2);
				self:addx(192);
				self:diffusealpha(0);
			end;
		end;	
	};
	
	--フルコンボリング 外側の光彩
	LoadActor("RingLight") .. {
		InitCommand=function(self)
			self:zoom(0)
		end;
		BeginCommand=function(self)
			self:x( GetPosition(pn) );
			self:y(SCREEN_CENTER_Y*0.75);
		end;	
		OffCommand=function(self)		
			if pStats:FullCombo() then
				self:zoom(0);
				self:sleep(0.65);
				self:zoomx(2);
				self:zoomy(0);
				self:linear(0.1);
				self:zoomy(2);
				self:linear(0.5);
				self:zoom(1);
				self:linear(0.1);
				self:zoomx(0);
			end;
		end;	
	};
};

--フルコンボリング
--カラーが回りのパーツと違うが、これはDDR X2 ACに準拠している
t[#t+1] = Def.ActorFrame{
	OffCommand = function(self)
		local pss2 = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn);
		self:diffuse(GetFullComboEffectColor2(pss2));
	end;
	
	LoadActor("RingColor") .. {
		InitCommand=function(self)
			self:zoom(0)
		end;
		BeginCommand=function(self)
			self:x( GetPosition(pn) );
			self:y(SCREEN_CENTER_Y*0.75);
		end;	
		OffCommand=function(self)
			if pStats:FullCombo() then
				self:zoom(0);
				self:sleep(0.65);
				self:zoomx(2);
				self:zoomy(0);
				self:linear(0.1);
				self:zoomy(2);
				self:linear(0.5);
				self:zoom(1);
				self:linear(0.1);
				self:zoomx(0);
			end;
		end;	
	};
};

--フルコンボの文字画像3つ
--とりあえず表示できるようにするが、大幅にソースを短縮できるはず

--Marvelous FullCombo
t[#t+1] = LoadActor("Text_MarvelousFullCombo")..{
	InitCommand=function(self)
		self:diffusealpha(0):x(GetPosition(pn)):y(SCREEN_CENTER_Y-60)
	end;
	OffCommand=function(self)
		local fct = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn);
		if fct:FullComboOfScore('TapNoteScore_W1') == true then
			self:diffusealpha(0);
			self:sleep(0.65);
			self:diffusealpha(1);
			self:zoomx(3);
			self:zoomy(0);
			self:linear(0.2);
			self:zoom(1);
			self:linear(0.35);
			self:zoom(1.25);
			self:linear(0.2);
			self:zoomx(3);
			self:zoomy(0);
			self:diffusealpha(0);
		elseif fct:FullComboOfScore('TapNoteScore_W2') == true then
			self:visible(false);
		elseif fct:FullComboOfScore('TapNoteScore_W3') == true then
			self:visible(false);
		else
			self:visible(false);
		end;
	end;	
};

--Perfect FullCombo
t[#t+1] = LoadActor("Text_PerfectFullCombo")..{
	InitCommand=function(self)
		self:diffusealpha(0):x(GetPosition(pn)):y(SCREEN_CENTER_Y-60)
	end;
	OffCommand=function(self)
		local fct = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn);
		if fct:FullComboOfScore('TapNoteScore_W1') == true then
			self:visible(false);
		elseif fct:FullComboOfScore('TapNoteScore_W2') == true then
			self:diffusealpha(0);
			self:sleep(0.65);
			self:diffusealpha(1);
			self:zoomx(3);
			self:zoomy(0);
			self:linear(0.2);
			self:zoom(1);
			self:linear(0.35);
			self:zoom(1.25);
			self:linear(0.2);
			self:zoomx(3);
			self:zoomy(0);
			self:diffusealpha(0);
		elseif fct:FullComboOfScore('TapNoteScore_W3') == true then
			self:visible(false);
		else
			self:visible(false);
		end;
	end;	
};

--FullCombo
t[#t+1] = LoadActor("Text_FullCombo")..{
	InitCommand=function(self)
		self:diffusealpha(0):x(GetPosition(pn)):y(SCREEN_CENTER_Y-60)
	end;
	OffCommand=function(self)
		local fct = STATSMAN:GetCurStageStats():GetPlayerStageStats(pn);
		if fct:FullComboOfScore('TapNoteScore_W1') == true then
			self:visible(false);
		elseif fct:FullComboOfScore('TapNoteScore_W2') == true then
			self:visible(false);
		elseif fct:FullComboOfScore('TapNoteScore_W3') == true then
			self:diffusealpha(0);
			self:sleep(0.65);
			self:diffusealpha(1);
			self:zoomx(3);
			self:zoomy(0);
			self:linear(0.2);
			self:zoom(1);
			self:linear(0.35);
			self:zoom(1.25);
			self:linear(0.2);
			self:zoomx(3);
			self:zoomy(0);
			self:diffusealpha(0);
		else
			self:visible(false);
		end;
	end;	
};

return t;
