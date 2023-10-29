--��ԭ���� ���ݸ� ����ѧͽ�Ի�
Include("\\script\\global\\fantasygoldequip\\fantasygoldequip_npc.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbOption = {"<dec><npc>M�t ng�y l�m tr� su�t ��i l�m tr�.S� ph� n�i r�i,�ng �y kh�ng c� con trai,100 n�m sau c�i ti�m r�n n�y s� l� c�a ta"}
	if IS_FANTASY_OPEN == 1 then
		tinsert(tbOption, "T�m hi�u th�ng tin trang b� Huy�n Kim/fantasygoldequip_entry")
	end
	tinsert(tbOption, "Ta ch� ��n ch�i/Cancel")

	CreateTaskSay(tbOption);
end

function fantasygoldequip_entry()

	local tbOption = {
		"<dec><npc>�� bao nhi�u n�m r�i,kh�ng ng� ��n t� ng�y ta tho�t kh�i ��o Nguy�t Ca �� mai danh �n t�ch ��n nay nh�ng ng��i v�n t�m ���c ta,ng��i c� � g�?",
		"N�ng c�p Huy�n Kim ho�c Huy�n Kim Chi Tinh/fantasygold_upgrade",
		"Ta t�m ���c Huy�n Kim Chi Tinh r�i,xin ch� t�o trang b� Huy�n Kim cho ta/gen_fantasygoldequip",
		"Ta t�m ���c Huy�n Kim r�i,xin n�ng c�p trang b� Huy�n Kim cho ta/upgrade_fantasygoldequip",
		"Xin th�o trang b� Huy�n Kim cho ta/split_fantasygoldequip",
		"Ngu�n g�c trang b� Huy�n Kim/fantasygoldequip_history",
		"Ta ch� ��n ch�i/calcel",
	};
	CreateTaskSay(tbOption);
end

function gen_fantasygoldequip()
	local tbOption = {
		"<dec><npc>C� th� t�m ���c Huy�n Kim Chi Tinh,th�t kh�ng d� d�ng.L�i t�m ���c � ch� ta v�y ta s� th� m�t l�n",
		"Ta mu�n bi�t thu�c t�nh c�a trang b� Huy�n Kim sau khi ch� t�o/newgold_to_fantasygold_preview",
		"Xin ch� t�o trang b� Huy�n Kim cho ta/newgold_to_fantasygold",
		"Ta ch� ��n ch�i/cancel",
	};
	CreateTaskSay(tbOption);
end

function upgrade_fantasygoldequip()
	local tbOption = {
		"<dec><npc>C� th� t�m ���c s� l��ng l�n Huy�n Kim,th�t kh�ng d� d�ng.L�i t�m ���c � ch� ta v�y ta s� th� m�t l�n",
		"Ta mu�n bi�t thu�c t�nh c�a trang b� Huy�n Kim sau khi n�ng c�p/fantasygoldequip_upgrade_preview",
		"Xin n�ng c�p trang b� Huy�n Kim cho ta/fantasygoldequip_upgrade",
		"Ta ch� ��n ch�i/cancel",
	};
	CreateTaskSay(tbOption);
end

function split_fantasygoldequip()
	local tbOption = {
		"<dec><npc>Sau khi th�o b� trang b� Huy�n Kim th� s� c�n c� theo tr�ng th�i kh�a m� m� th�i gian kh�a t��ng ���ng.Trang b� Huy�n Kim c�ng s� v� tr�ng th�i +0 v� s� tr� m�t s� nguy�n li�u Huy�n Kim.C� c�n ta gi�p kh�ng?",
		"H�y gi�p ta th�o b� trang b� Huy�n Kim/split_fantasygoldequip_configm",
		"Ta kh�ng th�o b� n�a/cancel",
	};
	CreateTaskSay(tbOption);
end

function fantasygoldequip_history()
	local tbOption = {
		"<dec><npc>Cha ta l� th� r�n binh nh�t tr�n ��o Nguy�t Ca,kh�ng mu�n ��i ��i ki�p ki�p ph�i l�m n� tr�n ��o n�n �� ngh� tr�m c�ch cho ta r�i kh�i ��o v� truy�n b� k�p r�n l�i cho ta.Ta mai danh �n t�nh ��n nay ch� mu�n l�m m�t ng��i b�nh th��ng nh�ng ng��i v�n t�m ��n ���c n�u kh�ng gi�p ng��i ta ngh� ng��i s� kh�ng �� y�n nh� v�y",
		"Xin h�y gi�p ta,ta s� kh�ng ti�t l� b� m�t n�y/fantasygoldequip_entry",
		"M�t ��a h�c tr� nh� d�m l�a d�i ta/cancel",
	};
	CreateTaskSay(tbOption);
end

