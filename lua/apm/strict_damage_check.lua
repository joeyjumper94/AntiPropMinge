local function APM_OnDMG(ply, dmg)
	if not(ply:IsPlayer()) then return end
	if GetConVarNumber("apm_strict_damage_check") == 0 then return end
	local d_type = dmg:GetDamageType()
	local d_owner = dmg:GetAttacker():GetClass()

	if d_type == DMG_CRUSH or DMG_VEHICLE then
		dmg:SetDamage(0)
	end
end
hook.Add("EntityTakeDamage", "APM_OnDMG", APM_OnDMG )