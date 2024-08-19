local t = Def.ActorFrame {}

t[#t + 1] = LoadActor("offset_plot") .. {
    OnCommand = function(self)
        self:zoom(1)
    end
}

return t
