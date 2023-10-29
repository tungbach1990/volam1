DTMISSIONID = 14
function BT2DTFight(orgmissionid,Player1, Player2)
	print("battlewd:"..SubWorld)
	local MS_ORGWORLDINDEX = 3		--��ʱ�����ͼ��INDEX
	local MS_ORGMISSION = 4		--��ʱ�����MISSION	
	local MS_ORGMAPID = 5			--��ʱ�����MAPID
	local MS_LEVEL = 	6			--����ĵȼ�
	local MS_ORGBACK_X1 = 7		--�˳��������������
	local MS_ORGBACK_Y1 =	8		
	local MS_ORGBACK_X2 = 9
	local MS_ORGBACK_Y2 = 10
	local MS_DTWORLDINDEX = 12		--���������ͼ��INDEX
	local MS_DTMISSION = 13			--���������MISSION

	local MS_PL_INDEX_1 = 14
	local MS_PL_CURCAMP_1 = 15
	local MS_PL_INDEX_2 = 17
	local MS_PL_CURCAMP_2 = 18

	local mapid = dt_getfightmap();						--�õ�������ͼid
	local mapindex = SubWorldID2Idx(mapid)		--�õ���ͼ��mapid������
	if (mapindex < 0) then
		print("Error!Server n�y hi�n thi�u khu v�c ��n ��u! Xin b� ph�n k� thu�t ki�m tra g�p!");
		return
	end;

	--�鿴��ͼ�Ƿ�ռ�ã�
	if (dt_CheckMap(mapindex) == 0) then
		return
	end;
	
	local orgsubworld = SubWorld;---�����ǵ�ǰ��ͼ��������
	local orgPlayerIndex = PlayerIndex	
	local orgmapid = SubWorldIdx2ID(SubWorld)	
	local orggamelevel = BT_GetGameData(GAME_LEVEL)
	local orghomeinx1 = GetMissionV(MS_HOMEIN_X1)
	local orghomeiny1 = GetMissionV(MS_HOMEIN_Y1)
	local orghomeinx2 = GetMissionV(MS_HOMEIN_X2)
	local orghomeiny2 = GetMissionV(MS_HOMEIN_Y2)
	
	SubWorld = mapindex	
	----����������ʼ������mission
	OpenMission(DTMISSIONID)
	
	--���浱ǰ�������Ϣ�ڵ���mission��	
	SetMissionV(MS_ORGWORLDINDEX,orgsubworld)
	SetMissionV(MS_ORGMISSION,orgmissionid)
	SetMissionV(MS_ORGMAPID,orgmapid)
	SetMissionV(MS_LEVEL,orggamelevle)
	SetMissionV(MS_ORGBACK_X1,orghomeinx1)
	SetMissionV(MS_ORGBACK_Y1,orghomeiny1)
	SetMissionV(MS_ORGBACK_X2,orghomeinx2)
	SetMissionV(MS_ORGBACK_Y2,orghomeiny2)
	SetMissionV(MS_DTWORLDINDEX , SubWorld)
	SetMissionV(MS_DTMISSION , DTMISSIONID)
	
	PlayerIndex = Player1
	SetMissionV(MS_PL_INDEX_1,PlayerIndex)
	SetMissionS(1,GetName())
	SetMissionV(MS_PL_CURCAMP_1,GetCurCamp())
	
	PlayerIndex = Player2
	SetMissionV(MS_PL_INDEX_2,PlayerIndex)
	SetMissionS(2,GetName())
	SetMissionV(MS_PL_CURCAMP_2,GetCurCamp())
	
----������˫�����뵽������ͼ��
	dt_EnterMap(mapindex,Player1)
	dt_EnterMap(mapindex,Player2)
	
	RunMission(DTMISSIONID)
	
	SubWorld = orgsubworld				--��ԭ��ǰ��ͼ��index
	PlayerIndex = orgPlayerIndex		--��ԭ��ǰPlayerIndex
end


--------��player���뵽ָ��index��ͼ��
function dt_EnterMap(newworldindex,pindex)
	local MS_ORGWORLDINDEX = 3		--��ʱ�����ͼ��INDEX
	print("enter1wd:"..SubWorld)
	
	SubWorld = newworldindex;
	PlayerIndex = pindex
	local orgworldidx = GetMissionV(MS_ORGWORLDINDEX)
	if (GetCurCamp() == 1) then 
		local newworldid = SubWorldIdx2ID(newworldindex)
		
		SubWorld = orgworldidx;
		print("enter2wd:"..SubWorld)
		local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))	
		
		enterpos = GetIniFileData(mapfile, "Area_SingleFight", "SinglePos1");
		x1,y1 = bt_str2xydata(enterpos)	
		
		SubWorld = newworldindex;
		NewWorld(newworldid, floor(x1/32),floor(y1/32))	
		print("newworld"..newworldid.." "..x1.." "..y1)
		AddMSPlayer(DTMISSIONID,1)
		SetCurCamp(1);
		local str2 = "<#> phe T�ng"..GetName().."v�o khu v�c ��n ��u";
	else
		local newworldid =	 SubWorldIdx2ID(newworldindex)
		
		SubWorld = orgworldidx;
		local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))		
		enterpos = GetIniFileData(mapfile, "Area_SingleFight", "SinglePos2");
		x1,y1 = bt_str2xydata(enterpos)	
		
		SubWorld = newworldindex;
		NewWorld(newworldid, floor(x1/32),floor( y1/32))
		print("newworld"..newworldid.." "..x1.." "..y1)
		AddMSPlayer(DTMISSIONID, 2)
		SetCurCamp(2);
		
		local str2 = "<#> phe Kim"..GetName().."v�o khu v�c ��n ��u";
	end;
	local str1 = "B�n �i v�o khu v�c ��n ��u! B�n ch� c� 3 ph�t �� ti�u di�t ��i th�! N�u b�n th�t b�i ho�c th�i gian k�t th�c, b�n s� ���c d�a v� h�u doanh."
	Talk(1,"",str1.."<enter>  <color=red>Ch�nh th�c khai chi�n!")
	Msg2Player(str2);
	
	SubWorld = orgworldidx
	Msg2MSAll(GetMissionV(MS_ORGMISSION),str2)
	
	SubWorld = newworldindex
	SetPKFlag(1)
	SetDeathScript("\\script\\battles\\singlefight\\dt_death.lua");
end;

--------ͨ����ǰս�۵ȼ��ȼ��õ���Ӧ�ȼ��ĵ�����ͼid
function dt_getfightmap()
	local lel=BT_GetGameData(GAME_LEVEL);
	if ( lel < 0 ) then
		print("error:")
	end
	local mapfile = GetMapInfoFile(BT_GetGameData(GAME_MAPID))
	return tonumber(GetIniFileData(mapfile, "Area_SingleFight", "SingleFightMap"..lel)) 	
end;

--------�鿴������ͼ��û�б�ռ�ã��ܲ���ʹ�á�return 0--���ܣ�return  1--��;
function dt_CheckMap(index)
	orgworld = SubWorld;
	SubWorld = index;
	count = GetMSPlayerCount(DTMISSIONID, 0)
	if (count > 0 ) then 
		SubWorld = orgworld
		return 0
	else
		SubWorld = orgworld
		return 1
	end
	SubWorld = orgworld
end;
