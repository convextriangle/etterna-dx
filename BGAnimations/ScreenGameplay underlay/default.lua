local framePref = GetUserPref("IIDX15Frame");

local playeroptions = GAMESTATE:GetPlayerState():GetPlayerOptions("ModsLevel_Preferred")
playeroptions:Mini(2 - playerConfig:get_data(pn_to_profile_slot(PLAYER_1)).ReceptorSize / 50)
local profile = PROFILEMAN:GetProfile(PLAYER_1)
local replaystate = GAMESTATE:GetPlayerState():GetPlayerController() == "PlayerController_Replay"
if profile:IsCurrentChartPermamirror() and not replaystate then -- turn on mirror if song is flagged as perma mirror
	playeroptions:Mirror(true)
end

setMovableKeymode(getCurrentKeyMode())
setCurExp(PLAYER_1)

local t = Def.ActorFrame {}
return t
