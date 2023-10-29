-- �������� �Ի��ű�
-- Li_Xin(2004-07-20)

--Include("\\script\\global\\systemconfig.lua") -- ϵͳ����
IncludeLib("ITEM")
IncludeLib("SETTING")

function writeChapManLog(str)
	WriteLog(date("%H%M%S")..": T�i kho�n:"..GetAccount()..", nh�n v�t:"..GetName()..","..str);
end;

function writeChapManGoldLog( str, nPaidGold, nPaidSilver, nPaidCoin, nPaidTicket )
	WriteGoldLog( GetAccount().."("..GetName()..") "..str, -nPaidGold, -nPaidSilver, -nPaidCoin, -nPaidTicket );
end;

function get1()
	str=
	{
		"<#> ��y ch�nh l� �� ph� v� kh� qu� b�u trong v� l�m. �� ph� v� kh� d�ng �� ��c luy�n binh kh�, c� c�ng d�ng t�ng ��ng c�p. ng��i c� th� d�ng Th�y Tinh �� trao ��i, c� nhu c�u kh�ng?",
		"<#> Ch� xem th�i/no",
		"<#> L�ng V��ng Th��ng �o�n T�o T�n bi�n (Th��ng) /yes1",
		"<#> Huy�n V� Ch�y Chi ��c T�o thu�t (Ch�y) /yes2",
		"<#> Long Ng�m Ki�m �o�n T�o �� (Ki�m) /yes3",
		"<#> Gia C�t C� Qu�t M�t y�u (Cung) /yes4",
		"<#> Li�u Di�p To�i Phong �ao. T�y Th� bi�n (Phi �ao) /yes5",
		"<#> Huy�n Nguy�t �ao T� Kinh b�o l�c (�ao) /yes6",
		"<#> Thi�n C� C�n �� ph� (C�n) /yes7",
		"<#> �m Kh� T�ng ph�. Quy�n 1 (Ph� ti�u) /yes8",
		"<#> Uy�n ��ng �ao. Khai Quang  bi�n (Song �ao) /yes9"
	};
	Say(str[1],10,str[2],str[3],str[4],str[5],str[6],str[7],str[8],str[9],str[10],str[11])
end;

function get2()
	str=
	{
		"<#> K� tr�n B�o v�t c�a ta c� th� d�ng �� ch� t�o, kh�m n�m, t�ng v� gi�m ��ng c�p trang b�. Kh�ch quan c� mu�n xem qua kh�ng?",
		"<#> B�ng t�m V� C�c t� (T�ng ��ng c�p) /buy_silk",
		"<#> Nam Minh Chi Tinh (Gi�m ��ng c�p) /buy_stone",
		"<#> Ch� xem th�i/no",
	};
	Say(str[1],3,str[2],str[3],str[4])
end;

function yes1()
	-- Խ�ϰ汾�۸�Ķ���
	--Say("�������ˣ���ȷ��Ҫ��<color=red>����ǹ�����ƪ<color>������ǹ�����ƪ��Ҫ3��<color=red>��ˮ��<color>��<color=red>2����ˮ��<color>��<color=red>1����ˮ��<color>������",2,"ȷ��/sure1","ȡ��/no")
	Say("��i hi�p x�c ��nh mu�n ��i <color=red>L�ng V��ng Th��ng �o�n T�o T�n Bi�n<color> ch�? C�n c� 1 <color=red>T� Th�y Tinh<color>, <color=red>1 L�c Th�y Tinh<color> v� <color=red>1 Lam Th�y Tinh<color> �� ��i!",2,"X�c nh�n/sure1","H�y b� /no")
end;

function sure1()
	if ((GetItemCountEx(238)>=1) and (GetItemCountEx(239)>=1) and (GetItemCountEx(240)>=1)) then 
		Talk(1,"","Ha!Ha! Th�y Tinh ��p qu�! ��y l� �� ph�, b�o ��m c� th� gi�p ��i hi�p th�ng c�p v� kh�.")
	  	DelItemEx(238)
	  	DelItemEx(239)
	  	--DelItemEx(239)
	  	--DelItemEx(239)
	  	DelItemEx(240)
	  	--DelItemEx(240)
	  	AddEventItem(406)
	  	writeChapManLog("B�n nh�n ���c L�ng V��ng Th��ng �o�n T�o T�n bi�n.")
	  	Msg2Player("B�n nh�n ���c L�ng V��ng Th��ng �o�n T�o T�n bi�n.")
	else
	  	Talk(1,"","L�ng V��ng Th��ng �o�n T�o T�n Bi�n c�n ph�i 1 T� Th�y Tinh, 1 L�c Th�y Tinh v� 1 Lam Th�y Tinh  �� ��i. ��i hi�p h�nh nh� ch�a �� Th�y Tinh!")
	end
end;

function yes2()
	Say("��i hi�p x�c ��nh mu�n ��i <color=red>Huy�n V� Ch�y ��c T�o Thu�t<color> ch�? C�n c� 1 <color=red>T� Th�y Tinh<color>, 1 <color=red>L�c Th�y Tinh<color> v� 1 <color=red>Lam Th�y Tinh<color> �� ��i!",2,"X�c nh�n/sure2","H�y b� /no")
end;

function sure2()
	if ((GetItemCountEx(238)>=1) and (GetItemCountEx(239)>=1) and (GetItemCountEx(240)>=1)) then 
		Talk(1,"","Ha!Ha! Th�y Tinh ��p qu�! ��y l� �� ph�, b�o ��m c� th� gi�p ��i hi�p th�ng c�p v� kh�.")
	  	DelItemEx(238)
	  	--DelItemEx(238)
	  	DelItemEx(239)
	  	--DelItemEx(239)
	  	DelItemEx(240)
	  	--DelItemEx(240)
	  	AddEventItem(407)
	  	writeChapManLog("B�n nh�n ���c Huy�n V� Ch�y Chi ��c T�o thu�t.")
	  	Msg2Player("B�n nh�n ���c Huy�n V� Ch�y Chi ��c T�o thu�t.")
	else
	  	Talk(1,"","Huy�n V� Ch�y ��c T�o Thu�t c�n c� 1 T� T�y Tinh, 1 L�c Th�y Tinh v� 1 Lam Th�y Tinh �� ��i.��i hi�p h�nh nh� ch�a �� Th�y Tinh!")
	end
end;

function yes3()
	Say("��i hi�p x�c ��nh mu�n ��i <color=red>Long Ng�m Ki�m �o�n T�o ��<color> ch�? C�n 1 <color=red>T� Th�y Tinh<color>, 1 <color=red>L�c Th�y Tinh<color> v� 1 <color=red>Lam Th�y Tinh<color> �� ��i!",2,"X�c nh�n/sure3","H�y b� /no")
end;

function sure3()
	if ((GetItemCountEx(238)>=1) and (GetItemCountEx(239)>=1) and (GetItemCountEx(240)>=1)) then 
		Talk(1,"","Ha!Ha! Th�y Tinh ��p qu�! ��y l� �� ph�, b�o ��m c� th� gi�p ��i hi�p th�ng c�p v� kh�.")
	  	DelItemEx(238)
	  	--DelItemEx(238)
	  	--DelItemEx(238)
	  	DelItemEx(239)
	  	DelItemEx(240)
	  	--DelItemEx(240)
	  	AddEventItem(408)
	  	writeChapManLog("B�n nh�n ���c Long Ng�m Ki�m �o�n T�o ��.")
	  	Msg2Player("B�n nh�n ���c Long Ng�m Ki�m �o�n T�o ��.")
	else
	  	Talk(1,"","Long Ng�m Ki�m �o�n T�o �� c�n 1 T� T�y Tinh, 1 L�c Th�y Tinh v� 1 Lam Th�y Tinh �� ��i. ��i hi�p h�nh nh� ch�a �� Th�y Tinh!")
	end
end;

function yes4()
	Say("��i hi�p x�c ��nh mu�n ��i <color=red>Gia C�t C� Qu�t M�t Y�u<color> ch�? C�n 1 <color=red>T� Th�y Tinh<color>, 1 <color=red>L�c Th�y Tinh<color> v� 1 <color=red>Lam Th�y Tinh<color> �� ��i!",2,"X�c nh�n/sure4","H�y b� /no")
end;

function sure4()
	if ((GetItemCountEx(238)>=1) and (GetItemCountEx(239)>=1) and (GetItemCountEx(240)>=1)) then 
		Talk(1,"","Ha!Ha! Th�y Tinh ��p qu�! ��y l� �� ph�, b�o ��m c� th� gi�p ��i hi�p th�ng c�p v� kh�.")
	  	DelItemEx(238)
	  	DelItemEx(239)
	  	--DelItemEx(239)
	  	DelItemEx(240)
	  	--DelItemEx(240)
	  	AddEventItem(409)
	  	writeChapManLog("B�n nh�n ���c Gia C�t C� Qu�t M�t y�u.")
	  	Msg2Player("B�n nh�n ���c Gia C�t C� Qu�t M�t y�u.")
	else
	  	Talk(1,"","Gia C�t C� Qu�t M�t Y�u c�n c� 1 T� T�y Tinh, 1 L�c Th�y Tinh v� 1 Lam Th�y Tinh �� ��i. ��i hi�p h�nh nh� ch�a �� Th�y Tinh!")
	end
end;

function yes5()
	Say("��i hi�p x�c ��nh mu�n ��i <color=red>Li�u Di�p To�i Phong �ao. T�y Th� Bi�n<color> ch�? C�n 1 <color=red>T� Th�y Tinh<color>, 1 <color=red>L�c Th�y Tinh<color> v� 1 <color=red>Lam Th�y Tinh<color> �� ��i!",2,"X�c nh�n/sure5","H�y b� /no")
end;

function sure5()
	if ((GetItemCountEx(238)>=1) and (GetItemCountEx(239)>=1) and (GetItemCountEx(240)>=1)) then 
		Talk(1,"","Ha!Ha! Th�y Tinh ��p qu�! ��y l� �� ph�, b�o ��m c� th� gi�p ��i hi�p th�ng c�p v� kh�.")
	  	DelItemEx(238)
	  	--DelItemEx(238)
	  	DelItemEx(239)
	  	DelItemEx(240)
	  	AddEventItem(410)
	  	writeChapManLog("B�n nh�n ���c Li�u Di�p To�i Phong �ao. T�y Th� bi�n.")
	  	Msg2Player("B�n nh�n ���c Li�u Di�p To�i Phong �ao. T�y Th� bi�n.")
	else
	  	Talk(1,"","Li�u Di�p To�i Phong �ao. T�y Th� Bi�n c�n 1 T� T�y Tinh, 1 L�c Th�y Tinh v� 1 Lam Th�y Tinh �� ��i. ��i hi�p h�nh nh� ch�a �� Th�y Tinh!")
	end
end;

function yes6()
	Say("��i hi�p x�c ��nh mu�n ��i <color=red>Huy�n Nguy�t �ao T� Kinh B�o L�c<color> ch�? C�n c� 1 <color=red>T� Th�y Tinh<color>, 1 <color=red>L�c Th�y Tinh<color> v� 1 <color=red>Lam Th�y Tinh<color> �� ��i!",2,"X�c nh�n/sure6","H�y b� /no")
end;

function sure6()
	if ((GetItemCountEx(238)>=1) and (GetItemCountEx(239)>=1) and (GetItemCountEx(240)>=1)) then 
		Talk(1,"","Ha!Ha! Th�y Tinh ��p qu�! ��y l� �� ph�, b�o ��m c� th� gi�p ��i hi�p th�ng c�p v� kh�.")
	  	DelItemEx(238)
	  	--DelItemEx(238)
	  	DelItemEx(239)
	  	--DelItemEx(239)
	  	DelItemEx(240)
	  	AddEventItem(411)
	  	writeChapManLog("B�n nh�n ���c Huy�n Nguy�t �ao T� Kinh b�o l�c.")
	  	Msg2Player("B�n nh�n ���c Huy�n Nguy�t �ao T� Kinh b�o l�c.")
	else
	  	Talk(1,"","Huy�n Nguy�t �ao T� Kinh B�o L�c c�n c� 1 T� T�y Tinh, 1 L�c Th�y Tinh v� 1 Lam Th�y Tinh �� ��i. ��i hi�p h�nh nh� ch�a �� Th�y Tinh!")
	end
end;

function yes7()
	Say("��i hi�p x�c ��nh mu�n ��i <color=red>Thi�n C� C�n �� Ph�<color> ch�? C�n 1 <color=red>T� Th�y Tinh<color>, 1 <color=red>L�c Th�y Tinh<color> v� 1 <color=red>Lam Th�y Tinh<color> �� ��i!",2,"X�c nh�n/sure7","H�y b� /no")
end;

function sure7()
	if ((GetItemCountEx(238)>=1) and (GetItemCountEx(239)>=1) and (GetItemCountEx(240)>=1)) then 
		Talk(1,"","Ha!Ha! Th�y Tinh ��p qu�! ��y l� �� ph�, b�o ��m c� th� gi�p ��i hi�p th�ng c�p v� kh�.")
	  	DelItemEx(238)
	  	DelItemEx(239)
	  	DelItemEx(240)
	  	AddEventItem(412)
	  	writeChapManLog("B�n nh�n ���c Thi�n C� C�n �� ph�.")
	  	Msg2Player("B�n nh�n ���c Thi�n C� C�n �� ph�.")
	else
	  	Talk(1,"","Thi�n C� C�n �� Ph� c�n 1 T� T�y Tinh, 1 L�c Th�y Tinh v� 1 Lam Th�y Tinh �� ��i. ��i hi�p h�nh nh� ch�a �� Th�y Tinh!")
	end
end;

function yes8()
	Say("��i hi�p x�c ��nh mu�n ��i <color=red>�m Kh� T�ng Ph�.Quy�n 1<color> ch�? C�n c� 2 <color=red>T� Th�y Tinh<color> �� ��i!",2,"X�c nh�n/sure8","H�y b� /no")
end;

function sure8()
	if ((GetItemCountEx(239)>=2)) then 
		Talk(1,"","Ha!Ha! Th�y Tinh ��p qu�! ��y l� �� ph�, b�o ��m c� th� gi�p ��i hi�p th�ng c�p v� kh�.")
	  	DelItemEx(239)
	  	DelItemEx(239)
	  	AddEventItem(413)
	  	writeChapManLog("B�n nh�n ���c �m Kh� T�ng ph�. Quy�n 1.")
	  	Msg2Player("B�n nh�n ���c �m Kh� T�ng ph�. Quy�n 1.")
	else
	  	Talk(1,"","�m Kh� T�ng Ph�.Quy�n 1 c�n c� 2 T� Th�y Tinh �� ��i. ��i hi�p h�nh nh� ch�a �� Th�y Tinh!")
	end
end;

function yes9()
	Say("��i hi�p x�c ��nh mu�n ��i <color=red>Uy�n ��ng �ao. Khai Quang Bi�n<color> ch�?Uy�n ��ng �ao. C�n 1 <color=red>T� Th�y Tinh<color> �� ��i!",2,"X�c nh�n/sure9","H�y b� /no")
end;

function sure9()
	if ((GetItemCountEx(239)>=1)) then 
		Talk(1,"","Ha!Ha! Th�y Tinh ��p qu�! ��y l� �� ph�, b�o ��m c� th� gi�p ��i hi�p th�ng c�p v� kh�.")
	  	DelItemEx(239)
	  	AddEventItem(414)
	  	writeChapManLog("B�n nh�n ���c Uy�n ��ng �ao. Khai Quang  bi�n.")
	  	Msg2Player("B�n nh�n ���c Uy�n ��ng �ao. Khai Quang  bi�n.")
	else
	  	Talk(1,"","Uy�n ��ng �ao. Khai Quang Bi�n c�n 1 T� Th�y Tinh �� ��i. ��i hi�p h�nh nh� ch�a �� Th�y Tinh!")
	end
end;

function buy_silk()
	str=
	{
		"<#> Kh�ch quan x�c ��nh mua <color=red>B�ng T�m V� C�c T�<color> ch�? <color=red>40 Ti�n ��ng<color> ��i ���c <color=red>1 B�ng T�m V� C�c T�<color>.",
		"<#> S� d�ng/sure10",
		"<#> H�y b� /no",
	};
	Say(str[1],2,str[2],str[3])
end;

function sure10()
	if (CalcEquiproomItemCount(4, 417, 1, 1)>=40) then 
		Talk(1,"","Ha! Ha! �� nh�n ���c 40 Ti�n ��ng. ��y l� <color=red>B�ng T�m V� C�c T�<color>. ��i hi�p xem! ��m b�o c� th� th�ng c�p y ph�c, kh�i m�o!")
	  	ConsumeEquiproomItem(40, 4, 417, 1, 1)
	  	AddEventItem(415)
	  	UseSilver(1, 2, 2); -- ��Ԫ���һ�ΪͭǮ������ͳ��(ֱ�����ĵ�Ԫ����Ʊ����ͭǮ�һ���ͬ����)
	  	SaveNow(); -- ��������
	  	-- writeChapManLog("��õ������޼�˿��")
	  	writeChapManGoldLog("D�ng 40 ti�n ��ng ��i ���c B�ng T�m V� C�c T�", 1, 0, 0, 0);
	  	Msg2Player("B�n nh�n ���c B�ng T�m V� C�c T�.")
	else
	  	Talk(1,"","B�ng T�m V� C�c T� ph�i ��i b�ng 40 Ti�n ��ng, ��i hi�p d��ng nh� ch�a �� Ti�n ��ng!")
	end
end;

function buy_stone()
	str=
	{
		"<#> Kh�ch quan x�c ��nh mua <color=red>Nam Minh Chi Tinh<color> ch�? <color=red>40 Ti�n ��ng<color> ��i ���c <color=red>1 Nam Minh Chi Tinh<color>.",
		"<#> S� d�ng/sure11",
		"<#> H�y b� /no",
	};
	Say(str[1],2,str[2],str[3])
end;

function sure11()
	if (CalcEquiproomItemCount(4, 417, 1, 1)>=40) then 
		Talk(1,"","Ha! Ha! �� nh�n ���c 40 Ti�n ��ng. ��y l� <color=red>Nam Minh Chi Tinh<color>. ��i hi�p xem! ��m b�o c� th� gi�m c�p y ph�c, kh�i m�o!")
	  	ConsumeEquiproomItem(40, 4, 417, 1, 1)
	  	AddEventItem(416)
		UseSilver(1, 2, 2); -- ��Ԫ���һ�ΪͭǮ������ͳ��(ֱ�����ĵ�Ԫ����Ʊ����ͭǮ�һ���ͬ����)
		SaveNow(); -- ��������
		
	  	-- writeChapManLog("��õ�����֮����")
	  	writeChapManGoldLog("D�ng 40 Ti�n ��ng ��i ���c Nam Minh Chi Tinh", 1, 0, 0, 0);
	  	Msg2Player("B�n nh�n ���c Nam Minh Chi Tinh.")
	else
	  	Talk(1,"","Nam Minh Chi Tinh ph�i ��i b�ng 40 Ti�n ��ng, ��i hi�p d��ng nh� ch�a �� Ti�n ��ng!")
	end
end;


function deal_brokenequip()
	if (ST_CheckLockState() == 1) then
		Say("Mu�n s�a <color=red><trang b� t�n h�i><color>, c�n ph�i m� m�t m� r��ng ra. R��ng c�a b�n trong tr�ng th�i �ang ���c<color=red> kh�a l�i<color>! C�n ph�i m� kh�a tr��c!", 0)
		return
	end
	Say("B�n c� <color=red><trang b� t�n h�i><color>kh�ng? Mu�n s�a nh� th� n�o?", 2, "Ta mu�n s� d�ng Ti�n ��ng �� kh�i ph�c l�i/restore_brokenequip", "ta kh�ng c�n ��u! H�y gi� l�i �i!/throw_brokenequip")	
end

function check_brokenequip(nCount, szDealFunc)
	if (nCount <= 0) then
		return 0
	end

	if (nCount > 1) then
		Say("M�i l�n ch� s�a ���c m�t <color=red><trang b� t�n h�i><color> th�i!", 2, "�! Th� ra ��t nh�m �� ta th� l�i./"..szDealFunc, "�� ta ki�m tra xem sao/no")
		return 0
	end
	
	local nItemIdx = GetGiveItemUnit(1);
	itemgenre, detailtype, parttype = GetItemProp(nItemIdx)
	if (itemgenre ~= 7) then -- �����𻵵�װ��
		Say("Nh�ng th� b�n ��t v�o kh�ng ph�i <color=red><trang b� t�n h�i><color>, xin ki�m tra k� l�i.", 2, "�! Th� ra ��t nh�m �� ta th� l�i./"..szDealFunc, "�� ta ki�m tra xem sao/no")
		return	0	
	end
	
	return nItemIdx
end

------------------------------------
-- ���𻵵�װ��������
function throw_brokenequip()
	GiveItemUI( "<trang b� t�n h�i>giao di�n thu h�i", "M�i b�n ��t <trang b� t�n h�i> c�n thu h�i v�o � b�n d��i.", "on_throw_be", "no" );
end

function on_throw_be(nCount)
	local nItemIdx = check_brokenequip(nCount, "throw_brokenequip")
	if (nItemIdx == 0) then
		return
	end
	
	local szItemName = GetItemName(nItemIdx)
	Say("<color=red><trang b� t�n h�i>"..szItemName.."<color> m�t khi thu h�i, s� bi�n m�t, ng��i x�c ��nh mu�n thu h�i kh�ng?", 2, "ta x�c ��nh kh�ng c�n n�a, h�y thu h�i �i!/#throw_be_sure("..nItemIdx..")", "�� ta suy ngh� l�i/no")
end

function throw_be_sure(nItemIdx)
	local szItemName = GetItemName(nItemIdx)
	RemoveItemByIndex(nItemIdx)
	Msg2Player("<trang b� t�n h�i>"..szItemName.." �� b� thu h�i");
	writeChapManLog("[Remove]: RestoreBrokenEquip Remove: "..szItemName);
end
------------------------------------

------------------------------------
-- ���𻵵�װ�����ָ�
function restore_brokenequip()
	GiveItemUI( "<trang b� t�n h�i> giao di�n ph�c h�i", "Xin m�i b� <trang b� �� h� h�ng> v�o � b�n d��i. Ph� c�n s�a (xu): trang b� ph� th�ng c�n 1 xu, t�m c�n 2 xu, ho�ng kim c�n 5 xu, b�ch kim c�n 6 xu (s�a b�ch kim +6 tr� l�n c�n c�n th�m thi�t huy�t ��n). Ch� �: tr��c khi ti�n h�nh s�a trang b�, h�y ki�m tra h�nh trang c�n �� � tr�ng.", "on_restore_be", "no", 1);	
end

function on_restore_be(nCount)
	local nItemIdx = check_brokenequip(nCount, "restore_brokenequip")
	if (nItemIdx == 0) then
		return
	end
	
	local szItemName = GetItemName(nItemIdx)
	local nQuality = GetItemQuality(nItemIdx)
	local nCoinCount = GetCashCoin();
	local nNeedCoin = 0;

	if (nQuality == 0) then
		nNeedCoin = 1;
	elseif (nQuality == 1) then -- �ƽ�װ��
		nNeedCoin = 5;
	elseif (nQuality == 2) then -- ��ɫװ��
		nNeedCoin = 2;
	elseif (nQuality == 4) then -- �׽�װ��
		nNeedCoin = 10;
	end
	
	if (nNeedCoin <= 0) then
		Say("��y l� trang b� g� v�y, ta kh�ng nh�n ra ���c? H�y li�n h� v�i ng��i c� tr�ch nhi�m.", 1, "Uhm/no")
		writeChapManLog("[Error]: RestoreBrokenEquip Fail. ItemQuality:"..nQuality);
		return
	end
	
	if (nCoinCount < nNeedCoin) then
		Say("Mu�n ph�c h�i <color=red><trang b� t�n h�i>"..szItemName.."<color>, c�n"..nNeedCoin.."Ti�n ��ng. Ti�n ��ng b�n mang theo kh�ng ��, t�m v�i c�i n�a �i!", 1, "Hi�u r�i, �� ta �i l�y Ti�n ��ng ��!/no")
		return
	end
	
	if (nQuality == 4 and GetPlatinaLevel(nItemIdx) >= 6) then
		if (CalcEquiproomItemCount(6,1,2163,-1) < 1) then
			Say("Th�n b� th��ng nh�n: H�nh trang kh�ng c� thi�t huy�t ��n, kh�ng th� s�a trang b�.", 0)
			return
		end
		
		if (ConsumeItem(3, 1, 6, 1, 2163,-1) ~= 1) then
			Msg2Player("<trang b� t�n h�i>"..szItemName.." ph�c h�i th�t b�i, xin li�n h� ng��i c� tr�ch nhi�m");
			Say("<trang b� t�n h�i>"..szItemName.." ph�c h�i th�t b�i, xin li�n h� ng��i c� tr�ch nhi�m.", 1, "���c!/no")
			writeChapManGoldLog("[Error]: RestoreBrokenEquip Fail: thi�u thi�t huy�t ��n"..szItemName, 0, 0, nNeedCoin, 0);
			return
		end
	end
	
	if (PayCoin(nNeedCoin) == 1) then
		if (ITEM_BrokenEquip2Normal(nItemIdx) == 1) then
			SetCurDurability(nItemIdx, GetMaxDurability(nItemIdx)) -- �;öȻָ�Ϊ����;ö�
			Msg2Player("Ti�u hao"..nNeedCoin.."Ti�n ��ng, <trang b� t�n h�i>"..szItemName.." ph�c h�i th�nh c�ng, xin ki�m tra h�nh trang");
			writeChapManGoldLog("[Succeed]: RestoreBrokenEquip Ok: "..szItemName, 0, 0, nNeedCoin, 0)
			-- Fix ch�c n�ng s�a �� - Created by AnhHH - 20110704
			KickOutSelf()
		else
			Msg2Player("<trang b� t�n h�i>"..szItemName.." ph�c h�i th�t b�i, xin li�n h� ng��i c� tr�ch nhi�m");
			Say("<trang b� t�n h�i>"..szItemName.." ph�c h�i th�t b�i, xin li�n h� ng��i c� tr�ch nhi�m.", 1, "���c!/no")
			writeChapManGoldLog("[Error]: RestoreBrokenEquip Fail: "..szItemName, 0, 0, nNeedCoin, 0)
		end
	end
end
------------------------------------

function no()
end
