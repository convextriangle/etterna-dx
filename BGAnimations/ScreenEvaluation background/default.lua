local t = Def.ActorFrame {
    Def.Sprite {
        OnCommand = function(self)
            if GAMESTATE:GetCurrentSong() and GAMESTATE:GetCurrentSong():GetBackgroundPath() then
                self:finishtweening()
                self:visible(true)
                self:LoadBackground(GAMESTATE:GetCurrentSong():GetBackgroundPath())
                self:scaletocover(0, 0, SCREEN_WIDTH, SCREEN_BOTTOM)
                self:sleep(0.5)
                self:decelerate(2)
                self:diffusealpha(1)
            else
                self:visible(false)
            end
        end
    }
};

return t;
