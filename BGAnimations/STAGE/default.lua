local t = Def.ActorFrame {
	LoadActor("bg_color") .. {
		InitCommand = function(self)
			self:x(320):y(SCREEN_CENTER_Y):diffusealpha(8)
		end,
	},
	Def.Sprite {
		InitCommand = function(self)
			self:LoadBackground(THEME:GetPathG("", "_selectbg.mp4"))
			self:scaletocover(0, 0, SCREEN_WIDTH, SCREEN_BOTTOM)
			self:sleep(0.25)
			self:smooth(0.5)
			self:diffusealpha(1)
		end
	},
	LoadActor("_songtitle") .. {
	},
	Def.Quad {
		InitCommand = function(self)
			self:diffuse(color("#FFFFFF")):x(320):y(SCREEN_CENTER_Y):zoomtowidth(SCREEN_WIDTH):zoomtoheight(
				SCREEN_HEIGHT):blend('BlendMode_Add')
		end,
		OnCommand = function(self)
			self:linear(.2):diffusealpha(0)
		end,
	},
	Def.Quad {
		InitCommand = function(self)
			self:diffuse(color("#000000")):x(320):y(SCREEN_CENTER_Y):zoomtowidth(SCREEN_WIDTH):zoomtoheight(
				SCREEN_HEIGHT)
		end,
		OnCommand = function(self)
			self:diffusealpha(0):sleep(2):linear(0.4):diffusealpha(.4)
		end,
	},
	Def.Quad {
		InitCommand = function(self)
			self:x(320):y(SCREEN_CENTER_Y):zoomtowidth(SCREEN_WIDTH):zoomtoheight(SCREEN_HEIGHT):diffuse(color("#000000"))
		end,
		OnCommand = function(self)
			self:diffusealpha(0):sleep(2.5):linear(0.3):diffusealpha(1)
		end,
	},
};

return t;
