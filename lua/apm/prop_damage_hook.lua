local MurderEntBlackList={ 
	["prop_physics"]=true,
	["prop_ragdoll"]=true,
	["gmod_balloon"]=true,
	["gmod_button"]=true,
	["gmod_hoverball"]=true,
	["gmod_thruster"]=true
}
hook.Add("PlayerShouldTakeDamage","APM_prop_damage",function(ply,weapon)
	if IsValid(weapon) and MurderEntBlackList[weapon:GetClass()] then
		killer=weapon:CPPIGetOwner()
		if PROP_KILLER!=nil and ply:Team()==PROP_KILLER and killer:Team()==PROP_KILLER then return end--this allows people with the right job to propkill people with the right job
		if (killer!=ply or apm_tab.vars.prop_suicide_notification!=0) and apm_tab.vars.notify_on_damage!=0 and killer and killer:IsValid() then
			if ulx and ULib then
				RunConsoleCommand("ulx","asay","someone spectate "..killer:Nick().." ("..killer:SteamID().."). A prop they own damaged "..ply:Nick().." ("..ply:SteamID()..").")
			else
				apm_tab:AdminPM("Someone spectate "..killer:Nick().." ("..killer:SteamID().."). A prop they own damaged "..ply:Nick().." ("..ply:SteamID()..").")
			end
		end
		if apm_tab.vars.nocollide_on_prop_damage!=0 then
			weapon:SetCollisionGroup(COLLISION_GROUP_PASSABLE_DOOR)
		end
		if weapon:IsValid() and apm_tab.vars.remove_on_damage!=0 then
			weapon:Remove()
		end	
		if weapon:IsValid() and apm_tab.vars.freeze_on_damage!=0 and killer and killer:IsValid() then
			apm_tab:FreezeOnly(killer)
		end
		if apm_tab.vars.allow_prop_damage==0 then
			return false
		end
	end
end)