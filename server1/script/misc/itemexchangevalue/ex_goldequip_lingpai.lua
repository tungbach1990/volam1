-- ====================== �ļ���Ϣ ======================

-- ������Ե�����Խ���շѰ� - �һ���װ�����ƣ������ȣ�
-- �ļ�������ex_goldequip_lingpai.lua
-- �����ߡ����ӷ��~
-- ����ʱ�䣺2010-06-22 11:02:54

-- ======================================================


IncludeLib("ITEM")
Include("\\script\\misc\\itemexchangevalue\\ex_goldequip_head.lua")	-- �һ���װ�����ƣ������ȣ�
Include( "\\script\\task\\system\\task_string.lua" );
Include("\\script\\lib\\log.lua");

function exchange_lingpai2goldequip()
	local aryDescribe =
	{
		"<dec><npc>Ng��i mu�n ��i lo�i trang b� n�o?",
		format("B� trang b� Thanh C�u/#take_xp_equip_1(1,%d)", 905),
		format("B� trang b� V�n L�c/#take_xp_equip_1(2,%d)", 1135),
		format("B� trang b� Th��ng Lang/#take_xp_equip_1(3,%d)", 1365),
		format("B� trang b� Huy�n Vi�n/#take_xp_equip_1(4, %d)", 1595),
--		format("B� trang b� T� M�ng/#take_xp_equip_1(5, %d)", 1825),
--		format("������װ/#take_xp_equip_1(6, %d)", 2055),
--		format("�׻���װ/#take_xp_equip_1(7, %d)", 2285),
		"L�t n�a quay l�i /no",
	};
	
	CreateTaskSay(aryDescribe);
end


function take_xp_equip_1(n_g, n_d)
	
	if (CalcItemCount(3, tbLingpai[n_g].tbProp[1],tbLingpai[n_g].tbProp[2],tbLingpai[n_g].tbProp[3],-1) <= 0) then
		Talk(1, "", "H�nh nh� ��i hi�p qu�n mang l�nh b�i �?")
		return
	end
	
	CreateTaskSay({"<dec><npc>��i hi�p mu�n ��i trang b� c�a h� ph�i n�o b�n d��i:", 
						format("Quy�n Thi�u L�m/#take_xp_equip_2(%d,%d, 1)", n_g, n_d),
						format("C�n Thi�u L�m/#take_xp_equip_2(%d,%d, 2)", n_g, n_d),
						format("Thi�u L�m �ao/#take_xp_equip_2(%d,%d, 3)", n_g, n_d),
						format("Ch�y Thi�n V��ng/#take_xp_equip_2(%d,%d, 4)", n_g, n_d),
						format("Th��ng Thi�n V��ng/#take_xp_equip_2(%d,%d, 5)", n_g, n_d),
						format("�ao Thi�n V��ng/#take_xp_equip_2(%d,%d, 6)", n_g, n_d),
						format("Nga Mi ki�m/#take_xp_equip_2(%d,%d, 7)", n_g, n_d),
						format("Nga Mi ch��ng/#take_xp_equip_2(%d,%d, 8)", n_g, n_d),
						format("Th�y Y�n �ao/#take_xp_equip_2(%d,%d, 9)", n_g, n_d),
						format("Thi�u Y�n n�i/#take_xp_equip_2(%d,%d, 10)", n_g, n_d),
						format("Ng� ��c ch��ng/#take_xp_equip_2(%d,%d, 11)", n_g, n_d),
						format("Ng� ��c �ao/#take_xp_equip_2(%d,%d, 12)", n_g, n_d),
						format("Trang k� /#take_xp_equip_11(%d,%d)", n_g, n_d),
						"L�t n�a quay l�i /no"});
end

function take_xp_equip_11(n_g, n_d)
	CreateTaskSay({"<dec><npc>��i hi�p mu�n ��i trang b� c�a h� ph�i n�o b�n d��i:", 
						format("���ng M�n phi �ao/#take_xp_equip_2(%d,%d, 13)", n_g, n_d),
						format("���ng M�n n�/#take_xp_equip_2(%d,%d, 14)", n_g, n_d),
						format("���ng M�n ti�u/#take_xp_equip_2(%d,%d, 15)", n_g, n_d),
						format("C�i Bang ch��ng/#take_xp_equip_2(%d,%d, 16)", n_g, n_d),
						format("C�i Bang c�n/#take_xp_equip_2(%d,%d, 17)", n_g, n_d),
						format("Thi�n Nh�n chi�n/#take_xp_equip_2(%d,%d, 18)", n_g, n_d),
						format("Thi�n Nh�n ma/#take_xp_equip_2(%d,%d, 19)", n_g, n_d),
						format("V� �ang kh�/#take_xp_equip_2(%d,%d, 20)", n_g, n_d),
						format("V� �ang ki�m/#take_xp_equip_2(%d,%d, 21)", n_g, n_d),
						format("�ao C�n L�n/#take_xp_equip_2(%d,%d, 22)", n_g, n_d),
						format("Ki�m C�n L�n/#take_xp_equip_2(%d,%d, 23)", n_g, n_d),
						format("Trang tr��c/#take_xp_equip_1(%d,%d)", n_g, n_d),
						"L�t n�a quay l�i /no"});
end


function take_xp_equip_2(n_g, n_d, n_p)
	local n_count = 10;
	
	if (n_g == 5) then		
		n_count = 5;
	end
	
	local n_s =(n_p - 1)*n_count + 1;
	
	local aryDescribe = {
		"<dec><npc>��i hi�p mu�n ��i trang b� c�a h� ph�i n�o b�n d��i:",
	};
	for i = n_s, n_s+n_count-1 do
		tinsert(aryDescribe, tbGoldEquip_Lingpai[n_g][i][1]..format("/#take_xp_equip_3(%d, %d, %d, %d)", n_g, n_d, n_p,i));
	end
	
	tinsert(aryDescribe, "L�t n�a quay l�i /no");
	CreateTaskSay(aryDescribe);
end

function take_xp_equip_3(n_g, n_d, n_p, n_x)
	if (CountFreeRoomByWH(2,4,1) < 1) then
		Talk(1, "", "H�nh trang kh�ng �� � tr�ng! Xin h�y s�p x�p r�i quay l�i nh�.");
		return
	end
	
	local nLingpaiIdx = GetNextItemIndexInRoom(0, tbLingpai[n_g].tbProp[1],tbLingpai[n_g].tbProp[2],tbLingpai[n_g].tbProp[3],-1, 3);
	local n_bindstate = GetItemBindState(nLingpaiIdx);
	local n_expiredtime = ITEM_GetExpiredTime(nLingpaiIdx);
	
	if (ConsumeItem(3,1, tbLingpai[n_g].tbProp[1],tbLingpai[n_g].tbProp[2],tbLingpai[n_g].tbProp[3],-1) ~= 1) then
		Talk(1, "", "H�nh nh� ��i hi�p qu�n mang l�nh b�i �?")
		return
	end
	
	local nItemIdx = AddGoldItem(0, tbGoldEquip_Lingpai[n_g][n_x][2]);
	
--	Խ�ϰ汾û�д�����
--	if (n_expiredtime ~= 0 ) then
--		ITEM_SetExpiredTime(nItemIdx,86400)
--		SyncItem(nItemIdx)
--	end
	
	if (n_bindstate ~= 0) then
		
		if (n_bindstate == -2) then
			n_new_bindtime = take_xp_equip_calc_binditem(tbLingpai_BindTime[n_g].nBindState);
		else
			n_new_bindtime = n_bindstate;
		end
		
		SetItemBindState(nItemIdx, n_new_bindtime);
	end
	
	Msg2Player("Nh�n ���c ��"..GetItemName(nItemIdx));
	
	local szLog = format("%s\t%s\t%u",tbLingpai[n_g].szName, GetItemName(nItemIdx), ITEM_GetItemRandSeed(nItemIdx))
	
	_WritePlayerLog("Token Exchange Equip", szLog)
end

TIME_2000_1_1 = 946656000;		-- 2000��1��1�� ����� 1970��1��1�յ�����

function take_xp_equip_calc_binditem(nLingpaiBindTime)
	if (nLingpaiBindTime == -2) then
		return -2;
	end
	local n_new_bindtime = nLingpaiBindTime - 7*24 + floor((GetCurServerTime() - TIME_2000_1_1) / 3600);
	return n_new_bindtime;
end

