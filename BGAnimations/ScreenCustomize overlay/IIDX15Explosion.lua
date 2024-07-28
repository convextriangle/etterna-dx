-- this controls the life meter frame stuff
local framePref = GetUserPref("IIDX15Explosion");
local curIndex = 1; -- was 2

if framePref then
	local _ = { "_default","_9th","_orange","_distorted","_gold","_troopers","_gekitou","_empress","_sirius" };
	for i,v in ipairs(_) do
		if v == framePref then curIndex = i; end;
	end;
else
	curIndex = 1;
end;

local frames = {
	"_default",
	"_9th",
	"_orange",
	"_distorted",
	"_gold",
	"_troopers",
	"_gekitou",
	"_empress",
	"_sirius"
};
local numFrames = 9; -- sigh. didn't want to have to do this

local t = Def.ActorFrame{
	Def.Actor{
		Name="IIDX15ExplosionController";
		PlayerMenuInputMessageCommand=function(self,param)
			if param.MenuState == "MenuState_IIDX15Explosion" then
				if param.Input == "Start" then
					SetUserPref("IIDX15Explosion",frames[curIndex]);
					-- okay time to go back to the main menu
					MESSAGEMAN:Broadcast("MenuStateChanged",{NewState = "MenuState_Main"});
				elseif param.Input == "Back" then
					-- go back to main menu
					MESSAGEMAN:Broadcast("MenuStateChanged",{NewState = "MenuState_Main"});
				else
					-- left and right switch frames.
					if param.Input == "Left" or param.Input == "Up" then
						MESSAGEMAN:Broadcast("PreviousIIDX15Explosion");
					elseif param.Input == "Right" or param.Input == "Down" then
						MESSAGEMAN:Broadcast("NextIIDX15Explosion");
					end;
				end;
			end;
		end;
		NextIIDX15ExplosionMessageCommand=function(self)
			local prevIndex = curIndex;
			curIndex = curIndex + 1;
			if curIndex > numFrames then curIndex = 1; end;

			MESSAGEMAN:Broadcast("IIDX15ExplosionChanged",{NewIIDX15Explosion = frames[curIndex], NewIndex = curIndex, OldIndex = prevIndex});
		end;
		PreviousIIDX15ExplosionMessageCommand=function(self)
			local prevIndex = curIndex;
			curIndex = curIndex - 1;
			if curIndex < 1 then curIndex = numFrames; end;

			MESSAGEMAN:Broadcast("IIDX15ExplosionChanged",{NewIIDX15Explosion = frames[curIndex], NewIndex = curIndex, OldIndex = prevIndex});
		end;
	};
};

-- preview icon

-- the menu
local menu = Def.ActorFrame{
	Name="IIDX15ExplosionMenu";
	InitCommand=function(self)
		self:x(960):y(128)
	end;
	--InitCommand=cmd(x,SCREEN_WIDTH+SCREEN_CENTER_X;y,SCREEN_CENTER_Y*0.5); -- scroller
	ShowCommand=function(self)
		self:stoptweening():linear(0.2):x(456)
	end;
	HideCommand=function(self)
		self:stoptweening():linear(0.2):x(SCREEN_WIDTH+SCREEN_CENTER_X)
	end;
	MenuStateChangedMessageCommand=function(self,param)
		if param.NewState == "MenuState_IIDX15Explosion" then
			self:playcommand("Show")
		elseif param.NewState == "MenuState_Main" then
			self:playcommand("Hide")
		end;
	end;

	LoadActor("list")..{
		InitCommand=function(self)
			self:y(142):x(-42)
		end;
	};
	LoadActor("ex_default")..{
		InitCommand=function(self)
			self:y(70):x(-170)
		end;
		BeginCommand=function(self)
			self:playcommand(curIndex == 1 and "GainFocus" or "LoseFocus");
		end;
		GainFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("1,1,1,1"))
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("0.8,0.8,0.8,0.5"))
		end;
		IIDX15ExplosionChangedMessageCommand=function(self,param)
			if param.OldIndex == 1 then
				self:playcommand("LoseFocus");
			end;
			if param.NewIndex == 1 then
				self:playcommand("GainFocus");
			end;
		end;
	};

	LoadActor("ex_9th")..{
		InitCommand=function(self)
			self:y(70):x(-45)
		end;
		BeginCommand=function(self)
			self:playcommand(curIndex == 2 and "GainFocus" or "LoseFocus");
		end;
		GainFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("1,1,1,1"))
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("0.8,0.8,0.8,0.5"))
		end;
		IIDX15ExplosionChangedMessageCommand=function(self,param)
			if param.OldIndex == 2 then
				self:playcommand("LoseFocus");
			end;
			if param.NewIndex == 2 then
				self:playcommand("GainFocus");
			end;
		end;
	};

	LoadActor("ex_orange")..{
		InitCommand=function(self)
			self:y(70):x(80)
		end;
		BeginCommand=function(self)
			self:playcommand(curIndex == 3 and "GainFocus" or "LoseFocus");
		end;
		GainFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("1,1,1,1"))
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("0.8,0.8,0.8,0.5"))
		end;
		IIDX15ExplosionChangedMessageCommand=function(self,param)
			if param.OldIndex == 3 then
				self:playcommand("LoseFocus");
			end;
			if param.NewIndex == 3 then
				self:playcommand("GainFocus");
			end;
		end;
	};

	LoadActor("ex_distorted")..{
		InitCommand=function(self)
			self:y(145):x(-170)
		end;
		BeginCommand=function(self)
			self:playcommand(curIndex == 4 and "GainFocus" or "LoseFocus");
		end;
		GainFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("1,1,1,1"))
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("0.8,0.8,0.8,0.5"))
		end;
		IIDX15ExplosionChangedMessageCommand=function(self,param)
			if param.OldIndex == 4 then
				self:playcommand("LoseFocus");
			end;
			if param.NewIndex == 4 then
				self:playcommand("GainFocus");
			end;
		end;
	};

	LoadActor("ex_gold")..{
		InitCommand=function(self)
			self:y(145):x(-45)
		end;
		BeginCommand=function(self)
			self:playcommand(curIndex == 5 and "GainFocus" or "LoseFocus");
		end;
		GainFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("1,1,1,1"))
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("0.8,0.8,0.8,0.5"))
		end;
		IIDX15ExplosionChangedMessageCommand=function(self,param)
			if param.OldIndex == 5 then
				self:playcommand("LoseFocus");
			end;
			if param.NewIndex == 5 then
				self:playcommand("GainFocus");
			end;
		end;
	};

	LoadActor("ex_troopers")..{
		InitCommand=function(self)
			self:y(145):x(80)
		end;
		BeginCommand=function(self)
			self:playcommand(curIndex == 6 and "GainFocus" or "LoseFocus");
		end;
		GainFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("1,1,1,1"))
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("0.8,0.8,0.8,0.5"))
		end;
		IIDX15ExplosionChangedMessageCommand=function(self,param)
			if param.OldIndex == 6 then
				self:playcommand("LoseFocus");
			end;
			if param.NewIndex == 6 then
				self:playcommand("GainFocus");
			end;
		end;
	};

	LoadActor("ex_gekitou")..{
		InitCommand=function(self)
			self:y(220):x(-170)
		end;
		BeginCommand=function(self)
			self:playcommand(curIndex == 7 and "GainFocus" or "LoseFocus");
		end;
		GainFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("1,1,1,1"))
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("0.8,0.8,0.8,0.5"))
		end;
		IIDX15ExplosionChangedMessageCommand=function(self,param)
			if param.OldIndex == 7 then
				self:playcommand("LoseFocus");
			end;
			if param.NewIndex == 7 then
				self:playcommand("GainFocus");
			end;
		end;
	};
	
	LoadActor("ex_empress")..{
		InitCommand=function(self)
			self:y(220):x(-45)
		end;
		BeginCommand=function(self)
			self:playcommand(curIndex == 7 and "GainFocus" or "LoseFocus");
		end;
		GainFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("1,1,1,1"))
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("0.8,0.8,0.8,0.5"))
		end;
		IIDX15ExplosionChangedMessageCommand=function(self,param)
			if param.OldIndex == 8 then
				self:playcommand("LoseFocus");
			end;
			if param.NewIndex == 8 then
				self:playcommand("GainFocus");
			end;
		end;
	};
	
	LoadActor("ex_sirius")..{
		InitCommand=function(self)
			self:y(220):x(80)
		end;
		BeginCommand=function(self)
			self:playcommand(curIndex == 7 and "GainFocus" or "LoseFocus");
		end;
		GainFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("1,1,1,1"))
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():linear(0.3):diffuse(color("0.8,0.8,0.8,0.5"))
		end;
		IIDX15ExplosionChangedMessageCommand=function(self,param)
			if param.OldIndex == 9 then
				self:playcommand("LoseFocus");
			end;
			if param.NewIndex == 9 then
				self:playcommand("GainFocus");
			end;
		end;
	};
};

t[#t+1] = menu;

return t;