YueGeDaoPlayer = {}

function YueGeDaoPlayer:OnLeaveMap()
	SetTmpCamp(0)
	DisabledStall(0)	--��̯
	SetFightState(0)
end

function YueGeDaoPlayer:OnEnterMap()
	SetLogoutRV(1)
	SetTmpCamp(1)
	DisabledStall(1)	--��̯
	SetFightState(1)
end

function YueGeDaoPlayer:OnDeath()
end
