IncludeLib("BATTLE");
IncludeLib("TITLE");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\boss\\head.lua")
Include("\\script\\task\\newtask\\branch\\branch_bwsj.lua")

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

	bt_setnormaltask2type()
	BT_SetView(PL_TOTALPOINT);--��ʾ��ͳ���ܻ���
	BT_SetView(PL_KILLPLAYER);--ɱ�����Ŀ
	BT_SetView(PL_KILLNPC);--ɱNpc��Ŀ
	BT_SetView(PL_BEKILLED);--����ұ�ɱ����
--	BT_SetView(PL_SNAPFLAG);--������Ŀ
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
	bt_add_a_diagnpc(FILE_DOCTOR1, TNPC_DOCTOR1, x * 32 ,y * 32 , "Qu�n Nhu quan (T�ng)");


	doctorxy = GetIniFileData(mapfile, "Area_"..j_area, "doctornpc");
	x,y = bt_str2xydata(doctorxy)
	bt_add_a_diagnpc(FILE_DOCTOR2, TNPC_DOCTOR2, x * 32, y * 32, "Kim Qu�c Qu�n nhu quan");
	
	--����Ա�İڷ�
	transportxy = GetIniFileData(mapfile, "Area_"..s_area, "transportxy");
	x,y = bt_str2xydata(transportxy)
	bt_add_a_diagnpc(FILE_TRANSPORT1, TNPC_TRANSPORT1, x * 32 ,y * 32 , "Trinh s�t ti�n tuy�n T�ng qu�n");


	transportxy = GetIniFileData(mapfile, "Area_"..j_area, "transportxy");
	x,y = bt_str2xydata(transportxy)
	bt_add_a_diagnpc(FILE_TRANSPORT2, TNPC_TRANSPORT2, x * 32, y * 32, "Trinh s�t ti�n tuy�n Kim qu�n");
	
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
	
	
	StartMissionTimer(MISSIONID, 110, TIMER_2);
	--���ģʽ��Ҫ��ÿX���Ӵ���һ�εĴ��������Բ�������
	StartMissionTimer(MISSIONID, 109, TIMER_1);
	
	SetMissionV(MS_STATE, 1);--��������
	
	if (level == 1) then
		lvlstr = "Khu v�c S� c�p "
	elseif (level == 2) then
		lvlstr = "Khu v�c Trung c�p "
	else
		lvlstr = "Khu v�c Cao c�p "
	end
	
	RestMin, RestSec = GetMinAndSec(1800);
	local str1 = lvlstr.."T�nh h�nh chi�n d�ch T�ng Kim h�nh th�c ti�u di�t BOSS �ang r�t c�ng th�ng. Hi�n t�i �ang � giai �o�n b�o danh, xin m�i v� l�m nh�n s� hay nhanh ch�n ��n T��ng D��ng ho�c Chu Ti�n Tr�n �� ti�n v�o ho�c s� d�ng T�ng Kim chi�u th� �� ti�n v�o n�i b�o danh, th�i gian b�o danh c�n:"..RestMin.."ph�t"..RestSec.." gi�y. �i�u ki�n tham gia: C�p kh�ng �t h�n 40, ph� b�o danh 100000 l��ng";
	AddGlobalNews(str1);
	CreateChannel("Phe T�ng"..szGAME_GAMELEVEL[level].."Tranh �o�t BOSS", 9)
	CreateChannel("Phe Kim"..szGAME_GAMELEVEL[level].."Tranh �o�t BOSS", 10)

	BT_SetMissionName("H�nh th�c BOSS")
	BT_SetMissionDesc("B�i c�nh: C�ng nguy�n n�m 1160, Kim ch� Ho�n Nhan L��ng quy�t ��nh th�c hi�n m�u �� ti�u di�t t�n g�c ��i T�ng sau bao n�m ra s�c chi�u binh m�i m�. ��i qu�n Kim qu�c d�n d�p t�n c�ng v� ph�a nam m�c ��ch ch�nh l� x�a s� tr�ng �i�m T��ng D��ng. Nh� T�ng �� b�y ra m�t tr�n ��a ph�ng th� h�t s�c nghi�m ng�t � T��ng D��ng.<enter><enter><color=yellow>H�nh th�c BOSS: l�c chi�n c�c ti�n h�nh hai b�n s� xu�t hi�n c�c t��ng qu�n l�n nh�, gi�t t��ng qu�n phe ��ch v� b�o ��m s� th�ng l�i cho b�n m�nh, n�u nh� Boss ��i c�a m�i b�n ��u ch�t th� s� t�nh theo b�n n�o gi�t s� boss nh� ���c th�ng.<enter>M�c ��ch: B�o v� t��ng qu�n b�n m�nh v� gi�t t��ng qu�n phe ��ch.")

end

function RunMission()
	SetMissionV(MS_STATE,2);
	
	local idx = 0;
	local pidx = 0;
	local oldPlayerIndex = PlayerIndex
	for i = 1 , 500 do 
		idx, pidx = GetNextPlayer(MISSIONID,idx, 0);
		--��ʱΪGM���������ʽ����ս��
 		if (pidx > 0) then
 			PlayerIndex = pidx;
 			BT_SetData( PL_LASTDEATHTIME, GetGameTime() )
 			PutMessage("��ch qu�n �� b�t ��u h�nh ��ng! C�c chi�n s�! X�ng l�n!")
		end
		if (idx <= 0) then 
			break
		end
	end;
	PlayerIndex = oldPlayerIndex
end;

function EndMission()
	WriteLog("[Battle Log] Ending Misson Begin");
	
	SetMissionV(MS_STATE,3)
	StopMissionTimer(MISSIONID, 109);
	StopMissionTimer(MISSIONID ,110);
	
	GameOver()
	level = BT_GetGameData(GAME_LEVEL);
	DeleteChannel("Phe T�ng"..szGAME_GAMELEVEL[level].."Tranh �o�t BOSS")
	DeleteChannel("Phe Kim"..szGAME_GAMELEVEL[level].."Tranh �o�t BOSS")


	SetGlbValue(GLB_BATTLESTATE, 0) --���ø�ȫ�ֱ���Ϊ1����־��ǰ�������������ν�ս�۽׶Σ���ʱ������������ĳ��ڵ��Զ������ν�ս�۵ı����㣬����������ԭ�ν�ս����ͼ
	for i = 1, 100 do 
		SetMissionV(i , 0);
	end;
	
	WriteLog("[Battle Log] Ending Misson End");
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
	
	WriteLog("[Battle Log] Player Leave Battle :"..GetName());
	
	-- SetLogoutRV(0);  ��ҵ���Ҳ���Mission��OnLeave����˲����ڴ˵���SetLogoutRV(0)�������ڰ����NewWorld��Mission��ͼ�ĵط����� Fanghao_Wu 2006-3-21
	ForbidChangePK(0);
	SetPKFlag(0)
	if (GetCurCamp() == 1) then
		LeaveChannel(PlayerIndex, "Phe T�ng"..szGAME_GAMELEVEL[level].."Tranh �o�t BOSS")
	else
		LeaveChannel(PlayerIndex, "Phe Kim"..szGAME_GAMELEVEL[level].."Tranh �o�t BOSS")
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

	if (GetMissionV(MS_TIMER1) < (TIMER_2 / TIMER_1)) then
		BT_UpdateMemberCount();
	end
	ResetBonus()		--�������ϵ�������û���
end;

