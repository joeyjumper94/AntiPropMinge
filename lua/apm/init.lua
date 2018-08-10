if SERVER then
	include("apm_util.lua")
	include("config.lua")--load the default config file
	apm_tab:load()--attempt to load the altered settings
	include("freeze_everything.lua")
	include("freeze_my_props.lua")
--	include("propkill_hook.lua")
	include("prop_damage_hook.lua")
	include("vehicle_damage_hook.lua")
	include("strict_damage_check.lua")
	include("prop_removal.lua")
	include("physgun_reload_limiter.lua")
end