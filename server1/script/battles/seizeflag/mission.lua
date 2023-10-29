IncludeLib("BATTLE");
IncludeLib("TITLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizeflag\\head.lua")
Include("\\script\\task\\newtask\\branch\\branch_bwsj.lua")
--����ģʽ��PL_PARAM1 ��PL_PARAM2���ڵ������������ʱ��Ŀ��������


function InitMission()
	for i = 1, 100 do 
	SetMissionV(i , 0);
	end;
	SetMissionS(1, "")
	SetMissionS(2, "")
	level = BT_GetGameData(GAME_LEVEL);
	
	if (level <= 0) then
		print("Error!!!can not start battle because battlelevel <= 0")
		return
	end

	flagmode = sj_selectmode()
	SetMissionV(MS_FLAGMODE , flagmode)

	SetMissionV(MS_FLAGCOUNT, 40)
	bt_setnormaltask2type()
	BT_SetView(PL_TOTALPOINT);--��ʾ��ͳ���ܻ���
	BT_SetView(PL_KILLPLAYER);--ɱ�����Ŀ
	BT_SetView(PL_KILLNPC);--ɱNpc��Ŀ
	BT_SetView(PL_BEKILLED);--����ұ�ɱ����
	BT_SetView(PL_SNAPFLAG);--������Ŀ
	BT_SetView(PL_GETITEM);
	BT_SetView(PL_MAXSERIESKILL);--��ն����
	
	BT_SetGameData(GAME_CAMP1, 0) --���õ�ǰ�η�����
	BT_SetGameData(GAME_CAMP2, 0) --���õ�ǰ������

	subworldid = SubWorldIdx2ID(SubWorld)	
	ClearMapNpc(subworldid);	
	ClearMapTrap(subworldid); 
	ClearMapObj(subworldid);
	
	--���û�֮�»��������
	SetMissionV(MS_HUANGZHIZHANG, greatnight_huang_event(1))
	
	--��õ�ͼ���Ӧ���趨�ļ���
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	

	--�õ��õ�ͼ�м�������
	areacount = tonumber(GetIniFileData(mapfile, "MapInfo", "Area_Count"))
	if (areacount <= 1) then
		print("battle"..BT_GetGameData(GAME_RULEID).." error! areacount <= 1");
		return
	end
	
	--��������������г�ȡ��������Ϊ˫����������
	s_area, j_area = bt_autoselectmaparea(mapfile,areacount)
	
	BT_SetGameData(GAME_CAMP1AREA, s_area);
	BT_SetGameData(GAME_CAMP2AREA, j_area);

	area_section1 = "Area_"..s_area;
	area_section2 = "Area_"..j_area;
-------------------------------------------------------------------------
--��ȡ��������Ĵ�Ӫ�ڵ�����
	--�Ӵ�Ӫ����Ӫʱ�������
    file = GetIniFileData(mapfile, area_section1 , "centertohomepos")
    x,y =bt_getadata(file)
	SetMissionV(MS_HOMEIN_X1, floor(x/32))
	SetMissionV(MS_HOMEIN_Y1, floor(y/32))

	file = GetIniFileData(mapfile, area_section2 , "centertohomepos")
    x,y = bt_getadata(file)
	SetMissionV(MS_HOMEIN_X2, floor(x/32))
	SetMissionV(MS_HOMEIN_Y2, floor(y/32))
	
	--�Ӻ�Ӫ����Ӫ�������
	file = GetIniFileData(mapfile, area_section1 , "hometocenterpos")
	SetMissionS(1, file)
	x,y = bt_getadata(file)
	SetMissionV(MS_HOMEOUT_X1, floor(x/32))
	SetMissionV(MS_HOMEOUT_Y1, floor(y/32))

 	file = GetIniFileData(mapfile, area_section2 , "hometocenterpos")
	SetMissionS(2,file)
	x,y = bt_getadata(file)
	SetMissionV(MS_HOMEOUT_X2, floor(x/32))
	SetMissionV(MS_HOMEOUT_Y2, floor(y/32))
	
-------------------------------------------------------------------------
	
	--�ڷ�Trap��
	--�ڷ�˫����Ӫ��Trap��

	hometrapfile = GetIniFileData(mapfile, "Area_"..s_area, "hometrap")
	bt_addtrap(hometrapfile, FILE_HOMETRAP1)
	hometrapfile = GetIniFileData(mapfile, "Area_"..j_area, "hometrap");
	bt_addtrap(hometrapfile, FILE_HOMETRAP2)


	hometrapfile = GetIniFileData(mapfile, "Area_"..s_area, "centertohometrap")
	bt_addtrap(hometrapfile, FILE_CENTERTOHOMETRAP1)
	hometrapfile = GetIniFileData(mapfile, "Area_"..j_area, "centertohometrap");
	bt_addtrap(hometrapfile, FILE_CENTERTOHOMETRAP2)
	
	
	--�ڷ�˫����Ӫ��trap��

	centertrapfile = GetIniFileData(mapfile, "Area_"..s_area, "centertrap");
	bt_addtrap(centertrapfile, FILE_CENTERTRAP)
	centertrapfile = GetIniFileData(mapfile, "Area_"..j_area, "centertrap");
	bt_addtrap(centertrapfile, FILE_CENTERTRAP)
	

	--�ڷŶԻ�����Npc
	--��ҽ�İڷ�
	doctorxy = GetIniFileData(mapfile, "Area_"..s_area, "doctornpc");
	x,y = bt_str2xydata(doctorxy)
	bt_add_a_diagnpc(FILE_DOCTOR1, TNPC_DOCTOR1, x * 32 ,y * 32 , "Qu�n Nhu quan (T�ng) ");


	doctorxy = GetIniFileData(mapfile, "Area_"..j_area, "doctornpc");
	x,y = bt_str2xydata(doctorxy)
	bt_add_a_diagnpc(FILE_DOCTOR2, TNPC_DOCTOR2, x * 32, y * 32, "Qu�n Nhu quan (Kim) ");
	
	
	--˧��İڷ�
	symbolnpcfile = GetIniFileData(mapfile, "Area_"..s_area, "symbolnpc");
	bt_adddiagnpc(symbolnpcfile, FILE_SYMBOLNPC, TNPC_SYMBOL1, " ");
	symbolnpcfile = GetIniFileData(mapfile, "Area_"..j_area, "symbolnpc");
	bt_adddiagnpc(symbolnpcfile, FILE_SYMBOLNPC, TNPC_SYMBOL2, " ");
	
	
	--������İڷ�
	depositxy = GetIniFileData(mapfile, "Area_"..s_area, "depositobj");
	x,y = bt_str2xydata(depositxy)
	bt_add_a_diagnpc( FILE_DEPOSIT, TNPC_DEPOSIT, x * 32,y * 32);
	

	
	depositxy = GetIniFileData(mapfile, "Area_"..j_area, "depositobj");
	x,y = bt_str2xydata(depositxy)
	bt_add_a_diagnpc( FILE_DEPOSIT, TNPC_DEPOSIT, x * 32, y * 32);
	
	
	StartMissionTimer(MISSIONID, 22, TIMER_2);
	--���ģʽ��Ҫ��ÿX���Ӵ���һ�εĴ��������Բ�������
	StartMissionTimer(MISSIONID,21, TIMER_1);
	
	SetMissionV(MS_STATE,1);--��������
	if (level == 1) then
		lvlstr = "Khu v�c S� c�p "
	elseif (level == 2) then
		lvlstr = "Khu v�c Trung c�p "
	else
		lvlstr = "Khu v�c Cao c�p "
	end
	
	RestMin, RestSec = GetMinAndSec(1800);
	local str1 = lvlstr.."Chi�n d�ch T�ng Kim (Ph��ng th�c �o�t c�) �ang trong giai �o�n b�o danh. C�c hi�p kh�c mu�n tham gia h�y nhanh ch�ng ��n T��ng D��ng ho�c Chu Ti�n tr�n �� b�o danh. (ho�c s� d�ng T�ng Kim Chi�u Th�) .Th�i gian b�o danh c�n l�i l�:"..RestMin.."ph�t"..RestSec.."gi�y. �i�u ki�n tham gia: ��ng c�p t� 40. ph� b�o danh 3000 l��ng";
	AddGlobalNews(str1);
	CreateChannel("Phe T�ng"..szGAME_GAMELEVEL[level].."�o�t c� ", 9)
	CreateChannel("Phe Kim"..szGAME_GAMELEVEL[level].."�o�t c� ", 10)
	if (GetMissionV(MS_FLAGMODE) == 1) then
		BT_SetMissionName("Ph��ng th�c �o�t c� c� ��nh")
		BT_SetMissionDesc("B�i c�nh: N�m 1160 C�ng nguy�n, Kim ch� Ho�n Nhan L��ng t�p h�p qu�n l�c, quy�t ��nh Nam h�, ti�u di�t T�ng tri�u. T��ng D��ng l� tr� ng�i ��u ti�n c�a qu�n Kim, T��ng D��ng chu�n b� ng�p ch�m trong kh�i l�a binh �ao. <enter><enter><color=yellow> �o�t c� c� ��nh: �o�t c� t�i ��i doanh qu�n ��ch v� c�m t�i ��i doanh phe m�nh. Phe th�ng l� phe �o�t ���c c� nhi�u nh�t. <enter> c�ch �o�t c�: nh�n v�o NPC �ang gi� c�. <enter> C�m c�: nh�n chu�t ph�i v�o C� hi�u")
		WriteLog(lvlstr.."T�ng Kim - ph��ng th�c �o�t c� c� ��nh - b�t ��u b�o danh. ID khu v�c l�:"..subworldid..".Th�i gian:"..date("%H:%M"))
	else
		BT_SetMissionName("Ph��ng th�c �o�t c� ng�u nhi�n")
		BT_SetMissionDesc("B�i c�nh: N�m 1160 C�ng nguy�n, Kim ch� Ho�n Nhan L��ng t�p h�p qu�n l�c, quy�t ��nh Nam h�, ti�u di�t T�ng tri�u. T��ng D��ng l� tr� ng�i ��u ti�n c�a qu�n Kim, T��ng D��ng chu�n b� ng�p ch�m trong kh�i l�a binh �ao. <enter><enter><color=yellow> �o�t c� ng�u nhi�n: di chuy�n 1 c� - xu�t hi�n b�t k� trong ��i doanh ho�c ngo�i chi�n tuy�n- v� ��ch, phe �o�t nhi�u nh�t s� gi�nh th�ng l�i. <enter> C�ch �o�t c�: nh�n v�o NPC �ang gi� c� <enter>C�ch c�m c�: nh�n chu�t ph�i v�o C� hi�u")
		WriteLog(lvlstr.."T�ng Kim - ph��ng th�c �o�t c� ng�u nhi�n - b�t ��u b�o danh. ID khu v�c l�:"..subworldid..".Th�i gian:"..date("%H:%M"))
	end

end;

function RunMission()
	SetMissionV(MS_STATE,2);
	
	--���η�����һ��Ŀ����ڽ𷽵Ľ���
	if (GetMissionV(MS_FLAGMODE) == 1) then
		sf_createflag(1, BT_GetGameData(GAME_CAMP1AREA), BT_GetGameData(GAME_CAMP2AREA))
		sf_createflag(2, BT_GetGameData(GAME_CAMP2AREA), BT_GetGameData(GAME_CAMP1AREA))
	end
	
	local subworldid = SubWorldIdx2ID(SubWorld);
	local level = BT_GetGameData(GAME_LEVEL);
	if (level == 1) then
		lvlstr = "Khu v�c S� c�p "
	elseif (level == 2) then
		lvlstr = "Khu v�c Trung c�p "
	else
		lvlstr = "Khu v�c Cao c�p "
	end
	if (GetMissionV(MS_FLAGMODE) == 1) then
		WriteLog(lvlstr.."T�ng Kim - Ph��ng th�c �o�t c� c� ��nh- �� khai chi�n. ID khu v�c l�:"..subworldid..".Th�i gian khai chi�n:"..date("%H:%M").."T� l� qu�n s� hi�n gi� l� "..GetMSPlayerCount(MISSIONID, 1)..":"..GetMSPlayerCount(MISSIONID, 2))
	else
		WriteLog(lvlstr.."T�ng Kim - Ph��ng th�c �o�t c� ng�u nhi�n- �� khai chi�n. ID khu v�c l�:"..subworldid..".Th�i gian khai chi�n:"..date("%H:%M").."T� l� qu�n s� hi�n gi� l� "..GetMSPlayerCount(MISSIONID, 1)..":"..GetMSPlayerCount(MISSIONID, 2))
	end

	local idx = 0;
	local pidx = 0;
	local oldPlayerIndex = PlayerIndex
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
		--��ʱΪGM���������ʽ����ս��
		if (pidx > 0) then
			PlayerIndex = pidx;
			BT_SetData( PL_LASTDEATHTIME, GetGameTime() );
			PutMessage("��ch qu�n �� b�t ��u h�nh ��ng! C�c chi�n s�! X�ng l�n!");
		end;
		if (idx <= 0) then 
			break
		end;
	end;
	PlayerIndex = oldPlayerIndex
end;

function EndMission()
	StopMissionTimer(MISSIONID, 21);
	StopMissionTimer(MISSIONID ,22);
	
	GameOver();
	level = BT_GetGameData(GAME_LEVEL);
	DeleteChannel("Phe T�ng"..szGAME_GAMELEVEL[level].."�o�t c� ")
	DeleteChannel("Phe Kim"..szGAME_GAMELEVEL[level].."�o�t c� ")

	SetGlbValue(GLB_BATTLESTATE, 0) --���ø�ȫ�ֱ���Ϊ1����־��ǰ�������������ν�ս�۽׶Σ���ʱ������������ĳ��ڵ��Զ������ν�ս�۵ı����㣬����������ԭ�ν�ս����ͼ
	for i = 1, 100 do 
		SetMissionV(i , 0);
	end;
end;

function JoinMission(RoleIndex, Camp)
	PlayerIndex = RoleIndex;
	if (Camp ~= 1 and Camp ~= 2) then
		return
	end
	sf_join(Camp)
	ResetBonus()		--�������ϵ�������û���
end;

function OnLeave(RoleIndex)
	level = BT_GetGameData(GAME_LEVEL);
	PlayerIndex = RoleIndex;
	branchTask_JoinSJend1()
	-- SetLogoutRV(0);  ��ҵ���Ҳ���Mission��OnLeave����˲����ڴ˵���SetLogoutRV(0)�������ڰ����NewWorld��Mission��ͼ�ĵط����� Fanghao_Wu 2006-3-21
	ForbidChangePK(0);
	SetPKFlag(0)
	if (GetCurCamp() == 1) then
		LeaveChannel(PlayerIndex, "Phe T�ng"..szGAME_GAMELEVEL[level].."�o�t c� ")
	else
		LeaveChannel(PlayerIndex, "Phe Kim"..szGAME_GAMELEVEL[level].."�o�t c� ")
	end
	sf_onplayerleave()
	SyncTaskValue(700 + PL_BATTLEPOINT);--ͬ����ҵ��ܻ��ָ��ͻ��ˣ����ڻ��ֹ�����
	AddSkillState(656,30,0,0) --����ҵ��ٶ�
	AddSkillState(661,5,0,0) --�����ҵĳƺż�������
	Title_ActiveTitle(0);
	local nRecord = GetTask(PL_TOTALPOINT + 750);	--By Liao Zhishan
	local nBeiShu = greatnight_huang_event(1);
	if (nBeiShu > 0) then
		nRecord = floor(nRecord / nBeiShu);
	end;
	local nOffered = GetTask(2435);
	SetTask(2435, nRecord);
	if (nRecord > nOffered) then
		tongaward_battle(nRecord - nOffered);--
	end;

	if (GetMissionV(MS_TIMER1_TIME) < (TIMER_2 / TIMER_1)) then
		BT_UpdateMemberCount();
	end	
	ResetBonus()		--�������ϵ�������û���
end;

function sj_selectmode()
	mode_1 = tonumber(BT_GetBattleParam(13))
	mode_2 = tonumber(BT_GetBattleParam(14))
	
	if (mode_1 == nil) then
		mode_1 = 0;
	end;
	
	if (mode_2 == nil) then
		mode_2 = 0;
	end;
	
	local q = mode_1 + mode_2
	if (q == 0) then
		return random(1,2)
	end
	
	if (random(q) < mode_1) then
		return 1
	else
		return 2
	end
end