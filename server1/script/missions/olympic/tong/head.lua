--�˳���Ϸ���������ID,Ҳ���Ǳ������Ǹ��ط���
CS_RevId = 176
CS_RevData = 67;

--����˫����Ӫʱ��λ��
CampPos1 = {1536 , 3223 }; 	--��ɫ
CampPos2 = {1563 , 3195 }; 	--��ɫ

FRAME2TIME = 18;
--��Ϸ���������
MAX_MEMBER_COUNT = 16;
MS_STATE = 1;
V_ID = 2; --ʤ������Ӫ
MS_TONG1ID = 1;--�������İ��ID
MS_TONG2ID = 2;

MS_TOTALPK = 250;--��¼��Ҵ���������ҵ��ܴ���

MS_ARENAID = 15;

TIME_NO3 = 25;		-- ��ᶨʱ������

TIMER_1 = 20 * FRAME2TIME; --20�빫��һ��ս��
GO_TIME = 6 ; -- �볡ʱ��Ϊ2����
END_TIME = 9 ; -- ����ʱ��3����

MS_NEWSVALUE = 9; --�����д�����ű����ĵط�
JOINSTATE = 242;
MISSIONID = 13;

TONGSCORE = 625;	-- ������� 

function GetLeavePos()
	return GetTask(300), GetTask(301), GetTask(302);
end;

-------------------------------------------------------------------------
--���Ҫ���뿪��Ϸ
function LeaveGame()
	camp = GetCamp();--�ָ�ԭʼ��Ӫ
	SetRevPos(CS_RevId, CS_RevData)
	SetPunish(1)--����PK�ͷ�
	SetPKFlag(0)--�ر�PK����
	SetTaskTemp(JOINSTATE, 0);
	ForbidChangePK(0);
	ForbitTrade(0);
	SetFightState(0);
	
	SetCurCamp(camp);
	SetLogoutRV(0);--����������
	SetCreateTeam(1);
	SetDeathScript("");--���������ű�Ϊ��
	NewWorld(GetLeavePos())
end;

function GameOver()
	PTab = {};
	for i = 1, 500 do 
		idx , pidx = GetNextPlayer(MISSIONID, idx, 0);
		if (idx == 0 ) then 
			break
		end
		PTab[i] = pidx;
	end
	
	PCount = getn(PTab);
	OldPlayer = PlayerIndex;
	for i  = 1, PCount do 
		PlayerIndex = PTab[i]
		if (GetCurCamp() == GetMissionV(V_ID)) then
			SetTask(TONGSCORE,1)
		end;
		LeaveGame()
	end;
	PlayerIndex = OldPlayer;
end;
-------------------------------------------------------------------------

