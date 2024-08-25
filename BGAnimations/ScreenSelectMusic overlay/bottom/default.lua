local t = Def.ActorFrame {
    InitCommand = function(self)
        self:x(SCREEN_CENTER_X):y(SCREEN_BOTTOM - 10):visible(true)
        self:zoom(0.45)
        self:draworder(1024)
    end,

    LoadActor("_bottom"),
}

return t
