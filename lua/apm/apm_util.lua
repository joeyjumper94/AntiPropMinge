apm_tab = apm_tab or {}

function apm_tab:EasyFPrint(message, state)
	if state == 0 then
		for k,v in pairs(player.GetAll()) do
			v:PrintMessage(HUD_PRINTTALK, message)
		end
		return
	end

	for k,v in pairs(player.GetAll()) do
		v:PrintMessage(HUD_PRINTTALK, "Someone has frozen all props.")
	end
end

function apm_tab:FreezeAll()
	for k, entity in pairs(ents.FindByClass("prop_physics")) do
		if entity:IsValid() and not(entity:IsWorld()) then
			local phys = entity:GetPhysicsObject()
			phys:EnableMotion(false)
			phys:Sleep()
		end
	end
end

function apm_tab:FreezeOnly(ply)
	for k, entity in pairs(ents.FindByClass("prop_physics")) do
		if entity:IsValid() then
			local phys = entity:GetPhysicsObject()
			if phys:IsValid() and entity:CPPIGetOwner() == ply then
				phys:EnableMotion(false)
				phys:Sleep()
			end
		end
	end
end

function apm_tab:AdminPM(message)
	for k,v in pairs(player.GetAll()) do
		if v:IsAdmin() then
			v:PrintMessage(HUD_PRINTTALK, message)
		end
	end
end