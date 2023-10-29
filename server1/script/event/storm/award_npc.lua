Include("\\script\\event\\storm\\head.lua")
Include("\\script\\lib\\basic.lua")
Include("\\script\\lib\\say.lua")
Include("\\script\\task\\task_addplayerexp.lua")  --������ۼӾ���Ĺ�������

IncludeLib("FILESYS")
IncludeLib("TITLE")
IncludeLib("ITEM")

--���ε���������
TB_STORM_LADDERNAME = {"Qu�n qu�n", "� qu�n", "H�ng 3", " H�ng 4", " H�ng 5",
	"H�ng 6", " H�ng 7", " H�ng 8", " H�ng 9", " H�ng 10", "kh�ng c� trong b�ng x�p h�ng", "Kh�ng c� x�p h�ng"}

--�����˴���	
STORM_WLMCR = "<#><link=image[0,1]:\\spr\\npcres\\passerby\\passerby092\\passerby092_st.spr>V� l�m truy�n nh�n<link>"

--���ָ����awardtype
--awardid == nil	���أ�����+/-����	������ȡ�����н���
--awardid > 0		���أ�nil��������ȡ	���򷵻ػ���+/-����
function storm_checkaward(awardtype, awardid)
	storm_anotherday()
	
	if (awardtype == nil or TB_STORM_AWARD[awardtype] == nil) then
		return nil
	end
	
	if (GetTask(TB_STORM_AWARD[awardtype][3]) > 0) then
		Say("Xin l�i! "..TB_STORM_AWARD[awardtype][1].."ph�n th��ng c�a ng��i �� nh�n qua r�i!", 0)
		return nil
	end
	
	local awardvalue = 0
	if (TB_STORM_AWARD[awardtype][2] == 1) then
		awardvalue = -storm_getrank(awardtype)	--�ø������Ƚϸ�����
	else
		awardvalue = GetTask(TB_STORM_AWARD[awardtype][4])
	end
	
	if (awardid == nil) then
		local tb_award = {}
		local awardlevel = awardvalue
		for i = 1, getn(TB_STORM_AWARD[awardtype][5]) do
			if (awardvalue >= TB_STORM_AWARD[awardtype][5][i][1]) then
				if (awardlevel == TB_STORM_AWARD[awardtype][5][i][1] or getn(tb_award) == 0) then	--������ͼ�����
					awardlevel = TB_STORM_AWARD[awardtype][5][i][1]
					tb_award[getn(tb_award)+1] = i
				end
			end
		end
		return awardvalue, tb_award
	else
		if (awardvalue < TB_STORM_AWARD[awardtype][5][awardid][1]) then
			Say("V� l�m truy�n nh�n: H�nh nh� ng��i kh�ng th� nh�n ph�n th��ng n�y!", 0)
			return nil
		else
			return awardvalue
		end
	end
end

--���Ի�
function storm_main()
	if (GetTask(STORM_TASKID_LETTER) ~= 2) then
		Describe(STORM_WLMCR.."<#> Ki�p giang h� l�y s�ng n�i l� nh�! Ng�ng m�t nh�n tr�ng, cu�i ��u mh�n n��c! Ch�t ngh� ��n c�u th�: V� th� ���ng ��i b�ng ph�ng m�i, anh h�ng h�o ki�t c� h�n ai!", 1, "B�t ��u ho�t ��ng Phong ba th�ng 9/storm_main")
		Msg2Player("B�n nh�n ���c b�n th�o th�n b� c�a Th�m Thi�u Vi�n")
		AddItem(6, 1, 898, 1, 0 ,0)
		SetTask(STORM_TASKID_LETTER, 2)
	else
		local tb_option = {}
		tb_option[getn(tb_option)+1] = "Ta mu�n l�nh ph�n th��ng h�m nay/#storm_award(1)"
		if (GetTask(STORM_TASKID_DAY_LASTAWARD) == 0) then
			tb_option[getn(tb_option)+1] = "Ta mu�n l�nh ph�n th��ng h�m qua/#storm_award(4)"
		end
		tb_option[getn(tb_option)+1] = "Ta mu�n l�nh ph�n th��ng tu�n tr��c/#storm_award(2)"
		tb_option[getn(tb_option)+1] = "Ta mu�n l�nh ph�n th��ng th�ng tr��c/#storm_award(3)"
		tb_option[getn(tb_option)+1] = "T�m hi�u �i�m t�ch l�y c�a ta/#storm_query(0)"
		tb_option[getn(tb_option)+1] = "T�m hi�u ho�t ��ng Phong Ba/storm_help"
		tb_option[getn(tb_option)+1] = "Kh�ng c�n!/OnCancel"
		Describe(STORM_WLMCR.."<#> Xin xem th�ng tin chi ti�t ho�t ��ng tr�n trang ch� ", getn(tb_option), tb_option)
	end
	storm_anotherday()
end

--��ȡ�������鿴������
function storm_award(awardtype)
	local awardvalue, tb_award = storm_checkaward(awardtype)
	if (awardvalue == nil) then
		return
	end
	
	local str = ""
	if (awardvalue >= 0) then
		str = "B�n "..TB_STORM_AWARD[awardtype][1].."t�ch l�y Phong Ba l�:"..storm_point2str(awardvalue)
	elseif (awardvalue == -12) then
		str = TB_STORM_AWARD[awardtype][1].."kh�ng c� trong b�ng x�p h�ng"
	elseif (awardvalue == -11) then
		str = "B�n "..TB_STORM_AWARD[awardtype][1].."kh�ng c� trong b�ng x�p h�ng"
	elseif (awardvalue >= -3) then
		str = "B�n "..TB_STORM_AWARD[awardtype][1].."trong ho�t ��ng Phong ba th�ng 9"..storm_point2str(TB_STORM_LADDERNAME[-awardvalue])
	else
		str = "B�n "..TB_STORM_AWARD[awardtype][1].."trong ho�t ��ng Phong ba th�ng 9 x�p th� "..storm_point2str(-awardvalue).."danh "
	end
	
	local awardcount = getn(tb_award)
	if (awardcount > 0) then
		local tb_option = {}
		if (awardcount == 1) then
			str = str..", Ng��i c� th� nh�n ph�n th��ng: <enter>"
			str = str.."<color=green>"..TB_STORM_AWARD[awardtype][5][tb_award[1]][2].."<color><enter>"
			str = str.."<enter>, nh�n b�y gi� ch�?"
			Say("V� l�m truy�n nh�n:"..str, 2, "Ta mu�n nh�n ph�n th��ng/#storm_getaward("..awardtype..","..tb_award[1]..",0)", "�� ta suy ngh� l�i/OnCancel")
		else
			str = str..", ng��i c� th� l�a ch�n 1 trong nh�ng ph�n th��ng sau ��y: <enter>"
			for i = 1, getn(tb_award) do
				if (i >= 2) then
					str = str.."ho�c   "
				end
				local awardname = TB_STORM_AWARD[awardtype][5][tb_award[tb_award[i]]][2]
				str = str.."<color=green>"..awardname.."<color><enter>"
				tb_option[getn(tb_option)+1] = "l�nh"..awardname.."/#storm_getaward("..awardtype..","..tb_award[i]..",0)"
			end
			str = str.."<enter> Quy�t ��nh xong ch�a?"
			tb_option[getn(tb_option)+1] = "Kh�ng c�n!/OnCancel"
			Say("V� l�m truy�n nh�n:"..str, getn(tb_option), tb_option)
		end
	else
		Say("V� l�m truy�n nh�n:"..str..", ng��i kh�ng th� nh�n qu� th��ng", 0)
		return
	end
end

--��ȡָ����Ʒ
function storm_getaward(awardtype, awardid, sure)
	local awardvalue = storm_checkaward(awardtype, awardid)
	if (not storm_checkaward(awardtype, awardid)) then
		return
	end

	if (sure == 1) then
		Say("Tr��c khi l�nh th��ng c�n s�p x�p l�i  h�nh trang!", 2, "Ta �� s�n s�ng!/#storm_getaward("..awardtype..","..awardid..",2)", "Ta c�n ph�i s�p x�p l�i h�nh trang/OnCancel")
	elseif (sure == 2) then
		if (CalcFreeItemCellCount() < storm_countallaward(TB_STORM_AWARD[awardtype][5][awardid][3])) then
			Say("H�nh trang c�a ng��i kh�ng c�n ch� tr�ng, s�p x�p g�n l�i �i!", 0)
		else
			if (awardtype == 1 or awardtype == 4) then
				local mapid = tostring(SubWorldIdx2ID(SubWorld))
				local plcount = GetGlbValue(46) + 1
				SetGlbValue(46, plcount)
				Ladder_NewLadder(10195, mapid, plcount, 1)
			end
			local str = "Nh�n ���c"..TB_STORM_AWARD[awardtype][1].."Ph�n th��ng t�ch l�y Phong Ba "..TB_STORM_AWARD[awardtype][5][awardid][2]
			WriteLog("[STORM_AWARD]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\t"..awardvalue.."\t"..str)
			Msg2Player(str)
			SetTask(TB_STORM_AWARD[awardtype][3], 1)
			storm_giveallaward(TB_STORM_AWARD[awardtype][5][awardid][3])
			if (awardvalue >= 0) then
				str = awardvalue.."�i�m t�ch l�y Phong Ba"
			else
				str = "X�p h�ng th� "..(-awardvalue).."danh "
			end
			if (awardtype == 2 or awardtype == 3 or awardid <= 2) then	--�󽱷�������
				AddGlobalNews(GetName().."T�i"..TB_STORM_AWARD[awardtype][1].."trong ho�t ��ng Phong Ba nh�n ���c"..str..", nh�n ���c ph�n th��ng"..TB_STORM_AWARD[awardtype][5][awardid][2].." ")
			end
		end
	else
		Say("Ng��i x�c ��nh nh�n <color=red>"..TB_STORM_AWARD[awardtype][5][awardid][2].."<color> ph�i kh�ng? Sau khi nh�n xong kh�ng ���c nh�n "..TB_STORM_AWARD[awardtype][1].."ph�n th��ng kh�c n�a!", 2, "Ta bi�t r�i! Ta ch� nh�n v�t ph�m n�y th�i/#storm_getaward("..awardtype..","..awardid..",1)", "Kh�ng c�n!/OnCancel")
	end
end

--��ѯ���˷籩�������
function storm_query(querytype)
	storm_anotherday()
	
	local str = ""
	local tb_sheet = {}
	local var_width, var_align
	if (querytype == 1) then
		if (GetTask(STORM_TASKID_DAY) <= STORM_END_DAY) then
			str = "T�ch l�y Phong Ba h�m nay c�a b�n nh� sau: <enter>%sT�ng �i�m t�ch l�y h�m nay:"..storm_point2str(GetTask(STORM_TASKID_DAY_POINT))
			var_width = {12,8,8,10}
			var_align = 2
			tb_sheet[getn(tb_sheet)+1] = {"T�n ho�t ��ng", "S� l�n", "Tr�ng th�i ", "�i�m t�ch l�y cao nh�t"}
			for i = 1, STORM_GAMEID_MAX do
				if (TB_STORM_TASKID[i] ~= nil) then
					local trycount = GetTask(TB_STORM_TASKID[i][STORM_TASKIDX_TRYCOUNT])
					local state = ""
					if storm_valid_game(i) then
						state = "<color=red>�ang ti�n h�nh<color>"
					elseif (trycount <= 0) then
						state = "<color=blue>Ch�a ti�n h�nh<color>"
					elseif (trycount < TB_STORM_TRYTIMES[i]) then
						state = "<color=green>�� ti�n h�nh<color>"
					else
						state = "<color=8947848>�� k�t th�c<color>"
					end
					tb_sheet[getn(tb_sheet)+1] = {
						storm_gamename(i),
						storm_point2str(trycount).."/"..TB_STORM_TRYTIMES[i],
						state,
						storm_point2str(GetTask(TB_STORM_TASKID[i][STORM_TASKIDX_POINTMAX]))
					}
				end
			end
		else
			str = "ho�t ��ng <color=red>Phong ba th�ng 9<color> �� k�t th�c!"
		end
	elseif (querytype == 2) then
		str = "�i�m t�ch l�y Phong Ba g�n ��y c�a b�n l�: <enter>%s"
		var_width = {8,10,6,8,10}
		var_align = 2
		tb_sheet[getn(tb_sheet)+1] = {
			"�i�m t�ch l�y h�m nay", storm_point2str(GetTask(STORM_TASKID_DAY_POINT)), "",
			"�i�m t�ch l�y h�m qua", storm_point2str(GetTask(STORM_TASKID_DAY_LASTPOINT))
		}
		tb_sheet[getn(tb_sheet)+1] = {
			"�i�m t�ch l�y tu�n n�y", storm_point2str(GetTask(STORM_TASKID_WEEK_POINT)), "",
			"�i�m t�ch l�y tu�n tr��c", storm_point2str(GetTask(STORM_TASKID_WEEK_LASTPOINT))
		}
		tb_sheet[getn(tb_sheet)+1] = {
			"�i�m t�ch l�y th�ng n�y", storm_point2str(GetTask(STORM_TASKID_MONTH_POINT)), "",
			"�i�m t�ch l�y th�ng tr��c", storm_point2str(GetTask(STORM_TASKID_MONTH_LASTPOINT))
		}
		tb_sheet[getn(tb_sheet)+1] = {
			"X�p h�ng tu�n tr��c", "<color=yellow>"..TB_STORM_LADDERNAME[storm_getrank(2)].."<color>", "",
			"X�p h�ng th�ng tr��c", "<color=yellow>"..TB_STORM_LADDERNAME[storm_getrank(3)].."<color>"
		}
	else
		Say("Ng��i mu�n t�m hi�u v�n �� g�?", 3, "�i�m t�ch l�y Phong Ba c�a ta h�m nay/#storm_query(1)", "�i�m t�ch l�y Phong Ba g�n ��y c�a ta/#storm_query(2)", "Kh�ng c� chuy�n g� ��u!/OnCancel")
		return
	end
	str = format(str, maketable(tb_sheet, var_width, var_align))
	Say(str, 2, "Ti�p t�c t�m hi�u/#storm_query(0)", "Kh�ng c� g�, c�m �n!/OnCancel")
end

--�˵��������
function storm_help()
	local tb_option = {}
	for i = 1, STORM_GAMEID_MAX do
		if (TB_STORM_TASKID[i] ~= nil) then
			tb_option[getn(tb_option)+1] = "Li�n quan ho�t ��ng Phong Ba-"..TB_STORM_DESCRIBE[i].."gi�p ��/#storm_help_game("..i..")"
		end
	end
	tb_option[getn(tb_option)+1] = "Li�n quan ph�n th��ng ho�t ��ng Phong Ba/#storm_help_award(0)"
	tb_option[getn(tb_option)+1] = "Ta bi�t r�i!/OnCancel"
	Say("  Ho�t ��ng Phong Ba ���c m� v�o ng�y 8/9/-2/10, bao g�m chi�n tr��ng T�ng Kim, chu�i nhi�m v� D� T�u, nhi�m v� s�t th� th� luy�n. M�i ng�y s� d�a theo th�nh t�ch � t�ng h� th�ng �� c� �i�m <color=yellow>t�ch l�y Phong Ba<color> (�i�u ki�n tham gia: Ng��i ch�i c�p 50 tr� l�n) . �i�m t�ch l�y m�i ng�y sau <color=red>24:00 s� b� x�a<color>, xin tr��c 24:00 ��n l�nh th��ng.<enter>. M�i ng�y <color=red>23:30<color> b�t ��u chi�n tr��ng T�ng Kim, th�nh t�ch �� kh�ng ���c t�nh v�o t�ch l�y Phong Ba.", getn(tb_option), tb_option)
end

--�˵��������ս
function storm_help_game(gameid)
	local str = TB_STORM_HELP[gameid]
	if (gameid == 1) then	--�ν���Ҫ����˵����������
		str = format(str, "Chi�n tr��ng T�ng Kim cao c�p, m�i ng��i m�i ng�y ch� nh�n ���c �i�m t�ch l�y Phong Ba t�i �a l� <color=yellow>100<color> �i�m. Chi�n tr��ng T�ng Kim s�, trung c�p ph�n bi�t t�i �a nh�n ���c <color=yellow>80<color>, <color=yellow>90<color> �i�m.")
	end
	Say(str, 2, "Mu�n t�m hi�u nh�ng th� kh�c/storm_help", "Ta �� bi�t r�i!/OnCancel")
end

--�˵����������
function storm_help_award(awardtype,start)
	if (awardtype == 0) then
		Say("  M�i ng�y ng��i ch�i c� th� ��n ch� V� l�m truy�n nh�n, c�n c� <color=red>t�ch l�y Phong Ba<color> s� nh�n ���c ph�n th��ng t��ng �ng. ��ng th�i, m�i tu�n, m�i th�ng ��u c� b�ng x�p h�ng t�ch l�y Phong Ba t��ng �ng, ng��i ch�i ���c <color=red>x�ph�ng Top 10<color> c� th� tu�n th� hai trong th�ng ��n V� L�m truy�n nh�n nh�n ph�n th��ng", 4,
			"Xem ph�n th��ng ng�y/#storm_help_award(1)",
			"Xem ph�n th��ng tu�n/#storm_help_award(2)",
			"Xem ph�n th��ng th�ng/#storm_help_award(3)",
			"Ta �� bi�t r�i!/OnCancel")
		return
	end
	
	local tb_awardstr = {"nh�t ", "Tu�n", "nguy�t "}
	local str = "T�ch l�y Phong Ba"..tb_awardstr[awardtype].."Ph�n th��ng nh� sau:"
	if (not start) then
		start = 1
	end
	local lastvalue = nil
	local count = 0
	local PERPAGE = 4
	for i = start, getn(TB_STORM_AWARD[awardtype][5]) do
		if (count > PERPAGE) then	--PERPAGE��һҳ
			break
		end
		count = count + 1
		
		local awardvalue = TB_STORM_AWARD[awardtype][5][i][1]
		if (lastvalue ~= awardvalue) then
			if (awardvalue >= 0) then
				str = str.."<enter>".."T�ch l�y"..storm_point2str(awardvalue,3).."ph�t"
			else
				if (lastvalue) then
					str = str.."<enter>"..tb_awardstr[awardtype].."X�p h�ng th� "..storm_point2str(1-lastvalue).."��n"..storm_point2str(-awardvalue).."m�y"
				else
					str = str.."<enter>"..tb_awardstr[awardtype].."X�p h�ng th� "..storm_point2str(-awardvalue).."m�y"
				end
			end
			lastvalue = awardvalue
		else
			str = str.."ho�c   "
		end
		str = str.."<color=yellow>"..TB_STORM_AWARD[awardtype][5][i][2].."<color>"
	end
	local tb_option = {}
	if (start > 1) then
		tb_option[getn(tb_option)+1] = "Trang tr��c/#storm_help_award("..awardtype..","..(start-PERPAGE)..")"
	end
	if (start + count < getn(TB_STORM_AWARD[awardtype][5])) then
		tb_option[getn(tb_option)+1] = "Trang k� /#storm_help_award("..awardtype..","..(start+PERPAGE)..")"
	end
	tb_option[getn(tb_option)+1] = "Mu�n t�m hi�u nh�ng th� kh�c/storm_help"
	tb_option[getn(tb_option)+1] = "Ta �� bi�t r�i!/OnCancel"
	Say(str, getn(tb_option), tb_option)
end

--�õ��������ָ�������е�����
function storm_getrank(laddertype)
	local ladderid = nil
	if (laddertype == 1) then	--�����У�����
		return 12
	elseif (laddertype == 2) then	--������
		local weekid = GetTask(STORM_TASKID_WEEK) - STORM_LADDER_WEEK
		if(weekid >= 1 and weekid <= 4) then 	--ֻ��2��3��4��5��������
			ladderid = STORM_LADDERID_WEEK1 + weekid - 1
		end
	elseif (laddertype == 3) then	--������
		if (GetTask(STORM_TASKID_MONTH) == 10) then	--ֻ��10��������
			ladderid = STORM_LADDERID_MONTH
		end
	else
		return 12
	end
	
	if (ladderid == nil) then
		return 12
	end
	
	local playername = GetName()
	for i = 1, 10 do
		if (playername == Ladder_GetLadderInfo(ladderid, i)) then
			return i
		end
	end
	return 11
end

--�������ļӾ���
function storm_addownexp( awardexp )
	tl_addPlayerExp(awardexp)
end

--����ȫ������
function storm_giveallaward(tb_awards)
	for i = 1, getn(tb_awards) do
		storm_giveoneaward(tb_awards[i])
	end
end

--����һ������
function storm_giveoneaward(tb_award)
	local awardtype = tb_award[1]
	local awardcount = tb_award[3]
	if (awardtype == 1) then	--��ͨ��Ʒ
		while (awardcount > 0) do
			WriteLog("[STORM_GIVE]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\tAddItem("..join(tb_award[2])..")")
			AddItem(storm_splittb(tb_award[2]))
			awardcount = awardcount - 1
		end
	elseif (awardtype == 2) then	--�ƽ���Ʒ
		while (awardcount > 0) do
			WriteLog("[STORM_GIVE]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\tAddGoldItem("..join(tb_award[2])..")")
			AddGoldItem(storm_splittb(tb_award[2]))
			awardcount = awardcount - 1
		end
	elseif (awardtype == 3) then	--����Ʒ
		if (tb_award[2] == 1) then	--����
			WriteLog("[STORM_GIVE]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\tAddOwnExp("..awardcount..")")
			storm_addownexp(awardcount)
		else	--������չ
			WriteLog("storm_giveoneaward : error tb_award[2]")
		end
	elseif (awardtype == 4) then	--�����Ʒ
		while (awardcount > 0) do
			local giveindex = random(getn(tb_award[2]))
			storm_giveoneaward(tb_award[2][giveindex])
			awardcount = awardcount - 1
		end
	else
		WriteLog("[STORM_GIVE]\t"..date("%y-%m-%d,%H:%M").."\t"..GetAccount().."\t"..GetName().."\tstorm_giveoneaward : error awardtype")
	end
end

--����ȫ��������Ʒ����
function storm_countallaward(tb_awards)
	local count = 0
	for i = 1, getn(tb_awards) do
		if (tb_awards[i][1] == 1) then	--��ͨ��Ʒ
			count = count + tb_awards[i][3]
		elseif (tb_awards[i][1] == 2) then	--�ƽ���Ʒ
			count = count + tb_awards[i][3]*2
		elseif (tb_awards[i][1] == 4) then	--�����Ʒ
			count = count + tb_awards[i][3]*2
		end
	end
	return count
end

--�������
function storm_splittb(tb, n)
	if (n == nil) then
		n = 1
	end
	if (n == getn(tb)) then
		return tb[n]
	end
	return tb[n], storm_splittb(tb,n+1)
end
