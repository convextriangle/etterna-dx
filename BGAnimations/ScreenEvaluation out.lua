local t = Def.ActorFrame {
    LoadActor(THEME:GetPathG("", "_shutter.mp4")) .. {
        InitCommand = function(self)
            self:scaletocover(0, 0, SCREEN_WIDTH, SCREEN_BOTTOM)
        end,
        OnCommand = function(self)
            self:smooth(1)
            self:diffusealpha(1)
        end
    }
};

return t;
