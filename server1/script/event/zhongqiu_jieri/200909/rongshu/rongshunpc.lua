Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
tbZhongQiu200909_rongshu = {}

function main()
	local nNpcIndex = GetLastDiagNpc()
	local nCount = GetNpcParam(nNpcIndex, 1)

	local nLock = GetNpcParam(nNpcIndex, 4)
	
	
	if nCount <= 0 then
		return Talk(1, "", "C�y n�y �� tr� tr�i l� r�i, xin h�y ��i c�y m�c l�i r�i h�i ti�p")
	end
	
	if CalcFreeItemCellCount() < 2 then
		return Talk(1, "", format("H�nh trang ph�i d� %d �.", 2))
	end
	
	SetNpcParam(nNpcIndex, 4, 1)
	
	
	if nLock == 0 then
		
		
		local szPlayerName = GetName()
		if tbZhongQiu200909_rongshu[PlayerIndex] == nil or szPlayerName ~= tbZhongQiu200909_rongshu[PlayerIndex].szName then
			tbZhongQiu200909_rongshu[PlayerIndex] = {}
			tbZhongQiu200909_rongshu[PlayerIndex].szName = szPlayerName
			tbZhongQiu200909_rongshu[PlayerIndex].nTime = GetCurServerTime()
		end
		
		if tbZhongQiu200909_rongshu[PlayerIndex].nTime + 15 <= GetCurServerTime() then --�Ѿ��ȴ�15��
			--��Ҷ��
			local tbLeaf = 
			{
				[1496] = 	
				{
					{tbProp={6, 1, 2142, 1, 0, 0}, nRate = 20, nExpiredTime = 600},
					{tbProp={6, 1, 2141, 1, 0, 0}, nRate = 50, nExpiredTime = 600},
					{tbProp={6, 1, 2143, 1, 0, 0}, nRate = 30, nExpiredTime = 600},
				
				},
			}
			local nNpcSettingId = GetNpcSettingIdx(nNpcIndex)
			
			
			tbAwardTemplet:GiveAwardByList(tbLeaf[nNpcSettingId], "rongshu get leaf")
			tbZhongQiu200909_rongshu[PlayerIndex] = {}
			SetNpcParam(nNpcIndex, 1, nCount-1)
			
		else
			Msg2Player(format("%d gi�y sau m�i c� th� h�i ���c.", tbZhongQiu200909_rongshu[PlayerIndex].nTime + 15 - GetCurServerTime()))
		end
		
		
		SetNpcParam(nNpcIndex, 4, 0)
	else
		print("the tree lock")
	end
	
end

function OnTimer(nNpcIndex, nTimeOut)
	local nJianGe =10*60

	local nTt = 30*60
	
	if nTimeOut >= nTt * 18 then
		
		print("TImer out del npc")
		DelNpc(nNpcIndex)
		return 0
	end
	
	local nTimer = GetNpcParam(nNpcIndex, 2);
	local nCurTimer = nTimer + nJianGe + floor(nTimeOut / 18)
	
	
	if nCurTimer >= nTt then
		DelNpc(nNpcIndex)
		return 0
	end
	SetNpcParam(nNpcIndex, 1, 50)
	
	while (nTimer + nJianGe <= nCurTimer) do
		nTimer = nTimer + nJianGe
	end
	SetNpcParam(nNpcIndex, 2, nTimer);
	SetNpcTimer(nNpcIndex, (nTimer + nJianGe - nCurTimer) * 18 )
end

if not OnDeath then
	OnDeath = function() end
end