// You can still use this, although darkRP comes with it built in.

local GodTime = 10

function BabyGod( ply, attacker )
     if(!ply:GetNWInt("GodTime") < CurTime()) then
          print(attacker:Nick() .. "attacked a newspawn ("..ply:Nick()..")")
          return false
     end
end
hook.Add("PlayerShouldTakeDamage", "SimpleBabyGod", BabyGod)

hook.Add("PlayerSpawn", "AddGod", function(ply)
     ply:SetNWInt("GodTime", CurTime()+GodTime)
end)
