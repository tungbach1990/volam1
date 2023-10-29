Include("\\script\\missions\\freshman_match\\head.lua")

--������������Ա
function main()
	Say("S� gi� ki�t xu�t: T� 1 th�ng 6 n�m 2005 ��n 10 th�ng 6 n�m 2005, m�i ng�y 20:00 ��n 23:00 s� t� ch�c <color=yellow>li�n ��u V� l�m ki�t xu�t<color>. Cu�c thi n�y nh�m m�c ��ch t�o c� h�i cho c�c T�n Th� giang h� (c�p 50 ��n c�p 89) giao l�u v�i c�c ��ng m�n, n�ng cao k� n�ng v� c�ng c�a T�n Th�, mau ��n tham gia �i!", 1, "��ng �!/want_bid_option")
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
	if ( validateDate( CP_UPTO_TRYOUT, CP_END_TRYOUT ) ) then	--����������ʱ��ʱ
		talkstr = "S� gi� ki�t xu�t: Mu�n b�o danh thi ��u ki�t xu�t �?"	--�Ѿ����������
		optiontab = {
						"B�o danh tham gia li�n ��u 'ki�t xu�t'/regist_freshman",
						"Ta mu�n v�o khu v�c thi ��u 'ki�t xu�t'/transtoplace",
						"H� tr� thi ��u V� l�m ki�t xu�t/help_freshmanmatch",
						"Ta s� quay l�i sau!/OnCancel"
			}
	elseif(tonumber( date( "%y%m%d%H" ) ) >= CP_END_TRYOUT ) then
		talkstr = "S� gi� ki�t xu�t: V� l�m ki�t xu�t li�n ��u �� k�t th�c, ng��i c� th� ki�m tra 5 h�ng ��u c�a c�c m�n ph�i."	--�Ѿ����������
		optiontab = {
						"Ki�m tra ki�t xu�t c�c m�n ph�i/look_freshman",
						"L�nh th��ng danh hi�u thi ��u ki�t xu�t/catch_title",
						"H� tr� thi ��u V� l�m ki�t xu�t/help_freshmanmatch",
						"Ta s� quay l�i sau!/OnCancel"
			}
	else
		Say("S� gi� ki�t xu�t: Thi ��u ki�t xu�t ch�a b�t ��u, xin h�y ��i th�m!", 0);
		return
	end

	Say(talkstr, getn(optiontab), optiontab)
end




function catch_title()	--10������ǰ����ȡ�ƺ�
	local factionnumber = GetLastFactionNumber()
	if( factionnumber < 0 or factionnumber > 9 ) then
		Say("S� gi� ki�t xu�t: Ng��i kh�ng ph�i l� ng��i c�a Th�p ��i m�n ph�i sao?", 0);
		return
	end
	if( tonumber(date("%y%m%d%H")) < CP_END_TRYOUT ) then
		Say("S� gi� ki�t xu�t: Thi ��u ki�t xu�t ch�a k�t th�c, ch�a ch�n ra ���c 5 m�n ph�i ��ng ��u, kh�ng th� ban danh hi�u.", 0)
		return
	end
	biwu_loadfile( FactionData[factionnumber + 1][1] );
		for i = 1, 5 do
		Name = biwu_getdata(FactionData[factionnumber+1][1], FactionData[factionnumber+1][2], "Top"..i);
		if ( GetName() == Name ) then
			nt_settask(CP_TASKID_TITLE, 9)
			Title_AddTitle(factionnumber + 20, 1, TITLETIME);
			Title_ActiveTitle(factionnumber + 20);
			WriteLog(date("%Y%m%d %H:%M:%S")..GetAccount()..",["..GetName().."]��t ���c"..FactionTitle[factionnumber+1].."danh hi�u");
			Msg2Player("B�n ��t ���c"..FactionTitle[factionnumber+1].."danh hi�u");
			return 1
		end
	end
	Say("S� gi� ki�t xu�t: Ban kh�ng �� t� c�ch nh�n danh hi�u V� l�m ki�t xu�t.",0);
	return
end


function look_freshman()
	if (tonumber(date("%y%m%d%H")) < CP_END_TRYOUT) then
		Say("S� gi� ki�t xu�t: V� l�m ki�t xu�t v�n ch�a k�t th�c, ch�a c� danh s�ch c�c m�n ph�i tham gia thi ��u chung k�t.", 0)
		return
	end
local factab = {"Thi�u L�m/#look_list_fac(1)", "Thi�n V��ng/#look_list_fac(2)", "���ng M�n/#look_list_fac(3)", "Ng� ��c/#look_list_fac(4)", "Nga Mi/#look_list_fac(5)", "Th�y Y�n/#look_list_fac(6)", "C�i Bang/#look_list_fac(7)", "Thi�n Nh�n/#look_list_fac(8)", "V� �ang/#look_list_fac(9)", "C�n L�n/#look_list_fac(10)" , "Kh�ng xem n�a!/OnCancel"}
	Say("S� gi� ki�t xu�t: Mu�n xem danh s�ch ki�t xu�t c�a m�n ph�i �?", getn(factab), factab)
end

function look_list_fac(nfact)
	local ncount = 0
	biwu_loadfile( FactionData[nfact][1] );
	local topfac_mem = {}
	for i = 1, 5 do
		name = biwu_getdata(FactionData[nfact][1], FactionData[nfact][2], "Top"..i);
		 if (name ~= "" and name ~= nil) then
		 	ncount = ncount + 1
		 	topfac_mem[ncount] = name.."/OnCancel"
		 end
	end
	if (ncount > 0) then
		Say("S� gi� ki�t xu�t:"..FactionData[nfact][3].."Danh s�ch m�n ph�i tr�ng tuy�n:", getn(topfac_mem), topfac_mem);
	else
		Say("S� gi� ki�t xu�t:"..FactionData[nfact][3].."Danh s�ch tr�ng tuy�n thi ��u d� tuy�n m�n ph�i v�n ch�a c�.", 0)
	end
end


function regist_freshman()

	if (GetLevel() >= 90  ) then
		Say("S� gi� ki�t xu�t: C�p 90 ho�c cao h�n kh�ng ���c ph�p tham gia thi ��u V� l�m m�n ph�i ki�t xu�t. B�n c� th� v�o xem thi ��u m� th�i!", 0)
		return
	end
	
	if ( GetLevel() < 50 ) then
		Say( "S� gi� ki�t xu�t: ��ng c�p c�a b�n ch�a ��t y�u c�u (c�p50) , kh�ng ���c ph�p b�o danh thi ��u nh�ng b�n c� th� v�o xem.", 0 )
		return
	end
	
	if (GetLastFactionNumber() == -1) then
		Say("S� gi� ki�t xu�t: Ch� c� ng��i c�a Th�p ��i ph�i ���c tham gia ��i h�i v� l�m, ng��i kh�ng c� m�n ph�i kh�ng th� tham gia. Sau khi gia nh�p Th�p ��i ph�i m�i ���c tham gia thi ��u!", 0)
		return
	end
	
	if ( nt_gettask( CP_TASKID_REGIST ) == CP_UPTO_TRYOUT ) then
		Msg2Player( "B�n �� b�o danh r�i, tr�c ti�p ��n g�p S� gi� ki�t xu�t l� c� th� v�o." )
		transtoplace()
	else
		local talkstr = "S� gi� ki�t xu�t: Ng��i m�i l�n ��u tham gia V� l�m ki�t xu�t? C� mu�n tham gia kh�ng?"
		Say( talkstr, 2, "Ta mu�n b�o danh/sure_regist", "�� ta xem l�i/OnCancel" )
		return
	end
end

function sure_regist()

		nt_settask( CP_TASKID_REGIST, CP_UPTO_TRYOUT )
		for i = 1096 , 1105 do
			nt_settask( i, 0 )
		end
		nt_settask( CP_TASKID_LOGOUT, 0 )
		
		transtoplace()

end



function look_the_time( THETIME )
	local the_year = floor(THETIME / 1000000)
	local the_month = mod(floor(THETIME / 10000), 100)
	local the_date = mod(floor(THETIME / 100), 100)
	local the_hour = mod(THETIME,100)
	return	the_month, the_date, the_hour
end

