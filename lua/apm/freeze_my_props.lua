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
		else
			print('"freeze_my_props" only works when used by players in game')
		end
	end)
end