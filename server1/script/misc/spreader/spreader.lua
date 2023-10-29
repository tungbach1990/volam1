-------------------------------------------------------------------------
-- FileName		:	spreader.lua
-- Author		:	lailigao
-- CreateTime	:	2005-06-03 10:15:37
-- Desc			:	��Ϸ�ƹ�Աϵͳ
-- Include("\\script\\misc\\spreader\\spreader.lua")
---------------------------------------------------------------------------

IncludeLib("SPREADER")

Include("\\script\\global\\systemconfig.lua") -- ϵͳ����
Include("\\script\\shitu\\shitu_head.lua")
Include("\\script\\misc\\spreader\\head.lua")
Include("\\script\\misc\\spreader\\newaccount.lua")
Include("\\script\\global\\rename_head.lua")
Include("\\script\\misc\\rename\\rename_func.lua")
--Include("\\script\\misc\\lostgolditem\\restore_goldeqitem.lua")		--��ȡ��ʧ�ƽ�װ��

function main()
--DinhHQ
--20110322: H� tr� copy nh�n v�t cho gi�i ��u VLMC
	local now = tonumber(GetLocalDate("%Y%m%d"));
	if now >= 20110328 and now <= 20120401 then
		Talk(1, "", "Ch�c n�ng t�m ��ng")
		return
	end
	game_spreader()
end
function game_spreader()
	if (SWITCH_SPREADER ~= 1) then
		Talk(1, "", "<color=green>Th�ng c�o<color>: ch�c n�ng n�y ch�a ���c m�, xin xem th�ng b�o c�a trang web!");
		return 0;
	end
	local szOp = 
	{
		"Nh�p cd-key k�ch ho�t t�i kho�n/gsp_input_cdkey",
		"Nh�n ���c ph�n th��ng! /gsp_phase_prize",
		"Nh�n s� �� thi�p ho�ng kim ng��i m�i/gsp_accept_goldcard", 
		"Li�n quan Th�ng c�o.../gsp_about",
		"B�i th��ng cho bang h�i �ang chi�m th�nh/about_castellan_remedy",
		"��t l�i t�n cho nh�n v�t/about_rename_role",		
		"��t l�i t�n cho bang h�i/about_rename_tong",
		"Ng��i ch�i ��i t�n nh�n v�t khi chuy�n sang Server m�i/rename_role_tranfer",
		"Nh�n ti�n gh� qua th�i/gsp_cancel",
		"Nh�n l�i trang b� Ho�ng Kim �� m�t!/restore_golditem",
	};
	
	if (SYSCFG_PRODUCT_REGION_ID	== DEF_PRODUCT_REGION_CN) then -- ��½�汾
		Say("Hoan ngh�nh v�o <color=green>Th�ng c�o<color>, c� g� c�n gi�p ��?", 7,
			szOp[1],
			szOp[2],
			szOp[3],
			szOp[4],
			szOp[5],
			szOp[6],
			szOp[8]);
	elseif (SYSCFG_PRODUCT_REGION_ID	== DEF_PRODUCT_REGION_VN) then -- Խ�ϰ汾	
		Say("Xin h�i c� th� gi�p g� cho qu� kh�ch?", 10,
			szOp[1],
			szOp[2],
			szOp[3],
			szOp[4],
			szOp[5],
			szOp[6],
			szOp[7],
			szOp[8],
			szOp[10],
			szOp[9]);
	else
		Say("Xin h�i c� th� gi�p g� cho qu� kh�ch?", 1,
			szOp[8]);	
	end
end

function gsp_input_cdkey()
	local nValue = GetExtPoint(GSP_ACCOUNT_EXTPOINT);
	local szError;
	
	--if (nValue == GSP_ACCOUNT_TYPE_NEWPLAYER or nValue == GSP_ACCOUNT_TYPE_SPREADERSYS) then
	if (nValue == GSP_ACCOUNT_TYPE_NEWPLAYER) then
		Msg2Player("Ban ch�a l�nh gi�i th��ng gi�i th��ng c�a ho�t ��ng khuy�n m�i! B�y gi� t�ng b�n.");
		gsp_newaccount_gift_core();
		nValue = nValue + 1; -- �˲������ɲ���
	end
	
	if (nValue == GSP_ACCOUNT_TYPE_CDKEY) then
		szError = "T�i kho�n n�y �� k�ch ho�t, kh�ng c�n nh�p cd-key. Nh�ng b�n c� th� kh�ng nh�n ���c th� S� �� Ho�ng Kim, xin li�n h� v�i Vinagame."
		Talk(1, "", "<color=green>Th�ng c�o<color>:"..szError);
		gsp_writeLog(szError);
		return -1;
	end
	
	if (nValue == GSP_ACCOUNT_TYPE_CDKEY_PAY) then
		szError = "T�i kho�n n�y �� k�ch ho�t, kh�ng c�n nh�p cd-key. C�m �n b�n �� �ng h�!"
		Talk(1, "", "<color=green>Th�ng c�o<color>:"..szError);
		-- gsp_writeLog(szError);
		return -1;
	end
	
	AskClientForString("gsp_on_cdkey_input", "", 1, 20, "Xin nh�p cd-key:");
end

function gsp_on_cdkey_input(szCDKey)
	SendSpreaderCDKey(szCDKey);
end

function gsp_about()
	Talk(1, "", "<color=green>Th�ng c�o<color>, xin xem trang web ch�nh th�c.");
end

function gsp_cancel()
end

-- ��ȡ�׶ν���
function gsp_phase_prize()
	local nValue = GetTask(GSP_TASKID_ROLEREINFO);
	if (GetByte(nValue, GSP_TASKID_TAG_BYTE_ROLETYPE) ~= GSP_TASKID_ROLETYPE_CDKEY) then
		Talk(1, "", "<color=green>Th�ng c�o<color>: B�n ch�a s� d�ng cd-key k�ch ho�t t�i kho�n n�y, kh�ng th� l�nh th��ng. M�i chi ti�t xin xem tr�n trang web.");
		return 0;
	end
	
	local nLevel = GetLevel();
	local nBonus = 0;
	local nPrizeLevel = 0;
	local nBit = 0;
	-----------------
	if (nLevel < 30) then
		Talk(1, "", "<color=green>Th�ng c�o<color>: Hi�n ��ng c�p c�a b�n l� "..GetLevel().."c�p, ch�a l�nh gi�i th��ng.<enter>Khi b�n ��n c�p 30, 40, 50, 80 h�y ��n nh�n gi�i th��ng! C� l�n! <enter><enter><color=green>H��ng d�n<color>: Cho ph�p b�n s� d�ng <color=yellow>Ho�ng Kim S� �� thi�p<color>.");
		return 0;
	end
	if (nLevel >= 30 and GetBit(nValue, GSP_TASKID_TAG_BIT_30BONUS) == 0) then
		nPrizeLevel = 30;
		nBit = GSP_TASKID_TAG_BIT_30BONUS;
		nBonus = 300000; -- 30W
	-----------------
	elseif (nLevel >= 40 and GetBit(nValue, GSP_TASKID_TAG_BIT_40BONUS) == 0) then
		nPrizeLevel = 40;
		nBit = GSP_TASKID_TAG_BIT_40BONUS;
		nBonus = 400000; -- 40W
	-----------------
	elseif (nLevel >= 50 and GetBit(nValue, GSP_TASKID_TAG_BIT_50BONUS) == 0) then
		nPrizeLevel = 50;
		nBit = GSP_TASKID_TAG_BIT_50BONUS;
		nBonus = 1000000; -- 100W
	end
	-----------------
	if (nBonus > 0) then
		Earn(nBonus);
	elseif (nLevel >= 80 and GetBit(nValue, GSP_TASKID_TAG_BIT_80BONUS) == 0) then
		nPrizeLevel = 80;
		nBit = GSP_TASKID_TAG_BIT_80BONUS;
		if (gsp_prize_skills90() == 0) then -- ѧ��90������ = 0:ѧϰʧ��
			nPrizeLevel = 0;
			nBit = 0;
		end
	end
	-----------------
	
	if (nPrizeLevel ~= 0) then
		print("Value:"..nValue)
		nValue = SetBit(nValue, nBit, 1); -- ������ȡ���
		print("Value:"..nValue)
		SetTask(GSP_TASKID_ROLEREINFO, nValue);
		Talk(1, "", "<color=green>Th�ng c�o<color>: B�n nh�n ���c"..nPrizeLevel.."ph�n th��ng c�a giai �o�n n�y! C� g�ng n� l�c th�m nh�!");
	else
		Talk(1, "", "<color=green>Th�ng c�o<color>: B�n �� l�nh gi�i th��ng, h�y c� g�ng!");
	end
end

-- CDKEY���������ش���
function gsp_cdkey_verify_result(nResult)

	local szMsg = 
	{
		"Khi ph�t sinh l�i, xin h�y li�n h� v�i GM!",
		"cd-key v� hi�u, xin nh�p ��ng cd-key!",
		"cd-key ch�nh x�c, t�i kho�n �� k�ch ho�t! Ch�o m�ng v�o Th�ng c�o!",
		"Th�t b�i: T�i kho�n �� s� d�ng h�n 10 gi�, kh�ng th� ��ng nh�p v�o l�i!",
		"Th�t b�i: T�i kho�n n�y �� k�ch ho�t, kh�ng th� ��ng nh�p n�a!"
	};
	local nSel = 1;
	if (nResult == GSP_CDKEY_E_CDKEYERROR) then
		nSel = 2;
	elseif (nResult == GSP_CDKEY_ACTION_SUCCESS) then
	 	nSel = 3;
	elseif (nResult == GSP_CDKEY_E_NEWTIMEOUT) then
		nSel = 4;
	elseif (nResult == GSP_CDKEY_E_NEWACTIVED) then
		nSel = 5;
	end

	gsp_writeLog(szMsg[nSel].." result: "..nResult);
	Msg2Player(szMsg[nSel]);
	Talk(1, "", " [<color=green>Th�ng c�o<color>]"..szMsg[nSel]);

	if (nResult == GSP_CDKEY_ACTION_SUCCESS) then
		gsp_config_for_join();
	end
	
	return 1;
end

-- ����ϵͳ�����������Ϣ
function gsp_config_for_join()
	-- ����CDKEY����
	local nValue = GetExtPoint(GSP_ACCOUNT_EXTPOINT);
	AddExtPoint(GSP_ACCOUNT_EXTPOINT, GSP_ACCOUNT_TYPE_CDKEY - nValue);
	
	gsp_accept_goldcard();
end

-- ���ܻƽ�ʦͽ��
function gsp_accept_goldcard()
	-- ���ý�ɫ���� for spreader
	SetTask(GSP_TASKID_ROLEREINFO, 0); -- �����㣬���ޱ�Ҫ��
	local nTaskValue = 0;
	nTaskValue = SetByte(nTaskValue, GSP_TASKID_TAG_BYTE_ROLETYPE, GSP_TASKID_ROLETYPE_CDKEY);
	SetTask(GSP_TASKID_ROLEREINFO, nTaskValue);
	--print("GSP_TASKID_ROLEREINFO:"..nTaskValue);
	-- ������չ������
	AddExtPoint(GSP_ACCOUNT_EXTPOINT, 1);
	
	-- �ͻƽ�ʦͽ������ǻƽ�ͽ��
	AddItem(6, 1, 441, 1, 0, 0); -- �ƽ�ʦͽ��
	SetTask(TKID_GOLD_APPRENTICE, 1); -- ��ǽ�ɫΪ�ƽ�ͽ��
	
	local szMsg = "B�n nh�n ���c <color=yellow>Th� Ho�ng Kim S� ��<color>! D�ng n� �� b�i s�, b�n v� s� ph� ��u s� nh�n ���c nhi�u ph�n th��ng!"; 
	Msg2Player(szMsg);
	Talk(1, "", "<color=green>Th�ng c�o<color>:"..szMsg);
	-- gsp_writeLog("��ûƽ�ʦͽ��");
end

------------------
-- 90������
SKILLS_90 = {
	{	{318,1},{319,1},{321,1}}, --����
	{	{322,1},{323,1},{325,1}}, --����
	{	{339,1},{302,1},{342,1},{351,0}}, --����
	{	{353,1},{355,1},{390,0}}, --�嶾
	{	{328,1},{380,1},{332,0}}, --����
	{	{336,1},{337,1}}, --����
	{	{357,1},{359,1}}, --ؤ��
	{	{361,1},{362,1},{391,0}}, --����
	{	{365,1},{368,1}}, --�䵱
	{	{372,1},{375,1},{394,0}}, --����
}

function gsp_prize_skills90()
	local faction = GetLastFactionNumber()
	if(faction ~= -1) then
		for i=1,getn(SKILLS_90[faction+1]) do
			-- û��ѧ�����ż��ϣ���������ԭ���ļ���
			if (HaveMagic(SKILLS_90[faction+1][i][1]) == -1) then
				AddMagic(SKILLS_90[faction+1][i][1],SKILLS_90[faction+1][i][2])
			end
		end
		Msg2Player("Ch�c m�ng b�n �� v��t qua th� th�ch c�a <color=green>Th�ng c�o<color>, c� th� l�nh ng� k� n�ng c�p 90 ")
		AddGlobalNews("M�i ng��i c�ng nhau ch�c m�ng"..GetName().."Thu�n l�i th�ng qua th� th�ch c�a Th�ng c�o c� th� l�nh ng� k� n�ng c�p 90 c�a b�n m�n.")
		return 1;
	end
	Msg2Player("B�n ch�a nh�p m�n! Kh�ng th� l�nh ng� ���c k� n�ng c�p 90!")
	Talk(1, "", "B�n ch�a nh�p m�n! Kh�ng th� l�nh ng� ���c k� n�ng c�p 90!");
	return 0;
end

-- ����Ƿ���ԭռ�ǰ�Ჹ��
function check_castellan_remedy()
	if (GetBit(GetTask(TASKVALUE_BLEND), 3) == 1) then
		return 1;
	end
	return 0;
end

-- �����ԭռ�ǰ�Ჹ���������
function clear_castellan_remedy()
	local value = GetTask(TASKVALUE_BLEND)
	value = SetBit(value, 3, 0)
	SetTask(TASKVALUE_BLEND, value)
end

-- ԭռ�ǰ�Ჹ��
function about_castellan_remedy()
	if (check_castellan_remedy() == 1) then
		Say("<#> Do c� ph�t sinh tr�c tr�c n�n h� th�ng �� x� l� sai quy�n h�n c�a b�n! Ch�ng t�i k�p t�c b�i th��ng! B�n c� mu�n nh�n b�i th��ng ngay b�y gi� kh�ng?",
			2,
			"<#> Ta mu�n nh�n b�i th��ng/take_castellan_remedy",
			"<#> L�n sau ��n nh�n/cancel");
	else
		deny()
	end
end

-- ��ȡԭռ�ǰ�Ჹ��
function take_castellan_remedy()
	Say("<#> M�i Bang h�i chi�m th�nh nh�n ���c ph�n th��ng b�i th��ng: 60 c�i th�n b� ��i h�ng bao (Do bang ch� nh�n l�y) v� 500000000 l��ng (Tr�c ti�p ��a v�o ng�n qu� Bang h�i) . Xin h�y x�c nh�n c�n kho�ng tr�ng tr�n h�nh trang, b�n mu�n nh�n ngay b�y gi� ch�?",
		2,
		"<#> Ta mu�n nh�n ngay/take_castellan_remedy2",
		"<#> L�n sau ��n nh�n/cancel")
end

function take_castellan_remedy2()
	if (check_castellan_remedy() == 1) then
		for i = 1, 60 do
			AddItem(6, 1, 402, 0, 0, 0, 0)
		end
		local now = date("%Y-%m-%d %H:%M:%S")
		local name = GetName()
		WriteLog(now .. " B�i th��ng cho bang h�i �ang chi�m th�nh" .. name .. "nh�n ���c 60 th�n b� ��i h�ng bao")
		Msg2Player("<#> B�n nh�n ���c 60 c�i th�n b� ��i h�ng bao")

		tong, res = GetTong()
		if (res == 1 and tong ~= "") then
			local money = 500000000
			AddTongMoney(tong, money)
			WriteLog(now .. " B�i th��ng cho bang h�i �ang chi�m th�nh" .. name .. "Bang h�i hi�n t�i" .. tong .. "nh�n ���c 60 th�n b� ��i h�ng bao")
			Msg2Player("<#> Bang h�i c�a b�n nh�n ���c" .. money .. " l��ng")
		end
		clear_castellan_remedy()
	end
end

-- ������Ҹ��Ľ�ɫ���Ի�
function about_rename_role()
	local strInfo = "<#> Ch�o b�n! V� t�n nh�n v�t c�a b�n v� ng��i ch�i kh�c gi�ng nhau, cho n�n h� th�ng �� gi�p b�n ��i t�n, b�n c� th� s�a t�n nh�n v�t c�a b�n tr��c ��y, c� th� ki�m tra xem t�n �� c� d�ng ���c kh�ng. Ch� �! B�n ch� c� 1 c� h�i duy nh�t �� ��i t�n, xin h�y c�n th�n t�ng b��c.";
	local strError= "<#> Xin l�i! B�n kh�ng th� ti�n h�nh thao t�c n�y. ( Ch� c� th� thay ��i t�n Nh�n v�t, t�n Bang h�i, t�n bang ch� c�a bang h�i chi�m th�nh) . Xin li�n h� v�i GM �� bi�t th�nm chi ti�t";
	func_online_rename_role(strInfo, strError);
end

function rename_role_tranfer()
	local strInfo = "<#>B�n ch� c� duy nh�t 1 c� h�i �� ��i t�n nh�n v�t. C� th� xem tr��c �� l�a ch�n. Xin xem k� c�c th�ng tin tr��c khi quy�t ��nh!";
	local strError= "<#> B�n kh�ng th� th�c hi�n thao t�c n�y! Ch� ng��i �ang chuy�n Server m�i c� th� ti�nh h�nh. Xin li�n h� v�i b� ph�n ph�c v� �� bi�t th�m chi ti�t!";
	func_online_rename_role(strInfo, strError);
end

-- ���������İ����
function about_rename_tong()
	if (GetTongMaster() ~= GetName()) then
		Talk(1, "", "<#> Ch� c� bang ch� m�i c� th� thay ��i t�n Bang h�i")
	else
		local TongName, res = GetTong()	
		if (res == 1 and TongName ~= "") then	
			local strS = strfind(TongName,"@") or 0	
			if  strS > 0 then
				SetTask(TASKVALUE_BLEND, SetBit(GetTask(TASKVALUE_BLEND),2,1))
			end
			if (check_renametong() == 1) then
				Say("<#> Ch�o b�n! V� t�n nh�n v�t c�a b�n v� ng��i ch�i kh�c gi�ng nhau, cho n�n h� th�ng �� gi�p b�n ��i t�n, b�n c� th� s�a t�n nh�n v�t c�a b�n tr��c ��y, c� th� ki�m tra xem t�n �� c� d�ng ���c kh�ng. Ch� �! B�n ch� c� 1 c� h�i duy nh�t �� ��i t�n, xin h�y c�n th�n t�ng b��c.",
					3,
					"<#> Ki�m tra t�n Bang h�i c�n s� d�ng ���c kh�ng?/query_tongname",
					"<#> S�a ��i t�n Bang h�i c�a m�nh/change_tongname",
					"<#> �� l�n sau ta thay ��i v�y/cancel")
			else
				deny()
			end
		end
	end
end

-- ��ѯ�����
function query_tongname()
	AskClientForString("on_query_tongname", "", 1, 8, "<#> Xin nh�p t�n Bang h�i mu�n t�m hi�u");
end

function on_query_tongname(new_tong)
	if (check_renametong() == 1) then
		QueryTongName(new_tong)
	end
end

-- ���İ����
function change_tongname()
	Say("<#> C�c b��c c� th�: ��i tho�i v�i NPC, nh�p t�n bang h�i c�n thay ��i v�o, b�n s� t� ��ng r�i m�ng. Sau 3 ph�t ��ng nh�p l�i, n�u t�n bang h�i �� thay ��i th� ���c xem ��i t�n th�nh c�ng; n�u ch�a thay ��i, m�i b�n th�c hi�n l�i c�c b��c tr�n. N�u xu�t hi�n m�t s� hi�n t��ng l� xin li�n h� GM gi�i quy�t.", 
		2,
		"<#> B�t ��u thay ��i t�n Bang h�i/change_tongname2",
		"<#> �� ta suy ngh� l�i/cancel");
end

function change_tongname2()
	AskClientForString("on_change_tongname", "", 1, 8, "<#> Xin nh�p t�n Bang h�i m�i v�o");
end

function on_change_tongname(new_tong)
	if (GetTongMaster() ~= GetName()) then
		Talk(1, "", "<#> Ch� c� bang ch� m�i c� th� thay ��i t�n Bang h�i")
	elseif (check_renametong() == 1) then
		old_tong, res = GetTong()
		local strS = strfind(new_tong,"@") or 0				
		if (res == 1 and old_tong ~= "") then
			if (old_tong == new_tong) then
				Say("<#> Kh�ng th� thay ��i t�n Bang h�i gi�ng nhau", 1, "<#> Bi�t r�i!/cancel")
			elseif strS > 0 then
				Say("<#> Kh�ng th� thay ��i t�n Bang h�i c� k� t� ��c bi�t", 1, "<#> Bi�t r�i!/cancel")
			else
				RenameTong(old_tong, new_tong)
			end
		end
	end
end

function deny()
	Say("<#> Xin l�i! B�n kh�ng th� ti�n h�nh thao t�c n�y. ( Ch� c� th� thay ��i t�n Nh�n v�t, t�n Bang h�i, t�n bang ch� c�a bang h�i chi�m th�nh) . Xin li�n h� v�i GM �� bi�t th�nm chi ti�t",
		1,
		"<#> Bi�t r�i!/cancel")
end
