--��ս�������ʱ�Ļص�����
--�ⲿ���ñ��ļ�ʱ�����붨�����к���
--GetBonus(); --��Ҫ�ⲿ����ú��������ڽ���Launcher��ҡ�
Include("\\script\\missions\\csbattlelib\\csbattlehead.lua");

function OnDeath(Launcher)
	curcamp = GetCurCamp();
	DelMSPlayer(2,GetCurCamp());
	--ɾ����ɫ��MissionGroup����Զ�����Mission��OnLeave()���������ú���������ȫ����������״̬�Ĺ���
	--�����ݾ������е㲻ͬ����û������˳���ͼ��������Ҫ����������Ϊ��Ҫ��RevID��
	if (curcamp ~= 4) then 
		SetLogoutRV(1);
	end;
	

	PlayerIndex1 = NpcIdx2PIdx(Launcher); -- murder����
	OrgPlayer  = PlayerIndex; --����
	DeathName = GetName();

	SetFightState(1)
	if (PlayerIndex1 > 0) then
		PlayerIndex = PlayerIndex1;
		LaunName = GetName();

		pkcount = GetTaskTemp(PLAYER_KILLCOUNT) + 1; --���㵱ǰ��pk����
		pkcount1 = GetTask(PLAYER_KILLCOUNT) + 1; --ͳ���ܹ���pk����
		SetTaskTemp(PLAYER_KILLCOUNT, pkcount);
		SetTask(PLAYER_KILLCOUNT, pkcount1);
		

		if ( curcamp == 1) then
			str  = "<#> phe V�ng:"..LaunName.."<#> tr�ng th��ng r�i ["..DeathName.."<#> ], PK ���c "..pkcount;
		elseif (curcamp == 2) then
			str  = "<#> phe T�m:"..LaunName.."<#> tr�ng th��ng r�i ["..DeathName.."<#> ], PK ���c "..pkcount;
		elseif (curcamp == 4) then 
			str = LaunName.."<#> tr�ng th��ng r�i ["..DeathName.."<#> ], PK ���c "..pkcount;
		end;
		
		GetBonus(); --�ú������ⲿ��ӣ����ڽ������
		
		Msg2MSAll(2,str);
		PlayerIndex = OrgPlayer;
	end;
	SetTaskTemp(PLAYER_KILLCOUNT, 0);
	
	if (curcamp == 4) then 
		SetCurCamp(GetCamp())
		SetPunish(1)--����PK�ͷ�
		SetPKFlag(0)--�ر�PK����
		SetTaskTemp(JOINSTATE, 0);
		ForbidChangePK(0);
		SetLogoutRV(0);--����������
		SetCreateTeam(1);
		SetDeathScript("");--���������ű�Ϊ��
		SetRevPos(99,43);
	else
		SetCurCamp(0);
	end;
		
	dcount = GetTaskTemp(PLAYER_DEATHCOUNT) + 1; --���㵱ǰ����������
	dcount1 = GetTask(PLAYER_DEATHCOUNT) + 1; --ͳ���ܹ��������ܴ���
	SetTaskTemp(PLAYER_DEATHCOUNT, dcount);
	SetTask(PLAYER_DEATHCOUNT, dcount1);
	SetTaskTemp(JOINSTATE, 0);
end;
