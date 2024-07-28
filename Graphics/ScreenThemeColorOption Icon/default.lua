local gc = Var("GameCommand");
local index = gc:GetIndex();
local name = gc:GetName();
local curColor = GetThemeColor();

local swatchSize = THEME:GetMetric("ScreenThemeColorOption","SwatchSize");

--[[
UpdateBackgroundColorMessageCommand=function(self,params)
			curColor = params.Color;
		end;
]]

local t = Def.ActorFrame{
	-- frame
	Def.Quad{
		InitCommand=function(self)
			self:zoomto(swatchSize,swatchSize):diffuse(color("0,0,0,1"))
		end;
	};
	-- swatch
	Def.Quad{
		InitCommand=function(self)
			self:zoomto(swatchSize-2,swatchSize-2)
		end;
		BeginCommand=function(self)
			-- if not exit use a color from the block
			if name == "Cancel" then
				self:diffuse( ColorMidTone(HSV(0,1,1)) );
			else
				self:diffuse( color(ThemeColors[name]) );
			end;
		end;
		GainFocusCommand=function(self)
			self:accelerate(0.15);
			local bcColor;
			if name == "Cancel" then
				self:diffuse( HSV(0,1,1) );
				bcColor = curColor;
			else
				self:diffuse( color(ThemeColors[name]) );
				bcColor = color(ThemeColors[name]);
			end;
			MESSAGEMAN:Broadcast("UpdateBackgroundColor", { Color = bcColor });
		end;
		LoseFocusCommand=function(self)
			self:stoptweening();
			self:accelerate(0.15);

			local c;
			if name == "Cancel" then
				c = ColorMidTone(HSV(0,1,1));
			else
				c = ColorMidTone( color(ThemeColors[name]) );
			end;
			self:diffuse(c);
		end;
		OffFocusedCommand=function(self)
			if name ~= "Cancel" then
				SetUserPref("ThemeColor",ThemeColors[name]);
			end;
		end;
	};
	-- TODO: add icon to exit item?
	-- name
	AutoText("frutiger")..{
		Text=name;
		InitCommand=function(self)
			self:y(swatchSize/1.5):zoom(0.75):shadowlength(0):NoStroke()
		end;
		GainFocusCommand=function(self)
			self:accelerate(0.15):diffuse(color("0,0,0,1"))
		end;
		LoseFocusCommand=function(self)
			self:stoptweening():accelerate(0.15):diffuse(color("0,0,0,0.35"))
		end;
	};
};

return t;