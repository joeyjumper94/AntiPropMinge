hook.Add("PlayerShouldTakeDamage", "APM_vehicle_damage", function(ply, weapon)
	if IsValid(weapon) and weapon:IsVehicle() then
		local driver = weapon:GetDriver()
		if driver:IsValid() and driver:IsPlayer() and GetConVarNumber("apm_notify_on_vehicle_damage") !=0 then
			if ConVarExists("ulx_rslots") then
				RunConsoleCommand("ulx", "asay", "someone spectate ".. driver:Nick().. " ("..driver:SteamID().. "). A vehicle they're in damaged ".. ply:Nick().. " (".. ply:SteamID().. ").")
			else
				apm_tab:AdminPM("someone spectate ".. driver:Nick().. " ("..driver:SteamID().. "). A vehicle they're in damaged ".. ply:Nick().. " (".. ply:SteamID().. ").")
			end
		end
		if GetConVarNumber("apm_nocollide_on_vehicle_damage") != 0 then
			weapon:SetCollisionGroup(COLLISION_GROUP_PASSABLE_DOOR)
		end		
		return GetConVarNumber("apm_allow_vehicle_damage") != 0
	end
end)
