hook.Add("EntityTakeDamage","APM_strict_damage",function(ply,dmg)
	if ply and dmg and ply:IsValid() and ply:IsPlayer() then

		local type=dmg:GetDamageType()
		local attacker=dmg:GetAttacker()
		local class=dmg:GetAttacker():GetClass()

		if apm_tab.vars.print_damage_info!=0 then
			print("damage_type="..type)
			print("dmg:GetAttacker():GetClass()="..class)
		end
		if PROP_KILLER!=nil and ply:Team()==PROP_KILLER and dmg:GetAttacker():CPPIGetOwner():Team()==PROP_KILLER then return end--both the owner of the prop and the victim are of the propkiller job

		if apm_tab.vars.map_ents_bypass!=0 and attacker:IsValid() and attacker:MapCreationID()!=-1 then
			return
		end
		if (type==DMG_CRUSH or type==DMG_VEHICLE) and apm_tab.vars.strict_damage_check!=0 and dmg:GetAttacker()!=ply then
			dmg:SetDamage(0)
		elseif type!=DMG_FALL and !dmg:GetInflictor():IsValid() and apm_tab.vars.allow_world_damage==0 then--sometimes people will get crushed between a prop and the world then die with the world being credited with the kill even though it wasn't DMG_FALL
			dmg:SetDamage(0)
		end
	end
end )