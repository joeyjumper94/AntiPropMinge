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
		end
	end
end
--]]--

local function APM_ShouldTakeCDMG(ply, weapon)
	if IsValid(weapon) and (weapon:GetClass():find("vehicle") or weapon:IsVehicle()) then
		local driver=weapon:GetDriver()
		if driver:IsValid() and driver:IsPlayer() and GetConVarNumber("apm_notify_on_vehicle_damage")!=0 then
			if ConVarExists("ulx_rslots") then
				RunConsoleCommand("ulx", "asay", "someone spectate ".. driver:Nick().. " ("..driver:SteamID().. "). A vehicle they're in damaged ".. ply:Nick().. " (".. ply:SteamID().. ").")
			else
				apm_tab:AdminPM("someone spectate ".. driver:Nick().. " ("..driver:SteamID().. "). A vehicle they're in damaged ".. ply:Nick().. " (".. ply:SteamID().. ").")
			end
		end
		return GetConVarNumber("apm_allow_vehicle_damage") != 0
	end
end
hook.Add("PlayerShouldTakeDamage", "APM_PLYCDMG", APM_ShouldTakeCDMG )