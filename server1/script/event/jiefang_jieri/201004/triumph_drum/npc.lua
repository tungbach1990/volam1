-- �������� ͷ�ļ�
Include("\\script\\event\\jiefang_jieri\\201004\\triumph_drum\\head.lua")
Include("\\script\\task\\system\\task_string.lua");

-- Npc�Ի�
function tbTriumphDrum:NpcTalk()
	
	if tbTriumphDrum:CheckCondition_BuyDrum() ~= 1 then
		CreateTaskSay({"C�c h� kh�ng c� quy�n h�n �� mua tr�ng kh�i ho�n!",  "���c r�i./Cancel",});
		return
	end
	
	if GetCash() < self.nLimit_Money then
		CreateTaskSay({"Mua Tr�ng Kh�i Ho�n c�n 304 v�n l��ng",  "���c r�i./Cancel",});
		return		
	end
	
	if Pay(self.nLimit_Money) ~= 1 then
		Msg2Player("Tr� ng�n l��ng th�t b�i")
		return
	end
		
	local tbAwardItem = 
	{
		szName="Tr�ng Kh�i Ho�n", 
		tbProp={6,1, 2309, 1,0,0},
		nCount = 1,
		nExpiredTime=60,
	};
	tbAwardTemplet:GiveAwardByList(tbAwardItem, "Mua Tr�ng Kh�i Ho�n");
end
