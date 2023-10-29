-- ���� Npc�Ի�
Include("\\script\\event\\jiefang_jieri\\201004\\refining_iron\\head.lua")
Include("\\script\\task\\system\\task_string.lua");

-- Npc�Ի�
function tbRefiningIron:NpcTalk()
	
	if tbRefiningIron:IsCarryOn() ~= 1 then
		return
	end
	
	local tbTaskSay = {"<dec><npc>Trong th�i gian ho�t ��ng, c�c v� ��i hi�p c� th� ��n ��y n�ng c�p th�p tinh luy�n. Th�p tinh luy�n c�p th�p c� th� th�ng qua c�c ho�t ��ng phong l�ng �� v� �o chi�n s� nh�n ���c, ho�c c� th� mua v�t ph�m n�y t�i K� Tr�n C�c. Gh�p 2 th�p c�p th�p c� th� nh�n ���c 1 th�p tinh luy�n c�p cao h�n",};
	
	for i = 2,9 do
		tinsert(tbTaskSay, format("Ta mu�n luy�n th�p tinh luy�n c�p %d/#tbRefiningIron:UpdataIron(%d)", i, i));
	end
	
	tinsert(tbTaskSay, "H�y b� /Cancel");
	CreateTaskSay(tbTaskSay);
end

-- ������
function tbRefiningIron:UpdataIron(nLevel)
	
	-- δ����
	if tbRefiningIron:IsCarryOn() ~= 1 then
		return
	end
	
	-- Bug
	if nLevel <= 1 or nLevel > 10 then
		return
	end	
	
	-- �����ռ�
	if CalcFreeItemCellCount() < 1 then
		CreateTaskSay({"Xin h�y s�p x�p l�i h�nh trang!",  "���c r�i./Cancel",});
		return 
	end	
		
	-- ԭ�ϲ���
	if CalcItemCount(3, 6, 1, 2293, nLevel - 1) < 2 then
		CreateTaskSay({format("<dec><npc>Xin h�y chu�n b� 2 th�p tinh luy�n c�p %d!",nLevel - 1),  "���c r�i./Cancel",});
		return
	end
	
	-- �۳�ʧ��
	if ConsumeItem(3, 2, 6, 1, 2293, nLevel - 1) ~= 1 then
		Msg2Player("Kh�u tr� th�p tinh luy�n th�t b�i");
		return
	end
	
	-- �ϳ�ʧ��
	if random(1, 100) > self.tbUpdataRate[nLevel] then
		local tbAwardItem = 
		{
			szName="Th�p Tinh Luy�n", 
			tbProp={6,1, 2293, nLevel - 1,0,0},
			nCount = 1,
			nExpiredTime=self.nCloseDate,
		};
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "Th�p tinh luy�n g�p th�t b�i, tr� l�i th�p tinh luy�n.");
		CreateTaskSay({"<dec><npc>Th�t ��ng ti�c, luy�n th�p �� th�t b�i! Ta ngh� l�n sau s� th�nh c�ng ��!",  "���c r�i./Cancel",});
		return	
	end
	
	-- �ϳɳɹ�
	local tbAwardItem = 
	{
		szName="Th�p Tinh Luy�n", 
		tbProp={6,1, 2293, nLevel,0,0},
		nCount = 1,
		nExpiredTime=self.nCloseDate,
	};
	tbAwardTemplet:GiveAwardByList(tbAwardItem, "Gh�p th�p tinh luy�n");
	
	-- ��Ʒ����ʾ
	if nLevel >= 7 then
		local szmsg = format("Ch�c m�ng cao th� %s �� nh�n ���c th�p tinh luy�n c�p %d. Hi v�ng ng��i s� c� nhi�u may m�n h�n n�a!", GetName(), nLevel);
		local _, nTongId = GetTongName(); 
		if nTongId ~= 0 then
			Msg2Tong(nTongId, szmsg);
		end
		Msg2SubWorld(szmsg);
	end
	
end