hook.Add("DoPlayerDeath","apm_freeze_on_spawn",function(ply,killer,CTakeDamageInfo)
	ply.just_died=true
	timer.Simple(0.5,function()
		if ply:IsValid() then
			ply.just_died=nil
		end 
	end)
end)
hook.Add("PlayerSpawnedProp","apm_freeze_on_spawn",function(ply,model,ent) 
	local phys=ent:GetPhysicsObject()
	if ent:IsValid() and ent:GetClass():find("ragdoll") or ent:IsValid() and ent:IsRagdoll() then
		for i=0, ent:GetPhysicsObjectCount()-1 do
			local phys = ent:GetPhysicsObjectNum(i)
			if phys:IsValid() then
				phys:EnableMotion(false)
				phys:Sleep()
			end
		end
	elseif ent:IsValid() and phys:IsValid() then
		phys:EnableMotion(false)
		phys:Sleep()
	end
end)
hook.Add("PlayerSpawnedRagdoll","apm_freeze_on_spawn",function(ply,model,ent)--this was edited to accomodate PPM2 corpses
	local time=ply.just_died and 3 or 0
	timer.Simple(0,function()
		if ent and ent:IsValid() and time!=0 then
			ent:SetCollisionGroup(COLLISION_GROUP_WEAPON)--WORLD)--IN_VEHICLE)--
			ply.just_died=nil
		end
	end)
	timer.Simple(time,function()
		if ent and ent:IsValid() then
			local phys=ent:GetPhysicsObject()
			if ent:IsValid() and ent:GetClass():find("ragdoll") or ent:IsValid() and ent:IsRagdoll() then
				for i=0, ent:GetPhysicsObjectCount()-1 do
					local phys = ent:GetPhysicsObjectNum(i)
					if phys:IsValid() then
						phys:EnableMotion(false)
						phys:Sleep()
					end
				end
			elseif ent:IsValid() and phys:IsValid() then
				phys:EnableMotion(false)
				phys:Sleep()
			end
		end
	end)
end)
hook.Add("PlayerSpawnedSENT","apm_freeze_on_spawn",function(ply,ent)
	local phys=ent:GetPhysicsObject()
	if ent:IsValid() and ent:GetClass():find("ragdoll") or ent:IsValid() and ent:IsRagdoll() then
		for i=0, ent:GetPhysicsObjectCount()-1 do
			local phys = ent:GetPhysicsObjectNum(i)
			if phys:IsValid() then
				phys:EnableMotion(false)
				phys:Sleep()
			end
		end
	elseif ent:IsValid() and phys:IsValid() then
		phys:EnableMotion(false)
		phys:Sleep()
	end
end)
