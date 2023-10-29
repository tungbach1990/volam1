if (not CHRISMAS_HEAD) then
	CHRISMAD_HEAD = 1;
	
	IncludeLib("BATTLE");
	Include([[\script\missions\chrismas\ch_file_npc_head.lua]]);
	Include("\\script\\lib\\gb_taskfuncs.lua") --
	Include("\\script\\lib\\common.lua")
	--��ֵ����
	DescLink_LiGuan = "<#><link=image[0,13]:\\spr\\npcres\\enemy\\enemy195\\enemy195_st.spr>�ng gi� Noel:<link>"	
	
	CH_MISSIONID = 28;
	CH_PREPAREMISSIONID = 29;
	CH_MAXPLAYERCOUNT = 10;	--ÿ����Ϸ���10���ˣ�
	CH_ALL_MAXPLAYERCOUNT = 120; --һ�����120�ˣ�
	
	CH_FRAME = 18;	--ÿ��18֡
	CH_REFRASHTIME = 15 * CH_FRAME; -- ÿ15����ˢһ�ι�
	CH_VANISHTIME = 10 * CH_FRAME;	--ʥ�����ͣ��10����
	CH_RUNINTERVER = 30 * CH_FRAME; --30��һ�Σ����Թ�����Ϸ
	CH_MAXPLAYTIMES = 5; --ÿ�����һ����5��
	
	CH_PREPARETIME = 54; --׼������ʱ��
	CH_SMALLTIMERID = 55;	--ˢ�ּ�ʱ��
	CH_RUNTIMERID = 56;	--RunMission�õļ�ʱ����
	CH_INTERVER = 5 * CH_FRAME;	--5���Ӵ���ˢ�ֺ�����ִ�����
	CH_TOTALINTERVER = 60 * 60 * CH_FRAME; --1Сʱ֮��ر�Mission
	
	--GLBֵ
	GLB_CH_PHASE = 848;
	CHRISMAS_SHREWMOUSE = "Ho�t ��ng Gi�ng Sinh";
	--===============�͹����==================
	CH_NPCID = 1236;	--ˢ���ֵ�NCP index
	CH_MAPID = {582, 583};	--ʥ�����ͼId
	
	CH_SMALLMAPCOUNT = 12;	--һ����12��С��ͼ
	CH_MOUSECOUNT_MIN = 10;	--һ��С��ͼһ������ˢ������Ŀ
	CH_MOUSECOUNT_MAX = 10;	--һ��С��ͼһ�����ˢ������Ŀ
	--=========================================
	
	--=======================================
	CHRIMAS_SALEID = 136; --������������ID
	
	--=========�������===============��û�ж�����Ҫ��������
	TK_LEAVERMAPID = 2323;	--�洢�������mapid
	TK_LEAVERPOSX = 2324;	--�洢�뿪��Ϸ��x�����
	TK_LEAVERPOSY = 2325;	--�洢�뿪��Ϸ��y�����
	
	TK_DAYKEY = 2326;	--��¼����һ��
	TK_PLAYTIMES = 2327; --��¼һ������Ĵ���
	TK_PLAYMAXTIMES = 2521;--���μ�50��
	
	TK_COUNT_ONETIME = 2328;	--��¼һ�����˶��ٸ�
	
	TK_RANK = 2329;		--��¼һ����������
	
	TK_GROUPID = 2330;	--��¼��ҵ�Group��
	TK_EXP_BEISHU = 2331; --
	TK_EXP_TIME = 2332;
	--================================
	
	--=============������ʾս����==============
	CH_TOTALPOINT = 1;
	CH_GETITEM = 17;
	--=========================================
	
	--MS���֣�
	MS_STATE = 1;
	MS_TIMERSTATE = 2; --������¼���ڽ���Ľ���ˢ�ֺ�����֣�0������֣�1��ˢ����
	MS_NEWSVALUE = 3; --
	MS_BEGINGMAPID = 10; --��¼��ʼ�ĵ�ͼ��ID
	
	MS_PREPARENEWSVALUE = 5; --׼������ʱ����
	
	MSS_MOUSENAME = 1; --ʥ�����������
	
	
	--����ʥ�����
	function putfairy()
		local nNPCCount;
		local PosTab;	--���ڼ�¼
		local i, j;
		local nPosX, nPosY;
		local OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(CH_MAPID[2])
		local scriptfile = [[\script\missions\chrismas\npcs\shrewmouse.lua]];
		
		local name = GetMissionS(MSS_MOUSENAME);
		for i = 1, CH_SMALLMAPCOUNT do
			nNPCCount = random(CH_MOUSECOUNT_MIN, CH_MOUSECOUNT_MAX);
			local PosFile = format("\\settings\\maps\\chrismas\\elf_%d.txt", i);
			PosTab = getndata(PosFile, nNPCCount)

			tabadddiagnpc(PosTab, scriptfile, CH_NPCID, name)
		end;
		SubWorld = OldWorld;
	end;
	
	
	--���ʥ�����
	function clearfairy()
		local OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(CH_MAPID[2]);
		ClearMapNpcWithName(CH_MAPID[2], "Bao qu� gi�ng sinh");
		SubWorld = OldWorld;
	end;
	
	
	--���뵽��Ϸ��
	function joingame()
		local nNowTime = tonumber(date("%y%m%d"));
		if (GetTask(TK_PLAYMAXTIMES) >= 50) then
			Talk(1, "", "<color=yellow>�ng gi� Noen<color>: M�i ng��i ch� c� th� tham gia nhi�u nh�t 50 ��t t�m qu�, ng��i kh�ng th� tham gia ���c n�a!");
			return
		end;
		
		if (GetTask(TK_DAYKEY) ~= nNowTime) then
			SetTask(TK_DAYKEY, nNowTime);
			SetTask(TK_PLAYTIMES, 0);
		end;

		--���м���
		local nTimes = GetTask(TK_PLAYTIMES);
		if (GetTask(TK_PLAYTIMES) >= CH_MAXPLAYTIMES) then
			Talk(1, "", "<color=yellow>�ng gi� Noel<color>: 1 ng�y ch� thi ��u 5 tr�n!");
			return
		end;
		
		
		if (gb_GetTask("Ho�t ��ng Gi�ng Sinh", 1) ~= 1) then
			local nNowTime = tonumber(GetLocalDate("%H%M"));
			local bOn = 0;
			if ((nNowTime >=1900 and nNowTime <=2300) or (nNowTime >=1200 and nNowTime <=1400)) then
				bOn = 1;
			end;
			if (bOn == 0) then
				Talk(1, "", "<color=yellow>�ng gi� Noel<color>: M�i ng�y t� 12:00-4:00 v� bu�i t�i 19:00-23:00 tri�n khai ho�t ��ng Gi�ng Sinh,  hi�n t�i ch�a ��n th�i gian ho�t ��ng ho�c ho�t ��ng ch�a b�t ��u!");
				return
			else
				Talk(1, "", "<color=yellow>�ng gi� Noel<color>: Tr� ch�i �ang ti�n h�nh, h�y ch� l��t sau �i! M�i tr�n ��ng 15 ph�t, 30 ph�t, 45 ph�t b�t ��u.");
				return
			end;
		end;

		local szFile = [[\settings\maps\chrismas\player.txt]];
		local nPosX, nPosY;
		nPosX, nPosY = getadatatow(szFile, 2, 15);
		NewWorld(CH_MAPID[1], floor(nPosX / 32), floor(nPosY / 32));
	end;
	
	--��Ϸ����
	function gameover()
		local OldWorld = SubWorld;
		SubWorld = SubWorldID2Idx(CH_MAPID[2]);
		
		local pidx;
		local idx = 0;
		
		local OldPlayer = PlayerIndex;
		local tabPlayer = {};
		local i;
		for i = 1, 400 do
			idx, pidx = GetNextPlayer(CH_MISSIONID, idx, 0);
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
		elseif (nBeishu ~= 2 and nBeishu ~= 4) then
			return 1
		else
			return nBeishu;
		end
	end
	
	function setplayerreadystate()	--����뿪��Ϸ��ʱ�����״̬����
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
	
	function setplayerleaverstate()	--����뿪��Ϸ��ʱ�����״̬����
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
	
	function setplayerjoinstate()	--��ҽ�����Ϸ��ʱ�����״̬����
		ForbitSkill(1);
		SetMoveSpeed(18);
		
		SetTask(TK_PLAYTIMES, GetTask(TK_PLAYTIMES) + 1);
		SetTask(TK_PLAYMAXTIMES, GetTask(TK_PLAYMAXTIMES) + 1);
		--���������йصı������������ھ�����ս�ı�ĳ�������Ӫ�Ĳ���
		SetTaskTemp(200,1);
		--����ս��״̬
--		SetFightState(1);
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
			local nPlMsIdx = PIdx2MSDIdx(CH_MISSIONID, nPlIdx)	--����Ƿ���ָ��Mission��
			if (nPlMsIdx > 0) then
				return nPlIdx
			end
		end
	end
end;

function isXmasTime(bAward)
	local nDate = tonumber(GetLocalDate("%y%m%d"));
	if (bAward == 1) then
		if (nDate >= 061222 and nDate <= 070114) then
			return 1;
		end;
	elseif (nDate >= 061222 and nDate <= 070114) then
		return 1;
	end;
	return 0;
end;