concommand.Add("apm_freeze_ply_msg", function(ply)
	if ply:IsValid() and timer.Exists("apm_antispam_timer") then
		ply:PrintMessage(HUD_PRINTTALK, "this function is on cooldown, wait "..math.Round(timer.TimeLeft("apm_antispam_timer"),2).." before running this command")
	elseif ply:IsValid() then
		timer.Create("apm_antispam_timer", 3, 1, function() timer.Remove("apm_antispam_timer") end)
		local lply = ply
		apm_tab:FreezeOnly(lply)
	else
		print('this function only works when used by players in game')
	end
end)
