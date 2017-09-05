AddCSLuaFile()
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

if CLIENT then 
	concommand.Add("freeze_my_stuff", function() RunConsoleCommand("freeze_my_props") end)
	concommand.Add("freeze_all_ents", function() RunConsoleCommand("freeze_everything") end)
end
CreateConVar("freeze_all_anonymity_level", "0", {FCVAR_ARCHIVE, FCVAR_SERVER_CAN_EXECUTE}, "decides if freezall is annonymous to non admins")
if SERVER then
	concommand.Add("freeze_my_props", function(ply)
		if ply:IsValid() then
			for k, entity in pairs(ents.GetAll()) do
				if entity:IsValid() then
					local phys = entity:GetPhysicsObject()
					if phys:IsValid() and entity:CPPIGetOwner()==ply then
						phys:EnableMotion(false)
						phys:Sleep()
					end
				end
			end
		end
	end)
end
if SERVER then
	concommand.Add("freeze_everything", function(ply)
		if ply:IsValid() and ply:IsAdmin() then
			print(ply:Nick().." ("..ply:SteamID()..") has frozen all props")
			for k,v in pairs(player.GetAll()) do
				if GetConVarNumber("freeze_all_anonymity_level")==0 or v:IsAdmin() then
					v:PrintMessage(HUD_PRINTTALK, ply:Nick().." ("..ply:SteamID()..") has frozen all props")
				else
					v:PrintMessage(HUD_PRINTTALK, "someone has frozen all props")
				end
			end
			for k, entity in pairs(ents.GetAll()) do
				if entity:IsValid() then
					local phys = entity:GetPhysicsObject()
					if phys:IsValid() and (entity:CPPIGetOwner()==ply or ply:IsAdmin()) then
						phys:EnableMotion(false)
						phys:Sleep()
					end
				end
			end
		end
	end)
end
print("loaded Anti Prop Minge")