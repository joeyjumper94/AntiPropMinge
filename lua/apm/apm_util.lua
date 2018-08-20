apm_tab=apm_tab or {}
function apm_tab:EasyFPrint(message,state)
	if state==0 then
		PrintMessage(HUD_PRINTTALK,message)
	else
		PrintMessage(HUD_PRINTTALK,"Someone has frozen all props.")
	end
end
function apm_tab:FreezeAll()
	for k,entity in ipairs(ents.GetAll()) do
		local phys=entity:GetPhysicsObject()
		if entity:IsValid() and entity:GetClass():find("ragdoll") then
--			SafeRemoveEntity(entity)
			for i=0, entity:GetPhysicsObjectCount() - 1 do -- "ragdoll" being a ragdoll entity
				local phys = entity:GetPhysicsObjectNum( i )
				phys:EnableMotion(false)
				phys:Sleep()
			end
		elseif entity:IsValid() and phys:IsValid() then
			phys:EnableMotion(false)
			phys:Sleep()
		end
	end
end
function apm_tab:FreezeOnly(ply)
	for k,entity in ipairs(ents.GetAll()) do
		if entity:IsValid() and entity:CPPIGetOwner()==ply then
			local phys=entity:GetPhysicsObject()
			if entity:IsValid() and entity:GetClass():find("ragdoll") then
--				SafeRemoveEntity(entity)
				for i=0, entity:GetPhysicsObjectCount() - 1 do -- "ragdoll" being a ragdoll entity
					local phys = entity:GetPhysicsObjectNum( i )
					phys:EnableMotion(false)
					phys:Sleep()
				end
			elseif entity:IsValid() and phys:IsValid() then
				phys:EnableMotion(false)
				phys:Sleep()
			end
		end
	end
end
function apm_tab:AdminPM(message)
	for k,v in ipairs(player.GetAll()) do
		if v:IsAdmin() then
			v:PrintMessage(HUD_PRINTTALK,message)
		end
	end
end
function apm_tab:RemoveOnly(ply)
	for k,entity in ipairs(ents.GetAll()) do
		if entity:IsValid() and entity:CPPIGetOwner()==ply then
			SafeRemoveEntity(entity)
		end
	end
end
function apm_tab:save()
	file.Write("apm_settings.txt",util.TableToJSON(apm_tab.vars,true))
end
function apm_tab:delete()
	file.Delete("apm_settings.txt")
end
function apm_tab:load()
	local json=file.Read("apm_settings.txt",false)
	if json then
		apm_tab.vars=util.JSONToTable(json)
	end
end