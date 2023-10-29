Include("\\script\\missions\\sevencity\\war.lua")
Include("\\script\\lib\\objbuffer_head.lua")

ClientProtocol = {}

function ClientProtocol:Process(playerindex, event)
	local handle = OB_Create()
	local player = Player:New(playerindex)
	self:SendReport(event, player, handle)
	OB_Release(handle)
end

function ClientProtocol:SendReport(event, player, handle)
	local tb = BattleWorld:GetStandings(player:GetName())
	OB_PushString(handle, event)
	OB_PushInt(handle, 2)	-- table count

	-- ɱ����������������
	OB_PushInt(handle, 1)	-- first table index
	OB_PushInt(handle, 3)	-- cell count
	OB_PushInt(handle, 1)	-- ��һ�����һ��Ԫ�ص�������
	OB_PushInt(handle, 1)	-- ��һ�����һ��Ԫ�ص�������
	OB_PushString(handle, tostring(tb.KillWarriorCount))	-- ɱ����
	OB_PushInt(handle, 2)	-- ��һ����ڶ���Ԫ�ص�������
	OB_PushInt(handle, 1)	-- ��һ����ڶ���Ԫ�ص�������
	OB_PushString(handle, tostring(tb.KillMonsterCount))	-- ����������
	OB_PushInt(handle, 3)	-- ��һ���������Ԫ�ص�������
	OB_PushInt(handle, 1)	-- ��һ���������Ԫ�ص�������
	OB_PushString(handle, tostring(tb.TimeScore))			-- ʱ�����
	
	-- ɱ������ǰ10�����
	local topten = BattleWorld:GetTopList()
	OB_PushInt(handle, 2)	-- second table index
	local count = 0
	if (topten) then
		count = getn(topten)
	end
	OB_PushInt(handle, count)
	for i = 1, count do
		OB_PushInt(handle, i)
		OB_PushInt(handle, 1)
		local item = topten[i]
		OB_PushString(handle, format("%s(%d)", item[1], item[2]))
	end
	player:SendScriptData(4, handle)
end
