AddCSLuaFile()
local apm_unfreeze_ent_delay=GetConVar("apm_unfreeze_ent_delay"):GetFloat()
local apm_unfreeze_ent_limit=GetConVar("apm_unfreeze_ent_limit"):GetInt()
if SERVER then
	hook.Add("OnPhysgunReload","apm_unfreeze_limiter",function(weapon,ply)
		if ply and IsValid(ply) and ply:IsPlayer() then
			local unfreeze_count=0
			
			ply.APM_Next_unfreeze=ply.APM_Next_unfreeze or 0

			if ply.APM_Next_unfreeze>CurTime() then
				ply:PrintMessage(HUD_PRINTTALK,"please wait "..math.Round(ply.APM_Next_unfreeze-CurTime(),4).." seconds before trying to unfreeze props")
				return false
			end

			if apm_unfreeze_ent_delay>0 then
				ply.APM_Next_unfreeze=CurTime()+apm_unfreeze_ent_delay
			end
			
			local APM_Ent=ply:GetEyeTrace().Entity
			if !APM_Ent:IsValid() then return false end
			for k,Entity in pairs(constraint.GetAllConstrainedEntities(APM_Ent)) do
				local PhysObj=Entity:GetPhysicsObject()
				if PhysObj:IsValid() then 
					PhysObj:Wake()
					if unfreeze_count < apm_unfreeze_ent_limit and !PhysObj:IsMotionEnabled() then
						PhysObj:EnableMotion(true)
						unfreeze_count=unfreeze_count+1
					end
				end
			end
			ply:SuppressHint( "PhysgunReload" )
			if unfreeze_count>0 then
				ply:SendLua( "GAMEMODE:UnfrozeObjects("..unfreeze_count..")" )
				return false--we have to return false to prevent the normal unfreezing from happening
			end
		end
	end)
end