TV_LASTTIME_BUY = 1600
TV_TICKET1 = 1601
TV_TICKET2 = 1602
IncludeLib("FILESYS")
IncludeLib("ITEM")



function IsCharged()
	if( GetExtPoint( 0 ) >= 1 ) then
		return 1;
	else
		return 0;
	end
end

--��Ʒ	����	magicscriptID
TAB_LOTTERY_BONUS = 
{
{"V� l�m quan ch�ng l�nh", 0, 443,1},
{"Ph�c Duy�n (��i) ",0.05,124,1},
{"Ph�c Duy�n (trung) ",0.05,123,1},
{"Ph�c Duy�n (ti�u) ",0.05,122,1},
{"Ti�n Th�o L� ",0.1,71,1},
{"Thi�n s�n  B�o L� ",0.1,72,1},
{"B�ch Qu� L� ",0.1,73,1},
{"Ph�o Hoa",0.15,11,0},
{"Mai Kh�i Hoa V� ",0.2,20,0},
{"T�m T�m T��ng �nh ph� ",0.2,18,1},
};

TAB_TICKETBUY =
{
	{0712,20, 20},
	{0713,20,20},
 	{0714,30,30},
 	{0715,30, 30},
 	{0716,25,25},
 	
 	
 	{0717,35,35},
 	{0718,7,8},
 	{0719,7,8},
 	{0720,7,8},
 	{0721,7,8},
	{0722,5,5},
 	{0723,5,5},
};

function wulin_watchticketmain()
	local nowdate = tonumber(date ("%m%d%H") )
	local today = tonumber(date("%m%d"))
	local bCheckTicket1 = 0
	local bCheckTicket2 = 0
	local matchday = 0
	
	local nowhour = tonumber(date("%H")) 
	--������ڻ�û�е����յ���Ʊʱ�䣬��Ŀǰ�ҵĽ�Ϊ����Ľ�
	print("sadbeginf")
	if ( nowhour < 20) then
		local yesterday = today - 1
		local idx = wulin_day2buytabidx(yesterday)

		--�������û������Ʊ���򲻶ҽ��ˣ�Ŀǰ��ƱҲ��Ȼ�ǹ��ڵġ�
		if (idx == 0) then
			bCheckTicket1 = 0
			bCheckTicket2 = 0
			wulin_clearticket()
		else
			--�ϴ����Ʊ�Ѿ������������
			print("now match1")
			if (floor(GetTask(TV_LASTTIME_BUY) / 100) ~= yesterday) then
				wulin_clearticket()
			else
				if (GetTask(TV_TICKET1) ~= 0) then
					bCheckTicket1 = 1
				end
				if (GetTask(TV_TICKET2) ~= 0) then
					bCheckTicket2 = 1
				end
			end
		end
	else
		--������ڵ��˵��յ��򽱻򿪽�ʱ�䣬�����������21��00 > and  < 23����Ŀǰ�ҵĽ��Ǳ��յ�һ�ڣ����> 23��ҵ��Ǳ��յ�һ���ڶ��ڵ�
		
		--����ϴ����Ʊ���ǽ����Ʊ��������ˣ����
		if (floor(GetTask(TV_LASTTIME_BUY) / 100) ~= today) then
			wulin_clearticket()
		else
			if (nowhour == 21) then
				if (GetTask(TV_TICKET1) ~= 0) then
					bCheckTicket1 = 1
				end
			elseif(nowhour == 23) then
				if (GetTask(TV_TICKET1) ~= 0) then
					bCheckTicket1 = 1
				end
				if (GetTask(TV_TICKET2) ~= 0) then
					bCheckTicket2 = 1
				end	
			end
		end
	end
	
	if (bCheckTicket1 == 1 or bCheckTicket2 == 1) then
		local checktab = {};
		if (bCheckTicket1 == 1) then
			checktab[getn(checktab) + 1] = "21:00 M� th��ng v� l�m quan ch�ng l�nh/#wulin_checkticket(1)";
		end
		if (bCheckTicket2 == 1) then
			checktab[getn(checktab) + 1] = "23:00 M� th��ng v� l�m quan ch�ng l�nh/#wulin_checkticket(2)";
		end
		checktab[getn(checktab) + 1] = "Kh�ng c�n!/OnCancel"
		Say("B�n hi�n t�i ch�a nh�n ph�n th��ng v� l�m quan ch�ng l�nh, b�n c� mu�n nh�n kh�ng?", getn(checktab), checktab)
		return
	end
	
	--�����������Ʊʱ��
	if (nowhour == 20 or nowhour == 22) then
		
		if (IsCharged() == 0) then
			Say("Xin l�i! Mu�n tham gia ho�t ��ng n�y c�n ph�i n�p th�! B�n v�n ch�a n�p th�! Nhanh l�n �i! ��ng b� l� c� h�i!", 0)
			return 
		end
		
		local buyidx = wulin_day2buytabidx(today)
		if (buyidx == 0) then
			Say("Xin l�i! Hi�n ch�a b�n v� s� V� L�m quan ch�ng l�nh! H�y quay l�i sau nh�!",0)
			return 
		end
		if (GetTask(TV_LASTTIME_BUY) >= tonumber(nowdate)) then
			Say("B�n �� mua m�t t� v� s� cho ho�t ��ng V� l�m quan ch�ng l�nh! H�y ��i m� th��ng nh�!", 0)
			return 0
		end
		
		--�����ҵ�ǰ��Ʊ�Ѿ��ǹ��ڵ��ˣ���ô�����ЩƱ
		if (wulin_TicketIsTimeout() == 1) then
			SetTask(TV_TICKET1, 0)
			SetTask(TV_TICKET2, 0)
			SetTask(TV_LASTTIME_BUY,0)
		end
		
		local phase = 0
		if (nowhour == 20 ) then
			phase = 1
		else
			phase = 2
		end

		Say("Ch� c�n d�ng 10 l��ng mua 1 t� v� s� (m�i giai �o�n ch� ���c mua 1 t�) . M�i ng�y t� 20:00-21:00 m�t l�n v� 22:00-23:00 m�t l�n",2, "���c!/#wulin_payfor_ticket("..phase..")", "Kh�ng c�n/OnCancel")
		return
	else
		Say("Xin l�i! V� s�m t� 20:00-21:00 v� 22:00-23:00 m�i b�n! B�y gi� kh�ch quan c� vi�c g� c�n gi�p �� kh�ng?",2,"Ta mu�n t�m hi�u ho�t ��ng V� l�m quan ch�ng l�nh/wulin_OnHelp", "Kh�ng c�n/OnCancel")
		return
	end

end
function wulin_OnHelp()
	Say("M�i ng�y t� 20:00-21:00 v� 22:00-23:00, t�t c� m�i ng��i ch�i �� n�p th� ��u c� th� ��n L�m An g�p V� l�m Quan vi�n: n�p 10 v�n l��ng la c� th� tham gia tuy�n ch�n",2,"Trang k� /wulin_OnHelp1","��ng/OnCancel")
end

function wulin_OnHelp1()
	Say("M�i ng�y v�o l�c 21:00 v� 23:00, h� th�ng s� t�ng cho ng��i ch�i tr�ng th��ng m�t trong: Ti�n Th�o l�, Thi�n S�n B�o L�, B�ch Qu� L�, Ph�c Duy�n L�, Ph�o hoa, Mai Kh�i Hoa V�, T�m T�m T��ng �nh Ph�",2,"Trang k� /wulin_OnHelp2","��ng/OnCancel")
end

function wulin_OnHelp2()
	Say("Ng��i ch�i tr�ng th��ng, tr��c 20:00 ng�y h�m sau ph�i ��n L�m An g�p V� l�m Quan vi�n nh�n V� L�m quan ch�ng l�nh, qu� th�i gian s� kh�ng th� nh�n. Tr��c 24h:00 c�a ng�y th� 2 c�n ph�i x�c nh�n t� c�ch 'Quan ch�ng l�nh' m�i c� th� ��ng nh�p Servre thi ��u!",2,"Trang k� /wulin_OnHelp3","��ng/OnCancel")
end



function wulin_OnHelp3()
	Say("Sau khi ��ng nh�p Servre thi ��u, c� th� ��n g�p V� l�m Quan vi�n t�i 7 th�nh th� �� x�c nh�n t� c�ch. Sau �� v�o ��u tr��ng xem thi ��u!",0)
end;

function OnCancel()
end

function wulin_getnowstate()
	local today = tonumber(date("%m%d"))
	local nowhour = tonumber(date("%H"))
	local bCheckTicket1 = 0
	local bCheckTicket2 = 0
	local ticketday = today
	
	if ( nowhour < 20) then
		local yesterday = today - 1
		ticketday = yesterday
		local idx = wulin_day2buytabidx(yesterday)
		
		--�������û������Ʊ���򲻶ҽ��ˣ�Ŀǰ��ƱҲ��Ȼ�ǹ��ڵġ�
		if (idx == 0) then
			bCheckTicket1 = 0
			bCheckTicket2 = 0
			wulin_clearticket()
		else
			--�ϴ����Ʊ�Ѿ������������
			if (floor(GetTask(TV_LASTTIME_BUY) / 100) ~= yesterday) then
				wulin_clearticket()
			else
				if (GetTask(TV_TICKET1) ~= 0) then
					bCheckTicket1 = 1
				end
				if (GetTask(TV_TICKET2) ~= 0) then
					bCheckTicket2 = 1
				end
			end
		end
	else
		--������ڵ��˵��յ��򽱻򿪽�ʱ�䣬�����������21��00 > and  < 23����Ŀǰ�ҵĽ��Ǳ��յ�һ�ڣ����> 23��ҵ��Ǳ��յ�һ���ڶ��ڵ�
		
		--����ϴ����Ʊ���ǽ����Ʊ��������ˣ����
		if (floor(GetTask(TV_LASTTIME_BUY) / 100) ~= today) then
			wulin_clearticket()
		else
			if (nowhour == 21) then
				if (GetTask(TV_TICKET1) ~= 0) then
					bCheckTicket1 = 1
				end
			elseif(nowhour == 23) then
				if (GetTask(TV_TICKET1) ~= 0) then
					bCheckTicket1 = 1
				end
				if (GetTask(TV_TICKET2) ~= 0) then
					bCheckTicket2 = 1
				end	
			end
		end
	end
	print(ticketday..","..bCheckTicket1..","..bCheckTicket2)
	return ticketday, bCheckTicket1, bCheckTicket2

end	
	
	
	
function wulin_checkticket(phase)	
	local ticketday , bCheckTicket1, bCheckTicket2 = wulin_getnowstate()
	if (phase == 1 ) then
		if (bCheckTicket1 == 0) then
			return
		end
	end
	
	if (phase == 2 ) then
		if (bCheckTicket2 == 0) then
			return
		end
	end
	
	local file = wulin_getcurticketfile(ticketday, phase)
	if (file == "") then
		return
	end
	
	wulin_loadfile(file)
	local bticketstart = tonumber(wulin_getdata(file, "TICKET", "IsBonusCreate"))
	if (bticketstart == 0) then
		Say("Xin l�i! V�n ch�a ��n gi� m� th��ng! H�y quay l�i sau nh�!", 0) 
		wulin_start_lottery(phase)
		return 
	end
	local ticketid = 0
	if (phase == 1) then
		ticketid = GetTask(TV_TICKET1)
		SetTask(TV_TICKET1,0)
	elseif (phase == 2) then
		ticketid = GetTask(TV_TICKET2)
		SetTask(TV_TICKET2,0)
	end
	
	if (ticketid == 0) then
		return
	end
	
	if (GetName() ~= wulin_getdata(file, "TICKET", "Ticket"..ticketid)) then
		return
	end
	
	local bonusid = tonumber(wulin_getdata(file, "TICKET", "Bonus"..ticketid))
	if ( bonusid == 1) then
		local itemidx = AddItem(6,1,TAB_LOTTERY_BONUS[1][3],1,0,0,0)
		Msg2Player("Ch�c m�ng b�n nh�n ���c 1 "..TAB_LOTTERY_BONUS[1][1].." ");
		Say("Ch�c m�ng b�n nh�n ���c 1 "..TAB_LOTTERY_BONUS[1][1].." ",0)
		local ticket_mon = floor(tonumber(ticketday) / 100)
		local ticket_day = mod(tonumber(ticketday), 100)

		SetSpecItemParam(itemidx, 1, ticket_mon)
		SetSpecItemParam(itemidx, 2, ticket_day+1)
		
		local str = "Ch�c m�ng ng��i ch�i nh�n ���c "..GetName().." nh�n ���c"..TAB_LOTTERY_BONUS[1][1].." "
		AddGlobalNews(str)
		wulin_setdata(file, "TICKET", "Ticket"..ticketid, GetName().."_END")
		wulin_save(file)
		WriteLog(str)
	elseif (bonusid == 0) then
			local randbonus = random(1,100) 
			local curbonus = 0
			local bonus_data = 0
			for i = 2, getn(TAB_LOTTERY_BONUS) do 
				bonus_data = bonus_data + TAB_LOTTERY_BONUS[i][2]*100
				if (bonus_data >= randbonus) then
					curbonus = i
					break;
				end
			end
			if (curbonus == 0) then
				local msgstr = "Xin l�i! B�n kh�ng nh�n ���c ph�n th��ng ��t n�y! Nh�ng v�n c�n nhi�u c� h�i! Ti�p t�c tham gia nh�!"
				Say(msgstr,0)
				Msg2Player(msgstr)
				return
			end
			
			AddItem(6,TAB_LOTTERY_BONUS[curbonus][4],TAB_LOTTERY_BONUS[curbonus][3],1,0,0,0)
			local msgmsg = "Ch�c m�ng b�n nh�n ���c 1 "..TAB_LOTTERY_BONUS[curbonus][1].." "
			Msg2Player(msgmsg);
			local str = "Ch�c m�ng"..GetName().."nh�n ���c 1 "..TAB_LOTTERY_BONUS[curbonus][1].." "
			Say(msgmsg, 0)
			wulin_setdata(file, "TICKET", "Ticket"..ticketid, GetName().."_END")
			wulin_setdata(file, "TICKET", "Bonus"..ticketid, curbonus)
			wulin_save(file)
			WriteLog(str)
	end
end

function wulin_payfor_ticket(phase)
	if (phase ~= 1 and phase ~= 2) then
		print("Error!!!pay for errror phase ticket ,wulin")
		return
	end
	if (GetCash() < 100000) then
		Say("Ng�n l��ng c�a ng��i kh�ng ��! H�y quay l�i sau nh�! Nh�ng ph�i tranh th� th�i gian ��y!", 0) 
		return
	end
	Pay(100000);
	wulin_sure_buyticket(phase)
end
 
function wulin_day2buytabidx(day)
	for i = 1, getn(TAB_TICKETBUY) do
		if (tonumber(day) == TAB_TICKETBUY[i][1]) then
			return i
		end
	end
	return 0
end

function wulin_canbuyticket()
	local nowdate = date("%m%d%H")
	local nowhour = date("%H")
	if (nowhour == 20 or nowhour == 22) then
		if (GetTask(TV_LASTTIME_BUY) >= tonumber(nowdate)) then
			return 0
		end
	else
		return 1
	end
end

--��õ�ǰ������Ʊ����Ӧ�������ļ�
function wulin_getcurticketfile(nowdate, no)
	if (no ~= 1 and no ~= 2) then
		return ""
	end
	
	local idx = wulin_day2buytabidx(nowdate)
	local filename = ""
	
	if (idx >  0 ) then
	 	filename = "\\data\\WULIN_TICKET_"..nowdate.."_"..no..".dat"
	else
		filename = ""
	end
	return filename, nowdate
end

function wulin_GetTicketPhase()
	local nowhour = tonumber(date("%H"))
	if (nowhour == 20) then
		return 1
	elseif (nowhour == 22) then
		return 2
	else 
		return 0
	end
end

function wulin_BuyTicket()
	local nowday = date("%m%d") 
	local buyidx = wulin_day2buytabidx(nowday)
	if (buyidx == 0) then
		Say("Xin l�i! B�n �� xin ph�p 1 l�n r�i! B�y gi� kh�ng th� xin ph�p n�a!", 0)
		return 
	end
	
	local nowdate = date("%m%d%H")
	if (wulin_canbuyticket() == 1) then
			Say("Xin l�i! B�n �� xin ph�p 1 l�n r�i! B�y gi� kh�ng th� xin ph�p n�a!", 0)
			return
	end
end

function wulin_TicketIsTimeout()
	local lastdate = tonumber(date("%m%d20"))
	if (GetTask(TV_LASTTIME_BUY) < lastdate) then
		return 1 --������
	else
		return 0 --��δ����
	end
end

function wulin_sure_buyticket(no)
	print("sure")
	local today = tonumber(date("%m%d"))
	local nowdate  = tonumber(date("%m%d%H"))
	local nowhour = tonumber(date("%H"))
	if (nowhour == 20 or nowhour == 22) then
		local buyidx = wulin_day2buytabidx(today)
		
		if (buyidx == 0) then
			Say("Xin l�i! Hi�n ch�a b�n v� s� V� L�m quan ch�ng l�nh! H�y quay l�i sau nh�!",0)
			return 
		end
		if (GetTask(TV_LASTTIME_BUY) >= nowdate) then
			Say("Xin l�i! B�n �� xin ph�p 1 l�n r�i! B�y gi� kh�ng th� xin ph�p n�a!", 0)
			return 0
		end
		
		local phase = 0
		if (nowhour == 20) then
			phase = 1
		else
			phase = 2
		end
		
		if (phase ~= no) then
			print("ddd")
			return
		end
	else
		Say("Xin l�i! Ho�t ��ng m�i ng�y ch� t� 20:00-21:00 v� 22:00-23:00. Gi� �� h�y ��n nh�!",0)
		return
	end
	
	local filename = wulin_getcurticketfile(today,no)
	if (filename == "") then
		print("asd3f")
		return 
	end
	wulin_loadfile(filename)
	local ticketcount = wulin_getdata(filename, "TICKET", "Count")
	if (ticketcount == nil or ticketcount == "") then
		ticketcount = 0
	else
		ticketcount = tonumber(ticketcount)
	end
	if (ticketcount == 0) then
			wulin_setdata(filename, "TICKET", "IsBonusCreate", 0)
	end
	ticketcount = ticketcount + 1 
	
	wulin_setdata(filename, "TICKET", "Count", tostring(ticketcount))
	wulin_setdata(filename, "TICKET", "Ticket"..ticketcount, GetName())
	wulin_setdata(filename, "TICKET", "Bonus"..ticketcount, "0")
	wulin_save(filename)
	local msgstr = "";
	if (no == 1) then
		SetTask(TV_TICKET1, ticketcount)
		msgstr = "Ng��i �� �� t� c�ch V� L�m quan ch�ng l�nh. Sau 21h:00 v� tr��c 20h:00 ng�y h�m sau c� th� ��n g�p ta �� nh�n th��ng! Ngo�i th�i gian �� v� hi�u!";	
	else
		SetTask(TV_TICKET2, ticketcount)			
		msgstr = "Ng��i �� �� t� c�ch V� L�m quan ch�ng l�nh. Sau 23h:00 v� tr��c 20h:00 ng�y h�m sau c� th� ��n g�p ta �� nh�n th��ng! Ngo�i th�i gian �� v� hi�u!"
	end
	SetTask(TV_LASTTIME_BUY, nowdate)
	Msg2Player(msgstr)
	Say(msgstr, 0)
end

--����Ʊ
function wulin_start_lottery(no)
	local nowday = 		 wulin_getnowstate()
	local filename, lotterydate = wulin_getcurticketfile(nowday, no)
	wulin_loadfile(filename)
	local ticketcount = tonumber(wulin_getdata(filename, "TICKET", "Count"))
	local idx = wulin_day2buytabidx(lotterydate)
	if (idx == 0) then
		print("asdfsdf"..lotterydate)
		return
	end
	local no1count = TAB_TICKETBUY[idx][no + 1];
	local tab_lottery = {};
	local restticket = ticketcount
	
	local nbonuscount = 0;
	nbonuscount =  TAB_TICKETBUY[idx][no+1];
	
	if (restticket < nbonuscount) then
		nbonuscount = restticket
	end
	
	wulin_lottery_create(filename, 1, nbonuscount, ticketcount)
	restticket = restticket - nbonuscount
	wulin_setdata(filename, "TICKET", "IsBonusCreate", 1)
	wulin_save(filename)
end

function wulin_lottery_create(lotteryfile, lotteryno, count, maxticket)
	if (count == 0) then
		return
	end
	wulin_loadfile(lotteryfile)
	local m = 0
	for i = 1, count do 
		local bfind = 0
		while(bfind == 0) do
			m =  random(1, maxticket)
			local bonus = tonumber(wulin_getdata(lotteryfile, "TICKET", "Bonus"..m))
			if (bonus == 0) then
				wulin_setdata(lotteryfile, "TICKET", "Bonus"..m, lotteryno)
				wulin_save(lotteryfile)
				local Name = wulin_getdata(lotteryfile, "TICKET", "Ticket"..m)
				WriteLog(date("%m%d%H%M").."�� c� k�t qu� tr�ng th��ng:"..lotteryno..", ng��i tr�ng th��ng:"..Name)
				if (lotteryno == 1) then
					local msgstr = " "..Name.." nh�n ���c"..TAB_LOTTERY_BONUS[1][1].."Xin h�y ��n V� l�m Quan vi�n nh�n th��ng"
					AddGlobalNews(msgstr);
				end
				bfind = 1
			end
		end
	end
end

------------------------------------------------------------------------------------
-- ��һ���ļ�
function wulin_loadfile(filename)
	if (IniFile_Load(filename, filename) == 0) then
		File_Create(filename)
		IniFile_Load(filename, filename)
	end

end

--����ļ��е�szSection��key��ֵ
function wulin_getdata(filename, szsect, szkey)
	--if ( TAB_TEST[szsect])  then
		----print( TAB_TEST[szsect][szkey])
		--return TAB_TEST[szsect][szkey]
	--else
		--return nil
	--end
	return IniFile_GetData(filename, szsect, szkey)
end

--�����ļ��е�szSection��keyֵΪszValue
function wulin_setdata(filename, szsect, szkey, szvalue)
	--if (TAB_TEST[szsect]) then
		--TAB_TEST[szsect][szkey] = szvalue
	--else
		--TAB_TEST[szsect] = {}
		--TAB_TEST[szsect][szkey] = szvalue
	--end
	IniFile_SetData(filename, szsect, szkey, szvalue)	
end

function wulin_save(filename)
	IniFile_Save(filename, filename)
end

function wulin_clearticket()
		SetTask(TV_TICKET1, 0)
		SetTask(TV_TICKET2, 0)
		SetTask(TV_LASTTIME_BUY,0)
end

--TAB_TEST = {};
--for i = 1, 2000 do 
	--wulin_sure_buyticket(1)
--end
--wulin_start_lottery(1)
