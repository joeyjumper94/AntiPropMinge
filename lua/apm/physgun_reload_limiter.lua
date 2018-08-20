if SERVER then
	hook.Add("OnPhysgunReload","apm_unfreeze_limiter",function(weapon,ply)
		if ply and IsValid(ply) and ply:IsPlayer() then
			local unfreeze_count=0
			
			ply.APM_Next_unfreeze=ply.APM_Next_unfreeze or 0

			if ply.APM_Next_unfreeze>CurTime() then
				ply:PrintMessage(HUD_PRINTTALK,"please wait "..math.Round(ply.APM_Next_unfreeze-CurTime(),4).." seconds before trying to unfreeze props")
				return false
			end

			if apm_tab.vars.unfreeze_ent_delay and apm_tab.vars.unfreeze_ent_delay>0 then
				ply.APM_Next_unfreeze=CurTime()+apm_tab.vars.unfreeze_ent_delay
			end
			
			local APM_Ent=ply:GetEyeTrace().Entity
			if !APM_Ent:IsValid() then return false end
			for k,Entity in pairs(constraint.GetAllConstrainedEntities(APM_Ent)) do
				local PhysObj=Entity:GetPhysicsObject()
				if Entity:IsValid() and Entity:IsRagdoll() then
					for i=0, Entity:GetPhysicsObjectCount()-1 do
						local PhysObj = Entity:GetPhysicsObjectNum(i)
						if PhysObj and PhysObj:IsValid() then 
							if unfreeze_count < apm_tab.vars.unfreeze_ent_limit then
								if !PhysObj:IsMotionEnabled() then
									PhysObj:EnableMotion(true)
									unfreeze_count=unfreeze_count+1
									PhysObj:Wake()
								end
							else
								break
							end
						end
					end
				elseif Entity:IsValid() then
					if PhysObj and PhysObj:IsValid() then 
						if unfreeze_count < apm_tab.vars.unfreeze_ent_limit then
							if !PhysObj:IsMotionEnabled() then
								PhysObj:EnableMotion(true)
								unfreeze_count=unfreeze_count+1
								PhysObj:Wake()
							end
						else
							break
						end
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