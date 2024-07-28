-- this controls the life meter frame stuff
local framePref = GetUserPref("IIDX15Frame");
local curIndex = 1; -- was 2

if framePref then
	local _ = { "TROOPERS_default","TROOPERS_icarus","TROOPERS_kraken","TROOPERS_lion","TROOPERS_troopers","TROOPERS_scorpion","TROOPERS_mendes" };
	for i,v in ipairs(_) do
		if v == framePref then curIndex = i; end;
	end;
else
	curIndex = 1;
end;

local frames = {
	"TROOPERS_default",
	"TROOPERS_icarus",
	"TROOPERS_kraken",
	"TROOPERS_lion",
	"TROOPERS_troopers",
	"TROOPERS_scorpion",
	"TROOPERS_mendes"
};
local numFrames = 7; -- sigh. didn't want to have to do this

local t = Def.ActorFrame{
	Def.Actor{
		Name="IIDX15FrameController";
		PlayerMenuInputMessageCommand=function(self,param)
			if param.MenuState == "MenuState_IIDX15Frame" then
				if param.Input == "Start" then
					SetUserPref("IIDX15Frame",frames[curIndex]);
					-- okay time to go back to the main menu
					MESSAGEMAN:Broadcast("MenuStateChanged",{NewState = "MenuState_Main"});
				elseif param.Input == "Back" then
					-- go back to main menu
					MESSAGEMAN:Broadcast("MenuStateChanged",{NewState = "MenuState_Main"});
				else
					-- left and right switch frames.
					if param.Input == "Left" or param.Input == "Up" then
						MESSAGEMAN:Broadcast("PreviousIIDX15Frame");
					elseif param.Input == "Right" or param.Input == "Down" then
						MESSAGEMAN:Broadcast("NextIIDX15Frame");
					end;
				end;
			end;
		end;
		NextIIDX15FrameMessageCommand=function(self)
			local prevIndex = curIndex;
			curIndex = curIndex + 1;
			if curIndex > numFrames then curIndex = 1; end;

			MESSAGEMAN:Broadcast("IIDX15FrameChanged",{NewIIDX15Frame = frames[curIndex], NewIndex = curIndex, OldIndex = prevIndex});
		end;
		PreviousIIDX15FrameMessageCommand=function(self)
			local prevIndex = curIndex;
			curIndex = curIndex - 1;
			if curIndex < 1 then curIndex = numFrames; end;

			MESSAGEMAN:Broadcast("IIDX15FrameChanged",{NewIIDX15Frame = frames[curIndex], NewIndex = curIndex, OldIndex = prevIndex});
		end;
	};
};

-- preview icon

-- the menu
local menu = Def.ActorFrame{
	Name="IIDX15FrameMenu";
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
		if param.NewState == "MenuState_IIDX15Frame" then
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
	LoadActor("TROOPERS_default")..{
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
		IIDX15FrameChangedMessageCommand=function(self,param)
			if param.OldIndex == 1 then
				self:playcommand("LoseFocus");
			end;
			if param.NewIndex == 1 then
				self:playcommand("GainFocus");
			end;
		end;
	};

	LoadActor("TROOPERS_icarus")..{
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
		IIDX15FrameChangedMessageCommand=function(self,param)
			if param.OldIndex == 2 then
				self:playcommand("LoseFocus");
			end;
			if param.NewIndex == 2 then
				self:playcommand("GainFocus");
			end;
		end;
	};

	LoadActor("TROOPERS_kraken")..{
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
		IIDX15FrameChangedMessageCommand=function(self,param)
			if param.OldIndex == 3 then
				self:playcommand("LoseFocus");
			end;
			if param.NewIndex == 3 then
				self:playcommand("GainFocus");
			end;
		end;
	};

	LoadActor("TROOPERS_lion")..{
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
		IIDX15FrameChangedMessageCommand=function(self,param)
			if param.OldIndex == 4 then
				self:playcommand("LoseFocus");
			end;
			if param.NewIndex == 4 then
				self:playcommand("GainFocus");
			end;
		end;
	};

	LoadActor("TROOPERS_troopers")..{
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
		IIDX15FrameChangedMessageCommand=function(self,param)
			if param.OldIndex == 5 then
				self:playcommand("LoseFocus");
			end;
			if param.NewIndex == 5 then
				self:playcommand("GainFocus");
			end;
		end;
	};

	LoadActor("TROOPERS_scorpion")..{
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
		IIDX15FrameChangedMessageCommand=function(self,param)
			if param.OldIndex == 6 then
				self:playcommand("LoseFocus");
			end;
			if param.NewIndex == 6 then
				self:playcommand("GainFocus");
			end;
		end;
	};

	LoadActor("TROOPERS_mendes")..{
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
		IIDX15FrameChangedMessageCommand=function(self,param)
			if param.OldIndex == 7 then
				self:playcommand("LoseFocus");
			end;
			if param.NewIndex == 7 then
				self:playcommand("GainFocus");
			end;
		end;
	};
};

t[#t+1] = menu;

return t;