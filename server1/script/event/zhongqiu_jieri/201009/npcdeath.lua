Include("\\script\\event\\zhongqiu_jieri\\201009\\support.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\droptemplet.lua")

function OnDeath(nNpcIndex)
	
	local szOwnerName = tb2010ZhongQiu.tbNpcSet[nNpcIndex];
	tb2010ZhongQiu.tbNpcSet[nNpcIndex] = nil;
	
	if szOwnerName == nil then 
		return 
	end
	
	if tb2010ZhongQiu:IsActivityTime() ~= 1 then
		Msg2Player("Ho�t ��ng �� k�t th�c!");
		return
	end
	
--	if szOwnerName ~= GetName() then
--		Msg2Player("�����Լ��ٻ���BOSS");
--		return
--	end

	if ST_IsTransLife() ~= 1 and GetLevel() < 50 then
		Msg2Player("Ph�i c�p 50 tr� l�n m�i c� th� tham gia ho�t ��ng!");
		return		
	end
	
	local szNpcName = GetNpcName(nNpcIndex);
	local tbNpcInfo = tb2010ZhongQiu.tbNpcInfo[szNpcName];
	
	if tbNpcInfo == nil then
		return
	end
	
	local nAwardExp = 0;
	
	if type(tbNpcInfo.nAwardExp) == "number" then
		nAwardExp = tbNpcInfo.nAwardExp;
	else
		local nRand = random(1, 100);
		for i = 1,getn(tbNpcInfo.nAwardExp) do
			if nRand <= tbNpcInfo.nAwardExp[i][3] then
				nAwardExp = tbNpcInfo.nAwardExp[i][1];
				break
			end
		end
	end
	
	-- ��������
	tb2010ZhongQiu:AwardExp( nAwardExp, 
													 tbNpcInfo.nTaskId, 
													 tbNpcInfo.nMaxExp, 
													 format("Th�nh c�ng �� b�i %s", szNpcName), 
													 format("[Ho�t ��ng trung thu][��nh b�i %s]", szNpcName));
	
	-- ������Ʒ
	if tbNpcInfo.tbDrop ~= nil then
		tbDropTemplet:GiveAwardByList(nNpcIndex, 
																	PlayerIndex, 
																	tbNpcInfo.tbDrop, 
																	format("[Ho�t ��ng trung thu][��nh b�i %s]", szNpcName), 
																	1);
	end

end

