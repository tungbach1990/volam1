IncludeLib("LEAGUE")
IncludeLib("TITLE")
Include("\\script\\lib\\gb_modulefuncs.lua");
TASK_ACTIVE_TITLE = 1122
CW_TITLE_TIME = 7*24*60*60*18;
TB_CITYWAR_ARRANGE = {
				{3,4},--����
				{1,2},--�ɶ�
				{2,3},--����
				{5,6},--�꾩
				{4,5},--����
				{0,1},--����
				{6,0},--�ٰ�
			}
			
-----���򹥳�ս���� start
function AskDeal()
	Say("D�ng c� h� tr� c�ng th�nh chi�n c�c k� hi�u d�ng, ch� c� th� d�ng Nguy�n b�o �� mua! Kh�ch quan n�u b� l� kh�ng mua th� th�t v� c�ng ��ng ti�c!", 4, 
	--"��ʯ��/DealBuy", 
	"Nghi�t Long Xung Xa/#DealBuy(1)", 
	"V�n K� Binh ph� /#DealBuy(2)", 
	"Ngoan C� Binh ph� /#DealBuy(3)", 
	"Kh�ng c�n ��u/OnCancelBuy");
end;

function DealBuy(ItemID)
	if (ItemID == 0) then
		SetTaskTemp(15, 29);
	elseif (ItemID == 1) then
		SetTaskTemp(15, 30);
	elseif (ItemID == 2) then
		SetTaskTemp(15, 31);
	elseif (ItemID == 3) then
		SetTaskTemp(15, 32);
	else
		return
	end;
	Say("Do qu� nhi�u ng��i mua! Kh�ch quan ch� c� th� mua m�t l�n m� th�i!C� ��ng � kh�ng?", 2, "Mu�n/DoBuy", "ta ngh� l�i xem /OnCancelBuy");
end;

function DoBuy()
	TheItem = GetTaskTemp(15);
	if (TheItem >= 29 and TheItem <= 32) then
		if (GetItemCountEx(343) > 0) then
			DelItemEx(343);
			AddItem(6,1,TheItem,1,0,0);
			WriteLog(format("%s d�ng kim nguy�n b�o 343 �� mua 1 ��o c� c�ng th�nh >> %s",GetName(),TheItem));
			Say("Kh�ch quan th�t bi�t xem h�ng!", 0);
		else
			Say("Kh�ch quan �ang tr�u ch�c ti�u nh�n hay th�t s� kh�ng c� Nguy�n B�o?", 0);
		end;
	end;
end;
function OnCancelBuy()
	Say("Ch�c ngh�a s� k� khai ��c th�ng, s�m ca kh�c kh�i ho�n!", 0);
end;
-----���򹥳�ս���� end

--��õ�7��� 20:00�� ��ʱ����
function getUsedLine()
	local nh = tonumber(GetLocalDate("%H"));
	local nm = tonumber(GetLocalDate("%M"));
	return (CW_TITLE_TIME-((nh-20)*60+nm)*60*18);
end;

--��õ�ǰ��������ս�ĳ���
--nSel=1,������nSel=2,����
function getSigningUpCity(nSel)
	local nWeek = tonumber(GetLocalDate("%w"));
	for i = 1, getn(TB_CITYWAR_ARRANGE)do
		if (TB_CITYWAR_ARRANGE[i][nSel] == nWeek) then
			return i;
		end;
	end;
end;

-- ����콱����
function check_award_condition(city_index, show_talk)
	if (city_index == 0) then
		if (show_talk == 1) then
			Talk(1, "", "<#> Ch� c� bang ph�i chi�m ���c th�nh th� m�i nh�n ���c ph�n th��ng, h�y d�n anh em c�a m�nh �i chi�m m�t th�nh n�o �i!")
		end
		return 0
	end
	
	--local tong_master = GetTongMaster()
	--local player_name = GetName()
	--if (tong_master ~= player_name) then
--		if (show_talk == 1) then
	--		Talk(1, "", "<#>ֻ�а���������ȡ��ά���������ǰ�������")
		--end
		--return 0
	--end
	
	local wday = tonumber(GetLocalDate("%w"))	-- ���������ڼ���
	local hour = tonumber(GetLocalDate("%H"))
	if (wday ~= 1 or hour < 9 or hour >= 20) then
		if (show_talk == 1) then
			Talk(1, "", "<#> M�i tu�n t� 9:00~20:00 l� th�i gian l�nh th��ng, ��n gi� �� t�i �i")
		end
		return 0
	end

	local ndate = tonumber(GetLocalDate("%Y%m%d"))
	if (ndate == get_citybonus_task(city_index, CITYINFO_LEAGUETASK_BONUS)) then
		if (get_city_orecount(city_index) <= get_citybonus_task(city_index, CITYINFO_LEAGUETASK_COUNT)) then
			if (show_talk == 1) then
				Talk(1, "", "<#>Ph�n th��ng tu�n n�y �� nh�n h�t, tu�n sau h�y ��n nh�.")
			end
			return 0
		end;
	else
		set_citybonus_task(city_index, CITYINFO_LEAGUETASK_BONUS, ndate);
		set_citybonus_task(city_index, CITYINFO_LEAGUETASK_COUNT, 0);
	end

	return 1
end

TSK_CITYTONG_DATE = 2518
-- ��ȡռ�ǰ�ά��
function talk_citytong_award()
	local city_index = gettongownercity()
	if (check_award_condition(city_index, 1) == 1) then
		Say("<#>Ph�n th��ng bang chi�m th�nh. Th�nh vi�n bang chi�m th�nh c� th� �i t�m V� l�m truy�n nh�n �� nh�n ph�n th��ng huy�n tinh c�p 5, m�i ng��i c� th� nh�n 1 vi�n. Gi�i h�n: �� Th�nh (L�m An v� Bi�n Kinh) nh�n 300 vi�n c�p 5, Th�nh Th� (nh�ng th�nh th� kh�c) nh�n 200 vi�n huy�n tinh c�p 5. N�u sau 18h00 v�n ch�a nh�n h�t th� bang ch� tr��c 20h00 c� th� nh�n s� c�n l�i.",
			3,
			"<#>Ta mu�n nh�n huy�n tinh kho�ng th�ch/#take_tong_award(1)",
			"<#>Ta l� bang ch�, ��n �� nh�n ph�n th��ng c�n l�i/take_tong_resaward",
			"<#> T�m th�i ta kh�ng l�nh ��u/nothing")
	end
end

-- ��ȡ���
function take_tong_award(count)
	-- һ�����ռһ������
	if (CalcFreeItemCellCount() < count) then
		Talk(1, "", "<#> H�nh trang c�a ng��i �� ��y, ch�nh l� l�i xong m�i ��n l�nh th��ng.")
		return
	end
	
	local city_index = gettongownercity()
	if (check_award_condition(city_index, 0) == 0) then
		return
	end
	
	local nH = tonumber(GetLocalDate("%H"));
	if (nH >= 18) then
		Talk(1, "", "<#>Th�i gian nh�n th��ng c�a m�i bang h�i t� 9h00 ��n 18h00, h�y ��n ��ng gi� n�y �� nh�n th��ng. ��i v�i ph�n th��ng ch�a ���c nh�n, h�y th�ng b�o cho bang ch� ��n nh�n tr��c 20h00.");
		return 0;
	end;
	local today = tonumber(GetLocalDate("%Y%m%d"));
	local nMydate = GetTask(TSK_CITYTONG_DATE);
	if (nMydate ~= today) then
		AddItem(6,1,147,5,1,1);
		SetTask(TSK_CITYTONG_DATE, today);
		add_citybonus_task(city_index, CITYINFO_LEAGUETASK_COUNT, 1);
	local msg =	format("%s %s (%s) nh�n %s huy�n tinh c�p 5 t� Kim s�n ch��ng m�n nh�n",GetLocalDate("[%y-%m-%d %H:%M] "),GetAccount(),GetName(),count)
		WriteLog(msg);
		Talk(1, "", "<#>��y l� ph�n th��ng c�a ng��i, h�y nh�n l�y.")
	else
		Talk(1, "", "<#>Ng��i �� nh�n ph�n th��ng tu�n n�y r�i, ��i tu�n sau nh�?");
	end
end

function take_tong_resaward()
	local city_index = gettongownercity()
	if (check_award_condition(city_index, 0) == 0) then
		return
	end
	
	local nH = tonumber(GetLocalDate("%H"));
	if (nH < 18 or nH >= 20) then
		Talk(1, "", "<#>Bang ch� v�o m�i th� hai c� th� ��n nh�n ph�n th��ng c�n l�i tr��c 18h00 ��n 20h00, h�y ��n ��ng gi� �� nh�n.");
		return 0;
	end;
	
	if (GetName() ~= GetTongMaster()) then
		Talk(1, "", "<#>Ch� c� bang ch� m�i c� th� nh�n ph�n th��ng bang h�i c�n l�i. H�y th�ng b�o cho bang ch� qu� bang ��n ��y nh�n tr��c 20h00.");
		return 0;
	end;
	
	local nFreecell = CalcFreeItemCellCount();
	if (nFreecell < 20) then
		Talk(1, "", "<#>H�nh trang kh�ng �� ch� tr�ng, h�y s�p x�p l�i h�nh trang.")
		return 0;
	end;
	
	local nCount = get_city_orecount(city_index) - get_citybonus_task(city_index, CITYINFO_LEAGUETASK_COUNT);
	
	for i = 1, nCount do
		AddItem(6,1,147,5,1,1);
	end;
	add_citybonus_task(city_index, CITYINFO_LEAGUETASK_COUNT, nCount);
	local msg =	format("%s %s (%s) nh�n %s huy�n tinh c�p 5 t� Kim s�n ch��ng m�n nh�n",GetLocalDate("[%y-%m-%d %H:%M] "),GetAccount(),GetName(),count)
	WriteLog(msg);
	Say(format("��y l� ph�n th��ng c�a qu� bang, %s vi�n huy�n tinh c�n l�i!",nCount), 0);
end;

function get_city_orecount(cityid)
	if (cityid == 4 or cityid == 7) then
		return 300;
	else
		return 200;
	end;
end;
--------------------------------------------------------------------------------
--�õ�һ��������ڰ��ռ��ĳ���,��������ֵ
function gettongownercity()
	--�õ���Ұ������
	local strTongName = GetTongName()
	if (strTongName == nil or strTongName == "") then
		return 0
	end

	--�ֱ�õ��ߴ���еİ����������Ұ�����ƶԱ�
	local strCityTongName

	for nCityID=1, 7 do
		strCityTongName = GetCityOwner(nCityID)
		if (strCityTongName ~= "" and strCityTongName == strTongName) then 
			return nCityID
		end
	end
	
	--��ʾ������ڵİ��û��ռ�����
	return 0
end

--���Ϊnil��0������1�����򷵻�0
function FALSE(nValue)
	if (nValue == nil or nValue == 0 or nValue == "") then
		return 1
	else
		return nil
	end
end

LEAGUETYPE_CITYWAR_SIGN = 508;
LEAGUETYPE_CITYWAR_FIRST = 509;
function checkCityWarLeague()
	for i = 1, 7 do
		local szLg = cityid_to_lgname(i);
		local nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_SIGN, szLg);
		if (FALSE(nlid)) then
			local nNewLeagueID = LG_CreateLeagueObj()	--�����������ݶ���(���ض���ID)
			LG_SetLeagueInfo(nNewLeagueID, LEAGUETYPE_CITYWAR_SIGN, szLg)	--����������Ϣ(���͡�����)
			local ret = LG_ApplyAddLeague(nNewLeagueID, "", "");
			LG_FreeLeagueObj(nNewLeagueID);
		end;
		
		nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_FIRST, szLg);
		if (FALSE(nlid)) then
			local nNewLeagueID = LG_CreateLeagueObj()	--�����������ݶ���(���ض���ID)
			LG_SetLeagueInfo(nNewLeagueID, LEAGUETYPE_CITYWAR_FIRST, szLg)	--����������Ϣ(���͡�����)
			local ret = LG_ApplyAddLeague(nNewLeagueID, "", "");
			LG_FreeLeagueObj(nNewLeagueID);
		end;
	end;
end;

function cityid_to_lgname(nCityID)
	return GetCityAreaName(nCityID);
end;

--����һ̨��������ִ�м���
--���ԣ��ж��л�ɽ�ĵ�ͼ

--Relayִ������ ���Ƿ�
function citywar_appointchallenger(szCityName, szTongName)
	if (SubWorldID2Idx(2) >= 0 and not FALSE(szCityName) and not FALSE(szTongName)) then
		AppointChallenger(szCityName, szTongName)
	end;
end;

--Relayִ������ ����
function citywar_appointviceroy(szCityName, szTongName)
	if (SubWorldID2Idx(2) >= 0 and not FALSE(szCityName) and not FALSE(szTongName)) then
		AppointViceroy(szCityName, szTongName)
	end;
end;
