local MurderEntBlackList = { 
	["prop_physics"] = true, 
	["prop_ragdoll"] = true, 
	["gmod_balloon"] = true, 
	["gmod_button"] = true, 
	["gmod_hoverball"] = true, 
	["gmod_thruster"] = true
}

hook.Add("PlayerShouldTakeDamage", "APM_prop_damage", function(ply, weapon)
	if IsValid(weapon) and MurderEntBlackList[weapon:GetClass()] then
		killer=weapon:CPPIGetOwner()
		if PROP_KILLER!=nil and ply:Team()==PROP_KILLER and killer:Team()==PROP_KILLER then return end -- this allows people with the right job to propkill people with the right job
		if (killer!=ply or GetConVar("apm_prop_suicide_notification"):GetBool()) and GetConVar("apm_notify_on_damage"):GetBool() then
			if ulx and ULib then
				RunConsoleCommand("ulx", "asay", "someone spectate ".. killer:Nick().. " ("..killer:SteamID().. "). A prop they own damaged ".. ply:Nick().. " (".. ply:SteamID().. ").")
			else
				apm_tab:AdminPM("Someone spectate ".. killer:Nick().. " ("..killer:SteamID().. "). A prop they own damaged ".. ply:Nick().. " (".. ply:SteamID().. ").")
			end
		end
		if GetConVar("apm_nocollide_on_prop_damage"):GetBool() then
			weapon:SetCollisionGroup(COLLISION_GROUP_PASSABLE_DOOR)
		elseif weapon:IsValid() and GetConVarNumber("apm_remove_on_damage"):GetBool() then
			weapon:Remove()
		end	
		if weapon:IsValid() and GetConVar("apm_freeze_on_damage"):GetBool() then
			apm_tab:FreezeOnly(killer)
		end
		if !GetConVar("apm_allow_prop_damage"):GetBool() then
			return false
		end
	end
end)