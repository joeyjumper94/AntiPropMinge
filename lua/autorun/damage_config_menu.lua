AddCSLuaFile()
hook.Add("PopulateToolMenu", "apm_damage_menu", function()
	spawnmenu.AddToolMenuOption(
		"Utilities",
		"APM",
		"APM Config menu",
		"APM config damage",
		"",
		"",
		function(panel)
			panel:Button("allow_prop_damage_0","apm_apm_allow_prop_damage","0")
			panel:Button("allow_prop_damage_1","apm_allow_prop_damage","1")
			panel:Button("allow_vehicle_damage_0","apm_allow_vehicle_damage","0")
			panel:Button("allow_vehicle_damage_1","apm_allow_vehicle_damage","1")
			panel:Button("allow_world_damage_0","apm_allow_world_damage","0")
			panel:Button("allow_world_damage_1","apm_allow_world_damage","1")
			panel:Button("freeze_all_anonymity_0","apm_freeze_all_anonymity","0")
			panel:Button("freeze_all_anonymity_1","apm_freeze_all_anonymity","1")
			panel:Button("freeze_on_damage_0","apm_freeze_on_damage","0")
			panel:Button("freeze_on_damage_1","apm_freeze_on_damage","1")
			panel:Button("nocollide_all_vehicles_0","apm_nocollide_all_vehicles","0")
			panel:Button("nocollide_all_vehicles_1","apm_nocollide_all_vehicles","1")
			panel:Button("nocollide_on_prop_damage_0","apm_nocollide_on_prop_damage","0")
			panel:Button("nocollide_on_prop_damage_1","apm_nocollide_on_prop_damage","1")
			panel:Button("nocollide_on_vehicle_damage_0","apm_nocollide_on_vehicle_damage","0")
			panel:Button("nocollide_on_vehicle_damage_1","apm_nocollide_on_vehicle_damage","1")
			panel:Button("notify_on_damage_0","apm_notify_on_damage","0")
			panel:Button("notify_on_damage_1","apm_notify_on_damage","1")
			panel:Button("notify_on_vehicle_damage_0","apm_notify_on_vehicle_damage","0")
			panel:Button("notify_on_vehicle_damage_1","apm_notify_on_vehicle_damage","1")
			panel:Button("map_ents_bypass_0","apm_map_ents_bypass","0")
			panel:Button("map_ents_bypass_1","apm_map_ents_bypass","1")
			panel:Button("print_damage_info_0","apm_print_damage_info","0")
			panel:Button("print_damage_info_1","apm_print_damage_info","1")
			panel:Button("prop_suicide_notification_0","apm_prop_suicide_notification","0")
			panel:Button("prop_suicide_notification_1","apm_prop_suicide_notification","1")
			panel:Button("remove_on_damage_0","apm_remove_on_damage","0")
			panel:Button("remove_on_damage_1","apm_remove_on_damage","1")
			panel:Button("strict_damage_check_0","apm_strict_damage_check","0")
			panel:Button("strict_damage_check_1","apm_strict_damage_check","1")

			panel:Button("unfreeze_ent_delay_0","apm_unfreeze_ent_delay","0")
			panel:Button("unfreeze_ent_delay_1","apm_unfreeze_ent_delay","1")
			panel:Button("unfreeze_ent_delay_2","apm_unfreeze_ent_delay","2")
			panel:Button("unfreeze_ent_delay_3","apm_unfreeze_ent_delay","3")
			panel:Button("unfreeze_ent_delay_4","apm_unfreeze_ent_delay","4")
			panel:Button("unfreeze_ent_delay_5","apm_unfreeze_ent_delay","5")
			panel:Button("unfreeze_ent_delay_6","apm_unfreeze_ent_delay","6")
			panel:Button("unfreeze_ent_delay_7","apm_unfreeze_ent_delay","7")
			panel:Button("unfreeze_ent_delay_8","apm_unfreeze_ent_delay","8")
			panel:Button("unfreeze_ent_delay_9","apm_unfreeze_ent_delay","9")
			panel:Button("unfreeze_ent_limit_1","apm_unfreeze_ent_limit","1")
			panel:Button("unfreeze_ent_limit_2","apm_unfreeze_ent_limit","2")
			panel:Button("unfreeze_ent_limit_3","apm_unfreeze_ent_limit","3")
			panel:Button("unfreeze_ent_limit_4","apm_unfreeze_ent_limit","4")
			panel:Button("unfreeze_ent_limit_5","apm_unfreeze_ent_limit","5")
			panel:Button("unfreeze_ent_limit_6","apm_unfreeze_ent_limit","6")
			panel:Button("unfreeze_ent_limit_7","apm_unfreeze_ent_limit","7")
			panel:Button("unfreeze_ent_limit_8","apm_unfreeze_ent_limit","8")
			panel:Button("unfreeze_ent_limit_9","apm_unfreeze_ent_limit","9")
			panel:Button("unfreeze_ent_limit_10","apm_unfreeze_ent_limit","10")
			panel:Button("unfreeze_ent_limit_11","apm_unfreeze_ent_limit","11")
			panel:Button("unfreeze_ent_limit_12","apm_unfreeze_ent_limit","12")
			panel:Button("unfreeze_ent_limit_13","apm_unfreeze_ent_limit","13")
			panel:Button("unfreeze_ent_limit_14","apm_unfreeze_ent_limit","14")
			panel:Button("unfreeze_ent_limit_15","apm_unfreeze_ent_limit","15")
			panel:Button("unfreeze_ent_limit_16","apm_unfreeze_ent_limit","16")
			panel:Button("unfreeze_ent_limit_17","apm_unfreeze_ent_limit","17")
			panel:Button("unfreeze_ent_limit_18","apm_unfreeze_ent_limit","18")
			panel:Button("unfreeze_ent_limit_19","apm_unfreeze_ent_limit","19")
			panel:Button("unfreeze_ent_limit_20","apm_unfreeze_ent_limit","20")
			panel:Button("reset APM to its default settings","apm_default_settings")
			panel:Button("load APM's save file","apm_load_settings")
		end,
		{}
	)
end)
if CLIENT then return end--no more client's beyond here
local function can(ply,str)
	local int=tonumber(str)
	if !int then--did they provide a string that cannot be turned into a number?
		if ply:IsValid() then--if it's a player in game, print it into chat
			ply:PrintMessage(HUD_PRINTTALK,"you need to also send a number argument")
		else--otherwise print to the server console
			print"you need to also send a number argument"
		end
		return false
	end
	if ply and ply:IsValid() and !ply:IsSuperAdmin() then--is it a non superadmin player?
		if !game.IsDedicated and ply:IsListenServerHost() then--is the player the host of a listen server?
			return int--if the player is the server host
		end
		ply:PrintMessage(HUD_PRINTTALK,"you need to be a superadmin or the server host to do that")
		return false--if they aren't the host nor a superadmin
	end
	return int--if they are a superadmin or the console of a dedicated server
end
concommand.Add("apm_allow_prop_damage",function(ply,cmd,args)
	local new=can(ply,args[1])--if the player is not allowed or if the argument is bad this'll return false, otherwise it'll return a number
	if !new then return end
	apm_tab.vars.allow_prop_damage=new
	apm_tab:save()
end)--decide if players can be lose health or die from prop damage
concommand.Add("apm_allow_vehicle_damage",function(ply,cmd,args)
	local new=can(ply,args[1])
	if !new then return end
	apm_tab.vars.allow_vehicle_damage=new
	apm_tab:save()
end)--decide if players can be lose health or die from getting hit by vehicles
concommand.Add("apm_allow_world_damage",function(ply,cmd,args)
	local new=can(ply,args[1])
	if !new then return end
	apm_tab.vars.allow_world_damage=new
	apm_tab:save()
end)--decide if players can be lose health or die from world damage
concommand.Add("apm_freeze_all_anonymity",function(ply,cmd,args)
	local new=can(ply,args[1])
	if !new then return end
	apm_tab.vars.freeze_all_anonymity=new
	apm_tab:save()
end)--decides if freezall is annonymous to non admins
concommand.Add("apm_freeze_on_damage",function(ply,cmd,args)
	local new=can(ply,args[1])
	if !new then return end	
	apm_tab.vars.freeze_on_damage=new
	apm_tab:save()
end)--decide whether to freeze a player's props if they damage someone
concommand.Add("apm_nocollide_all_vehicles",function(ply,cmd,args)
	local new=can(ply,args[1])
	if !new then return end
	apm_tab.vars.nocollide_all_vehicles=new
	apm_tab:save()
end)--how oftem should we check for cars that are not nocollided? set to 0 to disable
concommand.Add("apm_nocollide_on_prop_damage",function(ply,cmd,args)
	local new=can(ply,args[1])
	if !new then return end
	apm_tab.vars.nocollide_on_prop_damage=new
	apm_tab:save()
end)--decide whether to nocollide a player's prop if it damages someone
concommand.Add("apm_nocollide_on_vehicle_damage",function(ply,cmd,args)
	local new=can(ply,args[1])
	if !new then return end
	apm_tab.vars.nocollide_on_vehicle_damage=new
	apm_tab:save()
end)--decide whether to nocollide a player's car if it damages someone
concommand.Add("apm_notify_on_damage",function(ply,cmd,args)
	local new=can(ply,args[1])
	if !new then return end
	apm_tab.vars.notify_on_damage=new
	apm_tab:save()
end)--decide whether to notify admins if someone is damaged by a prop
concommand.Add("apm_notify_on_vehicle_damage",function(ply,cmd,args)
	local new=can(ply,args[1])
	if !new then return end
	apm_tab.vars.notify_on_vehicle_damage=new
	apm_tab:save()
end)--decide whether to notify admins if someone is damaged by a vehicle
concommand.Add("apm_map_ents_bypass",function(ply,cmd,args)
	local new=can(ply,args[1])
	if !new then return end
	apm_tab.vars.map_ents_bypass=new
	apm_tab:save()
end)--are map ents allowed to damage players?
concommand.Add("apm_print_damage_info",function(ply,cmd,args)
	local new=can(ply,args[1])
	if !new then return end
	apm_tab.vars.print_damage_info=new
	apm_tab:save()
end)--decide whether to print the damage info for debuging purposes
concommand.Add("apm_prop_suicide_notification",function(ply,cmd,args)
	local new=can(ply,args[1])
	if !new then return end
	apm_tab.vars.prop_suicide_notification=new
	apm_tab:save()
end)--decide whether to notify admins if someone is killed by their own prop
concommand.Add("apm_remove_on_damage",function(ply,cmd,args)
	local new=can(ply,args[1])
	if !new then return end
	apm_tab.vars.remove_on_damage=new
	apm_tab:save()
end)--decide whether to remove a player's prop if it damages someone
concommand.Add("apm_strict_damage_check",function(ply,cmd,args)
	local new=can(ply,args[1])
	if !new then return end
	apm_tab.vars.strict_damage_check=new
	apm_tab:save()
end)--decide if we use strict damage checks,it will block ALL sources of crush damage
concommand.Add("apm_unfreeze_ent_delay",function(ply,cmd,args)
	local new=can(ply,args[1])
	if !new then return end
	apm_tab.vars.unfreeze_ent_delay=new
	apm_tab:save()
end)--how many seconds must a player wait between using physgun?
concommand.Add("apm_unfreeze_ent_limit",function(ply,cmd,args)
	local new=can(ply,args[1])
	if !new then return end
	apm_tab.vars.unfreeze_ent_limit=new
	apm_tab:save()
end)--how many enitites can be unfrozen at once using physgun reload?
concommand.Add("apm_default_settings",function(ply,cmd,args)
	if !can(ply,"1") then return end
	include("apm/config.lua")
	apm_tab:delete()
end)
concommand.Add("apm_load_settings",function(ply,cmd,args)
	if !can(ply,"1") then return end
	apm_tab:load()
end)