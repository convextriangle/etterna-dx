local chart_preview
local visibility

local chartPreviewCallback = function(event)
    if event.type == "InputEventType_Release" or event.DeviceInput.button ~= "DeviceButton_space" then
        return
    end

    if GAMESTATE:GetCurrentSong() == nil then
        return
    end

    visibility = not visibility
    -- do something
    if visibility then
        MESSAGEMAN:Broadcast("TabChanged", { name = "ChartPreviewTab" })
    else
        -- well i could implement a tab stack of some sort so you *could*
        -- go back to the tab you were at before but i'm not bothering with that
        -- (make a pull request if you want)
        MESSAGEMAN:Broadcast("TabChanged", { name = "MainTab" })
    end
end

local t = Def.ActorFrame {
    Name = "ChartPreviewTab",
    InitCommand = function(self)
        self:xy(SCREEN_CENTER_X - 200, SCREEN_CENTER_Y + 20)
    end,
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
        self:visible(false)
        MESSAGEMAN:Broadcast("SetChartPreviewState", { visible = visibility })
    end,
    TabChangedMessageCommand = function(self, params)
        visibility = params.name == self:GetName()
        self:visible(visibility)
        MESSAGEMAN:Broadcast("SetChartPreviewState", { visible = visibility })
    end,
}

t[#t + 1] = Def.Quad {
    InitCommand = function(self)
        --self:visible(false)
        self:zoomto(200, 300)
        self:diffuse(color("#232323A0"))
        self:draworder(2)
    end,
    SetChartPreviewStateMessageCommand = function(self, params)
        self:visible(params.visible)
    end,
}

t[#t + 1] = LoadActor("../tabdecorations/tab_background") .. {
    InitCommand = function(self)
        self:zoomx(0.4)
        self:zoomtoheight(340)
        self:draworder(1)
    end,
    SetChartPreviewStateMessageCommand = function(self, params)
        self:visible(params.visible)
    end,
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
        self:visible(false)
        self:addx(-100):addy(-150)
        self:draworder(92)
    end,
    LoadNoteDataCommand = function(self, params)
        local steps = params.steps
        if steps ~= nil then
            self:playcommand("LoadDensityGraph", { steps = steps, song = params.song })
            self:draworder(92)
        end
    end,
    SetChartPreviewStateMessageCommand = function(self, params)
        self:visible(params.visible)
        if params.visible then
            self:playcommand("LoadNoteData", { steps = GAMESTATE:GetCurrentSteps(), song = GAMESTATE:GetCurrentSong() })
            self:draworder(92)
        end
    end,
}

t[#t + 1] = Def.NoteFieldPreview {
    Name = "NoteField",
    DrawDistanceBeforeTargetsPixels = 400,
    DrawDistanceAfterTargetsPixels = 0,

    BeginCommand = function(self)
        self:zoom(0.5):draworder(90)
        self:addy(10)
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
