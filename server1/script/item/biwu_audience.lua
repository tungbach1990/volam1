--Include("\\script\\missions\\finalmatch\\wl_watchmatch.lua")
--Include("\\script\\missions\\finalmatch\\head.lua")
--GetExtPoint(1) == date(%y%m%d)	--050704
--PayExtPoint(extpoint, count);
GUANFANGRENYUAN = 5555
ZHANDIJIZHE = 4444
function main( nItemIdx )
SetLogoutRV(1);		--����������Ϊһ��������
	local extpoint = GetExtPoint(1)
	if ( extpoint == 0 ) then
		Say("Sao ng��i l�y quan ch�ng l�nh c�a ng��i kh�c s� d�ng? ", 0)
		return
	end
	
	local matchtype = GetGlbValue( GLB_CURMATCHTYPE )
	local matchphase = GetGlbValue( GLB_MATCHPHASE )
	if ( matchtype == 0 ) then
		Say("Hi�n t�i ch�a thi ��u, mu�n quan s�t c�n ph�i ��i ��n l�c b�t ��u thi ��u. Mu�n t�m hi�u c�ch s� d�ng quan ch�ng l�nh kh�ng?", 3, "S� d�ng quan ch�ng l�nh nh� th� n�o/#wl_onaudiencehelp(1)", "T�m hi�u th�i gian s� d�ng quan ch�ng l�nh/wl_getdeadline", "K�t th�c ��i tho�i/OnCancel")
		return 1
	end

	local messages = {
		"V�o n�i xem ��u/#want2audience("..matchtype..")",
		"Ch� ��nh t�n nh�n v�t/watch_role",
		"Ch� ��nh t�n ��i thi ��u/watch_league",
		"Theo s� ph�n chia khu v�c t�m hi�u ��i thi ��u/watch_zone",
		"S� d�ng quan ch�ng l�nh nh� th� n�o/#wl_onaudiencehelp(1)",
		"T�m hi�u th�i gian s� d�ng quan ch�ng l�nh/wl_getdeadline",
		"Kh�ng l�m g� h�t/OnCancel"
	};
	local curmapid = SubWorldIdx2ID( SubWorld )
	local flag = wl_mapid2watchnum( curmapid )
	if ( flag ) then
		tinsert( messages, 1, "T�m hi�u ng�u nhi�n tuy�n th� �ang thi ��u/watch_rand_currently" )
	end
	Say("B�n c� th� c�n c� v�o ph��ng ph�p sau �� t�m hi�u thi ��u ��ng th�i ti�n h�nh quan s�t.", getn( messages ), messages )
	return 1
end

-- �ۿ�ĳ����ɫ����
function watch_role()
	-- �ж��Ƿ��Ѿ��ڹ�սģʽ
	if (IsSpectator() == 0) then
		AskClientForString("on_watch_role", "", 1, 20, "Xin nh�p t�n nh�n v�t ng��i ch�i v�o");
	end
end


function wl_sure2watch_role(rolename,position,matchtype)
oldSubWorld = SubWorld
	local tab_matchmap = {}
	tab_matchmap = wl_matchtype2allmapin( matchtype, position )
	if ( getn(tab_matchmap) == 0 ) then
		print("matchtype="..matchtype..",position="..position..", cannot find matchmap")
		return
	end
	
	local bpassed = 0
	bpassed = wl_findroleinmatchmap( rolename,tab_matchmap )
	if ( bpassed == 0 ) then
		Say("B�n t�m hi�u t�n tuy�n th� nh�n v�t l� '"..rolename.."', hi�n t�i kh�ng c� trong ��u tr��ng thi ��u, xin ch�n c�c tuy�n th� kh�c xem thi ��u.", 0)
		return
	end
	AttachActor(rolename);
SubWorld = oldSubWorld
end


function watch_league()
	-- �ж��Ƿ��Ѿ��ڹ�սģʽ
	if (IsSpectator() == 0) then
		AskClientForString("on_watch_league", "", 1, 20, "Xin nh�p t�n ��i thi ��u");
	end
end

function wl_sure2watch_lgname(leaguename,position,leaguetype)
oldSubWorld = SubWorld
	local matchtype = leaguetype - 10
	local tab_matchmap = {}
	tab_matchmap = wl_matchtype2allmapin( matchtype, position )
	if ( getn(tab_matchmap) == 0 ) then
		print("matchtype="..matchtype..",position="..position..", cannot find matchmap")
		return
	end
	local lid = LG_GetLeagueObj( leaguetype, leaguename )
	local lgcount = LG_GetMemberCount(lid)
	local lgmem = {}
	local rolename = ""
	local bpassed = 0
	for i = 0, lgcount - 1 do
		lgmem[ getn(lgmem)+1 ] = LG_GetMemberInfo( lid, i )
	end
	for i = 1, getn( lgmem ) do
		bpassed = wl_findroleinmatchmap( lgmem[i],tab_matchmap )
		if ( bpassed == 1 ) then
			rolename = lgmem[i]
			break
		end
	end
	if ( bpassed == 0 ) then
		Say("B�n t�m hi�u t�n ��i thi ��u l� '"..leaguename.."', hi�n t�i kh�ng c� trong ��u tr��ng thi ��u, kh�ng th� quan s�t ��i thi ��u ��, xin ch�n ��i thi ��u kh�c quan s�t.", 0)
		return
	end
	AttachActor(rolename);
SubWorld = oldSubWorld
end


function watch_zone()
	local opp = {}
	opp = get_zone(0)
	Say("B�n mu�n t�m hi�u khu v�c n�o c� ��i thi ��u h�m nay?", getn(opp), opp)
end

function wl_sure2go_seat(rolesignmap, name, flag)
	local str = ""
	local position = wl_getwatchmap( rolesignmap )
	if( not position ) then
		print("the signmap of role who the play want to watch is not exist!!!!mapid =="..rolesignmap)
		return
	end
	local num = random(1, 2)
	local watchmap = WL_TABWATCHMAPS[position][num]
	x,y,z = GetWorldPos();
	SetTask(WL_TASKID_FROMMAP, x);
	SetTask(WL_TASKID_FROM_X, y);
	SetTask(WL_TASKID_FROM_Y, z);
	if ( flag == 1 ) then
		str = "B�n v�a t�m hi�u t�n ��i thi ��u l� "..name..", xin h�y s� d�ng quan ch�ng l�nh ho�c qua b�n Quan vi�n t�m hi�u l�i."
	else
		str = "B�n v�a t�m hi�u t�n tuy�n th� l� "..name..", xin h�y s� d�ng quan ch�ng l�nh ho�c qua b�n Quan vi�n t�m hi�u l�i."
	end
	NewWorld(watchmap, WL_MAPPOS_OUT[1], WL_MAPPOS_OUT[2])
	Msg2Player(str)
	Say(str, 0)
end

function wl_mapideqmapid( mapid1, mapid2 )
	local flag = 0
	for i = 1, getn( WL_TABWATCHMAPS ) do
		for j = 1, getn( WL_TABWATCHMAPS[i] ) do
			if ( WL_TABWATCHMAPS[i][j] == mapid1 ) then
				flag = i
				break
			end
		end
	end
	if ( flag == 0 ) then
		return
	end
	for i = 1, getn( WL_TABWATCHMAPS[ flag ] ) do
		if( WL_TABWATCHMAPS[ flag ][ i ] == mapid2 ) then
			return i
		end
	end
	return nil
end


OnAudience = {
"C� th� s� d�ng 4 h�nh th�c sau �� t�m hi�u thi ��u ��ng th�i quan s�t: 1, ch� ��nh t�n nh�n v�t; 2, ch� ��nh t�n ��i thi ��u; 3, c�n c� theo s� ph�n chia khu v�c t�m hi�u ��i thi ��u; 4, t�m hi�u ng�u nhi�n v� tuy�n th� �ang thi ��u. T�m hi�u nh�n v�t ho�c ��i thi ��u c�n ph�i l� ��i thi ��u ng�y h�m �� ��ng th�i ��i thi ��u �� �ang ti�n h�nh thi ��u.",
"Trong vai tr� kh�n gi�, n�u ta ���c ph�p t�m hi�u nh�n v�t ho�c ���c ph�p quan s�t ��i thi ��u, c� ngh�a l� t�n nh�n v�t ho�c ��i thi ��u �ang ti�n h�nh thi ��u. Khi nh�n v�t thi ��u r�i m�ng ho�c t� vong th� l�p t�c k�t th�c",
"Trong m� th�c quan s�t, n�u ta mu�n quan s�t nh�n v�t ho�c ��i thi ��u kh�ng c� tr�n b�n �� hi�n t�i, h� th�ng s� ��a b�n ��n n�i quan s�t t��ng �ng, sau �� ng��i ch�i t�m hi�u l�i t�n nh�n v�t ho�c ��i thi ��u",
}
function wl_onaudiencehelp(count)
	if ( count >= getn( OnAudience ) ) then
		Say(OnAudience[getn( OnAudience )], 1, "��ng/OnCancel")
	else
		local ncount = count + 1
		Say(OnAudience[count], 2, "Trang k� /#wl_onaudiencehelp("..ncount..")", "��ng/OnCancel")
	end
end


function wl_getdeadline()
	local extpoint = GetExtPoint(1)
	if ( extpoint == 0 ) then
		Say("Sao ng��i l�y quan ch�ng l�nh c�a ng��i kh�c s� d�ng? ", 0)
		return 1
	end

	Say("Trong th�i gian di�n ra ��i h�i v� l�m kh�n gi� c� th� v�o h� th�ng v� l�m ��i h�i, s� kh�ng b� h�n ch� v� th�i gian s� d�ng quan ch�ng l�nh.", 0)
end
function want2audience( matchtype )
	if ( matchtype == 9999 ) then
		Say("Bu�i thi ��u h�m nay l� ��n ��u m�n ph�i, ��u tr��ng v� m�n ph�i thi ��u t��ng �ng:", 6, "��u tr��ng 1 (Thi�u L�m, Thi�n V��ng) /#want2watchseat(1)", "��u tr��ng 2 (���ng M�n, Ng� ��c) /#want2watchseat(2)","��u tr��ng 3 (Th�y Y�n, Nga My) /#want2watchseat(3)","��u tr��ng 4 (C�i Bang, Thi�n Nh�n) /#want2watchseat(4)","��u tr��ng 5 (V� �ang, C�n L�n) /#want2watchseat(5)", "Kh�ng c�n ��u/OnCancel")
	elseif( matchtype == 11 ) then
		Say("Bu�i thi ��u h�m nay l� song ��u, sau ��y m� ra 3 ��u tr��ng, b�n mu�n �i:", 4, "��u tr��ng 1/#want2watchseat(1)", "��u tr��ng 2/#want2watchseat(2)","��u tr��ng 3/#want2watchseat(3)", "Kh�ng c�n ��u/OnCancel")
	elseif( matchtype == 12 ) then
		Say("Bu�i thi ��u h�m nay l� Ng� h�nh ��u, sau ��y m� ra 6 ��u tr��ng, b�n mu�n �i:", 7, "��u tr��ng 1/#want2watchseat(1)", "��u tr��ng 2/#want2watchseat(2)","��u tr��ng 3/#want2watchseat(3)","��u tr��ng 4 /#want2watchseat(4)","��u tr��ng 5/#want2watchseat(5)", "��u tr��ng 6/#want2watchseat(6)","Kh�ng c�n ��u/OnCancel")
	elseif( matchtype == 13 or matchtype == 14 ) then
		Say("Bu�i thi ��u h�m nay l� thi ��u ��i nh�m, sau ��y m� ra 4 ��u tr��ng, b�n mu�n �i:", 5, "��u tr��ng 1/#want2watchseat(1)", "��u tr��ng 2/#want2watchseat(2)","��u tr��ng 4 /#want2watchseat(4)","��u tr��ng 5/#want2watchseat(5)","Kh�ng c�n ��u/OnCancel")
	elseif( matchtype == 15 ) then
		Say("Bu�i thi ��u h�m n�y l� ��u khu v�c, sau ��y m� ra 6 ��u tr��ng, b�n mu�n �i:", 7, "��u tr��ng 1/#want2watchseat(1)", "��u tr��ng 2/#want2watchseat(2)","��u tr��ng 3/#want2watchseat(3)","��u tr��ng 4 /#want2watchseat(4)","��u tr��ng 5/#want2watchseat(5)", "��u tr��ng 6/#want2watchseat(6)","Kh�ng c�n ��u/OnCancel")
	else
		Say("��u tr��ng hi�n �ang s�a ch�a, xin ��i gi�y l�t quay l�i sau.", 0)
	end
end
function want2watchseat(position)
	local watchmap = WL_TABWATCHMAPS[position][1]
	x,y,z = GetWorldPos();
	SetTask(WL_TASKID_FROMMAP, x);
	SetTask(WL_TASKID_FROM_X, y);
	SetTask(WL_TASKID_FROM_Y, z);
	NewWorld(watchmap, WL_MAPPOS_OUT[1], WL_MAPPOS_OUT[2])
	Msg2Player("B�n �� ��n ��u tr��ng, xin h�y s� d�ng quan ch�ng l�nh ho�c qua b�n Quan vi�n ��u tr��ng t�m hi�u thi ��u")
end