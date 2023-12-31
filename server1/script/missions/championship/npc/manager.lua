Include("\\script\\missions\\championship\\head.lua")
Include("\\script\\event\\wulin_final_match\\wulin_watchticket.lua")
Include("\\script\\event\\wulin_final_match\\awardevent.lua")
Include("\\script\\tong\\tong_header.lua");

--武林大会官员
function main()
	--Say("武林大会官员：武林豪杰，逐鹿纷乱之世；天下英雄，齐集紫禁之巅。本次武林大会作为区域预选赛，将会选出90名武林高手作为代表本服的选手参加最终的全区全服武林大会！燃放你的激情，来投入这场轰轰烈烈的武林大会！", 1, "确认/want_bid_option")
	--	wulin_watchticketmain()
	wulin_awardmain()	--武林大会奖励入口
end

function str__findicon(string)
	len = strlen(string)
	for i = 1, len do 
		if (strbyte(string, i) == 93) then
			return 1
		end
	end
	return 0
end

function want_bid_option()
	local optiontab = {}
	if (validateDate(CP_BEGIN_BID_DATE, CP_END_BID_DATE)) then	--在竞选领队的时间时
		talkstr = "Mu鑞 tranh ch蕄 T鎛g L躰h i c馻 khu v鵦 �?"
		optiontab = {
						"Xem th阨 gian k誸 th骳 ch鋘 T鎛g l穘h i/look_endbid",
						"V祇 u trng V� l﹎ i h閕/transtoplace",
						"ta mu鑞 tranh ch蕄 T鎛g l穘h i khu v鵦 (c竎 Bang ch�) /want_bid",
						"Tra xem t鎛g v鑞 th竎h u hi謓 nay c馻 ta/look_bid_self",
						"Tra xem t譶h h譶h th竎h u hi謓 nay c馻 ta /look_bid_first",
						"Nh薾 danh hi謚 tuy觧 th� ki謙 xu蕋 /catch_title",
						"Gi髉  V� l﹎ i h閕/help_championship",
						"Ta s� quay l筰 sau!/OnCancel"
					}
	elseif(tonumber(date("%y%m%d%H")) >= CP_UPTO_TRYOUT) then
		talkstr = "Mu鑞 nh薾 t� c竎h tuy觧 th� c馻 khu v鵦 �?"	--已经决出总领队
		optiontab = {
						"B竜 danh tham gia li猲 u 'ki謙 xu蕋'/regist_freshman",
						"L穘h l筰 ti襫 th竎h u/give_back",
						"Nh薾 danh hi謚 tuy觧 th� ki謙 xu蕋 /catch_title",
						"L穘h l筰 ti襫 th竎h u (T鎛g L穘h i) /send_card",
						"Tra xem danh s竎h tuy觧 th� ki謙 xu蕋 v� tu c竎h thi u/look_card",
						"Gi髉  V� l﹎ i h閕/help_championship",
						"Ta s� quay l筰 sau!/OnCancel"
			}
	elseif (tonumber(date("%y%m%d%H")) > CP_END_BID_DATE) then
		Say("Ho箃 ng tranh ch蕄  k誸 th骳! Xin i tr薾 d� tuy觧 Чi h閕 V� l﹎ b総 u! Sau n祔 h穣 tra xem k誸 qu�. ", 0)
		return
	else
		Say(" Ho箃 ng V� l﹎ i h閕 hi謓 t筰 ch璦 b総 u! Vui l遪g ch� � tin t鴆 th玭g b竜!",0);
		return
	end

	Say(talkstr, getn(optiontab), optiontab)
end

function want_bid()
	if (GetTongFigure() ~= TONG_MASTER) then
		Say("Ch� c� Bang ch� m韎 c� t� c蕄 tham gia th竎h u, hay l� ngi v� 甶!", 0);
		return 0
	end
	if(GetLevel() < 90) then
		Say("Ъng c蕄 c馻 Bang ch� ph秈 l韓 h琻 c蕄 90 m韎 c� th� tranh ch蕄 T鎛g L穘h i! Ngi h穣 tr� v�!", 0)
		return
	end
	local strName = GetName();
	if (str__findicon(strName) == 0) then
		Say("S� ti襫 m鏸 l莕 u th莡 l� s� ch絥 100 v筺, gi� th蕄 nh蕋 l� 100 v筺 lng, m鏸 l莕 u th莡 nhi襲 nh蕋 l� 50 ng祅 v筺 lng. ", 2, "X竎 nh薾/sure_bid", "H駓 b� /OnCancel")
	end
end

function sure_bid()
	if (GetTongFigure() ~= TONG_MASTER) then
		Say("Ch� c� Bang ch� m韎 c� t� c蕄 tham gia th竎h u, hay l� ngi v� 甶!", 0);
		return 0
	end

	local flag = check_bid_title()
	if (not flag) then  
		return
	end
	AskClientForNumber("bit",1000000,500000000, "Xin nh藀 s� ti襫 u th莡 v祇:");
end

function check_bid_title()
	biwu_loadfile(LEVELTOP10)
	local name = GetName()
	for i =1 , 10 do 
		topten_name = biwu_getdata(LEVELTOP10, "LevelTop10", "Top"..i)
		if (name == topten_name) then
			Say("B筺  v祇 th� gi韎 th藀 i cao th�, c� t� c竎h tham gia v祇 Чi h閕 V� l﹎ ki謙 xu蕋! B筺 kh玭g th� tranh ch鴆 T鎛g L穘h i! H穣 v� 甶!", 0)
			return nil
		end
	end
	return 1
end


function bit(fee)
	if( fee < 1000000 ) then
		Say("Gi� tranh ch鴆 th蕄 nh蕋 l� 100 v筺.", 0);
		return 0
	end
	if( fee > 500000000 ) then
		Say("M鏸 l莕 tranh ch鴆 nhi襲 nh蕋 l� 50 ng祅 v筺 lng.", 0);
		return 0
	end
	if( GetCash() < fee ) then
		Say("B筺 kh玭g  ti襫, chu萵 b�  h穣 t韎 nh�!", 0);
		return 0
	end
	biwu_loadfile(BID_DATA);
	MasterName = GetName();
	intTongBid = tonumber(biwu_getdata(BID_DATA, MasterName, "Bid"));
	if (not intTongBid) then
		intTongBid = 0
	end
	intfee = floor(fee/1000000)
	if (mod(fee, 1000000) ~= 0) then
		dibs = mod(fee, 1000000)
		fee = intfee * 1000000
		Msg2Player(" S� ti襫 m鏸 l莕 tranh ch鴆 ph秈 l� s� ch絥 100 v筺, tr� l筰 b筺 ti襫 c遪 d�!"..dibs.." lng")
	end
	Pay(fee);
	fee = floor(fee/10000)
	if( intTongBid == 0 ) then
		biwu_setdata(BID_DATA, MasterName, "Bid", intfee);
		biwu_setdata(BID_DATA, MasterName, "MasterName", MasterName);
		biwu_save(BID_DATA);
		cp_saveback_count(fee)
		Ladder_NewLadder(10130, MasterName, intfee, 1);
print("the first bid")
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]tranh ch鴆"..fee.."v筺 lng.");
		Say("B筺 l莕 u n tranh ch鴆. S� ti襫 tranh ch鴆 l莕 n祔 l� "..fee.."v筺 lng. H� th鑞g  ghi t猲, s� ti襫 v� t礽 kho秐 c馻 b筺, thao t竎 tham gia tranh ch鴆 c馻 b筺  ho祅 th祅h.",0);
		Msg2SubWorld("Ngi ch琲 <color=blue> "..GetName().."<color> V鮝 m韎 tham d� tranh ch鴆 T鎛g l穘h i c馻 khu v鵦")
		return 1
	end
print("bid back bid")
	intTongBid = intTongBid + intfee;
	TongBid = 100 * intTongBid;
	biwu_setdata(BID_DATA, MasterName, "Bid", tostring(intTongBid));
	biwu_setdata(BID_DATA, MasterName, "MasterName", MasterName);
	biwu_save(BID_DATA);
	cp_saveback_count(TongBid)
	Ladder_NewLadder(10130, MasterName, intTongBid, 1);
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]ti誴 t鬰 tranh ch鴆"..fee.."v筺 lng. Hi謓 t鎛g s� ti襫 l� "..TongBid.."v筺 lng.");
		Say("S� ti襫 tranh ch鴆 l莕 n祔 c馻 b筺 l� "..fee.."v筺 lng. H� th鑞g  ghi t猲, s� ti襫 v� t礽 kho秐 c馻 b筺, thao t竎 tham gia tranh ch鴆 c馻 b筺  ho祅 th祅h.Cho n hi謓 nay, t鎛g s� ti襫 tranh ch鴆 c馻 b筺 l� "..TongBid.."v筺 lng.", 0);
		Msg2SubWorld("Ngi ch琲 <color=blue> "..GetName().."<color> V鮝 m韎 tham d� tranh ch鴆 T鎛g l穘h i c馻 khu v鵦")
	return 1
end

CP_SENDCARD_OPEN = 5052820
CP_SENDCARD_END = 5060420

function send_card()	--选择是否派发

	sendmonth , senddate , sendhour = look_the_time( CP_SENDCARD_OPEN )
	endmonth , enddate , endhour = look_the_time( CP_SENDCARD_END )
if ( tonumber( date( "%y%m%d%H" ) ) < CP_SENDCARD_OPEN ) then
	Say(" T鎛g L穘h i c遪 t� c竎h n "..sendmonth.."nguy謙 "..senddate.."nh藅 "..sendhour..", n"..endmonth.."nguy謙 "..enddate.."nh藅 "..endhour.." k誸 th骳", 0)
	return
end

if ( tonumber( date( "%y%m%d%H" ) ) > CP_SENDCARD_END ) then
	Say("T鎛g l躰h i ph竧 quy誸 t� c竎h tham gia v� l﹎ ki謙 xu蕋  k誸 th骳, b筺 c� th� n tra xem danh danh s竎h tuy觧 th� tr薾 v� l﹎ ki謙 xu蕋!", 0)
return
end

	local orgindex = PlayerIndex
	biwu_loadfile(BID_LEADER)
	local leader_name = biwu_getdata(BID_LEADER, "Leader_Name", "Name")
	if (GetName() ~= leader_name) then
		Say("B筺 kh玭g ph秈 l� T鎛g L穘h i khu v鵦, kh玭g c� t� c竎h ch鋘 t� c竎h tham gia tr薾 v� l﹎ ki謙 xu蕋!", 0)
		return
	end
	if ( IsCaptain() ~= 1 ) then
		Say("B筺 kh玭g ph秈 l� i trng, ph秈 do i trng c馻 nh鉳 ph竔 ra. ",0);
		return 0
	end
	MemCount = GetTeamSize();
	if ( MemCount <= 1 ) then
		Say("Trong i c馻 b筺 kh玭g c� th祅h vi猲 kh竎, kh玭g th� ph竔 ra.",0);
		return 0
	end
	local TeamMembers = "";
	for i = 2, MemCount do
		PlayerIndex = GetTeamMember(i);
		TeamMembers = TeamMembers..","..GetName()
	end
	PlayerIndex = orgindex
	Say("Ngi mu鑞 ph竔"..TeamMembers.."Tham gia v遪g chung k誸? N誹 ng c蕄 di 90 s� kh玭g  t� c竎h thi u. C莕 <color=yellow>"..endmonth.."nguy謙 "..enddate.."nh藅 "..endhour.." <color> k誸 th骳.", 2, "Mu鑞/ensure", "ta 產ng suy ngh� /OnCancel"); 
	return
end

function ensure(ncount)	--确认派发
	local tabname = {}
	local ncount = 0
	local orgindex = PlayerIndex
	MemCount = GetTeamSize();
	for i = 1, MemCount do
		PlayerIndex = GetTeamMember(i);
		
		cp_checkmember_title()	--确定当前队员身份
				
		if ( IsCaptain() ~= 1 and GetTask(CP_TASKID_TITLE) ~= 9 and GetLevel() >= 90) then --如果不是队长自己,并且没给过资格
			TeamMemberName = GetName();
			local flag = provide(TeamMemberName);
			if (not flag) then 
				PlayerIndex = orgindex
				Say("Ngi  h誸 quy襫 ph竔 ngi tham gia v遪g chung k誸", 0)
				WriteLog(date("%Y-%m-%d %H:%M:%S,")..GetAccount()..",["..GetName().."] T鎛g l穖h i  m韎 c� t� c竎h ph竔 ngi tham gia thi u!")
				break 
			end
			nt_settask(CP_TASKID_TITLE, 9)
			Title_AddTitle(19, 1, TITLETIME);	--这样是给自己加还是给队友？
			Title_ActiveTitle( 19 );
			Talk(1, "", "B筺 nh薾 頲 danh hi謚 tuy觧 th� V� l﹎ i h閕");
			Msg2SubWorld("Ch骳 m鮪g Ngi ch琲 ["..GetName().."]  nh薾 頲 t� c竎h tuy觧 th� V� l﹎ i h閕 ")
			WriteLog(date("%Y-%m-%d %H:%M:%S,")..GetAccount()..",["..GetName().."] T鎛g L穘h i x衪 duy謙 t� c竎h thi u")
		elseif( IsCaptain() ~= 1 and GetTask(CP_TASKID_TITLE) == 9 ) then
			Msg2Player("b筺  c� t� c竎h tuy觧 th� v遪g chung k誸")
		elseif( IsCaptain() ~= 1 and GetLevel() < 90 ) then
			Msg2Player("ng c蕄 c馻 b筺 ch璦 t n c蕄 90, kh玭g th� nh薾 t� c竎h tuy觧 th� v遪g chung k誸")
		end
	end
	PlayerIndex = orgindex
end

function provide(MemberName)	--派发资格
	biwu_loadfile(LEADER_MEMBER);
	MemberCount = tonumber(biwu_getdata(LEADER_MEMBER, "LeadMember", "Count"));	--取数，如果开始dat为空会不会有错，需要初始化吧？
	if (not MemberCount) then	--不知道dat为空会返回什么
		MemberCount = 0;
	end
	if ( MemberCount >= 29 ) then
		Say("S� i thi u c馻 khu v鵦 n祔  , b筺 kh玭g th� nh薾 頲 t� c竎h n祔.", 0);
		return nil
	end
	count = tostring(MemberCount + 1);
	biwu_setdata(LEADER_MEMBER, "LeadMember", "Count", count);	--计数
	biwu_setdata(LEADER_MEMBER, "LeadMember", "Member"..count, MemberName);
	biwu_setdata(LEADER_MEMBER, "LeadMember", "Fact"..count, tostring(GetLastFactionNumber()) )
	biwu_save(LEADER_MEMBER);
	return 1
end

function give_back()
	biwu_loadfile(BID_DATA)
	MasterName = GetName();
	TongBid = tonumber(biwu_getdata(BID_DATA, MasterName, "Bid"));
	if (not TongBid) then
		Say("B筺 ch璦 tham gia ho箃 ng tranh tuy觧 l穘h i, sao c騨g mu鑞 m筼 hi觤?", 0)
		return
	end
	biwu_loadfile(BID_LEADER)
	firstname = biwu_getdata(BID_LEADER, "Leader_Name", "Name")
	if (firstname ~= "" and firstname ~= nil and firstname == MasterName) then
		Say("B筺  tranh tuy觧 t� c竎h T鎛g L穘h i c馻 khu v鵦 n祔, kh玭g th� tr� l筰 ti襫 cho b筺!", 0)
		return
	end
	if (TongBid == 0) then
		Say("S� ti襫 tranh ch鴆 m� b筺 tranh tuy觧, ta  tr� b筺 r錳.", 0)
		return
	end
	if (nt_gettask(CP_TASKID_BACKCONT) <= 0) then
		Say("S� ti襫 tranh ch鴆 m� b筺 tranh tuy觧 ta  tr� h誸 cho b筺 r錳.", 0)
		return
	end
	Say("N誹 s� ti襫 l韓 h琻 50 ng筺 v筺 lng, b筺 s� 頲 tr� ti襫 m鏸 l莕 l韓 nh蕋 l� 50 ng祅 v筺 lng. Trc khi l穘h h穣 x竎 nh薾 b筺 c� th� mang 頲 s� ti襫 n祔.", 2, "Hi謓 ta  l穘h/sure_give_back", "ьi ch髏 ta quay l筰/OnCancel")
end

function sure_give_back()
	biwu_loadfile(BID_DATA)
	MasterName = GetName();
	TongBid = tonumber(biwu_getdata(BID_DATA, MasterName, "Bid"));
	if (not TongBid) then
		Say("B筺 ch璦 tham gia ho箃 ng tranh tuy觧 l穘h i, sao c騨g mu鑞 m筼 hi觤?", 0)
		return
	end
	biwu_loadfile(BID_LEADER)
	firstname = biwu_getdata(BID_LEADER, "Leader_Name", "Name")
	if (firstname ~= "" and firstname ~= nil and firstname == MasterName) then
		Say("B筺  tranh tuy觧 t� c竎h T鎛g L穘h i c馻 khu v鵦 n祔, kh玭g th� tr� l筰 ti襫 cho b筺!", 0)
		return
	end
	if (TongBid == 0) then
		Say("S� ti襫 tranh ch鴆 m� b筺 tranh tuy觧, ta  tr� b筺 r錳.", 0)
		return
	end
	if (nt_gettask(CP_TASKID_BACKCONT) <= 0) then
		Say("S� ti襫 tranh ch鴆 m� b筺 tranh tuy觧 ta  tr� h誸 cho b筺 r錳.", 0)
		return
	end

	if (GetCash() > 1500000000) then
		Say("H譶h nh� b筺 mang theo qu� nhi襲 ti襫, ti襫 c莕 tr� l筰 cho b筺 ta t筸 th阨 gi� l蕐. ьi n l骳 b筺 c� th� ng 頲 ti襫 r錳 h穣 n l穘h.", 0)
		return
	end

	BackBid = TongBid
	if (BackBid > 500) then
		BackBid = 500
		TongBid = TongBid - BackBid
		biwu_setdata(BID_DATA, MasterName, "Bid", tostring(TongBid));
		biwu_save(BID_DATA);
		BackBid = 500 * 1000000
		Earn(BackBid)
		nt_settask(CP_TASKID_BACKCONT, nt_gettask(CP_TASKID_BACKCONT) - 1)
		TongBid = TongBid * 100
		WriteLog(date("%Y%m%d %H:%M:%S")..GetAccount()..",["..GetName().."]nh薾 頲 50 ng祅 v筺 lng, c遪 l筰"..TongBid.."v筺 lng ch璦 tr�.")
		Say("V� s� ti襫 tranh ch鴆 c馻 b筺 l韓 h琻 50 ng祅 v筺 lng, ta tr� cho b筺 50 ng祅 v筺 lng trc, b筺 c遪 l筰<color=yellow>"..TongBid.."<color>v筺 lng � ch� ta, h穣 x竎 nh薾 h祅h trang c馻 b筺 c� th� ch鴄  ti襫 r錳 h穣 quay l筰 nh薾 ti襫!", 0)
	else
		BackBid = BackBid * 1000000
		biwu_setdata(BID_DATA, MasterName, "Bid", tostring(0))
		biwu_save(BID_DATA);
		Earn(BackBid)
		nt_settask(CP_TASKID_BACKCONT, 0)
		BackBid = BackBid/10000
		WriteLog(date("%Y%m%d %H:%M:%S")..GetAccount()..",["..GetName().."]nh薾 頲 ti襫 tr� l筰"..BackBid.."v筺 lng,  tr� l筰 t蕋 c� ti襫 tranh ch鴆.")
		Say("Ta tr�<color=yellow>"..BackBid.."<color>v筺 lng cho b筺, xin nh薾 l蕐!", 0)
	end
end

function catch_title()
	Say("B筺 mu鑞 nh薾 danh hi謚 n祇?", 5, "T鎛g L穘h i/leader", "Th藀 i cao th� th� gi韎/level_top10", "V� L﹎ Чi h閕 tuy觧 th� /nomal_player", "5 h筺g u c馻 m鏸 Th藀 i m玭 ph竔/#faction_top5("..GetLastFactionNumber()..")", "Kh玭g mu鑞/OnCancel");
end

function level_top10()	--世界十大领取称号
	biwu_loadfile(LEVELTOP10);
	for i = 1, 10 do
		Name = biwu_getdata(LEVELTOP10, "LevelTop10", "Top"..i);
		if ( GetName() == Name ) then
			nt_settask(CP_TASKID_TITLE, 9)
			Title_AddTitle(8, 1, TITLETIME);
			Title_ActiveTitle( 8 );
			WriteLog(date("%Y%m%d %H:%M:%S")..GetAccount()..",["..GetName().."] nh薾 頲 danh hi謚 Th藀 i cao th� V� l﹎ i h閕")
			Msg2Player("B筺 nh薾 頲 danh hi謚 Th藀 i cao th� V� l﹎ i h閕");
			return 1
		end
	end
	Say("B筺 kh玭g c� t� c竎h nh薾 danh hi謚 Th藀 i cao th� th� gi韎.", 0);
	return
end

function faction_top5(factionnumber)	--10大门派前五领取称号
	if( factionnumber < 0 or factionnumber > 9 ) then
		Say("B筺 kh玭g ph秈 ngi c馻 Th藀 i m玭 ph竔.", 0);
		return
	end
	if( tonumber(date("%y%m%d%H")) < CP_END_TRYOUT ) then
		Say("Tr薾 d� tuy觧 m玭 ph竔 hi謓 ch璦 k誸 th骳, ch璦 t譵 ra 5 h筺g ng d莡 m玭 ph竔, kh玭g th� c蕄 danh hi謚.", 0)
		return
	end
	biwu_loadfile( Faction[factionnumber + 1][1] );
		for i = 1, 5 do
		Name = biwu_getdata(Faction[factionnumber+1][1], Faction[factionnumber+1][2], "Top"..i);
		if ( GetName() == Name ) then
			nt_settask(CP_TASKID_TITLE, 9)
			Title_AddTitle(factionnumber + 9, 1, TITLETIME);
			Title_ActiveTitle(factionnumber + 9);
			WriteLog(date("%Y%m%d %H:%M:%S")..GetAccount()..",["..GetName().."]t 頲"..FactionTitle[factionnumber+1].."danh hi謚");
			Msg2Player("B筺 t 頲"..FactionTitle[factionnumber+1].."danh hi謚");
			return 1
		end
	end
	Say("B筺 kh玭g  t� c竎h nh薾 danh hi謚 Cao th� m玭 ph竔 V� l﹎ i h閕.",0);
	return
end

function nomal_player()
	biwu_loadfile(LEADER_MEMBER)
	count = tonumber(biwu_getdata(LEADER_MEMBER, "LeadMember", "Count"))
	if(not count ) then
		Say("Quan vi猲 V� l﹎ ki謙 xu蕋:T鎛g L穘h i ch璦 c蕄 ph竧 t� c竎h d� tuy觧 cho b筺, b筺 kh玭g c� t� c竎h  nh薾 danh hi謚!", 0)
		return
	end
	local name = GetName()
	for i = 1, count do
		mem_name = biwu_getdata(LEADER_MEMBER, "LeadMember", "Member"..i);
		if (mem_name == name) then
			nt_settask(CP_TASKID_TITLE, 9)
			Title_AddTitle(19, 1, TITLETIME);	--这样是给自己加还是给队友？
			Title_ActiveTitle( 19 );
			WriteLog(date("%Y%m%d %H:%M:%S")..GetAccount()..",["..GetName().."] nh薾 頲 danh hi謚 Tuy觧 th� V� l﹎ i h閕 ");
			Msg2Player("B筺 nh薾 頲 danh hi謚 Tuy觧 th� V� l﹎ i h閕");
			return
		end
	end
	Say("T鎛g L穘h i ch璦 c蕄 ph竧 t� c竎h d� tuy觧 cho b筺, b筺 kh玭g th� nh薾 c ﹏ n祔!", 0)
end

function leader()	--领队领取称号
	biwu_loadfile(BID_LEADER)
	local name = biwu_getdata(BID_LEADER, "Leader_Name", "Name")
	if(GetName() ~= name) then
		Say("B筺 kh玭g  t� c竎h nh薾 danh hi謚 L穘h i khu v鵦 n祔.", 0)
		return
	end
	nt_settask(CP_TASKID_TITLE, 9)
	Title_AddTitle(7, 1, TITLETIME);
	Title_ActiveTitle(7);
	WriteLog(date("%Y%m%d %H:%M:%S")..GetAccount()..",["..GetName().."] nh薾 頲 danh hi謚 T鎛g L穘h i V� L﹎ i h閕");
	Msg2Player("B筺 nh薾 頲 T鎛g L穘h i V� L﹎ i h閕");
end

function look_bid_first()
	local MasterName = Ladder_GetLadderInfo(10130, 1);
	if (not MasterName ) then
		Say("Hi謓 kh玭g c� ngi tranh ch鴆.", 0)
print("no new ladder1")
		return
	end
	if (MasterName == "") then
		Say("Hi謓 kh玭g c� ngi tranh ch鴆.", 0)
print("no new ladder2")
		return
	end
	Say("Hi謓 ngi tranh ch鴆 ngi tham gia tranh ch鴆 cao nh蕋 l�<color=yellow>"..MasterName.."<color> ngi ch琲.", 0)	
end

function look_bid_self()
	local tabmaster = {}
	local flag = 0
	biwu_loadfile(BID_DATA);
	MasterName = GetName();
	TongBid = tonumber(biwu_getdata(BID_DATA, MasterName, "Bid"));
	if( not TongBid ) then
		Say("B筺 ch璦 tham gia ho箃 ng tranh ch鴆, c� mu鑞 th� kh玭g?", 0)
		return
	end
	TongBid = TongBid * 100
	for i = 1, 10 do 
		tabmaster[i] = Ladder_GetLadderInfo(10130, i);
		if (MasterName == tabmaster[i]) then
			flag = i
			break
		end
	end
	if (flag == 0) then
		Say("S� ti襫 tranh ch鴆 c馻 b筺 hi謓 l� "..TongBid.."v筺 lng, ch璦 v祇 10 h筺g u.", 0)
	else
		Say("S� ti襫 tranh ch鴆 c馻 b筺 hi謓 l� "..TongBid.."v筺 lng, x誴 h筺g"..flag..", ", 0)
	end
end

function look_card()
	listtab = {
				"Danh s竎h Th藀 i cao th� th� gi韎 頲 tuy觧/look_list_topten",
				"5 h筺g u c馻 m鏸 m玭 ph竔 頲 tuy觧/look_list_factop",
				"T鎛g L穘h i v� c竎 tuy觧 th� kh竎/look_list_member",
				"c遪 g� p kh玭g?/OnCancel"
				}
	Say("B筺 mu鑞 xem danh s竎h n祇? ", getn(listtab), listtab)
end

function look_list_topten()
	biwu_loadfile(LEVELTOP10);
	local topten_mem = {}
	local ncount = 0;
	for i = 1, 10 do
		 name = biwu_getdata(LEVELTOP10, "LevelTop10", "Top"..i);
		 if (name ~= "" and name ~= nil) then
		 	ncount = ncount + 1
		 	topten_mem[ncount] = name.."/OnCancel"	
		 end
	end
	
	if (ncount > 0) then
		Say("Danh s竎h Th藀 i cao th� th� gi韎 頲 tuy觧 nh� sau: ", getn(topten_mem), topten_mem)
	else
		Say("Danh s竎h Th藀 i cao th� th� gi韎 hi謓 ch璦 xu蕋 hi謓. ", 0)
	end
end

function look_list_factop()
	if (tonumber(date("%y%m%d%H")) < CP_END_TRYOUT) then
		Say(" Tr薾 u ch璦 k誸 th骳, danh s竎h  t� c竎h 頲 tuy觧 � c竎 m玭 ph竔 ch璦 xu蕋 hi謓. ", 0)
		return
	end
local factab = {"Thi誹 L﹎/#look_list_fac(1)", "Thi猲 Vng/#look_list_fac(2)", "Л阯g M玭/#look_list_fac(3)", "Ng� чc/#look_list_fac(4)", "Nga Mi/#look_list_fac(5)", "Th髖 Y猲/#look_list_fac(6)", "C竔 Bang/#look_list_fac(7)", "Thi猲 Nh蒼/#look_list_fac(8)", "V� ng/#look_list_fac(9)", "C玭 L玭/#look_list_fac(10)" , "Kh玭g xem n鱝!/OnCancel"}
	Say("B筺 mu鑞 xem danh s竎h 頲 tuy觧 c馻 m玭 ph竔  �?", getn(factab), factab)
end

function look_list_fac(nfact)
	local ncount = 0
	biwu_loadfile( Faction[nfact][1] );
	local topfac_mem = {}
	for i = 1, 5 do
		name = biwu_getdata(Faction[nfact][1], Faction[nfact][2], "Top"..i);
		 if (name ~= "" and name ~= nil) then
		 	ncount = ncount + 1
		 	topfac_mem[ncount] = name.."/OnCancel"
		 end
	end
	if (ncount > 0) then
		Say("Quan vi猲 V� l﹎ ki謙 xu蕋:"..Faction[nfact][3].."Danh s竎h m玭 ph竔 tr髇g tuy觧:", getn(topfac_mem), topfac_mem);
	else
		Say("Quan vi猲 V� l﹎ ki謙 xu蕋:"..Faction[nfact][3].."Danh s竎h tr髇g tuy觧 thi u d� tuy觧 m玭 ph竔 v蒼 ch璦 c�.", 0)
	end
end

function look_list_member()
	local member_tab = {}
	biwu_loadfile(BID_LEADER)
	local leader_name = biwu_getdata(BID_LEADER, "Leader_Name", "Name")
	if (leader_name == "" or leader_name == nil) then
		Say("Hi謓 ch璦 c� T鎛g L穘h i.", 0)
		return
	end
	biwu_loadfile(LEADER_MEMBER);
	MemberCount = tonumber(biwu_getdata(LEADER_MEMBER, "LeadMember", "Count"));	--取数，如果开始dat为空会不会有错，需要初始化吧？
	if (not MemberCount) then	--不知道dat为空会返回什么
		MemberCount = 0;
		Say("T鎛g L穘h i<color=yellow> "..leader_name.." <color>Hi謓 ch璦 a ra b蕋 c� t� c竎h n祇 cho ngi ch琲 c遪 l筰.", 0)
		return
	end
	if (MemberCount <= 10) then
		member_tab = member_10_group(1, MemberCount)
		for i =1, getn(member_tab) do
			member_tab[i] = member_tab[i].."/OnCancel"
		end
		Say("T鎛g L穘h i c馻 khu v鵦 n祔 l�<color=yellow>"..leader_name.."<color>, hi謓  a ra t� c竎h tuy觧 th� g錷"..MemberCount.."ngi, danh s竎h nh� sau:", getn(member_tab), member_tab)
	else
		member_tab = member_10_group(1, 10)
		for i =1, getn(member_tab) do
			member_tab[i] = member_tab[i].."/#look_list_member1(10)"
		end
		Say("T鎛g L穘h i c馻 khu v鵦 n祔 l�<color=yellow>"..leader_name.."<color>, hi謓  a ra t� c竎h tuy觧 th� g錷"..MemberCount.."ngi, danh s竎h nh� sau:", getn(member_tab), member_tab)
	end				
end

function look_list_member1(count)
	local member_tab = {}
	biwu_loadfile(LEADER_MEMBER);
	MemberCount1 = tonumber(biwu_getdata(LEADER_MEMBER, "LeadMember", "Count"));	--取数，如果开始dat为空会不会有错，需要初始化吧？
	MemberCount1 = MemberCount1 - count
	count1 = count + 1
	if (MemberCount1 <= 10) then
		member_tab = member_10_group(count1, MemberCount)
		for i =1, getn(member_tab) do
			member_tab[i] = member_tab[i].."/OnCancel"
		end
		Say("Quan vi猲 V� l﹎ ki謙 xu蕋:", getn(member_tab), member_tab)
	else
		count2 = count + 10
		member_tab = member_10_group(count1, count2)
		for i =1, getn(member_tab) do
			member_tab[i] = member_tab[i].."/#look_list_member2(20)"
		end
		Say("Quan vi猲 V� l﹎ ki謙 xu蕋:", getn(member_tab), member_tab)
	end				
end

function look_list_member2(count)
	biwu_loadfile(LEADER_MEMBER);
	MemberCount1 = tonumber(biwu_getdata(LEADER_MEMBER, "LeadMember", "Count"));	--取数，如果开始dat为空会不会有错，需要初始化吧？
	count1 = count + 1
	member_tab = member_10_group(count1, MemberCount)
	for i =1, getn(member_tab) do
		member_tab[i] = member_tab[i].."/OnCancel"
	end
	Say("Quan vi猲 V� l﹎ ki謙 xu蕋:", getn(member_tab), member_tab)
end


function member_10_group(start, ending)
	biwu_loadfile(LEADER_MEMBER);
	local memtab = {}
	local count = ending - start + 1
	for i = 1, count do
		j = i + start - 1
		memtab[i] = biwu_getdata(LEADER_MEMBER, "LeadMember", "Member"..j);
	end
	return memtab
end

function cp_saveback_count(tol_money)
	if (mod(tol_money, 50000) > 0) then
		back_count = floor(tol_money / 50000) + 1
	else
		back_count = floor(tol_money / 50000)
	end
	nt_settask(CP_TASKID_BACKCONT, back_count)
end

function regist_champion()
Say("Tr薾 d� tuy觧 Чi h閕 V� l﹎ ki謙 xu蕋  k誸 th骳 t鑤 p. B﹜ gi� c� th� n ch� ta xem k誸 qu� thi u v� l穘h danh hi謚 tng 鴑g. Ch� mong V� l﹎ i h閕 b総 u.", 0)
do return end
	if (nt_gettask(CP_TASKID_REGIST) == 9) then
		Say(" B筺  t� b� t� c竎h thi u d� tuy觧 c竎 m玭 ph竔, kh玭g th� ti誴 t鬰 b竜 danh tham gia.", 0)
		return
	end
	
	biwu_loadfile(BID_LEADER )
	local leader_name = biwu_getdata(BID_LEADER, "Leader_Name", "Name")
	if (leader_name ~= "" and leader_name ~= nil) then
		if (GetName() == leader_name) then
			nt_settask(CP_TASKID_TITLE, 9)
		end
	end
	
	biwu_loadfile(LEVELTOP10)
	for i = 1, 10 do
		Name = biwu_getdata(LEVELTOP10, "LevelTop10", "Top"..i);
		if(Name ~= "" and Name ~= nil) then
			if ( GetName() == Name ) then
				nt_settask(CP_TASKID_TITLE, 9)
			end
		end
	end
	
	biwu_loadfile(LEADER_MEMBER)
	count = tonumber(biwu_getdata(LEADER_MEMBER, "LeadMember", "Count"))
	if(not count ) then
	else
		for i = 1, count do
			mem_name = biwu_getdata(LEADER_MEMBER, "LeadMember", "Member"..i);
			if (mem_name ~= "" and mem_name ~= nil) then
				if (mem_name == GetName()) then
					nt_settask(CP_TASKID_TITLE, 9)
				end
			end
		end
	end
	
	if (nt_gettask(CP_TASKID_TITLE) == 9) then		--已经取得决赛圈资格
		Say("B筺  nh薾 頲 t� c竎h tuy觧 th�, th� ng t韎 cp v� tr� n鱝!", 0)
		return
	end
	
	if (GetLevel() < 90) then
		Say("B筺 ph秈 t 頲 c蕄 90 tr� l猲 m韎 c� th� x﹎ nh藀 u trng V� l﹎ i h閕, h穣 ti誴 t鬰 luy謓 th猰!", 0)
		return
	end
	
	if (GetLastFactionNumber() == -1) then
		Say("V� L﹎ Minh Ch� c� l謓h: Ch� c� ngi c馻 Th藀 i ph竔 頲 tham gia Чi h閕 v� l﹎, ngi kh玭g m玭 kh玭g ph竔 kh玭g th� tham gia. Sau khi gia nh藀 Th藀 i ph竔 m韎 頲 tham gia thi u!", 0)
		return
	end
	
	if (nt_gettask(CP_TASKID_REGIST) == CP_UPTO_TRYOUT) then
		transtoplace()
	else
		local talkstr = "B竜 danh tham gia tr薾 d� tuy觧, c莕 n閜 10 v筺 lng ph� b竜 danh."
		Say(talkstr, 2, "Зy l� 10 v筺 lng./sure_regist", "в ta xem l筰/OnCancel")
		return
	end
end

function sure_regist()
	if (GetCash() >= CP_CASH) then
		Pay(CP_CASH)
		
		nt_settask(CP_TASKID_REGIST, CP_UPTO_TRYOUT)
		for i = 1084 , 1092 do
			nt_settask(i, 0)
		end

		transtoplace()
		return
	end
	Say("B筺 kh玭g c�  ph� b竜 danh,  10 v筺 h穣 quay l筰!", 0)

end

function regist_freshman()
	Msg2Player( " n S� gi� ki謙 xu蕋 b竜 danh tham gia thi u" )
	NewWorld( 176, 1624, 3233 )
end

function look_endbid()
	local endbid_year = floor(CP_END_BID_DATE / 1000000)
	local endbid_month = mod(floor(CP_END_BID_DATE / 10000), 100)
	local endbid_date = mod(floor(CP_END_BID_DATE / 100), 100)
	local endbid_hour = mod(CP_END_BID_DATE,100)
	Say(" T鎛g L穘h i c� t� c竎h n"..endbid_month.."nguy謙 "..endbid_date.."nh藅 "..endbid_hour.." gi� k誸 th骳, th阨 gian hi謓 gi� l� "..date("d ng祔% %m th竛g %Y n╩ H gi� "), 0)	
end

function look_the_time( THETIME )
	local the_year = floor(THETIME / 1000000)
	local the_month = mod(floor(THETIME / 10000), 100)
	local the_date = mod(floor(THETIME / 100), 100)
	local the_hour = mod(THETIME,100)
	return	the_month, the_date, the_hour
end

function cp_checkmember_title()

		biwu_loadfile(BID_LEADER)
		Name = biwu_getdata(BID_LEADER, "Leader_Name", "Name")
		if (GetName() == Name) then
			nt_settask(CP_TASKID_TITLE, 9)
		end

		factionnumber = GetLastFactionNumber()
		biwu_loadfile( Faction[factionnumber + 1][1] );
		for i = 1, 5 do
			Name = biwu_getdata(Faction[factionnumber+1][1], Faction[factionnumber+1][2], "Top"..i);
			if ( GetName() == Name ) then
				nt_settask(CP_TASKID_TITLE, 9)
			end
		end
		
		biwu_loadfile(LEVELTOP10);
		for i = 1, 10 do
			Name = biwu_getdata(LEVELTOP10, "LevelTop10", "Top"..i);
			if ( GetName() == Name ) then
				nt_settask(CP_TASKID_TITLE, 9)
			end
		end
end