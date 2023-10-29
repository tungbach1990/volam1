IncludeLib("TASKSYS")
Include("\\script\\global\\signet_head.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
IncludeLib("LEAGUE")
Include("\\script\\lib\\droptemplet.lua")
--���������� ����
--honour
DROPRATE_BOSS_HONOURRATE = {
		["V��ng T� "] = {350, 136},--739
		["Huy�n Gi�c ��i S� "] = {350, 134},--740
		["���ng B�t Nhi�m"] = {350, 149},--741
		["B�ch Doanh Doanh"] = {350, 138},--742
		["Thanh Tuy�t S� Th�i"] = {350, 137},--743
		["Y�n Hi�u Tr�i"] = {350, 168},--744
		["H� Nh�n Ng� "] = {350, 171},--
		["��n T� Nam"] = {350, 171},--746745
		["Tuy�n C� T� "] = {350, 144},--747
		--["����"] = {},--748
		["%����%"] = {350, 250},--1193
		["����Ӣ������"] = {350, 250},--1194
		["׷����ʿ"] = {350, 250},--1195
		["����Ҳ�������"] = {350, 250},--1196
		["��սѪ"] = {350, 250},--1197
		["��������"] = {350, 250},--1198
		["��¥��������"] = {350, 250},--1199
		["�����㡩�����̡�"] = {350, 250},--1200
		["�ŵ���"] = {350, 250},--1201
		["�ǻ��Ů��"] = {350, 250},--1202
		["��i M� H� "] = {0, 250},
		["Gia Lu�t T� Ly"] = {350, 130},--563
		["Ho�n Nhan Tuy�t Y"] = {400, 130},--564
		["�oan M�c Du� "] = {400, 127},--565
		["C� B�ch"] = {350, 141},--566
		["��o Thanh Ch�n Nh�n"] = {300, 130},--562
		["Chung Linh T� "] = {400, 130},--567
		["H� Linh Phi�u"] = {400, 130},--568
		["Lam Y Y"] = {250, 176},--582
		["M�nh Th��ng L��ng"] = {300, 180},--583
		--[] = {},
}
HONOURID = {1257, 1294}
SIGNET_DROPCOUNT = 10
TSK_PLAYER_BOSSKILLED = 2598 -- ��һ�ɱBOSS����ͳ��
--DC kinh nghi�m boss HK - Modified By DinhHQ - 20111007
--KILLBOSSEXPAWARD = 20000000	-- ��ɱboss����
--KILLBOSSNEAREXPAWARD = 12000000	-- ��ɱboss��������
KILLBOSSEXPAWARD = 3000000
KILLBOSSNEAREXPAWARD = 1000000
--Renew boss award - Modified by ThanhLD - 20130422
local tbVnNewItemDropAward = {
--------------------------------test--------------------------------------------------------------------
	--[1]={{szName="L� V�t Trung Thu",tbProp={6,1,897,1,0,0},nCount=1,nRate=100},},
------------------------boss ��i------HK---------------------------
	{{szName="V� L�m M�t T�ch",tbProp={6,1,26,1,0,0},nCount=1,nRate=1},},
	{{szName="T�y T�y Kinh",tbProp={6,1,22,1,0,0},nCount=1,nRate=1},},
 	{{szName="Thi�t La H�n",tbProp={6,1,23,1,0,0},nCount=1,nRate=0.5},},	
	{{szName="T� Th�y Tinh",tbProp={4,239,1,1,0,0},nCount=1,nRate=0.5},},
	{{szName="Lam Th�y Tinh",tbProp={4,238,1,1,0,0},nCount=1,nRate=0.5},},
	{{szName="L�c Th�y Tinh",tbProp={4,240,1,1,0,0},nCount=1,nRate=0.5},},
	{{szName="Tinh H�ng B�o Th�ch",tbProp={4,353,1,1,0,0},nCount=1,nRate=0.5},},
	{{szName="B�ch Qu� L�",tbProp={6,1,73,1,0,0},nCount=1,nRate=10},},
	{{szName="Phi Phong",tbProp={6,1,15,1,0,0},nCount=1,nRate=20},},
	{{szName="Ph�c Duy�n (ti�u)",tbProp={6,1,122,1,0,0},nCount=1,nRate=30},},
	{{szName="Ph�c Duy�n (trung)",tbProp={6,1,123,1,0,0},nCount=1,nRate=30},},
	{{szName="Ph�c Duy�n (��i)",tbProp={6,1,124,1,0,0},nCount=1,nRate=10},},
	{{szName="��i l�c ho�n",tbProp={6,0,3,1,0,0},nCount=1,nRate=9},},
	{{szName="��i l�c ho�n",tbProp={6,0,6,1,0,0},nCount=1,nRate=10},},
	-----------------------m�t t�ch m�n ph�i----------------------------
	{{szName="M�t T�ch",tbProp={6,1,33,1,0,0},nCount=1,nRate=0.5},},
	--{{szName="M�t T�ch",tbProp={6,1,34,1,0,0},nCount=1,nRate=0.5},},
	{{szName="M�t T�ch",tbProp={6,1,34,1,0,0},nCount=1,nRate=0.5},},
	--{{szName="M�t T�ch",tbProp={6,1,35,1,0,0},nCount=1,nRate=0.5},},
	--{{szName="M�t T�ch",tbProp={6,1,34,1,0,0},nCount=1,nRate=0.5},},
	{{szName="M�t T�ch",tbProp={6,1,35,1,0,0},nCount=1,nRate=0},},
	{{szName="M�t T�ch",tbProp={6,1,36,1,0,0},nCount=1,nRate=0.5},},
	{{szName="M�t T�ch",tbProp={6,1,37,1,0,0},nCount=1,nRate=0.5},},
	{{szName="M�t T�ch",tbProp={6,1,38,1,0,0},nCount=1,nRate=0.5},},
	{{szName="M�t T�ch",tbProp={6,1,39,1,0,0},nCount=1,nRate=0.5},},
	{{szName="M�t T�ch",tbProp={6,1,40,1,0,0},nCount=1,nRate=0.5},},
	{{szName="M�t T�ch",tbProp={6,1,41,1,0,0},nCount=1,nRate=0.5},},
	{{szName="M�t T�ch",tbProp={6,1,42,1,0,0},nCount=1,nRate=0.5},},
	{{szName="M�t T�ch",tbProp={6,1,43,1,0,0},nCount=1,nRate=0.5},},
	{{szName="M�t T�ch",tbProp={6,1,44,1,0,0},nCount=1,nRate=0.5},},
	{{szName="M�t T�ch",tbProp={6,1,45,1,0,0},nCount=1,nRate=0.5},},
	{{szName="M�t T�ch",tbProp={6,1,46,1,0,0},nCount=1,nRate=0.5},},
	{{szName="M�t T�ch",tbProp={6,1,47,1,0,0},nCount=1,nRate=0.5},},
	{{szName="M�t T�ch",tbProp={6,1,48,1,0,0},nCount=1,nRate=0.5},},
	{{szName="M�t T�ch",tbProp={6,1,49,1,0,0},nCount=1,nRate=0.5},},
	{{szName="M�t T�ch",tbProp={6,1,50,1,0,0},nCount=1,nRate=0.5},},
	{{szName="M�t T�ch",tbProp={6,1,51,1,0,0},nCount=1,nRate=0.5},},
	{{szName="M�t T�ch",tbProp={6,1,52,1,0,0},nCount=1,nRate=0},},
	{{szName="M�t T�ch",tbProp={6,1,53,1,0,0},nCount=1,nRate=0.5},},
	{{szName="M�t T�ch",tbProp={6,1,54,1,0,0},nCount=1,nRate=0.5},},
	{{szName="M�t T�ch",tbProp={6,1,55,1,0,0},nCount=1,nRate=0.5},},
	{{szName="M�t T�ch",tbProp={6,1,56,1,0,0},nCount=1,nRate=0.5},},
	{{szName="M�t T�ch",tbProp={6,1,57,1,0,0},nCount=1,nRate=0.5},},
	{{szName="M�t T�ch",tbProp={6,1,58,1,0,0},nCount=1,nRate=0.5},},
	{{szName="M�t T�ch",tbProp={6,1,59,1,0,0},nCount=1,nRate=0.5},},

	
}

function OnDeath( nNpcIndex )

	local x, y, world = GetNpcPos(nNpcIndex);
	local maxcount = SIGNET_DROPCOUNT;
	local _, nTongID = GetTongName();
	if (nTongID > 0) then
		if (IsDoubledMoneyBox(nTongID)) then
			maxcount = getSignetDropRate(SIGNET_DROPCOUNT);
		end;
	end;
	local nCurtime = GetCurServerTime() + 7 * 24 *60 * 60
	local nYear = tonumber(FormatTime2String("%Y", nCurtime))
	local nMonth = tonumber(FormatTime2String("%m", nCurtime))
	local nDay = tonumber(FormatTime2String("%d", nCurtime))
	--B� ph�n th��ng v�t ph�m khi ti�u di�t boss - Modified by DinhHQ - 20111012
--	for i = 1, maxcount do
--		local nItemIdx = DropItem(world, x, y, PlayerIndex, 6, 1, 1094, 1, 0, 0, 0, 0, 0, 0, 0, 0);
--		SetSpecItemParam(nItemIdx, 1, nCurtime);
--		SetSpecItemParam(nItemIdx, 2, nYear)
--		SetSpecItemParam(nItemIdx, 3, nMonth)
--		SetSpecItemParam(nItemIdx, 4, nDay)
--		SyncItem(nItemIdx);
--	end;
	--Renew boss award - Modified by ThanhLD - 10130417
	--admin off
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,%tbVnNewItemDropAward,format("killed_%s",GetNpcName(nNpcIndex)))	
	-- �����������Ƶ���
	if (GetProductRegion() == "cn" or GetProductRegion() == "cn_ib") then
		local szNpcName = GetNpcName(nNpcIndex);
		if (DROPRATE_BOSS_HONOURRATE[szNpcName]) then
			for i = 1, getn(DROPRATE_BOSS_HONOURRATE[szNpcName]) do
				local nrate = random(1, 10000);
				if (nrate < DROPRATE_BOSS_HONOURRATE[szNpcName][i]) then
				DropItem(world, x, y, PlayerIndex, 6, 1, HONOURID[i], 1, 0, 0, 0, 0, 0, 0, 0, 0);
				end;
			end;
		end;
	end;
	
	-- ��ɱ��BOSS���˻���齱��
	local nTeamSize = GetTeamSize();
	local szName;
	
	if (nTeamSize > 1) then
		for i=1,nTeamSize do
			if(doFunByPlayer(GetTeamMember(i), IsCaptain)==1)then
				szName = doFunByPlayer(GetTeamMember(i), GetName);
			end
			doFunByPlayer(GetTeamMember(i), PlayerFunLib.AddExp, PlayerFunLib, KILLBOSSEXPAWARD, 0, format("%s ph�n th��ng","Kinh nghi�m �� b�i BOSS ho�ng kim"));
			Msg2Player("��i hi�p nh�n ���c kinh nghi�m gi�t team gi�t boss: "..KILLBOSSEXPAWARD)
		end
	else -- һ����
		szName = GetName();
		PlayerFunLib:AddExp(KILLBOSSEXPAWARD, 0, format("%s ph�n th��ng","Kinh nghi�m �� b�i BOSS ho�ng kim"));
		Msg2Player("��i hi�p nh�n ���c kinh nghi�m gi�t boss: "..KILLBOSSEXPAWARD)
	end
	
	local tbRoundPlayer, nCount = GetNpcAroundPlayerList(nNpcIndex, 20);
	
	for i=1,nCount do
		doFunByPlayer(tbRoundPlayer[i], PlayerFunLib.AddExp, PlayerFunLib, KILLBOSSNEAREXPAWARD, 0, format("%s ph�n th��ng","Kinh nghi�m ��ng g�n l�c BOSS ho�ng kim b� ti�u di�t"));
		Msg2Player("��i hi�p nh�n ���c kinh nghi�m ��ng g�n boss: "..KILLBOSSNEAREXPAWARD)
	end
	
	local szNews = format("��i hi�p <color=yellow>%s<color> t�i <color=yellow>%s<color> �� ti�u di�t th�nh c�ng <color=yellow>%s<color>!", szName, SubWorldName(SubWorld),GetNpcName(nNpcIndex));
	AddGlobalNews(szNews);
	--LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szNews , "", "");
	
	-- BOSS��ɱͳ��
	local nCount = GetTask(TSK_PLAYER_BOSSKILLED);
	nCount = nCount + 1;
	SetTask(TSK_PLAYER_BOSSKILLED, nCount);
	
	if (GetNpcParam(nNpcIndex, 1) == 1) then --19:30�Ļƽ�BOSS
		-- �ƽ�BOSS����
		RemoteExecute("\\script\\mission\\boss\\bigboss.lua", "ReduceGoldBossCount", 0);
	end
end;

