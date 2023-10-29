Include("\\script\\task\\newtask\\branch\\branch_bwsj.lua")
Include("\\script\\missions\\bw\\bwhead.lua");


szCaptainName = {};
function main()
--do Talk(1, "", "Ch�c n�ng �� ��ng.") return end
	--���÷��ص�
	x,y,z = GetWorldPos();
	SetTask(BW_SIGNPOSWORLD, x);
	SetTask(BW_SIGNPOSX, y);
	SetTask(BW_SIGNPOSY, z);
	szCaptainName = bw_getcaptains(); --��ȡ���Ӷӳ������֣�

	idx = SubWorldID2Idx(BW_COMPETEMAP[1]);
	if (idx == -1) then
		ErrorMsg(3) 
		return
	end;
	
	OldSubWorld = SubWorld;
	SubWorld = idx;
	local MemberCount =GetMissionV(MS_MAXMEMBERCOUNT)
	ms_state = GetMissionV(MS_STATE);
	if (ms_state == 0) then 
		Say("��y l� ��u tr��ng thi ��u l�i ��i, n�i cho c�c nh�n s� tr�n giang h� ��n ��u ho�c t� ch�c ��i thi ��u, hi�n t�i ch�a ai b�o danh thi ��u, c�c h� mu�n b�o danh kh�ng? <color=yellow>Hi�n t�i l�i ��i m� c�a mi�n ph�<color>", 3, "���c th�i!/OnRegister", "Quy t�c thi ��u ra sao?/OnHelp", "�� ta suy ngh� l�i!/OnCancel");
	elseif (ms_state == 1) then
		Say("��y l� ��u tr��ng l�i ��i, hi�n t�i ��i <color=yellow>"..szCaptainName[1].."<color> v� ��i <color=yellow>"..szCaptainName[2].."<color> thi ��u <color=yellow>"..MemberCount.." vs "..MemberCount.."<color>, ng��i c� y�u c�u g� kh�ng?",4,"Ta l� ��i tr��ng, mu�n bi�t s� th� t� v�o ��u tr��ng./OnShowKey", "Ta l� tuy�n th�, mu�n v�o ��u tr��ng./OnEnterMatch", "Ta mu�n xem tr�n ��u n�y./OnLook", "Ta kh�ng h�ng th� v�i tr�n ��u n�y./OnCancel")
	elseif (ms_state == 2) then 
		OnFighting();
	else
		ErrorMsg(2)
	end;
	SubWorld = OldSubWorld;
end;

function OnRegister()
	--����
	if (GetTeamSize()  ~= 2) then
		Say("Mu�n b�o danh thi ��u c�n ph�i l� <color=yellow>��i tr��ng<color> c�a hai b�n, ��i ng� c�a ng��i h�nh nh� kh�ng �� <color=yellow>2<color> ng��i.", 0);
		return
	end;

	if (IsCaptain() ~= 1) then 
		ErrorMsg(5)
		return
	end;

	Say("C�c h� mu�n ��u l�i ��i, s� ng��i ��i b�n nhi�u nh�t bao nhi�u?", 9, "Th�i kh�i!/OnCancel", "1 vs 1/#SignUpFinal(1)", "2 vs 2/#SignUpFinal( 2 )", "3 vs 3/#SignUpFinal( 3 )","4 vs 4/#SignUpFinal( 4 )","5 vs 5/#SignUpFinal( 5 )","6 vs 6/#SignUpFinal( 6 )","7 vs 7/#SignUpFinal( 7 )","8 vs 8/#SignUpFinal( 8 )");
end;

function SignUpFinal(MemberCount)
	if (GetTeamSize()  ~= 2) then
		Say("Mu�n b�o danh thi ��u c�n ph�i l� <color=yellow>��i tr��ng<color> c�a hai b�n, ��i ng� c�a ng��i h�nh nh� kh�ng �� <color=yellow>2<color> ng��i.", 0);
		return
	end;
	
	if (MemberCount <= 0 or MemberCount > 8) then
		return
	end
	
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(BW_COMPETEMAP[1]);
	ms_state = GetMissionV(MS_STATE);

	if (ms_state ~= 0) then 
		ErrorMsg(8)
		return
	end
	OpenMission(BW_MISSIONID);
	local x = GetTask(BW_SIGNPOSWORLD);
	if x == 80 then
		SetMissionS(CITYID,"D��ng Ch�u")
	elseif x == 78 then
		SetMissionS(CITYID,"T��ng D��ng")
	else
		SetMissionS(CITYID,"Th�nh ��")
	end;
	
	local key = {};
	key = bw_getkey();
	SetMissionV(MS_TEAMKEY[1], key[1]);
	SetMissionV(MS_TEAMKEY[2], key[2]);
	
	OldPlayerIndex = PlayerIndex;
	for i = 1, 2 do 
		PlayerIndex = GetTeamMember(i);
		SetMissionS(i, GetName());
		szCaptainName = bw_getcaptains(); --��ȡ���Ӷӳ������֣�
		if (MemberCount > 1) then
			Msg2Player("��i h�nh c�a c�c h� s� th� t� v�o ��u tr��ng l�: <color=yellow> ["..key[i].."]<color>, xin th�ng b�o cho th�nh vi�n ��i s� th� t� n�y. Th�nh vi�n g�p C�ng B�nh T� nh�p s� n�y v�o l� c� th� v�o thi ��u.");			
			local szMsg = format("C�ng B�nh T�: Ng��i �� ��ng k� thi ��u gi�a %s v� %s, h�y mau ch�ng v�o ��u tr��ng,  tr�n ��u s� ch�nh th�c b�t ��u sau %d ph�t. S� hi�u ��u tr��ng l�:<color=yellow>[%d]<color=>, h�y th�ng b�o s� n�y cho c�c ��ng ��i, h� s� ph�i d�ng con s� n�y �� v�o ��u tr��ng.",MemberCount, MemberCount, floor(GO_TIME/3),key[i])
			Say(szMsg,0)
			
		end
		branchTask_BW1()	--��������أ��μ��˱������м���
	end;
	
	PlayerIndex = OldPlayerIndex;
	SetMissionV(MS_MAXMEMBERCOUNT, MemberCount)
	SubWorld = OldSubWorld;
	str = "<#> Hi�n t�i"..GetMissionS(CITYID)..szCaptainName[1].."��i <#> ��u v�i "..szCaptainName[2].."��i <#>, l�i ��i thi ��u chu�n b� v�o ��u tr��ng, ��i tr��ng ��i b�n l� "..szCaptainName[1].."<#> v� "..szCaptainName[2].."<#>. L�i ��i m� c�a mi�n ph�, hoan ngh�nh m�i ng��i ��n xem thi ��u.";
	--AddGlobalNews(str);
	local szMsg = format("Ng��i �� ��ng k� thi ��u gi�a %s v� %s, h�y mau ch�ng v�o ��u tr��ng,  tr�n ��u s� ch�nh th�c b�t ��u sau %d ph�t.",MemberCount, MemberCount, floor(GO_TIME/3))
	Msg2Team(szMsg);
end;

function bw_getkey()
	local key = {};
	key[1] = random(1, 9999)
	key[2] = random(1, 9999)
	
	--��֤key1 key2>0, key1 ~= key2
	if (key[2] == key[1]) then
		if (key[1] < 9996) then
			key[2] = key[1] + 3
		else
			key[2] = key[1] - 3;
		end
	end
	return key;
end;



function OnHelp()
	Talk(5, "",	"L�i ��i thi ��u l� n�i �� c�c cao th� thi th� t�i ngh� v�i nhau c�ng l� n�i thi ��u c�ng b�ng nh�t cho ��i b�n.",	"Mu�n tham gia l�i ��i thi ��u, tr��c ti�n ph�i ��n ch� ta xin b�o danh.",	"Sau khi ��t c��c xong, b�o danh tham gia l�i ��i s� ho�n t�t. L� do ��u tr��ng c� gi�i h�n n�n trong l�c ng��i kh�c �ang thi ��u, ng��i kh�c kh�ng th� b�o danh!",	format("C�ng B�nh T�: Sau khi ��ng k� th�nh c�ng, hai b�n c� th� v�o khu v�c chu�n b�, th�i gian chu�n b� l� <color=yellow>%d<color> ph�t, sau khi th�i gian chu�n b� k�t th�c, tr�n ��u s� ch�nh th�c b�t ��u!", floor(GO_TIME/3)) , 	format("C�ng B�nh T�: Th�i gian thi ��u l� <color=yellow>%d<color> ph�t, n�u trong %d ph�t kh�ng x�c ��nh ���c ��i th�ng, tr�n ��u s� ���c x� h�a.", floor(TIMER_2/(60*FRAME2TIME))-floor(GO_TIME/3), floor(TIMER_2/(60*FRAME2TIME))-floor(GO_TIME/3) ));
end;

function OnEnterMatch()
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(BW_COMPETEMAP[1]);
	if (SubWorld < 0) then
		return
	end;
	
	if ((GetName() == szCaptainName[1]) or (GetName() == szCaptainName[2])) then 
		OnJoin(0)	--�������ʲô������ the only param stand for the group ID;
	else
		Say("Xin nh�p s� th� t� tham gia thi ��u l�i ��i l�n n�y �� v�o ��u tr��ng.",2, "���c th�i! �� ta nh�p v�o/OnEnterKey", "Qu�n s� th� t� r�i, �� h�i l�i ��i tr��ng/OnCancel")
	end;
	SubWorld = OldSubWorld;
end

function OnEnterKey()
	AskClientForNumber("OnEnterKey1", 0, 10000, "Xin nh�p s� th� t� v�o ��u tr��ng:");
end

function OnEnterKey1(Key)
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(BW_COMPETEMAP[1]);
	if (SubWorld < 0) then
		SubWorld = OldSubWorld;
		return
	end;
	if (Key == GetMissionV(MS_TEAMKEY[1])) then
		OnJoin(1)
	elseif (Key == GetMissionV(MS_TEAMKEY[2])) then
		OnJoin(2)
	else
		Say("Xin l�i! Nh�p s� th� t� kh�ng ��ng, h�y x�c nh�n l�i s� th� t� ho�c ��n h�i l�i ��i tr��ng. C�m �n!",0)
	end
	SubWorld = OldSubWorld;
end

function OnLook()
	idx = SubWorldID2Idx(BW_COMPETEMAP[1]);
	OldSubWorld = SubWorld;
	SubWorld = idx;
	local str = szCaptainName[1].."��i <#> v� "..szCaptainName[2].."��i <#> s�p b�t ��u thi ��u l�i ��i, theo c�c h� ai s� d�nh th�ng l�i chung cu�c?";
	local str1 = "Ta mu�n v�o ��u tr��ng <#> xem/onwatch";
	Say(str, 2, str1, "Ta �o�n kh�ng ch�nh x�c, kh�ng v�o ��u/OnCancel");
	SubWorld = OldSubWorld;
end;

function onwatch()
	OldSubWorld = SubWorld;
	local idx = SubWorldID2Idx(BW_COMPETEMAP[1]);
	if (idx == -1) then
		return
	end;
	SubWorld = idx;
	if (GetName() == szCaptainName[1]) or (GetName() == szCaptainName[2]) then 
		SubWorld = OldSubWorld
		OnJoin(0)	--�ӳ����ܽ��й�ս
	else
		OnJoin(3);	--���뵽���ڵ�
	end;
end

--to join in a fight group	group --��
function OnJoin(group)
	idx = SubWorldID2Idx(BW_COMPETEMAP[1]);
	if (idx < 0) then
		return
	end;
	OldSubWorld = SubWorld;
	SubWorld = idx;
	if (GetName() == szCaptainName[1]) then 
		JoinCamp(1)
	elseif (GetName() == szCaptainName[2]) then 
		JoinCamp(2)
	elseif (group == 1 or group == 2) then
		local masteridx = SearchPlayer(GetMissionS(group))
		local masternum = 0
		if (masteridx > 0) then
			if (PIdx2MSDIdx(BW_MISSIONID, masteridx) > 0) then
				masternum = 1
			end
		end
		if (GetMSPlayerCount(BW_MISSIONID, group) - masternum < GetMissionV(MS_MAXMEMBERCOUNT) - 1) then
			JoinCamp(group)
		else
			ErrorMsg(10)
		end;
	elseif (group == 3) then
		JoinCamp(3);
	else
		ErrorMsg(4)
	end;
	SubWorld=OldSubWorld;
end;

function OnFighting()
	str = "<#> Hi�n t�i"..szCaptainName[1].."��i <#> v� "..szCaptainName[2].."��i <#> �ang trong thi ��u l�i ��i, ng��i h�y ��i tr�n sau. ";
	Say(str, 1, "Ta �� bi�t r�i. /OnCancel");
end;

function OnCancel()
end;

function ErrorMsg(ErrorId)
	if (ErrorId == 1) then 
		Say("B�o danh tham gia thi ��u ph�i hai ng��i t� ch�c ��i sau �� m�i b�o danh ���c!",0)
	elseif (ErrorId == 2) then 
		Say("Song ph��ng tham gia thi ��u kh�ng �em �� ng�n l��ng.",0)
	elseif (ErrorId == 3) then 
		Say("B�o danh tham gia b� l�i, xin li�n h� GM!",0);
	elseif (ErrorId == 4) then 
		Say("B�n kh�ng ph�i l� ng��i b�o danh thi ��u n�n kh�ng th� v�o ��u tr��ng ch� c� th� xem ��u th�i!", 0);
	elseif (ErrorId == 5) then 
		Say("Ng��i b�o danh ph�i l� ��i tr��ng",0);
	elseif (ErrorId == 6) then 
		Say("B�n mang kh�ng �� ng�n l��ng tr�n ng��i!",0);
	elseif (ErrorId == 7) then 
		Say("Xin l�i! B�n ch�a b�o danh xem ��u!",0);
	elseif (ErrorId == 8) then
		Say("Xin l�i! ��u tr��ng thi ��u �� c� ng��i ��ng k� tr��c r�i!",0);
	elseif (ErrorId == 9) then 
		Say("Xin l�i! Thi ��u �� b�t ��u, b�n kh�ng th� ��t c��c n�a!",0);
	elseif (ErrorId == 10) then 
		Say("S� ng��i tham gia thi ��u �� ��!",0);
	else
		
	end;
	return
end;