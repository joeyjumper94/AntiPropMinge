hook.Add("EntityTakeDamage", "APM_strict_damage", function(ply, dmg)
	if !ply:IsValid() or !ply:IsPlayer() then return end

	local d_type = dmg:GetDamageType()
	local d_owner = dmg:GetAttacker():GetClass()

	if GetConVarNumber("apm_print_damage_info")!=0 then
		print(d_type) print(dmg) print(d_owner)
	end
	if nil!=PROP_KILLER and ply:Team()==PROP_KILLER and dmg:GetAttacker():CPPIGetOwner():Team()==PROP_KILLER then return end
	if (d_type == DMG_CRUSH or d_type == DMG_VEHICLE) and GetConVarNumber("apm_strict_damage_check") != 0 then
		dmg:SetDamage(0)
	elseif d_type != DMG_FALL and dmg:GetInflictor():IsWorld() and GetConVarNumber("apm_allow_world_damage")==0 then
		dmg:SetDamage(0)
	end
end )
--GetConVarNumber("apm_strict_damage_check")=1
--GetConVarNumber("apm_allow_world_damage")=1