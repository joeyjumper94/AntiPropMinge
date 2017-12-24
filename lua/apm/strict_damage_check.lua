hook.Add("EntityTakeDamage", "APM_strict_damage", function(ply, dmg)
	if ply and dmg and ply:IsValid() and ply:IsPlayer() then

		local d_type=dmg:GetDamageType()
		local d_ent_class=dmg:GetAttacker():GetClass()

		if GetConVar("apm_print_damage_info"):GetBool() then
			print("damage_type="..d_type) print("dmg:GetAttacker():GetClass()="..d_ent_class)
		end
		if nil!=PROP_KILLER and ply:Team()==PROP_KILLER and dmg:GetAttacker():CPPIGetOwner():Team()==PROP_KILLER then return end--both the owner of the prop and the victim are of the propkiller job

		if (d_type==DMG_CRUSH or d_type==DMG_VEHICLE) and GetConVar("apm_strict_damage_check"):GetBool() and dmg:GetAttacker()!=ply then
			dmg:SetDamage(0)
		elseif d_type!=DMG_FALL and dmg:GetInflictor():IsWorld() and !GetConVar("apm_allow_world_damage"):GetBool() then--sometimes people will get crushed between a prop and the world then die with the world being credited with the kill even though it wasn't DMG_FALL
			dmg:SetDamage(0)
		end
	end
end )