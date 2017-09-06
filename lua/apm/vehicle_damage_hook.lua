--[[--
if SERVER then
	function GAMEMODE:PlayerShouldTakeDamage(ply,weapon)
		if IsValid(weapon) and (weapon:GetClass():find("vehicle") or weapon:IsVehicle()) then
			if weapon:GetDriver():IsValid() and weapon:GetDriver():IsPlayer() and GetConVarNumber("apm_notify_on_vehicle_damage")!=0 then
				killer=weapon:GetDriver()
				if ConVarExists("ulx_rslots") then
					RunConsoleCommand("ulx","asay", "someone spectate "..killer:Nick().." ("..killer:SteamID().."). A prop they own killed "..ply:Nick().." ("..ply:SteamID()..").")
				else
					for k,v in pairs(player.GetAll()) do
						if v:IsAdmin() then
							v:PrintMessage(HUD_PRINTTALK, "someone spectate "..killer:Nick().." ("..killerSteamID().."). A prop they own damaged "..ply:Nick().." ("..ply:SteamID()..").")
						end
					end
				end
			end
			return GetConVarNumber("apm_allow_vehicle_damage")!=0
		else
			return true
		end
	end
end
--]]--