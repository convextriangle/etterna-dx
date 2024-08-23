local t = Def.ActorFrame {
    Def.Sprite {
        OnCommand = function(self)
            self:finishtweening()

            if GAMESTATE:GetCurrentSong() and GAMESTATE:GetCurrentSong():GetBackgroundPath() then
                self:LoadBackground(GAMESTATE:GetCurrentSong():GetBackgroundPath())
            else
                self:LoadBackground(THEME:GetPathG("", "_selectbg.mp4"))
            end

            self:scaletocover(0, 0, SCREEN_WIDTH, SCREEN_BOTTOM):diffusealpha(0.4)
            self:sleep(0.5)
            self:decelerate(2)
        end
    }
};

return t;
