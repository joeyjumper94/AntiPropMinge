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
<<<<<<< HEAD
	for k, entity in pairs(ents.GetAll()) do
		local phys = entity:GetPhysicsObject()
		if entity:IsValid() and phys:IsValid() then
=======
	for k, entity in pairs(ents.FindByClass("prop_physics")) do
		if entity:IsValid() and not(entity:IsWorld()) then
			local phys = entity:GetPhysicsObject()
>>>>>>> origin/master
			phys:EnableMotion(false)
			phys:Sleep()
		end
	end
end

function apm_tab:FreezeOnly(ply)
<<<<<<< HEAD
	for k, entity in pairs(ents.GetAll()) do
		local phys = entity:GetPhysicsObject()
		if entity:IsValid() and phys:IsValid() and entity:CPPIGetOwner() == ply then
			phys:EnableMotion(false)
			phys:Sleep()
=======
	for k, entity in pairs(ents.FindByClass("prop_physics")) do
		if entity:IsValid() then
			local phys = entity:GetPhysicsObject()
			if phys:IsValid() and entity:CPPIGetOwner() == ply then
				phys:EnableMotion(false)
				phys:Sleep()
			end
>>>>>>> origin/master
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