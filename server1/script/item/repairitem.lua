-- װ��ά��

IncludeLib( "ITEM" );
Include( "\\script\\item\\itemvalue\\magicattriblevel.lua" );

-- ��ʱ�������ID: 101~110
TTID_ItemIndex 	= 101;
TTID_OrgMaxDur 	= 102;
TTID_CurMaxDur 	= 103;
-- TTID_CurDur 	= 104;
TTID_LostDur 	= 105;
TTID_CheapPrice	= 106;
TTID_CostlyPrice= 107;

-- ����Ƕװ��ά�޷��ñ�
ENCHASABLE_EQUIP_PRICE =
{
	{ 50, 110, 180, 260, 350, 450, 560, 680, 810, 950 },			-- ��1λ��10��ħ�����Եķ���ֵ
	{ 100, 220, 360, 520, 700, 900, 1120, 1360, 1620, 1900 },		-- ��1λ��10��ħ�����Եķ���ֵ
	{ 50, 110, 180, 260, 350, 450, 560, 680, 810, 950 },			-- ��2λ��10��ħ�����Եķ���ֵ
	{ 50, 110, 180, 260, 350, 450, 560, 680, 810, 950 },			-- ��2λ��10��ħ�����Եķ���ֵ
	{ 50, 110, 180, 260, 350, 450, 560, 680, 810, 950 },			-- ��3λ��10��ħ�����Եķ���ֵ
	{ 50, 110, 180, 260, 350, 450, 560, 680, 810, 950 },			-- ��3λ��10��ħ�����Եķ���ֵ
}

-- RPGE_RESTORMAX = 25;
function repair_goldequip(nItemIndex, nGenre, nQuality, nDetailType, nParticularType, nOrgMaxDur, nCurMaxDur, nCurDur, nEquipPrice)
	-- ���ǻƽ�װ�������ڽű��д���(�ɳ�����)
	if (nQuality ~= 1 and nQuality ~= 4) then
		return -1;
	end
	
	szAboutMsg = get_repair_qualityname(nQuality).."H��ng d�n s�a ch�a trang b�.../RePairGE_About";

	if (nQuality == 4 and GetPlatinaLevel(nItemIndex) >= 6) then
		Say("Ch� ti�m: T�i ti�m c�a ta ��y kh�ng th� s�a trang b� b�ch kim +6 tr� l�n", 0);
		return 1
	end
	-- ����ά��
	nFixDur = nCurMaxDur - nCurDur;
	if (nFixDur <= 0) and (nCurMaxDur == nOrgMaxDur) then
		Say("Ch� ti�m: Trang b� "..get_repair_qualityname(nQuality).." n�y t�m th�i kh�ng c�n s�a. Mu�n s�a ch�a "..get_repair_qualityname(nQuality).." th� n�o", 2, szAboutMsg, "�� bi�t r�i/RepairGE_Cancel")
		return 1;
	end;
	
	SetTaskTemp(TTID_ItemIndex, nItemIndex);
	SetTaskTemp(TTID_OrgMaxDur, nOrgMaxDur);
	SetTaskTemp(TTID_CurMaxDur, nCurMaxDur);
	-- SetTaskTemp(TTID_CurDur, nCurDur);

	-- ��ά��Ҫ�µ����;ö����޵���(����һ��)
	nLostDur = floor(nFixDur / 10);
	if (nLostDur < 1) then
		nLostDur = 1;
	end
	
	--nCheapPrice =  nFixDur * 10000; -- һ��һ���� (nFixDur - nLostDur)
	--nCostlyPrice = nFixDur * 30000; -- -- һ��������
	
	-- �ƽ�װ������۸�ʽ����Ϊ��100*(װ���ȼ�^2)/ÿ���;ö�
	-- Խ�ϰ汾������۸�10��
	nItemLevel = GetItemLevel(nItemIndex);
	nCheapPrice = 10 * nItemLevel * nItemLevel * nFixDur;
	nCostlyPrice = nCheapPrice * 3; -- ���޵�����

	SetTaskTemp(TTID_LostDur, nLostDur);
	SetTaskTemp(TTID_CheapPrice, nCheapPrice);
	SetTaskTemp(TTID_CostlyPrice, nCostlyPrice);

	-- ����������ʾ��λ
	_nCheapW = floor(nCheapPrice / 10000);
	_nCheap = mod(nCheapPrice, 10000);
	_nCostlyW = floor(nCostlyPrice / 10000);
	_nCostly = mod(nCostlyPrice, 10000);
	
	szFixMsg = 
	{
		"S�a ��n gi�n [".._nCheapW.." v�n".._nCheap.." l��ng, �� b�n l�n nh�t gi�m xu�ng"..nLostDur.."�i�m]/RePairGE_Cheap", -- 1	
		"S�a k� [".._nCostlyW.." v�n".._nCostly.." l��ng]/RePairGE_Costly",  -- 2
		"S� d�ng Th�y Tinh s�a ch�a c� �� b�n l�n nh�t/RepairGE_ReStoreMax", --3
		"S� d�ng Tu Ph�c Th�n Du s�a ch�a �� b�n t�i �a/RepairGE_ReStoreMax_Oil", --4
	}
	szCancelMsg = "T�m th�i kh�ng s�a/RepairGE_Cancel";
	
	szSayMsg = 
	{
		"Ch� ti�m:  "..get_repair_qualityname(nQuality).."trang b� n�y l� b�u v�t v� l�m, s�a ch�a kh�ng d� d�ng, ��i hi�p mu�n s�a ��n gi�n h�y l� s�a k�?",	
		"Ch� ti�m: �� b�n "..get_repair_qualityname(nQuality).." tr�n trang b� ��i hi�p �� b� hao m�n, c� mu�n s�a kh�ng?",		
	}
	
	--print("�ƽ��װ��ά��(FixDur, CurMaxDur, OrgMaxDur): "..nFixDur..","..nCurMaxDur..","..nOrgMaxDur);
	if (nFixDur > 0) and (nCurMaxDur == nOrgMaxDur) then
		-- ֻ�����;ö�
		--print("ֻ�����;ö�");
		Say(szSayMsg[1], 4, szFixMsg[1], szFixMsg[2], szAboutMsg, szCancelMsg)
	elseif (nFixDur <= 0) and (nCurMaxDur < nOrgMaxDur) then
		-- ֻ�����;ö�����
		--print("ֻ�����;ö�����");
		Say(szSayMsg[2], 4, szFixMsg[3], szFixMsg[4], szAboutMsg, szCancelMsg)
	else
		-- �޾��ޡ����ޡ�����
		--print("�޾��ޡ����ޡ�����");
		Say(szSayMsg[1], 6, szFixMsg[1], szFixMsg[2], szFixMsg[3], szFixMsg[4],szAboutMsg, szCancelMsg)
	end
	
	return 1;
end;

-- ���� - �����;ö�����
function RePairGE_Costly()
	nCostlyPrice = GetTaskTemp(TTID_CostlyPrice);
	nItemIndex = GetTaskTemp(TTID_ItemIndex);
	nCurMaxDur = GetTaskTemp(TTID_CurMaxDur);
	if (GetCash() >= nCostlyPrice) then
		Pay(nCostlyPrice)
		-- Msg2Player("�޸�װ����")
		SetCurDurability(nItemIndex, nCurMaxDur);
		WriteLog(date("%H%M%S")..":"..GetAccount().."("..GetName()..") s� d�ng ("..nCostlyPrice..") l��ng b�c, s�a k�  "..get_repair_qualityname(nQuality).."trang b�(ItemGenTime:"..GetItemGenTime(nItemIndex).." CurDur:"..nCurMaxDur..")");
	else
		-- ����������ʾ��λ
		_nCostlyW = floor(nCostlyPrice / 10000);
		_nCostly = mod(nCostlyPrice, 10000);
		Talk(1,"","�ng ch�: S�a ch�a c�n".._nCostlyW.." v�n".._nCostly.." l��ng, ng�n l��ng tr�n ng��i b�n kh�ng ��!")
	end

end;

-- ���� - ���;ö�����
function RePairGE_Cheap()
	nCheapPrice = GetTaskTemp(TTID_CheapPrice);
	nItemIndex = GetTaskTemp(TTID_ItemIndex);
	nCurMaxDur = GetTaskTemp(TTID_CurMaxDur);
	nLostDur = GetTaskTemp(TTID_LostDur);
	
	if (GetCash() >= nCheapPrice) then
		Pay(nCheapPrice)
		-- Msg2Player("�޸�װ����")
		
		-- �޸�����������
		nFixMaxDur = nCurMaxDur - nLostDur;
		SetMaxDurability(nItemIndex, nFixMaxDur);
		SetCurDurability(nItemIndex, nFixMaxDur);
		
		WriteLog(date("%H%M%S")..":"..GetAccount().."("..GetName()..") s� d�ng ("..nCheapPrice..") l��ng b�c, s�a ��n gi�n "..get_repair_qualityname(nQuality).."trang b�(ItemGenTime:"..GetItemGenTime(nItemIndex).." CurDur:"..nFixMaxDur..") , �� b�n l�n nh�t gi�m xu�ng, "..nLostDur.."�i�m");
		
	else
		-- ����������ʾ��λ
		_nCheapW = floor(nCheapPrice / 10000);
		_nCheap = mod(nCheapPrice, 10000);
		Talk(1,"","�ng ch�: Ph� s�a ch�a c�n [".._nCheapW.." v�n".._nCheap.." l��ng]tr�n ng��i b�n mang kh�ng �� ng�n l��ng!")
	end
end;

-- �޸�����
function RepairGE_ReStoreMax()
	nItemIndex = GetTaskTemp(TTID_ItemIndex);
	nOrgMaxDur = GetTaskTemp(TTID_OrgMaxDur);
	nCurMaxDur = GetTaskTemp(TTID_CurMaxDur);
	-- if (nCurMaxDur > nOrgMaxDur) then
	--	WriteLog(GetLoop()..date("%m%d-%H:%M").."�ƽ�װ���;ö������д�!")
	--	return -1;
	-- end
	
	if (nCurMaxDur == nOrgMaxDur) then
		Talk(1, "", "B� trang b� n�y t�m th�i kh�ng c�n s�a!")
		return 1;
	end
	
	j238 = GetItemCountEx(238)
	j239 = GetItemCountEx(239)
	j240 = GetItemCountEx(240)

	-- �ۼ��ܱ�ʯ(ˮ��)
	if (j238 > 0) then
		DelItemEx(238)
	elseif (j239 > 0) then
		DelItemEx(239)
	elseif (j240 > 0) then
		DelItemEx(240)
	else
		Talk(1,"","Kh�ch quan kh�ng c� Th�y Tinh")
		return -1;
	end

	-- ���;ö�����
	nAddMaxDur = 25; -- һ��ˮ������25������
	nDelta = nOrgMaxDur - nCurMaxDur;
	if (nDelta < nAddMaxDur) then
		nAddMaxDur = nDelta;
	end
	
	SetMaxDurability(nItemIndex, nCurMaxDur + nAddMaxDur);
	WriteLog(date("%H%M%S")..":"..GetAccount().."("..GetName()..") s� d�ng 1 vi�n th�y tinh,  "..get_repair_qualityname(nQuality).."trang b�(ItemGenTime:"..GetItemGenTime(nItemIndex).." CurDur:"..GetCurDurability(nItemIndex)..") �� b�n l�n nh�t t�ng l�n"..nAddMaxDur.."�i�m");
	Msg2Player("B�n s� d�ng m�t vi�n Th�y Tinh, �� b�n l�n nh�t tr�n trang b� �� t�ng l�n."..nAddMaxDur.."�i�m");
end;

function RepairGE_ReStoreMax_Oil()
	nItemIndex = GetTaskTemp(TTID_ItemIndex);
	nOrgMaxDur = GetTaskTemp(TTID_OrgMaxDur);
	nCurMaxDur = GetTaskTemp(TTID_CurMaxDur);
	-- if (nCurMaxDur > nOrgMaxDur) then
	--	WriteLog(GetLoop()..date("%m%d-%H:%M").."�ƽ�װ���;ö������д�!")
	--	return -1;
	-- end
	
	if (nCurMaxDur == nOrgMaxDur) then
		Talk(1, "", "B� trang b� n�y t�m th�i kh�ng c�n s�a!")
		return 1;
	end
	
	local nBindState = GetItemBindState(nItemIndex);
	if (nBindState == 0) then
		Talk(1, "", "Ch� ti�m: <color=yellow> Tu Ph�c Th�n Du<color> ch� c� th� s�a ch�a<color=red> trang b� � tr�ng th�i kh�a <color>")
		return 1;
	end
	
	local nOilCount = CalcEquiproomItemCount(6, 1, 2565, -1);

	-- �ۼ��ܱ�ʯ(ˮ��)
	if (nOilCount > 0) then
		ConsumeEquiproomItem(1, 6, 1, 2565, -1);
	else
		Talk(1,"","Ch� ti�m: Ng��i kh�ng mang theo Tu Ph�c Th�n Du")
		return -1;
	end

	-- ���;ö�����
	nAddMaxDur = 25; -- һ��ˮ������25������
	nDelta = nOrgMaxDur - nCurMaxDur;
	if (nDelta < nAddMaxDur) then
		nAddMaxDur = nDelta;
	end
	
	SetMaxDurability(nItemIndex, nCurMaxDur + nAddMaxDur);
	WriteLog(date("%H%M%S")..":"..GetAccount().."("..GetName()..")S� d�ng 1 c�i Tu Ph�c Th�n Du"..get_repair_qualityname(nQuality).."trang b�(ItemGenTime:"..GetItemGenTime(nItemIndex).." CurDur:"..GetCurDurability(nItemIndex)..") �� b�n l�n nh�t t�ng l�n"..nAddMaxDur.."�i�m");
	Msg2Player("Ng��i �� s� d�ng m�t c�i Tu Ph�c Th�n Du, �� b�n t�i �a c�a trang b� �� ���c t�ng l�n"..nAddMaxDur.."�i�m");
end;

-- ȡ��
function RepairGE_Cancel()
end;

-- ���ڻƽ�װ��������
function RePairGE_About()
	_szInfo = 
	{
		"<color=green>S�a ��n gi�n:<color> gi� r� h�n, sau khi s�a ch�a �� b�n trang b� l�n nh�t s� gi�m xu�ng<enter>",	
		"<color=green>S�a k�:<color> gi� cao h�n, sau khi s�a ch�a �� b�n l�n nh�t trang kh�ng b� gi�m xu�ng<enter>",		
		"<color=green>Kh�i ph�c gi�i h�n �� b�n: <color>S� d�ng th�y tinh �� kh�i ph�c l�i gi�i h�n "..get_repair_qualityname(nQuality).."�� b�n tr�n trang b�.",
		" <enter>Tu Ph�c Th�n Du ch� c� th� s�a ch�a trang b� kh�a",
	}
	szInfo = _szInfo[1].._szInfo[2].._szInfo[3].._szInfo[4];

	Talk(1, "", szInfo)
end;

-- ���ڻƽ�װ��ĥ�����޵��޸�
--function RePairGE_AboutRestorMax()
--	Talk(1, "", "ʹ��<color=red>ˮ��<color>�����޸��ƽ�װ���Ĳ����;ö�����")
--end;

-----------------------------------------------------------------------------
-- ����װ��ά�޼۸� --
-- ����ֵ��-1 ��ʾ����; >=0 ��ʾ���������������
function get_repair_price(nItemIndex, nGenre, nQuality, nDetailType, nParticularType, nOrgMaxDur, nCurMaxDur, nCurDur, nEquipPrice, nPriceScale, nMagicScale, nSumMagic)
	if( nCurMaxDur <= 0 or nCurMaxDur <= nCurDur ) then
		return 0;
	end
	local nRepairPrice = 0;
	if( nQuality == 0 ) then		-- ��ͨװ������/��ɫװ����
		nRepairPrice = nEquipPrice * nPriceScale / 100 * ( nCurMaxDur - nCurDur ) / nCurMaxDur * ( nMagicScale + nSumMagic ) / nMagicScale;
	elseif( nQuality == 2 ) then	-- ����Ƕװ������ɫװ����
		local arynMagLvl = GetItemAllParams( nItemIndex );
		local nItemVer = ITEM_GetItemVersion( nItemIndex );
		for i = 1, 6 do
			if( arynMagLvl[i] == 0 ) then
				break;
			elseif( arynMagLvl[i] < 0 or arynMagLvl[i] == 65535 ) then					-- MagicLevel�����ͻ�������WORD����ģ�(WORD)(-1) == 65535
				nRepairPrice = nRepairPrice + ENCHASABLE_EQUIP_PRICE[i][4];				-- �տװ�4��ħ���ȼ����Լ���
			else
				local nCurMagLvl = getMagAttrLvlLevel( nItemVer, arynMagLvl[i] );
				nRepairPrice = nRepairPrice + ENCHASABLE_EQUIP_PRICE[i][nCurMagLvl];	-- ��ħ���ȼ����Լ���
			end			
		end
		nRepairPrice = nRepairPrice * ( nCurMaxDur - nCurDur )
	end
	return nRepairPrice;
end;

-- ά��װ�� --
-- ����ֵ��-1  ��ʾ����= 0 ��ʾ����δ���޸�(��ͬ���ͻ���); >0 ��ʾ�ɹ�(֪ͨ�ͻ���)
function repair_equip(nItemIndex, nGenre, nQuality, nDetailType, nParticularType, nOrgMaxDur, nCurMaxDur, nCurDur, nEquipPrice)
	-- SetMaxDurability(nItemIndex, 10);
	-- SetCurDurability(nItemIndex, 10);
	return -1;
end;

function get_repair_qualityname(nQ)
	if (nQ == 1) then
		return "Ho�ng Kim";
	elseif (nQ == 4) then
		return "B�ch Kim";
	else
		return "";
	end;
end;