local t = Def.ActorFrame {}
local tab_corner_x = -250

t[#t + 1] = LoadActor("tab_main")
t[#t + 1] = LoadActor("tab_chartpreview")

-- tab display text
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
            self:settext("SEARCH")
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

-- tab banner buttons
t[#t + 1] = Def.ActorFrame {
    InitCommand = function(self)
        self:xy(SCREEN_CENTER_X - 170, SCREEN_CENTER_Y - 200)
        self:zoomx(0.8)
    end,

    UIElements.QuadButton(1, 1) .. {
        Name = "MainTabButton",
        InitCommand = function(self)
            self:zoomx(30):zoomy(10)
            self:addy(10)
            self:addx(tab_corner_x)
            self:diffusealpha(0)
        end,
        MouseDownCommand = function(self, params)
            if params.event ~= "DeviceButton_left mouse button" then return end
            MESSAGEMAN:Broadcast("TabChanged", { name = "MainTab" })
        end,
    },
    UIElements.QuadButton(1, 1) .. {
        Name = "MSDTabButton",
        InitCommand = function(self)
            self:zoomx(30):zoomy(10)
            self:addy(10)
            self:addx(tab_corner_x + 50)
            self:diffusealpha(0)
        end,
        MouseDownCommand = function(self, params)
            if params.event ~= "DeviceButton_left mouse button" then return end
            MESSAGEMAN:Broadcast("TabChanged", { name = "MSDTab" })
        end,
    },
    UIElements.QuadButton(1, 1) .. {
        Name = "ProfileTabButton",
        InitCommand = function(self)
            self:zoomx(55):zoomy(10)
            self:addy(10)
            self:addx(tab_corner_x + 110)
            self:diffusealpha(0)
        end,
        MouseDownCommand = function(self, params)
            if params.event ~= "DeviceButton_left mouse button" then return end
            MESSAGEMAN:Broadcast("TabChanged", { name = "ProfileTab" })
        end,
    },
    UIElements.QuadButton(1, 1) .. {
        Name = "FilterTabButton",
        InitCommand = function(self)
            self:zoomx(50):zoomy(10)
            self:addy(10)
            self:addx(tab_corner_x + 180)
            self:diffusealpha(0)
        end,
        MouseDownCommand = function(self, params)
            if params.event ~= "DeviceButton_left mouse button" then return end
            MESSAGEMAN:Broadcast("TabChanged", { name = "FilterTab" })
        end,
    },
    UIElements.QuadButton(1, 1) .. {
        Name = "SearchTabButton",
        InitCommand = function(self)
            self:zoomx(70):zoomy(10)
            self:addy(10)
            self:addx(tab_corner_x + 260)
            self:diffusealpha(0)
        end,
        MouseDownCommand = function(self, params)
            if params.event ~= "DeviceButton_left mouse button" then return end
            MESSAGEMAN:Broadcast("TabChanged", { name = "SearchTab" })
        end,
    },
    UIElements.QuadButton(1, 1) .. {
        Name = "RandomSongButton",
        InitCommand = function(self)
            self:zoomx(100):zoomy(10)
            self:addy(10)
            self:addx(tab_corner_x + 360)
            self:diffusealpha(0)
        end,
        MouseDownCommand = function(self, params)
            if params.event ~= "DeviceButton_left mouse button" then return end

            MESSAGEMAN:Broadcast("TabChanged", { name = "MainTab" })
            local wheel = SCREENMAN:GetTopScreen():GetMusicWheel()
            -- random pack songs
            local song = GAMESTATE:GetCurrentSong()
            if GAMESTATE:GetSortOrder() == "SortOrder_Group" and song ~= nil then
                local group = song:GetGroupName()
                local s = wheel:GetSongsInGroup(group)
                if #s == 0 then return end
                local rsong = s[math.random(#s)]
                wheel:SelectSong(rsong)
            end
        end,
    },
}

return t
