
--
--δת���Ľ�ɫ	������ 2.000.000.000 Exp	����
--��һת�Ľ�ɫ	������ 3.000.000.000 Exp	����
--�ڶ�ת�Ľ�ɫ	������ 4.000.000.000 Exp	����
Include("\\script\\activitysys\\g_itemuse.lua")
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\playerfunlib.lua")



function main(nItemIndex)
	
	local tb = 
	{
		[0] = 2000,
		[1] = 3000,
		[2] = 4000,
	}
	
	if not PlayerFunLib:CheckLevel(0,"default",">=") then
		return 1
	end
	if not PlayerFunLib:IsCharged("default") then
		return 1
	end
	
	
	local nTransLifeCount = ST_GetTransLifeCount()
	if nTransLifeCount > 2 then
		nTransLifeCount = 2
	end
	local nExpLimit = tb[nTransLifeCount]
	
	if not PlayerFunLib:CheckTask(1925,nExpLimit,format("M�i nh�n v�t s� d�ng [L�ng ��n kim ng�u] nhi�u nh�t ch� nh�n ���c %u kinh nghi�m",nExpLimit*1e6 ),"<") then
		return 1
	end
	PlayerFunLib:AddExp(50000000,0,"MidAutumn,UseGoldDragonLantern ")
	PlayerFunLib:AddTask(1925,50)
end