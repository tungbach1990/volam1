--����ս ��ת��ͼto��ս��ͼ�����Ƿ���
--Trap ID������ս
Include("\\script\\missions\\citywar_global\\head.lua");
Include("\\script\\missions\\citywar_city\\head.lua");
Include("\\script\\missions\\citywar_city\\camper.lua");

function main()
	SubWorldOld = SubWorld-- ��¼ԭʼ��SubWorld
	WorldID = SubWorldIdx2ID(SubWorld); --��õ�ǰ��ͼ��ID��
	
	idx = SubWorldID2Idx(221); --�����ս�����Ƿ��ڱ���������
	
	if (idx < 0) then 
		return --�������򷵻�
	end;
	
	SubWorld = idx;
	if (GetMissionV(MS_STATE) == 0) then 
		Say("Phe ta hi�n �ang t�p h�p chu�n b� v�o ��u tr��ng! Xin m�i ng��i h�y b�nh t�nh, chu�n b� tinh th�n!", 0);
		SubWorld = SubWorldOld;
		return
	end
	
	
	if (WorldID == 222) then  --�����ǰλ�������ط��ĺ󷽣����ʾ�����
		CheckAndJoin(1)
		SubWorld = SubWorldOld;
	else					--�����ǰλ�����ڹ����ĺ󷽣����ʾҪ���빥��
		--T = GetMissionV(MS_NEWSVALUE);
	
		--�ط��ȹ���5�����볡
		--if (T < 5) then 
		--	Say("Ŀǰ�ҷ��������ھۼ������̿��Խ���ս�����������������԰����꣡",0)
		--	return
		--end;
	
		CheckAndJoin(2)
		SubWorld = SubWorldOld;
	end;
end;

function CheckAndJoin(Camp)
	if (GetTongName() == GetMissionS(Camp)) then  --���ڸð�����ʾ���Ϊ��������������
		if (GetJoinTongTime() >= 7200) then
			if (GetTask(TV_TASKKEY) ~= GetMissionV(MS_KEY)) then
				BT_SetData(PL_KEYNUMBER, 0)
				BT_SetData(PL_TOTALPOINT, 0)
				SetTask(1017, 0)
				SetTask(TV_SERIESKILL_REALY,0)
				BT_SetData(PL_BATTLECAMP, 0)
				SetTask(TV_TASKKEY , GetMissionV(MS_KEY));
				BT_LeaveBattle()
				BT_ClearPlayerData()
			end;
			JoinCamp(Camp, 1);
		else
			if (JoinWithCard(Camp, 0) == 0) then 
				Say("Th�i gian b�n gia nh�p bang h�i qu� ng�n, kh�ng th� tham gia chi�n ��u!", 0);
			end;
		end;
	else
		JoinWithCard(Camp, 1)
	end;
end;

--return 0 ��ʾ����û�У� 1��ʾ�п�
function JoinWithCard(Camp, UI)
	CityID = GetWarOfCity();
	--�����ʹ�ù�Ʊ�볡������ֱ�ӷ���
	if (GetTask(TV_TASKKEY) == GetMissionV(MS_KEY) and GetTask(TV_TASKVALUE) == Camp) then
		JoinCamp(Camp,2)
	else
		if (CityID == 0) then 
			print("Error! CityID == 0");
			return 0
		end;
	
		--���û��Ʊ���ý�
		CardItemID = 0;
		Camp = 1;
		if (GetItemCountEx(CardTab[CityID * 2 - 1]) >= 1) then 
			CardItemID = CardTab[CityID * 2 - 1];
			Camp = 2;
		elseif (GetItemCountEx(CardTab[CityID * 2]) >= 1) then
			CardItemID = CardTab[CityID * 2];
			Camp = 1;
		else
			if (UI == 1) then
				Say("Ng��i kh�ng c� l�nh b�i l�m sao v�o ���c! �i �i!", 0);
			end

			SetPos(OuterPos[1][2], OuterPos[1][3])
			return 0
		end;

		life = GetItemLife(CardItemID);
		life = floor(life / 1440);
		if (life > 5) then
			DelItemEx(CardItemID);
			Say(format("L�nh b�i n�y t� %d ng�y tr��c �� h�t h�n, kh�ng th� d�ng ���c", life), 0);
			SetPos(OuterPos[1][2], OuterPos[1][3])
		else
			DelItemEx(CardItemID);
			BT_SetData(PL_KEYNUMBER, 0)
			BT_SetData(PL_TOTALPOINT, 0)
			SetTask(1017, 0)
			SetTask(TV_SERIESKILL_REALY,0)
			SetTask(TV_TASKID, MISSIONID)
			SetTask(TV_TASKKEY , GetMissionV(MS_KEY));
			SetTask(TV_TASKVALUE, Camp)
			SetTask(TV_CITYID, CityID)
			BT_LeaveBattle()
			BT_ClearPlayerData()
			JoinCamp(Camp,2)
		end
	end;
	return 1
end;
