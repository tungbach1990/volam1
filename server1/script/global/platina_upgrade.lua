Include("\\script\\global\\platina_head.lua");
Include("\\script\\lib\\basic.lua");
local nOpenLevel = 7
function platina_main()
	local aryDescribe = {
	"<dec><npc>Tr��c kia, ta t�ng gi�p quan ph� d�ng c�c <color=yellow>m�nh B� Thi�n Th�ch<color> �� ch� t�o ra th�n binh l�i kh�. N�u nh� <sex>c� th� t�m ra<color=yellow>m�nh B� Thi�n Th�ch<color> n�y, ta c� th� gi�p ng��i ch� t�o trang b� B�ch Kim, nh�t ��nh kh�ng th� thi�u v�t li�u n�y.",
	"Ta mu�n th�ng c�p cho trang b� B�ch Kim n�y/upgrade_paltinaequip",
	"Ta mu�n ch� t�o trang b� Ho�ng Kim th�nh trang b� B�ch Kim/upgrade_goldformplatina",
	"C�ch thu th�p m�nh B� Thi�n Th�ch/about_aerolite",
	"Trang b� B�ch Kim l� g�/about_platina",
	"�� ta suy ngh� k� l�i xem/cancel",
	};
	CreateTaskSay(aryDescribe);
end;

----���ƽ�װ������ɰ׽�װ��
function upgrade_goldformplatina()
	CreateTaskSay({
		"<dec><npc>N�ng c�p trang b� ho�ng kim l�n b�ch kim nguy�n li�u c�n c�: 1 b� thi�n th�ch (trung), 1 huy�n tinh kho�ng th�ch c�p 8, 1 th�n b� kho�ng th�ch v� 1000 v�n l��ng. B� thi�n th�ch c� th� d�ng �i�m vinh d� ho�c mua t�i K� Tr�n C�c. Chu�n b� xong t�t c� nguy�n li�u th� ch�ng ta c� th� b�t ��u c�ng vi�c ch� t�o trang b�.<enter> N�u nh� ng��i mu�n bi�t sau khi n�ng c�p th�nh trang b� b�ch kim c� thu�c t�nh nh� th� n�o, th� c� ��a trang b� ho�ng kim cho ta s� bi�t ngay.",
		"Ta mu�n xem thu�c t�nh c�a trang b� B�ch Kim sau khi n�ng c�p t� trang b� Ho�ng Kim n�y./want_upgoldeq_preview",
		"C� th� gi�p ta ch� t�o trang b� n�y th�nh trang b� B�ch Kim ���c kh�ng?/want_upgoldeq",
		"ta ngh� l�i xem /cancel"
	});
end;

function want_upgoldeq_preview()
	GiveItemUI("Xem qua ch� t�o trang b� B�ch Kim", "��t trang b� Ho�ng Kim mu�n ch� t�o v�o h�p ��ng v�t ph�m.", "do_upgoldeq_preview", "cancel",1);
end;

function do_upgoldeq_preview(nItemCount)
	local tbDialog =
	{
		"",
		"�� ta th� l�i xem/want_upgoldeq_preview",
		"Th�t ng�i qu�, ta s� quay l�i sau./cancel"
	};
	
	if (nItemCount ~= 1) then
		tbDialog[1] = "<dec><npc>��i hi�p b� s� l��ng v�t ph�m kh�ng ��ng.";
		CreateTaskSay(tbDialog);
		return
	end

	-- �жϻƽ�װ���Ƿ����Ҫ��
	local nCurItemIdx = GetGiveItemUnit(nItemCount);
	local bSuccess, szErrorMsg, nComposeEntryIdx = fit_formed_eq(nCurItemIdx);
	
	if (bSuccess == 0) then
		tbDialog[1] = szErrorMsg;
		return
	end
	
	
	-- Ԥ��
	local szDesc = preview_eq_format(nCurItemIdx);
	CreateTaskSay({"<dec><npc>Trang b� B�ch Kim ho�n th�nh l� <color=yellow>"..TB_PLATINAEQ_GOLDEQ[nComposeEntryIdx][4]..", thu�c t�nh nh� sau: <enter>"..szDesc,
		"Gi�p ta xem trang b� B�ch Kim ho�n th�nh t� nh�ng trang b� kh�c s� nh� th� n�o./want_upgoldeq_preview",
		"C� th� gi�p ta ch� t�o trang b� n�y th�nh trang b� B�ch Kim ���c kh�ng/want_upgoldeq",
		"Ta bi�t r�i, xin �a t�./cancel"});
end;

function want_upgoldeq()
	GiveItemUI("Ch� t�o trang b� B�ch Kim", "Mang trang b� Ho�ng Kim ng��i mu�n ch� t�o v� 1 m�nh B� Thi�n Th�ch (trung), 1 Huy�n Tinh Kho�ng Th�ch c�p 8, v� 1 Th�n b� kho�ng th�ch v�o h�p v�t ph�m d��i ��y. Ch� t�o c�n ti�u ph� 1000 v�n l��ng, ng��i chu�n b� k� ch�a?", "do_upgoldeq_process", "cancel",1);
end;

function do_upgoldeq_process(nItemCount)
	local tbDialog =
	{
		"",
		"�� ta th� l�i xem/want_upgoldeq",
		"Th�t ng�i qu�, ta s� quay l�i sau./cancel"
	};

	local nComposeEntryIdx	= 0;
	local nEquipItemIdx		= 0;
	local nSrcItemValueSum	= 0;
	local tbMaterialIdx		= {};
	
	local tb_material = {};
	for szkey, tb_item in tb_gold2planita_material do
		tb_material[szkey] = {};
		tb_material[szkey][1] = 0;
	end
	
	for i = 1, nItemCount do
		local nCurItemIdx 		= GetGiveItemUnit(i);
		local nCurItemName 		= GetItemName(nCurItemIdx);
		local nCurItemQuality	= GetItemQuality(nCurItemIdx);
		local tbCurItemProp 	= pack(GetItemProp(nCurItemIdx));
		
		-- �ƽ�װ��
		if (nCurItemQuality == 1) then
			
			-- ֻ�ܷ���һ���ƽ�װ��
			if (nComposeEntryIdx ~= 0) then
				tbDialog[1] = "<dec><npc>R�t cu�c ng��i mu�n ch� t�o trang b� Ho�ng Kim n�o? Ta kh�ng hoa m�t ch�?";
				CreateTaskSay(tbDialog);
				return
			end
			
			-- �жϻƽ�װ���Ƿ��������
			local bSuccess, szErrorMsg, nEqEntryIdx	= fit_formed_eq(nCurItemIdx);
			if (bSuccess == 0) then
				tbDialog[1] = szErrorMsg;
				CreateTaskSay(tbDialog);
				return
			end

			nEquipItemIdx	= nCurItemIdx;
			nComposeEntryIdx= nEqEntryIdx;
			
		else
			
			local bSuccess, szErrorMsg = fit_formed_material(nCurItemIdx, tb_gold2planita_material, nEquipItemIdx);
			if (bSuccess == 0) then
				tbDialog[1] = szErrorMsg;
				CreateTaskSay(tbDialog);
				return
			end
			
			local szItemKey = tbCurItemProp[1]..","..tbCurItemProp[2]..","..tbCurItemProp[3];
			tb_material[szItemKey][1] = tb_material[szItemKey][1] + GetItemStackCount(nCurItemIdx);
			tbMaterialIdx[getn(tbMaterialIdx) + 1] = nCurItemIdx;
		end
	end
	
	-- ����Ҫ�м��ƽ�װ��
	if (nComposeEntryIdx == 0) then
		tbDialog[1] = "<dec><npc>N�u mu�n ta gi�p ng��i, h�y giao trang b� �� cho ta.";
		CreateTaskSay(tbDialog);
		return
	end
	
	-- ������ϵĸ�����������Ҫ��
	for szkey, tb_item in tb_gold2planita_material do
		if (tb_item.nCount) then
			if (tb_material[szkey][1] ~= tb_item.nCount) then
				tbDialog[1] = "<dec><npc>Mu�n ch� t�o trang b� n�y, t�i thi�u ta c�ng c�n <color=yellow>"..tb_item.nCount.."c�i"..tb_item.szName.."<color>, ��t nhi�u qu� s� thi�t th�i cho ng��i, nh�ng �t qu� th� ta kh�ng ch� t�o ���c."
				CreateTaskSay(tbDialog);
				return
			end
		end
	end

	do_upgrade_platina(nEquipItemIdx, TB_PLATINAEQ_GOLDEQ[nComposeEntryIdx][4], tbMaterialIdx, tb_material, 1);
end

----�׽�װ������
function upgrade_paltinaequip()
	CreateTaskSay({
		"<dec><npc>Th�ng c�p th�nh trang b� B�ch Kim y�u c�u nh�ng v�t li�u sau: 1 m�nh <color=yellow>B� Thi�n Th�ch (trung)<color> v� 1000 v�n l��ng. C� th� d�ng �i�m vinh d� �� ��i m�nh B� Thi�n Th�ch, ng��i �� chu�n b� s�n s�ng r�i, ch�ng ta c� th� b�t ��u.<enter><color=red>Th�ng c�p trang b� B�ch Kim s� c� r�i ro nh�t ��nh, n�u nh� th�t b�i th� nh�ng v�t li�u v� 1000 v�n s� b� m�t.<color><enter>N�u ng��i mu�n bi�t thu�c t�nh trang b� B�ch Kim ho�n th�nh nh� th� n�o c� th� mang trang b� Ho�ng Kim ��n ��y cho ta xem th�.",
		"Ta mu�n xem thu�c t�nh trang b� B�ch Kim ho�n th�nh./#want_upplatinaeq(1)",
		"C� th� gi�p ta th�ng c�p trang b� n�y kh�ng/#want_upplatinaeq(0)",
		"ta ngh� l�i xem /cancel"
	});
end;

function want_upplatinaeq(bPreview)
	if (bPreview == 1) then
		GiveItemUI("Xem qu� tr�nh th�ng c�p trang b� B�ch Kim", "H�y ��t trang b� B�ch Kim mu�n th�ng c�p v� m�nh B� Thi�n Th�ch v�o h�p v�t ph�m.", "do_upplatinaeq_preview", "cancel",1);
	else
		GiveItemUI("Th�ng c�p trang b� B�ch Kim", "H�y ��t trang b� B�ch Kim mu�n th�ng c�p v� m�nh B� Thi�n Th�ch v�o h�p v�t ph�m, th�ng c�p ti�u t�n 1000 v�n l��ng.", "do_upplatinaeq_process", "cancel",1);
	end;
end;

function do_upplatinaeq_preview(nItemCount)
	local tbDialog =
	{
		"",
		"�� ta th� l�i xem/#want_upplatinaeq(1)",
		"Th�t ng�i qu�, ta s� quay l�i sau./cancel"
	};
	
	local nComposeEntryIdx	= 0;
	local nEquipItemIdx		= 0;
	local nSrcItemValueSum	= 0;
	
	local tb_enhanceitem_count = {};
	for szkey, tb_item in tb_upgrade_material do
		tb_enhanceitem_count[szkey] 	= {};
		tb_enhanceitem_count[szkey][1] 	= 0;
	end;
	 
	for i = 1, nItemCount do
		local nCurItemIdx 		= GetGiveItemUnit(i);
		local nCurItemQuality	= GetItemQuality(nCurItemIdx);
		local tbCurItemProp 	= pack(GetItemProp(nCurItemIdx));

		if (nCurItemQuality == 4) then
			
			if (nComposeEntryIdx ~= 0) then
				tbDialog[1] = "<dec><npc>R�t cu�c ng��i mu�n n�ng c�p th�nh trang b� b�ch kim n�o? C� ph�i ta �ang hoa m�t ch�ng?";
				CreateTaskSay(tbDialog);
				return
			end
			
			local bSuccess, szErrorMsg, nEqEntryIdx	= fit_formed_eq(nCurItemIdx);
			if (bSuccess == 0) then
				tbDialog[1] = szErrorMsg;
				CreateTaskSay(tbDialog);
				return
			end

			nEquipItemIdx	= nCurItemIdx;
			nComposeEntryIdx= nEqEntryIdx;
		else
			local bSuccess, szErrorMsg = fit_formed_material(nCurItemIdx, tb_upgrade_material, nEquipItemIdx);
			if (bSuccess == 0) then
				tbDialog[1] = szErrorMsg;
				CreateTaskSay(tbDialog);
				return
			end
			
			local szItemKey = tbCurItemProp[1]..","..tbCurItemProp[2]..","..tbCurItemProp[3];
			if (tb_upgrade_material[szItemKey]["nValue"]) then
				nSrcItemValueSum = nSrcItemValueSum + tb_upgrade_material[szItemKey]["nValue"] * GetItemStackCount(nCurItemIdx);
			end
			
			tb_enhanceitem_count[szItemKey][1] = tb_enhanceitem_count[szItemKey][1] + GetItemStackCount(nCurItemIdx);
		end
	end
	
	if (nComposeEntryIdx == 0) then
		tbDialog[1] = "<dec><npc>H�y ��a cho ta trang b� c�n n�ng c�p th�nh b�ch kim, n�u kh�ng th� l�m sao ta bi�t c�ch n�ng c�p b�y gi�?";
		CreateTaskSay(tbDialog);
		return
	end

	local nUpGradeProb = nSrcItemValueSum / (TB_PLATINAEQ_GOLDEQ[nComposeEntryIdx][3] * TB_PLATINAEQ_UPGRADERATE[GetPlatinaLevel(nEquipItemIdx)]);	
	if (nUpGradeProb >= 1) then
		nUpGradeProb = 1;
	elseif (nUpGradeProb >= 0.9999) then
		nUpGradeProb = 0.9999;
	end
	
	local szDesc = preview_eq_format(nEquipItemIdx);
	CreateTaskSay({format("<dec><npc>Theo nh� kinh nghi�m c�a ta, trang b� b�ch kim n�y c� <color=yellow>%5.2f%%<color>  kh� n�ng n�ng l�n c�p k� ti�p v� c� thu�c t�nh: <enter>%s", nUpGradeProb*100, szDesc),
					"Gi�p ta xem trang b� B�ch Kim ho�n th�nh t� nh�ng trang b� kh�c s� nh� th� n�o./#want_upplatinaeq(1)",
					"C� th� gi�p ta ch� t�o trang b� n�y th�nh trang b� B�ch Kim ���c kh�ng/#want_upplatinaeq(0)",
					"Ta bi�t r�i, xin �a t�./cancel"});
end

function do_upplatinaeq_process(nItemCount)
	local tbDialog =
	{
		"",
		"�� ta th� l�i xem/#want_upplatinaeq(0)",
		"Th�t ng�i qu�, ta s� quay l�i sau./cancel"
	};
	
	local nComposeEntryIdx 	= 0;
	local nEquipItemIdx 	= 0;
	local nSrcItemValueSum 	= 0;
	local nUpGradeProb 		= 0;
	local tbMaterialIdx		= {};

	local tb_enhanceitem_count = {};
	for szkey, tb_item in tb_upgrade_material do
		tb_enhanceitem_count[szkey]		= {};
		tb_enhanceitem_count[szkey][1] 	= 0;
	end
	
	-- �ȱ���һ�� �ҵ���Ҫ�����İ׽�װ��������Ҫ����Ļƽ�װ��
	for i = 1, nItemCount do
		local nCurItemIdx 		= GetGiveItemUnit(i);
		local nCurItemQuality	= GetItemQuality(nCurItemIdx);
		local tbCurItemProp 	= pack(GetItemProp(nCurItemIdx));

		if (nCurItemQuality == 4) then
			if (nComposeEntryIdx ~= 0) then
				tbDialog[1] = "<dec><npc>R�t cu�c ng��i mu�n n�ng c�p th�nh trang b� b�ch kim n�o? C� ph�i ta �ang hoa m�t ch�ng?";
				CreateTaskSay(tbDialog);
				return
			end
			
			local bSuccess, szErrorMsg, nEqEntryIdx	= fit_formed_eq(nCurItemIdx);
			if (bSuccess == 0) then
				tbDialog[1] = szErrorMsg;
				CreateTaskSay(tbDialog);
				return
			end

			nEquipItemIdx	= nCurItemIdx;
			nComposeEntryIdx= nEqEntryIdx;
		end
	end
	
	if (nComposeEntryIdx == 0) then
		tbDialog[1] = "<dec><npc>N�u mu�n ta gi�p ng��i, h�y giao trang b� �� cho ta.";
		CreateTaskSay(tbDialog);
		return
	end
	
	-- У������Ƿ�ƥ��
	for i = 1, nItemCount do
		local nCurItemIdx 		= GetGiveItemUnit(i);
		local nCurItemQuality	= GetItemQuality(nCurItemIdx);
		local nCurItemName 		= GetItemName(nCurItemIdx);
		local tbCurItemProp		= pack(GetItemProp(nCurItemIdx));

		if (nCurItemQuality ~= 4) then
			local bSuccess, szErrorMsg = fit_formed_material(nCurItemIdx, tb_upgrade_material, nEquipItemIdx);
			if (bSuccess == 0) then
				tbDialog[1] = szErrorMsg;
				CreateTaskSay(tbDialog);
				return
			end
				
			local szItemKey = tbCurItemProp[1]..","..tbCurItemProp[2]..","..tbCurItemProp[3];
			if (tb_upgrade_material[szItemKey]["nValue"]) then
				nSrcItemValueSum = nSrcItemValueSum + tb_upgrade_material[szItemKey]["nValue"] * GetItemStackCount(nCurItemIdx);
			end
			
			tbMaterialIdx[getn(tbMaterialIdx) + 1] = nCurItemIdx;
			tb_enhanceitem_count[szItemKey][1] = tb_enhanceitem_count[szItemKey][1] + GetItemStackCount(nCurItemIdx);
		end
	end
	
	for szkey, tb_item in tb_upgrade_material do
		if (tb_item.nCount) then
			if (tb_item.nUpgradeLevel and tb_item.nUpgradeLevel ~= GetPlatinaLevel(nEquipItemIdx)) then
			elseif(tb_item.nCount ~= tb_enhanceitem_count[szkey][1]) then
				tbDialog[1] = "<dec><npc>Mu�n ch� t�o trang b� n�y ta ch� c�n <color=yellow>"..tb_item.nCount.."c�i"..tb_item.szName.."<color>, ��t nhi�u qu� s� thi�t th�i cho ng��i, nh�ng �t qu� th� ta kh�ng ch� t�o ���c."
				CreateTaskSay(tbDialog);
				return
			end
		end
	end
	
	nUpGradeProb = nSrcItemValueSum / (TB_PLATINAEQ_GOLDEQ[nComposeEntryIdx][3] * TB_PLATINAEQ_UPGRADERATE[GetPlatinaLevel(nEquipItemIdx)]);	
	if (nUpGradeProb >= 1) then
		nUpGradeProb = 1;
	elseif (nUpGradeProb >= 0.9999) then
		nUpGradeProb = 0.9999;
	end
	
	do_upgrade_platina(nEquipItemIdx, TB_PLATINAEQ_GOLDEQ[nComposeEntryIdx][4], tbMaterialIdx, tb_enhanceitem_count, nUpGradeProb);
end;
----���ƽ�װ������ɰ׽�װ�� END


function getItemAllMagicList(nItemIdx)
	local tb_magic = {};
	for i = 1, 6 do
		tb_magic[getn(tb_magic) + 1] = pack(GetItemMagicAttrib(nItemIdx, i));
	end;
	return tb_magic;
end;

function about_aerolite()
	CreateTaskSay({
		"m�nh B� Thi�n Th�ch l� b�o v�t c�a tr�i ��t, ch�n nh�n gian kh� t�m. Tuy nhi�n, ng��i c� th� ��n  <color=yellow>S� gi� li�n ��u<color> h�i xem th� n�o, n�u ng��i c� <color=yellow>�i�m vinh d�<color> th� c� th� mua ���c. C�ng c� th� gh� v�o <color=yellow>K� Tr�n C�c<color> xem th�.",
		"Ta bi�t r�i!/cancel",
	});
end;

function about_platina()
	CreateTaskSay({"<dec><npc>Thu�c t�nh c�a trang b� B�ch Kim s� do thu�c t�nh c�a trang b� Ho�ng Kim ch� t�o quy�t ��nh. Thu�c t�nh trang b� Ho�ng Kim c�ng t�t th� trang b� B�ch Kim t�o th�nh s� c�ng t�t. N�u kh�ng h�i l�ng v�i trang b� Ho�ng Kim hi�n t�i, ta ki�n ngh� h�y t�m trang b� Ho�ng Kim kh�c.", "K�t th�c ��i tho�i/cancel"});
end;


-- new func
-- �жϸ�������еİ׽���߻ƽ�װ���Ƿ��Ǵ��ڲ���Ψһ
function fit_formed_eq(nCurItemIdx)	
	local nCurItemQuality	= GetItemQuality(nCurItemIdx);
	local nExpiredTime 		= ITEM_GetExpiredTime(nCurItemIdx);
	local tbCurItemProp 	= pack(GetItemProp(nCurItemIdx));
	
	local szErrorMsg 		= "";	
	local szGetEquipIDFunc 	= "";
	local nComposeEntryIdx	= 0;
	local szEqType			= "";
	if (nCurItemQuality == 1) then
		szGetEquipIDFunc = "GetGlodEqIndex";
		szEqType	= "Trang b� Ho�ng Kim";
	else
		szGetEquipIDFunc = "GetPlatinaEquipIndex";
		szEqType	= "Trang b� B�ch Kim";
	end

	if (tbCurItemProp[1] ~= 0) then	--�������װ��(��������װ��)
		szErrorMsg = format("<dec><npc>Ch� c�n ��a cho ta %s ch� t�o trang b� b�ch kim l� ��, nh�ng th� kh�c ng��i h�y thu l�i.", szEqType);
		return 0, szErrorMsg
	end
	
	if (nExpiredTime > 0) then -- �б����ڵ�װ�������ܣ�
		szErrorMsg = "<dec><npc>Trang b� c� <color=fire>th�i h�n s� d�ng<color> th� kh�ng th� r�n ���c.";
		return 0, szErrorMsg
	end
	
	for szkey, tb_item in TB_PLATINAEQ_GOLDEQ do
		if (szkey == getglobal(szGetEquipIDFunc)(nCurItemIdx)) then
			nComposeEntryIdx = szkey;
			break;
		end
	end                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    
	if (nComposeEntryIdx == 0) then
		szErrorMsg = format("<dec><npc>R�t ti�c, v�i kinh nghi�m hi�n t�i c�a ta th� kh�ng th� ch� t�o ���c <color=yellow>%s<color>.", GetItemName(nCurItemIdx));
		return 0, szErrorMsg
	end
	
	
	if (nCurItemQuality == 4 and GetPlatinaLevel(nCurItemIdx) >= %nOpenLevel) then
		szErrorMsg = "<dec><npc>V�i s�c hi�n t�i c�a ta ch� c� th� gi�p ng��i c��ng h�a trang b� n�y ��n c�p n�y th�i, nh�ng m� sau n�y ta c� th� gi�p ng��i tu luy�n ti�p. C� tin ta �i r�i s� c� m�t ng�y ta s� gi�p ng��i c��ng h�a m�n �� n�y l�n, ��n l�c �� ng��i h�y quay l�i g�p ta nh�!";
		return 0, szErrorMsg
	end;
	
	
	if (nCurItemQuality == 4 and GetPlatinaLevel(nCurItemIdx) >= 10) then
		szErrorMsg = "<dec><npc>Trang b� n�y �� ��t ��ng c�p cao nh�t, kh�ng c�n ph�i th�ng c�p n�a.";
		return 0, szErrorMsg
	end;
	
	return 1, szErrorMsg, nComposeEntryIdx;
end

-- �жϸ�������з���Ĳ����Ƿ���������Ԥ����ֻҪ�ж��м�ֵ���Ĳ����Ƿ��ڣ��޼�ֵ�����Ǵ�������Ĳ��ϲ��ùܣ�������Ǵ��죬��Ҫ�жϣ�
-- ����������Idx���Ƿ�ΪԤ��������table���ƽ�װ��idx
function fit_formed_material(nCurItemIdx, tb_material, nPlatinaIdx)
	local szErrorMsg	= "";
	local tbCurItemProp	= pack(GetItemProp(nCurItemIdx));
	local szItemKey		= tbCurItemProp[1]..","..tbCurItemProp[2]..","..tbCurItemProp[3];

	if (tb_material[szItemKey] == nil)  then
		szErrorMsg = "<dec><npc>��i hi�p b� nguy�n li�u v�o kh�ng ��ng nh� y�u c�u";
		return 0, szErrorMsg;
	end
	
	if (tb_material[szItemKey].nItemLevel) then
		if (tbCurItemProp[4] ~= tb_material[szItemKey]["nItemLevel"]) then
			szErrorMsg = format("<dec><npc>C�p trang b� c�a %s h�nh nh� l� kh�ng ��ng th� ph�i.", GetItemName(nCurItemIdx));
			return 0, szErrorMsg;
		end
	end
	if (tb_material[szItemKey]["nUpgradeLevel"]) then
		if (GetPlatinaLevel(nPlatinaIdx) ~= tb_material[szItemKey]["nUpgradeLevel"]) then
			szErrorMsg = "<dec><npc>N�ng c�p trang b� b�ch kim n�y c� nguy�n li�u kh�ng ��ng nh� y�u c�u";
			return 0, szErrorMsg;
		end
	end
	
	return 1, szErrorMsg;
end

-- Ԥ���ĸ�ʽ
function preview_eq_format(nCurItemIdx)
	local tbPlatinaMagicAttrib	= {};
	if (GetItemQuality(nCurItemIdx) == 4) then
		tbPlatinaMagicAttrib = pack(PreviewPlatinaUpgrade(nCurItemIdx));
	else
		tbPlatinaMagicAttrib = pack(PreviewPlatinaFromGold(nCurItemIdx));
	end
	
	local tbGoldMagicAttrib = getItemAllMagicList(nCurItemIdx);
	local szItemDesc = "";
	
	for i = 1, getn(tbPlatinaMagicAttrib) do
		if (tbGoldMagicAttrib[i][1] == tbPlatinaMagicAttrib[i][1] and tbGoldMagicAttrib[i][2] ~= tbPlatinaMagicAttrib[i][2]) then
			local szD = (tbPlatinaMagicAttrib[i][2]-tbGoldMagicAttrib[i][2]);
			if (szD > 0) then
				szD = "(+"..szD..")";
			else
				szD = "("..szD..")";
			end;
			szItemDesc = szItemDesc.."<color=yellow>"..GetItemMagicDesc(unpack(tbPlatinaMagicAttrib[i])).."<color><color=red>"..szD.."<color><enter>";
		else
			szItemDesc = szItemDesc.."<color=green>"..GetItemMagicDesc(unpack(tbPlatinaMagicAttrib[i])).."<color><enter>";
		end;
	end
	return szItemDesc;
end

-- ����׽�Ĺ���
function do_upgrade_platina(nEqIdx, nUpgradeEqName, tbMaterialIdx, tb_enhanceitem_count, nUpGradeProb)
	-- ��Ǯ
	if (GetCash() < 10000000) then
		CreateTaskSay({"<dec><npc>Ng��i kh�ng mang theo chi ph� ch� t�o <color=yellow>1000 v�n<color> l��ng.", "Ta bi�t r�i, �� ta chu�n b� ��/cancel"});
		return
	end
	Pay(10000000);
	
	-- ɾԭ��
	for i = 1, getn(tbMaterialIdx) do
		if (RemoveItemByIndex(tbMaterialIdx[i]) ~= 1) then
			WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t x�a v�t ph�m th�t b�i:%s",
						"[Task n�ng c�p trang b� B�ch Kim ERROR!!]",
						GetLocalDate("%y-%m-%d %H:%M:%S"),
						GetAccount(),
						GetName(),
						GetItemName(tbMaterialIdx[i])));
			return
		end
	end
	
	if (random() > nUpGradeProb) then
		CreateTaskSay({"<dec><npc>N�ng c�p trang b� B�ch Kim th�t b�i, b� m�t �i v�t li�u ch� t�o v� 1000 v�n l��ng.", "Ta s� quay l�i sau/cancel"});
		Msg2Player("N�ng c�p trang b� B�ch Kim th�t b�i, b� m�t �i v�t li�u ch� t�o v� 1000 v�n l��ng.");
		
		WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t gi� tr� l��ng kh�ng ��, x�c su�t l�:%.4f",
						"[Task n�ng c�p trang b� B�ch Kim FAIL!!]",
						GetLocalDate("%y-%m-%d %H:%M:%S"),
						GetAccount(),
						GetName(),
						nUpGradeProb))
		return
	end

	local szLog = "ti�u hao \t"..GetItemName(nEqIdx).."1 \t";
	for szkey, tb_temp in tb_enhanceitem_count do
		if (tb_temp[2]) then
			szLog = szLog..tb_temp[2]..":"..tb_temp[1].." \t"
		end;
	end;
	
	local szUpgradeItemFunc	= "";
	if (GetItemQuality(nEqIdx) == 1) then
		szUpgradeItemFunc = "UpgradePlatinaFromGoldItem";
	else
		szUpgradeItemFunc = "UpgradePlatinaItem";
	end
	
	local szBeforeItemInfo	= getItemInfo(nEqIdx);	--�������ǰ����ϸ��Ϣ
	
	-- ������
	local nSuccess			= getglobal(szUpgradeItemFunc)(nEqIdx);
	local nItemLevel		= GetPlatinaLevel(nEqIdx);
	if nSuccess > 0 then		
		local szBehindItemInfo	= getItemInfo(nEqIdx);--������������ϸ��Ϣ
		
		CreateTaskSay({"<dec><npc>N�ng c�p trang b� B�ch Kim th�nh c�ng, nh�n ���c 1 trang b� B�ch Kim <color=yellow>"..nUpgradeEqName.."<color>, c�p"..nItemLevel..".", "Ta s� quay l�i sau/cancel"});
		Msg2Player("N�ng c�p trang b� B�ch Kim th�nh c�ng, ��ng c�p l�"..nItemLevel.."trang b� B�ch Kim:"..nUpgradeEqName);
		
		WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t nh�n trang b� b�ch kim:%s\t %s",
					"[Task n�ng c�p trang b� B�ch Kim SUCCESS!!]",
					GetLocalDate("%Y-%m-%d %H:%M:%S"),
					GetAccount(),
					GetName(),
					nUpgradeEqName,
					szLog));
		writeRecoinLog("[Nguy�n li�u n�ng c�p trang b� B�ch Kim]", szBeforeItemInfo);
		writeRecoinLog("[K�t qu� n�ng c�p trang b� B�ch Kim]", szBehindItemInfo);
	else
		WriteLog(format("[%s]\t Date:%s\t Account:%s\t Name:%s\t Thu ���c trang b� b�ch kim th�t b�i:%s",
					"[Task n�ng c�p trang b� B�ch Kim ERROR!!]",
					GetLocalDate("%Y-%m-%d %H:%M:%S"),
					GetAccount(),
					GetName(),
					szLog));
		writeRecoinLog("[Nguy�n li�u n�ng c�p trang b� B�ch Kim]", szBeforeItemInfo);
	end	
end
