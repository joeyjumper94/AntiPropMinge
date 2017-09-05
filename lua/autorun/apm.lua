if SERVER then
	local file="apm/init.lua"
	include(file)
	AddCSLuaFile()
end
AddCSLuaFile()
if CLIENT then
	concommand.Add("apm_freeze_my_stuff", function() RunConsoleCommand("freeze_my_props") end)
	concommand.Add("apm_freeze_all_ents", function() RunConsoleCommand("freeze_everything") end)
end
CreateConVar("apm_freeze_all_anonymity", "0", {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE}, "decides if freezall is annonymous to non admins")
CreateConVar("apm_prop_suicide_notification", "1", {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE}, "decide whether to notify admins if someone is killed by their own prop")
