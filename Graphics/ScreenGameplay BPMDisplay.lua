return Def.SongBPMDisplay {
	File=THEME:GetPathF("", "Gameplay BPM");
	Name="BPMDisplay";
	InitCommand=function(self)
		self:diffusealpha(1)
	end;
	SetCommand=function(self)
        self:SetFromGameState()
    end;
	CurrentSongChangedMessageCommand=function(self)
		self:playcommand("Set")
	end;
};
