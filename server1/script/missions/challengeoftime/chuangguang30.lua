-- ���ص��� 2011.03.01
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\misc\\eventsys\\eventsys.lua")
Include("\\script\\missions\\challengeoftime\\npc.lua")
Include("\\script\\missions\\challengeoftime\\include.lua")

Include("\\script\\item\\heart_head.lua")
Include("\\script\\item\\forbiditem.lua")

Include("\\script\\activitysys\\g_activity.lua")

ChuangGuan30 = 
{
	tbGroup = {},
	tbPlayer = {},
	tbRegist = {},
	tbMapList = {[CHUANGGUAN30_MAP_ID] = 1,},
	nCount = 0,
	bActive = 0,			-- boss�Ƿ����
	nChuangguan30Timeid = nil
} 

ChuangGuan30.tbForbitItemType = --���� Υ������
{
	"TRANSFER","MATE"
}
ChuangGuan30.szMapType = "M�t Ph�ng c�a �i" --�ı��ͼ��ʾ
--Give message to all player in map about the lucky award - Modifed by DinhHQ - 20110510
function AnnounceLuckyAward(strAwardName)		
	local strMsg = format("T� ��i c�a <color=yellow>%s<color> �� ti�u di�t th�nh c�ng boss %s, gi�nh ���c ph�n th��ng ��c bi�t l� <color=yellow>%s<color>", GetName(), "trong M�t Ph�ng C�a �i", strAwardName)
	Msg2Team(strMsg)			
	Msg2SubWorld(strMsg)
	AddGlobalNews(strMsg)	
end

--Modifiled by:ThanhLD - 20140226 - change award from  Boss cu�i t�nh n�ng V��t �i
tbVnItemAwardEx = {
	[1] = {--Ph�n 1
		-- {szName="Tinh Tinh Kho�ng",tbProp={6,1,3811,1,0,0},nCount=1,nRate=20},
		-- {szName="Tinh Thi�t Kho�ng",tbProp={6,1,3810,1,0,0},nCount=1,nRate=10},
				{szName="Phi T�c ho�n",tbProp={6,0,6,1,0,0},nCount=1,nRate=15},
	},
	[2] = {--Ph�n 2
		-- {szName="T�i D��c Ph�m",tbProp={6,1,30557,1,0,0},nCount=1,nRate=30},
		-- {szName="C�n Kh�n T�o H�a �an (��i)",tbProp={6,1,215,1,0,0},nCount=50,nRate=40},
		{szName="��i L�c ho�n",tbProp={6,0,3,1,0,0},nCount=1,nRate=15},
		{szName="Phi T�c ho�n",tbProp={6,0,6,1,0,0},nCount=1,nRate=15},
	},
	[3] = {--Ph�n 3
		-- {szName = "�� Ph� ��ng Long H�ng Li�n", tbProp = {6, 1, 30533,1,0,0}, nRate = 0.3,},
		-- {szName = "��ng Long Th�ch - H�", tbProp = {6, 1, 30538,1,0,0}, nRate = 6,nCount=5},
		-- {szName = "�� Ph� Tinh S��ng H� Uy�n", tbProp = {6, 1, 30009,1,0,0}, nRate = 0.4,},
		-- {szName = "�� Ph� Tinh S��ng H�ng Li�n", tbProp = {6, 1, 30010,1,0,0}, nRate = 0.4,},
				{szName="Phi T�c ho�n",tbProp={6,0,6,1,0,0},nCount=1,nRate=15},

	},
}

function ChuangGuan30:Init()
	self.tbGroup = {}
	self.tbPlayer = {}
	self.tbRegist = {}
	self.bActive = 0
end

function ChuangGuan30:Regist(szType, pFun, ...)
	local nRegId = EventSys:GetType(szType):Reg(CHUANGGUAN30_MAP_ID, pFun, unpack(arg))
	self.tbRegist[szType] = self.tbRegist[szType] or {}
	tinsert(self.tbRegist[szType], nRegId)
end

function ChuangGuan30:RegistAll()
	self:Regist("EnterMap", self.OnEnterMap, self)
	self:Regist("LeaveMap", self.OnLeaveMap, self)
end

function ChuangGuan30:Unregist()
	if self.tbRegist then
		for szType, tbId in self.tbRegist do
			for i=1, getn(tbId) do
				EventSys:GetType(szType):UnReg(CHUANGGUAN30_MAP_ID, tbId[i])
			end
		end
	end
end

function ChuangGuan30:SetState()
	SetTaskTemp(200,1)
	SetFightState(0)
	SetLogoutRV(1)
	SetPunish(0)
	SetCreateTeam(1)
	SetPKFlag(1)
	ForbidChangePK(1)
	DisabledUseTownP(1)
	ForbidEnmity(1)
end

function ChuangGuan30:OnEnterMap()
	
	-- ���boss�Ѿ������ˣ�������߻ر�����
	if self.bActive == 1 then
		self.KickOut()
	end
	
	-- ���з���
	-- todo���õ���ɫ��ʼ��ͼ������Ľӿ���ɶ����֪�� wangjingjun
	local nMapId = GetTask(PLAYER_MAP_TASK)
	local szName = GetName()
	self.tbGroup[nMapId] = self.tbGroup[nMapId] or {}
	tinsert(self.tbGroup[nMapId],szName)
	self.tbPlayer = self.tbPlayer or {}
	self.tbPlayer[szName] = 1
	self.nCount = self.nCount + 1
	SetDeathScript("\\script\\missions\\challengeoftime\\chuangguang30.lua")
	WriteLog("Ti�n v�o b�n ��, ng��i ch�i l�" .. szName)
	SetTmpCamp(nMapId) -- ����player����Ӫ
	self:SetState()
end

function ChuangGuan30:GiveAward(nGroupId, nCount)
	if GetTask(PLAYER_MAP_TASK) == nGroupId then
		local tbPro = {			
			{szName="�i�m Kinh Nghi�m",nExp = 20e6},
		}
		tbAwardTemplet:GiveAwardByList(tbPro, "jixuchuangguang award", 1)
		tbAwardTemplet:GiveAwardByList(tbVnItemAwardEx, "jixuchuangguang item award", 1)
	end
end

function ChuangGuan30:KickOut()
	-- �߻ر�����
	SetLogoutRV(0)
	NewWorld(11,3207,4978) -- �ɶ���߱��
end

function ChuangGuan30:OnLeaveMap()
	local szName = GetName()
	self.tbPlayer[szName] = 0
	self.nCount = self.nCount - 1
	SetCurCamp(GetCamp())
	SetTmpCamp(0)							--ȡ����ʱ��Ӫ
	SetTaskTemp(200,0)
	SetFightState(0)
	SetPunish(1)
	SetCreateTeam(1)
	SetPKFlag(0)
	ForbidChangePK(0)
	SetTask(PLAYER_MAP_TASK,0)
	SetDeathScript("")
	ForbidEnmity(0)
	
end

function OnDeath(nPlayerIndex)
	ChuangGuan30:KickOut()
end
function ChuangGuan30:OnNpcDeath(nNpcIndex, nPlayerIndex)
	local _,_, nMapIndex = GetNpcPos(nNpcIndex)
	local nMapId = SubWorldIdx2ID(nMapIndex)
	if nMapId ~= CHUANGGUAN30_MAP_ID then
		return 
	end
	local nNpcId = GetNpcSettingIdx(nNpcIndex)
	if nNpcId < map_new_Ncp[2].nNpcId and nNpcId > map_new_Ncp[11].nNpcId then
		return 
	end

	local nGroup = CallPlayerFunction(nPlayerIndex, GetTask, PLAYER_MAP_TASK)
	-- ����������
	local nCount = AWARD_COUNT	
	
	for _, szName in(self.tbGroup[nGroup]) do
		if self.tbPlayer[szName] == 1 then
			local nPlayerIndex = SearchPlayer(szName)
			if nPlayerIndex > 0 then
				--Adjust number of awards to 2 - Modified by DinhHQ - 20110504
				CallPlayerFunction(nPlayerIndex, self.GiveAward, self, nGroup, 2)
			end
		end
	end
	
	self:OnMessage(nGroup)
	self:KickOutAll()
end


function ChuangGuan30:OnMessage(nGroup)
	local tbAllPlayer = {}
	local batch = 30
	local n_level = 1
	for _, szName in(self.tbGroup[nGroup]) do
		if self.tbPlayer[szName] == 1 then
			local nPlayerIndex = SearchPlayer(szName)
			if nPlayerIndex > 0 then
				tbAllPlayer[getn(tbAllPlayer)+1] = nPlayerIndex;
			end
		end
	end
	G_ACTIVITY:OnMessage("Chuanguan", batch, tbAllPlayer, n_level);
end

function ChuangGuan30:KickOutAll()
	for szName, bFlag in self.tbPlayer do
		if bFlag == 1 then
			local nPlayerIndex = SearchPlayer(szName)
			CallPlayerFunction(nPlayerIndex, self.KickOut, self)
		end
	end
	-- ��״̬����Ϊbossδ����
	self.bActive = 0
	self.tbGroup = {}
end

function ChuangGuan30:OnAddBoss()
	local nBossid = random(2,11)
	-- ���ص��� by wangjingjun 2011.03.02
	-- ����µ�npc������λ�õ����껹��֪��
	local szFile = "\\settings\\maps\\liandandong\\npc_3.txt"
	local x,y = get_file_pos(szFile, random(2,50), 1)
	basemission_CallNpc(map_new_Ncp[nBossid], CHUANGGUAN30_MAP_ID, x, y)
	local Msg = format("%s xu�t hi�n r�i, c�c ch� v� anh h�ng h�y nhanh ch�ng h�nh ��ng !",map_new_Ncp[nBossid].szName)
	Msg2Player(Msg)
	self.bActive = 1
end

function ChuangGuan30:FightState()
	for szName, bFlag in self.tbPlayer do
		if bFlag == 1 then
			local nPlayerIndex = SearchPlayer(szName)
			CallPlayerFunction(nPlayerIndex, SetFightState, 1)
		end
	end
end

function ChuangGuan30:GameTime()
	if self.nCount == 0 then
--		WriteLog("��ǰ��ͼû�����")
		return 0
	end
	self:OnAddBoss()
	self:FightState()
	return 0
end

function ChuangGuan30:SetForbitItem()
	local szMapType = self.szMapType
	set_MapType(CHUANGGUAN30_MAP_ID, szMapType)
	
	for i=1, getn(self.tbForbitItemType) do
		if self.tbForbitItemType[i] == "MATE" then
			FORBITMAP_LIST[CHUANGGUAN30_MAP_ID] = 1
		end
		
		tb_MapType[szMapType] = tb_MapType[szMapType] or {}
		tinsert(tb_MapType[szMapType], self.tbForbitItemType[i])
	end
end

function ChuangGuan30:AddTime()
--	WriteLog("���ü�ʱ��******************")
	local nTimeOut = CHUANGGUAN30_TIME_LIMIT + LIMIT_SIGNUP + 60;
	local nId = SubWorldID2Idx(CHUANGGUAN30_MAP_ID)
	if (SubWorldID2Idx(CHUANGGUAN30_MAP_ID) >= 0) then
		if self.nChuangguan30Timeid then
			DelTimer(self.nChuangguan30Timeid)		
		end
		self.nChuangguan30Timeid = AddTimer(nTimeOut * 18,"ChuangGuan30:GameTime",0)
		 
--		 WriteLog("id = " .. tostring(id) .. "################")
	end
end


ChuangGuan30:Unregist()
ChuangGuan30:SetForbitItem()
ChuangGuan30:Init()
ChuangGuan30:RegistAll()
