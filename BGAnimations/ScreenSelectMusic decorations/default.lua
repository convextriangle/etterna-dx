local t = Def.ActorFrame{};

t[#t+1] = StandardDecorationFromFileOptional("BannerFrame","banner frame");
t[#t+1] = StandardDecorationFromFileOptional("BPMDisplay","BPMDisplay");
t[#t+1] = StandardDecorationFromFileOptional("TotalTime","TotalTime");
t[#t+1] = StandardDecorationFromFileOptional("DifficultyList","DifficultyList");

t[#t+1] = LoadActor("song_search");
t[#t+1] = LoadActor("song_info");
t[#t+1] = LoadActor("tabs");
--t[#t+1] = LoadActor("profile");

for pn in ivalues(PlayerNumber) do
	local MetricsName = "DifficultyIcon"..PlayerNumberToString(pn);
	t[#t+1] = StandardDecorationFromFile(MetricsName,MetricsName);
end;

return t
