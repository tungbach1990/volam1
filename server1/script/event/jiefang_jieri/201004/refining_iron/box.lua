-- ���� �����
Include("\\script\\event\\jiefang_jieri\\201004\\refining_iron\\head.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\lib\\awardtemplet.lua")

function main(nItemIndex)
	
	if tbRefiningIron:IsCarryOn() ~= 1 then
		Msg2Player("H�m Kim H�p b� h� b�i v� l�u gi� qu� l�u");
		return 0;
	end
	
	if CalcFreeItemCellCount() < 1 then
		CreateTaskSay({"H�y s�p x�p h�nh trang! �� tr�ng 1 �!",  "���c r�i./Cancel",});
		return 1;
	end
	
	local tbAwardItem = 
	{
		szName="Th�p Tinh Luy�n", 
		tbProp={6,1, 2293, 1,0,0},
		nCount = 8,
		nExpiredTime=tbRefiningIron.nCloseDate,
	};
	tbAwardTemplet:GiveAwardByList(tbAwardItem, "S� d�ng h�m kim h�p");
	return 0;
end
