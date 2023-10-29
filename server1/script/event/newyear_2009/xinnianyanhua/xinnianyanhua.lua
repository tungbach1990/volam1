Include("\\script\\lib\\string.lua");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\event\\newyear_2009\\taskctrl.lua");
Include("\\script\\lib\\gb_taskfuncs.lua")

yanhua_gbtask	= "newyear0901";

tb_yanhua_specialreward	=
{
	{szName	= "Th�n b� kho�ng th�ch", 		tbProp = {6, 1, 398, 1, 0, 0}},
	{szName = "Th�n b� kho�ng th�ch", 		tbProp = {6, 1, 398, 1, 0, 0}},
	{szName = "Huy�n Tinh Kho�ng Th�ch c�p 6", 	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "Huy�n Tinh Kho�ng Th�ch c�p 6", 	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "Huy�n Tinh Kho�ng Th�ch c�p 6", 	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "Huy�n Tinh Kho�ng Th�ch c�p 6", 	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "Huy�n Tinh Kho�ng Th�ch c�p 6", 	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "Huy�n Tinh Kho�ng Th�ch c�p 6", 	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "Huy�n Tinh Kho�ng Th�ch c�p 6", 	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "Huy�n Tinh Kho�ng Th�ch c�p 6",	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "Huy�n Tinh Kho�ng Th�ch c�p 6", 	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "Huy�n Tinh Kho�ng Th�ch c�p 6", 	tbProp = {6, 1, 147, 6, 0, 0}},
	{szName = "Huy�n Tinh Kho�ng Th�ch c�p 7", 	tbProp = {6, 1, 147, 7, 0, 0}},
	{szName = "Huy�n Tinh Kho�ng Th�ch c�p 7", 	tbProp = {6, 1, 147, 7, 0, 0}},
	{szName = "Huy�n Tinh Kho�ng Th�ch c�p 7", 	tbProp = {6, 1, 147, 7, 0, 0}},
	{szName = "Huy�n Tinh Kho�ng Th�ch c�p 7", 	tbProp = {6, 1, 147, 7, 0, 0}},
	{szName = "Huy�n Tinh Kho�ng Th�ch c�p 7", 	tbProp = {6, 1, 147, 7, 0, 0}},
	{szName = "Huy�n Tinh Kho�ng Th�ch c�p 8", 	tbProp = {6, 1, 147, 8, 0, 0}},
	{szName = "Huy�n Tinh Kho�ng Th�ch c�p 8", 	tbProp = {6, 1, 147, 8, 0, 0}},
	{szName = "V� L�m M�t T�ch", 		tbProp = {6, 1, 26, 1, 0, 0}},
	{szName = "V� L�m M�t T�ch", 		tbProp = {6, 1, 26, 1, 0, 0}},
	{szName = "T�y T�y Kinh", 		tbProp = {6, 1, 22, 1, 0, 0}},
	{szName = "T�y T�y Kinh", 		tbProp = {6, 1, 22, 1, 0, 0}},
	{szName="An Bang B�ng Tinh Th�ch H�ng Li�n",	nQuality=1,	tbProp={0, 164}},
	{szName="An Bang K� Huy�t Th�ch Gi�i Ch� ", nQuality=1, tbProp={0, 167}},
	{szName="An Bang C�c Hoa Th�ch Ch� ho�n", nQuality=1, tbProp={0, 165}},
	{szName="An Bang C�c Hoa Th�ch Ch� ho�n", nQuality=1, tbProp={0, 165}},
	{szName="Nhu T�nh C�n Qu�c Ngh� Th��ng", 	nQuality=1, tbProp={0, 190}},
	{szName="T� Th�y Tinh", 			tbProp={4, 239, 1, 1, 0, 0}},
	{szName="T� Th�y Tinh", 			tbProp={4, 239, 1, 1, 0, 0}},
	{szName="T� Th�y Tinh", 			tbProp={4, 239, 1, 1, 0, 0}},
	{szName="T� Th�y Tinh", 			tbProp={4, 239, 1, 1, 0, 0}},
	{szName="T� Th�y Tinh", 			tbProp={4, 239, 1, 1, 0, 0}},
	{szName="Lam Th�y Tinh", 			tbProp={4, 238, 1, 1, 0, 0}},
	{szName="Lam Th�y Tinh", 			tbProp={4, 238, 1, 1, 0, 0}},
	{szName="Lam Th�y Tinh", 			tbProp={4, 238, 1, 1, 0, 0}},
	{szName="Lam Th�y Tinh", 			tbProp={4, 238, 1, 1, 0, 0}},
	{szName="Lam Th�y Tinh", 			tbProp={4, 238, 1, 1, 0, 0}},
	{szName="L�c Th�y Tinh", 			tbProp={4, 240, 1, 1, 0, 0}},
	{szName="L�c Th�y Tinh", 			tbProp={4, 240, 1, 1, 0, 0}},
	{szName="L�c Th�y Tinh", 			tbProp={4, 240, 1, 1, 0, 0}},
	{szName="L�c Th�y Tinh", 			tbProp={4, 240, 1, 1, 0, 0}},
	{szName="L�c Th�y Tinh", 			tbProp={4, 240, 1, 1, 0, 0}},
	{nExp = 20000000},
	{nExp = 20000000},
	{nExp = 10000000},
	{nExp = 10000000},
	{nExp = 10000000},
	{nExp = 10000000},
	{nExp = 10000000},
	{nExp = 5000000},
	{nExp = 5000000},
	{nExp = 5000000},
	{nExp = 5000000},
	{nExp = 5000000},
	{nExp = 5000000},
	{nExp = 5000000},
	{nExp = 5000000},
	{nExp = 5000000},
	{nExp = 5000000},
};

tb_yanhua_randomaward	= tb_yanhua_specialreward;

function newyear0901_yanhua_dialogmain(nItemIndex, szDescLink)
	local n_dateD	= tonumber(GetLocalDate("%Y%m%d"));
	if (gb_GetTask(yanhua_gbtask, 1) ~= n_dateD) then
		gb_SetTask(yanhua_gbtask, 1, n_dateD);
		gb_SetTask(yanhua_gbtask, 2, 0);
		gb_SetTask(yanhua_gbtask, 3, 0);
		newyear0901_random_spaward();
	end
	
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local tbTalk = {"<dec>"..szDescLink.."Trong th�i gian ho�t ��ng ng��i ch�i t�ng ta 1 Ph�t T�i H�ng Bao th� s� c� th� nh�n ���c 1 Ph�o Hoa ��ng th�i c� c� h�i nh�n ���c ph�n qu� ��c bi�t. Ch� �: m�i ng�y ch� c� th� s� d�ng 1 Ph�t T�i H�ng Bao, nh�ng ph�n th��ng ��c bi�t ch�  nh�n ���c sau 21:00.",
		"T�ng Ph�t T�i H�ng Bao/newyear0901_give_facaihongbao",
		"Nh�n ph�n th��ng ��c bi�t/newyear0901_get_specialaward",
		"Ta ch� ti�n ���ng ��n ch�i./OnCancel"};
	CreateTaskSay(tbTalk);
end

function newyear0901_give_facaihongbao()
	if (GetLevel() < 50 or GetExtPoint(0) < 1) then
		Say("��i hi�p v�n ch�a �� c�p 50 ho�c v�n ch�a n�p th�, v� v�y kh�ng th� tham gia ho�t ��ng", 0);
		return
	end
	
	local n_dateD = tonumber(GetLocalDate("%Y%m%d"));
	if (GetTask(newyear0901_TSK_GetYanhuaDate) == n_dateD) then
		Say("��i hi�p h�m nay �� n�p Ph�t T�i H�ng Bao v� �� nh�n qua Ph�o Hoa M�ng Xu�n r�i.", 0);
		return
	end
	
	local n_dateH	= tonumber(GetLocalDate("%H"));
	if (n_dateH >= 21) then
		Say("Th�i gian nh�n Ph�o Hoa M�ng Xu�n c�a h�m nay �� qua r�i, xin m�i ��i ng�y mai.", 0);
		return
	end
	
	if (CalcFreeItemCellCount() < 1) then
		Say("H�nh trang c�a ��i hi�p kh�ng �� ch� tr�ng!",0);
		return
	end
	
	local nCount = CalcItemCount(3, 6, 1, 1893, -1); -- ���� gdp���ߵĸ���
	if (nCount <= 0) then
		Say("Tr�n h�nh trang ��i hi�p v�n ch�a c� Ph�t T�i H�ng Bao!", 0);
		return 
	end
	
	local bP = ConsumeItem(3, 1, 6, 1, 1893, -1); --  ����1�۳��ɹ�������0ʧ�ܣ�nCountΪָ���۳������� 
	if (bP <= 0) then
		print("Tr� Ph�t T�i H�ng Bao th�t b�i!");
		return
	end
	
	local n_itemid = AddItem(6, 1, 1929, 1, 0, 0);
	ITEM_SetExpiredTime(n_itemid, 20090216);
	SyncItem(n_itemid);
	Say("Ch�c m�ng ��i hi�p nh�n ���c 1 Ph�o Hoa M�ng Xu�n.", 0);
	
	AddOwnExp(1000000);
	n_dateD	= tonumber(GetLocalDate("%Y%m%d"));
	SetTask(newyear0901_TSK_GetYanhuaDate, n_dateD);
	gb_SetTask(yanhua_gbtask, 2, gb_GetTask(yanhua_gbtask, 2) + 1);
end

function newyear0901_get_specialaward()
	local n_dateD	= tonumber(GetLocalDate("%Y%m%d"));
	local n_dateH	= tonumber(GetLocalDate("%H"));
	if (n_dateH < 21) then
		Say("B�y gi� kh�ng ph�i l� th�i gian nh�n th��ng, xin m�i h�y quay l�i sau.", 0);
		return
	end
	
	if (GetTask(newyear0901_TSK_GetYanhuaDate) ~= n_dateD) then
		Say("H�m nay ��i hi�p v�n ch�a n�p Ph�t T�i H�ng Bao cho ta, n�n s� kh�ng c� c� h�i nh�n th��ng.", 0);
		return
	end
	
	if (GetTask(newyear0901_TSK_GetSpAwardDate)	== n_dateD)	then
		Say("��i hi�p �� tham d� l�nh ph�n th��ng ��c bi�t c�a h�m nay r�i.", 0);
		return
	end
	
	if (gb_GetTask(yanhua_gbtask, 3) >= 60) then
		Say("Ph�n qu� ��c bi�t h�m nay �� ph�t h�t r�i, xin m�i h�y ch� ng�y mai.", 0);
		return
	end
	
	SetTask(newyear0901_TSK_GetSpAwardDate, n_dateD);
	local n_rd_value = random(gb_GetTask(yanhua_gbtask, 2));
	local tb_award = tb_yanhua_randomaward[gb_GetTask(yanhua_gbtask, 3) + 1];
	if (n_rd_value <= 60) then
		tbAwardTemplet:GiveAwardByList(tb_award, "newyear0901_yanhua_specialaward");
		gb_SetTask(yanhua_gbtask, 3, gb_GetTask(yanhua_gbtask, 3) + 1);
		if (tb_award.nExp) then
			Say(format("��i hi�p thu ���c %d kinh nghi�m.", tb_award.nExp));
		else
			Say(format("Ch�c m�ng ��i hi�p nh�n ���c %s", tb_award.szName));
		end
	else
		Say("Th�t ��ng ti�c, ��i hi�p �� kh�ng nh�n ���c ph�n th��ng ��c bi�t c�a ng�y h�m nay, h�y c� g�ng th�m n�a nh�!", 0);
	end
end

function newyear0901_random_spaward()
	local tb_award	= tb_yanhua_specialreward;
	local n_id1		= 0;
	local n_id2		= 0;
	local tb_tmp	= {};
	
	for i = 1, 100 do
		n_id1	= random(getn(tb_award));
		n_id2	= random(getn(tb_award));
		tb_tmp	= tb_award[n_id1];
		tb_award[n_id1] = tb_award[n_id2];
		tb_award[n_id2]	= tb_tmp;
	end
	
	tb_yanhua_randomaward	= tb_award;
end

function newyear0901_yanhua_IsActDate()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate < 20090116 or nDate > 20090215) then
		return 0;
	else
		return 1;
	end
end