function GetLocalProfiles()
	local ret = {};

	for p = 0,PROFILEMAN:GetNumLocalProfiles()-1 do
		local profile=PROFILEMAN:GetLocalProfileFromIndex(p);
		local item = Def.ActorFrame {
--[[ 			Def.Quad {
				InitCommand=function(self)
					self:zoomto(200,1):y(40/2)
				end;
				OnCommand=function(self)
					self:diffuse(Color('Outline'))
				end;
			}; --]]
			LoadFont("venacti/_venacti_outline 26px bold diffuse") .. {
				Text=profile:GetDisplayName();
				InitCommand=function(self)
					self:shadowlength(1):y(-9):zoom(0.55):maxwidth(300):ztest(true)
				end;
			};
			LoadFont("venacti/_venacti_outline 26px bold diffuse") .. {
				InitCommand=function(self)
					self:shadowlength(1):y(5):zoom(0.4):vertspacing(-8):maxwidth(300):ztest(true):diffuse(0.8,0.8,0.8,1)
				end;
				BeginCommand=function(self)
					local numSongsPlayed = profile:GetNumTotalSongsPlayed();
					local s = numSongsPlayed == 1 and "Song" or "Songs";
					-- todo: localize
					self:settext( numSongsPlayed.." "..s.." Played" );
				end;
			};
		};
		table.insert( ret, item );
	end;

	return ret;
end;



function LoadCard(cColor)
	local t = Def.ActorFrame {
		
		--[[LoadActor( THEME:GetPathG("ScreenSelectProfile","CardBackground") ) .. {
			InitCommand=function(self)
				self:diffuse(cColor)
			end;
		};
		LoadActor( THEME:GetPathG("ScreenSelectProfile","CardFrame") );
		
		
		
			LoadActor("panel")..{
				InitCommand=function(self)
					self:zoomx(0.6):zoomy(0.7):y(100):difuse(0.3,0.3,0.3,1)
				end;
			};
		]]


		
			

		};
	return t
end
function LoadPlayerStuff(Player)
	local ret = {};

	local pn = (Player == PLAYER_1) and 1 or 2;

--[[ 	local t = LoadActor(THEME:GetPathB('', '_frame 3x3'), 'metal', 200, 230) .. {
		Name = 'BigFrame';
	}; --]]
	local t = Def.ActorFrame {
		Name = 'JoinFrame';
		LoadCard(Color('Orange'));
--[[ 		Def.Quad {
			InitCommand=function(self)
				self:zoomto(200+4,230+4)
			end;
			OnCommand=function(self)
				self:shadowlength(1):diffuse(color("0,0,0,0.5"))
			end;
		};
		Def.Quad {
			InitCommand=function(self)
				self:zoomto(200,230)
			end;
			OnCommand=function(self)
				self:diffuse(Color('Orange')):diffusealpha(0.5)
			end;
		}; --]]
		LoadFont("Common Normal") .. {
			Text="Press &START; to join.";
			InitCommand=function(self)
				self:shadowlength(1)
			end;
			OnCommand=function(self)
				self:zoom(0.75):diffuseshift():effectcolor1(Color('White')):effectcolor2(color("0.5,0.5,0.5"))
			end;
		};
	};
	table.insert( ret, t );
	
	t = Def.ActorFrame {
		Name = 'BigFrame';
		LoadCard(PlayerColor(Player));
	};
	table.insert( ret, t );

--[[ 	t = LoadActor(THEME:GetPathB('', '_frame 3x3'), 'metal', 170, 20) .. {
		Name = 'SmallFrame';
	}; --]]

	
	t = Def.ActorFrame {
		Name = 'SmallFrame';
--[[ 		Def.Quad {
			InitCommand=function(self)
				self:zoomto(170+4,32+4)
			end;
			OnCommand=function(self)
				self:shadowlength(1)
			end;
		}; --]]
		InitCommand=function(self)
			self:y(-2)
		end;
		--Def.Quad {
		--	InitCommand=cmd(zoomto,200-10,40+2);
		--	OnCommand=cmd(diffuse,Color('Black');diffusealpha,0.5);
		--};
		Def.Quad {
			InitCommand=function(self)
				self:zoomto(200-10,40):blend(Blend.Add)
			end;
			OnCommand=function(self)
				self:diffuse(PlayerColor(Player)):fadeleft(0.25):faderight(0.25):glow(color("1,1,1,0.25"))
			end;
		};
		Def.Quad {
			InitCommand=function(self)
				self:zoomto(200-10,40):y(-40/2+20)
			end;
			OnCommand=function(self)
				self:diffuse(Color("Black")):fadebottom(1):diffusealpha(0.35)
			end;
		};
		Def.Quad {
			InitCommand=function(self)
				self:zoomto(200-10,1):y(-40/2+1):blend(Blend.Add)
			end;
			OnCommand=function(self)
				self:diffuse(PlayerColor(Player)):glow(color("1,1,1,0.25"))
			end;
		};	
	};
	

	
	table.insert( ret, t );

	t = Def.ActorScroller{
		Name = 'Scroller';
		NumItemsToDraw=3;
-- 		InitCommand=cmd(y,-230/2+20;);
		OnCommand=function(self)
			self:y(1):SetFastCatchup(true):SetMask(250,60):SetSecondsPerItem(0.15)
		end;
		TransformFunction=function(self, offset, itemIndex, numItems)
			local focus = scale(math.abs(offset),0,2,1,0);
			self:visible(false);
			self:y(math.floor( offset*40 ));
-- 			self:zoomy( focus );
-- 			self:z(-math.abs(offset));
-- 			self:zoom(focus);
		end;
		children = GetLocalProfiles();
	};
	table.insert( ret, t );
	
	t = Def.ActorFrame {
		Name = "EffectFrame";
	--[[ 		Def.Quad {
				InitCommand=function(self)
					self:y(-230/2):vertalign(top):zoomto(200,8):fadebottom(1)
				end;
				OnCommand=function(self)
					self:diffuse(Color("Black")):diffusealpha(0.25)
				end;
			};
			Def.Quad {
				InitCommand=function(self)
					self:y(230/2):vertalign(bottom):zoomto(200,8):fadetop(1)
				end;
				OnCommand=function(self)
					self:diffuse(Color("Black")):diffusealpha(0.25)
				end;
			}; --]]
	};
	table.insert( ret, t );
--[[ 	t = Def.BitmapText {
		OnCommand = function(self)
			self:y(160)
		end;
		Name = 'SelectedProfileText';
		Font = "Common Normal";
		Text = 'No profile';
	}; --]]
	
	--display name fora do quadrado
	t = LoadFont("venacti/_venacti_outline 26px bold diffuse") .. {
		Name = 'SelectedProfileText';
		--InitCommand=cmd(y,160;shadowlength,1;diffuse,PlayerColor(Player));
		InitCommand=function(self)
			self:y(30):maxwidth(270):zoom(0.6):shadowlength(1):uppercase(true)
		end;
	};
	table.insert( ret, t );

	return ret;
end;

function UpdateInternal3(self, Player)
	local pn = (Player == PLAYER_1) and 1 or 2;
	local frame = self:GetChild(string.format('P%uFrame', pn));
	local scroller = frame:GetChild('Scroller');
	local seltext = frame:GetChild('SelectedProfileText');
	local joinframe = frame:GetChild('JoinFrame');
	local smallframe = frame:GetChild('SmallFrame');
	local bigframe = frame:GetChild('BigFrame');
	
	if GAMESTATE:IsHumanPlayer(Player) then
		frame:visible(true);
		--using profile if any
		joinframe:visible(false);
		smallframe:visible(true);
		bigframe:visible(true);
		seltext:visible(true);
		scroller:visible(true);
		local ind = SCREENMAN:GetTopScreen():GetProfileIndex(Player);
		if ind > 0 then
			scroller:SetDestinationItem(ind-1);
			--seltext:settext(PROFILEMAN:GetLocalProfileFromIndex(ind-1):GetDisplayName());
			seltext:settext("");
		else
			if SCREENMAN:GetTopScreen():SetProfileIndex(Player, 1) then
				scroller:SetDestinationItem(0);
				self:queuecommand('UpdateInternal2');
			else
				joinframe:visible(true);
				smallframe:visible(false);
				bigframe:visible(false);
				scroller:visible(false);
				seltext:settext('No profile');
			end;
		end;
	else
		joinframe:visible(true);
		scroller:visible(false);
		seltext:visible(false);
		smallframe:visible(false);
		bigframe:visible(false);
	end;
end;

local t = Def.ActorFrame {


	StorageDevicesChangedMessageCommand=function(self, params)
		self:queuecommand('UpdateInternal2');
	end;

	CodeMessageCommand = function(self, params)
		if params.Name == 'Start' or params.Name == 'Center' then
			MESSAGEMAN:Broadcast("StartButton");
			if not GAMESTATE:IsHumanPlayer(params.PlayerNumber) then
				SCREENMAN:GetTopScreen():SetProfileIndex(params.PlayerNumber, -1);
			else
				SCREENMAN:GetTopScreen():Finish();
			end;
		end;
		if params.Name == 'Up' or params.Name == 'Up2' or params.Name == 'DownLeft' then
			if GAMESTATE:IsHumanPlayer(params.PlayerNumber) then
				local ind = SCREENMAN:GetTopScreen():GetProfileIndex(params.PlayerNumber);
				if ind > 1 then
					if SCREENMAN:GetTopScreen():SetProfileIndex(params.PlayerNumber, ind - 1 ) then
						MESSAGEMAN:Broadcast("DirectionButton");
						self:queuecommand('UpdateInternal2');
					end;
				end;
			end;
		end;
		if params.Name == 'Down' or params.Name == 'Down2' or params.Name == 'DownRight' then
			if GAMESTATE:IsHumanPlayer(params.PlayerNumber) then
				local ind = SCREENMAN:GetTopScreen():GetProfileIndex(params.PlayerNumber);
				if ind > 0 then
					if SCREENMAN:GetTopScreen():SetProfileIndex(params.PlayerNumber, ind + 1 ) then
						MESSAGEMAN:Broadcast("DirectionButton");
						self:queuecommand('UpdateInternal2');
					end;
				end;
			end;
		end;
		if params.Name == 'Back' then
			--if GAMESTATE:GetNumPlayersEnabled()==0 then
			SCREENMAN:GetTopScreen():Cancel();
			--else
				MESSAGEMAN:Broadcast("BackButton");
			--	SCREENMAN:GetTopScreen():SetProfileIndex(params.PlayerNumber, -2);
			--end;
		end;
	end;

	PlayerJoinedMessageCommand=function(self, params)
		self:queuecommand('UpdateInternal2');
	end;

	PlayerUnjoinedMessageCommand=function(self, params)
		self:queuecommand('UpdateInternal2');
	end;

	OnCommand=function(self, params)
		self:queuecommand('UpdateInternal2');
	end;

	UpdateInternal2Command=function(self)
		UpdateInternal3(self, PLAYER_1);
	end;

	children = {
	

		

	
	
		Def.ActorFrame {
			Name = 'P1Frame';
			InitCommand=function(self)
				self:x(SCREEN_CENTER_X-160):y(SCREEN_CENTER_Y+120)
			end;
			OnCommand=function(self)
				self:zoom(0):bounceend(0.35):zoom(1)
			end;
			OffCommand=function(self)
				self:bouncebegin(0.35):zoom(0)
			end;
			PlayerJoinedMessageCommand=function(self,param)
				if param.Player == PLAYER_1 then
					self:zoom(1.15):bounceend(0.175):zoom(1.0);
				end;
			end;
			children = LoadPlayerStuff(PLAYER_1);
		};
		
		
		-- sounds
		LoadActor( THEME:GetPathS("Common","start") )..{
			StartButtonMessageCommand=function(self)
				self:play()
			end;
		};
		LoadActor( THEME:GetPathS("Common","cancel") )..{
			BackButtonMessageCommand=function(self)
				self:play()
			end;
		};
		LoadActor( THEME:GetPathS("Common","value") )..{
			DirectionButtonMessageCommand=function(self)
				self:play()
			end;
		};
	};




};

return t;
