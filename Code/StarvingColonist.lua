local Effect = "StatusEffect_Starving"
local Key1 = "StarvingColonist"

local function CheckStory(colonist)
	local MartianTribuneMod = MartianTribuneMod
	local IsValidColonist = MartianTribuneMod.Functions.IsValidColonist
	local Sent = MartianTribune.Sent

	if not Sent[Key1]
		and IsValidColonist(colonist)
		and colonist.status_effects
		and colonist.status_effects[Effect]
	then
		-- Check for adequacy of food supply.
		-- Assume that if the supply is greater than what would trigger an alert, there is adequate food.
		local ResourceOverviewObj = ResourceOverviewObj
		local consumed = ResourceOverviewObj:GetFoodConsumedByConsumptionYesterday()
		local data = next(ResourceOverviewObj.data) and ResourceOverviewObj.data

		if data.Food > 0
			and consumed > 0
			and (data.Food / consumed) >= const.MinDaysFoodSupplyBeforeNotification
		then
			local AddStory = MartianTribuneMod.Functions.AddSocialFreeStory
			local Name = colonist.name

			AddStory({
				key = Key1,
				title = T{9013849, "PSA: Survival Comes First"},
				story = T{9013850, "As are all, we here at the Martian Tribune are working hard to make Mars our new home and tame the Red Planet.  With so many tasks vying for our attention, we know that Mars can be a very distracting and chaotic place to live. That said, food IS necessary to survive. Please, do not forget to pick up your rations every day. Those green boxes are not just for decoration!"}
			})
		end
	end
end

function OnMsg.ColonistStatusEffect(colonist, status_effect, bApply)
	if bApply and status_effect == Effect then
		CheckStory(colonist)
	end
end
