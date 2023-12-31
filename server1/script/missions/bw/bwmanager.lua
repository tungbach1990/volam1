Include("\\script\\task\\newtask\\branch\\branch_bwsj.lua")
Include("\\script\\missions\\bw\\bwhead.lua");


szCaptainName = {};
function main()
--do Talk(1, "", "Ch鴆 n╪g  ng.") return end
	--设置返回点
	x,y,z = GetWorldPos();
	SetTask(BW_SIGNPOSWORLD, x);
	SetTask(BW_SIGNPOSX, y);
	SetTask(BW_SIGNPOSY, z);
	szCaptainName = bw_getcaptains(); --获取两队队长的名字；

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
		Say("Зy l� u trng thi u l玦 i, n琲 cho c竎 nh﹏ s� tr猲 giang h� n u ho芻 t� ch鴆 i thi u, hi謓 t筰 ch璦 ai b竜 danh thi u, c竎 h� mu鑞 b竜 danh kh玭g? <color=yellow>Hi謓 t筰 l玦 i m� c鯽 mi詎 ph�<color>", 3, "Л頲 th玦!/OnRegister", "Quy t綾 thi u ra sao?/OnHelp", "в ta suy ngh� l筰!/OnCancel");
	elseif (ms_state == 1) then
		Say("Зy l� u trng l玦 i, hi謓 t筰 i <color=yellow>"..szCaptainName[1].."<color> v� i <color=yellow>"..szCaptainName[2].."<color> thi u <color=yellow>"..MemberCount.." vs "..MemberCount.."<color>, ngi c� y猽 c莡 g� kh玭g?",4,"Ta l� i trng, mu鑞 bi誸 s� th� t� v祇 u trng./OnShowKey", "Ta l� tuy觧 th�, mu鑞 v祇 u trng./OnEnterMatch", "Ta mu鑞 xem tr薾 u n祔./OnLook", "Ta kh玭g h鴑g th� v韎 tr薾 u n祔./OnCancel")
	elseif (ms_state == 2) then 
		OnFighting();
	else
		ErrorMsg(2)
	end;
	SubWorld = OldSubWorld;
end;

function OnRegister()
	--报名
	if (GetTeamSize()  ~= 2) then
		Say("Mu鑞 b竜 danh thi u c莕 ph秈 l� <color=yellow>чi trng<color> c馻 hai b猲, i ng� c馻 ngi h譶h nh� kh玭g  <color=yellow>2<color> ngi.", 0);
		return
	end;

	if (IsCaptain() ~= 1) then 
		ErrorMsg(5)
		return
	end;

	Say("C竎 h� mu鑞 u l玦 i, s� ngi i b猲 nhi襲 nh蕋 bao nhi猽?", 9, "Th玦 kh醝!/OnCancel", "1 vs 1/#SignUpFinal(1)", "2 vs 2/#SignUpFinal( 2 )", "3 vs 3/#SignUpFinal( 3 )","4 vs 4/#SignUpFinal( 4 )","5 vs 5/#SignUpFinal( 5 )","6 vs 6/#SignUpFinal( 6 )","7 vs 7/#SignUpFinal( 7 )","8 vs 8/#SignUpFinal( 8 )");
end;

function SignUpFinal(MemberCount)
	if (GetTeamSize()  ~= 2) then
		Say("Mu鑞 b竜 danh thi u c莕 ph秈 l� <color=yellow>чi trng<color> c馻 hai b猲, i ng� c馻 ngi h譶h nh� kh玭g  <color=yellow>2<color> ngi.", 0);
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
		SetMissionS(CITYID,"Dng Ch﹗")
	elseif x == 78 then
		SetMissionS(CITYID,"Tng Dng")
	else
		SetMissionS(CITYID,"Th祅h Й")
	end;
	
	local key = {};
	key = bw_getkey();
	SetMissionV(MS_TEAMKEY[1], key[1]);
	SetMissionV(MS_TEAMKEY[2], key[2]);
	
	OldPlayerIndex = PlayerIndex;
	for i = 1, 2 do 
		PlayerIndex = GetTeamMember(i);
		SetMissionS(i, GetName());
		szCaptainName = bw_getcaptains(); --获取两队队长的名字；
		if (MemberCount > 1) then
			Msg2Player("чi h譶h c馻 c竎 h� s� th� t� v祇 u trng l�: <color=yellow> ["..key[i].."]<color>, xin th玭g b竜 cho th祅h vi猲 i s� th� t� n祔. Th祅h vi猲 g苝 C玭g B譶h T� nh藀 s� n祔 v祇 l� c� th� v祇 thi u.");			
			local szMsg = format("C玭g B譶h T�: Ngi  ng k� thi u gi鱝 %s v� %s, h穣 mau ch鉵g v祇 u trng,  tr薾 u s� ch輓h th鴆 b総 u sau %d ph髏. S� hi謚 u trng l�:<color=yellow>[%d]<color=>, h穣 th玭g b竜 s� n祔 cho c竎 ng i, h� s� ph秈 d飊g con s� n祔  v祇 u trng.",MemberCount, MemberCount, floor(GO_TIME/3),key[i])
			Say(szMsg,0)
			
		end
		branchTask_BW1()	--和任务相关，参加了比赛进行计数
	end;
	
	PlayerIndex = OldPlayerIndex;
	SetMissionV(MS_MAXMEMBERCOUNT, MemberCount)
	SubWorld = OldSubWorld;
	str = "<#> Hi謓 t筰"..GetMissionS(CITYID)..szCaptainName[1].."i <#> u v韎 "..szCaptainName[2].."i <#>, l玦 i thi u chu萵 b� v祇 u trng, i trng i b猲 l� "..szCaptainName[1].."<#> v� "..szCaptainName[2].."<#>. L玦 i m� c鯽 mi詎 ph�, hoan ngh猲h m鋓 ngi n xem thi u.";
	--AddGlobalNews(str);
	local szMsg = format("Ngi  ng k� thi u gi鱝 %s v� %s, h穣 mau ch鉵g v祇 u trng,  tr薾 u s� ch輓h th鴆 b総 u sau %d ph髏.",MemberCount, MemberCount, floor(GO_TIME/3))
	Msg2Team(szMsg);
end;

function bw_getkey()
	local key = {};
	key[1] = random(1, 9999)
	key[2] = random(1, 9999)
	
	--保证key1 key2>0, key1 ~= key2
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
	Talk(5, "",	"L玦 i thi u l� n琲  c竎 cao th� thi th� t礽 ngh� v韎 nhau c騨g l� n琲 thi u c玭g b籲g nh蕋 cho i b猲.",	"Mu鑞 tham gia l玦 i thi u, trc ti猲 ph秈 n ch� ta xin b竜 danh.",	"Sau khi t cc xong, b竜 danh tham gia l玦 i s� ho祅 t蕋. L� do u trng c� gi韎 h筺 n猲 trong l骳 ngi kh竎 產ng thi u, ngi kh竎 kh玭g th� b竜 danh!",	format("C玭g B譶h T�: Sau khi ng k� th祅h c玭g, hai b猲 c� th� v祇 khu v鵦 chu萵 b�, th阨 gian chu萵 b� l� <color=yellow>%d<color> ph髏, sau khi th阨 gian chu萵 b� k誸 th骳, tr薾 u s� ch輓h th鴆 b総 u!", floor(GO_TIME/3)) , 	format("C玭g B譶h T�: Th阨 gian thi u l� <color=yellow>%d<color> ph髏, n誹 trong %d ph髏 kh玭g x竎 nh 頲 i th緉g, tr薾 u s� 頲 x� h遖.", floor(TIMER_2/(60*FRAME2TIME))-floor(GO_TIME/3), floor(TIMER_2/(60*FRAME2TIME))-floor(GO_TIME/3) ));
end;

function OnEnterMatch()
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(BW_COMPETEMAP[1]);
	if (SubWorld < 0) then
		return
	end;
	
	if ((GetName() == szCaptainName[1]) or (GetName() == szCaptainName[2])) then 
		OnJoin(0)	--这里号码什么都可以 the only param stand for the group ID;
	else
		Say("Xin nh藀 s� th� t� tham gia thi u l玦 i l莕 n祔  v祇 u trng.",2, "Л頲 th玦! в ta nh藀 v祇/OnEnterKey", "Qu猲 s� th� t� r錳,  h醝 l筰 i trng/OnCancel")
	end;
	SubWorld = OldSubWorld;
end

function OnEnterKey()
	AskClientForNumber("OnEnterKey1", 0, 10000, "Xin nh藀 s� th� t� v祇 u trng:");
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
		Say("Xin l鏸! Nh藀 s� th� t� kh玭g ng, h穣 x竎 nh薾 l筰 s� th� t� ho芻 n h醝 l筰 i trng. C秏 琻!",0)
	end
	SubWorld = OldSubWorld;
end

function OnLook()
	idx = SubWorldID2Idx(BW_COMPETEMAP[1]);
	OldSubWorld = SubWorld;
	SubWorld = idx;
	local str = szCaptainName[1].."чi <#> v� "..szCaptainName[2].."i <#> s緋 b総 u thi u l玦 i, theo c竎 h� ai s� d祅h th緉g l頸 chung cu閏?";
	local str1 = "Ta mu鑞 v祇 u trng <#> xem/onwatch";
	Say(str, 2, str1, "Ta 畂竛 kh玭g ch輓h x竎, kh玭g v祇 u/OnCancel");
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
		OnJoin(0)	--队长不能进行观战
	else
		OnJoin(3);	--加入到观众的
	end;
end

--to join in a fight group	group --组
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
	str = "<#> Hi謓 t筰"..szCaptainName[1].."чi <#> v� "..szCaptainName[2].."i <#> 產ng trong thi u l玦 i, ngi h穣 i tr薾 sau. ";
	Say(str, 1, "Ta  bi誸 r錳. /OnCancel");
end;

function OnCancel()
end;

function ErrorMsg(ErrorId)
	if (ErrorId == 1) then 
		Say("B竜 danh tham gia thi u ph秈 hai ngi t� ch鴆 i sau  m韎 b竜 danh 頲!",0)
	elseif (ErrorId == 2) then 
		Say("Song phng tham gia thi u kh玭g 甧m  ng﹏ lng.",0)
	elseif (ErrorId == 3) then 
		Say("B竜 danh tham gia b� l鏸, xin li猲 h� GM!",0);
	elseif (ErrorId == 4) then 
		Say("B筺 kh玭g ph秈 l� ngi b竜 danh thi u n猲 kh玭g th� v祇 u trng ch� c� th� xem u th玦!", 0);
	elseif (ErrorId == 5) then 
		Say("Ngi b竜 danh ph秈 l� i trng",0);
	elseif (ErrorId == 6) then 
		Say("B筺 mang kh玭g  ng﹏ lng tr猲 ngi!",0);
	elseif (ErrorId == 7) then 
		Say("Xin l鏸! B筺 ch璦 b竜 danh xem u!",0);
	elseif (ErrorId == 8) then
		Say("Xin l鏸! u trng thi u  c� ngi ng k� trc r錳!",0);
	elseif (ErrorId == 9) then 
		Say("Xin l鏸! Thi u  b総 u, b筺 kh玭g th� t cc n鱝!",0);
	elseif (ErrorId == 10) then 
		Say("S� ngi tham gia thi u  !",0);
	else
		
	end;
	return
end;