-- ���� ������
Include("\\script\\event\\jiefang_jieri\\201004\\refining_iron\\head.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\awardtemplet.lua")

function main(nItemIndex)
	
	if tbRefiningIron:IsCarryOn() ~= 1 then
		Msg2Player("H�m Kim H�p b� h� b�i v� l�u gi� qu� l�u");
		return 0;
	end
	
	local G,D,P,nLevel = GetItemProp(nItemIndex);
	
	if nLevel <= 1 or nLevel > 10 then
		return 1;
	end	
	
	if CalcFreeItemCellCount() < 2 then
		CreateTaskSay({"Xin h�y s�p x�p l�i h�nh trang!",  "���c r�i./Cancel",});
		return 1;
	end
	
	-- �ж��������
	if tbRefiningIron.tbTaskGroup:GetTask(tbRefiningIron.tbTaskLimit[nLevel][1]) >= tbRefiningIron.tbTaskLimit[nLevel][2] then
		CreateTaskSay({"�� v��t qu� s� l�n s� d�ng cho ph�p!",  "���c r�i./Cancel",});
		return 1;
	end
	tbRefiningIron.tbTaskGroup:AddTask(tbRefiningIron.tbTaskLimit[nLevel][1], 1);

	-- ����Ʒ
	tbAwardTemplet:GiveAwardByList(tbRefiningIron.tbAward[nLevel], "Ho�t ��ng m�ng gi�i ph�ng vi�t nam, s� d�ng th�p tinh luy�n");
	return 0;
end
