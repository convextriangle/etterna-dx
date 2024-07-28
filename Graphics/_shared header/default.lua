local t = Def.ActorFrame {
    LoadActor("shadow.png") .. {
        InitCommand = function(self)
            self:x(SCREEN_CENTER_X)
            self:y(SCREEN_CENTER_Y)
            self:zoomx(0.45)
            self:zoomy(0.45)
        end
    }
};

return t;
