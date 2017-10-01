AddCSLuaFile()
--[[
	CreateConVar("apm_freeze_all_anonymity", "0", {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE}, "decides if freezall is annonymous to non admins")
	CreateConVar("apm_prop_suicide_notification", "1", {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE}, "decide whether to notify admins if someone is killed by their own prop")
	CreateConVar("apm_notify_on_vehicle_damage", "0", {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE}, "decide whether to notify admins if someone is damaged by a vehicle")
	CreateConVar("apm_print_damage_info", "0", {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE}, "decide whether to print the damage info for debuging purposes")

	--the convars below here have a pair of conole commands to turn them on/off
	CreateConVar("apm_freeze_on_damage", "0", {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE}, "decide whether to freeze a player's props if they damage someone")
	CreateConVar("apm_notify_on_damage", "0", {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE}, "decide whether to notify admins if someone is damaged by a prop")
	CreateConVar("apm_remove_on_damage", "0", {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE}, "decide whether to remove a player's prop if it damages someone")
	CreateConVar("apm_nocollide_on_prop_damage", "0", {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE}, "decide whether to nocollide a player's prop if it damages someone")
	CreateConVar("apm_nocollide_on_vehicle_damage", "0", {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE}, "decide whether to nocollide a player's car if it damages someone")
	CreateConVar("apm_allow_world_damage", "1", {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE}, "decide if players can be lose health or die from world damage")
	CreateConVar("apm_allow_prop_damage", "0", {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE}, "decide if players can be lose health or die from prop damage")
	CreateConVar("apm_allow_vehicle_damage", "1", {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE}, "decide if players can be lose health or die from getting hit by vehicles")--done
	CreateConVar("apm_strict_damage_check", "0", {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE}, "decide if we use strict damage checks, it will block ALL sources of crush damage")--done
]]
hook.Add("PopulateToolMenu", "apm_damage_menu", function()
	spawnmenu.AddToolMenuOption(
		"Utilities",
		"APM",
		"APM Config menu",
		"APM config damage",
		"",
		"",
		function(panel)

			panel:Button(
				"disable prop damage(SuperAdmin function)",
				"apm_disable_prop_damage"
			)
			panel:Button(
				"enable prop damage(SuperAdmin function)",
				"apm_enable_prop_damage"
			)

			panel:Button(
				"disable vehicle damage(SuperAdmin function)",
				"apm_disable_vehicle_damage"
			)
			panel:Button(
				"enable vehicle damage(SuperAdmin function)",
				"apm_enable_vehicle_damage"
			)

			panel:Button(
				"disable crush damage(SuperAdmin function)",
				"apm_disable_crush_damage"
			)
			panel:Button(
				"enable crush damage(SuperAdmin function)",
				"apm_enable_crush_damage"
			)

			panel:Button(
				"disable world crush damage(SuperAdmin function)",
				"apm_disable_world_crush_damage"
			)
			panel:Button(
				"enable world crush damage(SuperAdmin function)",
				"apm_enable_world_crush_damage"
			)

			panel:Button(
				"do nothing to props that hit players",
				"apm_props_damage_nothing"
			)
			panel:Button(
				"nocollide props that hit players",
				"apm_props_damage_nocollide"
			)
			panel:Button(
				"remove props that hit players",
				"apm_props_damage_remove"
			)

			panel:Button(
				"do nothing to cars that hit players",
				"apm_cars_damage_nothing"
			)
			panel:Button(
				"nocollide cars that hit players",
				"apm_cars_damage_nocollide"
			)
			
			panel:Button(
				"do not notify satff on damage",
				"apm_notify_staff_false"
			)
			panel:Button(
				"notify satff on damage",
				"apm_notify_staff_true"
			)

		end,
		{}
	)
end)

if SERVER then

	concommand.Add("apm_enable_freeze_on_damage", function(ply)
		if ply:IsValid() and !ply:IsSuperAdmin() then
			ply:PrintMessage(HUD_PRINTTALK, "you need to be a superadmin to do that")
			return
		end
		APM_Convar_MSG="a player's props will be frozen if they trigger the primary prop damage hook"
		apm_tab:EasyFPrint(APM_Convar_MSG,0)
		print(APM_Convar_MSG)
		RunConsoleCommand("apm_freeze_on_damage","1")
	end)
	concommand.Add("apm_disable_freeze_on_damage", function(ply)
		if ply:IsValid() and !ply:IsSuperAdmin() then
			ply:PrintMessage(HUD_PRINTTALK, "you need to be a superadmin to do that")
			return
		end
		APM_Convar_MSG="props will not be frozen if the damage hook is triggered"
		apm_tab:EasyFPrint(APM_Convar_MSG,0)
		print(APM_Convar_MSG)
		RunConsoleCommand("apm_freeze_on_damage","0")
	end)

	concommand.Add("apm_enable_prop_damage", function(ply)
		if ply:IsValid() and !ply:IsSuperAdmin() then
			ply:PrintMessage(HUD_PRINTTALK, "you need to be a superadmin to do that")
			return
		end
		APM_Convar_MSG="prop impact damage is now enabled"
		apm_tab:EasyFPrint(APM_Convar_MSG,0)
		print(APM_Convar_MSG)
		RunConsoleCommand("apm_allow_prop_damage","1")
	end)
	concommand.Add("apm_disable_prop_damage", function(ply)
		if ply:IsValid() and !ply:IsSuperAdmin() then
			ply:PrintMessage(HUD_PRINTTALK, "you need to be a superadmin to do that")
			return
		end
		APM_Convar_MSG="prop impact damage is now disabled"
		apm_tab:EasyFPrint(APM_Convar_MSG,0)
		print(APM_Convar_MSG)
		RunConsoleCommand("apm_allow_prop_damage","0")
	end)

	concommand.Add("apm_enable_world_crush_damage", function(ply)
		if ply:IsValid() and !ply:IsSuperAdmin() then
			ply:PrintMessage(HUD_PRINTTALK, "you need to be a superadmin to do that")
			return
		end
		APM_Convar_MSG="world crush damage is now enabled"
		apm_tab:EasyFPrint(APM_Convar_MSG,0)
		print(APM_Convar_MSG)
		RunConsoleCommand("apm_allow_world_damage","1")
	end)
	concommand.Add("apm_disable_world_crush_damage", function(ply)
		if ply:IsValid() and !ply:IsSuperAdmin() then
			ply:PrintMessage(HUD_PRINTTALK, "you need to be a superadmin to do that")
			return
		end
		APM_Convar_MSG="world crush damage is now disabled"
		apm_tab:EasyFPrint(APM_Convar_MSG,0)
		print(APM_Convar_MSG)
		RunConsoleCommand("apm_allow_world_damage","0")
	end)

	concommand.Add("apm_enable_vehicle_damage", function(ply)
		if ply:IsValid() and !ply:IsSuperAdmin() then
			ply:PrintMessage(HUD_PRINTTALK, "you need to be a superadmin to do that")
			return
		end
		APM_Convar_MSG="vehicle impact damage is now enabled"
		apm_tab:EasyFPrint(APM_Convar_MSG,0)
		print(APM_Convar_MSG)
		RunConsoleCommand("apm_allow_vehicle_damage","1")
	end)
	concommand.Add("apm_disable_vehicle_damage", function(ply)
		if ply:IsValid() and !ply:IsSuperAdmin() then
			ply:PrintMessage(HUD_PRINTTALK, "you need to be a superadmin to do that")
			return
		end
		APM_Convar_MSG="vehicle impact damage is now disabled"
		apm_tab:EasyFPrint(APM_Convar_MSG,0)
		print(APM_Convar_MSG)
		RunConsoleCommand("apm_allow_vehicle_damage","0")
	end)

	concommand.Add("apm_enable_crush_damage", function(ply)
		if ply:IsValid() and !ply:IsSuperAdmin() then
			ply:PrintMessage(HUD_PRINTTALK, "you need to be a superadmin to do that")
			return
		end
		APM_Convar_MSG="strict damage checks are now disabled"
		apm_tab:EasyFPrint(APM_Convar_MSG,0)
		print(APM_Convar_MSG)
		RunConsoleCommand("apm_strict_damage_check","0")
	end)
	concommand.Add("apm_disable_crush_damage", function(ply)
		if ply:IsValid() and !ply:IsSuperAdmin() then
			ply:PrintMessage(HUD_PRINTTALK, "you need to be a superadmin to do that")
			return
		end
		APM_Convar_MSG="strict damage checks are now enabled"
		apm_tab:EasyFPrint(APM_Convar_MSG,0)
		print(APM_Convar_MSG)
		RunConsoleCommand("apm_strict_damage_check","1")
	end)

	concommand.Add("apm_props_damage_nothing", function(ply)
		if ply:IsValid() and !ply:IsSuperAdmin() then
			ply:PrintMessage(HUD_PRINTTALK, "you need to be a superadmin to do that")
			return
		end
		APM_Convar_MSG="props that strike players will not be nocollided or removed"
		apm_tab:EasyFPrint(APM_Convar_MSG,0)
		print(APM_Convar_MSG)
		RunConsoleCommand("apm_remove_on_damage","0")
		RunConsoleCommand("apm_nocollide_on_prop_damage","0")
	end)
	concommand.Add("apm_props_damage_nocollide", function(ply)
		if ply:IsValid() and !ply:IsSuperAdmin() then
			ply:PrintMessage(HUD_PRINTTALK, "you need to be a superadmin to do that")
			return
		end
		APM_Convar_MSG="props that strike players will now be nocollided"
		apm_tab:EasyFPrint(APM_Convar_MSG,0)
		print(APM_Convar_MSG)
		RunConsoleCommand("apm_remove_on_damage","0")
		RunConsoleCommand("apm_nocollide_on_prop_damage","1")
	end)
	concommand.Add("apm_props_damage_remove", function(ply)
		if ply:IsValid() and !ply:IsSuperAdmin() then
			ply:PrintMessage(HUD_PRINTTALK, "you need to be a superadmin to do that")
			return
		end
		APM_Convar_MSG="props that strike players will now be removed"
		apm_tab:EasyFPrint(APM_Convar_MSG,0)
		print(APM_Convar_MSG)
		RunConsoleCommand("apm_remove_on_damage","1")
		RunConsoleCommand("apm_nocollide_on_prop_damage","0")
	end)

	concommand.Add("apm_cars_damage_nothing", function(ply)
		if ply:IsValid() and !ply:IsSuperAdmin() then
			ply:PrintMessage(HUD_PRINTTALK, "you need to be a superadmin to do that")
			return
		end
		APM_Convar_MSG="cars that strike players will not be nocollided"
		apm_tab:EasyFPrint(APM_Convar_MSG,0)
		print(APM_Convar_MSG)
		RunConsoleCommand("apm_nocollide_on_vehicle_damage","0")
	end)
	concommand.Add("apm_cars_damage_nocollide", function(ply)
		if ply:IsValid() and !ply:IsSuperAdmin() then
			ply:PrintMessage(HUD_PRINTTALK, "you need to be a superadmin to do that")
			return
		end
		APM_Convar_MSG="cars that strike players will be nocollided"
		apm_tab:EasyFPrint(APM_Convar_MSG,0)
		print(APM_Convar_MSG)
		RunConsoleCommand("apm_nocollide_on_vehicle_damage","1")
	end)

	concommand.Add("apm_notify_staff_false", function(ply)
		if ply:IsValid() and !ply:IsSuperAdmin() then
			ply:PrintMessage(HUD_PRINTTALK, "you need to be a superadmin to do that")
			return
		end
		APM_Convar_MSG="staff will no longer be notified when someone is throwing props"
		apm_tab:EasyFPrint(APM_Convar_MSG,0)
		print(APM_Convar_MSG)
		RunConsoleCommand("apm_notify_on_damage","0")
	end)
	concommand.Add("apm_notify_staff_true", function(ply)
		if ply:IsValid() and !ply:IsSuperAdmin() then
			ply:PrintMessage(HUD_PRINTTALK, "you need to be a superadmin to do that")
			return
		end
		APM_Convar_MSG="staff will now be notified if a prop strikes someone"
		apm_tab:EasyFPrint(APM_Convar_MSG,0)
		print(APM_Convar_MSG)
		RunConsoleCommand("apm_notify_on_damage","1")
	end)
	
end