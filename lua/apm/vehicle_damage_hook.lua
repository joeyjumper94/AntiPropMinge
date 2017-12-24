hook.Add("PlayerShouldTakeDamage", "APM_vehicle_damage", function(ply, weapon)
	if IsValid(weapon) and weapon:IsVehicle() then
		local driver = weapon:GetDriver()
		if driver:IsValid() and driver:IsPlayer() and GetConVarNumber("apm_notify_on_vehicle_damage") !=0 then
			if ulx and ULib then
				RunConsoleCommand("ulx", "asay", "someone spectate ".. driver:Nick().. " ("..driver:SteamID().. "). A vehicle they're in damaged ".. ply:Nick().. " (".. ply:SteamID().. ").")
			else
				apm_tab:AdminPM("someone spectate ".. driver:Nick().. " ("..driver:SteamID().. "). A vehicle they're in damaged ".. ply:Nick().. " (".. ply:SteamID().. ").")
			end
		end
		if GetConVar("apm_nocollide_on_vehicle_damage"):GetBool() then
			weapon:SetCollisionGroup(COLLISION_GROUP_PASSABLE_DOOR)
		end
		if !GetConVar("apm_allow_vehicle_damage"):GetBool() then
			return false
		end
	end
end)

local apm_collision_whitelist={
	[COLLISION_GROUP_DEBRIS]=true,
	[COLLISION_GROUP_DEBRIS_TRIGGER]=true,
	[COLLISION_GROUP_PASSABLE_DOOR]=true,
	[COLLISION_GROUP_WEAPON]=true,
}

timer.Create("apm_car_nocollider_timer",GetConVarNumber("apm_nocollide_all_vehicles"):GetFloat(),0,function()
	if GetConVarNumber("apm_nocollide_all_vehicles"):GetBool() then
		for k,car in pairs(ents.GetAll()) do
			if car:IsValid() and car:IsVehicle() and apm_collision_whitelist[car:GetCollisionGroup()] then
				car:SetCollisionGroup(COLLISION_GROUP_PASSABLE_DOOR)
			end
		end
	else
		timer.Remove("apm_car_nocollider_timer")
	end
end)