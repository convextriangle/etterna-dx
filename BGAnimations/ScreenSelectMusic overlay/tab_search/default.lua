local searchstring = ""
local lastsearchstring = ""
local colors = { color("#FFFFFF"), color("#FFFFFF"), color("#232323"), color("#232323") }
local wheel

local function searcher(event)
    if event.type ~= "InputEventType_Release" then
        if event.DeviceInput.button == "DeviceButton_space" then -- add space to the string
            searchstring = searchstring .. " "
        elseif event.DeviceInput.button == "DeviceButton_backspace" then
            searchstring = searchstring:sub(1, -2) -- remove the last element of the string
        elseif event.DeviceInput.button == "DeviceButton_delete" then
            searchstring = ""
        elseif event.DeviceInput.button == "DeviceButton_=" then
            searchstring = searchstring .. "="
        else
            local CtrlPressed = INPUTFILTER:IsControlPressed()
            if event.DeviceInput.button == "DeviceButton_v" and CtrlPressed then
                searchstring = searchstring .. HOOKS:GetClipboard()
            elseif
            --if not nil and (not a number or (ctrl pressed and not online))
                event.char and event.char:match('[%%%+%-%!%@%#%$%^%&%*%(%)%=%_%.%,%:%;%\'%"%>%<%?%/%~%|%w]') and
                (not tonumber(event.char) or CtrlPressed)
            then
                searchstring = searchstring .. event.char
            end
        end
        if lastsearchstring ~= searchstring then
            lastsearchstring = searchstring
            MESSAGEMAN:Broadcast("UpdateSearchString")
        end
    end
end

local t = Def.ActorFrame {
    Name = "SearchTab",
    InitCommand = function(self)
        self:visible(false)
    end,
    TabChangedMessageCommand = function(self, params)
        local visible = params.name == self:GetName()
        self:visible(visible)

        if visible then
            SCREENMAN:set_input_redirected(PLAYER_1, true)
        else
            SCREENMAN:set_input_redirected(PLAYER_1, false)
            searchstring = ""
            lastsearchstring = ""
            MESSAGEMAN:Broadcast("UpdateSearchString")
        end
    end,
    OnCommand = function(self)
        SCREENMAN:GetTopScreen():AddInputCallback(searcher)
        wheel = SCREENMAN:GetTopScreen():GetMusicWheel()
    end,
    StartSearchMessageCommand = function(self)
        wheel:SongSearch(searchstring)
    end,
    EndSearchMessageCommand = function(self)
        searchstring = ""
        lastsearchstring = ""
        MESSAGEMAN:Broadcast("UpdateSearchString")
        wheel:SongSearch(searchstring)
    end,
}

t[#t + 1] = LoadActor("../tabdecorations/tab_background") .. {
    InitCommand = function(self)
        self:xy(SCREEN_CENTER_X - 185, SCREEN_CENTER_Y + 40)
        self:zoomx(0.75):zoomy(0.15)
    end,
}

t[#t + 1] = Def.ActorFrame {
    InitCommand = function(self)
        self:xy(SCREEN_CENTER_X - 170, SCREEN_CENTER_Y + 40)
    end,

    LoadFont("handel/handel 24px") .. {
        InitCommand = function(self)
            self:addx(0):addy(-30)
            self:zoom(0.5)
            self:maxwidth(600)
            self:settext("Start typing! Your search will appear here")
            self:AddAttribute(0, { Length = -1, Diffuses = colors })
        end,
        UpdateSearchStringMessageCommand = function(self)
            if searchstring == "" then
                self:settext("Start typing! Your search will appear here")
            else
                self:settext(searchstring)
            end
            self:AddAttribute(0, { Length = -1, Diffuses = colors })
        end,
    },

    LoadFont("handel/handel 24px") .. {
        InitCommand = function(self)
            self:addy(30)
            self:settext("End search")
        end,
    },
    LoadFont("handel/handel 24px") .. {
        InitCommand = function(self)
            self:settext("Search!")
        end,
    },
}

-- search buttons
t[#t + 1] = Def.ActorFrame {
    InitCommand = function(self)
        self:xy(SCREEN_CENTER_X - 170, SCREEN_CENTER_Y + 40)
    end,

    UIElements.QuadButton(1, 1) .. {
        InitCommand = function(self)
            self:zoomx(100):zoomy(20)
            self:diffusealpha(0)
        end,
        MouseDownCommand = function(self, params)
            if params.event ~= "DeviceButton_left mouse button" then return end
            MESSAGEMAN:Broadcast("StartSearch", {})
        end,
    },
    UIElements.QuadButton(1, 1) .. {
        InitCommand = function(self)
            self:addy(30)
            self:zoomx(150):zoomy(20)
            self:diffusealpha(0)
        end,
        MouseDownCommand = function(self, params)
            if params.event ~= "DeviceButton_left mouse button" then return end
            MESSAGEMAN:Broadcast("EndSearch", {})
        end,
    },
}

return t
