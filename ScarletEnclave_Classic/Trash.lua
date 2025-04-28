--------------------------------------------------------------------------------
-- Module Declaration
--

local mod, CL = BigWigs:NewBoss("Scarlet Enclave Trash", 2856)
if not mod then return end
mod.displayName = CL.trash
mod:RegisterEnableMob(
	242224, -- Cardinal Stiltz
	242308, -- Shield Warden Stein
	242304, -- Knight-Captain Fratley
	242792, -- Arcanist Hilda
	242301, -- Cannon Mistress Lind
	242296 -- Bowmaster Puck
)

--------------------------------------------------------------------------------
-- Locals
--

local guardiansAlive = 6

--------------------------------------------------------------------------------
-- Initialization
--

function mod:GetOptions()
	return {
		"stages",
	}
end

function mod:OnBossEnable()
	guardiansAlive = 6
	self:RegisterMessage("BigWigs_OnBossEngage", "Disable")
	self:Death("GuardianKilled", 242224, 242308, 242304, 242792, 242301, 242296)
end

--------------------------------------------------------------------------------
-- Event Handlers
--

function mod:GuardianKilled(args)
	guardiansAlive = guardiansAlive - 1
	self:Message("stages", "cyan", CL.mob_killed:format(args.destName, 6-guardiansAlive, 6), false, nil, 5) -- Stay onscreen for 5s
end
