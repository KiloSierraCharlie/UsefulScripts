local BannedTools = { // You might find that you need to ban other tools, eg Grabber etc.
	"soundemitter",
	"dynamite",
	"trails",
	"thruster",
	"hoverball",
	"emitter"
}

local AllowedTeams = { // You might add more classes, or allow the Admin On Duty ( if you have one ) class to use the tools
	TEAM_ENGINEER, //For example, allow the TEAM_ENGINEER Team to use all tools, except the Sound Emitter tool.
	TEAM_ADMINONDUTY
}

local AllTools = { // You will probably want to add the tool names of the Gmod Tools, eg Colour etc.
	"balloon",
	"ballsocket",
	"button",
	"camera",
	"colour",
	"creator",
	"duplicator",
	"editentity",
	"eyeposer",
	"faceposer",
	"finger",
	"inflator",
	"leafblower",
	"material",
	"nocollide",
	"paint",
	"physprop",
	"remover",
	"rope",
	"weld",
}

hook.Add( "CanTool", "BlockTools", function( p, tr, tool )
	if( table.HasValue(AllTools, tool) ) then // If the tool's name is in the AllTools table
		return true // Then allow it
	elseif( table.HasValue(BannedTools, tool) )then // If the tool's name is in the BannedTools table
		return false // Then deny it.
	elseif( table.HasValue(AllowedTeams, p:Team()) )then
		return true // If the player's team is in the AllowedTeams table, and the two if statements above have not returned, allow it.
	end
end)
