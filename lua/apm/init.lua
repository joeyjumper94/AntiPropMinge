if CLIENT then 
	concommand.Add("rapm_freeze_my_stuff", function() RunConsoleCommand("freeze_my_props") end)
	concommand.Add("rapm_freeze_all_ents", function() RunConsoleCommand("freeze_everything") end)
end
if SERVER then
	include("freeze_everything.lua")
	include("freeze_my_props.lua")
	include("propkill_hook.lua")
end