PlayerFloor4 = {}

function PlayerFloor4:OnLeaveMap()
	SetFightState(0) --��ս��״̬
	DisabledUseTownP(0) --����ʹ�ûسǷ�
	SetDeathScript("")
end

function PlayerFloor4:OnEnterMap()
	SetLogoutRV(1)
	SetFightState(0) --��ս��״̬
	DisabledUseTownP(1) --����ʹ�ûسǷ�
	SetDeathScript("\\script\\missions\\tianchimijing\\floor4\\playerdeath.lua")		
end