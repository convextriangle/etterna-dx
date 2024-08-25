local t = Def.ActorFrame {};

t[#t + 1] = StandardDecorationFromFileOptional("BannerFrame", "banner frame");
t[#t + 1] = StandardDecorationFromFileOptional("BPMDisplay", "BPMDisplay") .. {
	SetChartPreviewStateMessageCommand = function(self, params)
		self:visible(not params.visible)
	end,
}
t[#t + 1] = StandardDecorationFromFileOptional("TotalTime", "TotalTime");
t[#t + 1] = StandardDecorationFromFileOptional("DifficultyList", "DifficultyList") .. {
	SetChartPreviewStateMessageCommand = function(self, params)
		local song = GAMESTATE:GetCurrentSong()
		if not song then
			self:visible(false)
			return
		end
		self:visible(not params.visible)
	end,
}

t[#t + 1] = LoadActor("song_search");
t[#t + 1] = LoadActor("song_info");
t[#t + 1] = LoadActor("tabs");
--t[#t+1] = LoadActor("profile");

for pn in ivalues(PlayerNumber) do
	local MetricsName = "DifficultyIcon" .. PlayerNumberToString(pn);
	t[#t + 1] = StandardDecorationFromFile(MetricsName, MetricsName);
end;

return t
