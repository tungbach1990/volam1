--�û�ѡ�������й�ʱ�Ľű�
--2004.11.24
Include("\\script\\global\\baijuwanhead.lua");
Include("\\script\\global\\judgeoffline_limit.lua");		-- 2006��10��30�ռ������������г��г����Ժ��������йܵĽű�  by peres
Include("\\script\\item\\ib\\zimudai.lua");
Include("\\script\\lib\\player.lua")
Include("\\script\\trip\\define.lua")

arraymap = 
	{
		["1"] = "Ph��ng T��ng",
		["11"] = "Th�nh ��",
		["37"] = "Bi�n Kinh",
		["80"] = "D��ng Ch�u",
		["78"] = "T��ng D��ng",
		["162"] = "��i L�",
		["176"] = "L�m An",
		["20"] = "Giang T�n Th�n",
		["53"] = "Ba L�ng huy�n",
		["54"] = "Nam Nh�c tr�n",
		["99"] = "V�nh L�c tr�n",
		["100"] = "Chu Ti�n tr�n",
		["101"] = "��o H��ng th�n",
		["121"] = "Long M�n tr�n",
		["153"] = "Th�ch C� tr�n",
		["174"] = "Long Tuy�n th�n",
		["13"] = "Nga Mi",
		["25"] = "���ng M�n",
		["49"] = "Thi�n Nh�n",
--		["59"] = "����",
		["81"] = "V� �ang",
		["103"] = "Thi�u L�m",
		["115"] = "C�i Bang",
		["131"] = "C�n L�n",
		["154"] = "Th�y Y�n",
		["183"] = "Ng� ��c",
--		["208"]	= "����",	--by �ӷ��� 2007/11/13 ��ֹ�����й�
		-- LLG_ALLINONE_TODO_20070802
		["235"] = "��o Hoa ��o (1) ",
		["236"] = "��o Hoa ��o (2) ",
		["237"] = "��o Hoa ��o (3) ",
		["238"] = "��o Hoa ��o (4) ",
		["239"] = "��o Hoa ��o (5) ",
		["240"] = "��o Hoa ��o (6) ",
		["241"] = "��o Hoa ��o (7) ",
		["835"] = "V� Danh C�c (1)",
		["836"] = "V� Danh C�c (2)",
		["837"] = "V� Danh C�c (3)",
		["838"] = "V� Danh C�c (4)",
		["839"] = "V� Danh C�c (5)",
		["840"] = "V� Danh C�c (6)",
		["586"] = "Khu v�c bang h�i chung",
		["587"] = "Khu v�c bang - Th�nh ��",
		["588"] = "Khu v�c bang - ��i L�",
		["589"] = "Khu v�c bang - Ph��ng T��ng",
		["590"] = "Khu v�c bang - L�m An",
		["591"] = "Khu v�c bang - T��ng D��ng",
		["593"] = "Khu v�c bang - D��ng Ch�u",
		["594"] = "Khu v�c bang - Bi�n Kinh",
		["595"] = "Khu v�c bang h�i chung",
		["596"] = "Khu v�c bang h�i chung",
		["597"] = "Khu v�c bang h�i chung",
	};

function judgeoffline(player_count, offline_count)
		
	-- szHour = date("%H");
	-- nHour = tonumber(szHour);
	
	-- sparetime = GetTask(AEXP_TASKID);	
	-- if (nHour >= AEXP_INVALIDTIMEBEGIN and nHour < AEXP_INVALIDTIMEEND) then 
	-- 		Say("<#>����<color=red>"..AEXP_INVALIDTIMEBEGIN..":00<color>-<color=red>"..AEXP_INVALIDTIMEEND..":00<color>ʱ�����ѡ�������йܣ����Լ�����̯���ף����ǲ����þ���ֵ�������Զ���ȡ��Ե�����ʱ���ϵͳ����۳���������й�ʱ�䣬����Ŀɽ�����Ϸʱ�����������㡣", 2, "��ȷ��Ҫ���������й���?/judgecontion", "��ʱ��Ҫ�ˡ�/donothing");
	-- 		return 5
	-- else
	--     judgecontion();
	-- end 	
	judgecontion();
	
	return 0
end

function judgecontion()
	--nmapsize = getn(arraymap);
	--blnin = 0;
	--for i=1,nmapsize do
		--if(arraymap[i] == mapid) then
			--blnin = 1;
			--break;
		--end
	--end

	--���������һ����ô�ɹ���ʼ�����й�
	local tbSpareTime = {};
										--��Ч��׾���	��ͨ��׾���	�׾���
	local tbAexpTask = {AEXP_TIANXING_TIME_TASKID,AEXP_SPECIAL_TIME_TASKID,AEXP_TASKID, AEXP_SMALL_TIME_TASKID,
											--��Ч���ܴ�׾���	���ܴ�׾���	���ܰ׾���
												AEXP_SPECIAL_SKILL_TASKID, AEXP_SKILL_TIME_TASKID, AEXP_SMALL_SKILL_TASKID};
	local btime = 0;
	for i = 1, getn(tbAexpTask) do
		tbSpareTime[i] = {};
		tbSpareTime[i][1] = GetTask(tbAexpTask[i]);
		tbSpareTime[i][2], tbSpareTime[i][3] = getFrame2MinAndSec(tbSpareTime[i][1]);	--���û���ʾ��ʾ������
		if (tbSpareTime[i][1] >= FRAME2TIME * 60 and btime ~= 1) then
			btime = 1;
		end;
	end;
	
	
	if (btime == 1 and IsCharged() == 1) then
		local nSkillExpID = GetTask(AEXP_SKILL_ID_TASKID);
		local szSkillExpName = "";
		if (nSkillExpID ~= 0) then
			szSkillExpName = "<color=yellow>"..GetSkillName(nSkillExpID).."<color>";
		else
			szSkillExpName = "<color=blue>Ch�a ch�n k� n�ng<color>";
		end
		
		local szmsg = format("Th�i gian �y th�c r�i m�ng c�n: Thi�n tinh b�ch c�u ho�n <color=red>%d<color>ti�ng <color=red>%d<color> ph�t"..
	"<enter>��i B�ch C�u Ho�n ��c Bi�t<color=red>%d<color>gi�<color=red>%d<color>ph�t"..
	"<enter>��i B�ch C�u Ho�n �y th�c<color=red>%d<color>gi�<color=red>%d<color>ph�t"..
	"<enter>B�ch C�u Ho�n �y th�c<color=red>%d<color>gi�<color=red>%d<color>ph�t"..
	"<enter>�� thu�n th�c k� n�ng(%s): �ai B�ch C�u Ho�n k� n�ng ��c hi�u<color=red>%d<color>gi�<color=red>%d<color>ph�t"..
	"<enter>��i B�ch C�u Ho�n K� N�ng<color=red>%d<color>gi�<color=red>%d<color>ph�t"..
	"<enter>Bach C�u Ho�n K� N�ng<color=red>%d<color>gi�<color=red>%d<color>ph�t"..
	"<enter>Khi �y th�c n�u nh� c� hi�u qu� cu� Thi�n Tinh B�ch C�u Ho�n, �u ti�n hi�u qu� c�a lo�i B�ch c�u Ho�n n�y v� kinh nghi�m v� s� tr� �i th�i gian hi�u qu� t��ng �ng.", 
					tbSpareTime[1][2],tbSpareTime[1][3],
					tbSpareTime[2][2],tbSpareTime[2][3],
					tbSpareTime[3][2],tbSpareTime[3][3],
					tbSpareTime[4][2],tbSpareTime[4][3],
					szSkillExpName, tbSpareTime[5][2],tbSpareTime[5][3],
					tbSpareTime[6][2],tbSpareTime[6][3],
					tbSpareTime[7][2],tbSpareTime[7][3]);
		local szSay =
		{	"B�t ��u r�i m�ng v�n t�ng kinh nghi�m/beginoffline",
			"Ch�n k� n�ng r�i m�ng v�n t�ng kinh nghi�m/#selectofflineskill('judgecontion')",
			"B�t ��u �y th�c tr�n m�ng/begin_onlinecommission",
			"D�ng �y th�c tr�n m�ng/end_onlinecommission",
			"R�i m�ng nh�n th��ng/offlineaward",
			"�� ta suy ngh� l�i/donothing"
		};
		Describe(szmsg, getn(szSay), szSay[1], szSay[2], szSay[3], szSay[4], szSay[5], szSay[6]);
	else
		if (IsCharged() ~= 1) then
			Talk(1, "", "<#>V� ng��i kh�ng ph�i l� t�i kho�n n�p th�, cho n�n kh�ng th� s� d�ng t�nh n�ng r�i m�ng �y th�c, xin h�y n�p th� r�i sau �� s� d�ng t�nh n�ng n�y nh�.");
			return
		end;
		--beginoffline();
		--�û�ʣ���ʱ��
		Say("<#>Th�i gian c�n l�i �y th�c kinh nghi�m B�ch C�u Ho�n c�a b�n l�<color=red>0<color>ph�t. Ng��i c� th� s� d�ng ��i B�ch C�u Ho�n ��c Bi�t ho�c l� ��i B�ch C�u Ho�n �� t�ng th�i gian �y th�c c�a m�nh. <enter>ho�c l� ch�n<color=yellow> �y th�c r�i m�ng mi�n ph�<color>, c�i n�y ch� c� th� nh�n ���c m�t ch�t �t kinh nghi�m.",
			3,
			"�y th�c mi�n ph�/beginoffline",
			"R�i m�ng nh�n th��ng/offlineaward",
			"�� ta suy ngh� l�i/donothing");
	end
end

-- ��ʼ�����й�
function begin_onlinecommission()
	local bRet = check_if_can_offline()
	if bRet then
		return bRet
	end
	
	--�ж��û�ʣ���ʱ��
	local sparetime = getsparetime();
	if (sparetime <= 0) then
		Say("<#>Th�i gian �y th�c kinh nghi�m c�a ng��i c�n l�i l� 0 ph�t, ho�c ch�a l�a ch�n r�i m�ng �y th�c k� n�ng, xin h�y x�c nh�n l�i r�i s� d�ng t�nh n�ng n�y nh�.", 0);
		return 3
	end

	if (GetOnlineCommissionStatus() ~= 0) then
		Msg2Player("<#>Hi�n t�i ng��i �� �y th�c tr�n m�ng r�i")
	else
		Msg2Player("B�n �� trong tr�ng th�i �y th�c tr�n m�ng")
		SetOnlineCommissionStatus(1)
		WriteLog(format("[OfflineLive]\t%s\tAccount:%s\tName:%s\tbegin_onlinecommission, last online time:%s",
						GetLocalDate("%Y-%m-%d %X"), GetAccount(), GetName(), getBaiJutimeinfo()));
		--EnableClientInput(0)
	end
end

-- ���������й�
function end_onlinecommission()
	if (GetOnlineCommissionStatus() == 0) then
		Msg2Player("<#>Hi�n t�i ng��i kh�ng �y th�c tr�n m�ng")
	else
		SetOnlineCommissionStatus(0)
		--EnableClientInput(1)
		Msg2Player("<#>Ng��i �� h�y �y th�c tr�n m�ng")
		WriteLog(format("[OfflineLive]\t%s\tAccount:%s\tName:%s\tend_onlinecommission, last online time:%s",
							GetLocalDate("%Y-%m-%d %X"), GetAccount(), GetName(), getBaiJutimeinfo()));
	end
end

function check_if_can_offline()
	
	local nTripMode = GetTripMode()
	if nTripMode == TRIP_MODE_SERVER then
		Talk(1, "", "Xin ��i hi�p l��ng th� kh�ng th� s� d�ng t�nh n�ng �y th�c t�i server c�ng c�ng")
		return 1
	end
	--�����ж��û����ڵ�����
	mapid = SubWorldIdx2MapCopy(SubWorld);
	strmapid = ""..mapid.."";
	--û���ڵ�ǰ��ͼ��
	if (arraymap[strmapid] == nil) then
		Say("<#>Ng��i kh�ng th� th�c hi�n t�nh n�ng �y th�c t�i khu v�c n�y, xin h�y ��n m�t khu v�c t��ng �ng ( bao g�m t�t c� c�c th�nh th� th�n tr�n ) th�c hi�n �y th�c r�i m�ng.", 0);
		return 1
	end
	
	-- �ж��Ƿ���ĳЩ�������򣬱���˵�����������
	if offlineCheckPermitRegion()~=1 then
		Say("<#>�� ��ng l�m c�n tr� nh�ng b��c ���ng giang h� h�nh hi�p c�a c�c anh h�ng h�o ki�t, t�t nh�t ng��i n�n tr�nh xa nh�ng n�i nh� <color=yellow> Xa Phu, D��c �i�m,Ti�m T�p H�a ho�c l� nh�ng con ���ng nh� <color> �� m� r�i m�ng �y th�c nh�!", 0);
		return 1;
	end;
	
	--�ж��û���ս��״̬
	if (GetFightState() ~= 0) then 
		Say("<#>Hi�n t�i ng��i �ang trong tr�ng th�i chi�n ��u, kh�ng th� �i v�o tr�ng th�i r�i m�ng �y th�c ���c, xin h�y tr� l�i tr�ng th�i phi chi�n ��u sau �� h�y ti�n h�nh r�i m�ng �y th�c nh�.", 0);
		return 2
	end
	
	--�ж��û�ʣ���ʱ��
--	local sparetime = getsparetime();
--	if (sparetime <= 0) then
--		Say("<#>��ʣ��������йܾ���ʱ��Ϊ0���ӣ����߲�δѡ�������йܵļ��ܣ�������ȷ�Ϻ���ʹ�øù��ܡ�", 0);
--		return 3
--	end
	
	-- ��һ̨����������������800�ˣ��������������̨�������ڽ��������й�
	player_count = GetPlayerCount();
	local nmax_count_limit = AEXP_OFFLINE_PLAYERCOUNT_LIMIT;
	if (mapid >= 835 and mapid <= 840) then
		nmax_count_limit = AEXP_OFFLINE_PLAYERCOUNT_SPECIAL;--750
	end;
	if (player_count > nmax_count_limit) then
		Say("<#>Hi�n t�i ch� n�y ng��i th�t l� ��ng ��c, hay l� ng��i ��n ch� kh�c nh� c�c th�n tr�n hay c�c m�n ph�i r�i ti�n h�nh �y th�c nh�.",0);
		return 4
	end
	
	
end

function beginoffline()	
	local bRet = check_if_can_offline()
	if bRet then
		return bRet
	end
	-- �ж��Ƿ��������й�
	if (GetOnlineCommissionStatus() ~= 0) then
		Say("<#>Xin h�y t�m ng�ng �y th�c tr�n m�ng r�i sau �� ti�n h�nh �y th�c r�i m�ng.", 0)
		return 1
	end
	-- ��ʼ���߹һ�
	OfflineLive(PlayerIndex);
end

--ʲô�������ĺ��������ܶ���ط����õ����޸ĵ�ʱ����ע��
function donothing()
	
end

TASKID_OFFLINELIVE_EXP = {
	AEXP_SMALL_TIME_TASKID,
	AEXP_TASKID,
	AEXP_SPECIAL_TIME_TASKID,
	AEXP_TIANXING_TIME_TASKID
}

TASKID_OFFLINELIVE_SKILL = {
	AEXP_SMALL_SKILL_TASKID,
	AEXP_SKILL_TIME_TASKID,
	AEXP_SPECIAL_SKILL_TASKID
}

function getsparetime()
	--�ж��û�ʣ���ʱ��
	local nLeftTime = 0
	for i = 1, getn(TASKID_OFFLINELIVE_EXP) do
		nLeftTime = nLeftTime + GetTask(TASKID_OFFLINELIVE_EXP[i])
	end
	if (GetTask(AEXP_SKILL_ID_TASKID) ~= 0) then
		local nTime = 0
		for i = 1, getn(TASKID_OFFLINELIVE_SKILL) do
			nTime = nTime + GetTask(TASKID_OFFLINELIVE_SKILL[i])
		end
		if (nLeftTime < nTime) then
			nLeftTime = nTime
		end
	end
	return nLeftTime
end

-- ѡ�������йܼ���
function selectofflineskill()
	local aryExpSkill = getexpskill();
	local nExpSkillCount = getn(aryExpSkill);
	local aryszExpSkill = {};
	local szSayCmd = "Xin l�a ch�n ch�c n�ng �y th�c:";
	for i = 1, nExpSkillCount do
		aryszExpSkill[i] = format("%s/#onSetUpgradeSkill(%d)",aryExpSkill[i][2],aryExpSkill[i][1]);
	end
	tinsert(aryszExpSkill, "Tr� l�i/judgecontion")
	Say(szSayCmd, getn(aryszExpSkill), aryszExpSkill);
end

-- ���������йܼ���
function onSetUpgradeSkill(nUpgradeSkillID)
	SetTask(AEXP_SKILL_ID_TASKID, nUpgradeSkillID);
	judgecontion();
end

function offlineaward()
	local player = Player:New(PlayerIndex)
	DynamicExecute(
		"\\script\\global\\offlineaward.lua",
		"dlg_offlineaward",
		player)
end
