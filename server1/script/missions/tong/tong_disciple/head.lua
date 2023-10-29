if (not CHRISMAS_HEAD) then
	CHRISMAD_HEAD = 1;
	
	IncludeLib("BATTLE");
	Include([[\script\missions\tong\tong_disciple\npcpoint.lua]]);
	Include("\\script\\lib\\common.lua")
	Include("\\script\\lib\\gb_taskfuncs.lua")
	Include([[\script\missions\tong\tong_head.lua]]);
	
	--��ֵ����
	DIS_MISSIONID = 38;
	DIS_PREPAREMISSIONID = 37;
	DIS_MAXPLAYERCOUNT = 10;	--ÿ����Ϸ���10���ˣ�
	DIS_ALL_MAXPLAYERCOUNT = 120; --һ�����120�ˣ�
	
	DIS_FRAME = 18;	--ÿ��18֡
	DIS_REFRASHTIME = 15 * DIS_FRAME; -- ÿ15����ˢһ�ι�
	DIS_VANISHTIME = 10 * DIS_FRAME;	--ʥ������ͣ��10����
	DIS_RUNINTERVER = 30 * DIS_FRAME; --30��һ�Σ����Թ�����Ϸ
	DIS_MAXPLAYTIMES = 5; --ÿ�����һ����3��
	
	DIS_PREPARETIME = 65; --׼������ʱ��
	DIS_SMALLTIMERID = 66;	--ˢ�ּ�ʱ��
	DIS_RUNTIMERID = 67;	--RunMission�õļ�ʱ����
	DIS_INTERVER = 5 * DIS_FRAME;	--5���Ӵ���ˢ�ֺ�����ִ�����
	
	--GLBֵ
	GLB_DIS_PHASE = 852;
	CHRISMAS_SHREWMOUSE = "TONG_SHREWMOUSE";
	--===============�͹����==================
	DIS_NPCID = 323;	--ˢ���ֵ�NCP index
	DIS_MAPID = {821, 822};	--ʥ�����ͼId
	
	DIS_SMALLMAPCOUNT = 12;	--һ����12��С��ͼ
	DIS_MOUSECOUNT = 10;	--һ��С��ͼһ������ˢ������Ŀ
	--=========================================
	
	--=========�������===============
--	TK_LEAVERMAPID = 2392;	--�洢�뿪��Ϸ��mapid
--	TK_LEAVERPOSX = 2393;	--�洢�뿪��Ϸ��x�����
--	TK_LEAVERPOSY = 2394;	--�洢�뿪��Ϸ��y�����
	
	DIS_TK_DAYKEY = 2395;	--��¼����һ��
	DIS_TK_PLAYTIMES = 2396; --��¼һ������Ĵ���
	
	DIS_COUNT_ONETIME = 2397;	--��¼һ�����˶��ٸ�
	DIS_TK_RANK = 2398;		--��¼һ����������
--	
--	TK_GROUPID = 2399;	--��¼��ҵ�Group��
--	TK_EXP_BEISHU = 2400; --
--	TK_EXP_TIME = 2401;
	--================================
	
	--MS���֣�
	MS_STATE = 1;
	MS_TIMERSTATE = 2; --������¼���ڽ���Ľ���ˢ�ֺ�����֣�0������֣�1��ˢ����
	MS_NEWSVALUE = 3; --
	MS_BEGINGMAPID = 10; --��¼��ʼ�ĵ�ͼ��ID

	MS_PREPARENEWSVALUE = 5; --׼������ʱ����

	DIS_MOUSENAME = "�� t�"; --ʥ�����������


	--����ʥ������
	function putfairy()
		local nNPCCount;
		local PosTab;	--���ڼ�¼
		local i, j;
		local nPosX, nPosY;
		local OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(DIS_MAPID[2])
		local scriptfile = [[\script\missions\tong\tong_disciple\npcs\shrewmouse.lua]];
		
		for i = 1, DIS_SMALLMAPCOUNT do
			nNPCCount = DIS_MOUSECOUNT;
			local PosFile = format("\\settings\\maps\\chrismas\\elf_%d.txt", i);
			PosTab = getndata(PosFile, nNPCCount)

			tabadddiagnpc(PosTab, scriptfile, DIS_NPCID, DIS_MOUSENAME)
		end;
		SubWorld = OldWorld;
	end;
	
	
	--���ʥ������
	function clearfairy()
		local OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(DIS_MAPID[2]);
		ClearMapNpcWithName(DIS_MAPID[2], DIS_MOUSENAME);
		SubWorld = OldWorld;
	end;
	
	
	--���뵽��Ϸ��
	function joindisciple(nTongID, nWorkshopID)
		local nNowTime = tonumber(GetLocalDate("%y%m%d"));
		if (GetTask(DIS_TK_DAYKEY) ~= nNowTime) then
			SetTask(DIS_TK_DAYKEY, nNowTime);
			SetTask(DIS_TK_PLAYTIMES, 0);
		end;
		
		--���м���
		local nTimes = GetTask(DIS_TK_PLAYTIMES);
		if (GetTask(DIS_TK_PLAYTIMES) >= DIS_MAXPLAYTIMES) then
			Talk(1, "", "<color=yellow>T�ng qu�n Ho�t ��ng ph��ng<color>: M�t ng�y ch� c� th� tham gia 5 ��t ho�t ��ng Chi�u m� �� t�!");
			return
		end;
		
		local nPhase = gb_GetTask(CHRISMAS_SHREWMOUSE, 1);
		if (nPhase ~= 1) then
			if (nPhase == 3) then
				Talk(1, "", "T�ng qu�n Ho�t ��ng ph��ng:  H�y ��i ��t sau b�t ��u. Th�i gian b�o danh di�n ra v�o 0h, 3h, 6h��21h, � ph�t th� 15, 30 v� 45.");
				return
			end;
			Talk(1, "", "T�ng qu�n Ho�t ��ng ph��ng:  Ho�t ��ng chi�u m� �� t� �ang di�n ra, h�y ��i ��t ho�t ��ng sau. Th�i gian b�o danh di�n ra v�o 0h, 3h, 6h��21h, � ph�t th� 15, 30 v� 45.");
			return
		end

		--�����ж�
		if (festival_tongjudge(1, nTongID, nWorkshopID) == 0) then
			return
		end;

		local szFile = [[\settings\maps\chrismas\player.txt]];
		ww, xx, yy = GetWorldPos()
		local nPosX, nPosY;
		SetTask(TK_LEAVERMAPID, ww);
		SetTask(TK_LEAVERPOSX, xx);
		SetTask(TK_LEAVERPOSY, yy);
		nPosX, nPosY = getadatatow(szFile, 2, 15);
		NewWorld(DIS_MAPID[1], floor(nPosX / 32), floor(nPosY / 32));
	end;
	
	--��Ϸ����
	function gameover(nMapid, nMissionID)
		local OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(nMapid);
		
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
			setplayerleaverstate();
			NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY));
		end;
		PlayerIndex = OldPlayer;
		SubWorld = OldWorld;
	end;
	
	--����Լ���״̬
	function get_exptimes()
		local exp_time = GetTask(TK_EXP_TIME)
		local gametime = GetGameTime()
		local nBeishu = GetTask(TK_EXP_BEISHU);
		if (exp_time == 0 or exp_time + 30 <= gametime) then
			return 1
		elseif (nBeishu ~= 2 or nBeishu ~= 4) then
			return 1
		else
			return nBeishu;
		end
	end
	
	function setplayerreadystate()	--��ҽ���׼����
		ForbitSkill(1);
		SetMoveSpeed(18);
		
		--���������йصı������������ھ�����ս�ı�ĳ�������Ӫ�Ĳ���
		SetTaskTemp(200,1);
		--����ս��״̬
		SetFightState(0);
		--����˳�ʱ������RV�������´ε���ʱ��RV(���������㣬���˳���)
		SetLogoutRV(1);
		--�������ͷ�
		SetPunish(0);
		--�ر���ӹ���
		SetCreateTeam(0);
		
		--��ֹ�⻷
		ForbitAura(1)
		--���ó�ɱ
		ForbidEnmity( 1 )
		--��PK���� 

		--��ʼӦ�ö�����PK
		SetPKFlag(0)
		--��ֹ����;
		DisabledStall(1);
		ForbitTrade(0);
		
		ForbidChangePK(1);
		DisabledUseTownP(1);	--��ֹʹ�ûس̣�
	end;
	
	function setplayerleaverstate()	--����뿪��Ϸ��
		ForbitSkill(0);
		SetMoveSpeed(-1);
		
		--��ֹ�⻷
		ForbitAura(0)
		--���������йصı������������ھ�����ս�ı�ĳ�������Ӫ�Ĳ���
		SetTaskTemp(200,0);
		--����ս��״̬
		SetFightState(0);
		--����˳�ʱ������RV�������´ε���ʱ��RV(���������㣬���˳���)
		--SetLogoutRV(0);
		--�������ͷ�
		SetPunish(1);
		--�ر���ӹ���
		SetCreateTeam(0);
		--��PK���� 
		
		--���ó�ɱ
		ForbidEnmity( 0 )
		--��ʼӦ�ö�����PK
		SetPKFlag(0)
		--��ֹ����;
		DisabledStall(0);
		ForbitTrade(0);
		
		local nCamp = GetCamp();
		SetCurCamp(nCamp);
		
		ForbidChangePK(0);
		DisabledUseTownP(0);	--��ֹʹ�ûس̣�
	end;
	
	function setplayerjoinstate()	--��ҽ�����Ϸ
		ForbitSkill(1);
		SetMoveSpeed(18);
		
		SetTask(DIS_TK_PLAYTIMES, GetTask(DIS_TK_PLAYTIMES) + 1);
		--���������йصı������������ھ�����ս�ı�ĳ�������Ӫ�Ĳ���
		SetTaskTemp(200,1);
		--����ս��״̬
		SetFightState(1);
		--����˳�ʱ������RV�������´ε���ʱ��RV(���������㣬���˳���)
		SetLogoutRV(1);
		
		--��ֹ�⻷
		ForbitAura(1)
		SetFightState(1);
		--�������ͷ�
		SetPunish(0);
		--�ر���ӹ���
		SetCreateTeam(0);
		--��PK���� 

		--���ó�ɱ
		ForbidEnmity( 1 )
		--��ʼӦ�ö�����PK
		SetPKFlag(1)
		--��ֹ����;
		DisabledStall(1);
		ForbitTrade(0);
		
		ForbidChangePK(1);
		SetCurCamp(4);	--������ʱ��Ӫ
		DisabledUseTownP(1);	--��ֹʹ�ûس̣�
	end;

	--����һ������ڵ�ǰ��ҵ�ѡ��
	function ch_make_option(szFunName)
		local szName = GetName()
		return safeshow(szName).."/#"..szFunName.."('"..safestr(szName).."')"
	end

	--��������Ƿ�������Ϸ�У��ɹ�����PlayerIndex���򷵻�nil
	function ch_check_pl(szPlayName)
		local nPlIdx = SearchPlayer(szPlayName)	--����Ƿ��ڵ�ǰ������
		if (nPlIdx > 0) then
			local nPlMsIdx = PIdx2MSDIdx(DIS_MISSIONID, nPlIdx)	--����Ƿ���ָ��Mission��
			if (nPlMsIdx > 0) then
				return nPlIdx
			end
		end
	end
end;
