--�ߴ���� ������
--���ǳ�������

Include("\\script\\lib\\gb_taskfuncs.lua");		--gb_Task
Include("\\script\\misc\\league_cityinfo.lua")
TB_MAINCITY_CITYWAR_T = {
--[���б��]={�������ڣ�����Map��������}
	{4, 1, "Ph��ng T��ng"},
	{2, 11, "Th�nh ��"},
	{3, 162, "��i L�"},
	{6, 37, "Bi�n Kinh"},
	{5, 78, "T��ng D��ng"},
	{1, 80, "D��ng Ch�u"},
	{7, 176, "L�m An"},
}

TB_MAINCITY_AWARDARY = {
--g,d,p,l,s,luck, count, free
	[1] = {6,1,1339,1,1,1, 10, 10},
	[2] = {6,1,1340,1,1,1, 100, 50},
}

--GetCityOwner()
function maincity_award_entry()
	local city_id = gb_GetTask("MAINCITYCFG", 1);
	if (GetTongMaster() ~= GetName() or GetCityOwner(city_id) ~= GetTongName()) then
		Say("<#>Ng��i kh�ng ph�i l� Th�i th� c�a <"..GetCityAreaName(city_id).."Ph�>, kh�ng th� nh�n ph�n th��ng!", 0);
		return 0;
	end;
	
	Say("<#>Nh�n ph�n th��ng d�nh cho Th�i Th� ",
	3,
	"<#>Nh�n Th�nh ch� L� bao/take_maincity_award",
	"<#>Nh�n Th�nh ch� L� ph�m/take_maincity_award",
	"<#> T�m th�i ta kh�ng l�nh ��u/OnCancel");
end;

function take_maincity_award(nSel)
	local nlg_tsk = nSel + 1;
	local city_id = gb_GetTask("MAINCITYCFG", 1);
	if (check_award_condition(city_id, nlg_tsk, 1) ~= 1) then
		return 0;
	end;
	
	local ncount = TB_MAINCITY_AWARDARY[nlg_tsk][8];
	local ncurcount = get_citybonus_task(city_id, nlg_tsk);
	if (CalcFreeItemCellCount() < ncount) then
		Say("<#>H�nh trang c�a ng��i kh�ng �� ch� tr�ng, xin h�y s�p x�p l�i!", 0);
		return 0;
	end;
	local ng, nd, np, nl, ns, nluck = TB_MAINCITY_AWARDARY[nlg_tsk][1],TB_MAINCITY_AWARDARY[nlg_tsk][2],TB_MAINCITY_AWARDARY[nlg_tsk][3],
																		TB_MAINCITY_AWARDARY[nlg_tsk][4],TB_MAINCITY_AWARDARY[nlg_tsk][5],TB_MAINCITY_AWARDARY[nlg_tsk][6];
	
	
	local szLogmsg = "";
	if (nlg_tsk == 1) then
		szLogmsg = " nh�n Th�nh ch� L� bao";
	else
		szLogmsg = "Th�nh ch� L� ph�m";
		if (ncurcount >= ncount) then
			szLogmsg = "Nh�n ��t th� 2: "..szLogmsg;
		else
			szLogmsg = "Nh�t ��t th� 1: "..szLogmsg;
		end;
	end;
	
	set_citybonus_task(city_id, nlg_tsk, ncount+ncurcount);
	for i = 1, ncount do
		AddItem(ng, nd, np, nl, ns, nluck);
	end;
	WriteLog("[Ph�n th��ng server Th�t ��i Th�nh Th�]\t"..GetLocalDate("%Y-%m-%d %H:%M:%S\t").."Name:"..GetName().." Account:"..GetAccount()..szLogmsg..ncount.."c�i");
	Say("<#>Ng��i "..szLogmsg..". Xin ch�c m�ng!", 0);
end;

function check_award_condition(city_id, nlg_tsk, show_talk)
	if (city_id > 7 or city_id < 1) then
		if (show_talk) then
			Say("<#>Ch� ��nh Th�i th� sai s�t, xin li�n l�c v�i ng��i qu�n l�!", 0);
		end;
		return 0
	end;
	local nDeadline = get_maincity_deadline(city_id);
	
	local ncurweek = tonumber(GetLocalDate("%w"));
	if (ncurweek == 0) then
		ncurweek = 7;
	end;
	if (TB_MAINCITY_CITYWAR_T[city_id][1] == ncurweek and tonumber(GetLocalDate("%H%M")) >= 2000 and tonumber(GetLocalDate("%H%M")) < 2230) then
		Say("<#>�ang th�i gian c�ng th�nh, Th�nh ch� kh�ng th� nh�n ph�n th��ng.", 0);
		return 0;
	end;
	local nTskDate = get_maincitybonus_date(city_id);
	if (nDeadline ~= nTskDate) then
		set_citybonus_task(city_id, CITYINFO_LEAGUETASK_BONUS, 0);
		set_citybonus_task(city_id, CITYINFO_LEAGUETASK_GIFT, 0);
		set_citybonus_task(city_id, CITYINFO_LEAGUETASK_DATE, nDeadline);
	end;
	local ntskvalue = get_citybonus_task(city_id, nlg_tsk);
	
	if (ntskvalue >= TB_MAINCITY_AWARDARY[nlg_tsk][7]) then
		if (show_talk) then
			Say("<#>Ng��i ch�ng ph�i �� nh�n ph�n th��ng tu�n n�y r�i sao?", 0);
		end;
		return 0;
	end;
	return 1;
end;

function get_maincity_deadline(city_id)
	local nServerTime = GetCurServerTime();
	local nCurWeek = tonumber(GetLocalDate("%w"));
	if (nCurWeek == 0) then
		nCurWeek = 7;
	end;
	local nCurDate = floor(FormatTime2Number(nServerTime) / 10000);
	local nCurTime = mod(FormatTime2Number(GetCurServerTime()) , 10000);
	local naddtime = 0;
	if (TB_MAINCITY_CITYWAR_T[city_id][1] == nCurWeek) then
		if (nCurTime < 2000) then
			return nCurDate;
		else
			naddtime = 7;
		end;
	elseif (TB_MAINCITY_CITYWAR_T[city_id][1] < nCurWeek) then
		naddtime = (7 - nCurWeek + TB_MAINCITY_CITYWAR_T[city_id][1]);
	elseif (TB_MAINCITY_CITYWAR_T[city_id][1] > nCurWeek) then
		naddtime = (TB_MAINCITY_CITYWAR_T[city_id][1] - nCurWeek);
	end;
	return floor(FormatTime2Number(nServerTime + naddtime * 24 * 60 * 60) / 10000)
end;

