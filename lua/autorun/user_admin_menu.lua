AddCSLuaFile()
hook.Add("PopulateToolMenu", "apm_menu", function()
	spawnmenu.AddToolMenuOption(
		"Utilities",
		"APM",
		"APM menu",
		"Anti Prop Minge",
		"",
		"",
		function(panel)
			panel:Button(
				"remove your entites",
				"apm_remove_ply_msg"
			)
			panel:Button(
				"freeze your entities",
				"apm_freeze_ply_msg"
			)
			panel:Button(
				"remove all player owned entites",
				"apm_remove_ply_all"
			)
			panel:Button(
				"freeze all entities on the map(Admin+ function)",
				"apm_freeze_all_msg"
			)
			panel:Button(
				"reset map(Admin+ function)",
				"apm_remove_all_msg"
			)
		end,
		{}
	)
end)