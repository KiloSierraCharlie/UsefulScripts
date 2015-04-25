local killercolour = Color(255,0,0) // Prop killer's name color
local victimcolour = Color(0,0,255) // Victim's name color
local adminnoticeonly = true // Weather the notice should be admin only, or for everyone.
local staffgroups = { "superadmin", "admin", "operator" } // ULX Group names, for those who should be notified if adminnoticeonly == false
local possibleweapons = { "prop_physics", "prop_vehicle_jeep", "prop_vehicle_airboat" } // Allows for easier configuration, should another entity be considered a weapon, eg. Vehicles.
function PlayerDeath( victim, inflictor, attacker )
	if table.HasValue(possibleweapons, attacker:GetClass()) then // I'm a fan of table.HasValue - It is amazing.
		for k, ply in pairs( player.GetAll() ) do
			if( !adminnoticeonly )then // Since adminnoticeonly can only have 2 values, added a boolean, rather than integer value.
				ply:SendLua("chat.AddText("..victimcolour..", "..victim:Name()..", \" has been prop-killed by \", "..killercolour..", "..attacker:GetOwner():Name()..", \"(\", "..attacker:GetOwner():SteamID()..", \")\")")) // Added steam id, so players can be reported with screen shots easier.
			end
			if table.HasValue(staffgroups, ply:GetNWString("usergroup")) and adminnoticeonly then // Added a table.HasValue for easier configuration, and overall neater code. The "and adminnoticeonly" is to stop duplicate chat messages to admins.
				ply:SendLua("chat.AddText("..victimcolour..", "..victim:Name()..", \" has been prop-killed by \", "..killercolour..", "..attacker:GetOwner():Name()..", \"(\", "..attacker:GetOwner():SteamID()..", \")\")") // Added steam id, so console/admin can ban quicker, and more efficiently.
			end
		end
	end
end	
hook.Add("PlayerDeath", "PropkillCheck", PlayerDeath)
