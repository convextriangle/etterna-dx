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
}

t[#t + 1] = LoadActor("utils")
t[#t + 1] = LoadActor("bgm")

t[#t + 1] = LoadActor(THEME:GetPathG("", "_shared header")) .. {
}

t[#t + 1] = Def.NoteFieldPreview {
    Name = "NoteField",
    DrawDistanceBeforeTargetsPixels = 600,
    DrawDistanceAfterTargetsPixels = 0,
    --YReverseOffsetPixels = 100,

    BeginCommand = function(self)
        self:zoom(0.5):draworder(90)
        self:xy(SCREEN_CENTER_X, SCREEN_CENTER_Y)
        self:GetParent():SortByDrawOrder()
        self:visible(false)
    end,
    CurrentStepsChangedMessageCommand = function(self, params)
        local steps = params.ptr
        -- only load new notedata if the preview is visible
        if self:GetParent():GetVisible() then
            self:playcommand("LoadNoteData", { steps = steps })
        end
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
    end,
}

return t
