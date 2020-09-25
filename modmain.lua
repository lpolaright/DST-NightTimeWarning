AddPrefabPostInit("world", function(inst)
    inst:ListenForEvent("ms_playerspawn", function(TheWorld, player)
        player:DoPeriodicTask(1, function(_inst)
            if TheWorld.net ~= nil and TheWorld.net.components ~= nil and TheWorld.net.components.clock ~= nil then
                local timeUntilNight = TheWorld.net.components.clock:GetTimeUntilPhase("night")
                if timeUntilNight > 30 and player:HasTag("_AnnouncedNight") then
                    player:RemoveTag("_AnnouncedNight")
                end
                if  timeUntilNight > 0 and timeUntilNight < 30 and not player:HasTag("_AnnouncedNight") then
                    player.components.talker:Say("Getting close to nighttime...")
                    player:AddTag("_AnnouncedNight")
                end
            end
        end)
    end)
end)