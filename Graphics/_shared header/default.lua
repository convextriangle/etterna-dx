local t = Def.ActorFrame {
    LoadActor("shadow.png") .. {
        InitCommand = function(self)
            self:x(SCREEN_CENTER_X)
            self:y(SCREEN_CENTER_Y)
            self:zoom(0.45)
            self:draworder(4096)
        end
    }
};

return t;
