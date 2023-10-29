----------------------------------------------------------------
--FileName:	head.lua
--Creater:	firefox
--Date:		2005-08-28
--Comment:	��ĩ�������ս��֮�������
--			���ܣ��ͷ�ļ��Զ��庯��
-----------------------------------------------------------------
Include("\\script\\missions\\newcitydefence\\headinfo.lua")
Include([[\script\tong\tong_award_head.lua]]);--�����Ŀ�깱�׶�by־ɽ
--Include("\\script\\lib\\tireddegree.lua")
Include("\\script\\task\\task_addplayerexp.lua")
Include("\\script\\lib\\file.lua")

function cloudopen_defence()
	local weekdate = tonumber(date("%w"))
	if (weekdate ~= FIRE_OPENDAY_SATURDAY and weekdate ~= FIRE_OPENDAY_SUNDAY) then
		return nil
	end
	return 1
end

------------------------------------------------------------------------------------------
function GetIniFileData(mapfile, sect, key)
	if (IniFile_Load(mapfile, mapfile) == 0) then 
		print("Load IniFile Error!"..mapfile)
		return ""
	else
		return IniFile_GetData(mapfile, sect, key)	
	end
end
------------------------------------------------------------------------------------------------
-----���봫���ɷ����룬����62s = 1m2s
function GetMinAndSec(nSec)
nRestMin = floor(nSec / 60);
nRestSec = mod(nSec,60)
return nRestMin, nRestSec;
end;
-----------------------------------------------------------------------------------------------

--"123,234" -> 123 , 234,��һ���ַ���д�ɵ���������ת�����������ֱ���
function bt_str2xydata(str)
	m = strfind(str,",")
	x = tonumber(strsub(str,0,m-1))
	y = tonumber(strsub(str,m+1))
	return x,y
end
------------------------------------------------------------------------------------------------

--�������ļ���������һ������
function bt_getadata(file)
	local totalcount = GetTabFileHeight(file);
	id = random(totalcount);
	x = GetTabFileData(file, id + 1, 1);
	y = GetTabFileData(file, id + 1, 2);
	return x,y
end

--����trapfile���ļ������꼯�ϱ��������е�trap�㣬������scriptfile�Ľű�		
function bt_addtrap(trapfile, scriptfile)
	local count = GetTabFileHeight(trapfile);
--	scriptid = FileName2Id(scriptfile);
--print(scriptfile)	
	ID = SubWorldIdx2ID(SubWorld);
	
	for i = 1, count do
		x = GetTabFileData(trapfile, i + 1, 1);
		y = GetTabFileData(trapfile, i + 1, 2);
		AddMapTrap(ID, x,y, scriptfile);
	end;
end;

--����npcfile���ļ������꼯�ϱ��������е�npcģ���Ϊtnpcid�ĶԻ�npc��������scriptfile�Ľű�		
function bt_adddiagnpc(npcfile, scriptfile, tnpcid, name)
	addcount = 0;
	local count = GetTabFileHeight(npcfile);
	
	for i = 1, count do
		x = GetTabFileData(npcfile, i + 1, 1);
		y = GetTabFileData(npcfile, i + 1, 2);
		if (name ~= nil or name ~= "") then
			npcidx = AddNpc(tnpcid, 1, SubWorld, x, y, 1, name)			
		else
			npcidx = AddNpc(tnpcid, 1, SubWorld, x, y);
		end

		if (npcidx > 0) then
			SetNpcScript(npcidx, scriptfile)
			addcount = addcount + 1
		else
			print("error!can not add dialog npc !tnpcid:"..tnpcid.." ["..SubWorldIdx2ID(SubWorld)..","..x..","..y);
		end
	end;
	return addcount
end;	
function bt_add_a_diagnpc(scriptfile, tnpcid, x, y, name)
		if (name ~= nil or name ~= "") then
			npcidx = AddNpc(tnpcid, 1, SubWorld, x, y, 1 , name);
		else
			npcidx = AddNpc(tnpcid, 1, SubWorld, x, y )
		end
		
		if (npcidx > 0) then
			SetNpcScript(npcidx, scriptfile)
		else
			print("error!can not add dialog npc !tnpcid:"..tnpcid.." ["..SubWorldIdx2ID(SubWorld)..","..x..","..y);
		end
		return npcidx
end


function cd_addfightnpc(npcfile, ss, ee, npcid, level, npcname, boss, npccamp, npcscript, boss4)
	local posx = 0
	local posy = 0
	local npcindex = 0
	local s_npcid = npcid
	for i = ss, ee do
		posx = GetTabFileData( npcfile, i + 1, 1 );
		posy = GetTabFileData( npcfile, i + 1, 2 );
		if (boss4 ~= nil) then
			s_npcid = npcid + random(0,1)
		end
		npcindex = AddNpc( s_npcid, level, SubWorld, posx, posy, 1, npcname, boss )
		if( npcindex > 0 ) then
			--SetNpcCurCamp( npcindex, npccamp )
			SetNpcDeathScript( npcindex, npcscript )
		end
	end
end


function cd_buildfightnpc_old()
	--��õ�ͼ���Ӧ���趨�ļ���
	local mapfile = GetMapInfoFile(mapid)
	local citysection = "MapInfo"
	local npcfile = GetMissionS( MS_S_CMNPCFILE )
	local filehigh = GetTabFileHeight( npcfile )
--print(filehigh.."==filehigh")
	if ( filehigh <= 0 or filehigh == nil ) then
--		print("commonfile error ")
		return
	end
	
		--�ڷź�����
	local weibingfile = GetIniFileData(mapfile, citysection, "weibing");
	
	--�ڷź��سǽ���
	local jiangjunxy;
	for i = 1, 3 do
		jiangjunxy = GetIniFileData(mapfile, citysection, "jiangjun"..i);
		x, y = bt_str2xydata(jiangjunxy);
		
	end;
	
	local citycamp = GetMissionV( MS_CITYCAMP )
--print(citycamp.."==citycamp")
	local npccamp = 1
	local npcname = "Qu�n T�ng"
	if ( citycamp == 1 ) then
		npccamp = 2
		npcname = "Qu�n Kim"
	end
	local npccount_1 = floor( filehigh * 0.82 )		--1886
	local npccount_2 = floor( filehigh * 0.12 )		--276
	local npccount_3 = floor( filehigh * 0.06 )		--138
	
	cd_addfightnpc(npcfile, 1, npccount_1, tbTNPC_SOLDIER[npccamp][1], tbSOLDIER_LEVEL[1], npcname..tbSOLDIER_NAME[1], 0, npccamp, tbFILE_NPCDEATH[1])
	
	cd_addfightnpc(npcfile, npccount_1 + 1, npccount_1 + npccount_2, tbTNPC_SOLDIER[npccamp][2], tbSOLDIER_LEVEL[2], npcname..tbSOLDIER_NAME[2], 2, npccamp, tbFILE_NPCDEATH[2])

	cd_addfightnpc(npcfile, npccount_1 + npccount_2 + 1, npccount_1 + npccount_2 + npccount_3, tbTNPC_SOLDIER[npccamp][3], tbSOLDIER_LEVEL[3], npcname..tbSOLDIER_NAME[3], 1, npccamp, tbFILE_NPCDEATH[3])
	
end

function GameOver()
	local oldPlayerIndex = PlayerIndex
	local citycamp = GetMissionV(MS_CITYCAMP)
	local campname = ""
	if ( citycamp == 1 ) then
		campname = "Qu�n T�ng"
	else
		campname = "Qu�n Kim"
	end
	local isWin = 0;--��¼�Ƿ�ʤ������by־ɽ
	if ( GetMissionV(MS_CITYDEFENCE) == 1 ) then
		isWin = 1;--by־ɽ
		--ʤ��
		cd_awardall(campname)
		AddGlobalNews("tr�i qua chi�n ��u quy�t li�t, "..campname.."b�o v� th�nh c�ng th�nh tr�!")
		Msg2MSAll( MISSIONID, "tr�i qua chi�n ��u quy�t li�t, "..campname.."b�o v� th�nh c�ng th�nh tr�!" )
		cd_writelog(date("%m-%d,%H:%M;")..campname.."Th� th�nh th�nh c�ng, s� ng��i=="..GetMSPlayerCount(MISSIONID, 0))
	else
		--ʧ��
		AddGlobalNews("Tr�i qua cu�c chi�n k�ch li�t, d� �� c� g�ng nh�ng cu�i c�ng b�n b�n b�n ch�ng kh�ng l�i ��ch, th� th�nh th�t b�i��")
		Msg2MSAll( MISSIONID, "Tr�i qua cu�c chi�n k�ch li�t, d� �� c� g�ng nh�ng cu�i c�ng b�n b�n b�n ch�ng kh�ng l�i ��ch, th� th�nh th�t b�i��" )
		cd_writelog(date("%m-%d,%H:%M;")..campname.."Th� th�nh th�t b�i, s� ng��i=="..GetMSPlayerCount(MISSIONID, 0).."; s� l��ng npc c�n l�i, "..tbSOLDIER_NAME[1]..":"..GetMissionV(MS_MAXCOUNTNPC_1)..";"..tbSOLDIER_NAME[2]..":"..GetMissionV(MS_MAXCOUNTNPC_1+1)..";"..tbSOLDIER_NAME[3]..":"..GetMissionV(MS_MAXCOUNTNPC_1+2)..";"..tbSOLDIER_NAME[4]..":"..GetMissionV(MS_MAXCOUNTNPC_1+3)..";"..tbSOLDIER_NAME[5]..":"..GetMissionV(MS_MAXCOUNTNPC_1+4)..";")
	end
	--cd_WinLadder(isWin) --����
	local tbPlayer = {};
	local idx = 0;
	local pidx = 0;
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
		if( pidx > 0 ) then
			tbPlayer[ getn(tbPlayer) + 1 ] = pidx
		end
		if (idx <= 0) then 
	 		break
	 	end;
	end 	
 	
 	for i= 1, getn(tbPlayer) do 
	 	PlayerIndex = tbPlayer[i];
	 	--citycamp = GetMissionV(MS_CITYCAMP);
 		tongaward_citywar(isWin);--�����Ŀ��by־ɽ
		camp = GetCamp();
		SetCurCamp(camp);
		DisableTeamChangeCamp(0)
		SetTaskTemp(200,0);
		SetLogoutRV(0);
		SetDeathScript("");
		SetFightState(0)		-- �����̺��Ϊ��ս��״̬��by Dan_Deng��
		SetPunish(1)
		ForbidChangePK(0);
		SetPKFlag(0)
		SetRevPos(tbDEFENCE_SIGNMAP[citycamp], random(3))
		NewWorld(bt_getsignpos(citycamp))
	end;
	PlayerIndex = OldPlayerIndex
end

function cd_join(camp)
	LeaveTeam();
	local mapid, posx, posy = cd_getjoinpos(camp);
	NewWorld( mapid, posx, posy );
	AddMSPlayer(MISSIONID,camp);
	EnterChannel(PlayerIndex, GetMissionS(MS_S_CD_NAME))
	SetRevPos(tbDEFENCE_SIGNMAP[camp], 1)
	SetCurCamp(camp);
	DisableTeamChangeCamp(1)
	SetTaskTemp(200,1);
	SetLogoutRV(1);
	SetPunish(0);
	SetFightState(0);
	SetPKFlag(0);
	ForbidChangePK(1);
	SetTempRevPos(mapid, posx * 32, posy * 32);
	SetDeathScript( FILE_PLAYERDEATH );
	if (GetMissionV(MS_STATE) == 2) then
		Msg2Player("B�n �� gia nh�p <color=white>"..GetMissionS(MS_S_CD_NAME).."<color> phe. T��ng l�nh th� th�nh hi�n l� "..GetMissionV(MS_SHOUCHENGWEIBING).."ng��i, vi�n binh t�ng c�ng"..GetMSPlayerCount(MISSIONID, 0).."ng��i.")
	else
		Msg2Player("B�n �� gia nh�p"..GetMissionS(MS_S_CD_NAME).."phe.")
	end
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\huoyuedu\\huoyuedu.lua", "tbHuoYueDu:AddHuoYueDu", "fenghuoliancheng")
end

function cd_awardall(szCampName)		--�سǳɹ�����
	local tbPlayer = {};
	local idx = 0;
	local pidx = 0;
	
	for i = 1 , 600 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
		if( pidx > 0 ) then
			tbPlayer[ getn(tbPlayer) + 1 ] = pidx
		end
		if (idx <= 0) then 
	 		break
	 	end;
	end 	
 	
 	oldPlayerIndex = PlayerIndex;
 	local szMsg = szCampName.."Gi�nh ���c th�ng l�i cu�i c�ng, nh�n ���c %d �i�m kinh nghi�m."
 	for i= 1, getn(tbPlayer) do 
 		PlayerIndex = tbPlayer[i];
 		local nsumExp = cd_calc_sumexp();
 		local nAwardExp = 0;
 		
 		if (nsumExp >= 1000000) then
			nAwardExp = 10000000;
		elseif (nsumExp >= 500000) then
			nAwardExp = floor(nsumExp / 100000) * 1000000;
		end;
		
		if (nAwardExp >= 0 and nAwardExp <= 10000000) then
			nAwardExp = nAwardExp * 2;	-- 2009-08-04 ���������齱��*2
			AddOwnExp(nAwardExp);
			Msg2Player(format(szMsg, nAwardExp));
		end;
		--nExp = addTiredOwnExp(nExp*10000)
	end
	PlayerIndex = oldPlayerIndex
end

function bt_getsignpos(camp)
	if ( camp ~= 1 and camp ~= 2 ) then
		camp = 1;
	end;
	local a = random(getn(tbSIGNMAP_POS))
	
	return tbDEFENCE_SIGNMAP[camp], tbSIGNMAP_POS[a][1], tbSIGNMAP_POS[a][2]
end

function cd_getjoinpos(camp)
	local mapid = tbDEFENCE_MAPID[camp]
	local a = random( getn(tbREVIVAL_POS) )
	return mapid, tbREVIVAL_POS[a][1], tbREVIVAL_POS[a][2]
end


function OnCancel()
end

function cd_writelog(str)
	local szFileName = "Logs/citydefence_log_"..date("%m%d")..".log"
	local fu = openfile(szFileName, "a")
	write(fu, str.."\r\n")
	flush(fu)
	closefile(fu)
end

function cd_buildtrapsonroad()	--���������ƽ�����������е�trap
	local i;
	local trapfile;
	local scriptfile;
	--���ϵ�һ����·�ϵ�����trap
	for i = 1, 15 do
		trapfile = [[\settings\maps\newcitydefence\trapline]]..(999 + i)..".txt";
		scriptfile = [[\script\missions\newcitydefence\trap\trapline]]..(999 + i)..".lua";
		bt_addtrap(trapfile, scriptfile);
	end;

	--���ϵڶ�����·�ϵ�����trap
	for i = 1, 13 do
		trapfile = [[\settings\maps\newcitydefence\trapline]]..(1999 + i)..".txt";
		scriptfile = [[\script\missions\newcitydefence\trap\trapline]]..(1999 + i)..".lua";
		bt_addtrap(trapfile, scriptfile);
	end;
	
	--���ϵ�������·�ϵ�����trap
	for i = 1, 14 do
		trapfile = [[\settings\maps\newcitydefence\trapline]]..(2999 + i)..".txt";
		scriptfile = [[\script\missions\newcitydefence\trap\trapline]]..(2999 + i)..".lua";
		bt_addtrap(trapfile, scriptfile);
	end;
end;

function cd_awardItem_cc()
		local itemid = 0
		local sum = 0
		ran = ( random(1000) - 1 ) * 10000 + random(10000)
		for j = 1, getn(TB_CD_AWARDITEM) do
			sum = TB_CD_AWARDITEM[j][2] * CD_BASE_VALUE + sum
			if (sum >= ran) then
				itemid = j
				break
			end
		end
		itemlist = TB_CD_AWARDITEM[ itemid ][ 3 ]
		if ( getn( itemlist ) == 1) then
			AddEventItem( itenlist[1] )
		elseif ( getn( itemlist ) == 7 ) then
			AddItem( itemlist[1], itemlist[2], itemlist[3], itemlist[4], itemlist[5], itemlist[6], itemlist[7] )
		elseif ( getn( itemlist ) == 2 ) then
			AddGoldItem( itemlist[1], itemlist[2] )
		else
			print("itemparam error!!!! itemid = "..itemid)
		end
		Msg2Player("B�n nh�n ���c<color=yellow>"..TB_CD_AWARDITEM[itemid][1])
end

-- ����ϴη��ʱ������ۼƾ���
function cd_clear_lastsumexp()
	if (GetTask(TSKID_FIRE_SUMEXP) ~= 0) then
		SetTask(TSKID_FIRE_SUMEXP, 0);
	end;
end;

-- ����ʱ��¼�ȼ�����
function cd_setsign_levelexp()
	SetTask(TSKID_FIRE_SIGNLVL, GetLevel());
	SetTask(TSKID_FIRE_SIGNEXP, GetExp());
end;

--���뿪missionʱ�����ۼƻ�þ���
function cd_calc_sumexp()
	local nOldLevel = GetTask(TSKID_FIRE_SIGNLVL);
	local nOldExp = GetTask(TSKID_FIRE_SIGNEXP);
	local n_transcount = ST_GetTransLifeCount();
	local nCurSum = tl_countuplevelexp(nOldLevel,nOldExp, n_transcount);
	local nLastSum = GetTask(TSKID_FIRE_SUMEXP);
	
	SetTask(TSKID_FIRE_SUMEXP, nLastSum + nCurSum);
	return nLastSum + nCurSum;
end;

