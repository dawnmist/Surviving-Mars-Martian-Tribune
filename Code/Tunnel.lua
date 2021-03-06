local Key1 = "TunnelGuangzhou"

local function CheckStory()
	local MartianTribune = MartianTribune
	local Sent = MartianTribune.Sent
	local UICity = UICity

	if not Sent[Key1]
		and UICity.labels.Tunnel
		and #UICity.labels.Tunnel > 0
	then
		local MartianTribuneMod = MartianTribuneMod
		local AddStory = MartianTribuneMod.Functions.AddEngFreeStory
		AddStory({
			key = Key1,
			title = T{9013857, "The Guangzhou's Got Nothing On Mars!"},
			story = T{9013858, "     Earth's Guangzhou Metro might be the longest underground transit tunnel on Earth, but even the longest Earth tunnel has nothing on our Martian tunnels.  With all that iron and nickel in the soil, our newly built tunnel is truly a feat of Martian engineering left unrivaled in the solar system!"}
		})
	end
end

local tunnelInit = Tunnel.GameInit
function Tunnel.GameInit(...)
	if tunnelInit then
		tunnelInit(...)
	end
	CheckStory()
end

function OnMsg.MartianTribuneCheckStories()
	CheckStory()
end
