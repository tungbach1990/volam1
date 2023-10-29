IncludeLib("ITEM");
IncludeLib("FILESYS")

TB_PLATINARECOIN_INFO ={
--[�׽�ID] = {װ����, ����������};
--[1] = {"����֮����ɮñ", 2},
}
RECOIN_PLATINA_DATE_RANGE = {20070420, 20070426};

function LoadPlatinaCoinSettingTmp()
	
	local b1 = TabFile_Load("\\settings\\task\\equipex\\platina_def_tmp.txt", "PlatinaDataRecoinTmp")
	if b1~=1 then
		print("T�i t�p tin th�ng c�p trang b� B�ch Kim th�t b�i!")
		return
	end
	local nRowCount = TabFile_GetRowCount("PlatinaDataRecoinTmp", "EQUIPNAME")
	
	for y = 2, nRowCount do
		local platinaid = tonumber(TabFile_GetCell("PlatinaDataRecoinTmp", y, "PLATINAID"));
		local recoin = tonumber(TabFile_GetCell("PlatinaDataRecoinTmp", y, "RECOIN"));
		local name = TabFile_GetCell("PlatinaDataRecoinTmp", y, "EQUIPNAME");
		if (recoin ~= nil and recoin > 0) then
			TB_PLATINARECOIN_INFO[platinaid] = {name, recoin, platinaid};
		end;
	end	
end;

LoadPlatinaCoinSettingTmp()

--�׽�װ���������
function recoin_platina_main()
	local nTodayString = tonumber(GetLocalDate("%Y%m%d"));
	local aryDescribe = {};
	reloadRecoinPlatinaDate();
	if (nTodayString < RECOIN_PLATINA_DATE_RANGE[1] or nTodayString > RECOIN_PLATINA_DATE_RANGE[2]) then
		aryDescribe = {"<dec><npc>Tr�ng luy�n trang b� b�ch kim s� t�n t�i v�i th�i gian, nh� <color=yellow>"..floor(RECOIN_PLATINA_DATE_RANGE[1]/10000).."n�m"..mod(floor(RECOIN_PLATINA_DATE_RANGE[1]/100),100).."nguy�t "..mod(RECOIN_PLATINA_DATE_RANGE[1], 100).." ng�y -"..floor(RECOIN_PLATINA_DATE_RANGE[2]/10000).."n�m"..mod(floor(RECOIN_PLATINA_DATE_RANGE[2]/100),100).."nguy�t "..mod(RECOIN_PLATINA_DATE_RANGE[2], 100).." ng�y <color> th�t l� ��p. H�m nay kh�ng t�t ng�y l�m cho n�n s� kh�ng l�m ���c.",
			"Th�t ti�c qu�, �� tr� gi� r�i, l�c kh�c h�y quay l�i./no",};
	else
		aryDescribe = {"<dec><npc>Tr�ng luy�n trang b� b�ch kim c�n {1 Kim T�}, {1 huy�n tinh kho�ng th�ch c�p 8} v� m�t s� l��ng { m�nh b� thi�n th�ch (trung)}. Tr�ng luy�n kh�ng c�ng lo�i trang b� ho�ng kim s� c�n �� thi�n th�ch s� kh�ng gi�ng nhau. Tranh th� v�n c�n s�m h�y g�i cho ta l�m s�m, ��i  <color=yellow>"..floor(RECOIN_PLATINA_DATE_RANGE[2]/10000).."n�m"..mod(floor(RECOIN_PLATINA_DATE_RANGE[2]/100),100).."nguy�t "..mod(RECOIN_PLATINA_DATE_RANGE[2], 100).."<color> kh�ng gi�p ���c ng��i th� ��ng c� tr�ch ta.", 
		"Tr�ng luy�n trang b� b�ch kim n�y c�n bao nhi�u m�nh B� Thi�n Th�ch (Trung)/want_recoinplatina_preview",
		"Ta �� mang �� nguy�n li�u �� tr�ng luy�n trang b� b�ch kim n�y./want_recoinplatina",
		"Ta ch� ti�n ���ng gh� ngang ��y/no"}
	end;
	CreateTaskSay(aryDescribe);
end;

--Ԥ������ʼ
function want_recoinplatina_preview()
	GiveItemUI("Tr�ng luy�n trang b� b�ch kim", "Xin m�i b� trang b� b�ch kim c�n tr�ng luy�n v�o � b�n d��i. Ta s� gi�p ng��i xem th� c�n bao nhi�u m�nh B� Thi�n Th�ch (Trung)", "do_recoinplatina_preview", "no", 1);
end;

function do_recoinplatina_preview(nCount)
	if (nCount <= 0) then	--û�и��������������Ի�ֱ�ӷ���
		return 0;
	end;
	
	if (nCount > 1) then	--һ��һ����������ʾ
		CreateTaskSay({"<dec><npc>M�t l�n ch� ��a ta 1 v�t ph�m th� ta m�i c� th� gi�p ng��i xem ���c.",
			"Th�nh th�t xin l�i, ta s� s�p x�p l�i/want_recoinplatina_preview",
			"��i 1 l�t n�a quay l�i nh�/no"});
		return 0;
	end;
	
	local nItemIdx = GetGiveItemUnit(nCount);
	local nCurItemName = GetItemName(nItemIdx);
	local nCurItemQuality = GetItemQuality(nItemIdx);
	local tbCurItemProp = pack(GetItemProp(nItemIdx));
	if (nCurItemQuality == 4) then		--���ڵ��ǰ׽�װ��
		if (tbCurItemProp[1] == 0) then		--���������װ��
			local nCurPlatinaEqID = GetPlatinaEquipIndex(nItemIdx);
			if (TB_PLATINARECOIN_INFO[nCurPlatinaEqID]) then
				CreateTaskSay({format("<dec><npc>Trang b� b�ch kim %s  c�n {%d m�nh} b� thi�n th�ch (trung) v� 1 Kim T� v�i 1 huy�n tinh c�p 8.",TB_PLATINARECOIN_INFO[nCurPlatinaEqID][1],TB_PLATINARECOIN_INFO[nCurPlatinaEqID][2]),
					"Xin h�y gi�p ta tr�ng luy�n trang b� b�ch kim n�y/want_recoinplatina",
					"��i ta chu�n b� xong s� quay l�i t�m ng��i/no"});
			else
				CreateTaskSay({format("<dec><npc>V�i n�ng l�c hi�n t�i c�a ta kh�ng th� gi�p ng��i tr�ng luy�n {%s} ���c.",nCurItemName),
				"Th� th� ta s� ��i/want_recoinplatina_preview",
				"��i 1 l�t n�a quay l�i nh�/no"});
			end;
			return 0;
		end;
	end;
	CreateTaskSay({"<dec><npc>Kh�ng ph�i ng��i mu�n bi�t tr�ng luy�n b�ch kim c�n bao nhi�u m�nh b� thi�n th�ch, ng��i kh�ng ��a cho ta trang b� b�ch kim th� l�m sao xem n�o?",
		"Th�nh th�t xin l�i, ta s� s�p x�p l�i/want_recoinplatina_preview",
		"��i 1 l�t n�a quay l�i nh�/no"});
end;

--��������ʼ
function want_recoinplatina()
	GiveItemUI("Tr�ng luy�n trang b� b�ch kim", "Xin m�i b� nh�ng nguy�n li�u c�n thi�t �� tr�ng luy�n trang b� b�ch kim v�o � b�n d��i (1 Kim T�, 1 huy�n tinh c�p 8, v� m�t s� l��ng B� Thi�n Th�ch (Trung))", "do_recoinplatina", "no", 1);
end;

function do_recoinplatina(nCount)
	if (nCount <= 0) then	--û�и��������������Ի�ֱ�ӷ���
		return 0;
	end;
	local nComposeEntryIdx = 0;
	local nComposeEntryLvl = 0;
	local szBeforeItemInfo = "";
	local szBehindItemInfo = ""
	local nMarkCount = 0;
	local nItemBindState = 0;	--ԭ�ϻƽ�İ�״̬
	local nItemLockState = 0;
	local bHaveLockItem  = 0;	
	local szMARKITEM_KEY = "6,1,1309";
	local tb_material = {
		--key = {���������ƣ��ȼ�} 
		["4,979,1"] = {1, "Kim T�", -1},
		["6,1,147"] = {1, "Huy�n Tinh Kho�ng Th�ch c�p 8", 8},
		};
	local tb_curmaterial = {};
	for key, tb in tb_material do
		tb_curmaterial[key] = {};
		tb_curmaterial[key][1] = 0;
	end;
	
	for i = 1, nCount do
		local nCurItemIdx = GetGiveItemUnit(i);
		local nCurItemName = GetItemName(nCurItemIdx);
		local nCurItemQuality = GetItemQuality(nCurItemIdx);
		local tbCurItemProp = pack(GetItemProp(nCurItemIdx));
		local nExpiredTime = ITEM_GetExpiredTime(nCurItemIdx);
		if (nCurItemQuality == 4) then		--���ڵ��ǰ׽�װ��
			if (nExpiredTime > 0) then -- �б����ڵ�װ�������ܲ�
				CreateTaskSay(	{	"<dec><npc>Trang b� c� <color=fire>th�i h�n s� d�ng<color>, kh�ng th� tr�ng luy�n ���c.",
									"Th�t l� th� l�i, ta l�i b� nh�m n�a r�i. M�t l�c sau quay l�i nh�/no"	}	);
				return
			end
			if (tbCurItemProp[1] == 0) then		--���������װ��
				local nCurPlatinaEqID = GetPlatinaEquipIndex(nCurItemIdx);
				if (TB_PLATINARECOIN_INFO[nCurPlatinaEqID]) then
					if (nComposeEntryIdx ~= 0) then
						CreateTaskSay({"<dec><npc>Ng��i r�t cu�c mu�n tr�ng luy�n trang b� b�ch kim n�o ��y?",
							"Ha ha, ��i hi�p c�ng c� l�c b�t c�n, �� ta ��t v�o l�i./want_recoinplatina",
							"Th�t ng�i qu�, ta s� quay l�i sau./no"	});
									return 0;
					else
						nComposeEntryIdx = nCurPlatinaEqID;
						nComposeEntryLvl = GetPlatinaLevel(nCurItemIdx);
						szBeforeItemInfo = getItemInfo(nCurItemIdx);	--�������ǰ����ϸ��Ϣ
						nItemBindState = GetItemBindState(nCurItemIdx)	--��ȡ��״̬
					end;
				else
					CreateTaskSay({format("<dec><npc>V�i n�ng l�c hi�n t�i c�a ta kh�ng th� gi�p ng��i tr�ng luy�n {%s} ���c.",nCurItemName),
						"Th� th� ta s� ��i/want_recoinplatina_preview",
						"��i 1 l�t n�a quay l�i nh�/no"});
					return 0;
				end;
			end;
		else		--������ǰ׽�װ�������ж��ǲ����������
			local szItemKey = tbCurItemProp[1]..","..tbCurItemProp[2]..","..tbCurItemProp[3];
			if (szItemKey == szMARKITEM_KEY) then	--����ʯ��Ƭ
				nMarkCount = nMarkCount + 1;
			else
				if (tb_material[szItemKey] == nil) then	--���ǰ��� and ���ǽ�Ϭ
					CreateTaskSay({	"<dec><npc>Ngo�i {trang b� b�ch kim} v� {kim t�}, { huy�n tinh c�p 8}, { m�nh b� thi�n th�ch (trung)} l� nh�ng nguy�n li�u ta c�n. Nh�ng th� kh�c xin h�y thu l�i.",
						"Ha ha, ��i hi�p c�ng c� l�c b�t c�n, �� ta ��t v�o l�i./want_recoinplatina",
						"Th�t ng�i qu�, ta s� quay l�i sau./no"	});
					return 0;
				else
					if (tb_material[szItemKey][3] ~= -1) then
						if (tb_material[szItemKey][3] ~= tbCurItemProp[4]) then
							CreateTaskSay({"<dec><npc>��ng c�p c�a trang b�"..nCurItemName.." n�y d��ng nh� kh�ng ��ng.",
								"Ha ha, ��i hi�p c�ng c� l�c b�t c�n, �� ta ��t v�o l�i./want_recoinplatina",
								"Th�t ng�i qu�, ta s� quay l�i sau./no"	}	);
							return 0;
						end;
					end;
					tb_curmaterial[szItemKey][1] = tb_curmaterial[szItemKey][1] + 1;
					tb_curmaterial[szItemKey][2] = nCurItemName;
				end;
			end;
		end;
	end;	--end for nCout
	
	local szlog = ""
	if (nComposeEntryIdx == 0) then		--��Ȼ�����׽�װ��
		CreateTaskSay({"<dec><npc>Kh�ng ph�i ng��i mu�n tr�ng luy�n trang b� b�ch kim sao, ng��i kh�ng giao cho ta trang b� l�m sao ta l�m ���c.",
			"Th�nh th�t xin l�i, ta s� s�p x�p l�i/want_recoinplatina",
			"��i 1 l�t n�a quay l�i nh�/no"});
		return 0;
	end;
	if (nMarkCount ~= TB_PLATINARECOIN_INFO[nComposeEntryIdx][2]) then
		CreateTaskSay({format("<dec><npc>Trang b� b�ch kim {%s} c�n (%d) m�nh b� thi�n th�ch (trung).",TB_PLATINARECOIN_INFO[nComposeEntryIdx][1],TB_PLATINARECOIN_INFO[nComposeEntryIdx][2]),
					"Th�nh th�t xin l�i, ta s� s�p x�p l�i/want_recoinplatina",
					"��i ta chu�n b� xong s� quay l�i t�m ng��i/no"});
		return 0;
	end;
	for key, tb in tb_material do
		if (tb[1] ~= tb_curmaterial[key][1]) then
			CreateTaskSay({format("<dec><npc>Tr�ng luy�n trang b� b�ch kim ta c�n {%d} %s.", tb[1],tb[2]),
					"Th�nh th�t xin l�i, ta s� s�p x�p l�i/want_recoinplatina",
					"��i ta chu�n b� xong s� quay l�i t�m ng��i/no"});
			return 0;
		end;
	end;

--	for i = 1, nCount do
--		local nCurItemIdx = GetGiveItemUnit(i)
--		nItemLockState = GetLockItemState(nCurItemIdx)
--		if (nItemLockState == 1) then
--			local bOwner = IsLockItemOwner(nCurItemIdx)
--			if (bOwner == 0)   then
--				CreateTaskSay({"<dec><npc>�����İ׽�װ����������Ʒ��������Ʒ��������״̬��ֻ������Ʒ������������","֪����/cancel"});
--				return
--			else
--				bHaveLockItem =	1;
--			end							
--		elseif (nItemLockState == 2) then
--			CreateTaskSay({"<dec><npc>�����İ׽�װ����������Ʒ��������Ʒ���ڽ��״̬����ֹ������","֪����/cancel"});
--			return
--		end
--	end;	
	
	-- ɾԭ��
	for i = 1, nCount do
		if (RemoveItemByIndex(GetGiveItemUnit(i)) ~= 1) then
			WriteLog("[Tr�ng luy�n trang b� b�ch kim]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t X�a v�t ph�m th�t b�i\t"..GetItemName(GetGiveItemUnit(i)));
			return 0;
		end
	end
	
	--�¸����׽�װ��
	local nNewItemIdx = AddPlatinaItem(0, nComposeEntryIdx);	--��ʱ ��0���׽�
	if (nNewItemIdx <= 0) then
		WriteLog("[Tr�ng luy�n trang b� b�ch kim]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\tTh�m trang b� b�ch kim ho�ng kim th�t b�i\t"..GetItemName(GetGiveItemUnit(i)));
		return 0;
	end;

	if nItemBindState ~= 0 then 
		--����Ƭ����ΪԴ�ƽ�װ���İ�״ֵ̬
		SetItemBindState(nNewItemIdx, nItemBindState)
	end

	for i = 1, nComposeEntryLvl do								--����֮ԭװ���ȼ�
		UpgradePlatinaItem(nNewItemIdx);
	end;
	
--	if (bHaveLockItem == 1) then
--		LockItem(nNewItemIdx);
--	end
		
	szlog = format("[Tr�ng luy�n trang b� b�ch kim]\t%s\tAccount:%s\tName:%s\tTr�ng luy�n %s x�a nguy�n li�u: 1 Kim T�, 1 huy�n tinh c�p 8, %d m�nh b� thi�n th�ch", 
				GetLocalDate("%Y-%m-%d %X"), GetAccount(), GetName(),
				TB_PLATINARECOIN_INFO[nComposeEntryIdx][1], nMarkCount);
	szBehindItemInfo = getItemInfo(nNewItemIdx);	--���������Ϣ
	WriteLog(szlog);
	writeRecoinLog("[Thu�c t�nh tr��c khi tr�ng luy�n trang b� b�ch kim]", szBeforeItemInfo);
	writeRecoinLog("[Thu�c tinh sau khi tr�ng luy�n trang b� b�ch kim]", szBehindItemInfo);
	Msg2Player("Tr�ng luy�n th�nh c�ng��<color=green>"..TB_PLATINARECOIN_INFO[nComposeEntryIdx][1]);
end;

function reloadRecoinPlatinaDate()
	local tb_NewAvailableDate = {gb_GetTask("RECOIN_PLATINAEQUIP",1), gb_GetTask("RECOIN_PLATINAEQUIP",2)};
	if (tb_NewAvailableDate[1] ~= 0 and tb_NewAvailableDate[2] ~= 0 and tb_NewAvailableDate[2] ~= RECOIN_PLATINA_DATE_RANGE[2]) then
		RECOIN_PLATINA_DATE_RANGE[1] = tb_NewAvailableDate[1];
		RECOIN_PLATINA_DATE_RANGE[2] = tb_NewAvailableDate[2];
	end;
end;