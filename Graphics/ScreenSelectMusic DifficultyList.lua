-- todo: make the bar show top half of P1 and bottom half of P2 if both occupy
-- the same location.

return Def.StepsDisplayList {
	Name="StepsDisplayListRow";
	CurrentSongChangedMessageCommand=function(self)
		self:visible(GAMESTATE:GetCurrentSong() ~= nil);
	end;
	CursorP1 = Def.ActorFrame {
		InitCommand=function(self)
			self:player(PLAYER_1)
		end;
		OnCommand=function(self)
			self:addx(58):addy(9)
		end;
		HideCommand=function(self)
			self:linear(.1):zoomy(0)
		end;
		ShowCommand=function(self)
			self:linear(.1):zoomy(1)
		end;
		ChangeCommand=function(self)
			self:stoptweening():linear(0)
		end;
		MoveCommand=function(self)
			self:glow(color("1,1,1,1")):linear(.1):glow(color("1,1,1,0"))
		end;
		PlayerJoinedMessageCommand=function(self,param)
			if param.Player == PLAYER_1 then
				self:player(PLAYER_1);
				self:playcommand("Show");
			end;
		end;
		CurrentStepsP1ChangedMessageCommand=function(self)
			self:playcommand("PositionCheck")
		end;
		CurrentStepsP2ChangedMessageCommand=function(self)
			self:playcommand("PositionCheck")
		end;
		LoadActor( THEME:GetPathG("DifficultyList", "cursor") )..{
			CurrentStepsP1ChangedMessageCommand=function(self)
				self:playcommand("PositionCheck")
			end;
			CurrentStepsP2ChangedMessageCommand=function(self)
				self:playcommand("PositionCheck")
			end;
			PositionCheckCommand=function(self)
				-- only bother if > 1p
				if GAMESTATE:GetNumPlayersEnabled() > 1 then
					if GAMESTATE:GetCurrentSong() then
						local p1Steps = GAMESTATE:GetCurrentSteps(PLAYER_1);
						local p2Steps = GAMESTATE:GetCurrentSteps(PLAYER_2);
						if p1Steps:GetDifficulty() == p2Steps:GetDifficulty() then
							-- crops
							self:linear(0.25);
							self:cropbottom(0.5);
						else
							-- no crops
							self:linear(0.25);
							self:cropbottom(0);
						end;
					end;
				end;
			end;
		};
	};
	CursorP1Frame = Def.Actor{
		ChangeCommand=function(self)
			self:stoptweening():decelerate(0.125)
		end;
	};
};