local t = Def.ActorFrame {};
local tab_corner_x = -250

t[#t + 1] = LoadActor("tab_main")

t[#t + 1] = Def.ActorFrame {
    InitCommand = function(self)
        self:xy(SCREEN_CENTER_X - 170, SCREEN_CENTER_Y - 200)
        self:zoomx(0.8)
        MESSAGEMAN:Broadcast("TabChanged", { name = "MainTab" })
    end,

    LoadActor("tab_banner") .. {
        InitCommand = function(self)
            self:addx(-50)
            self:zoomx(0.85)
        end
    },
    LoadFont("handel/handel 24px") .. {
        InitCommand = function(self)
            self:settext("TABS"):zoom(0.5)
            self:addy(-15):addx(-260)
        end,
    },
    LoadFont("handel/handel 24px") .. {
        InitCommand = function(self)
            self:addy(10)
            self:addx(tab_corner_x)
            self:zoom(0.5)
            self:settext("MAIN")
        end,
    },
    LoadFont("handel/handel 24px") .. {
        InitCommand = function(self)
            self:addy(10)
            self:addx(tab_corner_x + 50)
            self:zoom(0.5)
            self:settext("MSD")
        end,
    },
    LoadFont("handel/handel 24px") .. {
        InitCommand = function(self)
            self:addy(10)
            self:addx(tab_corner_x + 110)
            self:zoom(0.5)
            self:settext("PROFILE")
        end,
    },
    LoadFont("handel/handel 24px") .. {
        InitCommand = function(self)
            self:addy(10)
            self:addx(tab_corner_x + 180)
            self:zoom(0.5)
            self:settext("FILTERS")
        end,
    },
    LoadFont("handel/handel 24px") .. {
        InitCommand = function(self)
            self:addy(10)
            self:addx(tab_corner_x + 260)
            self:zoom(0.5)
            self:settext("PLAYLISTS")
        end,
    },
    LoadFont("handel/handel 24px") .. {
        InitCommand = function(self)
            self:addy(10)
            self:addx(tab_corner_x + 360)
            self:zoom(0.5)
            self:settext("RANDOM SONG")
        end,
    },
}


return t
