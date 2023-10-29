IncludeLib("SETTING")
Include ("\\script\\lib\\player.lua")
Include ("\\script\\shitu\\shitu.lua")

Include("\\script\\task\\newtask\\map_index.lua")
Include("\\script\\lib\\common.lua")

tb_teaminfo_master = {"pid","level","name"}
tb_teamtask_master = {TKID_DICHUAN_APPRENTICE_COUNT}

function CheckAndAddMaster(masters, player)
	local degree = GetPlayerDegree(player.pid)
	if(degree == CONST_DEGREE_MASTER or degree == CONST_DEGREE_PREMASTER) then
		local num = GetApprenticeNum(player.name)
		if(not num) then
			return
		end
		if (num < ComputeMasterLoad(player.task[TKID_DICHUAN_APPRENTICE_COUNT])) then
			masters[getn(masters) + 1] = player.name
		end
	end
end

--���ҿ��Գ�Ϊʦ������
function FindMaster()
	print("Call FindMaster")
	local masters = {}
	/*
	local _,others = getTeamInfo(PlayerIndex,{"pid","level","name"},{TKID_DICHUAN_APPRENTICE_COUNT})
	if(not others) then
		return nil
	end
	for i=1,getn(others) do
		local degree = GetPlayerDegree(others[i].pid)
		if(degree == CONST_DEGREE_MASTER or degree == CONST_DEGREE_PREMASTER) then
			local num =GetApprenticeNum(others[i].name)
			if(not num) then
				return nil
			end
			if(num < ComputeMasterLoad(others[i].task[TKID_DICHUAN_APPRENTICE_COUNT])) then
				tinsert(masters,others[i].name)
			end
		end
	end
	*/
	traversalTeam(PlayerIndex, CheckAndAddMaster, masters, tb_teaminfo_master, tb_teamtask_master)
	if (getn(masters) < 1) then
		return nil
	else
		return masters
	end
end

tb_teaminfo_apprentice = {"level","name"}

function CheckAndAddApprentice(apps, player)
	if (player.level < 80) then
		local job = GetLeagueJob(player.name)
		if(not job) then
			apps[getn(apps) + 1] = player.name
		end
	end
end

--���ҿ��Գ�Ϊͽ�ܵ���
function FindApprentice()
	print("Call FindApprentice")
	/*
	local _,others = getTeamInfo(PlayerIndex,{"level","name"})
	if(not others) then
		return nil
	end
	local apps = {}
	for i=1,getn(others) do
		if(others[i].level < 80) then
			local job = GetLeagueJob(others[i].name)
			if(not job) then
				tinsert(apps,others[i].name)
			end
		end
	end
	*/
	local apps = {}
	traversalTeam(PlayerIndex, CheckAndAddApprentice, apps, tb_teaminfo_apprentice)
	
	if (getn(apps) < 1) then
		return nil
	else
		return apps
	end
end

--�õ�ͽ���б����
function ShoutuList(apps)
	local str = "Xem t�nh h�nh c�a ng��i ch�i, ch�n 1 ng��i th�ch h�p l�m �� �� c�a b�n:"
	local btn = {}
	-- local apps = FindApprentice()
	if(not apps) then
		Msg2Player("Kh�ng c� �� �� th�ch h�p.")
		return
	end
	for i=1,getn(apps) do
		tinsert(btn,"Xem tin t�c  "..safeshow(apps[i]).." tin t�c c�a/#XuanTudi('"..safestr(apps[i]).."')")
	end
	tinsert(btn," ��ng/Quit")
	Say(str,getn(btn),btn)
	return
end

function CallBack_ShoutuList()
	local apps = FindApprentice()
	ShoutuList(apps)
end

--�õ�������ʦ������Ա�б�
function BaishiList(masters)
	print("Call BaishiList()")
	local str = "Tra xem t�nh h�nh c�a ng��i ch�i, ch�n 1 ng��i th�ch h�p l�m s� ph� c�a b�n:"
	local btn = {}
	-- local masters = FindMaster()
	if(not masters) then
		print("Master can not found.")
		return
	end
	for i=1,getn(masters) do
		tinsert(btn,"Xem tin t�c  "..safeshow(masters[i]).." tin t�c c�a/#XuanShifu('"..safestr(masters[i]).."')")
	end
	tinsert(btn," ��ng/Quit")
	Say(str,getn(btn),btn)
	return
end

function CallBack_BaishiList()
	local masters = FindMaster()
	BaishiList(masters)
end

tb_playerinfo_tudi = {"level","sex"}
tb_playertask_tudi = {TKID_MASTER_COUNT}
tb_playertemp_tudi = {TTKID_APPRENTICE_FLAG,TTKID_RECRUIT_FLAG}

--�˽��ܹ���Ϊͽ�ܵ���ѡ����Ϣ
function XuanTudi(playerName)
	local pid = SearchPlayer(playerName)
	if(FALSE(pid)) then
		Msg2Player(playerName.."Hi�n kh�ng bi�t tung t�ch.")
		return
	end
	-- local app = getPlayerInfo(pid,{"level","sex"},{TKID_MASTER_COUNT},{TTKID_APPRENTICE_FLAG,TTKID_RECRUIT_FLAG})
	local app = getPlayerInfo(pid, tb_playerinfo_tudi, tb_playertask_tudi, tb_playertemp_tudi)
	local str = safeshow(playerName)..":"..sex2Word(app.sex).."<enter>"
	if(app.level <= 25) then
		str = str.."Hi�n ��ng c�p � c�p d��i 26"
	elseif(app.level < 50) then
		str = str.."Hi�n ��ng c�p � c�p d��i 50 "
	elseif(app.level < 65) then
		str = str.."Hi�n ��ng c�p � c�p d��i 65 "
	elseif(app.level < 75) then
		str = str.."Hi�n ��ng c�p � c�p d��i 75 "
	elseif(app.level < 80) then
		str = str.."Hi�n ��ng c�p � c�p d��i 80"
	else
		str = str.."Hi�n ��ng c�p � c�p 80 tr� l�n, "
	end
	if(app.task[TKID_MASTER_COUNT] ==0) then
		str = str.."ch�a b�i qua s� ph�, "
	else
		str = str.."�� b�i s� "..tostring(app.task[TKID_MASTER_COUNT]).." s� ph�, "
	end
	if(FALSE(GetShituLeagueId(playerName))) then
		UpdatePlayerSelfLilian(pid)
	end
	if(GetPlayerLilianCount(pid)==0) then
		str = str.."tr��c nay ch�a tr�i qua nhi�m v� th� luy�n giang h� n�o."
	else
		str = str.."�� ho�n th�nh"..tostring(GetPlayerLilianCount(pid)).." vi�c th� luy�n giang h�."
	end
	if(app.tasktmp[TTKID_APPRENTICE_FLAG]==FileName2Id(GetName())) then
		str = str.."<enter> hi�n �� b�i b�n l�m s� ph�. H�y s� d�ng ch�c n�ng <color=yellow>Thu nh�n �� t�<color> trong <color=green>S� �� thi�p<color> �� tr� l�i."
	end
	if(app.tasktmp[TTKID_RECRUIT_FLAG] == FileName2Id(GetName())) then
		str = str.."<enter> hi�n �� nh�n  l�m �� ��, �ang ��i s� tr� l�i c�a "
	end
	/*
	local btn = {
		"nh�n "..safeshow(playerName).." l�m �� ��/#Shoutu('"..safestr(playerName).."')",
		"Tr� l�i/CallBack_ShoutuList",
		" ��ng/Quit"
	}
	Say(str,getn(btn),btn)
	*/
	Say(str,
		3,
		"nh�n "..safeshow(playerName).." l�m �� ��/#Shoutu('"..safestr(playerName).."')",
		"Tr� l�i/CallBack_ShoutuList",
		" ��ng/Quit")	
	return
end

tb_playerinfo_shifu = {"sex"}
tb_playertask_shifu = {TKID_APPRENTICE_COUNT, TKID_DICHUAN_APPRENTICE_COUNT, TKID_ZHIXI_APPRENTICE_COUNT, TKID_NORMAL_APPRENTICE_COUNT}

function XuanShifu(playerName)
	local pid = SearchPlayer(playerName)
	if(FALSE(pid)) then
		Msg2Player(playerName.."Hi�n kh�ng bi�t tung t�ch.")
		return
	end
	-- local master = getPlayerInfo(pid,{"sex"},{TKID_APPRENTICE_COUNT,TKID_DICHUAN_APPRENTICE_COUNT,TKID_ZHIXI_APPRENTICE_COUNT,TKID_NORMAL_APPRENTICE_COUNT})
	local master = getPlayerInfo(pid, tb_playerinfo_shifu, tb_playertask_shifu)
	local btn = {
		"b�i "..safeshow(playerName).."l�m s� ph� /#Baishi('"..safestr(playerName).."')",
		"Tr� l�i/CallBack_BaishiList",
		" ��ng/Quit"
	}
	local str = safeshow(playerName)..":"..sex2Word(master.sex).."<enter>"
	st_print("XuanShifu(): "..GetName().."master: "..str);
	local lid = GetShituLeagueId(playerName)
	if(FALSE(lid) and FALSE(master.task[TKID_APPRENTICE_COUNT])) then
		str = str.."��n nay, ch�a l�m qua s� ph�."
		Say(str,getn(btn),btn)
		return
	end
	str = str.."��n nay, �� thu nh�n "..tostring(master.task[TKID_APPRENTICE_COUNT]).." �� ��,"
	str = str.." trong �� hu�n luy�n th�nh c�ng "..tostring(master.task[TKID_DICHUAN_APPRENTICE_COUNT]).." ��ch truy�n �� t�, "
	str = str..tostring(master.task[TKID_ZHIXI_APPRENTICE_COUNT]).." tr�c h� �� t�, "
	str = str..tostring(master.task[TKID_NORMAL_APPRENTICE_COUNT]).." ph� th�ng �� t�."
	str = str.."Hi�n t�i, "..playerName.."t�ng c� th� d�n d�t "..ComputeMasterLoad(master.task[TKID_DICHUAN_APPRENTICE_COUNT]).." �� ��,"
	str = str.." H�n n�a, hi�n �� thu nh�n "..tostring(GetApprenticeNum(playerName)).." �� ��."
	Say(str,getn(btn),btn)
	return
end

function Baishi(master) --ͽ�ܴ���
	print("Call Baishi("..tostring(master)..").")
	local pid = SearchPlayer(master)
	if(FALSE(pid)) then
		Msg2Player(" Xin l�i! "..master.."Hi�n kh�ng bi�t tung t�ch.")
		return
	end
	SetTaskTemp(TTKID_APPRENTICE_FLAG,FileName2Id(master))
	if(GetTaskTemp(TTKID_APPRENTICE_FLAG)==GetTaskTemp(TTKID_RECRUIT_FLAG)) then
		SetTaskTemp(TTKID_APPRENTICE_FLAG,0)
		SetTaskTemp(TTKID_RECRUIT_FLAG,0)
		--���ʦ������������
		local load = ComputeMasterLoad(callPlayerFunction(pid,GetTask,TKID_DICHUAN_APPRENTICE_COUNT))
		local appNum = GetApprenticeNum(master)
		if(not appNum) then
			print(" kh�c th��ng, master ��t nhi�n ch�a b�i s�.")
			return
		end
		if(load <= appNum) then --���������������ٰ�ʦ
			Msg2Player(master.."Hi�n �� d�n ��n qu� nhi�u �� t�, kh�ng li�u n�i b�n r�i.")
			sendMessage(pid,"B�n hi�n �� thu nh�n qu� nhi�u �� t�, �� lo kh�ng xu� "..GetName().." ")
			return
		end
		Msg2Player(master.." �� ��ng � thu nh�n b�n l�m �� ��, ��i h� th�ng x�y d�ng quan h� s� �� c�a c�c b�n.")
		sendMessage(pid,"B�n �� ��ng � thu nh�n "..GetName().." l�m �� ��, ��i h� th�ng x�y d�ng quan h� s� �� c�a c�c b�n.")
		SetTaskTemp(TTKID_RECRUIT_FLAG,0)
		SetTaskTemp(TTKID_APPRENTICE_FLAG,0)
		--AddGlobalNews("��ϲ"..GetName().."����"..master.."�����£���Ϊ"..master.."�ĵ��ӡ�")
		UpdatePlayerSelfLilian(PlayerIndex)
		BuildRelationship(GetName(),master)
		return
	end
	Msg2Player("B�n ��nh b�i "..master.." l�m s� ph�, �ang ��i tr� l�i...")
	sendMessage(pid,GetName().." ��nh b�i b�n l�m s� ph�, xin s� d�ng ch�c n�ng <color=yellow>thu nh�n �� t�<color> trong <color=green>S� �� thi�p<color> �� tr� l�i.")
	return
end

tb_playertemp_shoutu = {TTKID_APPRENTICE_FLAG,TTKID_RECRUIT_FLAG}

function Shoutu(apprentice) --ʦ������
	print("Call Shoutu("..tostring(apprentice)..").")
	local pid = SearchPlayer(apprentice)
	if(FALSE(pid)) then
		Msg2Player(" Xin l�i! "..apprentice.."Hi�n kh�ng bi�t tung t�ch.")
		return
	end
	
	if checkTudiLimit()~=1 then
		Say("Xin l�i! N�i trong 7 ng�y m�i ng��i ch� c� th� nh�n 5 �� ��!", 0);
		return
	end;
	
	setPlayerTaskTemp(pid,{[TTKID_RECRUIT_FLAG]=FileName2Id(GetName())})
	-- local appinfo = getPlayerInfo(pid,nil,nil,{TTKID_APPRENTICE_FLAG,TTKID_RECRUIT_FLAG})
	local appinfo = getPlayerInfo(pid,nil,nil,tb_playertemp_shoutu)
	if(not appinfo) then
		return
	end
	if(appinfo.tasktmp[TTKID_APPRENTICE_FLAG]==appinfo.tasktmp[TTKID_RECRUIT_FLAG]) then
		callPlayerFunction(pid,SetTask,TTKID_APPRENTICE_FLAG,0)
		callPlayerFunction(pid,SetTask,TTKID_RECRUIT_FLAG,0)
		print("thu nh�n �� t� ")
		local load = ComputeMasterLoad(GetTask(TKID_DICHUAN_APPRENTICE_COUNT))
		local appNum = GetApprenticeNum(GetName())
		if(not appNum) then
			print("kh�c th��ng, ng��i n�y ��t nhi�n kh�ng b�i s� ")
			return
		end
		if(load <= appNum) then --���������������ٰ�ʦ
			Msg2Player("B�n hi�n �� thu nh�n qu� nhi�u �� t�, �� lo kh�ng xu� "..apprentice.." ")
			sendMessage(pid,GetName().."Hi�n �� d�n ��n qu� nhi�u �� t�, kh�ng li�u n�i b�n r�i.")
			return
		end
		
		-- д��ͽ������
		writeTudiLimit();
		
		Msg2Player("B�n �� ��ng � thu nh�n "..apprentice.." l�m �� ��, ��i h� th�ng x�y d�ng quan h� s� �� c�a c�c b�n.")
		sendMessage(pid,GetName().." �� ��ng � thu nh�n b�n l�m �� ��, ��i h� th�ng x�y d�ng quan h� s� �� c�a c�c b�n.")
		callPlayerFunction(pid,SetTaskTemp,TTKID_APPRENTICE_FLAG,0)
		callPlayerFunction(pid,SetTaskTemp,TTKID_RECRUIT_FLAG,0)
		--AddGlobalNews("��ϲ"..apprentice.."����"..GetName().."�����£���Ϊ"..GetName().."�ĵ��ӡ�")
		UpdatePlayerSelfLilian(pid)
		BuildRelationship(apprentice,GetName())
		return
	end
	
	-- д��ͽ������
	writeTudiLimit();
	
	Msg2Player("B�n ��nh thu nh�n"..apprentice.." l�m �� ��, �ang ��i tr� l�i...")
	sendMessage(pid,GetName().."��nh thu nh�n b�n l�m �� ��. H�y s� d�ng ch�c n�ng <color=green>B�i s�<color> trong <color=green>S� �� thi�p"..GetName().." tr� l�i.")
	return
end

function MasterDialog()
	local btn = {}
	local masterName = GetName()
	local num = GetApprenticeNum(masterName)
	if(not num) then 
		print("B�n �� l� S� ph� r�i! C�n b�i s� g� n�a ch�!")
		return
	end
	if(FindApprentice() and 
		num < ComputeMasterLoad(GetTask(TKID_DICHUAN_APPRENTICE_COUNT))) then
		tinsert(btn,"thu nh�n �� t� /CallBack_ShoutuList")
	end
	if(GetEnableChushiApps(masterName)) then
		tinsert(btn,"�� �� xu�t s� /ChushiList")
	end
	if(GetHaveNewLilianApps(masterName)) then
		tinsert(btn,"Tra xem r�n luy�n giang h� c�a �� ��/LilianList")
	end
	if(num > 0 ) then
		tinsert(btn,"Tra tin t�c �� ��/TudiInfoList")
		tinsert(btn,"H�y b� quan h� �� ��/BreakTuList")
	end
	tinsert(btn,"Xem th�ng tin c� nh�n/SfChaShifu")
	tinsert(btn,"T�m hi�u S� �� thi�p/AboutShituCard")
	tinsert(btn," ��ng/Quit")
	local str = "H�y ch�n thao t�c t��ng quan c�a s� ph�:"
	Say(str,getn(btn),btn)
	return
end

function BreakTuList()
	local apps = GetApprentice(GetName())
	if(not apps) then
		Msg2Player("B�n kh�ng c� b�t c� s� �� n�o.")
		return
	end
	local btn={}
	for i=1,getn(apps) do
		tinsert(btn,"H�y b� quan h� s� �� v�i "..safeshow(apps[i]).."./#ShiConform('"..safestr(apps[i]).."')")
	end
	tinsert(btn,"Tr� l�i/MasterDialog")
	tinsert(btn," ��ng/Quit")
	local str = "B�n mu�n h�y b� quan h� s� �� v�i �� �� n�o?"
	Say(str,getn(btn),btn)
	return
end

function ShiConform(appName)
	Say("B�n mu�n h�y b� "..safeshow(appName).."quan h� s� �� gi�a  ? ",
		2,
		"X�c nh�n/#BreakShituLeague('"..safestr(appName).."')",
		" H�y b� /BreakTuList")
	return
end

function TuConform()
	local playerName = GetName();
	local btn = {
		"X�c nh�n/#BreakShituLeague('"..safestr(playerName).."')",
		" H�y b� /ApprenticeDialog"
	}
	
	local masterName = GetMaster(playerName)
	if (masterName == nil) then
		local lid = GetShituLeagueId(playerName)
		if(TRUE(lid)) then -- ʦ�������ڣ���ս�Ӵ���
			Say("S� ph� c�a b�n �� m�t t�ch, b�n quy�t ��nh h�y b� quan h� s� �� v�i s� ph�?",getn(btn),btn)
		else
			print("Quan h� S� �� kh�ng t�n t�i.")
		end
	else		
		Say("B�n mu�n h�y b� "..safeshow(masterName).."quan h� s� �� c�a ??",getn(btn),btn)
	end
	return
end

function TudiInfoList()
	local apps = GetApprentice(GetName())
	if(not apps) then
		Msg2Player("B�n kh�ng c� b�t c� s� �� n�o.")
		return
	end
	local btn={}
	local pid = 0;
	local state = 0;
	for i=1,getn(apps) do
		pid = SearchPlayer(apps[i])
		if (pid > 0) then
			state = callPlayerFunction(pid,GetTask,TKID_GOLD_APPRENTICE);
			if (state == 1 or state == 2) then
				tinsert(btn,"Xem tin t�c  "..safeshow(apps[i]).."Tin t�c t��ng quan c�a (�� t� Ho�ng Kim) /#TudiInfo('"..safestr(apps[i]).."')")
			else
				tinsert(btn,"Xem tin t�c  "..safeshow(apps[i]).."./#TudiInfo('"..safestr(apps[i]).."')")
			end
		end
	end
	tinsert(btn,"Tr� l�i/MasterDialog")
	tinsert(btn," ��ng/Quit")
	local str = "B�n mu�n xem tin t�c c�a �� �� n�o?"
	Say(str,getn(btn),btn)
	return
end

--�鿴ͽ������ʱ��ͽ���б�
function LilianList()
	local apps = GetHaveNewLilianApps(GetName())
	if(not apps) then
		Msg2Player("Cho ��n nay, ch�a c� s� �� n�o tr�i qua r�n luy�n giang h� m�i.")
		return
	end
	local btn={}
	for i=1,getn(apps) do
		tinsert(btn,safeshow(apps[i][1]).."�� ho�n th�nh m�i!"..apps[i][2].."nhi�m v� r�n luy�n!/#ChaLilian('"..safestr(apps[i][1]).."')")
	end
	tinsert(btn,"Tr� l�i/MasterDialog")
	tinsert(btn," ��ng/Quit")
	local str = "B�n mu�n xem r�n luy�n giang h� c�a �� �� n�o?"
	Say(str,getn(btn),btn)
	return
end

tb_playerinfo_lilian = {TTKID_SELF_LILIAN_FLAG,TTKID_MASTER_LILIAN_FLAG}

function ChaLilian(appName) --ʦ������
	local appIdx = SearchPlayer(appName)
	if(FALSE(appIdx)) then
		Msg2Player(appName.."Kh�ng bi�t tung t�ch.")
		return
	end
	setPlayerTaskTemp(appIdx,{[TTKID_MASTER_LILIAN_FLAG]=1})
	-- local appinfo = getPlayerInfo(appIdx,nil,nil,{TTKID_SELF_LILIAN_FLAG,TTKID_MASTER_LILIAN_FLAG})
	local appinfo = getPlayerInfo(appIdx, nil, nil, tb_playerinfo_lilian)
	if(not appinfo) then
		return
	end
	if(appinfo.tasktmp[TTKID_SELF_LILIAN_FLAG]==appinfo.tasktmp[TTKID_MASTER_LILIAN_FLAG] and appinfo.tasktmp[TTKID_SELF_LILIAN_FLAG]~=0) then
		Msg2Player("B�n tr� l�i b�t ��u tra xem "..appName.."r�n luy�n giang h� c�a")
		sendMessage(appIdx,GetName().."tr� l�i b�t ��u tra xem r�n luy�n giang h� c�a b�n.")
		setPlayerTaskTemp(appIdx,{[TTKID_SELF_LILIAN_FLAG]=0,[TTKID_MASTER_LILIAN_FLAG]=0})
		UpdatePlayerLilian(appIdx)
		PayLilianBonus(appIdx,PlayerIndex)
		return
	end
	Msg2Player("B�n mu�n tra xem "..appName.." r�n luy�n giang h� c�a  , �ang ��i ph�c m�nh")
	sendMessage(appIdx,GetName().."C�n tra xem r�n luy�n giang h� c�a, xin s� d�ng ch�c n�ng <color=green>Ph�c m�nh s� ph�<color> trong <color=yellow>S� �� thi�p<color> �� tr� l�i.")
	return
end

function FuLilian(masterName) --ͽ�ܵ���
	local masterIdx = SearchPlayer(masterName)
	if(FALSE(masterIdx)) then
		Msg2Player(masterName.."Kh�ng bi�t tung t�ch.")
		return
	end
	SetTaskTemp(TTKID_SELF_LILIAN_FLAG,1)
	if(GetTaskTemp(TTKID_SELF_LILIAN_FLAG)==GetTaskTemp(TTKID_MASTER_LILIAN_FLAG) and GetTaskTemp(TTKID_SELF_LILIAN_FLAG)~=0) then
		Msg2Player("B�n c�n ph�c m�nh v�i "..masterName..", �� b�n ch�i xem r�n luy�n giang h� c�a b�n")
		sendMessage(masterIdx,GetName().."c�n ph�c m�nh v�i b�n, b�n b�t ��u tra xem r�n luy�n giang h� c�a b�n ch�i!")
		setPlayerTaskTemp(PlayerIndex,{[TTKID_SELF_LILIAN_FLAG]=0,[TTKID_MASTER_LILIAN_FLAG]=0})
		UpdatePlayerLilian(PlayerIndex)
		PayLilianBonus(PlayerIndex,masterIdx)
		return
	end
	Msg2Player("B�n c�n ph�c m�nh v�i"..masterName..", �ang ��i b�n ch�i tra xem r�n luy�n giang h� c�a b�n.")
	sendMessage(masterIdx,GetName().."c�n ph�c m�nh v�i b�n. H�y s� d�ng ch�c n�ng <color=green>Tra xem r�n luy�n giang h� c�a �� ��<color> trong <color=yellow >S� �� thi�p<color>�� tr� l�i.")
	return
end

function SendBaiShiBidding()
	local mapid, x, y = GetWorldPos();
	local myMapName, myMapX, myMapY = tl_getMapInfo(mapid);
	local str = "ng��i ch�i m�i ["..GetName().."] t� ch�t h�n ng��i! Xu�t s� nh� ��ng l�m h� danh s� ph� nh�!"
	if (myMapName ~= 0) then
		x = floor(x / 8);
		y = floor(y / 16);
		AddLocalNews(str.."ng��i c� � h�y ��n ["..myMapName.."]("..x..", "..y..")");
	else
		AddLocalNews(str.."ng��i quan t�m, xin li�n h� v�i ");
	end
	
	-- ��ǣ�2 - ������ʦ����
	SetTask(TKID_GOLD_APPRENTICE, 2);
end

function ApprenticeDialog()
	print("Call ApprenticeDialog")
	local btn = {}
	
	local lvl = GetLevel()
	if (lvl < 80 and GetTask(TKID_GOLD_APPRENTICE) == 1) then
		tinsert(btn,"Ph�t th�ng b�o b�i s� tr�n t�n s� th� gi�i/SendBaiShiBidding")
	end
	
	if(lvl < 80) then
		tinsert(btn,"nh�n ���c n�ng l�c s� ph� cho b�n/GetAbility")
	else
		local master = GetMaster(GetName())
		if(TRUE(SearchPlayer(master))) then
			tinsert(btn,"xu�t s� /TudiChushi")
		end
	end
	if(TRUE(HaveNewLilian(PlayerIndex))) then
		tinsert(btn,"ph�c m�nh v�i s� ph� /Fuming")
	end
	tinsert(btn,"Xem t�nh h�nh h�c ngh� /ChaSelfInfo")
	tinsert(btn,"T�m hi�u tin t�c s� ph� /TdChaShifu")
	tinsert(btn,"H�y b� quan h� �� ��/TuConform")
	tinsert(btn,"T�m hi�u S� �� thi�p/AboutShituCard")
	-- VN_MODIFY_20060427
	-- �رջƽ�ʦͽ��(˵��)
	-- tinsert(btn,"�˽�ƽ�ʦͽ��(����˵��)/AboutShituGoldCard")
	tinsert(btn," ��ng/Quit")
	local str = "H�y l�a ch�n thao t�c li�n quan c�a �� ��:"
	Say(str,getn(btn),btn)
	return	
end

function ChushiList()
	local apps = GetEnableChushiApps(GetName())
	if(not apps) then
		Msg2Player("Hi�n kh�ng c� �� t� th�ch h�p c� th� xu�t s�.")
		return
	end
	local btn={}
	for i=1,getn(apps) do
		tinsert(btn,safeshow(apps[i][1]).."["..apps[i][2].."c�p] Hi�n �� c� th� xu�t s� /#ShiChushi('"..safestr(apps[i][1]).."')")
	end
	tinsert(btn,"Tr� l�i/MasterDialog")
	tinsert(btn," ��ng/Quit")
	local str = "B�n mu�n �� �� n�o xu�t s�?"
	Say(str,getn(btn),btn)
	return
end

function ShiChushi(appName)
	local appIdx = SearchPlayer(appName)
	if(FALSE(appIdx)) then
		Msg2Player(appName.."Kh�ng bi�t tung t�ch, xem ra t�m th�i kh�ng th� �� �� �� xu�t s�.")
		return
	end
	local app = getPlayerInfo(appIdx,{"level"})
	if(app.level <80) then
		Msg2Player(appName.."n�ng l�c c�a   ch�a �� tr�nh �� xu�t s�. Hay l� ��i 2 n�m sau nh�!")
		return
	end
	setPlayerTaskTemp(appIdx,{[TTKID_MASTER_CHUSHI]=1})
	app = getPlayerInfo(appIdx,nil,nil,{TTKID_APPRENTICE_CHUSHI,TTKID_MASTER_CHUSHI})
	if(app.tasktmp[TTKID_MASTER_CHUSHI]== app.tasktmp[TTKID_APPRENTICE_CHUSHI] and app.tasktmp[TTKID_APPRENTICE_CHUSHI]~=0) then
		Msg2Player(appName.."�� v��t tr�i h�n th�y, b�n v� c�ng vui m�ng, quy�t ��nh cho "..appName.." xu�t s�.")
		sendMessage(appIdx,GetName().." �� ��ng � �� b�n xu�t s�, cu�i c�ng b�n c�ng c� th� l�m n�n chuy�n l�y l�ng!")
		--AddGlobalNews("��ϲ"..appName.."ѧ���ѳɣ���"..GetName().."���³�ʦ��")
		OutShituLeague(appName,GetName())
		return
	end
	Msg2Player("B�n c�m th�y"..appName.."Th�ng minh lanh l�i, ch�p m�t �� kh�ng c�n g� d�y �� t� n�a, quy�t ��nh �� �� t� xu�t s�,"..appName.."trong l�c suy ngh�...")
	sendMessage(appIdx,GetName().."c�m th�y b�n �� �u t� h�n th�y ch�p m�t �� kh�ng c�n g� d�y b�n n�a, quy�t ��nh �� b�n xu�t s�, �ang ��i quy�t ��nh c�a b�n...")
	return
end

function TudiChushi() --ͽ�ܼ���
	local masterName = GetMaster(GetName())
	if(not masterName) then --ʦ������
		Msg2Player("B�n kh�ng c� s� ph�, xu�t s� g� ch�?")
		return
	end
	local masterIdx = SearchPlayer(masterName)
	if(FALSE(masterIdx)) then
		Msg2Player("S� ph� �� �i m�t, kh�ng th� xu�t s�.")
		return
	end
	if(GetLevel() <80) then
		Msg2Player("N�ng l�c c�a b�n ch�a �� �� xu�t s�! H�y ti�p t�c kh� luy�n th�m 2 n�m.")
		return
	end
	SetTaskTemp(TTKID_APPRENTICE_CHUSHI,1)
	if(GetTaskTemp(TTKID_APPRENTICE_CHUSHI)==GetTaskTemp(TTKID_MASTER_CHUSHI) and GetTaskTemp(TTKID_MASTER_CHUSHI)~=0) then
		Msg2Player("���c s� ph� b�i d��ng nhi�u n�m, cu�i c�ng b�n h�c �� th�nh, d� ��nh ra ngo�i t� l�p!")
		sendMessage(masterIdx,GetName().."���c s� ph� b�i d��ng nhi�u n�m, cu�i c�ng h�c �� th�nh, d� ��nh ra ngo�i t� l�p!")
		--AddGlobalNews("��ϲ"..GetName().."ѧ���ѳɣ���"..masterName.."���³�ʦ��")
		OutShituLeague(GetName(),masterName)
		return
	end
	Msg2Player("B�n c�m th�y h�c ngh� �� th�nh xin"..masterName.."xu�t s�, �ang ��i s� ph� tr� l�i...")
	sendMessage(masterIdx,GetName().."c�m th�y h�c ngh� �� th�nh, xin b�n xu�t s�. H�y s� d�ng ch�c n�ng <color=green>�� �� xu�t s�<color> trong <color=yellow>S� �� thi�p<color> tr� l�i.")
	return	
end

function Fuming()
	local masterName = GetMaster(GetName())
	FuLilian(masterName)
	return
end

function GetAbility()
	if(GetLevel()>80) then
		Msg2Player("B�n l�nh c�a b�n �� h�c ���c kha kh�, kh�ng c�n d�a d�m v�o s� ph� n�a!")
		return
	end
	AddSkillState(531,10,1,30*60*18)
	AddSkillState(461,1, 1,30*60*18)
	Msg2Player("B�n �� s� d�ng n�ng l�c t�ng ��i �i�m kinh nghi�m m� s� ph� cho b�n!")
	return
end

function TudiInfo(appName)  --ʦ����ͽ����Ϣ
	local pid = SearchPlayer(appName)
	if(FALSE(pid)) then
		Msg2Player(appName.."Kh�ng bi�t tung t�ch, kh�ng th� nh�n ���c tin t�c c�a")
		return
	end
	local sex = callPlayerFunction(pid,GetSex)
	local str
	if(FALSE(sex)) then --��
		str = "<link=image[0,0]:\\spr\\Ui3\\���Ф��\\Ф��\\001.spr>"
	else
		str = "<link=image[0,0]:\\spr\\Ui3\\���Ф��\\Ф��\\003.spr>"
	end
	str = str..appName.."<link>:"..sex2Word(sex).."<enter>"
	local joinLvl = callPlayerFunction(pid,GetTask,TKID_ENTER_LEVEL)
	str = str.."Khi b�n � "..tostring(joinLvl).."c�p...c�a..., thu nh�n b�n ch�i l�m �� ��, "
	local masterCount = callPlayerFunction(pid,GetTask,TKID_MASTER_COUNT)
	if(masterCount<=1) then
		str = str.."B�n �� l� ng��i th�y ��u ti�n c�a b�n ch�i, "
		if(joinLvl<=25) then
			str = str.."B�n ch�i l� �� t� <color=yellow>��ch truy�n<color> c�a b�n."
		else
			str = str.."B�n ch�i l� �� t� <color=green>tr�c h�<color>c�a b�n."
		end
	else
		str = str.."L�c tr��c, b�n ch�i �� b�i "..tostring(masterCount-1).." l�m s� ph�, "
	end
	local appLvl = callPlayerFunction(pid,GetLevel)
	if(appLvl<80) then
		str = str.."Hi�n t�i ��ng c�p c�a b�n ch�i ��t"..tostring(appLvl).."c�p.<enter>"
	else
		str = str.."Hi�n t�i b�n ch�i ��t"..tostring(appLvl).."c�p. B�n c� th� b�o �� t� t� m�nh phi�u b�t giang h�.<enter>"
	end
	local lilianCount = GetPlayerLilianCount(pid)
	local newllc = HaveNewLilian(pid)
	if(lilianCount<1) then
		if(TRUE(newllc)) then
			str = str..appName.."�� ho�n th�nh nh� sau<color=yellow>"..newllc.."<color> Nhi�m v� th� luy�n giang h�, �ang ��i b�n ki�m tra:<enter>"
			local newll = GetNewLLInfo(GetPlayerNewLilian(pid))
			for i=1,getn(newll) do
				str = str.."  "..newll[i].."<enter>"
			end
		else
			str = str.."��n nay, "..appName.."c�n 1 vi�c ch�a th�nh."
		end
	else
		local masterllCount = GetPlayerMasterLilianCount(pid)
		if(FALSE(masterllCount)) then --��û�����κ�����
			if(TRUE(newllc)) then
				str = str.." hi�n t�i"..appName.."�� ho�n th�nh nh� sau<color=yellow>"..newllc.."<color> Nhi�m v� th� luy�n giang h�, �ang ��i b�n ki�m tra:<enter>"
				local newll = GetNewLLInfo(GetPlayerNewLilian(pid))
				for i=1,getn(newll) do
					str = str.."  "..newll[i].."<enter>"
				end
			end
			str = str.."Tr��c kia, "..appName.."�� ho�n th�nh."..lilianCount.."nhi�m v� th� luy�n giang h�, "
			str = str.."nh�ng � t�n tu�i c�a b�n, ch�a ho�n th�nh nhi�m v� th� luy�n giang h� n�o.<enter>"
		else
			if(TRUE(newllc)) then
				str = str..appName.."�� ho�n th�nh nh� sau<color=yellow>"..newllc.."<color> Nhi�m v� th� luy�n giang h�, �ang ��i b�n ki�m tra:<enter>"
				local newll = GetNewLLInfo(GetPlayerNewLilian(pid))
				for i=1,getn(newll) do
					str = str.."  "..newll[i].."<enter>"
				end
			end
			str = str.."Tr��c kia, "..appName.."c�n ho�n th�nh"..lilianCount.."nhi�m v� th� luy�n giang h�, "
			str = str.."Trong s� nhi�m v� ho�n th�nh m� b�n c� nh�<color=green>"..masterllCount.."<color> nhi�m v� th� luy�n giang h�:<enter>"
			local masterLilian = GetLLFinishedInfo(GetPlayerMasterLilian(pid))
			for i=1,getn(masterLilian) do
				str = str.."  "..masterLilian[i].."<enter>"
			end
		end
	end
	local unfinishedLilian = GetLLUnfinishedInfo(GetPlayerLilian(pid))
	if(unfinishedLilian) then
		str = str.."b�n ch�i hi�n c�n<color=red>"..getn(unfinishedLilian).."<color>vi�c ch�a ph�c m�nh v�i b�n, ph�n bi�t l�:<enter>"
		for i=1,getn(unfinishedLilian) do
			str = str.."  "..unfinishedLilian[i].."<enter>"
		end
	else
		str = str.."�� t� �� ho�n th�nh t�t c� nhi�m v� th� luy�n giang h�!"
	end
	local btn = {
		"Tr� l�i/TudiInfoList",
		" ��ng/Quit"
	}
	if(TRUE(newllc)) then
		tinsert(btn,1,"Tra xem"..appName..", �� t� �� ho�n th�nh"..newllc.."nhi�m v� /#ChaLilian('"..safestr(appName).."')")
	end
	Describe(str,getn(btn),btn)
	return
end

function ChaSelfInfo() --ͽ�ܲ��Լ�����Ϣ
	local str
	if(FALSE(GetSex())) then --��
		str = "<link=image[0,0]:\\spr\\Ui3\\���Ф��\\Ф��\\001.spr>"
	else
		str = "<link=image[0,0]:\\spr\\Ui3\\���Ф��\\Ф��\\003.spr>"
	end
	str = str..GetName().."<link>:"..sex2Word(GetSex()).."<enter>"
	
	local master = GetMaster(GetName())
	master = master or ""
	str = str.."Khi b�n ��t "..tostring(GetTask(TKID_ENTER_LEVEL)).."c�p, b�i nh�p l��ng s� "..master.."s� m�n c�a, "
	local masterCount = GetTask(TKID_MASTER_COUNT)
	if(masterCount<=1) then
		str = str.."B�n ch�i l� ng��i th�y ��u ti�n c�a b�n."
	else
		str = str.."Tr��c kia, b�n �� b�i "..tostring(masterCount-1).." l�m s� ph� "
	end
	local myLvl = GetLevel()
	if(myLvl<80) then
		str = str.."Hi�n t�i ��ng c�p c�a b�n ���c n�ng ��n"..tostring(myLvl).."c�p.<enter>"
	else
		str = str.."Hi�n t�i b�n ��t"..tostring(myLvl)..". ��t y�u c�u xu�t s�.<enter>"
	end
	local lilianCount = GetLilianCount()
	local newllc = HaveNewLilian(PlayerIndex)
	if(lilianCount<1) then
		if(TRUE(newllc)) then
			str = str.."b�n �� ho�n th�nh <color=yellow>"..newllc.."<color> nhi�m v� th� luy�n giang h�, �ang ch�ph�c m�nh v�i s� ph�:<enter>"
			local newll = GetNewLLInfo(GetPlayerNewLilian(PlayerIndex))
			for i=1,getn(newll) do
				str = str.."  "..newll[i].."<enter>"
			end
		else
			str = str.."��n nay, b�n c�n 1 vi�c ch�a th�nh."
		end
	else
		local masterllCount = GetMasterLilianCount()
		if(FALSE(masterllCount)) then --δ�����������������  
			if(TRUE(newllc)) then
				str = str.."Hi�n b�n �� ho�n th�nh <color=yellow>"..newllc.."<color> nhi�m v� th� luy�n giang h�, �ang ch�ph�c m�nh v�i s� ph�:<enter>"
				local newll = GetNewLLInfo(GetPlayerNewLilian(PlayerIndex))
				for i=1,getn(newll) do
					str = str.."  "..newll[i].."<enter>"
				end
			end
			str = str.."Tr��c kia, b�n �� ho�n th�nh."..lilianCount.."nhi�m v� th� luy�n giang h�, "
			str = str.."nh�ng d��i t�n tu�i c�a s� ph�, b�n ch�a ho�n th�nh nhi�m v� th� luy�n giang h� n�o.<enter>"
		else
			if(TRUE(newllc)) then
				str = str.."b�n �� ho�n th�nh <color=yellow>"..newllc.."<color> nhi�m v� th� luy�n giang h�, �ang ch�ph�c m�nh v�i s� ph�:<enter>"
				local newll = GetNewLLInfo(GetPlayerNewLilian(PlayerIndex))
				for i=1,getn(newll) do
					str = str.."  "..newll[i].."<enter>"
				end
			end
			str = str.."Tr��c kia, b�n �� ho�n th�nh."..lilianCount.."nhi�m v� th� luy�n giang h�, "
			str = str.."trong s� nhi�m v� ho�n th�nh nh� sau<color=green>"..masterllCount.."<color> nhi�m v� th� luy�n giang h�:<enter>"
			local masterLilian = GetLLFinishedInfo(GetPlayerMasterLilian(PlayerIndex))
			for i=1,getn(masterLilian) do
				str = str.."  "..masterLilian[i].."<enter>"
			end
		end
	end
	local unfinishedLilian = GetLLUnfinishedInfo(GetPlayerLilian(PlayerIndex))
	if(unfinishedLilian) then
		str = str.."B�n c�n<color=red>"..getn(unfinishedLilian).."<color>vi�c ch�a ph�c m�nh, ph�n bi�t l�:<enter>"
		for i=1,getn(unfinishedLilian) do
			str = str.."  "..unfinishedLilian[i].."<enter>"
		end
	else
		str = str.."B�n �� ho�n th�nh t�t c� nhi�m v� th� luy�n giang h�!"
	end
	local btn = {
		"Tr� l�i/ApprenticeDialog",
		" ��ng/Quit"
	}
	if(TRUE(newllc)) then
		tinsert(btn,1,"C� "..newllc.."vi�c th� luy�n c� th� ph�c m�nh v�i s� ph� /Fuming")
	end
	Describe(str,getn(btn),btn)
	return
end

function SfChaShifu()
	local btn = {
		"Tr� l�i/MasterDialog",
		" ��ng/Quit"
	}
	local str = safeshow(GetName())..":"..sex2Word(GetSex()).."<enter>"
	local lid = GetShituLeagueId(GetName())
	if(FALSE(lid) and FALSE(GetTask(TKID_APPRENTICE_COUNT))) then
		str = str.."��n nay, ch�a l�m qua s� ph�."
		Say(str,getn(btn),btn)
		return
	end
	str = str.."��n nay, �� thu nh�n "..GetTask(TKID_APPRENTICE_COUNT).." �� ��,"
	str = str.." trong �� hu�n luy�n th�nh c�ng "..GetTask(TKID_DICHUAN_APPRENTICE_COUNT).." ��ch truy�n �� t�, "
	str = str..GetTask(TKID_ZHIXI_APPRENTICE_COUNT).." tr�c h� �� t�, "
	str = str..GetTask(TKID_NORMAL_APPRENTICE_COUNT).." ph� th�ng �� t�."
	str = str.."Hi�n t�i, b�n c� th� d�n d�t"..ComputeMasterLoad(GetTask(TKID_DICHUAN_APPRENTICE_COUNT)).." �� ��,"
	str = str.." H�n n�a, hi�n �� thu nh�n "..tostring(GetApprenticeNum(GetName())).." �� ��."
	Say(str,getn(btn),btn)
	return
end

function TdChaShifu()
	local masterName = GetMaster(GetName())
	if(not masterName) then
		Msg2Player("Hi�n b�n ch�a c� s� ph�.")
		return
	end
	local btn = {
		"Tr� l�i/ApprenticeDialog",
		" ��ng/Quit"
	}
	local masterIdx = SearchPlayer(masterName)
	if(FALSE(masterIdx)) then
		Say("S� ph� c�a b�n"..safeshow(masterName).." hi�n �� m�t t�ch, b�n kh�ng th� t�m hi�u t�nh h�nh c�a s� ph�.",getn(btn),btn)
		return
	end
	local master = getPlayerInfo(masterIdx,{"sex"},{TKID_APPRENTICE_COUNT,
		TKID_DICHUAN_APPRENTICE_COUNT,TKID_ZHIXI_APPRENTICE_COUNT,TKID_NORMAL_APPRENTICE_COUNT})
	local str = safeshow(masterName)..":"..sex2Word(master.sex).."<enter>"
	str = str.."��n nay, �� thu nh�n "..master.task[TKID_APPRENTICE_COUNT].." �� ��,"
	str = str.." trong �� hu�n luy�n th�nh c�ng "..master.task[TKID_DICHUAN_APPRENTICE_COUNT].." ��ch truy�n �� t�, "
	str = str..master.task[TKID_ZHIXI_APPRENTICE_COUNT].." tr�c h� �� t�, "
	str = str..master.task[TKID_NORMAL_APPRENTICE_COUNT].." ph� th�ng �� t�."
	str = str.."Hi�n t�i, "..safeshow(masterName).."t�ng c� th� d�n d�t "..ComputeMasterLoad(master.task[TKID_DICHUAN_APPRENTICE_COUNT]).." �� ��,"
	str = str.." H�n n�a, hi�n �� thu nh�n "..tostring(GetApprenticeNum(masterName)).." �� ��."
	Say(str,getn(btn),btn)
	return
end

--�õ�����������ͽ���б�
function GetHaveNewLilianApps(playerName)
	local apps = GetApprentice(playerName)
	if(not apps) then return nil end
	local tab = {}
	for i=1 ,getn(apps) do
		local pid = SearchPlayer(apps[i])
		if(TRUE(pid)) then
			local num = HaveNewLilian(pid)
			if(TRUE(num)) then
				tab[getn(tab) + 1] = {apps[i],num}
			end
		end
	end
	if(getn(tab)<1) then
		return nil
	end
	return tab
end

--�õ����Գ�ʦ��ͽ�ܵ��б�
function GetEnableChushiApps(playerName)
	local apps = GetApprentice(playerName)
	if(not apps) then return nil end
	local tab = {}
	for i=1 ,getn(apps) do
		local pid = SearchPlayer(apps[i])
		if(TRUE(pid)) then
			local lvl = callPlayerFunction(pid,GetLevel)
			if(lvl>=80) then
				tinsert(tab,{apps[i],lvl})
			end
		end
	end
	if(getn(tab)<1) then
		return nil
	end
	return tab
end

function DefaultDialog()
	local btn = {}
	local szOp = {
		"T�m hi�u S� �� thi�p/AboutShituCard",
		"T�m hi�u S� �� thi�p ho�ng kim (thuy�t minh ��c t�nh) /AboutShituGoldCard",
		" ��ng/Quit"
	};
	
	local lvl = GetLevel()
	if (lvl < 80 and GetTask(TKID_GOLD_APPRENTICE) == 1) then
		tinsert(btn,"Ph�t th�ng b�o b�i s� tr�n t�n s� th� gi�i/SendBaiShiBidding")
	end
	
	tinsert(btn, szOp[1])
	-- VN_MODIFY_20060427
	-- �رջƽ�ʦͽ��(˵��)
	--tinsert(btn, szOp[2])
	tinsert(btn, szOp[3])
	
	local str = "S� �� thi�p d�ng �� g�n k�t quan h� s� ��, h�n n�a c� th� s� d�ng ch�c n�ng s� �� t��ng quan. N�u b�n ch�a c� quan h� s� ��, h�y l�p ��i nh�m v�i ng��i ch�i kh�c r�i m�i s� d�ng S� �� thi�p!"
	Say(str,getn(btn),btn)
	return
end

Quit = function() end

function AboutShituCard()
	local str =
		"Trong th� gi�i ki�m hi�p, ng��i ch�i t� c�p 80 tr� xu�ng (kh�ng g�m c�p 80) , s� d�ng <color=green>S� �� thi�p<color> c� th� b�i ng��i ch�i c�p 80 tr� l�n (g�m c� c�p 80) l�m s� ph�.<enter>"..
		"M�t khi s� d�ng quan h� s� �� gi�a ng��i ch�i, s� ph� c�n c� ch�c tr�ch nh�t ��nh, ch� ��o ho�c gi�p �� �� t� ho�n th�nh h� th�ng nhi�m v� <color=yellow>th� luy�n giang h�<color>, v� cho �� �� sau khi d�t ���c c�p 80 xu�t s�, s� ph� �� ���c xem nh� d�n d�t 1 �� �� th�nh c�ng.<enter>"..
		"Trong th� gi�i ki�m hi�p, 1 �� �� ��ng th�i ch� c� 1 s� ph� v� 1 s� ph� c� th� ��ng th�i thu nh�n nhi�u �� ��. N�u ng��i ch�i t� c�p 25 tr� xu�ng (bao g�m c�p 25) v� ch�a bao gi� b�i s�, sau khi b�i nh�p th�nh c�ng 1 s� ph�, ng��i ch�i �� ch�nh l� <color=yellow>��chtruy�n �� t�<color> c�a s� ph�;N�u ng��i ch�i t� c�p 25 tr� l�n (kh�ng bao g�m c�p 25) b�i nh�p 1 s� ph�, ng��i ch�i l� <color=yellow>�� t� tr�c h�<color> c�a s� ph�;N�u ng��i ch�i tr��c kia �� b�i s� nh�ng �� ch�m d�t quan h� s� �� v�i ti�n s�, b�i nh�n 1 s� ph�, ng��i ch�i s� l� <color=yellow>ph� th�ng �� t�<color> c�a s� ph�.<enter>"..
		"<enter>�i�u ki�n tr� th�nh �� ��:<enter>"..
		"1, Ng��i ch�i t� c�p 80 tr� xu�ng (kh�ng g�m c�p 80)<enter>"..
		"2, Kh�ng l� �� �� c�a m�t s� ph� n�o ��<enter>"..
		"<enter>�i�u ki�n tr� th�nh s� ph�:<enter>"..
		"1, Ng��i ch�i t� c�p 80 tr� l�n (bao g�m c�p 80)<enter>"..
		"2, Kh�ng l� �� �� c�a m�t s� ph� n�o ��<enter>"..
		"<enter>C�ch nh�n ���c S� �� thi�p:<enter>"..
		"1, nh�n v�t ���c t�o m�i: c� s�n S� �� thi�p trong h�nh trang<enter>"..
		"2, Nh�n v�t �� t�o: mua S� �� thi�p � c�c ti�m t�p h�a, gi� b�n l� 100 l��ng<enter>"
	Describe(str,2,"Tr� l�i/main"," ��ng/Quit")
	return
end

function AboutShituGoldCard()
	local str =
		"<color=yellow>S� �� thi�p Ho�ng Kim<color>ngo�i ch�c n�ng l� S� �� thi�p b�nh th��ng ra, n� c�n mang nh�ng ��c t�nh d��i ��y:<enter>"..
		" 1. C� th� ph�t th�ng b�o 1 l�n l�n t�n s� th� gi�i, t�m th�y xin b�i s�<enter>"..
		" 2. Khi ph�c m�nh v�i s� ph� �� �� s� nh�n ���c 50%, s� ph� 20% ph�n th��ng �i�m kinh nghi�m<enter>"..
		" 3. Ph�n th��ng b�t ng� S� �� thi�p Ho�ng Kim ch� c� hi�u l�c khi �� �� s� d�ng<enter>"..
		" 4. S� �� thi�p Ho�ng Kim kh�ng th� �� r�i xu�ng ��t, kh�ng th� giao d�ch v�i ng��i ch�i kh�c<enter>"..
		"<enter>C�ch nh�n S� �� thi�p Ho�ng Kim:<enter>"..
		" 1. S� d�ng cd-key k�ch ho�t v�o s� t�i kho�n gia nh�p <color=green>h� th�ng Qu�ng c�o<color>, l� c� th� nh�n ���c 1 t�m <color=yellow>S� �� thi�p Ho�ng Kim<color><enter>"..
		" 2. S� d�ng m�t t�i kho�n ch� c� 1 nh�n v�t c� th� nh�n ���c <color=yellow>S� �� thi�p Ho�ng Kim<color>"
		
	Describe(str,2,"Tr� l�i/main"," ��ng/Quit")
	return
end


-- �������֮���Ƿ��Ѿ����� 5 ��ͽ��
function checkTudiLimit()
	
	-- �ڴ��ж��Ƿ񳬹��� 7 �� 5 ��ͽ�ܵ�����
	local nNowTime = GetCurServerTime();
	local nOldTime = GetTask(ID_SHITU_LIMIT_DATE);  -- ��һ����ͽ�ܵļ�¼
	local nNowCount = GetTask(ID_SHITU_LIMIT_NUM);
	
		if nNowTime - nOldTime<CONST_SHITU_LIMIT_TIME then
			-- ��������˴�������
			if nNowCount>=5 then
				return 0;
			else
				return 1;
			end;
		else
			-- ��������� 7 �죬�����ñ���
			SetTask(ID_SHITU_LIMIT_NUM, 0);
			return 1;
		end;
end;


-- д����ͽ�ܵ�����
function writeTudiLimit()
	
	-- �ڴ˼�����ͽ�ܵ����Ƽ�¼
	SetTask(ID_SHITU_LIMIT_NUM, GetTask(ID_SHITU_LIMIT_NUM) + 1);	
	
	-- ����ǵ�һ����ͽ�����¼����
	if GetTask(ID_SHITU_LIMIT_NUM)==1 then
		SetTask(ID_SHITU_LIMIT_DATE, GetCurServerTime());
	end;
	
end;


function main()
	if (ST_IsTransLife() == 1 and GetLevel() < 80) then
		Say("L�nh h�i B�c ��u Tr��ng Sinh Thu�t - T�m Ph�p Thi�n xong, � c�p 80 v� tr��c kh�ng th� s� d�ng S� �� Thi�p.", 0);
		return 1
	end;
	local degree = GetPlayerDegree(PlayerIndex)
	
	if(degree == CONST_DEGREE_PREAPPRENTICE) then
		local masters = FindMaster()
		if(not masters) then
			DefaultDialog()
			return 1
		end
		BaishiList(masters)
		return 1
	end
	if(degree == CONST_DEGREE_PREMASTER) then	
		local apps = FindApprentice()
		if(not apps) then
			DefaultDialog()
			return 1
		end
		ShoutuList(apps)
		return 1
	end
	if(degree == CONST_DEGREE_MASTER) then
		MasterDialog()
		return 1
	end
	if(degree == CONST_DEGREE_APPRENTICE) then
		ApprenticeDialog()
		return 1
	end
	return 1
end
