return Def.ActorFrame{
	LoadFont("system")..{
		InitCommand=function(self)
			self:x(SCREEN_CENTER_X+60):y(SCREEN_CENTER_Y+140):horizalign(right)
		end;
		OnCommand=function(self)
			self:diffusealpha(1)
		end;
		ComboChangedMessageCommand=function(self,params)
			local pss = params.PlayerStageStats
			self:settext("PGREAT : " ..string.format("%04.0f",pss:GetTapNoteScores('TapNoteScore_W2')) .. "\nGREAT : " ..string.format("%04.0f",pss:GetTapNoteScores('TapNoteScore_W3')) .. "\nGOOD : " ..string.format("%04.0f",pss:GetTapNoteScores('TapNoteScore_W4')) .. "\nBAD : " ..string.format("%04.0f",pss:GetTapNoteScores('TapNoteScore_W5')) .. "\nPOOR : " ..string.format("%04.0f",pss:GetTapNoteScores('TapNoteScore_Miss')))
		end
	};
}