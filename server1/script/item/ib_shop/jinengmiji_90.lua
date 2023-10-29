-- �ļ�������jinengmiji_90.lua
-- �����ߡ���wangjingjun
-- ���ݡ����������ɵ��ؼ��� ����ѧϰ90������
-- ����ʱ�䣺2011-07-12 15:59:01

Include("\\script\\dailogsys\\dailogsay.lua")
--������0 ����1  ����2  �嶾3   ��ü4  ����5   ؤ��6   ����7   �䵱8   ����9��
sbook_list =
{	-- ��ʽ��{����ID, ���ܵȼ�, ����ID, ���輶��, ����������, ��������}
	[2959] = {	
		{318, 1, 0, 90, "Thi�u L�m M�t T�ch", "Thi�u L�m Ch��ng Ph�p - ��t Ma �� Giang"},
		{319, 1, 0, 90, "Thi�u L�m M�t T�ch", "Thi�u L�m C�n Ph�p - Ho�nh T�o Thi�n Qu�n"},
		{321, 1, 0, 90, "Thi�u L�m M�t T�ch", "Thi�u L�m Dao Ph�p - V� T��ng Tr�m"},
	},
	[2960] = {	
		{322, 1, 1, 90, "Thi�n V��ng M�t T�ch", "Thi�n V��ng �ao Ph�p - Ph� Thi�n Tr�m"},
		{323, 1, 1, 90, "Thi�n V��ng M�t T�ch", "Thi�n V��ng Th��ng Ph�p - Truy Tinh Tr�c Nguy�t"},
		{325, 1, 1, 90, "Thi�n V��ng M�t T�ch", "Thi�n V��ng Ch�y Ph�p - Truy Phong Quy�t"},
	},
	[2961] = {	 
		{339, 1, 2, 90, "���ng M�n M�t T�ch ", "���ng M�n Phi �ao - Nhi�p H�n Nguy�t �nh"},
		{302, 1, 2, 90, "���ng M�n M�t T�ch ", "���ng M�n T� Ti�n - B�o V� L� Hoa"},
		{342, 1, 2, 90, "���ng M�n M�t T�ch ", "���ng M�n Phi Ti�u - C�u Cung Phi Tinh"},
		{351, 1, 2, 90, "���ng M�n M�t T�ch ", "���ng m�n H�m T�nh - Lo�n Ho�n K�ch"},
	},
	[2962] = {	 
		{353, 1, 3, 90, "Ng� ��c M�t T�ch", "Ng� ��c Ch��ng Ph�p - �m Phong Th�c C�t"},
		{355, 1, 3, 90, "Ng� ��c M�t T�ch", "Ng� ��c �ao Ph�p - Huy�n �m Tr�m"},
		{390, 1, 3, 90, "Ng� ��c M�t T�ch", "Ng� ��c Nhi�p T�m Thu�t - �o�n C�n H� C�t"},
	},
	[2963] = {	 
		{328, 1, 4, 90, "Nga Mi M�t T�ch", "Nga My Ki�m Ph�p - Tam Nga T� Tuy�t"},
		{380, 1, 4, 90, "Nga Mi M�t T�ch", "Nga My Ch��ng Ph�p - Phong S��ng To�i �nh"},
		{332, 1, 4, 90, "Nga Mi M�t T�ch", "Nga Mi Ph� �� - Ph� �� Ch�ng Sinh"},
	},
	[2964] = {	 
		{336, 1, 5, 90, "Th�y Y�n M�t T�ch", "Th�y Y�n ��o Ph�p - B�ng Tung V� �no"},
		{337, 1, 5, 90, "Th�y Y�n M�t T�ch", "Th�y Y�n Song �ao - B�ng T�m Ti�n T�"},
	},
	[2965] = {	 
		{357, 1, 6, 90, "C�i Bang M�t T�ch", "C�i Bang Ch��ng Ph�p - Phi Long T�i Thi�n"},
		{359, 1, 6, 90, "C�i Bang M�t T�ch", "C�i Bang C�n Ph�p - Thi�n H� V� C�u"},
	},
	[2966] = {	 
		{361, 1, 7, 90, "Thi�n Nh�n M�t T�ch", "Thi�n Nh�n M�u Ph�p - V�n Long K�ch"},
		{362, 1, 7, 90, "Thi�n Nh�n M�t T�ch", "Thi�n Nh�n �ao Ph�p - Thi�n Ngo�i L�u Tinh"},
		{391, 1, 7, 90, "Thi�n Nh�n M�t T�ch", "Thi�n Nh�n Ch� Thu�t - Nhi�p H�n Lo�n T�m"},
	},
	[2967] = {	 
		{365, 1, 8, 90, "V� �ang M�t T�ch ", "V� �ang Ch��ng Ph�p - Thi�n ��a V� C�c"},
		{368, 1, 8, 90, "V� �ang M�t T�ch ", "V� �ang Ki�m Ph�p - Nh�n Ki�m H�p Nh�t"},
	},
	[2968] = {	 
		{372, 1, 9, 90, "C�n L�n M�t T�ch", "C�n L�n Ng� Phong - Ng�o Tuy�t Ti�u Phong"},
		{375, 1, 9, 90, "C�n L�n M�t T�ch", "C�n L�n Ng� L�i - L�i ��ng C�u Thi�n"},
		{394, 1, 9, 90, "C�n L�n M�t T�ch", "C�n L�n Ng� T�m - T�y Ti�n T� C�t"},
	},
}

function LearnSkillByBook(index, list, nItemIndex, nPlayerIndex)

	if(GetLastFactionNumber() ~= list[index][3]) then							-- ����ָ������
		Msg2Player("B�n c�m l�y "..list[index][5].."Nghi�n c�u c� n�a ng�y, k�t qu� c�ng kh�ng l�nh ng� ���c g� ")
		return 1
	end
	if(GetLevel() < list[index][4]) then							-- ��δ��ָ������
		Msg2Player("B�n c�m l�y "..list[index][5].."Nghi�n c�u c� n�a ng�y, k�t qu� l�nh ng� r�t �t. ")
		return 1
	end
	if(HaveMagic(list[index][1]) ~= -1) then							-- ��ѧ���ü���
		Msg2Player("B�n �� c�m "..list[index][5].."Nghi�n t�i ng�m lui, nh�ng c�ng kh�ng h�c ���c g� trong �� ")
		return 1
	end
	
	-- �жϵ�ǰ����Ʒ�Ƿ�Ϊ�����ؼ���������ɾ���������Ӽ���
	if CallPlayerFunction(nPlayerIndex, IsMyItem, nItemIndex) ~= 1 then
		return 
	end
	if CallPlayerFunction(nPlayerIndex, RemoveItemByIndex, nItemIndex) ~= 1 then
		WriteLog("H�y B� Thi�u L�m M�t T�ch th�t b�i")
		return 
	end
	
	AddMagic(list[index][1], list[index][2])										-- ѧ�Ἴ��

	WriteLog(date("%H%M%S")..": T�i kho�n:"..GetAccount()..", nh�n v�t:"..GetName()..", S� d�ng: "..list[index][5].."�� h�c ���c: "..list[index][6]);
	Msg2Player("�� h�c ���c k� n�ng "..list[index][6].."'. ")
	return 0
end

function selectskill(list, nItemIndex, nPlayerIndex)
	local szTitle = "��i hi�p mu�n h�c lo�i k� n�ng n�o"
	local tbOpt = {}
	for index,v in list do
		tinsert(tbOpt, {v[6], LearnSkillByBook, {index, list, nItemIndex, PlayerIndex}})
	end
	tinsert(tbOpt, {"�� ta suy ngh� l�i", cancel})
	CreateNewSayEx(szTitle, tbOpt)
end

function main(nItemIndex)
	Genre, DetailType, Particular=GetItemProp(nItemIndex)
	selectskill(sbook_list[Particular], nItemIndex, PlayerIndex)
	return 1
end
