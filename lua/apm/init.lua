if SERVER then
	include("freeze_everything.lua")
	include("freeze_my_props.lua")
	include("propkill_hook.lua")
	include("prop_damage_hook.lua")
	include("vehicle_damage_hook.lua")
	include("apm_util.lua")
end

CreateConVar("apm_freeze_all_anonymity", "0", {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE}, "decides if freezall is annonymous to non admins")
CreateConVar("apm_prop_suicide_notification", "1", {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE}, "decide whether to notify admins if someone is killed by their own prop")
CreateConVar("apm_notify_on_damage", "0", {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE}, "decide whether to notify admins if someone is damaged by a prop")
CreateConVar("apm_freeze_on_damage", "0", {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE}, "decide whether to freeze a player's props if they damage someone")
CreateConVar("apm_allow_prop_damage", "0", {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE}, "decide if players can be lose health or die from prop damage")
CreateConVar("apm_allow_vehicle_damage", "1", {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE}, "decide if players can be lose health or die from getting hit by vehicles")
CreateConVar("apm_notify_on_vehicle_damage", "0", {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE}, "decide whether to notify admins if someone is damaged by a vehicle")
CreateConVar("apm_strict_damage_check", "0", {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE}, "decide if we use strict damage checks, it will block ALL sources of crush damage")
CreateConVar("apm_remove_on_damage", "0", {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE}, "decide whether to remove a player's prop if it damages someone")
