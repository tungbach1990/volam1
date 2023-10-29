if (1) then -- not __FESTIVAL_HEAD__) then
	__FESTIVAL_HEAD__ = 1;
	
	IncludeLib("BATTLE");
	Include("\\script\\missions\\tong\\tong_springfestival\\npcpoint.lua");
	Include("\\script\\lib\\common.lua")
	Include("\\script\\lib\\gb_taskfuncs.lua")
	Include("\\script\\missions\\tong\\tong_head.lua");
	
	--��ֵ����
	SF_PREPAREMISSIONID = 39;
	SF_MISSIONID = 40;
	
	SF_FRAME = 18;	--ÿ��18֡
	SF_REFRASHTIME = 15 * SF_FRAME; -- ÿ15����ˢһ�ι�
	SF_VANISHTIME = 10 * SF_FRAME;	--ʥ������ͣ��10����
	SF_RUNINTERVER = 30 * SF_FRAME; --30��һ�Σ����Թ�����Ϸ
	SF_MAXPLAYTIMES = 5; --ÿ�����һ����5��
	SF_LEVELLIMIT = 50; --��Ҳμ���Ҫ����С����
	
	SF_PREPARETIME = 68; --׼������ʱ��
	SF_FAIRY_SMALLTIMERID = 69;	--ˢ�ּ�ʱ��
	SF_REPORT_SMALLTIMERID = 70;	--RunMission�õļ�ʱ����
	SF_INTERVER = 5 * SF_FRAME;	--5���Ӵ���ˢ�ֺ�����ִ�����
	
	--GLBֵ
	GLB_SF_PHASE = 853; --���ڻ��ʱ��
	--===============�͹����==================
	SF_NPCID = 361;	--ˢ���ֵ�NCP index
	SF_MAPID = {823, 824};	--ʥ�����ͼId
	
	SF_SMALLMAPCOUNT = 19;	--һ����12��С��ͼ
	SF_MOUSECOUNT_MIN = 10;	--һ��С��ͼһ������ˢ������Ŀ
	SF_MOUSECOUNT_MAX = 10;	--һ��С��ͼһ�����ˢ������Ŀ
	SF_MAXPLAYERCOUNT = 10;	--ÿ����Ϸ���10���ˣ�
	SF_NIANSHOU_XUANYUN = 10;   --����ÿ������10�ξͱ�ѣ��
	SF_ALL_MAXPLAYERCOUNT = 100; --һ�����120�ˣ�
	--=========================================
	
	--=========�������===============
--	TK_LEAVERMAPID = 2402;	--�洢�������mapid
--	TK_LEAVERPOSX = 2403;	--�洢�뿪��Ϸ��x�����
--	TK_LEAVERPOSY = 2404;	--�洢�뿪��Ϸ��y�����
	
	SF_TK_DAYKEY = 2405;	--��¼����һ��
	SF_TK_PLAYTIMES = 2406; --��¼һ������Ĵ���

	SF_COUNT_ONETIME = 2407;	--��¼һ�����˶��ٸ�	
	SF_TK_RANK = 2408;		--��¼һ����������

--	TK_GROUPID = 2409;	--��¼��ҵ�Group��
--	TK_EXP_BEISHU = 2410; -- ��þ���ı���
--	TK_EXP_TIME = 2411;  -- ���˫����ʱ��
--	
	TK_ATTACKED_TIMES = 2412;    --��¼���ޱ������Ĵ���
	TK_ATTACKED_INTERVER = 2413;     --��ͨ���ʹ�õ��߼��
	
	--================================
	
	--MS���֣�
	MS_SF_STATE = 1;
	MS_SF_TIMERSTATE = 2; --������¼���ڽ���Ľ���ˢ�ֺ�����֣�0������֣�1��ˢ����
	MS_SF_NEWSVALUE = 3; --
	MS_SF_BEGINGMAPID = 10; --��¼��ʼ�ĵ�ͼ��ID
	MS_SF_PREPARENEWSVALUE = 5; --׼������ʱ����
	MS_SF_GAMECOUNT = 6;    --  ��¼һ����ʼ����Ϸ�ĸ���
	--�������֣�
	FESTIVAL_SHREWMOUSE = "TONG_SPFESTIVAL";
	SF_ANIMALNAME = "Qu�i th� ";
	SF_MOUSENAME = "��a tr� m�t t�ch"; --ʥ�����������
	SF_GIFTNAME = "L� v�t �� l�i";       --����NPC������
	SF_SIGNNPCNAME = "<color=yellow>T�ng qu�n Ho�t ��ng ph��ng<color>: ";    --����ʥ�����˵�����
	SF_MAPPOINTFLORDER = "springfestival2006";
	FESTIVAL_OK = 1;    --����״̬�϶���ʾ
	FESTIVAL_NO = 0;    --����״̬�񶨱�ʾ
	FESTIVAL_ENTERSPEED = 16; --������Ϸ����ҵ��ٶ�
	FESTIVAL_LEAVERSPEED = -1; --�뿪��Ϸ����ҵ��ٶ�
	
	--����ʥ������
	function festival_putfairy()
		local nNPCCount;
		local PosTab;	--���ڼ�¼
		local i, j;
		local nPosX, nPosY;
		local OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(SF_MAPID[2])
		local scriptfile = "\\script\\missions\\tong\\tong_springfestival\\npcs\\festival_shrewmouse.lua";
		
		local nBeginID = GetMissionV(MS_SF_BEGINGMAPID) + 1;
		local nGameCount = GetMissionV(MS_SF_GAMECOUNT);
		local nLoopLimit = nBeginID + nGameCount - 1;
		
		for i = nBeginID, nLoopLimit do
		    if (i > SF_SMALLMAPCOUNT) then
		        j = mod(i, SF_SMALLMAPCOUNT);
		    else
		        j = i;
		    end;
			nNPCCount = random(SF_MOUSECOUNT_MIN, SF_MOUSECOUNT_MAX);
			local PosFile = format("\\settings\\maps\\%s\\elf_%d.txt", SF_MAPPOINTFLORDER, j);
			PosTab = getndata(PosFile, nNPCCount)

			tabadddiagnpc(PosTab, scriptfile, SF_NPCID, SF_MOUSENAME)
		end;
		SubWorld = OldWorld;
	end;
	
	
	--���ʥ������
	function festival_clearfairy(szNPCName)
	    if ("string" ~= type(szNPCName)) then
	        return
	    end;
		local OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(SF_MAPID[2]);
		ClearMapNpcWithName(SF_MAPID[2], szNPCName);     --�����е��������
		SubWorld = OldWorld;
	end;
	
	--���뵽��Ϸ��
	function joinspringfestival(nTongID, nWorkshopID)
		local nNowTime = tonumber(GetLocalDate("%y%m%d"));
		if (GetTask(SF_TK_DAYKEY) ~= nNowTime) then
			SetTask(SF_TK_DAYKEY, nNowTime);
			SetTask(SF_TK_PLAYTIMES, 0);
		end;
		
		--���м���
		local nTimes = GetTask(SF_TK_PLAYTIMES);
		if (nTimes >= SF_MAXPLAYTIMES) then
			Talk(1, "", SF_SIGNNPCNAME.."H�m nay ng��i �� ��n 5 l�n r�i, hay l� ngh� m�t ch�t �i!");
			return
		end;
		
		if (GetLevel() < SF_LEVELLIMIT) then
			Talk(1, "", SF_SIGNNPCNAME.."��ng c�p c�a ng��i qu� th�p, ta kh�ng mu�n ng��i g�p nguy hi�m, ch� ��n c�p 50 r�i quay l�i.");
			return
		end;
		
		local nPhase = gb_GetTask(FESTIVAL_SHREWMOUSE, 1);
		if (nPhase ~= 1) then
			if (nPhase == 3) then
				Talk(1, "", "T�ng qu�n Ho�t ��ng ph��ng: H�y ��t ��i ho�t ��ng sau. B�t ��u v�o 1h, 4h, 7h��22h, v�o ph�t th� 15, 30, 45 b�t ��u cho b�o danh.");
				return
			end;
			Talk(1, "", "T�ng qu�n Ho�t ��ng ph��ng: Ho�t ��ng ��nh ni�n th� �ang di�n ra, h�y ��i ��t sau v�y. M�i ��t b�t ��u l�c 1h, 4h, 7h��22h, v�o ph�t th� 15, 30, 45 b�t ��u cho b�o danh.");
			return
		end
		
		--���а����ص��ж�
		if (festival_tongjudge(2, nTongID, nWorkshopID) == 0) then
			return
		end;

		local ww, xx, yy = GetWorldPos();
		SetTask(TK_LEAVERMAPID, ww);
		SetTask(TK_LEAVERPOSX, xx);
		SetTask(TK_LEAVERPOSY, yy);
		local szFile = format("\\settings\\maps\\%s\\player.txt", SF_MAPPOINTFLORDER);
		local nPosX, nPosY;
		nPosX, nPosY = getadatabetween(szFile, 2, 15);
		NewWorld(SF_MAPID[1], floor(nPosX / 32), floor(nPosY / 32));
	end;
	
	--��Ϸ����
	function festival_gameover(nMapID, nMissionID)
		local OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(nMapID);
		
		local pidx;
		local idx = 0;
		
		local OldPlayer = PlayerIndex;
		local tabPlayer = {};
		local i;
		for i = 1, 400 do
			idx, pidx = GetNextPlayer(nMissionID, idx, 0);
			if (pidx > 0) then
				tabPlayer[i] = pidx;
			end;
			
			if (0 == idx) then
				break;
			end;
			
		end;
		
		local nLoop = getn(tabPlayer);
		for i = 1, nLoop do
			PlayerIndex = tabPlayer[i];
			festival_setplayerleaverstate();
			NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY));
		end;
		PlayerIndex = OldPlayer;
		SubWorld = OldWorld;
	end;
	
	--����Լ���״̬
	function festival_get_exptimes()
		local exp_time = GetTask(TK_EXP_TIME)
		local gametime = GetGameTime()
		local nBeishu = GetTask(TK_EXP_BEISHU);
		if (exp_time == 0 or exp_time + 30 <= gametime) then
			return 1
		elseif (nBeishu ~= 2 or nBeishu ~= 4) then
			return 1
		else
			Msg2Player(nBeishu.." l�n");
			return nBeishu;
		end
	end
	
	function festival_setplayertoprepare()	--��ҽ���׼����
		ForbitSkill(FESTIVAL_OK);
		SetMoveSpeed(FESTIVAL_ENTERSPEED);
		
		--���������йصı������������ھ�����ս�ı�ĳ�������Ӫ�Ĳ���
		SetTaskTemp(200, 1);
		--����ս��״̬
		SetFightState(FESTIVAL_NO);
		--����˳�ʱ������RV�������´ε���ʱ��RV(���������㣬���˳���)
		SetLogoutRV(FESTIVAL_OK);
		--�������ͷ�
		SetPunish(FESTIVAL_NO);
		--�ر���ӹ���
		SetCreateTeam(FESTIVAL_NO);
		
		--��ֹ�⻷
		ForbitAura(FESTIVAL_OK)
		--���ó�ɱ
		ForbidEnmity(FESTIVAL_OK)
		--��PK���� 

		--��ʼӦ�ö�����PK
		SetPKFlag(FESTIVAL_NO)
		--��ֹ����;
		DisabledStall(FESTIVAL_OK);
		ForbitTrade(FESTIVAL_NO);
		
		ForbidChangePK(FESTIVAL_OK);
		DisabledUseTownP(FESTIVAL_OK);	--��ֹʹ�ûس̣�
	end;
	
	function festival_setplayerleaverstate()	--����뿪��Ϸʱ��
		ForbitSkill(FESTIVAL_NO);
		SetMoveSpeed(FESTIVAL_LEAVERSPEED);
		
		RestoreOwnFeature();    --�������˱��ԭ������
		local i;
		for i = 1035, 1048 do
            ConsumeItem( -1, 1000, 6, 1, i, 1 );
        end;
		
		--��ֹ�⻷
		ForbitAura(FESTIVAL_NO)
		--���������йصı������������ھ�����ս�ı�ĳ�������Ӫ�Ĳ���
		SetTaskTemp(200,0);
		--����ս��״̬
		SetFightState(FESTIVAL_NO);
		--�������ͷ�
		SetPunish(FESTIVAL_OK);
		--�ر���ӹ���
		SetCreateTeam(FESTIVAL_NO);
		--��PK���� 
		
		--���ó�ɱ
		ForbidEnmity( FESTIVAL_NO )
		--��ʼӦ�ö�����PK
		SetPKFlag(FESTIVAL_NO)
		--��ֹ����;
		DisabledStall(FESTIVAL_NO);
		ForbitTrade(FESTIVAL_NO);
		
		local nCamp = GetCamp();
		SetCurCamp(nCamp);
		
		ForbidChangePK(FESTIVAL_NO);
		DisabledUseTownP(FESTIVAL_NO);	--��ֹʹ�ûس̣�
	end;
	
	function festival_setplayertogame()	--��ҽ�����Ϸ
		ForbitSkill(FESTIVAL_OK);
		SetMoveSpeed(FESTIVAL_ENTERSPEED);
		
		
		--���������йصı������������ھ�����ս�ı�ĳ�������Ӫ�Ĳ���
		SetTaskTemp(200,1);
		
		SetTask(SF_TK_PLAYTIMES, GetTask(SF_TK_PLAYTIMES) + 1);
		--����ս��״̬
		--����˳�ʱ������RV�������´ε���ʱ��RV(���������㣬���˳���)
		SetLogoutRV(FESTIVAL_OK);
		
		--��ֹ�⻷
		ForbitAura(FESTIVAL_OK)
		SetFightState(FESTIVAL_OK);
		--�������ͷ�
		SetPunish(FESTIVAL_NO);
		--�ر���ӹ���
		SetCreateTeam(FESTIVAL_NO);
		--��PK���� 

		--���ó�ɱ
		ForbidEnmity( FESTIVAL_OK )
		--��ʼӦ�ö�����PK
		SetPKFlag(FESTIVAL_OK)
		--��ֹ����;
		DisabledStall(FESTIVAL_OK);
		ForbitTrade(FESTIVAL_NO);
		
		ForbidChangePK(FESTIVAL_OK);
		SetCurCamp(1);	--������ʱ��Ӫ
		DisabledUseTownP(FESTIVAL_OK);	--��ֹʹ�ûس̣�
	end;

	--����һ������ڵ�ǰ��ҵ�ѡ��
	function make_option(szFunName)
		local szName = GetName()
		return safeshow(szName).."/#"..szFunName.."('"..safestr(szName).."')"
	end

	--��������Ƿ�������Ϸ�У��ɹ�����PlayerIndex���򷵻�nil
	function festival_check_pl(szPlayName)
		local nPlIdx = SearchPlayer(szPlayName)	--����Ƿ��ڵ�ǰ������
		if (nPlIdx > 0) then
			local nPlMsIdx = PIdx2MSDIdx(SF_MISSIONID, nPlIdx)	--����Ƿ���ָ��Mission��
			if (nPlMsIdx > 0) then
				return nPlIdx
			end
		end
	end
	--�������Ƿ���Ա�ʹ��
	function itemuseplacecheck(nType)   --nType :1�����������ߣ�2��������ר�õ��ߣ�3������ͨ���רҵ����
    
	    if (GetTask(TK_GROUPID) <= SF_SMALLMAPCOUNT and 2 == nType) then
    	    Talk(1, "", "Ch� c� ng��i ch�i Qu�i th� m�i c� th� s� d�ng M�t n� n�y");
	        return 0;
	    end;
	    
	    if (GetTask(TK_GROUPID) > SF_SMALLMAPCOUNT and 3 == nType) then
    	    Talk(1, "", "Ch� c� ng��i ch�i b�nh th��ng m�i s� d�ng ���c v�t ph�m n�y.");
	        return 0;
	    end;
	    
	    return 1
	end;
	--�ҵ�������Ӫ�����ޡ���>��ң���ҡ���>����
	function festival_getgroupid(nGroupId)
	    if (nGroupId < 1) then
	        return nil
	    end;
	    
	    if (nGroupId > SF_SMALLMAPCOUNT) then
	        return nGroupId - SF_SMALLMAPCOUNT;
	    else
	        return nGroupId + SF_SMALLMAPCOUNT;
	    end;
	end;
	
	function festival_go_other_place()  --���������ʼ��
	    local nBeginMapID = GetMissionV(MS_SF_BEGINGMAPID);
    	local nGroupId = GetTask(TK_GROUPID);
    	
    	local nMapId = nBeginMapID + nGroupId - 1;
    	nMapId = mod(nMapId, SF_SMALLMAPCOUNT) + 1;
    	local szFile = format("\\settings\\maps\\%s\\elf_%d.txt", SF_MAPPOINTFLORDER, nMapId);
    	local PosX, PosY = getadata(szFile);
    	SetPos(floor(PosX / 32), floor(PosY / 32));
    	SubWorld = OldSubWorld;
	end;
	
	function festival_go_back(nBeginMapID)  --���������ʼ��
    	local nGroupId = GetTask(TK_GROUPID);
    	
    	local nMapId = nBeginMapID + nGroupId - 1;
    	nMapId = mod(nMapId, SF_SMALLMAPCOUNT) + 1;
    	local szFile = format("\\settings\\maps\\%s\\player.txt", SF_MAPPOINTFLORDER);
		local PosX, PosY = getadatabetween(szFile, 8 + 8 * nMapId, 15 + 8 * nMapId);
    	SetPos(floor(PosX / 32), floor(PosY / 32));
    	SubWorld = OldSubWorld;
	end;
	
	function festival_checkinterver()
	    local gametime = GetGameTime();
	    if (GetTask(TK_ATTACKED_INTERVER) > gametime) then
	        return 0;
	    else
	        SetTask(TK_ATTACKED_INTERVER, gametime + 2);
	        return 1;
	    end;
	end;
end;
