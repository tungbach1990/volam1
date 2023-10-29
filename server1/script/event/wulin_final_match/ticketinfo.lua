IncludeLib("ITEM")
Include("\\script\\tong\\tong_header.lua");

MAX_FACTION_TICKET = 5
--0���֣�1������2���ţ�3�嶾��4���ң�5���̣�6ؤ�7���̣�8�䵱��9���أ�-1����
TAB_TICKETINFO = 
{
{"Thi ��u m�n ph�i Thi�u L�m", MAX_FACTION_TICKET, "Danh s�ch m�n ph�i thi ��u", 1, "wl_get", {6,1,407,1}, 11},
{"Thi ��u m�n ph�i Thi�n V��ng", MAX_FACTION_TICKET, "Danh s�ch m�n ph�i thi ��u", 1, "wl_get", {6,1,408,1}, 12},
{"Thi ��u m�n ph�i ���ng M�n", MAX_FACTION_TICKET, "Danh s�ch m�n ph�i thi ��u", 1, "wl_get", {6,1,409,1}, 13},
{"Thi ��u m�n ph�i Ng� ��c", MAX_FACTION_TICKET, "Danh s�ch m�n ph�i thi ��u", 1, "wl_get", {6,1,410,1}, 14},
{"Thi ��u m�n ph�i Nga My", MAX_FACTION_TICKET, "Danh s�ch m�n ph�i thi ��u", 1, "wl_get", {6,1,411,1}, 15},
{"Thi ��u m�n ph�i Th�y Y�n", MAX_FACTION_TICKET, "Danh s�ch m�n ph�i thi ��u", 1, "wl_get", {6,1,412,1}, 16},
{"Thi ��u m�n ph�i C�i Bang", MAX_FACTION_TICKET, "Danh s�ch m�n ph�i thi ��u", 1, "wl_get", {6,1,413,1}, 17},
{"Thi ��u m�n ph�i Thi�n Nh�n", MAX_FACTION_TICKET, "Danh s�ch m�n ph�i thi ��u", 1, "wl_get", {6,1,414,1}, 18},
{"Thi ��u m�n ph�i V� �ang", MAX_FACTION_TICKET, "Danh s�ch m�n ph�i thi ��u", 1, "wl_get", {6,1,415,1}, 19},
{"Thi ��u m�n ph�i C�n L�n", MAX_FACTION_TICKET, "Danh s�ch m�n ph�i thi ��u", 1, "wl_get", {6,1,416,1}, 20},

{"Song ��u", 5, "Song ��u", 2, "wl_getdoubleticket", {6,1,417,1}, 21},
{"Ng� h�nh ��u", 3, "Ng� h�nh ��u", 10, "wl_getfiveticket",{6,1,418,1}, 22},
{"Th�p to�n ��u", 2, "Th�p to�n ��u", 20, "wl_gettenticket",{6,1,419,1}, 23},
{"Th�p l�c ��u", 2, "Th�p l�c ��u", 32, "wl_getsixteenticket",{6,1,420,1}, 24},
};



function FALSE(nValue)
	if (nValue == 0 or nValue == nil) then
		return 1
	else
		return nil
	end
end

--��¼��ǰ��ң���ӣ�Ŀǰ�Ѿ����˸�������Ķ�����Ʊ�ˣ�
TK_WL_TICKET_FACTION1 = 1603;
TK_WL_TICKET_FIVE = TK_WL_TICKET_FACTION1 + 10;
TK_WL_TICKET_TEN = TK_WL_TICKET_FIVE + 1;
TK_WL_TICKET_SIXTEEN = TK_WL_TICKET_TEN + 1;

MAX_TICKETCOUNT = 1
function ticket()
	Say("   B�n quan c� th� gi�p ���c g� ��y?", 2, "Ta mu�n nh�n v� v�o ��u tr��ng/wl_gettickets", "Kh�ng c�n/OnCancel")
end

function wl_gettickets()
	if (wl_checkzoneleader() == 0) then
		return
	end
	local tickettab ={};
	tickettab[1] = "V� v�o ��u tr��ng m�n ph�i/wl_getfactionsticket";
	for i = 1, getn(TAB_TICKETINFO) - 10  do 
		tickettab[ getn( tickettab ) + 1 ] = TAB_TICKETINFO[10 + i  ][1].."/"..TAB_TICKETINFO[10 + i ][5]
	end
	
	tickettab[getn(tickettab)+ 1] = "Ta suy ngh� m�t ch�t/OnCancel"--"��ȡ�����볡ȯ��ʲô�ô�/wl_tickethelp";
	Say("Ng��i c�n v� v�o lo�i h�nh thi ��u n�o?", getn(tickettab), tickettab);
end

--��ȡʮ�����ɵ�ĳ����Ʊ����ں���
function wl_getfactionsticket()
	local tabticket={};
	for i = 1, 10 do 
		tabticket[i] = TAB_TICKETINFO[i][1].."/#wl_getticket("..i..")"
	end
	tabticket[getn(tabticket)+ 1] = "Cho ta suy ngh� ch�t!/OnCancel";
	Say("   Ng��i mu�n nh�n ���c v� v�o thi ��u c�a m�n ph�i n�o?", getn(tabticket), tabticket);
end

--��ȡĳ�����ɵ���Ʊ
function wl_getticket( matchtype)
	if (wl_checkzoneleader(matchtype) == 0) then
		return
	end

	local zoneid = wl_zonename2zoneid(GetTong())
	
	local lid = 0;
	if (matchtype <= 10) then
		lid = LG_GetLeagueObj(matchtype + 10, GetTong().."Danh s�ch m�n ph�i thi ��u"..matchtype.."_"..	TAB_TICKETINFO[1][2])
	else
		lid = LG_GetLeagueObj(matchtype + 10, GetTong()..TAB_TICKETINFO[matchtype][3]..TAB_TICKETINFO[matchtype][2])
	end
	if (lid > 0) then
		Say("Xin l�i! S� ng��i tham gia m�c thi ��u n�y �� ��, kh�ng th� nh�n t� c�ch tham gia n�a! Chi ti�t c� th� xem danh s�ch s� ng��i �� b�o danh c�a khu v�c.", 0);
		return
	end
	
	local usedcount = GetTask(TK_WL_TICKET_FACTION1 + matchtype - 1)
	if (usedcount >= TAB_TICKETINFO[matchtype][2]) then
		Say("Xin l�i!".."S� l��ng phi�u t� c�ch tham gia l�n nh�t c�a m�c n�y l� "..TAB_TICKETINFO[matchtype][2]..", b�n �� nh�n xong phi�u t� c�ch tham gia m�c thi ��u n�y! Kh�ng th� nh�n n�a!",0)
		return
	end
--	local usedcount = GetTask(TK_WL_TICKET_FACTION1 + matchtype - 1)
--	if (usedcount >= MAX_TICKETCOUNT) then
--		Say("���ִ���Ա���Բ��𣡸�����������ȡ������ʸ�Ʊ������"..MAX_TICKETCOUNT..",���Ѿ�������������ʸ�Ʊ�ˣ����������ˡ�",0)
--		return
--	end
	
	local tabticketinfo = {};
	for i = 1, TAB_TICKETINFO[matchtype][2] - usedcount do 
		tabticketinfo[i] = "Ta mu�n l�nh tr��c"..i.."M� /#wl_suregetticket("..matchtype..","..i..")"
	end
	tabticketinfo[getn(tabticketinfo)+ 1] = "Ta suy ngh� m�t ch�t/OnCancel"
--	tabticketinfo[1]= "��Ҫ����"..MAX_TICKETCOUNT.."��/#wl_suregetticket("..matchtype..","..MAX_TICKETCOUNT..")"
--	tabticketinfo[getn(tabticketinfo)+1] = "���´������/OnCancel";
	Say("Ng��i hi�n c�n"..(TAB_TICKETINFO[matchtype][2] - usedcount).."M� "..TAB_TICKETINFO[matchtype][1].."phi�u t� c�ch tham gia, ng��i mu�n nh�n b�y gi� kh�ng?", getn(tabticketinfo), tabticketinfo)
--	Say("���ִ���Ա���������ȡ<color=yellow> "..MAX_TICKETCOUNT.." <color>��"..TAB_TICKETINFO[matchtype][1].."�ʸ�Ʊ����Ҫ������ȡ��", getn(tabticketinfo), tabticketinfo)
end

--ȷ��Ҫ�ü���ĳ�����͵���Ʊ
function wl_suregetticket(matchtype, count)
	local usedcount = GetTask(TK_WL_TICKET_FACTION1 + matchtype - 1)
	if (usedcount >= TAB_TICKETINFO[matchtype][2]) then
		Say("Xin l�i!".."S� l��ng phi�u t� c�ch tham gia l�n nh�t c�a m�c n�y l� "..TAB_TICKETINFO[matchtype][2]..", b�n �� nh�n xong phi�u t� c�ch tham gia m�c thi ��u n�y! Kh�ng th� nh�n n�a!",0)
		return
	end
--	if (usedcount >= MAX_TICKETCOUNT) then
--		Say("���ִ���Ա���Բ���".."������������ȡ������ʸ�Ʊ������<color=yellow> "..MAX_TICKETCOUNT.." <color>,���Ѿ�������������ʸ�Ʊ�ˣ����������ˡ�",0)
--		return
--	end
	
	local zoneid = wl_zonename2zoneid(GetTong())
	if (zoneid == 0) then
		return
	end
	for i= 1 ,count do 
		nItemIndex = AddItem(TAB_TICKETINFO[matchtype][6][1], TAB_TICKETINFO[matchtype][6][2], TAB_TICKETINFO[matchtype][6][3], 1, 0,0,0)
		ITEM_SetItemExParam(nItemIndex, 1, zoneid)
		ITEM_SetItemExParam(nItemIndex, 2, matchtype)
	end
	SetTask(TK_WL_TICKET_FACTION1 + matchtype - 1 , usedcount + count)
end

--���˫��������Ʊ
function wl_getdoubleticket()
	wl_getticket(11)
end

--�������������Ʊ
function wl_getfiveticket()
	wl_getticket(12)
end

--���ʮ��������Ʊ
function wl_gettenticket()
	wl_getticket(13)
end

--���ʮ����������Ʊ
function wl_getsixteenticket()
	wl_getticket(14)
end


function wl_checkzoneleader( matchtype )
--	do return 1 end
	local mon, day, hour = wl_checkfetchtime()
	local openmon, openday = wl_getmatchopenday(1)
	if ( (openmon >= mon and openday > day) or hour < 18 ) then
		if (GetTongFigure() ~= TONG_MASTER and GetTongFigure() ~= TONG_ELDER) then
			Say("Ph�i l� Bang ch� ho�c Tr��ng l�o c�a khu v�c m�i ���c!", 0)
			return 0
		end

		local zoneid = wl_zonename2zoneid(GetTong());
		if (zoneid == 0) then
			Say("Xin l�i! Ph�i l� Bang ch� c�a khu v�c thi ��u m�i c� th� nh�n ���c!",0)
			return 0
		end
		return 1
	end
	if ( hour >= 18 ) then
		if( not matchtype ) then
			return 1
		end
		
		local nMon = 0
		local nDay = 0;
		if (matchtype > 10) then
			nMon ,nDay = wl_getmatchopenday(matchtype)
		end
		
		if ( matchtype > 0 and matchtype <= 10 ) then
			local nMon1, nDay1 = wl_getmatchopenday(1)
			local nMon2, nDay2 = wl_getmatchopenday(15)
			if ( (nMon1 == mon and nDay1 == day) or ( nMon2 == mon and nDay2 == day ) ) then
				return 1
			end
		elseif ( nMon == mon and nDay == day ) then
		
			return 1
		else
			Say("H�m nay ch�a m� thi ��u c�a"..TAB_TICKETINFO[matchtype][3]..", ng��i kh�ng th� nh�n v� v�o lo�i thi ��u n�y.", 0)
			return 0
		end
	end
	Say("B�y gi� kh�ng ph�i l� th�i gian l�nh phi�u thi ��u!", 0)
	return 0
end


function wl_checkfetchtime(  )
--	local nTime = GetCurServerTime()
--	local nDate = FormatTime2Number(nTime)
	local nDate = date("%y%m%d%H%M")
	local year = floor( nDate / 100000000 )
	local mon = mod( floor( nDate / 1000000 ), 100 )
	local day = mod( floor( nDate / 10000 ), 100 )
	local hour = mod( floor( nDate / 100 ), 100 )
	return mon, day, hour
end

function wl_getmatchopenday(matchtype)
	if (TAB_SCHEDULE[matchtype] == nil) then
		return 0,0
	end
	local nMon = floor( TAB_SCHEDULE[matchtype] / 100 )
	local nDay = mod( TAB_SCHEDULE[matchtype] , 100 )
	return nMon, nDay
end

TAB_SCHEDULE = 
{
--	{ѭ������ʼʱ�䣬����ʱ��, �ִ�,���ʱ��, ��Ӧ����},{32ǿ����ʼʱ��,32ǿ����������ʱ��, �ִ�, ���ʱ��, ��Ӧ����},{���վ�����ʼʱ��,����ʱ�䣬���,���ʱ��,��Ӧ����}
[1] = 0712,
[11] = 0714,
[12] = 0715,
[13] = 0716,
[14] = 0717,
[15] = 0713
}

function wl_zonename2zoneid(zonename)
	for i=1, getn(TAB_ZONEINFO) do
		if (TAB_ZONEINFO[i] == zonename) then
			return i
		end
	end
	return 0
end



TAB_ZONEINFO = {
"1-1",
"1-2",
"1-3",
"2-1",
"2-2",
"2-3",
"3-1",
"3-2",
"3-3",
"4-1",
"4-2",
"4-3",
"5-1",
"5-2",
"6-1",
"6-2",
"6-3",
"7-1",
"7-2",
"7-3",
"8-1",
"8-2",
"9-1",
"9-2",
"10-1",
"10-2",
"11-1",
"11-2",
"11-3",
"12-1",
"12-2",
"13-1",
"13-2",
"14-1",
"15-1",
"16-1",
"17-1",
"18-1",
"19-1",
"20-1",
"20-2",
"22-1",

}

function OnCancel()
end