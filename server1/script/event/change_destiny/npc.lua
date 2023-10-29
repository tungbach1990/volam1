IncludeLib("ITEM")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\event\\change_destiny\\head.lua");

function main()
	return tbChangeDestiny:talk()
end

function callBack_giveZhenDan_sure(nCount)
	return tbChangeDestiny:giveZhenDan_sure(nCount)
end


-- ����NPC
function tbChangeDestiny:addNpc() 

--	if tonumber(GetLocalDate("%Y%m%d")) > self.nCloseDate then
--		 return 
--	end
	
	for i=1,getn(self.tbNpcPos) do
		npcindex = AddNpc(self.nNpcResIdx, 1, SubWorldID2Idx(self.tbNpcPos[i][1]), self.tbNpcPos[i][2] * 32, self.tbNpcPos[i][3] * 32);
		if npcindex > 0 then
			SetNpcScript(npcindex, "\\script\\event\\change_destiny\\npc.lua");
		end
	end
	
end

-- �������Ĳ�������
function tbChangeDestiny:checkBaseCondition()
	
--	if self:isCarryOn() ~= 1 then
--		CreateTaskSay({"<dec><npc>����������һ�����Ϸ���������������ˡ�", "�����ź��������϶�ౣ�ء�/Cancel"});
--		return 0;
--	end
	
	if self:canJoin() ~= 1 then
		CreateTaskSay({"<dec><npc>��i hi�p c� c�ng l�c ch�a �� th�m h�u, m�n ph�p tu h�nh ngh�ch thi�n n�y kh�ng d� tu luy�n ��u.", "Th� ra l� v�y, �a t� cao nh�n ch� �i�m/Cancel"});
		return 0;
	end
	
	return 1;
end

-- NPC�Ի�
function tbChangeDestiny:talk() 
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	if self.bDeBug == 1 then
		Msg2Player("*************************")
		Msg2Player(format("DayGiveCount:%d  DayGiveDate:%d", self:getTask(self.nTask_ZhenDan_GiveCount), self:getTask(self.nTask_ZhenDan_GiveDate)));
		Msg2Player(format("TotalGive:%d  Receive:%d  Used:%d", self:getTask(self.nTask_ZhenDan_TotalCount), self:getTask(self.nTask_GaiMing_HasReceive), self:getTask(self.nTask_GaiMing_HasUsed)));
		Msg2Player(format("Mission%d: %d	%d", self.nMissionID_Battle, self:getMissionInfo(self.nMissionID_Battle)));
		Msg2Player(format("Mission%d: %d	%d", self.nMissionID_NieShiChen, self:getMissionInfo(self.nMissionID_NieShiChen)));
		Msg2Player(format("Mission%d: %d	%d", self.nMissionID_WaterThief, self:getMissionInfo(self.nMissionID_WaterThief)));
		Msg2Player(format("Mission%d: %d	%d", self.nMissionID_Killer, self:getMissionInfo(self.nMissionID_Killer)));
		Msg2Player(" ")
	end
	
	CreateTaskSay({
		"<dec><npc>V� ��i hi�p n�y c� duy�n v�i ta, l�o phu kh�ng gi�u di�m g� ng��i. Ta c� bi�t m�t m�n ph�p tu luy�n ngh�ch thi�n h�nh, ��i hi�p c� h�ng th� t�m gi�p ta <color=green>180<color> vi�n <color=green>th�n n�ng ch�n ��n<color> v� giao cho l�o phu. Ta s� truy�n m�n ngh� n�y cho ng��i. L�o ch� d�ng t�i ��y n�a th�ng, ��i hi�p h�y nhanh ch�n l�n nh�.", 
		"Ta �� t�m ���c m�t s� th�n n�ng ch�n ��n, xin m�i l�o nh�n l�y./#tbChangeDestiny:giveZhenDan()",
		"Xin h�i ta �� n�p �� th�n n�ng ch�n ��n ch�a?/#tbChangeDestiny:queryTotalCount()",
--		"������εõ���ũ�浤��/#tbChangeDestiny:zhenDanTask()",
		"Ta �� ho�n th�nh theo y�u c�u c�a l�o, c� th� d�y ta m�n ph�p n�y ���c kh�ng?/#tbChangeDestiny:awardGaiMingJue()",
		"���c r�i, �� ta th� xem./Cancel",
		});
end

-- �Ͻ���ũ�浤
function tbChangeDestiny:giveZhenDan()
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	local nGiveDate   = self:getTask(self.nTask_ZhenDan_GiveDate);
	local nGiveCount  = self:getTask(self.nTask_ZhenDan_GiveCount);
	local nTotalCount = self:getTask(self.nTask_ZhenDan_TotalCount);
	local nDate 	  = floor(FormatTime2Number(GetCurServerTime())/10000);	-- ��ǰ����

	if nDate ~= nGiveDate then
		nGiveDate  = nDate;
		nGiveCount = 0; 
		self:setTask(self.nTask_ZhenDan_GiveDate,   nGiveDate);
		self:setTask(self.nTask_ZhenDan_GiveCount,  nGiveCount);
	end
	
	if nTotalCount >= self.nLimit_TotalGive then
		CreateTaskSay({"<dec><npc>��i hi�p �� ho�n th�nh y�u c�u c�a l�o r�i, kh�ng c�n ph�i n�p th�m th�n n�ng ch�n ��n n�a ��u!", "���c r�i./Cancel"});
		return
	end
	
	if nGiveCount >= self.nLimit_DayGive then
		CreateTaskSay({format("<dec><npc>H�m nay ��i hi�p �� n�p cho l�o %d Th�n N�ng Ch�n ��n r�i, ��i ng�y mai h�y quay l�i nh�!", self.nLimit_DayGive), "���c r�i./Cancel"});
		return 
	end
	
	GiveItemUI("N�p Th�n N�ng Ch�n ��n", format("M�i ng�y nhi�u nh�t ch� n�p ���c %d vi�n Th�n N�ng Ch�n ��n, h�m nay ��i hi�p �� n�p %d vi�n r�i.", self.nLimit_DayGive, nGiveCount), "callBack_giveZhenDan_sure", "Cancel", 1);
end

-- ��ʵ�Ͻ���ũ�浤
function tbChangeDestiny:giveZhenDan_sure(nCount)
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	if nCount <= 0 then
		CreateTaskSay({"<dec><npc>��i hi�p �ang ��a ta �, l�o phu v�n ch�a th�y ��i hi�p n�p v�t ph�m g� c�.", "He he./Cancel"});
		return 
	end
	
	for i = 1, nCount do
		local nItemidx = GetGiveItemUnit(i);
		local g, d, p = GetItemProp(nItemidx);
		if (g ~= self.tbItem_ShenLongZhenDan[1] or d ~= self.tbItem_ShenLongZhenDan[2] or p ~= self.tbItem_ShenLongZhenDan[3]) then
			CreateTaskSay({"<dec><npc>��i hi�p kh�ng c�n n�p v�t ph�m g� kh�c, ch� c�n ��a ta <color=yellow> Th�n N�ng Ch�n ��n <color> l� ���c r�i.", "���c r�i./Cancel"});
			return 
		end
	end
	
	local nGiveDate   = self:getTask(self.nTask_ZhenDan_GiveDate);
	local nGiveCount  = self:getTask(self.nTask_ZhenDan_GiveCount);
	local nTotalCount = self:getTask(self.nTask_ZhenDan_TotalCount);
	local nDate 	  = floor(FormatTime2Number(GetCurServerTime())/10000);	-- ��ǰ����

	if nDate ~= nGiveDate then
		nGiveDate  = nDate;
		nGiveCount = 0; 
		self:setTask(self.nTask_ZhenDan_GiveDate,   nGiveDate);
		self:setTask(self.nTask_ZhenDan_GiveCount,  nGiveCount);
	end
	
	local nCanGive = self.nLimit_DayGive - nGiveCount;
	
	if nCount > nCanGive or nCanGive <= 0 then
		CreateTaskSay({format("<dec><npc>H�m nay ��i hi�p ch� c�n ��a ta %d vi�n Th�n N�ng Ch�n ��n l� ���c, kh�ng c�n nhi�u h�n ��u.", nCanGive), "���c r�i./Cancel"});
		return 
	end
	
	local nCanGive_Total = self.nLimit_TotalGive - nTotalCount;
	
	if nCount > nCanGive_Total or nCanGive_Total <= 0 then
		CreateTaskSay({format("<dec><npc>��i hi�p ch� c�n n�p cho ta %d Th�n N�ng Ch�n ��n l� �� ho�n th�nh y�u c�u c�a ta r�i, kh�ng c�n nhi�u h�n ��u.", nCanGive_Total), "���c r�i./Cancel"});
		return 
	end
	
	for i = 1, nCount do
		local nItemidx = GetGiveItemUnit(i);
		RemoveItemByIndex(nItemidx)
	end;

	nGiveCount  = nGiveCount  + nCount;
	nTotalCount = nTotalCount + nCount;
	
	self:setTask(self.nTask_ZhenDan_GiveDate,   nGiveDate);
	self:setTask(self.nTask_ZhenDan_GiveCount,  nGiveCount);
	self:setTask(self.nTask_ZhenDan_TotalCount, nTotalCount);
	
	local szMsg = format("[ChangeDestiny]GiveZhenDan: %s give %d ZhenDan On %d. Now the DayCount is %s and TotalCount is %s.",GetName(), nCount, nGiveDate, nGiveCount, nTotalCount);
	WriteLog(szMsg);
	
	CreateTaskSay({format("<dec><npc>H�m nay ��i hi�p �� n�p cho ta %d vi�n Th�n N�ng Ch�n ��n r�i, t�ng c�ng �� n�p %d, ch� c�n ��i hi�p kh�ng ng�ng n� l�c sau n�y s� th�nh c�ng nhanh m�.", nGiveCount, nTotalCount), "Ta s� tr� l�i sau./Cancel"});
end

-- ��ѯ�����˶�����ũ�浤
function tbChangeDestiny:queryTotalCount()
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	local nTotalCount = self:getTask(self.nTask_ZhenDan_TotalCount);
	
	if nTotalCount >= self.nLimit_TotalGive then
		CreateTaskSay({"<dec><npc>Ch�c m�ng ��i hi�p, ��i hi�p �� ho�n th�nh y�u c�u c�a l�o phu r�i!", "Th�t kh�ng l�o? Th�t l� kh�ng d� d�ng g� ��t ���c!/Cancel"});
		return
	else
		CreateTaskSay({format("<dec><npc>��i hi�p �� n�p cho l�o %d Th�n N�ng Ch�n ��n r�i, ch� c�n s� c� g�ng th� nh�t ��nh s� ��t ���c th�a nguy�n.", nTotalCount), "Ta s� c� g�ng n� l�c!/Cancel"});
		return
	end
	
end

-- �������������
function tbChangeDestiny:awardGaiMingJue()
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	local nTotalCount = self:getTask(self.nTask_ZhenDan_TotalCount);
	local nHasAward	  = self:getTask(self.nTask_GaiMing_HasReceive);
	
	if nTotalCount < self.nLimit_TotalGive then
		CreateTaskSay({"<dec><npc>L�m ng��i ph�i c� l�ng trung th�c, kh�ng d� g� l�a ���c l�o phu ��u.", "Ta ch� ��a ng��i th�i, ��ng t��ng th�t nh�!/Cancel"});
		return
	end
	
	if nHasAward ~= 0 then
		CreateTaskSay({"<dec><npc>L�o phu b�nh sinh r�t gh�t b�n ti�u nh�n c� l�ng tham v� ��y, kh�ng ph�i ng��i �� nh�n r�i hay sao?", "L�o phu gi�o hu�n ch� ph�i, v�n b�i bi�t l�i r�i!/Cancel"});
		return
	end
	
	local free = FindFreeRoomByWH(1, 1)
	if (free ~= 1) then
		CreateTaskSay({"<dec><npc>H�nh trang kh�ng �� � tr�ng, xin m�i s�p x�p h�nh trang r�i quay tr� l�i nh�.", "���c r�i./Cancel"});
		return
	end
	
	local item = AddItem(self.tbItem_GaiMingJue[1],self.tbItem_GaiMingJue[2],self.tbItem_GaiMingJue[3],1,0,0)
	if (item == 0) then
			WriteLog(format("[ChangeDestiny]Failed to give GaiMingJue to %s", GetName()));
			CreateTaskSay({"<dec><npc>Ta c�m nh�n c� g� kh�ng �n, v�t ph�m tuy�t th� n�y t�m th�i kh�ng th� giao ph� cho ng��i ���c.", "T�i sao?/Cancel"});
			return
	else
--			ITEM_SetExpiredTime(item, self.nCloseDate, 235959)
			SyncItem(item)
			SetItemBindState(item, -2)

			self:setTask(self.nTask_GaiMing_HasReceive, 1);
			WriteLog(format("[ChangeDestiny]Give GaiMingJue to %s", GetName()))
			CreateTaskSay({"<dec><npc>��y l� ph�n th��ng cho ng��i! T� nay v� sau ng��i h�y c� r�n luy�n v� c�ng �� kh�ng ph� l�ng l�o phu nh�.", "�a t� ti�n b�i!/Cancel"});
			return
	end
end

-- ��ũ�浤����
function tbChangeDestiny:zhenDanTask()
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	local nTotalCount = self:getTask(self.nTask_ZhenDan_TotalCount);
	
	if nTotalCount >= self.nLimit_TotalGive then
		CreateTaskSay({"<dec><npc>��i hi�p �� ho�n th�nh y�u c�u c�a l�o phu r�i, v�t ph�m th�n n�ng ch�n ��n n�y ta kh�ng c�n th�m n�a ��u.", "Ta �� hi�u r�i!/Cancel"});
		return
	end
	
	CreateTaskSay({
		"<dec><npc>L�o phu tu�i ta �� cao, c� nh�ng vi�c mu�n m� kh�ng l�m ���c, ��i hi�p c� mu�n gi�p l�o phu m�t phen kh�ng, th�n n�ng ch�n ��n n�y l� t�ng ph�m n�u ng��i gi�p ta.",
		"Ti�n b�i qu� l�i r�i, ��y l� vi�c ta c�n l�m, xin l�o phu c� giao ph�!/#tbChangeDestiny:zhenDanTask_accepte()",
		"Nh�ng vi�c ti�n b�i giao ph� ta �� l�m xong r�i./#tbChangeDestiny:zhenDanTask_delivery()",
		"T�i h� �� r� r�i./Cancel",
		});
	
end

-- ��ũ�浤���� ��������
function tbChangeDestiny:zhenDanTask_accepte()
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	CreateTaskSay({
		"<dec><npc>Ta ��y c� m�t s� nhi�m v�, phi�n ��i hi�p m�t phen.",
		format("T�i h� mu�n nh�n nhi�m v� �3000 �i�m t�ch l�y T�ng Kim�./#tbChangeDestiny:zhenDanTask_accepte_hand(%d)", self.nMissionID_Battle),
		format("T�i h� mu�n nh�n nhi�m v� ���nh b�i Nhi�p Th� Tr�n�./#tbChangeDestiny:zhenDanTask_accepte_hand(%d)", self.nMissionID_NieShiChen),
		format("T�i h� mu�n nh�n nhi�m v� ���nh b�i Th�y T�c ��u l�nh�./#tbChangeDestiny:zhenDanTask_accepte_hand(%d)", self.nMissionID_WaterThief),
		format("T�i h� mu�n nh�n nhi�m v� ��� b�i t� ��i s�t th�./#tbChangeDestiny:zhenDanTask_accepte_hand(%d)", self.nMissionID_Killer),
		"C� m�t s� nhi�m v� h�i kh�, xin h�y �� t�i h� c� th�i gian chu�n b�./Cancel",
		});
end

-- ��ũ�浤���� �����������
function tbChangeDestiny:zhenDanTask_accepte_hand(nMissionID)
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	local nMissionStep, nMissionDate = self:getMissionInfo(nMissionID);
	local nDate = floor(FormatTime2Number(GetCurServerTime())/10000);	-- ��ǰ����
	
	if nMissionStep ~= self.nStep_free then
		CreateTaskSay({format("<dec><npc>��i hi�p �� nh�n nhi�m v� r�i, xin h�y c� g�ng ho�n th�nh nhi�m v�. M�c ti�u nhi�m v� c�a ��i hi�p l�: <color=green>%s<color>, ho�n th�nh xong thu ���c <color=green>%d<color> vi�n Th�n N�ng Ch�n ��n!", self.tbMissionInfo[nMissionID][2], self.tbMissionInfo[nMissionID][1]), "���c r�i./Cancel"});
		return
	end
	
	if nMissionDate == nDate then
		CreateTaskSay({"<dec><npc>��i hi�p h�m nay �� ho�n th�nh lo�i nhi�m v� n�y r�i, ng�y mai quay l�i nh�!", "���c r�i./Cancel"});
		return
	end
	
	self:setMissionInfo(nMissionID, self.nStep_accepted , nMissionDate);
	CreateTaskSay({format("<dec><npc>M�c ti�u nhi�m v� c�a ��i hi�p l�: <color=green>%s<color>, ho�n th�nh xong thu ���c <color=green>%d<color> Th�n N�ng Ch�n ��n!", self.tbMissionInfo[nMissionID][2], self.tbMissionInfo[nMissionID][1]), "Ta s� l�n ���ng ngay!/Cancel"});
	Msg2Player(self.tbMissionInfo[nMissionID][3]);
end

-- ��ũ�浤���� ��������
function tbChangeDestiny:zhenDanTask_delivery()
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	CreateTaskSay({
		"<dec><npc>��i hi�p qu� nhi�n kh�ng l�m ta th�t v�ng, ng��i �� ho�n th�nh nhi�m v� n�o r�i?",
		format("T�i h� ��n giao nhi�m v� �3000 �i�m t�ch l�y T�ng Kim�./#tbChangeDestiny:zhenDanTask_delivery_hand(%d)", self.nMissionID_Battle),
		format("T�i h� ��n giao nhi�m v� ���nh b�i Nhi�p Th� Tr�n�./#tbChangeDestiny:zhenDanTask_delivery_hand(%d)", self.nMissionID_NieShiChen),
		format("T�i h� ��n giao nhi�m v� ���nh b�i Th�y T�c ��u l�nh�./#tbChangeDestiny:zhenDanTask_delivery_hand(%d)", self.nMissionID_WaterThief),
		format("T�i h� ��n giao nhi�m v� ��� b�i t� ��i s�t th�./#tbChangeDestiny:zhenDanTask_delivery_hand(%d)", self.nMissionID_Killer),
		"T�i h� nh� nh�m, t�m th�i v�n ch�a xong nhi�m v�./Cancel",
		});
end

-- ��ũ�浤���� ����������
function tbChangeDestiny:zhenDanTask_delivery_hand(nMissionID)
	
	if self:checkBaseCondition() ~= 1 then
		return
	end
	
	local nMissionStep, nMissionDate = self:getMissionInfo(nMissionID);
	local nDate = floor(FormatTime2Number(GetCurServerTime())/10000);	-- ��ǰ����
	
	if nMissionStep ~= self.nStep_completed then
		CreateTaskSay({"<dec><npc>Ta tuy gi� nh�ng kh�ng hay qu�n ��u, ng��i ��ng h�ng l�a g�t ta", "V�n b�i bi�t l�i r�i./Cancel"});
		return
	end
	
	if nMissionDate == nDate then
		CreateTaskSay({"<dec><npc>��i hi�p h�m nay �� ho�n th�nh lo�i nhi�m v� n�y r�i, ng�y mai quay l�i nh�!", "���c r�i./Cancel"});
		return
	end
	
	local nFree = CalcFreeItemCellCount();
	local nAwardCount = self.tbMissionInfo[nMissionID][1];
	
	if (nFree < nAwardCount) then
		CreateTaskSay({"<dec><npc>H�nh trang kh�ng �� � tr�ng, xin m�i s�p x�p h�nh trang r�i quay tr� l�i nh�.", "���c r�i./Cancel"});
		return
	end
	
	for i=1,nAwardCount do
		local item = AddItem(self.tbItem_ShenLongZhenDan[1],self.tbItem_ShenLongZhenDan[2],self.tbItem_ShenLongZhenDan[3],1,0,0);
		if (item == 0) then
			WriteLog(format("[ChangeDestiny]Failed to give ShenLongZhenDan to %s", GetName()));
		else
			ITEM_SetExpiredTime(item, self.nCloseDate, 235959)
			SyncItem(item)
			SetItemBindState(item, -2)
			WriteLog(format("[ChangeDestiny]Give ShenLongZhenDan to %s", GetName()))
		end
	end
	 
	self:setMissionInfo(nMissionID, self.nStep_free , nDate);
	CreateTaskSay({"<dec><npc>��y l� ph�n th��ng c�a ��i hi�p!", "�a t� ti�n b�i!/Cancel"});
end