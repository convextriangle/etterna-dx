--Code by Daisuke Master

return Def.ActorFrame {
    LoadFont("BPMDisplay") .. { Name = "bpmtxt" },
    LoadActor("_bpm label") .. { Name = "bpmlbl" },
    InitCommand = function(self)
        --GetChild gets an actor so you can put commands on it and get values from it too
        self:GetChild("bpmtxt"):horizalign(right)
        self:GetChild("bpmlbl"):horizalign(left)
    end,
    CurrentSongChangedMessageCommand = function(self)
        local song = GAMESTATE:GetCurrentSong()
        --get out if no song
        if not song then
            self:diffusealpha(0);
            return
        end
        --things
        local bpm = song:GetDisplayBpms()
        local text = ""
        text = string.format("%d", bpm[1])
        --setting the text
        self:diffusealpha(1)
        self:GetChild("bpmtxt"):settext(text);
        --get the width *after* setting the text
        local width = self:GetChild("bpmtxt"):GetWidth();
        --make adjustments here
        self:GetChild("bpmlbl"):x(-width - 118)
    end,
}
