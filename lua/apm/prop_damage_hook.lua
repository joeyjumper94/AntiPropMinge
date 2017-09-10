local MurderEntBlackList = { "prop_physics", "prop_ragdoll", "gmod_balloon", "gmod_button", "gmod_hoverball", "gmod_thruster" }

hook.Add("PlayerShouldTakeDamage", "APM_prop_damage", function(ply, weapon)
	if IsValid(weapon) and table.concat(MurderEntBlackList):find(weapon:GetClass()) then
		killer=weapon:CPPIGetOwner()
		if (killer != ply or GetConVarNumber("apm_prop_suicide_notification") != 0) and GetConVarNumber("apm_notify_on_damage") != 0 then
			if ConVarExists("ulx_rslots") then
				RunConsoleCommand("ulx", "asay", "someone spectate ".. killer:Nick().. " ("..killer:SteamID().. "). A prop they own damaged ".. ply:Nick().. " (".. ply:SteamID().. ").")
			else
				apm_tab:AdminPM("Someone spectate ".. killer:Nick().. " ("..killer:SteamID().. "). A prop they own damaged ".. ply:Nick().. " (".. ply:SteamID().. ").")
			end
		end
		if weapon:IsValid() and GetConVarNumber("apm_remove_on_damage") != 0 then
			weapon:Remove()
		end
		if weapon:IsValid() and GetConVarNumber("apm_freeze_on_damage") != 0 then
			apm_tab:FreezeOnly(killer)
		end
		return GetConVarNumber("apm_allow_prop_damage") != 0
	end
end)