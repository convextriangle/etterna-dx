local t = Def.ActorFrame {
    Name = "SearchTab",
    InitCommand = function(self)
        self:visible(false)
    end,
    TabChangedMessageCommand = function(self, params)
        self:visible(params.name == self:GetName())
    end,
}

t[#t + 1] = LoadActor("../tabdecorations/tab_background") .. {
    InitCommand = function(self)
        self:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
        self:zoom(0.45)
    end,
}

return t
