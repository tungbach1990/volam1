Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\task\\metempsychosis\\translife_7_config.lua")
Include("\\script\\misc\\eventsys\\eventsys.lua")

g_tbCreateNpcParam = 
{
	szName = "B�c ��u L�o Nh�n", 
	nLevel = 1,
	nNpcId = 2200,
	nTime =  5 * 60 ,		-- ����ʱ�� 5����
	szScriptPath = "\\script\\task\\metempsychosis\\npc\\npc_beidou.lua",
	nSeries = nil, 
	tbNpcParam = 
	{
		
	},
}

function OnDeathImmediately(nNpcIndex)
	return 0
end

function OnTimer(nNpcIndex, nTimeOut)
	DelNpc(nNpcIndex)
	SetNpcParam(nNpcIndex, 2, 1)--��־npc�Ƴ�
end
