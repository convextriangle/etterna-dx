local t = Def.ActorFrame {
    Def.Sprite {
        OnCommand = function(self)
            self:finishtweening()

            self:LoadBackground(THEME:GetPathG("", "_selectbg.mp4"))

            self:scaletocover(0, 0, SCREEN_WIDTH, SCREEN_BOTTOM)
            self:diffusealpha(0.7)
            self:sleep(0.5)
            self:decelerate(2)
        end
    }
};

return t;
