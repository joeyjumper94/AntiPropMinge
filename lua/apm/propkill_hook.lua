local MurderEntBlackList={"prop_physics","gmod_balloon","gmod_button","gmod_hoverball","gmod_thruster"}
if SERVER then
	function GAMEMODE:PlayerDeath(ply,weapon,killer)--the hook to define the killer and the victim
		if IsValid(weapon) and table.concat(MurderEntBlackList):find(weapon:GetClass()) and weapon:CPPIGetOwner()!=ply then
			RunConsoleCommand("ulx","asay", "you may want to spectate someone because an entity owned by "..weapon:CPPIGetOwner():Nick().." ("..weapon:CPPIGetOwner():SteamID()..") killed "..ply:Nick().." ("..ply:SteamID()..")")
--			DarkRP.notify(ply, 0, 4, weapon:CPPIGetOwner():Name().." AKA "..weapon:CPPIGetOwner():Nick().." propkilled you" )
			for k, entity in pairs(ents.GetAll()) do
				if entity:IsValid() then
					local phys = entity:GetPhysicsObject()
					if phys:IsValid() and weapon:CPPIGetOwner()==entity:CPPIGetOwner() then
						phys:EnableMotion(false)
						phys:Sleep()
						local ed = EffectData()
						ed:SetEntity(entity)
						util.Effect( "entity_remove", ed, true, true )
					end
				end
			end
		end
	end
end