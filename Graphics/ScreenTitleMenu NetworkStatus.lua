local netConnected = IsNetConnected();
local loggedOnSMO = IsNetSMOnline();

local t = Def.ActorFrame{
	LoadFont("system") .. {
		InitCommand=function(self)
			self:uppercase(true):zoom(1):horizalign(left)
		end;
		BeginCommand=function(self)
			-- check network status
			if netConnected then
				self:diffuse( color("0.95,0.975,1,1") );
				self:diffusebottomedge( color("0.72,0.89,1,1") );
				self:settext( Screen.String("Network OK") );
			else
				self:diffuse( color("0.75,0.75,0.75,1") );
				self:settext( Screen.String("Offline") );
			end;
		end;
	};
};

if netConnected then
	t[#t+1] = LoadFont("system") .. {
		InitCommand=function(self)
			self:y(14):horizalign(left):zoom(1):diffuse(color("0.72,0.89,1,1"))
		end;
		BeginCommand=function(self)
			self:settext( string.format(Screen.String("Connected to %s"), GetServerName()) );
		end;
	};
end;

return t;