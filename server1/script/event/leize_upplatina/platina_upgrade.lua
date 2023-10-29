Include("\\script\\event\\leize_upplatina\\platina_head.lua");
Include("\\script\\lib\\basic.lua");
local nOpenLevel = 7
function platina_main()
	local aryDescribe = {
	"<dec><npc>Tr��c kia, ta t�ng gi�p quan ph� d�ng c�c <color=yellow>m�nh B� Thi�n Th�ch<color> �� ch� t�o ra th�n binh l�i kh�. N�u nh� <sex>c� th� t�m ra<color=yellow>m�nh B� Thi�n Th�ch<color> n�y, ta c� th� gi�p ng��i ch� t�o trang b� B�ch Kim, nh�t ��nh kh�ng th� thi�u v�t li�u n�y.",
	"Ta mu�n th�ng c�p cho trang b� B�ch Kim n�y/upgrade_paltinaequip",
	"Ta mu�n ch� t�o trang b� Ho�ng Kim th�nh trang b� B�ch Kim/upgrade_goldformplatina",
	"C�ch thu th�p m�nh B� Thi�n Th�ch/about_aerolite",
	"Trang b� B�ch Kim l� g�/about_platina",
	"�� ta suy ngh� k� l�i xem/no",
	};
	CreateTaskSay(aryDescribe);
end;

----���ƽ�װ������ɰ׽�װ��
function upgrade_goldformplatina()
	CreateTaskSay({
		"<dec><npc>Th�ng th��ng trang b� ho�ng kim n�ng c�p th�nh b�ch kim c�n nh�ng nguy�n li�u: L�i Tr�ch Ch�y v� 1000 v�n ng�n l��ng. N�u nh� mu�n gia t�ng t�t c� v� c�ng v�i ��ng c�p trang b� ho�ng kim, do v� ��y l� nguy�n li�u ��c bi�t, mu�n luy�n th�nh c�n ph�i c�  m�t l� ��c bi�t. Nghe ��n thi�n h� ch� c� H�n ��n ��nh m�i c� th� ch�u nhi�t �� cao ���c.<enter>N�u nh� mu�n bi�t trang b� n�ng c�p  th�nh b�ch kim c� thu�c t�nh nh� th� n�o c� vi�c ��a trang b� ho�ng kim cho ta th� s� bi�t ngay!",
		"Ta mu�n xem thu�c t�nh c�a trang b� B�ch Kim sau khi n�ng c�p t� trang b� Ho�ng Kim n�y./want_upgoldeq_preview",
		"C� th� gi�p ta ch� t�o trang b� n�y th�nh trang b� B�ch Kim ���c kh�ng?/want_upgoldeq",
		"ta ngh� l�i xem /no"
	});
end;

function want_upgoldeq_preview()
	GiveItemUI("Xem qua ch� t�o trang b� B�ch Kim", "��t trang b� Ho�ng Kim mu�n ch� t�o v�o h�p ��ng v�t ph�m.", "do_upgoldeq_preview", "no",1);
end;

function want_upgoldeq()
	GiveItemUI("Ch� t�o trang b� B�ch Kim", "Mu�n n�ng c�p trang b� ho�ng kim n�o th� ch� c�n b� t�t c� nh�ng nguy�n li�u v�o b�n d��i ��ng  th�i c�n 1000 v�n.", "do_upgoldeq_process", "no",1);
end;

function do_upgoldeq_process(nItemCount)
	do_upgradeequip_process(nItemCount, 1, 0);
end;

function do_upgoldeq_preview(nItemCount)
	if (nItemCount == 0) then
		CreateTaskSay({"<dec><npc>Ng��i kh�ng mang trang b� Ho�ng Kim ��n ��y, ta l�m sao gi�p ng��i xem trang b� B�ch Kim ho�n th�nh s� nh� th� n�o? H�y y�n t�m, ta s� kh�ng l�m t�n h�i g� ��n trang b� c�a ng��i ��u.", "�� ta ��t l�i v�y./want_upgoldeq_preview", "L�c kh�c quay l�i./no"});
		return 0;
	elseif (nItemCount > 1) then
		CreateTaskSay({"<dec><npc>Ch� c�n ��t v�o trang b� Ho�ng Kim mu�n ch� t�o l� ���c r�i, nh�ng th� kh�c ta kh�ng c�n.", "Ha ha, ��i hi�p c�ng c� l�c b�t c�n, �� ta ��t v�o l�i./want_upgoldeq_preview", "�� ta s�p l�i h�nh trang ��/no"});
		return 0;
	end;
	local nComposeEntryIdx = 0;
	local nCurItemIdx = GetGiveItemUnit(nItemCount);
	local nCurItemName = GetItemName(nCurItemIdx);
	local nCurItemQuality = GetItemQuality(nCurItemIdx);
	local tbCurItemProp = pack(GetItemProp(nCurItemIdx));
	if (nCurItemQuality == 1) then
		if (tbCurItemProp[1] ~= 0) then
			CreateTaskSay({"<dec><npc>Ch� c�n ��t v�o trang b� Ho�ng Kim mu�n ch� t�o l� ���c r�i, nh�ng th� kh�c ta kh�ng c�n.", "Ha ha, ��i hi�p c�ng c� l�c b�t c�n, �� ta ��t v�o l�i./want_upgoldeq_preview", "�� ta s�p l�i h�nh trang ��/no"});
			return 0;
		end;
		for szkey, tbPlatinaData in TB_PLATINAEQ_GOLDEQ do
			if (tbPlatinaData[2] == GetGlodEqIndex(nCurItemIdx)) then
				nComposeEntryIdx = szkey;
				break
			end;
		end;
	end;
	if (nCurItemQuality == 4) then
		CreateTaskSay(	{	"<dec><npc>Trang b� <color=yellow>"..GetItemName(nCurItemIdx).."<color> �� ���c ch� t�o th�nh trang b� B�ch Kim r�i.",
							"Ch� t�o trang b� Ho�ng Kim kh�c./want_upgoldeq_preview",
							"Th�t ng�i qu�, ta s� quay l�i sau./no"	}	);
		return
	elseif (nComposeEntryIdx == 0) then
		CreateTaskSay(	{	"<dec><npc>Th�t ��ng ti�c, kh� n�ng c�a ta c� h�n, kh�ng th� gi�p ���c cho ng��i<color=yellow>"..GetItemName(nCurItemIdx).."<color>Trang b� Ho�ng Kim n�y �� ���c ch� t�o th�nh trang b� B�ch Kim r�i.",
							"Ch� t�o trang b� Ho�ng Kim kh�c./want_upgoldeq_preview",
							"Th�t ng�i qu�, ta s� quay l�i sau./no"	}	);
		return
	end
	
	local tbPlatinaMagicAttrib = pack(PreviewPlatinaFromGold(nCurItemIdx));
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
	end;
	CreateTaskSay({"<dec><npc>Trang b� B�ch Kim ho�n th�nh l� <color=yellow>"..TB_PLATINAEQ_GOLDEQ[nComposeEntryIdx][4]..", thu�c t�nh nh� sau: <enter>"..szItemDesc,
	"Gi�p ta xem trang b� B�ch Kim ho�n th�nh t� nh�ng trang b� kh�c s� nh� th� n�o./want_upgoldeq_preview",
	"C� th� gi�p ta ch� t�o trang b� n�y th�nh trang b� B�ch Kim ���c kh�ng/want_upgoldeq",
	"Ta bi�t r�i, xin �a t�./no"});
end;
----�׽�װ������
function upgrade_paltinaequip()
	CreateTaskSay({
		"<dec><npc>Th�ng c�p th�nh trang b� B�ch Kim y�u c�u nh�ng v�t li�u sau: 1 m�nh <color=yellow>B� Thi�n Th�ch (trung)<color> v� 1000 v�n l��ng. C� th� d�ng �i�m vinh d� �� ��i m�nh B� Thi�n Th�ch, ng��i �� chu�n b� s�n s�ng r�i, ch�ng ta c� th� b�t ��u.<enter><color=red>Th�ng c�p trang b� B�ch Kim s� c� r�i ro nh�t ��nh, n�u nh� th�t b�i th� nh�ng v�t li�u v� 1000 v�n s� b� m�t.<color><enter>N�u ng��i mu�n bi�t thu�c t�nh trang b� B�ch Kim ho�n th�nh nh� th� n�o c� th� mang trang b� Ho�ng Kim ��n ��y cho ta xem th�.",
		"Ta mu�n xem thu�c t�nh trang b� B�ch Kim ho�n th�nh./#want_upplatinaeq(1)",
		"C� th� gi�p ta th�ng c�p trang b� n�y kh�ng/#want_upplatinaeq(0)",
		"ta ngh� l�i xem /no"
	});
end;

function want_upplatinaeq(bPreview)
	if (bPreview == 1) then
		GiveItemUI("Xem qu� tr�nh th�ng c�p trang b� B�ch Kim", "H�y ��t trang b� B�ch Kim mu�n th�ng c�p v� m�nh B� Thi�n Th�ch v�o h�p v�t ph�m.", "do_upplatinaeq_preview", "no",1);
	else
		GiveItemUI("Th�ng c�p trang b� B�ch Kim", "H�y ��t trang b� B�ch Kim mu�n th�ng c�p v� m�nh B� Thi�n Th�ch v�o h�p v�t ph�m, th�ng c�p ti�u t�n 1000 v�n l��ng.", "do_upplatinaeq_process", "no",1);
	end;
end;

function do_upplatinaeq_preview(nItemCount)
	do_upgradeequip_process(nItemCount, 3, 1);
end;

function do_upplatinaeq_process(nItemCount)
	do_upgradeequip_process(nItemCount, 3, 0);
end;

function do_upgradeequip_process(nItemCount, nStep, bPreview)
	local nComposeEntryIdx = 0;
	local nEquipIndex = 0;
	local nEquipItemIdx = 0;
	local nSrcItemValueSum = 0;
	local nUpGradeProb = 0;
	
	local nItemBindState;	--ԭ�ϻƽ�İ�״̬
	--local nItemLockState = 0;   --ԭ�ϵ�����״̬
	local tb_enhanceitem_count = {};
	local tb_tempUpgrade = tbUpGradeProcess[nStep];
	local szContinueFunc = tb_tempUpgrade.szContinueFunc;
	
--	if (bPreview ~= 1) then
--		szContinueFunc = "#"..szContinueFunc.."(0)";
--	else
--		szContinueFunc = "#"..szContinueFunc.."(1)";
--	end
	
	-- У����Ʒ�Ƿ�ƥ��
	for i = 1, nItemCount do
		local nCurItemIdx = GetGiveItemUnit(i);
		local nCurItemName = GetItemName(nCurItemIdx);
		local nCurItemQuality = GetItemQuality(nCurItemIdx);
		local nExpiredTime = ITEM_GetExpiredTime(nCurItemIdx);
		local tbCurItemProp = pack(GetItemProp(nCurItemIdx));
		local nCurItemValue = 0;
		if (nCurItemQuality == tb_tempUpgrade.nItemQuality) then
			--�������װ��(��������װ��)
			if (tbCurItemProp[1] ~= 0) then
				CreateTaskSay(	{	szErrorMsg,
					"Ha ha, ��i hi�p c�ng c� l�c b�t c�n, �� ta ��t v�o l�i./".."#"..szContinueFunc.."("..bPreview..")",
					"Th�t ng�i qu�, ta s� quay l�i sau./no"	}	);
				return
			end
			if (nExpiredTime > 0) then -- �б����ڵ�װ�������ܣ�
				CreateTaskSay(	{	"<dec><npc>Trang b� c� <color=fire>th�i h�n s� d�ng<color> th� kh�ng th� r�n ���c.",
									"Th�t l� th� l�i, ta l�i b� nh�m n�a r�i. M�t l�c sau quay l�i nh�/cancel"	}	);
				return
			end
			if (nComposeEntryIdx ~= 0) then
				CreateTaskSay(	{	"<dec><npc>R�t cu�c ng��i mu�n ch� t�o trang b� Ho�ng Kim n�o? Ta kh�ng hoa m�t ch�?",
									"Ha ha, ��i hi�p c�ng c� l�c b�t c�n, �� ta ��t v�o l�i./".."#"..szContinueFunc.."("..bPreview..")",
									"Th�t ng�i qu�, ta s� quay l�i sau./no"	}	);
				return
			end
			
			local szcurEqGold = getglobal(tb_tempUpgrade.szGetEquipIDFunc)(nCurItemIdx);
			
			for szkey, tb_item in TB_PLATINAEQ_GOLDEQ do
			
				if (szkey == szcurEqGold) then
					nComposeEntryIdx = szkey;
					nEquipIndex = nCurItemIdx;
					if (nStep == 1 and tb_item[5] and tb_item[5] == 1) then
						tb_tempUpgrade = tbUpGradeProcess[4];
					end
					break;
				end
			end
			
			if (nComposeEntryIdx == 0) then
				CreateTaskSay(	{	"<dec><npc>Th�t ng�i qu�, kh� n�ng ta hi�n gi� kh�ng gi�p ���c g� cho ng��i<color=yellow>"..GetItemName(nCurItemIdx).."<color>.",
									"Th� m�n trang b� kh�c/".."#"..szContinueFunc.."("..bPreview..")",
									"Th�t ng�i qu�, ta s� quay l�i sau./no"	}	);
				return
			end
			
			if (tb_tempUpgrade.nItemQuality == 4 and GetPlatinaLevel(nCurItemIdx) >= %nOpenLevel) then
				CreateTaskSay(	{"<dec><npc>V�i s�c hi�n t�i c�a ta ch� c� th� gi�p ng��i c��ng h�a trang b� n�y ��n c�p n�y th�i, nh�ng m� sau n�y ta c� th� gi�p ng��i tu luy�n ti�p. C� tin ta �i r�i s� c� m�t ng�y ta s� gi�p ng��i c��ng h�a m�n �� n�y l�n, ��n l�c �� ng��i h�y quay l�i g�p ta nh�!",
									"Th� m�n trang b� kh�c/".."#"..szContinueFunc.."("..bPreview..")",
									"Th�t ng�i qu�, ta s� quay l�i sau./cancel"	}	);
				return
			end;
			if (tb_tempUpgrade.nItemQuality == 4 and GetPlatinaLevel(nCurItemIdx) >= 10) then
				CreateTaskSay(	{	"<dec><npc>Trang b� n�y �� ��t ��ng c�p cao nh�t, kh�ng c�n ph�i th�ng c�p n�a.",
									"Th� m�n trang b� kh�c/".."#"..szContinueFunc.."("..bPreview..")",
									"Th�t ng�i qu�, ta s� quay l�i sau./no"	}	);
				return
			end;
			
			nEquipItemIdx = nCurItemIdx;
			nCurItemValue = 0;
			nItemBindState = GetItemBindState(nCurItemIdx)	--��ȡ��״̬
		end
	end
	
	for szkey, tb_item in tb_tempUpgrade.tbUpItemList do
		tb_enhanceitem_count[szkey] = {};
		tb_enhanceitem_count[szkey][1] = 0;
	end;
	
	for i = 1, nItemCount do
		local nCurItemIdx = GetGiveItemUnit(i);
		local nCurItemName = GetItemName(nCurItemIdx);
		local nCurItemQuality = GetItemQuality(nCurItemIdx);
		local tbCurItemProp = pack(GetItemProp(nCurItemIdx));
		local nCurItemValue = 0;
		if (nCurItemQuality ~= tb_tempUpgrade.nItemQuality) then
			local szItemKey = tbCurItemProp[1]..","..tbCurItemProp[2]..","..tbCurItemProp[3];
			if (tb_tempUpgrade.tbUpItemList[szItemKey] == nil) then
				CreateTaskSay(	{	tb_tempUpgrade.szErrorMsg,
									"Ha ha, ��i hi�p c�ng c� l�c b�t c�n, �� ta ��t v�o l�i./".."#"..szContinueFunc.."("..bPreview..")",
									"Th�t ng�i qu�, ta s� quay l�i sau./no"	}	);
				return
			end
			if (tb_tempUpgrade.tbUpItemList[szItemKey][3] ~= -1) then
				if (tbCurItemProp[4] ~= tb_tempUpgrade.tbUpItemList[szItemKey][3]) then
					CreateTaskSay(	{	"<dec><npc>��ng c�p c�a trang b�"..GetItemName(nCurItemIdx).." n�y d��ng nh� kh�ng ��ng.",
									"Ha ha, ��i hi�p c�ng c� l�c b�t c�n, �� ta ��t v�o l�i./".."#"..szContinueFunc.."("..bPreview..")",
									"Th�t ng�i qu�, ta s� quay l�i sau./no"	}	);
					return
				end;
			end;
			nCurItemValue = tb_tempUpgrade.tbUpItemList[szItemKey][1];
			tb_enhanceitem_count[szItemKey][1] = tb_enhanceitem_count[szItemKey][1] + GetItemStackCount(nCurItemIdx);
			tb_enhanceitem_count[szItemKey][2] = nCurItemName;
			if (tb_tempUpgrade.tbUpItemList[szItemKey][4] == nil) then
				nSrcItemValueSum = nSrcItemValueSum + nCurItemValue;
			end
		end
	end
	if (nComposeEntryIdx == 0) then
		CreateTaskSay(	{	"<dec><npc>N�u mu�n ta gi�p ng��i, h�y giao trang b� �� cho ta.",
							"Ha ha, ��i hi�p c�ng c� l�c b�t c�n, �� ta ��t v�o l�i./".."#"..szContinueFunc.."("..bPreview..")",
							"Th�t ng�i qu�, ta s� quay l�i sau./no"	}	);
		return
	end
	
	local tbBeidoujuan = 
	{
		[6] = "B�c ��u luy�n kim thu�t (Quy�n 1)", [7] = "B�c ��u luy�n kim thu�t (Quy�n 2)", [8] = "B�c ��u luy�n kim thu�t (Quy�n 3)", [9] = "B�c ��u luy�n kim thu�t (Quy�n 4)"
	};
	local PLevel = GetPlatinaLevel(nEquipItemIdx);
	if (nStep == 3 and bPreview == 0) then
		for szkey, tb_item in tb_tempUpgrade.tbUpItemList do
			if (tb_item[4]) then
				if (PLevel == tb_item[4] and tb_enhanceitem_count[szkey][1] ~= tb_item[1] or (PLevel ~= tb_item[4] and tb_enhanceitem_count[szkey][1] ~= 0)) then
					local szErrorMsg = "";
					if (PLevel < 6) then
						szErrorMsg = "<dec><npc> Ch� t�o trang b� n�y kh�ng c�n b�c ��u luy�n kim thu�t";
					else
						szErrorMsg = "<dec><npc>Ch� t�o trang b� n�y ch� c�n <color=yellow>1"..tbBeidoujuan[GetPlatinaLevel(nEquipItemIdx)].."<color>, ��t nhi�u qu� s� thi�t th�i cho ng��i, nh�ng �t qu� th� ta kh�ng ch� t�o ���c.";
					end
					CreateTaskSay({szErrorMsg,
									"�� ta th� l�i./".."#"..szContinueFunc.."("..bPreview..")",
									"Th�t ng�i qu�, ta s� quay l�i sau./no"	}	);
					return
				end
			end
		end
	end
	if (nStep == 1) then
		for szkey, tb_item in tb_tempUpgrade.tbUpItemList do
			if (tb_enhanceitem_count[szkey][1] ~= tb_tempUpgrade.tbUpItemList[szkey][1]) then
				CreateTaskSay(	{	"<dec><npc>Mu�n ch� t�o trang b� n�y, t�i thi�u ta c�ng c�n <color=yellow>"..tb_tempUpgrade.tbUpItemList[szkey][1].."c�i"..tb_tempUpgrade.tbUpItemList[szkey][2].."<color>, ��t nhi�u qu� s� thi�t th�i cho ng��i, nh�ng �t qu� th� ta kh�ng ch� t�o ���c.",
										"�� ta th� l�i./".."#"..szContinueFunc.."("..bPreview..")",
										"Th�t ng�i qu�, ta s� quay l�i sau./no"	}	);
				return
			end
		end
		nUpGradeProb = 1;
	else
	
		nUpGradeProb = nSrcItemValueSum / (TB_PLATINAEQ_GOLDEQ[nComposeEntryIdx][3] * TB_PLATINAEQ_UPGRADERATE[GetPlatinaLevel(nEquipItemIdx)]);
		
		if (nUpGradeProb >= 1) then
			nUpGradeProb = 1;
		elseif (nUpGradeProb >= 0.9999) then
			nUpGradeProb = 0.9999;
		end;
		if (bPreview == 1) then
			local szItemDesc = format("<dec><npc>Theo kinh nghi�m c�a ta, trang b� B�ch Kim n�y c� x�c su�t <color=yellow>%5.2f%%<color> n�ng l�n 1 c�p, thu�c t�nh nh� sau:  <enter>", nUpGradeProb*100);
			
			local tbNextPlatinaMagicAttrib = pack(PreviewPlatinaUpgrade(nEquipIndex));
			
			local tbCurPlatinaMagicAttrib = getItemAllMagicList(nEquipIndex);
			
			for i = 1, getn(tbNextPlatinaMagicAttrib) do
				if (tbCurPlatinaMagicAttrib[i][1] == tbNextPlatinaMagicAttrib[i][1] and tbCurPlatinaMagicAttrib[i][2] ~= tbNextPlatinaMagicAttrib[i][2]) then
					local szD = (tbNextPlatinaMagicAttrib[i][2]-tbCurPlatinaMagicAttrib[i][2]);
					if (szD > 0) then
						szD = "(+"..szD..")";
					else
						szD = "("..szD..")";
					end;
					szItemDesc = szItemDesc.."<color=yellow>"..GetItemMagicDesc(unpack(tbNextPlatinaMagicAttrib[i])).."<color><color=red>"..szD.."<color><enter>";
				else
					szItemDesc = szItemDesc.."<color=green>"..GetItemMagicDesc(unpack(tbNextPlatinaMagicAttrib[i])).."<color><enter>";
				end;
			end;
			CreateTaskSay({szItemDesc,
								"Gi�p ta xem trang b� B�ch Kim ho�n th�nh t� nh�ng trang b� kh�c s� nh� th� n�o./".."#"..szContinueFunc.."("..bPreview..")",
								"C� th� gi�p ta ch� t�o trang b� n�y th�nh trang b� B�ch Kim ���c kh�ng/".."#"..szContinueFunc.."(0)",
								"Ta bi�t r�i, xin �a t�./no"});
			return
		end;
	end;
	
--	nItemLockState = GetLockItemState(nEquipItemIdx)  --��ȡ����״̬
--	if (nItemLockState == 1) then	--����
--        	local bOwner = IsLockItemOwner(nEquipItemIdx)
--		if (bOwner == 0) then
--			CreateTaskSay({"<dec><npc>��������Ʒ����������Ʒ��������Ʒ������״̬�£�ֻ������Ʒ������������", "֪����/cancel"});
--            		return
--            	end
--	elseif (nItemLockState == 2) then	--���
--			CreateTaskSay({"<dec><npc>��������Ʒ����������Ʒ��������Ʒ�ڽ��״̬�£���ֹ������", "֪����/cancel"});
--        		return	
--	end
	
	if (GetCash() < 10000000) then
		CreateTaskSay({"<dec><npc>Ng��i kh�ng mang theo chi ph� ch� t�o <color=yellow>1000 v�n<color> l��ng.", "Ta bi�t r�i, �� ta chu�n b� ��/no"});
		return
	end;
	Pay(10000000);
	
	-- ɾԭ��
	for i = 1, nItemCount do
		if (GetGiveItemUnit(i) ~= nEquipItemIdx and RemoveItemByIndex(GetGiveItemUnit(i)) ~= 1) then
			WriteLog("[Task n�ng c�p trang b� B�ch Kim ERROR!!]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t X�a v�t ph�m th�t b�i\t"..GetItemName(GetGiveItemUnit(i)));
			return
		end
	end
	if (random() > nUpGradeProb) then
		CreateTaskSay({"<dec><npc>N�ng c�p trang b� B�ch Kim th�t b�i, b� m�t �i v�t li�u ch� t�o v� 1000 v�n l��ng.", "Ta s� quay l�i sau/no"});
		Msg2Player("N�ng c�p trang b� B�ch Kim th�t b�i, b� m�t �i v�t li�u ch� t�o v� 1000 v�n l��ng.");
		WriteLog("[Task n�ng c�p trang b� B�ch Kim FAIL!!]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t Gi� tr� l��ng kh�ng ��, x�c su�t l�"..nUpGradeProb);
		return
	end;
	
	local szLog = "ti�u hao \t"..GetItemName(nEquipItemIdx).."1 \t";
	local szBeforeItemInfo = getItemInfo(nEquipItemIdx);	--�������ǰ����ϸ��Ϣ
	
	local nSuccess = getglobal(tb_tempUpgrade.szDoProcessFunc)(nEquipItemIdx);
	for szkey, tb_temp in tb_enhanceitem_count do
		if (tb_temp[2]) then
			szLog = szLog..tb_temp[2]..":"..tb_temp[1].." \t"
		end;
	end;
	
	local nItemLevel = GetPlatinaLevel(nEquipItemIdx);
	if nSuccess > 0 then
		if (nItemBindState ~= 0) then
			--BindItem(nEquipItemIdx);
			SetItemBindState(nEquipItemIdx, nItemBindState)
		end;
		local szBehindItemInfo = getItemInfo(nEquipItemIdx);--������������ϸ��Ϣ
		CreateTaskSay({"<dec><npc>N�ng c�p trang b� B�ch Kim th�nh c�ng, nh�n ���c 1 trang b� B�ch Kim <color=yellow>"..TB_PLATINAEQ_GOLDEQ[nComposeEntryIdx][4].."<color>, c�p"..nItemLevel..".", "Ta s� quay l�i sau/no"});
		Msg2Player("N�ng c�p trang b� B�ch Kim th�nh c�ng, ��ng c�p l�"..nItemLevel.."trang b� B�ch Kim:"..TB_PLATINAEQ_GOLDEQ[nComposeEntryIdx][4]);
		WriteLog("[Task n�ng c�p trang b� B�ch Kim SUCCESS!!]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t nh�n ���c trang b� B�ch Kim"..TB_PLATINAEQ_GOLDEQ[nComposeEntryIdx][4].."\t"..szLog);
		writeRecoinLog("[Nguy�n li�u n�ng c�p trang b� B�ch Kim]", szBeforeItemInfo);
		writeRecoinLog("[K�t qu� n�ng c�p trang b� B�ch Kim]", szBehindItemInfo);
	else
		WriteLog("[Task n�ng c�p trang b� B�ch Kim ERROR!!]"..GetLocalDate("%Y-%m-%d %H:%M:%S").."\t"..GetAccount().."\t"..GetName().."\t Nh�n ���c trang b� B�ch Kim th�t b�i \t"..szLog);
		writeRecoinLog("[Nguy�n li�u n�ng c�p trang b� B�ch Kim]", szBeforeItemInfo);
	end;
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
		"Ta bi�t r�i!/no",
	});
end;

function about_platina()
	CreateTaskSay({"<dec><npc>Thu�c t�nh c�a trang b� B�ch Kim s� do thu�c t�nh c�a trang b� Ho�ng Kim ch� t�o quy�t ��nh. Thu�c t�nh trang b� Ho�ng Kim c�ng t�t th� trang b� B�ch Kim t�o th�nh s� c�ng t�t. N�u kh�ng h�i l�ng v�i trang b� Ho�ng Kim hi�n t�i, ta ki�n ngh� h�y t�m trang b� Ho�ng Kim kh�c.", "K�t th�c ��i tho�i/no"});
end;
