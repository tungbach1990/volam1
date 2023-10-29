-- Ѱ���� ����
Include("\\script\\event\\jiefang_jieri\\201004\\beat_tiger\\head.lua")
Include("\\script\\task\\system\\task_string.lua");

function main()
	return tbBeatTiger:NpcTalk();
end

-- Npc�Ի�
function tbBeatTiger:NpcTalk()
	
	if tbBeatTiger:IsCarryOn() ~= 1 then
		return
	end

	local tbTaskSay = {format("<dec><npc>Trong th�i gian ho�t ��ng, ch� v� ��i hi�p ch� c�n ��nh ng� Huy�t S�t L�o H� xung quanh ta v� t�i %d gi�y ��n t�m ta th� c� th� nh�n ���c 1 hoa sen c�n, ho�t ��ng n�y m�i ng�y di�n ra hai tr�n, m�i ng��i ch�i 1 tr�n ch� c� th� tham d� 1 l�n.", self.nLimit_AwardTime),};
	tinsert(tbTaskSay, "Nh�n hoa sen c�n/#tbBeatTiger:Award()");
	tinsert(tbTaskSay, "���c!/Cancel");
	CreateTaskSay(tbTaskSay);
end

-- ��ȡ�ƽ���
function tbBeatTiger:Award()
	
	if tbBeatTiger:IsCarryOn() ~= 1 then
		return
	end
	
	local nUseCount = self.tbTaskGroup:GetTask(self.nTaskID_UseCount);
	if nUseCount >= self.nLimit_UseCount then
		CreateTaskSay({"<dec><npc>C�c h� �� nh�n kinh nghi�m ��n m�c cao nh�t, kh�ng th� nh�n th��ng ���c n�a",  "���c r�i./Cancel",});
		return 	
	end
	
	local nFieldId = tbBeatTiger:GetFieldId();
	if  nFieldId <= 0 then
		CreateTaskSay({"<dec><npc>Xin h�y nh�n th��ng t�i ��t ho�t ��ng ��",  "���c r�i./Cancel",});
		return
	end	

	local tbPlayerInfo = self.nValue_tbPlayerInfo[nFieldId].tbPlayer[GetName()];
	if tbPlayerInfo == nil then
		CreateTaskSay({"<dec><npc>C�c h� v�n ch�a ��nh b�i S�t Huy�t L�o H�",  "���c r�i./Cancel",});
		return	
	end
	
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if nDate == tbPlayerInfo.nAwardDate then
		CreateTaskSay({"<dec><npc>C�c h� �� nh�n ph�n th��ng c�a ��t n�y r�i",  "���c r�i./Cancel",});
		return 			
	end
	
	local nCurTime = GetCurServerTime();
	local nFieldStartTime = self.nValue_tbPlayerInfo[nFieldId].nStartTime;
	local nFieldCloseTime = self.nValue_tbPlayerInfo[nFieldId].nCloseTime;
	local nFieldMaxTime = ((floor(nFieldCloseTime/100) - floor(nFieldStartTime/100) - 1)*60 + mod(nFieldCloseTime, 100) + (60 - mod(nFieldStartTime, 100)) ) * 60;
	
	if nCurTime - tbPlayerInfo.nkillTime > nFieldMaxTime then
		CreateTaskSay({"<dec><npc>C�c h� kh�ng ph�i l� ng��i ��nh b�i S�t Huy�t L�o H� ��t n�y",  "���c r�i./Cancel",});
		return			
	end	
	
	if nCurTime - tbPlayerInfo.nkillTime > self.nLimit_AwardTime then
		CreateTaskSay({"<dec><npc>�� qu� th�i gian nh�n th��ng r�i, xin m�i ti�p t�c ��nh b�i l�o h�",  "���c r�i./Cancel",});
		return			
	end
	
	if CalcFreeItemCellCount() < 1 then
		CreateTaskSay({"Xin h�y s�p x�p l�i h�nh trang!",  "���c r�i./Cancel",});
		return 
	end	
	
	-- ���Ž���
	tbPlayerInfo.nAwardDate = nDate;
	
	local tbAwardItem = 
	{
		szName="Hoa Sen C�n", 
		tbProp={6,1, 2310, 1,0,0},
		nCount = 1,
		nExpiredTime=self.nFlowerDisappearDate,
	};
	tbAwardTemplet:GiveAwardByList(tbAwardItem, "Ph�t hoa sen c�n");
end
