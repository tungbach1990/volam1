-- ��ʳ��
IncludeLib("BATTLE");
IncludeLib("SETTING");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizegrain\\head.lua")

function main()
	local npcidx = GetLastDiagNpc();
	
	-- ����ͬʱ����һ���������ˣ����ٲ���
	if (GetNpcParam(npcidx, 4) == 0 ) then
		return
	end;
	
	-- �����ڽ�����
	if (GetMissionV(MS_STATE) ~= 2) then
		delnpcsafe(npcidx);
		print("flagobj Event error, because Mission no Start, yet");
		return 
	end
	
	-- ����Ѿ�������ʱ������������һ��
	if (BT_GetData(PL_PARAM3) ~= 0) then
		Msg2Player("B�n �ang v�n chuy�n m�t bao l��ng, kh�ng th� mang th�m bao l��ng kh�c?");
		return
	end
	
	-- �����ķ���������ʳ�������������͡�����Ȼ���˻ر�����Ӫ
	BT_SetData(PL_PARAM3, 1);
	
	Msg2Player("B�n �ang v�c m�t bao l��ng, h�y mau ch�ng v�n chuy�n ��n b�n doanh phe m�nh.");
	if (GetCurCamp() == 1) then
		ChangeOwnFeature(0,0,1341);	-- �ı��������Ϊ������������
	else
		ChangeOwnFeature(0,0,1342);	-- �ı��������Ϊ������������
	end
	
	local W,X1,Y1 = GetWorldPos();
	if (GetCurCamp() == 1) then
		Msg2MSAll(MISSIONID, format("<color=0x00FFFF>Phe T�ng<color=yellow>%s<color=0x00FFFF> t�i <color=yellow>%d, %d<color=0x00FFFF> �o�t ���c Bao l��ng, �ang quay v� <color=yellow>B�n doanh",
										GetName(),X1,Y1))
		AddSkillState(460, 1, 0, 1000000 ) --��ɫ�⻷���ֱ����
	else
		Msg2MSAll(MISSIONID, format("<color=0x9BFF9B>Phe Kim<color=yellow>%s<color=0x9BFF9B> t�i <color=yellow>%d, %d<color=0x9BFF9B> �o�t ���c Bao l��ng, �ang quay v� <color=yellow>B�n doanh",
										GetName(),X1,Y1))
		AddSkillState(461, 1, 0, 1000000 ) --��ɫ�⻷���ֱ����
	end
		
	AddSkillState(656,30,0,100000) --����ҵ��ٶ�
	
	SetNpcParam(npcidx,4,0)
	delnpcsafe(npcidx);
end;
