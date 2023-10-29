Include("\\script\\missions\\championship\\head.lua")
Include("\\script\\event\\wulin_final_match\\wulin_watchticket.lua")
Include("\\script\\event\\wulin_final_match\\awardevent.lua")
Include("\\script\\tong\\tong_header.lua");

--���ִ���Ա
function main()
	--Say("���ִ���Ա�����ֺ��ܣ���¹����֮��������Ӣ�ۣ��뼯�Ͻ�֮�ۡ��������ִ����Ϊ����Ԥѡ��������ѡ��90�����ָ�����Ϊ��������ѡ�ֲμ����յ�ȫ��ȫ�����ִ�ᣡȼ����ļ��飬��Ͷ���ⳡ������ҵ����ִ�ᣡ", 1, "ȷ��/want_bid_option")
	--	wulin_watchticketmain()
	wulin_awardmain()	--���ִ�ά�����
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
	if (validateDate(CP_BEGIN_BID_DATE, CP_END_BID_DATE)) then	--�ھ�ѡ��ӵ�ʱ��ʱ
		talkstr = "Mu�n tranh ch�p T�ng L�nh ��i c�a khu v�c �?"
		optiontab = {
						"Xem th�i gian k�t th�c ch�n T�ng l�nh ��i/look_endbid",
						"V�o ��u tr��ng V� l�m ��i h�i/transtoplace",
						"ta mu�n tranh ch�p T�ng l�nh ��i khu v�c (c�c Bang ch�) /want_bid",
						"Tra xem t�ng v�n th�ch ��u hi�n nay c�a ta/look_bid_self",
						"Tra xem t�nh h�nh th�ch ��u hi�n nay c�a ta /look_bid_first",
						"Nh�n danh hi�u tuy�n th� ki�t xu�t /catch_title",
						"Gi�p �� V� l�m ��i h�i/help_championship",
						"Ta s� quay l�i sau!/OnCancel"
					}
	elseif(tonumber(date("%y%m%d%H")) >= CP_UPTO_TRYOUT) then
		talkstr = "Mu�n nh�n t� c�ch tuy�n th� c�a khu v�c �?"	--�Ѿ����������
		optiontab = {
						"B�o danh tham gia li�n ��u 'ki�t xu�t'/regist_freshman",
						"L�nh l�i ti�n th�ch ��u/give_back",
						"Nh�n danh hi�u tuy�n th� ki�t xu�t /catch_title",
						"L�nh l�i ti�n th�ch ��u (T�ng L�nh ��i) /send_card",
						"Tra xem danh s�ch tuy�n th� ki�t xu�t v� tu c�ch thi ��u/look_card",
						"Gi�p �� V� l�m ��i h�i/help_championship",
						"Ta s� quay l�i sau!/OnCancel"
			}
	elseif (tonumber(date("%y%m%d%H")) > CP_END_BID_DATE) then
		Say("Ho�t ��ng tranh ch�p �� k�t th�c! Xin ��i tr�n d� tuy�n ��i h�i V� l�m b�t ��u! Sau n�y h�y tra xem k�t qu�. ", 0)
		return
	else
		Say(" Ho�t ��ng V� l�m ��i h�i hi�n t�i ch�a b�t ��u! Vui l�ng ch� � tin t�c th�ng b�o!",0);
		return
	end

	Say(talkstr, getn(optiontab), optiontab)
end

function want_bid()
	if (GetTongFigure() ~= TONG_MASTER) then
		Say("Ch� c� Bang ch� m�i c� t� c�p tham gia th�ch ��u, hay l� ng��i v� �i!", 0);
		return 0
	end
	if(GetLevel() < 90) then
		Say("��ng c�p c�a Bang ch� ph�i l�n h�n c�p 90 m�i c� th� tranh ch�p T�ng L�nh ��i! Ng��i h�y tr� v�!", 0)
		return
	end
	local strName = GetName();
	if (str__findicon(strName) == 0) then
		Say("S� ti�n m�i l�n ��u th�u l� s� ch�n 100 v�n, gi� th�p nh�t l� 100 v�n l��ng, m�i l�n ��u th�u nhi�u nh�t l� 50 ng�n v�n l��ng. ", 2, "X�c nh�n/sure_bid", "H�y b� /OnCancel")
	end
end

function sure_bid()
	if (GetTongFigure() ~= TONG_MASTER) then
		Say("Ch� c� Bang ch� m�i c� t� c�p tham gia th�ch ��u, hay l� ng��i v� �i!", 0);
		return 0
	end

	local flag = check_bid_title()
	if (not flag) then  
		return
	end
	AskClientForNumber("bit",1000000,500000000, "Xin nh�p s� ti�n ��u th�u v�o:");
end

function check_bid_title()
	biwu_loadfile(LEVELTOP10)
	local name = GetName()
	for i =1 , 10 do 
		topten_name = biwu_getdata(LEVELTOP10, "LevelTop10", "Top"..i)
		if (name == topten_name) then
			Say("B�n �� v�o th� gi�i th�p ��i cao th�, c� t� c�ch tham gia v�o ��i h�i V� l�m ki�t xu�t! B�n kh�ng th� tranh ch�c T�ng L�nh ��i! H�y v� �i!", 0)
			return nil
		end
	end
	return 1
end


function bit(fee)
	if( fee < 1000000 ) then
		Say("Gi� tranh ch�c th�p nh�t l� 100 v�n.", 0);
		return 0
	end
	if( fee > 500000000 ) then
		Say("M�i l�n tranh ch�c nhi�u nh�t l� 50 ng�n v�n l��ng.", 0);
		return 0
	end
	if( GetCash() < fee ) then
		Say("B�n kh�ng �� ti�n, chu�n b� �� h�y t�i nh�!", 0);
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
		Msg2Player(" S� ti�n m�i l�n tranh ch�c ph�i l� s� ch�n 100 v�n, tr� l�i b�n ti�n c�n d�!"..dibs.." l��ng")
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
		WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]tranh ch�c"..fee.."v�n l��ng.");
		Say("B�n l�n ��u ��n tranh ch�c. S� ti�n tranh ch�c l�n n�y l� "..fee.."v�n l��ng. H� th�ng �� ghi t�n, s� ti�n v� t�i kho�n c�a b�n, thao t�c tham gia tranh ch�c c�a b�n �� ho�n th�nh.",0);
		Msg2SubWorld("Ng��i ch�i <color=blue> "..GetName().."<color> V�a m�i tham d� tranh ch�c T�ng l�nh ��i c�a khu v�c")
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
	WriteLog(date("%Y-%m-%d %H:%M:%S").." "..GetAccount()..", ["..GetName().."]ti�p t�c tranh ch�c"..fee.."v�n l��ng. Hi�n t�ng s� ti�n l� "..TongBid.."v�n l��ng.");
		Say("S� ti�n tranh ch�c l�n n�y c�a b�n l� "..fee.."v�n l��ng. H� th�ng �� ghi t�n, s� ti�n v� t�i kho�n c�a b�n, thao t�c tham gia tranh ch�c c�a b�n �� ho�n th�nh.Cho ��n hi�n nay, t�ng s� ti�n tranh ch�c c�a b�n l� "..TongBid.."v�n l��ng.", 0);
		Msg2SubWorld("Ng��i ch�i <color=blue> "..GetName().."<color> V�a m�i tham d� tranh ch�c T�ng l�nh ��i c�a khu v�c")
	return 1
end

CP_SENDCARD_OPEN = 5052820
CP_SENDCARD_END = 5060420

function send_card()	--ѡ���Ƿ��ɷ�

	sendmonth , senddate , sendhour = look_the_time( CP_SENDCARD_OPEN )
	endmonth , enddate , endhour = look_the_time( CP_SENDCARD_END )
if ( tonumber( date( "%y%m%d%H" ) ) < CP_SENDCARD_OPEN ) then
	Say(" T�ng L�nh ��i c�n t� c�ch ��n "..sendmonth.."nguy�t "..senddate.."nh�t "..sendhour..", ��n"..endmonth.."nguy�t "..enddate.."nh�t "..endhour.." k�t th�c", 0)
	return
end

if ( tonumber( date( "%y%m%d%H" ) ) > CP_SENDCARD_END ) then
	Say("T�ng l�nh ��i ph�t quy�t t� c�ch tham gia v� l�m ki�t xu�t �� k�t th�c, b�n c� th� ��n tra xem danh danh s�ch tuy�n th� tr�n v� l�m ki�t xu�t!", 0)
return
end

	local orgindex = PlayerIndex
	biwu_loadfile(BID_LEADER)
	local leader_name = biwu_getdata(BID_LEADER, "Leader_Name", "Name")
	if (GetName() ~= leader_name) then
		Say("B�n kh�ng ph�i l� T�ng L�nh ��i khu v�c, kh�ng c� t� c�ch ch�n t� c�ch tham gia tr�n v� l�m ki�t xu�t!", 0)
		return
	end
	if ( IsCaptain() ~= 1 ) then
		Say("B�n kh�ng ph�i l� ��i tr��ng, ph�i do ��i tr��ng c�a nh�m ph�i ra. ",0);
		return 0
	end
	MemCount = GetTeamSize();
	if ( MemCount <= 1 ) then
		Say("Trong ��i c�a b�n kh�ng c� th�nh vi�n kh�c, kh�ng th� ph�i ra.",0);
		return 0
	end
	local TeamMembers = "";
	for i = 2, MemCount do
		PlayerIndex = GetTeamMember(i);
		TeamMembers = TeamMembers..","..GetName()
	end
	PlayerIndex = orgindex
	Say("Ng��i mu�n ph�i"..TeamMembers.."Tham gia v�ng chung k�t? N�u ��ng c�p d��i 90 s� kh�ng �� t� c�ch thi ��u. C�n <color=yellow>"..endmonth.."nguy�t "..enddate.."nh�t "..endhour.." <color> k�t th�c.", 2, "Mu�n/ensure", "ta �ang suy ngh� /OnCancel"); 
	return
end

function ensure(ncount)	--ȷ���ɷ�
	local tabname = {}
	local ncount = 0
	local orgindex = PlayerIndex
	MemCount = GetTeamSize();
	for i = 1, MemCount do
		PlayerIndex = GetTeamMember(i);
		
		cp_checkmember_title()	--ȷ����ǰ��Ա���
				
		if ( IsCaptain() ~= 1 and GetTask(CP_TASKID_TITLE) ~= 9 and GetLevel() >= 90) then --������Ƕӳ��Լ�,����û�����ʸ�
			TeamMemberName = GetName();
			local flag = provide(TeamMemberName);
			if (not flag) then 
				PlayerIndex = orgindex
				Say("Ng��i �� h�t quy�n ph�i ng��i tham gia v�ng chung k�t", 0)
				WriteLog(date("%Y-%m-%d %H:%M:%S,")..GetAccount()..",["..GetName().."] T�ng l�mh ��i  m�i c� t� c�ch ph�i ng��i tham gia thi ��u!")
				break 
			end
			nt_settask(CP_TASKID_TITLE, 9)
			Title_AddTitle(19, 1, TITLETIME);	--�����Ǹ��Լ��ӻ��Ǹ����ѣ�
			Title_ActiveTitle( 19 );
			Talk(1, "", "B�n nh�n ���c danh hi�u tuy�n th� V� l�m ��i h�i");
			Msg2SubWorld("Ch�c m�ng Ng��i ch�i ["..GetName().."] �� nh�n ���c t� c�ch tuy�n th� V� l�m ��i h�i ")
			WriteLog(date("%Y-%m-%d %H:%M:%S,")..GetAccount()..",["..GetName().."] T�ng L�nh ��i x�t duy�t t� c�ch thi ��u")
		elseif( IsCaptain() ~= 1 and GetTask(CP_TASKID_TITLE) == 9 ) then
			Msg2Player("b�n �� c� t� c�ch tuy�n th� v�ng chung k�t")
		elseif( IsCaptain() ~= 1 and GetLevel() < 90 ) then
			Msg2Player("��ng c�p c�a b�n ch�a ��t ��n c�p 90, kh�ng th� nh�n t� c�ch tuy�n th� v�ng chung k�t")
		end
	end
	PlayerIndex = orgindex
end

function provide(MemberName)	--�ɷ��ʸ�
	biwu_loadfile(LEADER_MEMBER);
	MemberCount = tonumber(biwu_getdata(LEADER_MEMBER, "LeadMember", "Count"));	--ȡ���������ʼdatΪ�ջ᲻���д���Ҫ��ʼ���ɣ�
	if (not MemberCount) then	--��֪��datΪ�ջ᷵��ʲô
		MemberCount = 0;
	end
	if ( MemberCount >= 29 ) then
		Say("S� ��i thi ��u c�a khu v�c n�y �� ��, b�n kh�ng th� nh�n ���c t� c�ch n�y.", 0);
		return nil
	end
	count = tostring(MemberCount + 1);
	biwu_setdata(LEADER_MEMBER, "LeadMember", "Count", count);	--����
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
		Say("B�n ch�a tham gia ho�t ��ng tranh tuy�n l�nh ��i, sao c�ng mu�n m�o hi�m?", 0)
		return
	end
	biwu_loadfile(BID_LEADER)
	firstname = biwu_getdata(BID_LEADER, "Leader_Name", "Name")
	if (firstname ~= "" and firstname ~= nil and firstname == MasterName) then
		Say("B�n �� tranh tuy�n t� c�ch T�ng L�nh ��i c�a khu v�c n�y, kh�ng th� tr� l�i ti�n cho b�n!", 0)
		return
	end
	if (TongBid == 0) then
		Say("S� ti�n tranh ch�c m� b�n tranh tuy�n, ta �� tr� b�n r�i.", 0)
		return
	end
	if (nt_gettask(CP_TASKID_BACKCONT) <= 0) then
		Say("S� ti�n tranh ch�c m� b�n tranh tuy�n ta �� tr� h�t cho b�n r�i.", 0)
		return
	end
	Say("N�u s� ti�n l�n h�n 50 ng�n v�n l��ng, b�n s� ���c tr� ti�n m�i l�n l�n nh�t l� 50 ng�n v�n l��ng. Tr��c khi l�nh h�y x�c nh�n b�n c� th� mang ���c s� ti�n n�y.", 2, "Hi�n ta �� l�nh/sure_give_back", "��i ch�t ta quay l�i/OnCancel")
end

function sure_give_back()
	biwu_loadfile(BID_DATA)
	MasterName = GetName();
	TongBid = tonumber(biwu_getdata(BID_DATA, MasterName, "Bid"));
	if (not TongBid) then
		Say("B�n ch�a tham gia ho�t ��ng tranh tuy�n l�nh ��i, sao c�ng mu�n m�o hi�m?", 0)
		return
	end
	biwu_loadfile(BID_LEADER)
	firstname = biwu_getdata(BID_LEADER, "Leader_Name", "Name")
	if (firstname ~= "" and firstname ~= nil and firstname == MasterName) then
		Say("B�n �� tranh tuy�n t� c�ch T�ng L�nh ��i c�a khu v�c n�y, kh�ng th� tr� l�i ti�n cho b�n!", 0)
		return
	end
	if (TongBid == 0) then
		Say("S� ti�n tranh ch�c m� b�n tranh tuy�n, ta �� tr� b�n r�i.", 0)
		return
	end
	if (nt_gettask(CP_TASKID_BACKCONT) <= 0) then
		Say("S� ti�n tranh ch�c m� b�n tranh tuy�n ta �� tr� h�t cho b�n r�i.", 0)
		return
	end

	if (GetCash() > 1500000000) then
		Say("H�nh nh� b�n mang theo qu� nhi�u ti�n, ti�n c�n tr� l�i cho b�n ta t�m th�i gi� l�y. ��i ��n l�c b�n c� th� ��ng ���c ti�n r�i h�y ��n l�nh.", 0)
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
		WriteLog(date("%Y%m%d %H:%M:%S")..GetAccount()..",["..GetName().."]nh�n ���c 50 ng�n v�n l��ng, c�n l�i"..TongBid.."v�n l��ng ch�a tr�.")
		Say("V� s� ti�n tranh ch�c c�a b�n l�n h�n 50 ng�n v�n l��ng, ta tr� cho b�n 50 ng�n v�n l��ng tr��c, b�n c�n l�i<color=yellow>"..TongBid.."<color>v�n l��ng � ch� ta, h�y x�c nh�n h�nh trang c�a b�n c� th� ch�a �� ti�n r�i h�y quay l�i nh�n ti�n!", 0)
	else
		BackBid = BackBid * 1000000
		biwu_setdata(BID_DATA, MasterName, "Bid", tostring(0))
		biwu_save(BID_DATA);
		Earn(BackBid)
		nt_settask(CP_TASKID_BACKCONT, 0)
		BackBid = BackBid/10000
		WriteLog(date("%Y%m%d %H:%M:%S")..GetAccount()..",["..GetName().."]nh�n ���c ti�n tr� l�i"..BackBid.."v�n l��ng, �� tr� l�i t�t c� ti�n tranh ch�c.")
		Say("Ta tr�<color=yellow>"..BackBid.."<color>v�n l��ng cho b�n, xin nh�n l�y!", 0)
	end
end

function catch_title()
	Say("B�n mu�n nh�n danh hi�u n�o?", 5, "T�ng L�nh ��i/leader", "Th�p ��i cao th� th� gi�i/level_top10", "V� L�m ��i h�i tuy�n th� /nomal_player", "5 h�ng ��u c�a m�i Th�p ��i m�n ph�i/#faction_top5("..GetLastFactionNumber()..")", "Kh�ng mu�n/OnCancel");
end

function level_top10()	--����ʮ����ȡ�ƺ�
	biwu_loadfile(LEVELTOP10);
	for i = 1, 10 do
		Name = biwu_getdata(LEVELTOP10, "LevelTop10", "Top"..i);
		if ( GetName() == Name ) then
			nt_settask(CP_TASKID_TITLE, 9)
			Title_AddTitle(8, 1, TITLETIME);
			Title_ActiveTitle( 8 );
			WriteLog(date("%Y%m%d %H:%M:%S")..GetAccount()..",["..GetName().."]�� nh�n ���c danh hi�u Th�p ��i cao th� V� l�m ��i h�i")
			Msg2Player("B�n nh�n ���c danh hi�u Th�p ��i cao th� V� l�m ��i h�i");
			return 1
		end
	end
	Say("B�n kh�ng c� t� c�ch nh�n danh hi�u Th�p ��i cao th� th� gi�i.", 0);
	return
end

function faction_top5(factionnumber)	--10������ǰ����ȡ�ƺ�
	if( factionnumber < 0 or factionnumber > 9 ) then
		Say("B�n kh�ng ph�i ng��i c�a Th�p ��i m�n ph�i.", 0);
		return
	end
	if( tonumber(date("%y%m%d%H")) < CP_END_TRYOUT ) then
		Say("Tr�n d� tuy�n m�n ph�i hi�n ch�a k�t th�c, ch�a t�m ra 5 h�ng ��ng d�u m�n ph�i, kh�ng th� c�p danh hi�u.", 0)
		return
	end
	biwu_loadfile( Faction[factionnumber + 1][1] );
		for i = 1, 5 do
		Name = biwu_getdata(Faction[factionnumber+1][1], Faction[factionnumber+1][2], "Top"..i);
		if ( GetName() == Name ) then
			nt_settask(CP_TASKID_TITLE, 9)
			Title_AddTitle(factionnumber + 9, 1, TITLETIME);
			Title_ActiveTitle(factionnumber + 9);
			WriteLog(date("%Y%m%d %H:%M:%S")..GetAccount()..",["..GetName().."]��t ���c"..FactionTitle[factionnumber+1].."danh hi�u");
			Msg2Player("B�n ��t ���c"..FactionTitle[factionnumber+1].."danh hi�u");
			return 1
		end
	end
	Say("B�n kh�ng �� t� c�ch nh�n danh hi�u Cao th� m�n ph�i V� l�m ��i h�i.",0);
	return
end

function nomal_player()
	biwu_loadfile(LEADER_MEMBER)
	count = tonumber(biwu_getdata(LEADER_MEMBER, "LeadMember", "Count"))
	if(not count ) then
		Say("Quan vi�n V� l�m ki�t xu�t:T�ng L�nh ��i ch�a c�p ph�t t� c�ch d� tuy�n cho b�n, b�n kh�ng c� t� c�ch �� nh�n danh hi�u!", 0)
		return
	end
	local name = GetName()
	for i = 1, count do
		mem_name = biwu_getdata(LEADER_MEMBER, "LeadMember", "Member"..i);
		if (mem_name == name) then
			nt_settask(CP_TASKID_TITLE, 9)
			Title_AddTitle(19, 1, TITLETIME);	--�����Ǹ��Լ��ӻ��Ǹ����ѣ�
			Title_ActiveTitle( 19 );
			WriteLog(date("%Y%m%d %H:%M:%S")..GetAccount()..",["..GetName().."]�� nh�n ���c danh hi�u Tuy�n th� V� l�m ��i h�i ");
			Msg2Player("B�n nh�n ���c danh hi�u Tuy�n th� V� l�m ��i h�i");
			return
		end
	end
	Say("T�ng L�nh ��i ch�a c�p ph�t t� c�ch d� tuy�n cho b�n, b�n kh�ng th� nh�n ��c �n n�y!", 0)
end

function leader()	--�����ȡ�ƺ�
	biwu_loadfile(BID_LEADER)
	local name = biwu_getdata(BID_LEADER, "Leader_Name", "Name")
	if(GetName() ~= name) then
		Say("B�n kh�ng �� t� c�ch nh�n danh hi�u L�nh ��i khu v�c n�y.", 0)
		return
	end
	nt_settask(CP_TASKID_TITLE, 9)
	Title_AddTitle(7, 1, TITLETIME);
	Title_ActiveTitle(7);
	WriteLog(date("%Y%m%d %H:%M:%S")..GetAccount()..",["..GetName().."]�� nh�n ���c danh hi�u T�ng L�nh ��i V� L�m ��i h�i");
	Msg2Player("B�n nh�n ���c T�ng L�nh ��i V� L�m ��i h�i");
end

function look_bid_first()
	local MasterName = Ladder_GetLadderInfo(10130, 1);
	if (not MasterName ) then
		Say("Hi�n kh�ng c� ng��i tranh ch�c.", 0)
print("no new ladder1")
		return
	end
	if (MasterName == "") then
		Say("Hi�n kh�ng c� ng��i tranh ch�c.", 0)
print("no new ladder2")
		return
	end
	Say("Hi�n ng��i tranh ch�c ng��i tham gia tranh ch�c cao nh�t l�<color=yellow>"..MasterName.."<color> ng��i ch�i.", 0)	
end

function look_bid_self()
	local tabmaster = {}
	local flag = 0
	biwu_loadfile(BID_DATA);
	MasterName = GetName();
	TongBid = tonumber(biwu_getdata(BID_DATA, MasterName, "Bid"));
	if( not TongBid ) then
		Say("B�n ch�a tham gia ho�t ��ng tranh ch�c, c� mu�n th� kh�ng?", 0)
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
		Say("S� ti�n tranh ch�c c�a b�n hi�n l� "..TongBid.."v�n l��ng, ch�a v�o 10 h�ng ��u.", 0)
	else
		Say("S� ti�n tranh ch�c c�a b�n hi�n l� "..TongBid.."v�n l��ng, x�p h�ng"..flag..", ", 0)
	end
end

function look_card()
	listtab = {
				"Danh s�ch Th�p ��i cao th� th� gi�i ���c tuy�n/look_list_topten",
				"5 h�ng ��u c�a m�i m�n ph�i ���c tuy�n/look_list_factop",
				"T�ng L�nh ��i v� c�c tuy�n th� kh�c/look_list_member",
				"c�n g� ��p kh�ng?/OnCancel"
				}
	Say("B�n mu�n xem danh s�ch n�o? ", getn(listtab), listtab)
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
		Say("Danh s�ch Th�p ��i cao th� th� gi�i ���c tuy�n nh� sau: ", getn(topten_mem), topten_mem)
	else
		Say("Danh s�ch Th�p ��i cao th� th� gi�i hi�n ch�a xu�t hi�n. ", 0)
	end
end

function look_list_factop()
	if (tonumber(date("%y%m%d%H")) < CP_END_TRYOUT) then
		Say(" Tr�n ��u ch�a k�t th�c, danh s�ch �� t� c�ch ���c tuy�n � c�c m�n ph�i ch�a xu�t hi�n. ", 0)
		return
	end
local factab = {"Thi�u L�m/#look_list_fac(1)", "Thi�n V��ng/#look_list_fac(2)", "���ng M�n/#look_list_fac(3)", "Ng� ��c/#look_list_fac(4)", "Nga Mi/#look_list_fac(5)", "Th�y Y�n/#look_list_fac(6)", "C�i Bang/#look_list_fac(7)", "Thi�n Nh�n/#look_list_fac(8)", "V� �ang/#look_list_fac(9)", "C�n L�n/#look_list_fac(10)" , "Kh�ng xem n�a!/OnCancel"}
	Say("B�n mu�n xem danh s�ch ���c tuy�n c�a m�n ph�i �� �?", getn(factab), factab)
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
		Say("Quan vi�n V� l�m ki�t xu�t:"..Faction[nfact][3].."Danh s�ch m�n ph�i tr�ng tuy�n:", getn(topfac_mem), topfac_mem);
	else
		Say("Quan vi�n V� l�m ki�t xu�t:"..Faction[nfact][3].."Danh s�ch tr�ng tuy�n thi ��u d� tuy�n m�n ph�i v�n ch�a c�.", 0)
	end
end

function look_list_member()
	local member_tab = {}
	biwu_loadfile(BID_LEADER)
	local leader_name = biwu_getdata(BID_LEADER, "Leader_Name", "Name")
	if (leader_name == "" or leader_name == nil) then
		Say("Hi�n ch�a c� T�ng L�nh ��i.", 0)
		return
	end
	biwu_loadfile(LEADER_MEMBER);
	MemberCount = tonumber(biwu_getdata(LEADER_MEMBER, "LeadMember", "Count"));	--ȡ���������ʼdatΪ�ջ᲻���д���Ҫ��ʼ���ɣ�
	if (not MemberCount) then	--��֪��datΪ�ջ᷵��ʲô
		MemberCount = 0;
		Say("T�ng L�nh ��i<color=yellow> "..leader_name.." <color>Hi�n ch�a ��a ra b�t c� t� c�ch n�o cho ng��i ch�i c�n l�i.", 0)
		return
	end
	if (MemberCount <= 10) then
		member_tab = member_10_group(1, MemberCount)
		for i =1, getn(member_tab) do
			member_tab[i] = member_tab[i].."/OnCancel"
		end
		Say("T�ng L�nh ��i c�a khu v�c n�y l�<color=yellow>"..leader_name.."<color>, hi�n �� ��a ra t� c�ch tuy�n th� g�m"..MemberCount.."ng��i, danh s�ch nh� sau:", getn(member_tab), member_tab)
	else
		member_tab = member_10_group(1, 10)
		for i =1, getn(member_tab) do
			member_tab[i] = member_tab[i].."/#look_list_member1(10)"
		end
		Say("T�ng L�nh ��i c�a khu v�c n�y l�<color=yellow>"..leader_name.."<color>, hi�n �� ��a ra t� c�ch tuy�n th� g�m"..MemberCount.."ng��i, danh s�ch nh� sau:", getn(member_tab), member_tab)
	end				
end

function look_list_member1(count)
	local member_tab = {}
	biwu_loadfile(LEADER_MEMBER);
	MemberCount1 = tonumber(biwu_getdata(LEADER_MEMBER, "LeadMember", "Count"));	--ȡ���������ʼdatΪ�ջ᲻���д���Ҫ��ʼ���ɣ�
	MemberCount1 = MemberCount1 - count
	count1 = count + 1
	if (MemberCount1 <= 10) then
		member_tab = member_10_group(count1, MemberCount)
		for i =1, getn(member_tab) do
			member_tab[i] = member_tab[i].."/OnCancel"
		end
		Say("Quan vi�n V� l�m ki�t xu�t:", getn(member_tab), member_tab)
	else
		count2 = count + 10
		member_tab = member_10_group(count1, count2)
		for i =1, getn(member_tab) do
			member_tab[i] = member_tab[i].."/#look_list_member2(20)"
		end
		Say("Quan vi�n V� l�m ki�t xu�t:", getn(member_tab), member_tab)
	end				
end

function look_list_member2(count)
	biwu_loadfile(LEADER_MEMBER);
	MemberCount1 = tonumber(biwu_getdata(LEADER_MEMBER, "LeadMember", "Count"));	--ȡ���������ʼdatΪ�ջ᲻���д���Ҫ��ʼ���ɣ�
	count1 = count + 1
	member_tab = member_10_group(count1, MemberCount)
	for i =1, getn(member_tab) do
		member_tab[i] = member_tab[i].."/OnCancel"
	end
	Say("Quan vi�n V� l�m ki�t xu�t:", getn(member_tab), member_tab)
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
Say("Tr�n d� tuy�n ��i h�i V� l�m ki�t xu�t �� k�t th�c t�t ��p. B�y gi� c� th� ��n ch� ta xem k�t qu� thi ��u v� l�nh danh hi�u t��ng �ng. Ch� mong V� l�m ��i h�i b�t ��u.", 0)
do return end
	if (nt_gettask(CP_TASKID_REGIST) == 9) then
		Say(" B�n �� t� b� t� c�ch thi ��u d� tuy�n c�c m�n ph�i, kh�ng th� ti�p t�c b�o danh tham gia.", 0)
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
	
	if (nt_gettask(CP_TASKID_TITLE) == 9) then		--�Ѿ�ȡ�þ���Ȧ�ʸ�
		Say("B�n �� nh�n ���c t� c�ch tuy�n th�, th� ��ng t�i c��p v� tr� n�a!", 0)
		return
	end
	
	if (GetLevel() < 90) then
		Say("B�n ph�i ��t ���c c�p 90 tr� l�n m�i c� th� x�m nh�p ��u tr��ng V� l�m ��i h�i, h�y ti�p t�c luy�n th�m!", 0)
		return
	end
	
	if (GetLastFactionNumber() == -1) then
		Say("V� L�m Minh Ch� c� l�nh: Ch� c� ng��i c�a Th�p ��i ph�i ���c tham gia ��i h�i v� l�m, ng��i kh�ng m�n kh�ng ph�i kh�ng th� tham gia. Sau khi gia nh�p Th�p ��i ph�i m�i ���c tham gia thi ��u!", 0)
		return
	end
	
	if (nt_gettask(CP_TASKID_REGIST) == CP_UPTO_TRYOUT) then
		transtoplace()
	else
		local talkstr = "B�o danh tham gia tr�n d� tuy�n, c�n n�p 10 v�n l��ng ph� b�o danh."
		Say(talkstr, 2, "��y l� 10 v�n l��ng./sure_regist", "�� ta xem l�i/OnCancel")
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
	Say("B�n kh�ng c� �� ph� b�o danh, �� 10 v�n h�y quay l�i!", 0)

end

function regist_freshman()
	Msg2Player( " ��n S� gi� ki�t xu�t b�o danh tham gia thi ��u" )
	NewWorld( 176, 1624, 3233 )
end

function look_endbid()
	local endbid_year = floor(CP_END_BID_DATE / 1000000)
	local endbid_month = mod(floor(CP_END_BID_DATE / 10000), 100)
	local endbid_date = mod(floor(CP_END_BID_DATE / 100), 100)
	local endbid_hour = mod(CP_END_BID_DATE,100)
	Say(" T�ng L�nh ��i c� t� c�ch ��n"..endbid_month.."nguy�t "..endbid_date.."nh�t "..endbid_hour.." gi� k�t th�c, th�i gian hi�n gi� l� "..date("d ng�y% %m th�ng %Y n�m H gi� "), 0)	
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