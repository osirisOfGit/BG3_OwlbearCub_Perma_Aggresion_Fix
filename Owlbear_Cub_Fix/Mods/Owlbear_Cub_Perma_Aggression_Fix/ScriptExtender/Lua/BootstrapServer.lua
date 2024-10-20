Ext.Osiris.RegisterListener("LevelGameplayStarted", 2, "after", function(_, _)
	-- When the Owlbear Mom leaves combat
	Ext.Entity.Get("e903a41f-8ef7-46dc-a847-7d0ec2804d08"):OnDestroyOnce("IsInCombat", function(_)
		for _, combatParticipant in pairs(Osi.DB_Is_InCombat:Get(nil, Osi.CombatGetGuidFor(Osi.GetHostCharacter()))) do
			combatParticipant = combatParticipant[1]

			-- The dad gets a randomly generated EntityUUID, so we can't hardcode him like the mom and cub
			if Osi.GetTemplate(combatParticipant) == "Owlbear_Dad_7a87360f-6a37-4b66-96c8-446390f3c7b3" then
				Ext.Entity.Get(combatParticipant):OnDestroyOnce("IsInCombat", function(_) 
					if Osi.IsInCombat("c66b2865-6613-4372-b97a-e330c1d75d09") == 1 then -- cub
						Osi.PROC_FOR_OwlBearCub_LastCubLeaveCombat("c66b2865-6613-4372-b97a-e330c1d75d09")
					end
				end)
			end
		end
	end)
end)
