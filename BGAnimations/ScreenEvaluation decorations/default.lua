local t = Def.ActorFrame {}

t[#t + 1] = LoadActor("offset_plot") .. {
    OnCommand = function(self)
        self:zoom(1)
    end
}

t[#t + 1] = Def.GraphDisplay {
    InitCommand = function(self)
        self:xy(SCREEN_CENTER_X - 285, SCREEN_CENTER_Y - 155)
        self:zoomx(1.085):zoomy(0.675)
        self:Load("GraphDisplay"):draworder(3)
    end,
    BeginCommand = function(self)
        local ss = SCREENMAN:GetTopScreen():GetStageStats()
        self:Set(ss, ss:GetPlayerStageStats())
        self:diffusealpha(0.7)
        self:draworder(3)
    end,
}

return t
