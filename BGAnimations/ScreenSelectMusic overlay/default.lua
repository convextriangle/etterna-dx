local chart_preview
local visibility

local chartPreviewCallback = function(event)
    if event.type == "InputEventType_Release" or event.DeviceInput.button ~= "DeviceButton_space" then
        return
    end

    visibility = not visibility
    -- do something
    MESSAGEMAN:Broadcast("SetChartPreviewState", { visible = visibility })
end

local t = Def.ActorFrame {
    OnCommand = function(self)
        local screen = SCREENMAN:GetTopScreen()
        if screen == nil then
            return
        end
        visibility = false
        screen:AddInputCallback(chartPreviewCallback)
    end,
    CurrentStepsChangedMessageCommand = function(self, params)
        visibility = false
        MESSAGEMAN:Broadcast("SetChartPreviewState", { visible = visibility })
    end,
}

t[#t + 1] = LoadActor("../_cursor")
t[#t + 1] = LoadActor("utils")
t[#t + 1] = LoadActor("bgm")

local tab_corner_x = -250

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
        Name = "PlaylistTabButton",
        InitCommand = function(self)
            self:zoomx(70):zoomy(10)
            self:addy(10)
            self:addx(tab_corner_x + 260)
            self:diffusealpha(0)
        end,
        MouseDownCommand = function(self, params)
            if params.event ~= "DeviceButton_left mouse button" then return end
            MESSAGEMAN:Broadcast("TabChanged", { name = "PlaylistTab" })
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

t[#t + 1] = LoadActor("bottom") .. {
    InitCommand = function(self)
        self:x(SCREEN_CENTER_X):y(SCREEN_BOTTOM - 10):visible(true)
        self:zoom(0.45)
        self:draworder(1024)
    end
}

t[#t + 1] = LoadActor(THEME:GetPathG("", "_shared header")) .. {
}

t[#t + 1] = LoadActorWithParams("chordDensityGraph", {
    sizing = {
        Width = 200,
        Height = 50,
        NPSThickness = 2,
        TextSize = 0.65,
    }
}) .. {
    InitCommand = function(self)
        self:xy(SCREEN_CENTER_X - 150, SCREEN_CENTER_Y - 200)
        self:visible(false)
    end,
    LoadNoteDataCommand = function(self, params)
        local steps = params.steps
        if steps ~= nil then
            self:playcommand("LoadDensityGraph", { steps = steps, song = params.song })
        else
            self:playcommand("LoadDensityGraph", { steps = steps, song = params.song })
        end
    end,
    SetChartPreviewStateMessageCommand = function(self, params)
        self:visible(params.visible)
        if self:GetVisible() then
            self:playcommand("LoadNoteData", { steps = GAMESTATE:GetCurrentSteps(), song = GAMESTATE:GetCurrentSong() })
        end
    end,
}

t[#t + 1] = Def.NoteFieldPreview {
    Name = "NoteField",
    DrawDistanceBeforeTargetsPixels = 400,
    DrawDistanceAfterTargetsPixels = 0,
    --YReverseOffsetPixels = 100,

    BeginCommand = function(self)
        self:zoom(0.5):draworder(90)
        self:xy(SCREEN_CENTER_X - 50, SCREEN_CENTER_Y - 20)
        self:GetParent():SortByDrawOrder()
        self:visible(false)
    end,
    LoadNoteDataCommand = function(self, params)
        local steps = params.steps
        if steps ~= nil then
            self:LoadNoteData(steps)
        else
            self:LoadDummyNoteData()
        end
    end,
    SetChartPreviewStateMessageCommand = function(self, params)
        self:visible(params.visible)
        if self:GetVisible() then
            self:playcommand("LoadNoteData", { steps = GAMESTATE:GetCurrentSteps() })
        end
    end,
}

return t
