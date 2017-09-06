concommand.Add("freeze_my_props", function(ply)
	if ply:IsValid() then
		local lply = ply
		apm_tab:FreezeOnly(lply)
		return
	end
	print('"freeze_my_props" only works when used by players in game')
end)
