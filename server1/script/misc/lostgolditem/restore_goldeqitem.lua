IncludeLib("ITEM")
Include("\\script\\lib\\common.lua")
-- Include("\\script\\misc\\lostgolditem\\lost_golditem_info.lua")

if(not g_golditem_info_tab) then
	g_golditem_info_tab = {{0},{0}}
end;

--ExtPoint
RS_EXTPOINT_GOLDITEM	= 6			--��ȡ�ƽ�װ����չ��
--TaskID
RS_TASKID_ISTAKED		= 1190		--��ȡ�ƽ�װ�����������-1������ȡ��1��ȡ����0δ��ȡ
RS_TASKID_ITEMINDEX	= 1191		--�Ѿ���ȡ���� x ��װ��
--Common
RS_GOLDITEM_ACCOUNT				= 1
RS_GOLDITEM_ROLENAME			= 2
RS_GOLDITEM_LEVEL				= 3
RS_GOLDITEM_SERIES				= 4
RS_GOLDITEM_SEX					= 5
RS_GOLDITEM_OLTOTALTIME			= 6
RS_LEVEL_RANGE					= 0					--�ȼ���� ����
RS_TOTALTIME_RANGE				= 3 * 24 * 60 * 60	--����ʱ�����3��

RS_ZONEID_BIT			= g_golditem_info_tab[1][1]		--ʹ����չ��ĵ�nλ����n+3��λ
RS_BIT_EXTPOINT_RANGE	= 3
--RS_BIT_BASE = RS_BIT_EXTPOINT_RANGE^(RS_ZONEID_BIT - 1) + (RS_ZONEID_BIT - 1);
RS_BIT_BASE = RS_BIT_EXTPOINT_RANGE * (RS_ZONEID_BIT - 1);

RS_ACCOUNT_MAXCOUNT		= g_golditem_info_tab[2][1]		--�ʺ�����

--�ʺŽ�ɫ��ϵ��
TB_ACCOUNT_ROLENAME_INFO = {};
--��ɫװ����ϵ��
TB_ROLENAME_GOLDITEM_INFO ={};

function RS_Init_Account_Name_Info()
	for i = 3, getn(g_golditem_info_tab) do
		local tb = g_golditem_info_tab[i];
		local szAccount = tb[1][1];
		local nRoleCnt = tb[1][2];
		TB_ACCOUNT_ROLENAME_INFO[szAccount] = {};
		local count = 0;
		for j = 2, getn(tb) do
			local szName = tb[j][1][2];
			count = count + 1;
			TB_ACCOUNT_ROLENAME_INFO[szAccount][count] = tb[j][1];
			TB_ROLENAME_GOLDITEM_INFO[szName] = {};
			for k = 3, getn(tb[j]) do
				TB_ROLENAME_GOLDITEM_INFO[szName][getn(TB_ROLENAME_GOLDITEM_INFO[szName]) + 1] = tb[j][k];
			end;
		end;
		if (count ~= nRoleCnt) then
			print("Init AccountInfo Error!!!", i);
		end;
	end;
end;
--��ʼ��
print("RS_Init_Account_Name_Info");
RS_Init_Account_Name_Info();


function rs_error_talk(nErr)
	if (nErr == 1) then
		Describe("Xin l�i! Qu� kh�ch kh�ng h� m�t trang b� n�o!", 1, "K�t th�c ��i tho�i/gsp_cancel");
	elseif (nErr == 2) then
		Describe("B�n �� nh�n l�i trang b� Ho�ng Kim c�a m�nh r�i!", 1, "K�t th�c ��i tho�i/gsp_cancel");
	elseif(nErr == 3) then
		Describe("H�nh trang c�a b�n kh�ng c�n ch� tr�ng <color=red>kh�ng c�n ch� tr�ng<color>!", 1, "K�t th�c ��i tho�i/gsp_cancel");
	elseif (nErr == 4) then
		Describe("Vi�c nh�n l�i trang b� c�a b�n g�p ch�t tr�c tr�c, xin li�n h� v�i b� ph�n ph�c v� �� ���c gi�p ��!", 1, "K�t th�c ��i tho�i/gsp_cancel");
	else
		print("Error Talk!!");
	end;
end;

function rs_check_istaked()
	local bTaked = GetTask(RS_TASKID_ISTAKED)
	if (bTaked == -1) then	--��ɫû����ȡ�ʸ�
		rs_error_talk(1);
		return 0;
	end;
	if (bTaked == 1) then	--��ɫ��ȡ��
		rs_error_talk(2);
		return 0;
	end;
	
--	if (rs_Is_Bit_Extpoint() == 0) then	--�ʺ��н�ɫ��ȫ�����
--		rs_error_talk(1);
--		return 0;
--	end;
	
	local szAccount = GetAccount();
	local szName = GetName();
	local nLevel = GetLevel();
	local nSeries = GetSeries();
	local nSex = GetSex();
	local nTotalTime = GetGameTime();
	local szTabName = "";
	local bNotUseExtpoint = 0;
	local nRoleIdx = 0;
	
	local tbroleinfo = TB_ACCOUNT_ROLENAME_INFO[szAccount];
	if (tbroleinfo) then
	--for szaccount, tbroleinfo in TB_ACCOUNT_ROLENAME_INFO do
		--if (szaccount == szAccount) then		
		for nR = 1, getn(tbroleinfo) do
			if (tbroleinfo[nR][RS_GOLDITEM_ROLENAME] == szName) then
				SetTask(RS_TASKID_ISTAKED, 2); -- ����ʺ��ڴ˱���(��ɫ��ƥ��)
			end
			
			if (nLevel >= tbroleinfo[nR][RS_GOLDITEM_LEVEL] and nSeries == tbroleinfo[nR][RS_GOLDITEM_SERIES] and nSex == tbroleinfo[nR][RS_GOLDITEM_SEX] and nTotalTime > tbroleinfo[nR][RS_GOLDITEM_OLTOTALTIME]) then
				SetTask(RS_TASKID_ISTAKED, 2); -- ����ʺ��ڴ˱���(��ɫ����ƥ��)
			end
			szTabName = tbroleinfo[nR][RS_GOLDITEM_ROLENAME];
			bNotUseExtpoint = rs_Is_NotUseBit_Extpoint(nR);
			nRoleIdx = nR;
			break;
		end
		
		local nFindTask = GetTask(RS_TASKID_ISTAKED);
		local nItemIdxTask = GetTask(RS_TASKID_ITEMINDEX);
		
		if (nFindTask >= 2) then
			-- ȷ������δ����ȡ...
			if (bNotUseExtpoint == 1) then
				return nRoleIdx, szTabName;
			--�������ȡ����,���Ƿ�δ��ȡ��
			elseif (nFindTask >= 2 and nItemIdxTask > 0 and nItemIdxTask < getn(TB_ROLENAME_GOLDITEM_INFO[szTabName])) then
				print("rs_check_istaked Idx:"..nRoleIdx.." Name:"..szTabName);
				return nRoleIdx, szTabName;
			end;

			rs_error_talk(1); -- �ʺ��ڱ��У���������ȡ(�������쳣)
			
			if (nFindTask == 2) then
				local szLogMsg = "[GoldEqItem Restore] Error\t"..date().."\tName:"..szName.."\tAccount:"..szAccount.."\tMaybe_Need_ResetExtPoint"
				WriteLog(szLogMsg);
				SetTask(RS_TASKID_ISTAKED, 3); -- �ڴ˱��У�����дLog
			end
			return 0;
		end -- if (nFindTask >= 2)
	end;--if Account Table
	
	SetTask(RS_TASKID_ISTAKED, -1); -- ���ڴ˱���
	rs_error_talk(1);
	return 0;
end

--main
function restore_golditem()
	-- ֻ��Խ�ϰ汾���д˹���
	if (SYSCFG_PRODUCT_REGION_ID ~= DEF_PRODUCT_REGION_VN) then
		return
	end;
	local nRoleIdx, szRoelName = rs_check_istaked();
	if (nRoleIdx == 0) then
		return
	end;	
	
	local szMsg = rs_getitem_msg(szRoelName);
	Describe("Trang b� b� m�t c�a b�n g�m: <enter>"..szMsg.."<enter>b�y gi� nh�n l�i ch�? <enter>Tr��c ti�n xin <color=red>s�p x�p l�i h�nh trang<color> �� <color=red>c� �� ch� tr�ng<color>ch�a trang b�!", 2, "Nh�n ngay b�y gi�!/sure2restore_golditem", "L�t n�a quay l�i /cancel");
end;

function sure2restore_golditem()
	local nRoleIdx, szRoleName = rs_check_istaked();
	if (nRoleIdx == 0) then
		return
	end;
	
	if (CalcFreeItemCellCount() < 60) then
	--Ҫ����һ�����ϵĿռ�
		rs_error_talk(3);
		return
	end;
	
	local tbLostGlodItem = TB_ROLENAME_GOLDITEM_INFO[szRoleName];
	local nGoldItemIdx = GetTask(RS_TASKID_ITEMINDEX);
	local nItemCount = getn(tbLostGlodItem);
	if (nGoldItemIdx < 0 and nGoldItemIdx > nItemCount) then
		print("Error!!!Take LostGoldItem Error!")
		return 
	end;
	local nAddCount = nGoldItemIdx + 10;
	if (nAddCount > nItemCount) then
		nAddCount = nItemCount;
	end;
	local nCount = 0;
	for i = nGoldItemIdx + 1, nAddCount do
		local szGoldEqName, nItemVer, nRandseed, nQ, nG, nD, nL, nS, nLucky, nMagic0, nMagic1, nMagic2, nMagic3, nMagic4, nMagic5, nMagic6, _, nMaxD, nCurD, _ = unpack(tbLostGlodItem[i]);
		local nItemIdx = AddItemEx(nItemVer, nRandseed, nQ, nG, nD, nL, nS, nLucky, nMagic0, nMagic1, nMagic2, nMagic3, nMagic4, nMagic5, nMagic6);
		if (nItemIdx > 0) then
			nCount = nCount + 1;
			
			if (nMaxD ~= -1) then
				SetMaxDurability(nItemIdx, nMaxD);
				SetCurDurability(nItemIdx, nCurD);
			end;
			
			local szItemName = GetItemName(nItemIdx);
			local szLogMsg = "[GoldEqItem Restore]\t"..date().."\tName:"..GetName().."\tAccount:"..GetAccount().."\t taked "..szItemName
			if (GetName() ~= szRoleName) then
				szLogMsg = "[GoldEqItem Restore]\t"..date().."\tName:"..GetName().."(OrgName:"..szRoleName..")\tAccount:"..GetAccount().."\t taked "..szItemName;
			end;
			WriteLog(szLogMsg);
		else
			print("[GoldEqItem Restore] Error!!! AddItem Failed!!! GoldEqItem Name :"..szGoldEqName);
			WriteLog("[GoldEqItem Restore] Error!!! AddItem Failed!!! GoldEqItem Name :"..join(tbLostGlodItem[i]));
			break
		end;
	end;
	
	SetTask(RS_TASKID_ITEMINDEX, nAddCount);
	
	if (rs_Is_NotUseBit_Extpoint(nRoleIdx) == 1) then
		rs_Set_Bit_Extpoint(RS_EXTPOINT_GOLDITEM, nRoleIdx);
	end;
	
	local szMsg = "";
	local szLog = "";
	if (nAddCount == nItemCount) then
		SetTask(RS_TASKID_ISTAKED, 1);
		szMsg = "<enter>Qu� kh�ch �� nh�n �� h�t trang b� b� m�t!";
		szLog = " Taked Over!!";
	else
		szMsg = "<enter>Qu� kh�ch c�n <color=red>"..(nItemCount - nAddCount).."<color> b� trang b� ch�a nh�n. Xin <color=red>s�p x�p l�i h�nh trang<color> tr��c!";
		szLog = " Leave "..(nItemCount - nAddCount).."";
	end;
	
	if (nCount == (nAddCount - nGoldItemIdx)) then
		Describe("Xin nh�n l�i trang b� �� m�t! Ch�n th�nh c�m �n qu� kh�ch"..szMsg, 1, "K�t th�c ��i tho�i/gsp_cancel");
		WriteLog("[GoldEqItem Restore]\t"..date().."\tName:"..GetName().."\tAccount:"..GetAccount().."\t Taked LostGoldEqItem Count:"..(nAddCount)..szLog);
	else
		rs_error_talk(4);
		WriteLog("[GoldEqItem Restore]\t"..date().."\tName:"..GetName().."\tAccount:"..GetAccount().."\t Taked Error!! The Count Is Wrong!!"..nCount.."/"..(nAddCount - nGoldItemIdx).."(takedcount/totalcount)");
	end;
end;

-- ��������(1-3)����ȡ��չ��λ��λ��
function rs_Get_Bit_Extpoint(nIndex)
	return (RS_BIT_BASE + nIndex);
end

function rs_Is_Bit_Extpoint() --nExtP, nZone)
	--local nBit = RS_BIT_EXTPOINT_RANGE^(nZone - 1) + (nZone - 1);
	local nExtPointV = GetExtPoint(RS_EXTPOINT_GOLDITEM);
	for i = 1, 3 do
		if (GetBit(nExtPointV, rs_Get_Bit_Extpoint(i)) == 0) then
			return i;
		end;
	end;
	return 0;
end;

-- �Ƿ�δʹ�õ���չ��λ(nIndex:1-3)
function rs_Is_NotUseBit_Extpoint(nIndex) --nExtP, nZone)
	--local nBit = RS_BIT_EXTPOINT_RANGE^(nZone - 1) + (nZone - 1);
	local nExtPointV = GetExtPoint(RS_EXTPOINT_GOLDITEM);
	local nBit = rs_Get_Bit_Extpoint(nIndex);
	if (GetBit(nExtPointV, nBit) == 0) then
			return 1;
	end;
	return 0;
end;

function rs_Set_Bit_Extpoint(nExtP, nIndex)
	local nBit = rs_Get_Bit_Extpoint(nIndex);
	local nPoint = 2^(nBit-1); -- nBit��1��ʼ����
	AddExtPoint(nExtP, nPoint);
end;

function rs_getitem_msg(szName)
	local szMsg = "T�ng c�ng "..getn(TB_ROLENAME_GOLDITEM_INFO[szName]).."b�!";
	local nGoldItemIdx = GetTask(RS_TASKID_ITEMINDEX);
	if (nGoldItemIdx < 0  or nGoldItemIdx > getn(TB_ROLENAME_GOLDITEM_INFO[szName])) then
		return
	end;
	szMsg = szMsg.."v�n c�n <color=yellow>"..(getn(TB_ROLENAME_GOLDITEM_INFO[szName]) - nGoldItemIdx).."<color> b� ch�a nh�n<enter>";
	for i = (nGoldItemIdx + 1), getn(TB_ROLENAME_GOLDITEM_INFO[szName]) do
		szMsg = szMsg.."<color=yellow>"..TB_ROLENAME_GOLDITEM_INFO[szName][i][1].."<color>,";
	end;
	--szMsg = szMsg.."��<color=yellow>"..getn(TB_ROLENAME_GOLDITEM_INFO[szName]).."<color>����";
	return szMsg;
end;