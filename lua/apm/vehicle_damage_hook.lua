hook.Add("PlayerShouldTakeDamage", "APM_vehicle_damage", function(ply, weapon)
	if IsValid(weapon) and weapon:IsVehicle() then
		local driver = weapon:GetDriver()
		if driver:IsValid() and driver:IsPlayer() and apm_tab.vars.notify_on_vehicle_damage!=0 then
			if ulx and ULib then
				RunConsoleCommand("ulx", "asay", "someone spectate ".. driver:Nick().. " ("..driver:SteamID().. "). A vehicle they're in damaged ".. ply:Nick().. " (".. ply:SteamID().. ").")
			else
				apm_tab:AdminPM("someone spectate ".. driver:Nick().. " ("..driver:SteamID().. "). A vehicle they're in damaged ".. ply:Nick().. " (".. ply:SteamID().. ").")
			end
		end
		if apm_tab.vars.nocollide_on_vehicle_damage!=0 then
			weapon:SetCollisionGroup(COLLISION_GROUP_PASSABLE_DOOR)
		end
		if apm_tab.vars.allow_vehicle_damage==0 then
			return false
		end
	end
end)

local apm_collision_whitelist={
	[COLLISION_GROUP_DEBRIS]=true,
	[COLLISION_GROUP_DEBRIS_TRIGGER]=true,
	[COLLISION_GROUP_PASSABLE_DOOR]=true,
	[COLLISION_GROUP_WEAPON]=true,
	[COLLISION_GROUP_WORLD]=true,
}

timer.Create("apm_car_nocollider_timer",apm_tab.vars.nocollide_all_vehicles,0,function()
	if apm_tab.vars.nocollide_all_vehicles and apm_tab.vars.nocollide_all_vehicles>0 then
		for k,car in pairs(ents.GetAll()) do
			if car:IsValid() and car:IsVehicle() and apm_collision_whitelist[car:GetCollisionGroup()] then
				car:SetCollisionGroup(COLLISION_GROUP_PASSABLE_DOOR)
			end
		end
	else
		timer.Remove("apm_car_nocollider_timer")
	end
end)