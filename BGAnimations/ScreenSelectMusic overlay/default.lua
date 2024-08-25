local t = Def.ActorFrame {}

t[#t + 1] = LoadActor("../_cursor")
t[#t + 1] = LoadActor("utils")
t[#t + 1] = LoadActor("bgm")
t[#t + 1] = LoadActor("tabs")


t[#t + 1] = LoadActor("bottom")
t[#t + 1] = LoadActor(THEME:GetPathG("", "_shared header")) .. {
}


return t
