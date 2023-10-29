if (not CHRISMAS_HEAD) then
	CHRISMAD_HEAD = 1;
	
	IncludeLib("BATTLE");
	Include([[\script\missions\tong\collectgoods\npcpoint.lua]]);
	Include("\\script\\lib\\common.lua")
	Include("\\script\\lib\\gb_taskfuncs.lua")
	Include([[\script\missions\tong\tong_head.lua]]);
	
	--��ֵ����
	COLLG_PREPAREMISSIONID = 44;
	COLLG_MISSIONID = 45;
	COLLG_MAXPLAYERCOUNT = 10;	--ÿ����Ϸ���10���ˣ�
	COLLG_ALL_MAXPLAYERCOUNT = 120; --һ�����120�ˣ�
	
	COLLG_FRAME = 18;	--ÿ��18֡
	COLLG_REFRASHTIME = 15 * COLLG_FRAME; -- ÿ15����ˢһ�ι�
	COLLG_VANISHTIME = 10 * COLLG_FRAME;	--ʥ������ͣ��10����
	COLLG_RUNINTERVER = 30 * COLLG_FRAME; --30��һ�Σ����Թ�����Ϸ
	COLLG_BOMBINTERVER = 30 * COLLG_FRAME; --30�뱬ըһ�Σ�
	COLLG_MAXPLAYTIMES = 5; --ÿ�����һ����8��
	
	COLLG_PREPARETIME = 75; --׼������ʱ��
	COLLG_SMALLTIMERID = 76;	--ˢ�ּ�ʱ��
	COLLG_RUNTIMERID = 77;	--RunMission�õļ�ʱ����

	COLLG_INTERVER = 5 * COLLG_FRAME;	--5���Ӵ���ˢ�ֺ�����ִ�����
	--��Ʒ��indexֵ��
	COLLG_GOODSIDX = 1086;
	--GLBֵ
	GLB_COLLG_PHASE = 918;
	--===============�͹����==================
	COLLG_NPCID = 1121;	--ˢ���ֵ�NCP index
	COLLG_MAPID = {827, 828};	--ʥ�����ͼId
	
	COLLG_SMALLMAPCOUNT = 23;	--һ����12��С��ͼ
	COLLG_MOUSECOUNT = 10;	--һ��С��ͼһ������ˢ������Ŀ
	--=========================================
	
	--=========�������===============
--	TK_LEAVERMAPID = 2423;	--�洢�뿪��Ϸ��mapid
--	TK_LEAVERPOSX = 2424;	--�洢�뿪��Ϸ��x�����
--	TK_LEAVERPOSY = 2425;	--�洢�뿪��Ϸ��y�����
	
	COLLG_TK_DAYKEY = 2402;		--��¼����һ��
	COLLG_TK_PLAYTIMES = 2403; 	--��¼һ������Ĵ���
	
	COLLG_COUNT_ONETIME = 2404;	--��¼һ�����˶��ٸ�
	COLLG_TK_RANK = 2408;			--��¼һ����������
--	
--	TK_GROUPID = 2430;	--��¼��ҵ�Group��
--	TK_EXP_TIME = 2432;
	
	COLLG_TK_BOMB_MARK = 2409;	--��¼�Ǳ��ڼ���ը��ը��
	--================================
	
	--MS���֣�
	COLLG_MS_STATE = 1;
	COLLG_MS_TIMERSTATE = 2; --������¼���ڽ���Ľ���ˢ�ֺ�����֣�0������֣�1��ˢ����
	COLLG_MS_NEWSVALUE = 3; --
	COLLG_MS_BEGINGMAPID = 10; --��¼��ʼ�ĵ�ͼ��ID

	COLLG_MS_PREPARENEWSVALUE = 5; --׼������ʱ����
	COLLG_MS_GAMECOUNT = 11;	--��¼�ж��ٸ�����
	COLLG_NAME = "Thu th�p v�t ph�m bang h�i";
	
	COLLG_SKILLIDBOMB = 736;
	COLLG_SKILLLVLBOMB = 10;
	
	function collg_settobomber()
		SetTask(COLLG_TK_BOMB_MARK, -1);
	    AddTempMagic(COLLG_SKILLIDBOMB, COLLG_SKILLLVLBOMB);
	    SetImmedSkill(0, COLLG_SKILLIDBOMB)
	    SetAForbitSkill(COLLG_SKILLIDBOMB,0)
    	AddSkillState(705, 10, 0, 20000 * 18);
	end;
	
	function collg_settonormal()
		SetTask(COLLG_TK_BOMB_MARK, 0);
		SetAForbitSkill(COLLG_SKILLIDBOMB, 1);
		AddTempMagic(COLLG_SKILLIDBOMB, -1 * COLLG_SKILLLVLBOMB);
		SetImmedSkill(0, 1);
	    AddSkillState(705, 10, 0, 0);
	end;
	
	--����ʥ������
	function collg_putfairy()
		local nNPCCount;
		local PosTab;	--���ڼ�¼
		local i, j;
		local nPosX, nPosY;
		local OldWorld = SubWorld;
		
		local nBeginID = GetMissionV(COLLG_MS_BEGINGMAPID) + 1;
		local nGameCount = GetMissionV(COLLG_MS_GAMECOUNT);
		local nLoopLimit = nBeginID + nGameCount - 1;
		
		for i = nBeginID, nLoopLimit do
		    if (i > COLLG_SMALLMAPCOUNT) then
		        j = mod(i, COLLG_SMALLMAPCOUNT);
		    else
		        j = i;
		    end;
		    
		    if (j >= 20 and j <= 23) then
				j = j + 4;
			end;
			local PosFile = format("\\settings\\maps\\dragonboatfestival_06\\elf_%d.txt", j);
			PosTab = getndata(PosFile, COLLG_MOUSECOUNT)

			tabaddgoods(PosTab);
		end;
		SubWorld = OldWorld;
	end;
	
	
	--���ʥ������
	function collg_clearfairy()
		ClearMapObj(COLLG_MAPID[2]);
	end;
	
	--�ж�����Ƿ�����
	function collg_IsCharged()
		if( GetExtPoint( 0 ) >= 1 ) then
			return 1;
		else
			return 0;
		end;
	end;
	--���뵽��Ϸ��
	function collg_joindisciple(nTongID, nWorkshopID)
		local nNowTime = tonumber(GetLocalDate("%y%m%d"));
		if (GetTask(COLLG_TK_DAYKEY) ~= nNowTime) then
			SetTask(COLLG_TK_DAYKEY, nNowTime);
			SetTask(COLLG_TK_PLAYTIMES, 0);
		end;
		
		--���м���
		local nTimes = GetTask(COLLG_TK_PLAYTIMES);
		if (GetTask(COLLG_TK_PLAYTIMES) >= COLLG_MAXPLAYTIMES) then
			Talk(1, "", "<color=yellow>T�ng qu�n Ho�t ��ng ph��ng<color>: M�t ng�y ch� c� th� tham gia 5 ��t ho�t ��ng thu th�p v�t ph�m!");
			return
		end;
		
		local nPhase = gb_GetTask(COLLG_NAME, 1);
		if (nPhase ~= 1) then
			if (nPhase == 2) then
				Talk(1, "", "Th�t ng�i qu�, ng��i d�n ���ng v�a ��a m�t s� hi�p kh�ch �i r�i, m�t l�c sau m�i quay v�, h�y ��i ��t sau v�y.");
				Msg2Player("Ho�t ��ng �ang di�n ra, h�y ch� ��i ��t ho�t ��ng sau.");
				return
			end;
			Talk(1, "", "Hi�n t�i ta c� nhi�u vi�c quan tr�ng ph�i l�m, trong th�i gian 0h 00 ��n 1h 00, 12h00 ��n 14h00, 19h 00 ��n 22h00 h�y quay l�i t�m ta.");
			Msg2Player("Ho�t ��ng v�n ch�a b�t ��u.");
			return
		end
		
		--�����ж�
		if (festival_tongjudge(3, nTongID, nWorkshopID) == 0) then
			return
		end;

		local szFile = [[\settings\maps\dragonboatfestival_06\player.txt]];
		ww, xx, yy = GetWorldPos()
		local nPosX, nPosY;
		SetTask(TK_LEAVERMAPID, ww);
		SetTask(TK_LEAVERPOSX, xx);
		SetTask(TK_LEAVERPOSY, yy);
		nPosX, nPosY = getadatatow(szFile, 2, 15);
		NewWorld(COLLG_MAPID[1], floor(nPosX / 32), floor(nPosY / 32));
	end;
	
	--��Ϸ����
	function collg_gameover(nMapid, nMissionID)
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
			collg_setplayerleaverstate();
			NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY));
		end;
		PlayerIndex = OldPlayer;
		SubWorld = OldWorld;
	end;
	
	--����Լ���״̬
	function collg_get_exptimes()
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
	
	function collg_setplayerreadystate()	--��ҽ���׼����
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
	
	function collg_setplayerleaverstate()	--����뿪��Ϸ��
		ForbitSkill(0);
		SetMoveSpeed(-1);
		
	    SetAForbitSkill(COLLG_SKILLIDBOMB, 1);
		--ȥ��ը���˱��
		collg_settonormal();
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
	
	function collg_setplayerjoinstate()	--��ҽ�����Ϸ
		ForbitSkill(1);
		SetMoveSpeed(18);
		
		SetTask(COLLG_TK_PLAYTIMES, GetTask(COLLG_TK_PLAYTIMES) + 1);
		SetTask(TK_TIME_ALL, GetTask(TK_TIME_ALL) + 1);
		SetTask(COLLG_TK_BOMB_MARK, 0);
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
			local nPlMsIdx = PIdx2MSDIdx(COLLG_MISSIONID, nPlIdx)	--����Ƿ���ָ��Mission��
			if (nPlMsIdx > 0) then
				return nPlIdx
			end
		end
	end
	function OnCancel()
	end;
end;
