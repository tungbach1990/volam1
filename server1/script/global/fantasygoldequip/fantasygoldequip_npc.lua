--����װ��NPC
Include("\\script\\global\\fantasygoldequip\\fantasygoldequip_head.lua");

g_szNpcName = "<color=green>H�c tr� th� r�n:<color>";

--�������������֮��
function fantasygold_upgrade()
	FantasyGoldEquip();
end

---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------

--�»ƽ�װ������������װ��
function newgold_to_fantasygold()
	--�������������Ϊ0���������Ʒ����
	GiveItemUI("Ch� t�o trang b� Huy�n Kim", "Trang b� Huy�n Kim m� ng��i mu�n ch� t�o c�n m�t ph�n Huy�n Kim Chi Tinh.Cho v�o c�t v�t ph�m b�n d��i.Ta s� thu m�t s� ng�n l��ng,nh� chu�n b� tr��c", "do_up_newgold_to_fantasygold_process", "cancel",1, "do_up_newgold_to_fantasygold_check");
	SetUiGiveItemMsg("Cho v�o trang b� mu�n ch� t�o v� nguy�n li�u");
end

--�»ƽ�װ������������װ��Ԥ��
function newgold_to_fantasygold_preview()
	GiveItemUI("Xem tr��c thu�c t�nh", "Cho v�o trang b� ng��i mu�n ch� t�o ta s� n�i cho ng��i bi�t thu�c t�nh trang b� Huy�n Kim sau khi th�ng c�p th�nh c�ng ", "do_up_newgold_to_fantasygold_process_preview", "cancel",1, "do_up_newgold_to_fantasygold_preview_check");
	SetUiGiveItemMsg("Cho v�o trang b� mu�n xem tr��c");
end

function do_up_newgold_to_fantasygold_preview_check(nItemCount)
	local tbItemIdx = {};
	for i = 1, nItemCount do
		tinsert(tbItemIdx, GetGiveItemUnit(i));
	end
	do_up_newgold_to_fantasygold_process_check(tbItemIdx, 1);
end

function do_up_newgold_to_fantasygold_check(nItemCount)
	local tbItemIdx = {};
	for i = 1, nItemCount do
		tinsert(tbItemIdx, GetGiveItemUnit(i));
	end
	do_up_newgold_to_fantasygold_process_check(tbItemIdx, 0);
end

function do_up_newgold_to_fantasygold_process(nItemCount)
	do_up_newgold_to_fantasygold_process_p(nItemCount);
end

function do_up_newgold_to_fantasygold_process_preview(nItemCount)
	do_up_newgold_to_fantasygold_process_p(nItemCount, 1);
end

UPNEWGOLDTOFANTASYGOLD_OK = 0;
UPNEWGOLDTOFANTASYGOLD_ITEM_NUM_ERROR = 1;--������Ʒ��������
UPNEWGOLDTOFANTASYGOLD_UNKNOWN_ERROR = 2;--δ֪����
UPNEWGOLDTOFANTASYGOLD_EQU_ERROR = 3;--�����װ����������
UPNEWGOLDTOFANTASYGOLD_EQU_PREVIEW_OK = 4;--����Ԥ��
UPNEWGOLDTOFANTASYGOLD_FANTASYGOLD_ERROR = 5;--����֮������
UPNEWGOLDTOFANTASYGOLD_NOMONEY = 6;--Ǯ����

function do_up_newgold_to_fantasygold_process_check(tbItemIdx, bPreview)
	local tbResult = {};
	tbResult.nRetValue = UPNEWGOLDTOFANTASYGOLD_UNKNOWN_ERROR;
	tbResult.nEquIdx = 0;
	tbResult.nFantasyGoldEssenceIdx = 0;
	tbResult.nFantasyGoldEssenceLevel = 0;
	tbResult.nEquFlag = 0;
	tbResult.nFantasyGoldEssenceFlag = 0;
	tbResult.nNeedMoney = 0;
	tbResult.nItemBindState = 0;
	tbResult.nOtherFlag = 0;
	tbResult.nAddBindDay = 0;
	tbResult.szErrorMsg = "V�t ph�m ng��i b� v�o kh�ng ph� h�p v�i �i�u ki�n ch� t�o";

	--�ȼ��װ���Ƿ������
	for i = 1, getn(tbItemIdx) do
		local nCurItemQuality = GetItemQuality(tbItemIdx[i]);
		if nCurItemQuality == 1 then--�����Ʒ�ǻƽ�װ��
			tbResult.nEquFlag = tbResult.nEquFlag + 1;
			tbResult.nEquIdx = tbItemIdx[i];
		end
	end
	if tbResult.nEquFlag > 1 then
		tbResult.nRetValue = UPNEWGOLDTOFANTASYGOLD_EQU_ERROR;
		tbResult.szErrorMsg = "Ch� c� th� cho v�o m�t c�i trang b� Ho�ng Kim";
		ShowNotice(2, tbResult.szErrorMsg);
		return tbResult;
	end

	local tbEquipProp = pack(GetItemProp(tbResult.nEquIdx));
	local nEquipExpiredTime = ITEM_GetExpiredTime(tbResult.nEquIdx);

	--����װ�����𻵵�װ��
	if tbEquipProp[1] ~= 0 then
		tbResult.nRetValue = UPNEWGOLDTOFANTASYGOLD_EQU_ERROR;
		tbResult.szErrorMsg = "Ta kh�ng th� ch� t�o trang b� n�y";
		ShowNotice(2, tbResult.szErrorMsg);
		return tbResult;
	end
	-- �б����ڵ�װ��
	if nEquipExpiredTime > 0 then 
		tbResult.nRetValue = UPNEWGOLDTOFANTASYGOLD_EQU_ERROR;
		tbResult.szErrorMsg = "Trang b� �ang b� kh�a kh�ng th� ch� t�o";
		ShowNotice(2, tbResult.szErrorMsg);
		return tbResult;
	end

	local nNeedFantasyGoldEssenceLevel = 0;
	local nAddBindDay = 0;
	local nCurGoldId = GetGlodEqIndex(tbResult.nEquIdx);
	for i, v in TB_GOLD_EQUIP_TO_UP_ID_INTERVAL do
		if nCurGoldId >= v[1] and nCurGoldId <= v[2] then
			nNeedFantasyGoldEssenceLevel = v[3];
			tbResult.nAddBindDay = v[4];
			break;
		end
	end

	if nNeedFantasyGoldEssenceLevel <= 0 then
		tbResult.nRetValue = UPNEWGOLDTOFANTASYGOLD_EQU_ERROR;
		tbResult.szErrorMsg = "Ta kh�ng th� ch� t�o trang b� n�y";
		ShowNotice(2, tbResult.szErrorMsg);
		return tbResult;
	end

	if bPreview == 1 then
		tbResult.nRetValue = UPNEWGOLDTOFANTASYGOLD_EQU_PREVIEW_OK;
		ShowNotice(2, "Nh�p v�o\"x�c nh�n\"xem tr��c thu�c t�nh");
		return tbResult;
	end


	--�ټ������֮��
	for i = 1, getn(tbItemIdx) do
		local tbCurItemProp = pack(GetItemProp(tbItemIdx[i]));
		if tbCurItemProp[1] == TB_FANTASYESSENCE[1] and tbCurItemProp[2] == TB_FANTASYESSENCE[2] and tbCurItemProp[3] == TB_FANTASYESSENCE[3] then
			tbResult.nFantasyGoldEssenceFlag = tbResult.nFantasyGoldEssenceFlag + 1;
			tbResult.nFantasyGoldEssenceIdx = tbItemIdx[i];
			tbResult.nFantasyGoldEssenceLevel = tbCurItemProp[4];
		end
	end

	if tbResult.nFantasyGoldEssenceFlag > 1 then
		tbResult.nRetValue = UPNEWGOLDTOFANTASYGOLD_FANTASYGOLD_ERROR;
		tbResult.szErrorMsg = "Ch� cho ph�p b� m�t c�i Huy�n Kim Chi Tinh";
		ShowNotice(2, tbResult.szErrorMsg);
            	return tbResult;
	end

	--�������������1��
	if GetItemStackCount(tbResult.nFantasyGoldEssenceIdx) > 1 then
		tbResult.nRetValue = UPNEWGOLDTOFANTASYGOLD_FANTASYGOLD_ERROR;
		tbResult.szErrorMsg = "Ch� c�n m�t c�i Huy�n Kim Chi Tinh,��i hi�p b� nhi�u l� l�ng ph�";
		ShowNotice(2, tbResult.szErrorMsg);
            	return tbResult;
	end

	--�������֮���ȼ�
	if tbResult.nFantasyGoldEssenceLevel ~= nNeedFantasyGoldEssenceLevel then
		tbResult.nRetValue = UPNEWGOLDTOFANTASYGOLD_FANTASYGOLD_ERROR;
		tbResult.szErrorMsg = format("Ch� t�o trang b� n�y c�n 1 c�i %d c�p Huy�n Kim Chi Tinh", nNeedFantasyGoldEssenceLevel);
		ShowNotice(2, tbResult.szErrorMsg);
            	return tbResult;
	end

	tbResult.nNeedMoney = GetUpToFantasyGoldEquipNeedMoney(nNeedFantasyGoldEssenceLevel);
	if GetCash() < tbResult.nNeedMoney then
		tbResult.nRetValue = UPNEWGOLDTOFANTASYGOLD_NOMONEY;
		tbResult.szErrorMsg = format("Ch� t�o trang b� n�y c�n %d c�a ng�n l��ng", tbResult.nNeedMoney);
		ShowNotice(2, tbResult.szErrorMsg);
            	return tbResult;
	end

	tbResult.nItemBindState = GetItemBindState(tbResult.nEquIdx)	--��ȡ��״̬

	-----------------����Ƿ���������޹���Ʒ-----------------------------------------
	if getn(tbItemIdx) ~= 2 then
		tbResult.nRetValue = UPNEWGOLDTOFANTASYGOLD_ITEM_NUM_ERROR;
		tbResult.szErrorMsg = format("Ch� t�o trang b� n�y ch� cho ph�p b� [trang b�]#[Huy�n Kim Chi Tinh].Ng��i cho �� kh�c v�o r�i", tbResult.nNeedMoney);
		ShowNotice(2, tbResult.szErrorMsg);
            	return tbResult;
	end

	tbResult.nRetValue = UPNEWGOLDTOFANTASYGOLD_OK;
	ShowNotice(2, "Nh�p v�o\"x�c nh�n\"ti�n h�nh ch� t�o");
	return tbResult;
end

--��������װ��
function do_up_newgold_to_fantasygold_process_p(nItemCount, bPreview)
	local tbItemIdx = {};
	for i = 1, nItemCount do
		tinsert(tbItemIdx, GetGiveItemUnit(i));
	end
	local tbResult = do_up_newgold_to_fantasygold_process_check(tbItemIdx, bPreview); 

	--�����Ԥ������
	if bPreview == 1 then
		if tbResult.nRetValue ~= UPNEWGOLDTOFANTASYGOLD_EQU_PREVIEW_OK then
			ShowNotice(1, tbResult.szErrorMsg);
			return
		end
		local szItemDesc = g_szNpcName .. "V�i kinh nghi�m c�a ta,thu�c t�nh c�a trang b� Huy�n Kim n�y l�:<enter>";
		local tbNextPlatinaMagicAttrib = pack(PreviewPlatinaFromGold(tbResult.nEquIdx));	
		local tbCurPlatinaMagicAttrib = getItemAllMagicList(tbResult.nEquIdx);
		for i = 1, getn(tbNextPlatinaMagicAttrib) do
			if (tbCurPlatinaMagicAttrib[i][1] == tbNextPlatinaMagicAttrib[i][1] and tbCurPlatinaMagicAttrib[i][2] ~= tbNextPlatinaMagicAttrib[i][2]) then
				local szD = (tbNextPlatinaMagicAttrib[i][2]-tbCurPlatinaMagicAttrib[i][2]);
				if (szD > 0) then
					szD = "(+"..szD..")";
				else
					szD = "("..szD..")";
				end
				szItemDesc = szItemDesc.."<color=yellow>"..GetItemMagicDesc(unpack(tbNextPlatinaMagicAttrib[i])).."<color><color=red>"..szD.."<color><enter>";
			else
				szItemDesc = szItemDesc.."<color=green>"..GetItemMagicDesc(unpack(tbNextPlatinaMagicAttrib[i])).."<color><enter>";
			end
		end
		szItemDesc = szItemDesc .. format("Th�i gian kh�a (+%d) ti�ng", tbResult.nAddBindDay * 24);
		CreateTaskSay({"<dec>"..szItemDesc, 
			"Ta mu�n xem tr��c m�t c�i thu�c t�nh c�a trang b� kh�c sau khi ch� t�o/newgold_to_fantasygold_preview",
			"Xin gi�p ta ch� t�o trang b� n�y th�nh trang b� Huy�n Kim/newgold_to_fantasygold",
			"Th�t ng�i qu�, ta s� quay l�i sau./cancel"}
		);

		return
	end

	
	if tbResult.nRetValue ~= UPNEWGOLDTOFANTASYGOLD_OK then
		ShowNotice(1, tbResult.szErrorMsg);
		return
	end

	----------------------�������֮���Ƿ��������-----------------------

	--��Ǯ
	Pay(tbResult.nNeedMoney);
	--ɾ����Ʒ
	if RemoveItemByIndex(tbResult.nFantasyGoldEssenceIdx) ~= 1 then
		--���ɾ����Ʒʧ����д��־
		WriteLog(format("[Ch� t�o trang b� Huy�n Kim]\tt�i kho�n?%s\tnh�n v�t?%s\tx�a v�t ph�m[%s]th�t b�i?ch� t�o th�t b�i?", GetAccount(), GetName(), GetItemName(tbResult.nFantasyGoldEssenceIdx)));
		Talk(1, "", g_szNpcName .. format("Ch� t�o th�t b�i!Tr� �i<color=red>%d<color><color=yellow>ng�n l��ng<color>#<color=red>%d<color>c�i<color=yellow>H�n Nguy�n Linh L�<color>#<color=red>1<color>c�i<color=yellow>Huy�n Kim<color>.", tbResult.nNeedMoney));
		return
	end

	--����
	local nSuccess = UpgradePlatinaFromGoldItem(tbResult.nEquIdx);

	if nSuccess > 0 then
		--���������ɵ�װ���İ�״̬
		local nNewItemBindState = calc_equip_binditem(tbResult.nItemBindState, tbResult.nAddBindDay * 24);
		SetItemBindState(tbResult.nEquIdx, nNewItemBindState);
		Talk(1, "", g_szNpcName .. "Ch� t�o th�nh c�ng,ng��i nh�n ���c m�t trang b� Huy�n Kim");

		WriteLog(format("[Ch� t�o trang b� Huy�n Kim]\tt�i kho�n?%s\tnh�n v�t?%s\tch� t�o trang b� Huy�n Kim[%s]th�nh c�ng", GetAccount(), GetName(), GetItemName(tbResult.nEquIdx)));
	else
		--д����ʧ����־
		WriteLog(format("[Ch� t�o trang b� Huy�n Kim]\tt�i kho�n?%s\tnh�n v�t?%s\tch� t�o trang b� Huy�n Kim[%s]th�t b�i", GetAccount(), GetName(), GetItemName(tbResult.nEquIdx)));
	end

end

------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------

function fantasygoldequip_upgrade_preview()
	GiveItemUI("Xem tr��c thu�c t�nh sau khi n�ng c�p", "Cho v�o trang b� m� ng��i mu�n n�ng c�p,ta s� n�i cho ng��i bi�t thu�c t�nh trang b� Huy�n Kim sau khi n�ng c�p th�nh c�ng", "do_update_fantasygoldequip_process_preview", "cancel",1,"fantasygoldequip_upgrade_preview_check");
	SetUiGiveItemMsg("Cho v�o trang b� mu�n xem tr��c");
end


function fantasygoldequip_upgrade()
	GiveItemUI("N�ng c�p trang b� Huy�n Kim", "N�ng c�p c�n H�n Nguy�n Linh L�,ng�n l��ng v� Huy�n Kim.Ch� t�o th�t b�i ngo�i t�n th�t trang b� ra c�n c� nh�ng th� kh�c", "do_update_fantasygoldequip_process", "cancel",1, "fantasygoldequip_upgrade_check");
	SetUiGiveItemMsg("Cho v�o trang b� mu�n n�ng c�p c�ng v�i nguy�n li�u");
end

function do_update_fantasygoldequip_process(nItemCount)
	do_update_fantasygoldequip_process_p(nItemCount, 0)
end

function do_update_fantasygoldequip_process_preview(nItemCount)
	do_update_fantasygoldequip_process_p(nItemCount, 1)
end

function fantasygoldequip_upgrade_preview_check(nItemCount)
	local tbItemIdx = {};
	for i = 1, nItemCount do
		tinsert(tbItemIdx, GetGiveItemUnit(i));
	end
	do_upgrade_fantasygoldequip_check(tbItemIdx, 1);
end

function fantasygoldequip_upgrade_check(nItemCount)
	local tbItemIdx = {};
	for i = 1, nItemCount do
		tinsert(tbItemIdx, GetGiveItemUnit(i));
	end
	do_upgrade_fantasygoldequip_check(tbItemIdx, 0);
end


--�������Ʒ��������
FANTASY_GOLD_EQUIP_OK = 0;
--û�з����������������װ��
FANTASY_GOLD_EQUIP_NOEQU = 1;
--��������װ��̫��
FANTASY_GOLD_EQUIP_TOOMUCH = 2;
--���������װ���ĵȼ��Ѿ����
FANTASY_GOLD_EQUIP_LEVELFULL = 3;
--��Ԫ��¶��������
REFININGSTONE_NUM_ERROR = 4;
--�������������̫��
REFININGSTONE_TOOMUCH = 5;
--�������޹���Ʒ
FANTASY_GOLD_EQUIP_NOUSE = 6;
--δ֪����
FANTASY_GOLD_EQUIP_UNKNOWN_ERROR = 7;
--����Ԥ��
FANTASY_GOLD_EQUIP_CAN_PREVIEW = 8;
--װ���б����ڣ���������
FANTASY_GOLD_EQUIP_HAS_EXPIRETIME = 9;
--װ�������������˲���Ҫ������
FANTASY_GOLD_EQUIP_LOCK_ERROR = 10;
--Ǯ����
FANTASY_GOLD_EQUIP_MONEY_NOT_ENOUGH = 11;

function do_upgrade_fantasygoldequip_check(tbItemIdx, bPreview)
	local tbResult = {};
	tbResult.nEquFlag = 0;--װ�����
	tbResult.nRefiningStoneFlag = 0;--��Ԫ��¶���
	tbResult.nFantasyGoldFlag = 0;--������
	tbResult.nOtherFlag = 0;--������Ʒ���
	tbResult.nNeedRefiningStoneCount = 0;--��Ҫ�Ļ�Ԫ��¶����
	tbResult.nFantasyGoldValue = 0;--�����������ܼ�ֵ��
	tbResult.nFantasyGoldEquipIdx = 0;--�ҵ�����Ψһ������װ��������
	tbResult.nRetValue = FANTASY_GOLD_EQUIP_UNKNOWN_ERROR;
	tbResult.nEquipType = 0;--��ǰװ������һ�࣬��ԡ���¹...
	tbResult.nEquipLevel = 0;--���װ���ĵȼ�
	tbResult.nSuccessRate = 0;--�ɹ���
	tbResult.nNeedMoney = 0;--��Ҫ�Ľ�Ǯ
	tbResult.nBindState = 0;--װ���İ�״̬
	tbResult.nAddBindHour = 0;--װ����Ҫ���ӵİ�ʱ��
	tbResult.szErrorMsg = "";--���󷵻���Ϣ

	local bCheckOrCommit = 2;
	
	-----------------���װ���Ϸ���-----------------------------------------
	--���ҳ�Ҫ������װ��
	for i = 1, getn(tbItemIdx) do
		local nCurEquipId = GetPlatinaEquipIndex(tbItemIdx[i]);
		for index, v in TB_FANSTAY_GOLD_EQUIP_TO_UP_ID_INTERVAL do
			if nCurEquipId >= v[1] and nCurEquipId <= v[2] then
				tbResult.nEquFlag = tbResult.nEquFlag + 1;
				tbResult.nFantasyGoldEquipIdx = tbItemIdx[i];
				tbResult.nEquipType = index;
			end
		end
	end
	if tbResult.nEquFlag <= 0 then
		tbResult.nRetValue = FANTASY_GOLD_EQUIP_NOEQU;--û�з����������������װ��
		tbResult.szErrorMsg = "Ng��i v�n ch�a cho  trang b� c� th� n�ng c�p v�o";
		ShowNotice(bCheckOrCommit, tbResult.szErrorMsg);
		return tbResult;
	end
	if tbResult.nEquFlag > 1 then
		tbResult.nRetValue = FANTASY_GOLD_EQUIP_TOOMUCH;--��������װ��̫��
		tbResult.szErrorMsg = "C�ng l�c ta ch� c� th� ch� t�o m�t trang b�";
		ShowNotice(bCheckOrCommit, tbResult.szErrorMsg);
		return tbResult;
	end
	local tbFantasyGoldEquipProp = pack(GetItemProp(tbResult.nFantasyGoldEquipIdx));
	if tbFantasyGoldEquipProp[1] ~= 0 then--����װ��
		tbResult.nRetValue = FANTASY_GOLD_EQUIP_NOEQU;
		tbResult.szErrorMsg = "Ng��i v�n ch�a cho  trang b� c� th� n�ng c�p v�o";
		ShowNotice(bCheckOrCommit, tbResult.szErrorMsg);
		return tbResult;
	end

	tbResult.nEquipLevel = GetPlatinaLevel(tbResult.nFantasyGoldEquipIdx);
	if tbResult.nEquipLevel >= 10 then
		tbResult.nRetValue = FANTASY_GOLD_EQUIP_LEVELFULL;
		tbResult.szErrorMsg = "Trang b� ng��i cho v�o �� l� c�p m��i r�i,kh�ng th� n�ng c�p n�a";
		ShowNotice(bCheckOrCommit, tbResult.szErrorMsg);
		return tbResult;
	end

	local nEquipQuality = GetItemQuality(tbResult.nFantasyGoldEquipIdx);
	if nEquipQuality ~= 4 then--���ǰ׽�װ��
		tbResult.nRetValue = FANTASY_GOLD_EQUIP_NOEQU;
		tbResult.szErrorMsg = "Ng��i v�n ch�a cho  trang b� c� th� n�ng c�p v�o";
		ShowNotice(bCheckOrCommit, tbResult.szErrorMsg);
		return tbResult;
	end

	local nEquipExpiredTime = ITEM_GetExpiredTime(tbResult.nFantasyGoldEquipIdx);
	local tbEquipProp = pack(GetItemProp(nEquIdx));

	-- �б����ڵ�װ��
	if nEquipExpiredTime > 0 then 
		tbResult.nRetValue = FANTASY_GOLD_EQUIP_HAS_EXPIRETIME;
		tbResult.szErrorMsg = "Trang b� �ang b� kh�a kh�ng th� n�ng c�p";
		ShowNotice(bCheckOrCommit, tbResult.szErrorMsg);
		return tbResult;
	end


	--��ȡ��״̬
	tbResult.nBindState = GetItemBindState(tbResult.nFantasyGoldEquipIdx)	--��ȡ��״̬
	tbResult.nAddBindHour = TB_FANSTAY_GOLD_EQUIP_TO_UP_ID_INTERVAL[tbResult.nEquipType][4] * 24;

	--�����Ԥ��������Ҫ������
	if bPreview and bPreview == 1 then
		tbResult.nRetValue = FANTASY_GOLD_EQUIP_CAN_PREVIEW;
		ShowNotice(bCheckOrCommit, "Nh�p v�o\"x�c nh�n\"xem tr��c thu�c t�nh");
		return tbResult;
	end

	-----------------����Ԫ��¶�Ϸ���-----------------------------------------
	tbResult.nNeedRefiningStoneCount = tbResult.nEquipLevel + 1;--��Ҫ�Ļ�Ԫ��¶����ΪҪ������װ���ȼ�+1
	for i = 1, getn(tbItemIdx) do
		local tItemProp = pack(GetItemProp(tbItemIdx[i]));
		if tItemProp[1] == TB_REFININGSTONE[1] and tItemProp[2] == TB_REFININGSTONE[2] and tItemProp[3] == TB_REFININGSTONE[3] then--�������Ʒ�ǻ�Ԫ��¶
			--ȡ��������
			local nStackCount = GetItemStackCount(tbItemIdx[i]);
			tbResult.nRefiningStoneFlag = tbResult.nRefiningStoneFlag + nStackCount;
		end
	end

	if tbResult.nRefiningStoneFlag <= 0 or (tbResult.nNeedRefiningStoneCount ~= tbResult.nRefiningStoneFlag) then
		tbResult.nRetValue = REFININGSTONE_NUM_ERROR;--����Ļ�Ԫ��¶��������
		tbResult.szErrorMsg = format("Ng��i ph�i b� v�o %d H�n Nguy�n Linh L� m�i c� th� n�ng c�p", tbResult.nNeedRefiningStoneCount);
		ShowNotice(bCheckOrCommit, tbResult.szErrorMsg);
		return tbResult;
	end

	-----------------�������Ϸ���-----------------------------------------
	for i = 1, getn(tbItemIdx) do
		local tItemProp = pack(GetItemProp(tbItemIdx[i]));
		if tItemProp[1] == TB_FANTASYGOLD[1] and tItemProp[2] == TB_FANTASYGOLD[2] and tItemProp[3] == TB_FANTASYGOLD[3] then--�������Ʒ������
			--ȡ��������
			local nStackCount = GetItemStackCount(tbItemIdx[i]);
			tbResult.nFantasyGoldFlag = tbResult.nFantasyGoldFlag + nStackCount;

			tbResult.nFantasyGoldValue = tbResult.nFantasyGoldValue + nStackCount * CalcFantasyGoldValueByLevel(tItemProp[4]);
		end
	end

	--����������ܳ���6��
	if tbResult.nFantasyGoldFlag > 6 then
		tbResult.szErrorMsg = format("S� l��ng Huy�n Kim b� v�o kh�ng ���c v��t qu� s�u m�nh");
		ShowNotice(bCheckOrCommit, tbResult.szErrorMsg);
		tbResult.nRetValue = REFININGSTONE_TOOMUCH;
		return tbResult;
	end

	-----------------����Ƿ���������޹���Ʒ-----------------------------------------
	for i = 1, getn(tbItemIdx) do
		local nIsRequireItem = nil
		local tItemProp = pack(GetItemProp(tbItemIdx[i]));
		if (tItemProp[1]==TB_REFININGSTONE[1]) and (tItemProp[2]==TB_REFININGSTONE[2]) and (tItemProp[3]==TB_REFININGSTONE[3]) then
			nIsRequireItem = 1; --����
		end
		
		if tItemProp[1] == TB_FANTASYGOLD[1] or tItemProp[2] == TB_FANTASYGOLD[2] or tItemProp[3] == TB_FANTASYGOLD[3] then
			nIsRequireItem = 1; --��Ԫ��¶
		end
		
		local nCurEquipId = GetPlatinaEquipIndex(tbItemIdx[i]);	
		for nSuite = 1, getn(TB_FANSTAY_GOLD_EQUIP_TO_UP_ID_INTERVAL) do
			if nCurEquipId >= TB_FANSTAY_GOLD_EQUIP_TO_UP_ID_INTERVAL[nSuite][1] and nCurEquipId <= TB_FANSTAY_GOLD_EQUIP_TO_UP_ID_INTERVAL[nSuite][2] then--�ǿ��������İ׽�װ��
				nIsRequireItem = 1
				break;
			end
		end
		
		if not nIsRequireItem then
			tbResult.nOtherFlag = 1;
			break;
		end
	end
	
	if tbResult.nOtherFlag == 1 then--��������޹���Ʒ
		tbResult.szErrorMsg = "N�ng c�p trang b� n�y ch� cho b� [trang b�]#[H�n Nguy�n Linh L�]#[Huy�n Kim].Ng��i b� c�i kh�c r�i";
		ShowNotice(bCheckOrCommit, tbResult.szErrorMsg);
		tbResult.nRetValue = FANTASY_GOLD_EQUIP_NOUSE;
		return tbResult;
	end


	--����ɹ��ʣ�����õ����Ǹ���*100��
	tbResult.nSuccessRate = floor(tbResult.nFantasyGoldValue * 100 / TB_FANSTAY_GOLD_EQUIP_TO_UP_ID_INTERVAL[tbResult.nEquipType][3][tbResult.nEquipLevel + 1]);
	if tbResult.nSuccessRate > 100 then
		tbResult.nSuccessRate = 100;
	end
	tbResult.nNeedMoney = TB_FANSTAY_GOLD_EQUIP_TO_UP_ID_INTERVAL[tbResult.nEquipType][3][tbResult.nEquipLevel + 1] * 1000;

	--�жϽ�Ǯ
	if GetCash() < tbResult.nNeedMoney then
		tbResult.szErrorMsg = format("N�ng c�p trang b� n�y c�n %d ng�n l��ng,ti�n c�a ��i hi�p kh�ng ��", tbResult.nNeedMoney);
		ShowNotice(bCheckOrCommit, tbResult.szErrorMsg);
		tbResult.nRetValue = FANTASY_GOLD_EQUIP_MONEY_NOT_ENOUGH;
		return tbResult;
	end

	if bPreview == 0 then
		tbResult.szErrorMsg = format("T� l� n�ng c�p th�nh c�ng trang b� n�y l�: %d%%", tbResult.nSuccessRate);
		ShowNotice(bCheckOrCommit, tbResult.szErrorMsg);
	end
	
	tbResult.nRetValue = FANTASY_GOLD_EQUIP_OK;
	return tbResult;
end

function do_update_fantasygoldequip_process_p(nItemCount, bPreview)
	local tbItemIdx = {};
	for i = 1, nItemCount do
		tinsert(tbItemIdx, GetGiveItemUnit(i));
	end

	local tbResult = do_upgrade_fantasygoldequip_check(tbItemIdx, bPreview);
	if bPreview == 1 then--�����Ԥ��
		if tbResult.nRetValue ~= FANTASY_GOLD_EQUIP_CAN_PREVIEW then
			ShowNotice(1, tbResult.szErrorMsg);
			return
		end
		local szItemDesc = g_szNpcName .. "Thu�c t�nh c�a trang b� Huy�n Kim n�y sau khi n�ng c�p l�: <enter>";
		local tbNextPlatinaMagicAttrib = pack(PreviewPlatinaUpgrade(tbResult.nFantasyGoldEquipIdx));
		local tbCurPlatinaMagicAttrib = getItemAllMagicList(tbResult.nFantasyGoldEquipIdx);
		for i = 1, getn(tbNextPlatinaMagicAttrib) do
			if (tbCurPlatinaMagicAttrib[i][1] == tbNextPlatinaMagicAttrib[i][1] and tbCurPlatinaMagicAttrib[i][2] ~= tbNextPlatinaMagicAttrib[i][2]) then
				local szD = (tbNextPlatinaMagicAttrib[i][2]-tbCurPlatinaMagicAttrib[i][2]);
				if (szD > 0) then
					szD = "(+"..szD..")";
				else
					szD = "("..szD..")";
				end
				szItemDesc = szItemDesc.."<color=yellow>"..GetItemMagicDesc(unpack(tbNextPlatinaMagicAttrib[i])).."<color><color=red>"..szD.."<color><enter>";
			else
				szItemDesc = szItemDesc.."<color=green>"..GetItemMagicDesc(unpack(tbNextPlatinaMagicAttrib[i])).."<color><enter>";
			end
		end
		szItemDesc = szItemDesc .. format("Th�i gian kh�a (+%d) ti�ng", tbResult.nAddBindHour);
		CreateTaskSay({"<dec>"..szItemDesc, 
			"Xem tr��c thu�c t�nh c�a trang b� kh�c sau khi n�ng c�p/fantasygoldequip_upgrade_preview",
			"Xin gi�p ta n�ng c�p trang b� n�y/fantasygoldequip_upgrade",
			"Th�t ng�i qu�, ta s� quay l�i sau./cancel"}
		);
		--Talk(1, "", szItemDesc);
		--Talk(1, "", g_szNpcName .. format("����Ҫ����������װ����Ҫ<color=red>%d<color>��<color=yellow>��Ԫ��¶<color>��<color=red>%d<color>��<color=yellow>����<color>���ɹ���Ϊ<color=red>%d%%<color>", tbResult.nNeedRefiningStoneCount, tbResult.nNeedMoney, tbResult.nSuccessRate));
		return
	end

	if tbResult.nRetValue ~= FANTASY_GOLD_EQUIP_OK then
		ShowNotice(1, tbResult.szErrorMsg);
		return
	end


	--��Ǯ��ɾ����Ʒ����Щ�ǲ��ܳɹ�ʧ�ܶ�Ҫɾ���ģ�
	Pay(tbResult.nNeedMoney);
	for i = 1, getn(tbItemIdx) do
		if tbItemIdx[i] ~= tbResult.nFantasyGoldEquipIdx then--װ���Ȳ�ɾ��
			if RemoveItemByIndex(tbItemIdx[i]) ~= 1 then
			--���ɾ����Ʒʧ����д��־
			WriteLog(format("[N�ng c�p trang b� Huy�n Kim]\tt�i kho�n?%s\tnh�n v�t?%s\tx�a v�t ph�m[%s]th�t b�i?ch� t�o th�t b�i?", GetAccount(), GetName(), GetItemName(tbItemIdx[i])));
			end
		end
	end

	--���
	local nRandom = random(1, 100);
	if nRandom <= tbResult.nSuccessRate then--�����ɹ�
		if UpgradePlatinaItem(tbResult.nFantasyGoldEquipIdx) > 0 then
			Talk(1, "", g_szNpcName .. "Ch�c m�ng ��i hi�p n�ng c�p th�nh c�ng!Ng��i nh�n ���c m�t trang b� cao c�p");
			--���������ɵ�װ���İ�״̬
			local nNewItemBindState = calc_equip_binditem(tbResult.nBindState, tbResult.nAddBindHour);
			SetItemBindState(tbResult.nFantasyGoldEquipIdx, nNewItemBindState);
			WriteLog(format("[N�ng c�p trang b� Huy�n Kim]\tt�i kho�n?%s\tnh�n v�t?%s\tn�ng c�p[%d]c�p[%s]th�nh c�ng\tti�u hao ti�n%dhai\tH�n Nguy�n Linh L�%dc�i\tHuy�n Kim%dc�i", GetAccount(), GetName(), tbResult.nEquipLevel + 1, GetItemName(tbResult.nFantasyGoldEquipIdx), tbResult.nNeedMoney, tbResult.nNeedRefiningStoneCount, tbResult.nFantasyGoldFlag));
		else
			Talk(1, "", g_szNpcName .. format("N�ng c�p th�t b�i!Tr�<color=red>%d<color><color=yellow>ng�n l��ng<color>#<color=red>%d<color>c�i<color=yellow>H�n Nguy�n Linh L�<color>#<color=red>%d<color>c�i<color=yellow>Huy�n Kim<color>.", tbResult.nNeedMoney, tbResult.nNeedRefiningStoneCount, tbResult.nFantasyGoldFlag));
			WriteLog(format("[N�ng c�p trang b� Huy�n Kim]\tt�i kho�n?%s\tnh�n v�t?%s\tn�ng c�p[%d]##[%s]th�t b�i\t#ti�n ti�u hao%d\tH�n Nguy�n Linh L�%dc�i\tHuy�n Kim%dc�i", GetAccount(), GetName(), tbResult.nEquipLevel + 1, GetItemName(tbResult.nFantasyGoldEquipIdx), tbResult.nNeedMoney, tbResult.nNeedRefiningStoneCount, tbResult.nFantasyGoldFlag));

		end

	else--����ʧ��
		Talk(1, "", g_szNpcName .. format("N�ng c�p th�t b�i!Tr�<color=red>%d<color><color=yellow>ng�n l��ng<color>#<color=red>%d<color>c�i<color=yellow>H�n Nguy�n Linh L�<color>#<color=red>%d<color>c�i<color=yellow>Huy�n Kim<color>.", tbResult.nNeedMoney, tbResult.nNeedRefiningStoneCount, tbResult.nFantasyGoldFlag));
		WriteLog(format("[N�ng c�p trang b� Huy�n Kim]\tt�i kho�n?%s\tnh�n v�t?%s\tn�ng c�p[%d]##[%s]th�t b�i\t#ti�n ti�u hao%d\tH�n Nguy�n Linh L�%dc�i\tHuy�n Kim%dc�i", GetAccount(), GetName(), tbResult.nEquipLevel + 1, GetItemName(tbResult.nFantasyGoldEquipIdx), tbResult.nNeedMoney, tbResult.nNeedRefiningStoneCount, tbResult.nFantasyGoldFlag));
	end

end


function ShowNotice(nType, szNotice)
	if nType == 1 then
		Talk(1, "", g_szNpcName .. szNotice);
	elseif nType == 2 then
		SetUiGiveItemMsg(szNotice);
	end
end

function getItemAllMagicList(nItemIdx)
	local tb_magic = {};
	for i = 1, 6 do
		tb_magic[getn(tb_magic) + 1] = pack(GetItemMagicAttrib(nItemIdx, i));
	end;
	return tb_magic;
end;

function cancel()
end

--�������װ��
function split_fantasygoldequip_configm()
--�������������Ϊ0���������Ʒ����
	GiveItemUI("Th�o trang b� Huy�n Kim", "Ng��i s� nh�n ���c +0 thu�c t�nh trang b� Huy�n Kim v� t�ng s� l��ng ti�u hao n�ng c�p 88% nguy�n li�u ", "do_split_fantasygoldequip_process", "cancel",1, "do_split_fantasygoldequip_check");
	SetUiGiveItemMsg("Cho v�o trang b� Huy�n Kim mu�n th�o");
end


function do_split_fantasygoldequip_process(nItemCount)
	local tbResult = do_split_fantasygoldequip_check(nItemCount);
	if tbResult.nRetValue == FANTASY_GOLD_EQUIP_UNKNOWN_ERROR then
		ShowNotice(1, tbResult.szErrorMsg);
		return 0;
	end

	if DegradePlatinaItem(tbResult.nFantasyGoldEquipIdx, tbResult.nEquipLevel) > 0 then
		Talk(1, "", g_szNpcName .. "Ch�c m�ng ��i hi�p th�o b� th�nh c�ng!");

		--������
		local szCountLog = "";
		for i, v in tbResult.tbFantasyGoldCount do
			if v ~= 0 then
				PlayerFunLib:GetItem({tbProp={TB_FANTASYGOLD[1], TB_FANTASYGOLD[2], TB_FANTASYGOLD[3], i},nBindState=-2,},v,"Trang b� Huy�n Kim th�o b�")
				szCountLog = szCountLog .. format("%dc�p Huy�n Kim%dc�i,", i, v);
			end
		end
		--���������ɵ�װ���İ�״̬
		--local nNewItemBindState = calc_equip_binditem(tbResult.nBindState, tbResult.nAddBindHour);
		--if nNewItemBindState > 0 then
		--	SetItemBindState(tbResult.nFantasyGoldEquipIdx, nNewItemBindState);
		--end

		if tbResult.nBindState > 0 then
			local nNewBindTime = tbResult.nBindState - (floor((GetCurServerTime() - 946656000) / 3600) - 7 * 24) + tbResult.nAddBindHour;
			if nNewBindTime <= 0 then
				SetItemBindState(tbResult.nFantasyGoldEquipIdx, 0)
			else
				SetItemBindState(tbResult.nFantasyGoldEquipIdx, tbResult.nBindState + tbResult.nAddBindHour)
			end
		else
			SetItemBindState(tbResult.nFantasyGoldEquipIdx, tbResult.nBindState);
		end

		--��־
		WriteLog(format("[Th�o b� trang b� Huy�n Kim]\tt�i kho�n?%s\tnh�n v�t?%s\tth�o[%d]c�p[%s]th�nh c�ng\tnh�n ���c%s", GetAccount(), GetName(), tbResult.nEquipLevel, GetItemName(tbResult.nFantasyGoldEquipIdx), szCountLog));
	else
		Talk(1, "", g_szNpcName .. "Th�o b� th�t b�i");
		WriteLog(format("[Th�o b� trang b� Huy�n Kim]\tt�i kho�n?%s\tnh�n v�t?%s\tth�o[%d]c�p[%s]th�t b�i", GetAccount(), GetName(), tbResult.nEquipLevel, GetItemName(tbResult.nFantasyGoldEquipIdx)));

	end


end

function do_split_fantasygoldequip_check(nItemCount)
	local tbResult = {};
	tbResult.nFantasyGoldEquipIdx = 0;--�ҵ�����Ψһ������װ��������
	tbResult.nRetValue = FANTASY_GOLD_EQUIP_UNKNOWN_ERROR;
	tbResult.nEquipType = 0;--��ǰװ������һ�࣬��ԡ���¹...
	tbResult.nEquipLevel = 0;--���װ���ĵȼ�
	tbResult.tbFantasyGoldCount = 0;--�������������
	tbResult.nBindState = 0;--װ���İ�״̬
	tbResult.nAddBindHour = 0;--װ����Ҫ���ӵİ�ʱ��
	tbResult.szErrorMsg = "";--���󷵻���Ϣ

	if GetBoxLockState() == 1 then
		tbResult.szErrorMsg = "Ng��i �ang trong tr�ng th�i r��ng ch�a �� b� kh�a, h�y m� kh�a tr��c!";
		ShowNotice(2, tbResult.szErrorMsg);
		return tbResult;
	end

	if nItemCount > 1 or nItemCount <= 0 then
		tbResult.szErrorMsg = "��i hi�p ch� c� th� cho v�o m�t trang b� mu�n th�o b�";
		ShowNotice(2, tbResult.szErrorMsg);
		return tbResult;
	end

	local nItemIdx = GetGiveItemUnit(1);

	-----------------���װ���Ϸ���-----------------------------------------
	local nEquipRecordIdx = GetPlatinaEquipIndex(nItemIdx);
	for index, v in TB_FANSTAY_GOLD_EQUIP_TO_UP_ID_INTERVAL do
		if nEquipRecordIdx >= v[1] and nEquipRecordIdx <= v[2] then
			tbResult.nFantasyGoldEquipIdx = nItemIdx;
			tbResult.nEquipType = index;
		end
	end
	if tbResult.nFantasyGoldEquipIdx <= 0 then
		tbResult.szErrorMsg = "��i hi�p ph�i cho trang b� Huy�n Kim v�o";
		ShowNotice(2, tbResult.szErrorMsg);
		return tbResult;
	end
	local tbFantasyGoldEquipProp = pack(GetItemProp(tbResult.nFantasyGoldEquipIdx));
	if tbFantasyGoldEquipProp[1] ~= 0 then--����װ��
		tbResult.szErrorMsg = "��i hi�p ph�i cho trang b� Huy�n Kim v�o";
		ShowNotice(2, tbResult.szErrorMsg);
		return tbResult;
	end

	tbResult.nEquipLevel = GetPlatinaLevel(tbResult.nFantasyGoldEquipIdx);
	if tbResult.nEquipLevel <= 0 then
		tbResult.szErrorMsg = "Trang b� Huy�n Kim c�p 0 kh�ng th� th�o b�";
		ShowNotice(2, tbResult.szErrorMsg);
		return tbResult;
	end

	local nEquipQuality = GetItemQuality(tbResult.nFantasyGoldEquipIdx);
	if nEquipQuality ~= 4 then--���ǰ׽�װ��
		tbResult.szErrorMsg = "��i hi�p ph�i cho trang b� Huy�n Kim v�o";
		ShowNotice(2, tbResult.szErrorMsg);
		return tbResult;
	end
	
	local nEquipExpiredTime = ITEM_GetExpiredTime(tbResult.nFantasyGoldEquipIdx);
	local tbEquipProp = pack(GetItemProp(nEquIdx));
	-- �б����ڵ�װ��
	if nEquipExpiredTime > 0 then 
		tbResult.szErrorMsg = "Trang b� �ang b� kh�a kh�ng th� th�o b�";
		ShowNotice(2, tbResult.szErrorMsg);
		return tbResult;
	end

	--��ȡ��״̬
	tbResult.nBindState = GetItemBindState(tbResult.nFantasyGoldEquipIdx)	--��ȡ��״̬
	tbResult.nAddBindHour = -TB_FANSTAY_GOLD_EQUIP_TO_UP_ID_INTERVAL[tbResult.nEquipType][4] * 24 * (tbResult.nEquipLevel + 1);
	
	--��ⱳ���ռ�
	if PlayerFunLib:CheckFreeBagCell(10, "") == nil then
		tbResult.szErrorMsg = "C�n �t nh�t m��i t�i ��";
		ShowNotice(2, tbResult.szErrorMsg);
		return tbResult;
	end
	
	--����ܻ�ö�������	
	local nEquipValue = GetFantasyGoldEquipValueByLevel(tbResult.nEquipType, tbResult.nEquipLevel);
	tbResult.tbFantasyGoldCount = FantasyGoldEquipValueToFantasyGoldCount(floor(nEquipValue * 0.88));

	tbResult.nRetValue = FANTASY_GOLD_EQUIP_OK;
	local szCount = "";
	for i, v in tbResult.tbFantasyGoldCount do
		if v ~= 0 then
			szCount = szCount .. format("%dc�p%dc�i ", i, v)
		end
	end
	tbResult.szErrorMsg = format("Nh�n ���c Huy�n Kim:%s", szCount);
	ShowNotice(2, tbResult.szErrorMsg);

	return tbResult;
end

--����ĳ����ĳ�ȼ�������װ���ļ�ֵ��
function GetFantasyGoldEquipValueByLevel(nEquipType, nLevel)
	local nEquipTypeCount = getn(TB_FANSTAY_GOLD_EQUIP_TO_UP_ID_INTERVAL)
	if nEquipType <= 0 or nEquipType > nEquipTypeCount then
		return 0;
	end
	if nLevel <= 0 then
		return 0;
	end

	local tbValueList = TB_FANSTAY_GOLD_EQUIP_TO_UP_ID_INTERVAL[nEquipType][3];
	local nRetValue = 0;
	for i = 1, nLevel do
		nRetValue = nRetValue + tbValueList[i];
	end
	return nRetValue;
end

--����ĳ��ֵ�����Զһ��ɶ������𣨷ֵȼ�������table
function FantasyGoldEquipValueToFantasyGoldCount(nEquipValue)
	local nTotalValue = nEquipValue;
	local nMaxLevel = 10
	local tbRetCount = {};
	local nCurCount = 0;
	for i = nMaxLevel, 1, -1 do
		local nFantasyGoldValue = CalcFantasyGoldValueByLevel(i);
		nCount = floor(nTotalValue / nFantasyGoldValue);
		
		nCurCount = nCurCount + nCount;
		if nCurCount >= 30 then
			nCount = nCount - (nCurCount - 30)
		end

		tbRetCount[i] = nCount;

		nTotalValue = nTotalValue - nCount * nFantasyGoldValue;

		if nCurCount >= 30 then
			break;
		end
	end
	return tbRetCount;
end

