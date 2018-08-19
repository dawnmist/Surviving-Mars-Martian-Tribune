local Key1 = "PewPew"
local Key2 = "PewPewPew"

local function CheckStory1()
	local MartianTribune = MartianTribune
	local ColonistsHaveArrived = MartianTribune.ColonistsHaveArrived
	local Sent = MartianTribune.Sent

	if not Sent[Key1] and ColonistsHaveArrived and UICity.labels.MDSLaser ~= nil then
		local AddStory = MartianTribuneMod.Functions.AddEngPotentialStory
		AddStory({
			key = Key1,
			title = T{9013618, "Pew Pew"},
			story = T{9013619, "     Several citizens have lodged official complaints about the new MDS Laser, claiming that they never know when it is firing, and that concerns them. The solution offered is to add a 'pew-pew' sound effect to the MDS lasers, thus allowing citizens the comfort of knowing their dome is securely defended."}
		})
	end
end

local function CheckStory2()
	local MartianTribune = MartianTribune
	local Published = MartianTribune.Published
	local Sent = MartianTribune.Sent

	if Published[Key1] and not Sent[Key2] then
		local MartianTribuneMod = MartianTribuneMod
		local FindStoryInListByKey = MartianTribuneMod.Functions.FindStoryInListByKey
		local EngArchive = MartianTribune.EngArchive

		local index, PewPewStory = FindStoryInListByKey(EngArchive, Key1)

		if PewPewStory and UICity.day >= (PewPewStory.publishedDay + 3) then
			local AddStory = MartianTribuneMod.Functions.AddEngPotentialStory
			AddStory({
				key = Key2,
				title = T{9013620, "Pew Pew Pew!"},
				story = T{9013621, "     In response to the complaints lodged several sol prior, pew-pew sounds have been added to all new MDS Lasers.  Drama ensues, however, as several colonists have claimed to have heard the noises generated by the lasers despite there being no meteors in sight and without the lasers firing.  When asked if there were children present playing with their electronics, they responded, 'I hadn't quite thought about that. I don't recall.'"}
			})
		end
	end
end

local laserInit = MDSLaser.GameInit
function MDSLaser.GameInit(...)
	if laserInit then
		laserInit(...)
	end
	CheckStory1()
end

function OnMsg.MartianTribuneCheckStories()
	CheckStory1()
	CheckStory2()
end