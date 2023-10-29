-- Ѱ���� �ƽ���
Include("\\script\\event\\jiefang_jieri\\201004\\beat_tiger\\head.lua")
Include("\\script\\task\\system\\task_string.lua");

function main(nItemIndex)
	return tbBeatTiger:OnUse(nItemIndex);
end

-- ʹ��
function tbBeatTiger:OnUse(nItemIndex)
	
	-- �����
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if  nDate >= self.nFlowerDisappearDate then
		Msg2Player("Hoa sen c�n b� h� v� th�i gian t�n t�i qu� l�u");
		return 0;
	end
	
	-- �ȼ�����
	if GetLevel() < self.nLimit_Level then
		CreateTaskSay({"��ng c�p c�a c�c h� kh�ng ��!",  "���c!/Cancel",});
		return 1;
	end 
	
	-- û�г�ֵ
	if GetExtPoint(0) <= 0  then
		CreateTaskSay({"Ch� c� ng��i ch�i n�p th� m�i c� th� s� d�ng!",  "���c!/Cancel",});
		return 1;	
	end
	
	-- ����ʹ������
	local nUseCount = self.tbTaskGroup:GetTask(self.nTaskID_UseCount);
	if nUseCount >= self.nLimit_UseCount then
		CreateTaskSay({"V��t qu� gi�i h�n nh�n ���c kinh nghi�m cho ph�p c�a ho�t ��ng",  "���c!/Cancel",});
		return 1;		
	end
	
	nUseCount = nUseCount + 1;
	self.tbTaskGroup:SetTask(self.nTaskID_UseCount, nUseCount);
	
	-- ���ž���
	local tbAwardItem = {nExp = self.nLimit_ExpAward};
	tbAwardTemplet:GiveAwardByList(tbAwardItem, "S� d�ng hoa sen c�n");
	return 0;
end
