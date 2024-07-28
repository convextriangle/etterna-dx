local t = Def.ActorFrame{
	LoadActor("LIFE_P1")..{
		InitCommand=function(self)
			self:x(0):y(0)
		end;
	};
	LoadActor("2dx")..{
		InitCommand=function(self)
			self:diffuse(.3,.3,.3,1):x(3):y(15)
		end;
	};
	LoadActor("2dx")..{
		InitCommand=function(self)
			self:x(3):y(15)
		end;
		LifeChangedMessageCommand=function(self,param)
			if param.Player == PLAYER_1 then
				local life = param.LifeMeter:GetLife();
				self:cropright(1 - life);
			end;
		end;
	};
	-- tip
	LoadActor("tip")..{
		InitCommand=function(self)
			self:diffuseblink():effectperiod(0.16):effectcolor1(color("1,1,1,1")):effectcolor2(color("1,1,1,0")):x(-1):y(15)
		end;
		LifeChangedMessageCommand=function(self,param)
			if param.Player == PLAYER_1 then
				local life = param.LifeMeter:GetLife();
				self:cropright(1 - life);
				self:cropleft(life - 0.02);
			end;
		end;
	};
	LoadActor("tip")..{
		InitCommand=function(self)
			self:diffuseblink():effectperiod(0.1):effectcolor1(color("1,1,1,1")):effectcolor2(color("1,1,1,0")):x(-5):y(15)
		end;
		LifeChangedMessageCommand=function(self,param)
			if param.Player == PLAYER_1 then
				local life = param.LifeMeter:GetLife();
				self:cropright(1 - life);
				self:cropleft(life - 0.02);
			end;
		end;
	};
	Def.BitmapText { File = "Life Percent.ini" }..{
		InitCommand=function(self)
			self:x(92):y(42):horizalign(right)
		end;
		LifeChangedMessageCommand=function(self,param)
			if param.Player == PLAYER_1 then
				local life = param.LifeMeter:GetLife();
				self:settextf("%.0f%%", life*100);
			end;
		end;
	};
	LoadActor("SP_BLINE")..{
		InitCommand=function(self)
			self:x(78):y(-37):blend('BlendMode_Add')
		end;
		OnCommand=function(self)
			self:diffusealpha(0)
		end;
		FlashMessageCommand=function(self)
			self:stoptweening():diffusealpha(1):diffuseblink():effectcolor1(color("1,1,1,1")):effectcolor2(color("1,1,1,0")):effectperiod(0.06):sleep(.3):diffusealpha(0)
		end;
		JudgmentMessageCommand=function(self,params)
			if params.TapNoteScore == 'TapNoteScore_Miss'
			then
				MESSAGEMAN:Broadcast("Miss");
				self:visible(false)
			else
				MESSAGEMAN:Broadcast("Flash");
				self:visible(true)
			end
		end
	};
};

return t;