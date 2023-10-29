Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\lib\\sharedata.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
--Fix bug missing lib - modified by DinhHQ - 20110425
Include("\\script\\lib\\droptemplet.lua")
IncludeLib("LEAGUE")

BigBoss = {}

BigBoss.TSK_PLAYER_BOSSKILLED = 2598; -- ��һ�ɱBOSS����ͳ��
BigBoss.TSK_BIGBOSS_REWARD = 2661; -- ��¼��ҵ����Ƿ��콱���콱���� ���� | ��ô��ط��� | ����ν𷭱� |��þ��鷭������ | �Ƿ��콱
BigBoss.CAN_GET_REWARD_BIT = 1;
BigBoss.EXP_REWARD_BIT = 2;
BigBoss.SONGJIN_REWARD_BIT = 3;
BigBoss.CHUANGGUAN_REWARD_BIT = 4;

BigBoss.tbKillRecord = {};
BigBoss.IsBigBossDead = 0;
BigBoss.CallBackParam = {}
--Change big boss reward - modified By DinhHQ - 20130802
BigBoss.tbGlobalReward = 
{
	{szName="H�m nay tr�n T�ng Kim 21:00, �i�m t�ch l�y s� ���c nh�n ��i", nRate=50, pFun=function() PlayerFunLib:SetTaskBit(BigBoss.TSK_BIGBOSS_REWARD, BigBoss.SONGJIN_REWARD_BIT, 1); Msg2Player(format("��i hi�p nh�n ���c ph�n th��ng <color=yellow>%s<color>","H�m nay tr�n T�ng Kim 21:00, �i�m t�ch l�y s� ���c nh�n ��i"))end},
	{szName="H�m nay v��t �i ��t 21:00, �i�m kinh nghi�m s� ���c nh�n ��i", nRate=50, pFun=function() PlayerFunLib:SetTaskBit(BigBoss.TSK_BIGBOSS_REWARD, BigBoss.CHUANGGUAN_REWARD_BIT, 1); Msg2Player(format("��i hi�p nh�n ���c ph�n th��ng <color=yellow>%s<color>","H�m nay v��t �i ��t 21:00, �i�m kinh nghi�m s� ���c nh�n ��i"))end},
	--{szName="Nh�n ��i kinh nghi�m khi ��nh qu�i trong 1 gi�", nRate=25, pFun=function() AddSkillState(967, 1, 1, 64800); PlayerFunLib:SetTaskBit(BigBoss.TSK_BIGBOSS_REWARD, BigBoss.EXP_REWARD_BIT, 1); Msg2Player(format("��i hi�p nh�n ���c ph�n th��ng <color=yellow>%s<color>","Nh�n ��i kinh nghi�m khi ��nh qu�i trong 1 gi�"))end},
	--{nExp = 10000000, nRate=25},
}
--doc co thien phong
BigBoss.tbKillerReward = 
{
	{tbProp = {6,1,2127,1,0,0}, nCount=1, nExpiredTime=43200},
	{tbProp = {4,239,1,1,0,0}, nCount=10},
	{tbProp = {4,238,1,1,0,0}, nCount=10},
	{tbProp = {4,240,1,1,0,0}, nCount=10},
	{tbProp = {4,353,1,1,0,0}, nCount=20},
	{tbProp = {0,11,450,1,0,0}, nCount=1, nExpiredTime=10080},
	{tbProp = {6,1,907,1,0,0}, nCount=8, nExpiredTime=10080},
	{tbProp = {6,1,1075,1,0,0}, nCount=8},
	{tbProp = {6,1,2126,1,0,0}, nCount=1, nExpiredTime=10080},
}

BigBoss.tbNormalDrop = 
{
	{tbProp = {6,1,1075,1,0,0}, nCount=3},
	{tbProp = {4,239,1,1,0,0}, nCount=20},
	{tbProp = {4,238,1,1,0,0}, nCount=20},
	{tbProp = {4,240,1,1,0,0}, nCount=20},
	{tbProp = {4,353,1,1,0,0}, nCount=20},
	{tbProp = {6,1,1672,1,0,0}, nCount=10},
	{tbProp = {0,11,450,1,0,0}, nCount=1, nExpiredTime=10080},
	{tbProp = {6,1,2115,1,0,0}, nCount=10},
	{tbProp = {6,1,2117,1,0,0}, nCount=10},
	{tbProp = {6,0,6,1,0,0}, nCount=20},
	{tbProp = {6,0,3,1,0,0}, nCount=20},
	{tbProp = {6,1,71,1,0,0}, nCount=20},
	{tbProp = {6,1,1765,1,0,0}, nCount=10},
	{tbProp = {6,1,26,1,0,0}, nCount=10},
	{tbProp = {6,1,22,1,0,0}, nCount=10},
}

-- �i�u ch�nh ph�n th��ng r�t ra - Modified by ThanhLD -20130417
BigBoss.tbVngNewAward = 
{

	------------------------------------test--------------\

 	[1]={{szName="B�nh Trung Thu ��u Xanh",tbProp={6,1,891,1,0,0},nCount=1,nRate=100},},

	-- [1]={{szName="V� L�m M�t T�ch",tbProp={6,1,26,1,0,0},nCount=1,nRate=1},},
	-- [2]={{szName="T�y T�y Kinh",tbProp={6,1,22,1,0,0},nCount=1,nRate=1},},
 -- 	[3]={{szName="Thi�t La H�n",tbProp={6,1,23,1,0,0},nCount=1,nRate=10},},	
	-- [4]={{szName="T� Th�y Tinh",tbProp={4,239,1,1,0,0},nCount=1,nRate=5},},
	-- [5]={{szName="Lam Th�y Tinh",tbProp={4,238,1,1,0,0},nCount=1,nRate=5},},
	-- [6]={{szName="L�c Th�y Tinh",tbProp={4,240,1,1,0,0},nCount=1,nRate=5},},
	-- [7]={{szName="Tinh H�ng B�o Th�ch",tbProp={4,353,1,1,0,0},nCount=1,nRate=3},},
	-- [8]={{szName="B�ch Qu� L�",tbProp={6,1,73,1,0,0},nCount=1,nRate=10},},
	-- [9]={{szName="Phi Phong",tbProp={6,1,15,1,0,0},nCount=1,nRate=20},},
	-- [10]={{szName="Ph�c Duy�n (ti�u)",tbProp={6,1,122,1,0,0},nCount=1,nRate=30},},
	-- [11]={{szName="Ph�c Duy�n (trung)",tbProp={6,1,123,1,0,0},nCount=1,nRate=30},},
	-- [12]={{szName="Ph�c Duy�n (��i)",tbProp={6,1,124,1,0,0},nCount=1,nRate=10},},
	-- [13]={{szName="��i l�c ho�n",tbProp={6,0,3,1,0,0},nCount=1,nRate=9},},
	-- [14]={{szName="��i l�c ho�n",tbProp={6,0,6,1,0,0},nCount=1,nRate=10},},




	-- [1] = {{szName="X�ch L�n L�nh",tbProp={6,1,3393,1,0,0},nCount=1,nRate=0.4},},
	-- [2] = {{szName="M�nh X�ch L�n",tbProp={6,1,3391,1,0,0},nCount=1,nRate=3},},
	-- [3] = {{szName="X�ch L�n Kim B�i",tbProp={6,1,3392,1,0,0},nCount=1,nRate=4},},
	-- [4] = {{szName="X�ch L�n Tr�o",tbProp={6,1,3394,1,0,0},nCount=1,nRate=7},},
	-- [5] = {{szName="X�ch L�n Gi�c",tbProp={6,1,3395,1,0,0},nCount=1,nRate=4},},
	-- [6] = {{szName="X�ch L�n T�nh",tbProp={6,1,3396,1,0,0},nCount=1,nRate=2.5},},
	-- [7] = {{szName="B�ch H� Ph�t Qu�n - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={2,0,0,0,0,0}},},
	-- [8] = {{szName="B�ch H� Kim Kh�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.3,tbParam={6,0,0,0,0,0}},},
	-- [9] = {{szName="B�ch H� Y�u ��i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={5,0,0,0,0,0}},},
	-- [10] = {{szName="B�ch H� H�ng Li�n - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={1,0,0,0,0,0}},},
	-- [11] = {{szName="B�ch H� Ng�c B�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={9,0,0,0,0,0}},},
	-- [12] = {{szName="B�ch H� H�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={8,0,0,0,0,0}},},
	-- [13] = {{szName="B�ch H� H� Uy�n - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={4,0,0,0,0,0}},},
	-- [14] = {{szName="B�ch H� Th��ng Gi�i Ch� - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={3,0,0,0,0,0}},},
	-- [15] = {{szName="B�ch H� H� Gi�i Ch� - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.5,tbParam={10,0,0,0,0,0}},},
	-- [16] = {{szName="B�ch H� Kh� Gi�i - T� ch�n h� ph�i",tbProp={6,1,30242,1,0,0},nCount=1,nRate=0.2,tbParam={7,0,0,0,0,0}},},
	-- [17] = {{szName="X�ch L�n Ph�t Qu�n - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={2,0,0,0,0,0}},},
	-- [18] = {{szName="X�ch L�n Kim Kh�i - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.04,tbParam={6,0,0,0,0,0}},},
	-- [19] = {{szName="X�ch L�n Y�u ��i - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={5,0,0,0,0,0}},},
	-- [20] = {{szName="X�ch L�n H�ng Li�n - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={1,0,0,0,0,0}},},
	-- [21] = {{szName="X�ch L�n Ng�c B�i - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={9,0,0,0,0,0}},},
	-- [22] = {{szName="X�ch L�n H�i - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={8,0,0,0,0,0}},},
	-- [23] = {{szName="X�ch L�n H� Uy�n - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.07,tbParam={4,0,0,0,0,0}},},
	-- [24] = {{szName="X�ch L�n Th��ng Gi�i Ch� - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.06,tbParam={3,0,0,0,0,0}},},
	-- [25] = {{szName="X�ch L�n H� Gi�i Ch� - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.06,tbParam={10,0,0,0,0,0}},},
	-- [26] = {{szName="X�ch L�n Kh� Gi�i - T� ch�n h� ph�i",tbProp={6,1,30386,1,0,0},nCount=1,nRate=0.03,tbParam={7,0,0,0,0,0}},},
	-- [27] = {{szName="C�n Kh�n Song Tuy�t B�i",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.6,nExpiredTime=43200},},
	-- [28] = {{szName="C�ng Hi�n L� bao",tbProp={6,1,30214,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
	-- [29] = {{szName="Ki�n Thi�t L� Bao",tbProp={6,1,30216,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
	-- [30] = {{szName="Chi�n B� L� Bao",tbProp={6,1,30218,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},
	-- [31] = {{szName="Bao D��c ho�n ",tbProp={6,1,910,1,0,0},nCount=1,nRate=15,nExpiredTime=20160},},
	-- [32] = {{szName="B�ch H� Tr�ng Luy�n Ng�c",tbProp={6,1,3187,1,0,0},nCount=1,nRate=3},},
	-- [33] = {{szName="M�c B�c Truy�n T�ng L�nh",tbProp={6,1,1448,1,0,0},nCount=1,nRate=5,nExpiredTime=20160},},
	-- [34] = {{szName="V� L�m M�t T�ch",tbProp={6,1,26,1,0,0},nCount=1,nRate=5},},
	-- [35] = {{szName="T�y T�y Kinh",tbProp={6,1,22,1,0,0},nCount=1,nRate=5},},
	-- [36] = {{szName="Thi�n Linh ��n",tbProp={6,1,3022,1,0,0},nCount=1,nRate=5,nExpiredTime=10080},},
	-- [37] = {{szName="��i l�c ho�n l� bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=7,nExpiredTime=10080},},
	-- [38] = {{szName="Phi t�c ho�n l� bao",tbProp={6,1,2520,1,0,0},nCount=1,nRate=7,nExpiredTime=10080},},
	-- [39] = {{szName="Qu� Ho�ng Kim",tbProp={6,1,907,1,0,0},nCount=1,nRate=10,nExpiredTime=10080},},

}

function AddKillRecord_CallBack(Param, ResultHandle)
	szName = BigBoss.CallBackParam[Param][1];
	nSecondes = BigBoss.CallBackParam[Param][2];
	BigBoss.CallBackParam[Param] = nil;
	if (OB_IsEmpty(ResultHandle) == 0) then
		BigBoss.tbKillRecord = ObjBuffer:PopObject(ResultHandle);
	end
	
	local nIdx = 0;
	
	local nIdx = 0;
	for i=1,getn(BigBoss.tbKillRecord) do
		if (BigBoss.tbKillRecord[i][2] > nSecondes) then
			nIdx = i;
			break;
		end
	end
	
	if (nIdx == 0) then
		nIdx = getn(BigBoss.tbKillRecord) + 1;
	end
	
	tinsert(BigBoss.tbKillRecord, nIdx, {szName, nSecondes});
	
	local nCount = 0;
	
	-- ������óɼ�
	for i=1,getn(BigBoss.tbKillRecord) do
		if (BigBoss.tbKillRecord[i] and BigBoss.tbKillRecord[i][1] == szName) then
			nCount = nCount + 1;
			if (nCount > 1) then
				tremove(BigBoss.tbKillRecord, nIdx);
			end
		end
	end
	
	SaveShareData("FUNC_BIGBOSS_LADDER", 0, 0, BigBoss.tbKillRecord);
end

function BigBoss:AddKillRecord(szName, nSecondes)
	self.CallBackParam[getn(self.CallBackParam)+1] = {szName, nSecondes};
	
	LoadShareData("FUNC_BIGBOSS_LADDER", 0, 0, "AddKillRecord_CallBack", getn(self.CallBackParam));
end

function BigBoss:GetKillRecord(szCallBack, nParam)
	nParam = nParam or 0;
	LoadShareData("FUNC_BIGBOSS_LADDER", 0, 0, szCallBack, nParam);
end

function BigBoss:BigBossGlobalReward()
	self.CallBackParam[getn(self.CallBackParam) + 1] = PlayerIndex;
	RemoteExecute("\\script\\mission\\boss\\bigboss.lua", "IsBigBossDead", 0, "BigBossGlobalReward_CallBack", getn(self.CallBackParam));
end

function BigBossGlobalReward_CallBack(Param, ResultHandle)
	local Index = BigBoss.CallBackParam[Param]
	if (Index and Index > 0) then
		local OldPlayerIndex = PlayerIndex
		PlayerIndex = Index
		if (OB_IsEmpty(ResultHandle) == 0) then
			IsBigBossDead = ObjBuffer:PopObject(ResultHandle);
			if (IsBigBossDead == 1) then
				PlayerFunLib:AddTaskDaily(BigBoss.TSK_BIGBOSS_REWARD, 0);	-- ���ñ���,�Է�����
				if (PlayerFunLib:CheckTaskBit(BigBoss.TSK_BIGBOSS_REWARD, BigBoss.CAN_GET_REWARD_BIT, 1, "H�m nay ��i hi�p �� nh�n th��ng r�i!") == 1) then
					PlayerFunLib:SetTaskBit(BigBoss.TSK_BIGBOSS_REWARD, BigBoss.CAN_GET_REWARD_BIT, 0);
					tbAwardTemplet:GiveAwardByList(BigBoss.tbGlobalReward, format("[%s] big boss global reward",date("%Y%m%d")));
				end
			else
				Talk(1, "", format("H�m nay v�n ch�a ��nh b�i <color=red>%s<color>","��c C� Thi�n Phong"));
			end
		end
		--
		PlayerIndex = OldPlayerIndex
		BigBoss.CallBackParam[Param] = nil
	end
end

function BigBoss:BigBossDeath(nNpcIndex)
	Msg2Player("HNT TEST BBBBBBBBBBBBBBBBBBBBBBBBB")
	-- ��¼ʱ��
	local nTime = tonumber(GetLocalDate("%H%M%S"))-194500; -- ����ʱ�� - �ٻ�ʱ��
	
	-- ������˺����˻���齱��
	local nTeamSize = GetTeamSize();
	local szName;
	
	if (nTeamSize > 1) then
		for i=1,nTeamSize do
			if(doFunByPlayer(GetTeamMember(i), IsCaptain)==1)then
				szName = doFunByPlayer(GetTeamMember(i), GetName);
			end
			doFunByPlayer(GetTeamMember(i), PlayerFunLib.AddExp, PlayerFunLib, 5000000, 0, format("%s ph�n th��ng","Ph�n th��ng kinh nghi�m cho ��i c� c�ng k�ch m�nh nh�t v�o ��c C� Thi�n Phong"));
		end
	else -- һ����
		szName = GetName();
		PlayerFunLib:AddExp(10000000, 0, format("%s ph�n th��ng","Ph�n th��ng kinh nghi�m cho ng��i c� c�ng k�ch m�nh nh�t v�o ��c C� Thi�n Phong"));
	end
	
	local tbRoundPlayer, nCount = GetNpcAroundPlayerList(nNpcIndex, 20);
	
	for i=1,nCount do
		doFunByPlayer(tbRoundPlayer[i], PlayerFunLib.AddExp, PlayerFunLib, 10000000, 0, format("%s ph�n th��ng","Ph�n th��ng kinh nghi�m cho ng��i ��ng g�n khi �� b�i ��c C� Thi�n Phong"));
	end
	
	--tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, self.tbKillerReward, format("%s r�t","��c C� Thi�n Phong"), 1);
	
	--tbDropTemplet:GiveAwardByList(nNpcIndex, -1, self.tbNormalDrop, format("%s r�t","��c C� Thi�n Phong"), 1);
	
	--DC Ph�n th��ng - Modified By DinhHQ - 20111010
	--item
--	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, self.tbVngNewDropItem, format("%s r�t","��c C� Thi�n Phong"), 1);
	--trang b�
--	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, self.tbVngNewDropEquip, format("%s r�t","��c C� Thi�n Phong"), 1);

-- �i�u ch�nh ph�n th��ng r�t ra - Modified by ThanhLD -20130417
--admin edit
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, self.tbVngNewAward, format("%s r�t","��c C� Thi�n Phong"), 1);
	-- BOSS��ɱͳ��
	local nCount = GetTask(self.TSK_PLAYER_BOSSKILLED);
	nCount = nCount + 1;
	SetTask(self.TSK_PLAYER_BOSSKILLED, nCount);
	
	-- BIGBOSS����
	local Handle = OB_Create()
	if (Handle > 0) then
		ObjBuffer:PushObject(Handle, 1)
		RemoteExecute("\\script\\mission\\boss\\bigboss.lua", "SetBigBossDead", Handle);
		OB_Release(Handle)
	end
	
	local szNews = format("T� ��i <color=yellow>%s<color> �� ti�u di�t th�nh c�ng  <color=yellow>��c C� Thi�n Phong<color>, h�y nhanh ch�ng ��n l� quan nh�n th��ng!",szName);
	AddGlobalNews(szNews);
	LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szNews , "", "");
	
	self:AddKillRecord(szName, nTime);
end

function BigBoss:RemoveSongJinBonus()
	PlayerFunLib:AddTaskDaily(self.TSK_BIGBOSS_REWARD, 0);	-- ���ñ���,�Է�����
	PlayerFunLib:SetTaskBit(self.TSK_BIGBOSS_REWARD, self.SONGJIN_REWARD_BIT, 0);
end

function BigBoss:RemoveChuangGuanBonus()
	PlayerFunLib:AddTaskDaily(self.TSK_BIGBOSS_REWARD, 0);	-- ���ñ���,�Է�����
	PlayerFunLib:SetTaskBit(self.TSK_BIGBOSS_REWARD, self.CHUANGGUAN_REWARD_BIT, 0);
end

function BigBoss:AddSongJinPoint(nBasePoint)
	PlayerFunLib:AddTaskDaily(self.TSK_BIGBOSS_REWARD, 0);	-- ���ñ���,�Է�����
	local nType = GetBit(PlayerFunLib:GetActivityTask(self.TSK_BIGBOSS_REWARD), self.SONGJIN_REWARD_BIT);
	if (nType == 1) then
		local nHour = tonumber(GetLocalDate("%H"));
		if (nHour <= 22) then -- 21����ν�22:30����
			nBasePoint = nBasePoint * 2;
		end
		
	end
	--Lunar new year 2011 - Bobus award - Modified By DinhHQ - 20120103
	local nNowDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nNowDate >= 201201200000 and nNowDate < 201201252400 and nType ~= 1 then
		nBasePoint = nBasePoint * 2;
	end
	return nBasePoint;
end

function BigBoss:AddChuangGuanPoint(nBasePoint)
	PlayerFunLib:AddTaskDaily(self.TSK_BIGBOSS_REWARD, 0);	-- ���ñ���,�Է�����
	local nType = GetBit(PlayerFunLib:GetActivityTask(self.TSK_BIGBOSS_REWARD), self.CHUANGGUAN_REWARD_BIT);
	if (nType == 1) then
		nBasePoint = nBasePoint * 2;
	end
	--Lunar new year 2011 - Bobus award - Modified By DinhHQ - 20120103
	local nNowDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nNowDate >= 201201200000 and nNowDate < 201201252400 and nType ~= 1 then
		nBasePoint = nBasePoint * 2;
	end
	return nBasePoint;
end

function BigBoss:MakeAllPlayerCanGetReward()
	local nIdx = GetFirstPlayerAtServer();
	while(nIdx > 0) do
		doFunByPlayer(nIdx, PlayerFunLib.AddTaskDaily, PlayerFunLib, self.TSK_BIGBOSS_REWARD, 0);
		doFunByPlayer(nIdx, PlayerFunLib.SetTaskBit, PlayerFunLib, self.TSK_BIGBOSS_REWARD, self.CAN_GET_REWARD_BIT, 1);
		nIdx = GetNextPlayerAtServer();
	end
end