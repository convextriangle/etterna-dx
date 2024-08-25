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

t[#t + 1] = LoadActor("utils")
t[#t + 1] = LoadActor("bgm")

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
