--Storm ���ʼ
--Include("\\script\\event\\storm\\function.lua")
--storm_ask2start(gameid)

--Storm �ӻ���
--Include("\\script\\event\\storm\\function.lua")
--storm_addpoint(gameid, addpoint)

--Storm �ӽ������֣��ν�
--local add_time = 60 * FRAME2TIME / TIMER_1
--Include("\\script\\event\\storm\\function.lua")
--storm_addm_mspointex(1, MISSIONID, (t - RUNGAME_TIME) / add_time)

--storm_gettime
--storm_gametime	�м��������Ϸ��ʱ

Include("\\script\\event\\storm\\head.lua")

--��鵱ǰ�Ƿ���Կ�ʼ�����
--����1��ʾ���Կ�ʼ��nilΪ������
function storm_can_start(gameid, silent)
	if (gameid == nil or TB_STORM_TASKID[gameid] == nil) then
		print("error gameid!")
		return nil
	end
	
	storm_anotherday()
	
	local str = ""
	if (GetTask(STORM_TASKID_DAY) > STORM_END_DAY) then	--�籩����ϵͳ�Ѿ��ر���
		str = "Xin l�i! H� th�ng t�ch l�y Phong Ba �� ��ng l�i."
	elseif (GetLevel() < 50) then	--50������
		str = "Xin l�i! ��ng c�p b�n qu� th�p, kh�ng th� tham gia ho�t ��ng t�ch l�y."
	elseif (storm_valid_game(gameid)) then	--���ڻ��
		str = "Tr��c m�t b�n"..storm_gamename(gameid, "red").."�� tham gia ho�t ��ng khi�u chi�n Phong Ba. Mau �i t�ch l�y �i�m �i!"
	elseif (GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_TRYCOUNT]) >= TB_STORM_TRYTIMES[gameid] or	--�û���Դ����ﵽ����
		(GetTask(STORM_TASKID_GAMES) >= 3 and GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_TRYCOUNT]) == 0)) then	--��μӻ���ﵽ���ޣ��������ҵ�ǰ�û�вμӹ�
		str = "Xin l�i! H�m nay b�n kh�ng th� tham gia"..storm_gamename(gameid, "red").."t�ch l�y Phong Ba r�i. Ng�y mai h�y ��n �i!"
	elseif (gameid == 1) then
		local n_timer = tonumber(GetLocalDate("%H%M"))
		if (n_timer > 2245 or n_timer < 200) then	--�ν����һ��
			str = "ng��i ��n tr� qu�, ng�y mai h�y ��n khi�u chi�n �i!"
		end
	end
	
	if (str ~= "") then
		if (not silent) then
			Say(str, 0)
		end
		return nil
	end
	
	return 1
end

--���˴α������뵽�籩���ֻ�еĶԻ�
function storm_ask2start(gameid, b_nonext)
--	if (storm_can_start(gameid, 1)) then
--		Say("�����籩���������Ϊ9��8��-10��2�գ������ν��ս��Ұ����������ɱ����������ÿ��������ڸ���ϵͳ�еĳɼ�ת��Ϊ��ķ籩���֣��μ�������50����������ң���<enter>"..
--		"����ÿ�ջ��ֽ���ÿ��<color=red>24��00���<color>������24��00ǰ��ȡ���ֽ�����<enter>"..
--		"����ÿ��<color=red>23��30<color>��ʼ���ν��ս���ɼ�������籩���֡�<enter>"..
--		"����������Ҫ��ʼ�����"..storm_gamename(1, "red").."֮�籩��ս��", 2,
--		"���Ѿ�׼������/#storm_want2start("..gameid..","..tostring(b_nonext)..")",
--		"�һ����´��ٿ�ʼ��/#storm_goon_start("..gameid..","..tostring(b_nonext)..")")
--		return 1
--	end
	if not b_nonext then
		storm_goon_start(gameid)	--��ʼ����Ļ
	end
	return nil
end

--���˴α������뵽�籩���ֻ�еĶԻ�
function storm_want2start(gameid, b_nonext)
	if (storm_can_start(gameid)) then
		local str = TB_STORM_HELP[gameid]..TB_STORM_DIALOG[gameid]
		if (gameid == 1) then	--�ν��ս��Ҫ�������ʾ����͵�ǰ����
			local tb_levelstr = {
				"Trong chi�n tr��ng T�ng Kim s� c�p, m�i ng��i m�i ng�y nh�n ���c t�ch l�y Phong Ba cao nh�t <color=yellow>80<color> �i�m.",
				"Trong chi�n tr��ng T�ng Kim trung c�p, m�i ng��i m�i ng�y nh�n ���c t�ch l�y Phong Ba cao nh�t <color=yellow>90<color> �i�m.",
				"Trong chi�n tr��ng T�ng Kim cao c�p, m�i ng��i m�i ng�y nh�n ���c t�ch l�y Phong Ba cao nh�t <color=yellow>100<color> �i�m."
			}
			local level = BT_GetGameData(GAME_LEVEL)
			local point = 0
			if (BT_GetGameData(GAME_KEY) == BT_GetData(PL_KEYNUMBER)) then
				point = GetTask(751)
			end
			str = format(str,tb_levelstr[level],point)
		end
		Say(str, 2,"Ta mu�n x�c ��nh b�t ��u/#storm_start("..gameid..",nil,"..tostring(b_nonext)..")","��i m�t l�t �i!/#storm_goon_start("..gameid..","..tostring(b_nonext)..")")
		return 1
	end
	return nil
end

--��ʼĳһ��ļƷ�
--gameid��	1~10	���ID
--����ֵ��	1�����ɹ�	nil����ʧ��
function storm_start(gameid, silent, b_nonext)
	if (not storm_can_start(gameid, silent)) then	--���ܿ�ʼ�û
		return nil
	end
	
	local nowtime = storm_gettime(gameid)
	if (nowtime == 0) then
		Say("Hi�n t�i"..storm_gamename(gameid, "red").."ho�t ��ng ch�a b�t ��u, ��i m�t l�t quay l�i �i!", 0)
	end
	
	local gamemode = 0
	--���ֻ����Ҫ��
	if (gameid == 1) then
		local ruleid = BT_GetGameData(GAME_RULEID)
		local sjmode = 0
		if (ruleid == 16) then	--Ԫ˧ģʽ
			sjmode = 3
		elseif (ruleid == 20) then	--ɱ¾ģʽ
			sjmode = 4
		elseif (ruleid == 11) then
			local tempSubWorld = SubWorld;
			SubWorld = SubWorldID2Idx(BT_GetGameData(GAME_MAPID))
			sjmode = GetMissionV(2)	--1���̶����죻2���漴����
			SubWorld = tempSubWorld;
		end
		local level = BT_GetGameData(GAME_LEVEL)
		if (sjmode == 0 or level == 0) then
			Say("Xin l�i! Ch�a x�c ��nh ���c ph��ng th�c, kh�ng th� b�t ��u khi�u chi�n Phong Ba, xin li�n h� GM �� gi�i quy�t!", 0)
			return nil
		end
		gamemode = sjmode*10+level
	elseif (gameid == 2) then
		gamemode = map_isadvanced[SubWorldIdx2ID(SubWorld)]
		if (gamemode == nil) then
			Say("Xin l�i! Ch�a x�c ��nh ���c ��ng c�p s�t th�, kh�ng th� b�t ��u khi�u chi�n Phong Ba, xin li�n h� GM �� gi�i quy�t!", 0)
			return nil
		end
	elseif (gameid == 4) then
		TM_SetTimer(STORM_TIMER_YS*60*18, STORM_TIMERID_YS, 60/STORM_TIMER_YS, 2)
	end
	
	--��������
	local trycount = GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_TRYCOUNT])
	if (trycount == 0) then	--�����һ�ν������������ӻ����
		SetTask(STORM_TASKID_GAMES, GetTask(STORM_TASKID_GAMES) + 1)
	end
	
	--��ʼ������
	nt_settask(TB_STORM_TASKID[gameid][STORM_TASKIDX_START], nowtime)
	nt_settask(TB_STORM_TASKID[gameid][STORM_TASKIDX_TRYCOUNT], trycount + 1)
	SetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTEX], 0)
	SetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTCUR], 0)
	if (gameid ~= 2) then	--ɱ�����������ԭʼ�ɼ�
		SetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_EXTRA], 0)
	end
	
	SetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_MODE], gamemode)	--��Ϸ��ǰģʽ
	
	Msg2Player(storm_gamename(gameid).."khi�u chi�n Phong Ba b�t ��u r�i.")
	debug_out(storm_gamename(gameid).."H�nh th�c chi ti�t:"..gamemode)
	
	if (tonumber(GetLocalDate("%H")) == 23) then
		local str = "Ch� �: T�ch l�y Phong Ba h�m nay s� m�t hi�u d�ng v�o l�c 24h:00 (l�y gi� tr�n Server l�m chu�n) , xin k�p th�i nh�n ph�n th��ng c�a m�nh!"
		Talk(1, "", str)
		Msg2Player(str)
	end
	
	if (gameid == 4) then
		storm_add_pointex(4, 40)
	end

	if not b_nonext then
		storm_goon_start(gameid)	--��ʼ����Ļ
	end
	return 1
end

--���¼��㵱���ܻ��֣�����б仯����ͬʱ��¼�ա��ܡ��»���
--���gameid��Ϊnil����Ϊָ���Ļ�ı����
function storm_calc_today(gameid, newpoint)
	if (gameid ~= nil and TB_STORM_TASKID[gameid] ~= nil) then	--�ı�ָ���Ļ����
		local gamemode = GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_MODE])
		if (gameid == 1) then	--�ν��������
			local level = mod(gamemode, 10)
			if (level == 1 and newpoint > 80) then	--����80��
				newpoint = 80
			elseif (level == 2 and newpoint > 90) then	--�м�90��
				newpoint = 90
			end
		elseif (gameid == 2) then	--ɱ�ֻ�������
			if (gamemode ~= 1 and newpoint > 90) then	--����90��
				newpoint = 90
			end
		end
	
		--if (newpoint == GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTCUR])) then	--�����ޱ仯��ֱ�ӷ���
			--return
		--end
		SetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTCUR], newpoint)
		local pointmax = GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTMAX])
		if (newpoint >= pointmax) then	--����������߷ּ�¼���ı���߷�
			pointmax = newpoint
		end
		local str = "Tr��c m�t b�n"..storm_gamename(gameid).."t�ch l�y Phong Ba ��i l�:"..storm_point2str(newpoint)
		if (TB_STORM_TRYTIMES[gameid] > 1) then	--�û���Խ��ж��
			str = str..", th�nh t�ch t�t nh�t trong ho�t ��ng h�m nay c�a b�n l�:"..storm_point2str(pointmax)
		end
		debug_out(str)
		--if (pointmax == GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTMAX])) then	--��߷�û�иı䣬ֱ�ӷ���
			--return
		--end
		nt_settask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTMAX], pointmax)
	end

	local todaypoint = 0
	--�������л�ܻ���
	for i = 1, STORM_GAMEID_MAX do
		if (TB_STORM_TASKID[i] ~= nil) then
			local point = GetTask(TB_STORM_TASKID[i][STORM_TASKIDX_POINTMAX])
			if (point > 0) then
				todaypoint = todaypoint + point
			end
		end
	end

	--��¼���ա����ܡ����»���
	local addpoint = todaypoint - GetTask(STORM_TASKID_DAY_POINT)	--���ջ�������
	if (addpoint ~= 0) then
		if (gameid ~= 1 or (floor(todaypoint/5) > floor((todaypoint-addpoint)/5))) then	--�ν�Ҫ�ܷ����ӳ���5�֣���֪�������
			Msg2Player("T�ch l�y Phong Ba tr��c m�t c�a b�n l�:"..storm_point2str(todaypoint))
		end
		
		nt_settask(STORM_TASKID_DAY_POINT, todaypoint)
		local weekpoint = GetTask(STORM_TASKID_WEEK_POINT) + addpoint
		nt_settask(STORM_TASKID_WEEK_POINT, weekpoint)
		local monthpoint = GetTask(STORM_TASKID_MONTH_POINT) + addpoint
		nt_settask(STORM_TASKID_MONTH_POINT, monthpoint)
		
		local playername = GetName()
		local weekid = GetTask(STORM_TASKID_WEEK) - STORM_LADDER_WEEK
		if(weekid >= 0 and weekid <= 3) then 	--��ʱֻ��4������
			Ladder_NewLadder(STORM_LADDERID_WEEK1 + weekid, playername, weekpoint, 1);
		end
		Ladder_NewLadder(STORM_LADDERID_MONTH, playername, monthpoint, 1);
		
		debug_out("T�ch l�y h�m nay:"..storm_point2str(todaypoint).."; tu�n n�y:"..storm_point2str(weekpoint).."; th�ng n�y:"..storm_point2str(monthpoint))	--temp
	end
end

--����ֺ���
function storm_calc_point(tb_point, pointorg)
	local newpoint = 0
	for i = 1, getn(tb_point) do
		if (pointorg >= tb_point[i][2]) then
			if (i <= 1) then
				newpoint = tb_point[i][1]
			else
				newpoint = tb_point[i][1] + floor((pointorg - tb_point[i][2])*(tb_point[i-1][1] - tb_point[i][1])/(tb_point[i-1][2] - tb_point[i][2]))
			end
			break
		end
	end
	return newpoint
end

--���㲢��¼ĳһ��ĵ�ǰ���֣��ۼӣ�
--gameid��	1~10	���ID
--addpoint������ӷ�
--����ֵ��	1�Ʒֳɹ�	0�Ʒ�ʧ��
function storm_addpoint(gameid, addpoint)
	--��鵱ǰ��Ƿ���Ч����addpoint����0
	if (not storm_valid_game(gameid) or addpoint <= 0) then
		return nil
	end
	
	--���ݲ�ͬ��gameid��ѡ��ͬ�Ļ��ֱ����������
	local newpoint = 0
	local pointorg = GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_EXTRA]) + addpoint	--�ԭʼ��
	local gamemode = GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_MODE])
	if (gameid == 1) then
		local sjmode = floor(gamemode/10)
		local sjlevel = mod(gamemode,10)
		local tb_sjmode = {"�o�t c� c� ��nh", "�o�t c� ng�u nhi�n", "D�ng th�c nguy�n so�i", "D�ng th�c C�u s�t"}
		local tb_sjlevel = {" (S�) ", " (Trung) ", " (Cao) "}
		debug_out("�i�m t�ch l�y ban ��u [<color=blue>Chi�n tr��ng T�ng Kim-"..tb_sjmode[sjmode]..tb_sjlevel[sjlevel].."<color>] c�a b�n l�:"..storm_point2str(pointorg))	--temp
		newpoint = storm_calc_point(TB_STORM_POINT[1][sjmode], pointorg)
	elseif (gameid == 2) then
		local pointorg = pointorg - addpoint
		debug_out("l�n n�y"..storm_gamename(gameid).."c�n d� th�i gian l�:"..storm_point2str(addpoint)..", k� l�c c�:"..pointorg)
		if (addpoint > pointorg) then	--�˴�ʣ��ʱ�����
			pointorg = addpoint
		end
		newpoint = storm_calc_point(TB_STORM_POINT[gameid], addpoint)
	else
		debug_out("c�a b�n"..storm_gamename(gameid).."�i�m t�ch l�y ban ��u:"..storm_point2str(pointorg))	--temp
		newpoint = storm_calc_point(TB_STORM_POINT[gameid], pointorg)
	end
	
	SetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_EXTRA],pointorg)	--����ԭʼ��
	newpoint = newpoint + GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTEX])	--���Ͻ�������
	storm_calc_today(gameid, newpoint)	--�Ʒ�
	return 1
end

--���㲢��¼ĳһ��ĵ�ǰ���֣����£�ȡ��ʷ���ֵ��
--gameid��	1~10	���ID
--addpoint������ӷ�
--����ֵ��	1�Ʒֳɹ�	0�Ʒ�ʧ��
function storm_newpoint(gameid, newpoint)
	--���ݲ�ͬ��gameid��ѡ��ͬ�Ļ��ֱ����������
	local newpoint = 0
	local oldpoint = GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_EXTRA])	--�ԭʼ��
	local gamemode = GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_MODE])
	debug_out("l�n n�y"..storm_gamename(gameid).."�i�m s�:"..storm_point2str(addpoint)..", �i�m ban ��u:"..pointorg)
	if (newpoint < oldpoint) then	--�˴ε÷ָ���
		newpoint = oldpoint
	else
		SetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_EXTRA], newpoint)	--����ԭʼ��
	end
	
	local stormpoint = storm_calc_point(TB_STORM_POINT[gameid], newpoint)	--�����
	stormpoint = stormpoint + GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTEX])	--���Ͻ�������
	storm_calc_today(gameid, stormpoint)	--�Ʒ�
	
	return 1
end

--���ӽ�������
--gameid��	1~10	���ID
--addpoint�����ӵĻ���
function storm_add_pointex(gameid, addpoint)
	--��鵱ǰ��Ƿ���Ч
	if (not storm_valid_game(gameid)) then
		return nil
	end
	
	local pointex = GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTEX]) + addpoint
	
	if (pointex > 40) then	--���40������
		addpoint = addpoint - (pointex - 40)
		pointex = 40
	end
	
	if (addpoint <= 0) then	--�������ģ�ֱ�ӷ���
		return nil
	end
	
	Msg2Player("B�n ��t ���c"..storm_gamename(gameid).."Ph�n th��ng tham gia - t�ch l�y Phong Ba"..storm_point2str(addpoint).."ph�t")

	SetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTEX], GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTEX]) + addpoint)	--��¼���ӷ�

	storm_calc_today(gameid, GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTCUR]) + addpoint)	--��¼�û���֡�����������ֵܷ�

	return 1
end

--���ʵ���ʱ��ΪMission�����г�Ա���ӽ�������
--gameid��	1~10	���ID
--msid��	Mission ID
--time��	��time��10��20��30ʱ��Ч
function storm_addm_mspointex(gameid, msid, time)
	if (gameid == nil or TB_STORM_TASKID[gameid] == nil) then
		print("error gameid!")
		return nil
	end
	
	local addpoint = 0
	if (time == 10) then
		addpoint = 10
	elseif (time == 20) then
		addpoint = 10
	elseif (time == 30) then
		addpoint = 20
	else
		return nil
	end
	
	local orgindex = PlayerIndex
	local idx = 0;
	for i = 1, 500 do 
		idx, PlayerIndex = GetNextPlayer(msid, idx, 0);
		if PlayerIndex> 0 then
			storm_add_pointex(1, addpoint)
		end
		if (idx == 0) then 
			break
		end;
	end
	PlayerIndex = orgindex
	
	return 1
end

function storm_clear(gameid)
	if (gameid == nil) then
		Msg2Player("X�a h�t c�c tin t�c t�ch l�y c�a nh�n v�t n�y!")
		--���������
		SetTask(1550,0);	--ɱ�ֽ��д���
		SetTask(1036,0);	--Ұ��ȡ������
		for i = 1661, 16710 do
			SetTask(i,0);
		end
	else
		if (TB_STORM_TASKID[gameid] == nil) then
			Msg2Player("error gameid!")
			return nil
		end
		Msg2Player("X�a h�t nh�n v�t"..storm_gamename(gameid).."tin t�c t�ch l�y!")
		if (GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_TRYCOUNT]) > 0) then	--���������������
			SetTask(STORM_TASKID_GAMES, GetTask(STORM_TASKID_GAMES) - 1)
		end
		--������
		local gamepoint = GetTask(TB_STORM_TASKID[gameid][STORM_TASKIDX_POINTMAX])
		SetTask(STORM_TASKID_DAY_POINT, GetTask(STORM_TASKID_DAY_POINT) - gamepoint)
		SetTask(STORM_TASKID_WEEK_POINT, GetTask(STORM_TASKID_WEEK_POINT) - gamepoint)
		SetTask(STORM_TASKID_MONTH_POINT, GetTask(STORM_TASKID_MONTH_POINT) - gamepoint)
		--���������
		if (gameid == 2) then
			SetTask(1550,0);	--ɱ�ֽ��д���
		elseif (gameid == 4) then
			SetTask(1036,0);	--Ұ��ȡ������
		end
		for i = 1, getn(TB_STORM_TASKID[gameid]) do
			SetTask(TB_STORM_TASKID[gameid][i],0);
		end
	end
	--������
	local weekid = GetTask(STORM_TASKID_WEEK) - STORM_LADDER_WEEK
	if (weekid >= 0 and weekid <= 3) then
		Ladder_NewLadder(10182+weekid, GetName(), GetTask(STORM_TASKID_WEEK_POINT), 0)
	end
	Ladder_NewLadder(10186, GetName(), GetTask(STORM_TASKID_MONTH_POINT), 0)

	--ͬ��TaskValue
	SyncTaskValue(STORM_TASKID_DAY_POINT)
	SyncTaskValue(STORM_TASKID_DAY_LASTPOINT)
	SyncTaskValue(STORM_TASKID_WEEK_POINT)
	SyncTaskValue(STORM_TASKID_WEEK_LASTPOINT)
	SyncTaskValue(STORM_TASKID_MONTH_POINT)
	SyncTaskValue(STORM_TASKID_MONTH_LASTPOINT)
	SyncTaskValue(STORM_TASKID_DATE)
	for i = 1, STORM_GAMEID_MAX do
		if (TB_STORM_TASKID[i]) then
			SyncTaskValue(TB_STORM_TASKID[i][STORM_TASKIDX_START])
			SyncTaskValue(TB_STORM_TASKID[i][STORM_TASKIDX_TRYCOUNT])
			SyncTaskValue(TB_STORM_TASKID[i][STORM_TASKIDX_POINTMAX])
		end
	end
end

--��ʼ�����ĺ����������ݶ�һ���պ���
function storm_goon_start(gameid)
end