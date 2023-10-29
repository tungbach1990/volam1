Include("\\script\\activitysys\\config\\1016\\head.lua");
Include("\\script\\activitysys\\config\\1016\\variables.lua");
Include("\\script\\activitysys\\config\\1016\\awardlist.lua");
Include("\\script\\dailogsys\\dailogsay.lua");
Include("\\script\\lib\\awardtemplet.lua");
Include( "\\script\\activitysys\\config\\1016\\callboss.lua");
Include("\\script\\vng_lib\\bittask_lib.lua")
IncludeLib("SETTING");

pActivity.nPak = curpack()

--S� d�ng Item
function pActivity:UseTieuHuyenBT()
	if not tbVNG_BitTask_Lib:CheckBitTaskValue(%tbBITTSK_LIMIT_3,%tbBITTSK_LIMIT_3.nMaxValue,"�� ��t ��n gi�i h�n, kh�ng th� s� d�ng ti�p","<") then
		return
	end
	--ngau nhi�n exp
	local rtotal = 10000000
	local rcur=random(1,rtotal);
	local rstep=0;
	local tbItem = %tbAward_TieuHuyenBT_Exp
	local nRandResult = 0
	for i=1,getn(tbItem) do
		rstep=rstep+floor(tbItem[i].nRate*rtotal/100);
		if(rcur <= rstep) then
			nRandResult = tbItem[i].nExp
			break
		end
	end
	local nCurTskVal = tbVNG_BitTask_Lib:getBitTask(%tbBITTSK_LIMIT_3)
	local nNextExp = nRandResult
	-- Lan su dung cuoi cung vuot qua gioi han
	if floor(nNextExp/1e6) + nCurTskVal > %tbBITTSK_LIMIT_3.nMaxValue then
		nNextExp = (%tbBITTSK_LIMIT_3.nMaxValue - nCurTskVal)*1e6
	end
	
	tbVNG_BitTask_Lib:addTask(%tbBITTSK_LIMIT_3, floor(nNextExp/1e6))	
	tbAwardTemplet:Give({szName = "�i�m kinh nghi�m", nExp=nNextExp}, 1, {%EVENT_LOG_TITLE, "SuDungTieuHuyenBangTinhNhanExp"})
	Msg2Player(format("B�n �� nh�n ���c <color=yellow>%s<color> exp , b�n c�n c� th� nh�n ���c th�m <color=yellow>%s<color> exp t� Ti�u Huy�n B�ng Tinh hay M�c Huy�n B�ng Tinh.", nCurTskVal*1e6, (%tbBITTSK_LIMIT_3.nMaxValue - nCurTskVal)*1e6))	
	tbAwardTemplet:Give(%tbAward_Old, 1, {%EVENT_LOG_TITLE, "SuDungTieuHuyenBangTinhNhanItem"})
	nCurTskVal = tbVNG_BitTask_Lib:getBitTask(%tbBITTSK_LIMIT_3)
	
end


-- Khi Boss c�y ch�t
function OnDeath(nNpcIdx)
	local szPlayerName = GetName()
	if (szPlayerName ~= %TreeBossOwner.PlayerName[nNpcIdx]) then
		nTimerId =  %TreeBossOwner.Timer[nNpcIdx]
		DelTimer(nTimerId)	
		%TreeBossOwner.PlayerName[nNpcIdx] =nil	
		%TreeBossOwner.TreeName[nNpcIdx] = nil
		%TreeBossOwner.Timer[nNpcIdx] = nil		
		Msg2Player("��nh c�y c�a ng��i kh�c kh�ng nh�n ���c g�")
		return
	end
	
	local szTreeName = %TreeBossOwner.TreeName[nNpcIdx]
	
	if (szTreeName == "M�c Lam B�ng Tinh") then
		 tbAwardTemplet:Give(tbAward_BossTree_1, 1, {EVENT_LOG_TITLE, 	format("Kill Tree Boss %s",szTreeName )}) 		
	 end 
	 if (szTreeName == "M�c Ho�ng B�ng Tinh") 	then 
	 	tbAwardTemplet:Give(tbAward_BossTree_2, 1, {EVENT_LOG_TITLE, format("Kill Tree Boss %s",szTreeName )}) 	 
	end 
	if (szTreeName == "M�c Huy�n B�ng Tinh") then 
		tbAwardTemplet:Give(tbAward_BossTree_3, 1, {EVENT_LOG_TITLE, format("Kill Tree Boss %s",szTreeName )})
		if ( CalcFreeItemCellCount()  < 1) then
			Talk (1,"","H�nh trang �� ��y n�n ph�n th��ng �� b� m�t")
			return
		end
		pActivity:UseTieuHuyenBT() 
	end	
	
	nTimerId =  %TreeBossOwner.Timer[nNpcIdx]
	DelTimer(nTimerId)	
	%TreeBossOwner.PlayerName[nNpcIdx] =nil 
	%TreeBossOwner.TreeName[nNpcIdx] = nil 
	%TreeBossOwner.Timer[nNpcIdx] = nil

end