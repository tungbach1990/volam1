IncludeLib("BATTLE");
IncludeLib("SETTING");
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\battles\\seizegrain\\head.lua")

-- ������
-- Param3	������Ӫ
-- Param4	����ʣ����ʳ��������

function main()
	local npcidx = GetLastDiagNpc();
	local ncount = GetNpcParam(npcidx, 4);
	local ngharry_camp = GetNpcParam(npcidx, 3);
	local n_gharry_x = GetNpcParam(npcidx, 1);
	local n_gharry_y = GetNpcParam(npcidx, 2);
	-- ����ͬʱ����һ���������ˣ����ٲ���
	if (ncount == 0 ) then
		return
	end;
	
	-- �����ڽ�����
	if (GetMissionV(MS_STATE) ~= 2) then
		delnpcsafe(npcidx);
		print("graingharry Event error, because Mission no Start, yet");
		return 
	end
	
	local n_player_camp = GetCurCamp();
	local W,X1,Y1 = GetWorldPos();
	X1 = floor(X1 / 8);
	Y1 = floor(Y1 / 16);
	
	if (ngharry_camp == GetCurCamp()) then	-- ͬ����Ӫ�� ���԰���
	-- ����Ѿ�������ʱ����������һ��
		if (BT_GetData(PL_PARAM3) ~= 0) then
			Msg2Player("B�n �ang v�n chuy�n m�t bao l��ng, kh�ng th� mang th�m bao l��ng kh�c?");
			return
		end
		-- ����һ����������ʳ��������
		ncount = ncount - 1;
		SetNpcParam(npcidx,4,ncount);
		--1341
		--1342
		if (ngharry_camp == 1) then
			ChangeOwnFeature(0,0,1341);	-- �ı��������Ϊ������������
		else
			ChangeOwnFeature(0,0,1342);	-- �ı��������Ϊ������������
		end
		
		BT_SetData(PL_PARAM3, 1);
		
		Msg2Player("B�n �ang v�c m�t bao l��ng, h�y mau ch�ng v�n chuy�n ��n <color=yellow>B�n doanh<color> phe m�nh.");
		
		if (n_player_camp == 1) then
			Msg2MSAll(MISSIONID, format("<color=0x00FFFF>Phe T�ng<color=yellow>%s<color=0x00FFFF> t�i <color=yellow>%d, %d<color=0x00FFFF> �o�t ���c Bao l��ng, �ang quay v� <color=yellow>B�n doanh",
										GetName(),X1,Y1))
			AddSkillState(460, 1, 0, 1000000 ) --��ɫ�⻷���ֱ����
		else
			Msg2MSAll(MISSIONID, format("<color=0x9BFF9B>Phe Kim<color=yellow>%s<color=0x9BFF9B> t�i <color=yellow>%d, %d<color=0x9BFF9B> �o�t ���c Bao l��ng, �ang quay v� <color=yellow>B�n doanh",
											GetName(),X1,Y1))
			AddSkillState(461, 1, 0, 1000000 ) --��ɫ�⻷���ֱ����
		end
		
		AddSkillState(656,30,0,100000) --����ҵ��ٶ�
	else									-- ������Ӫ�Ļ�ʯ�ջ�
		local n_flint = CalcItemCount(3, 6, 1, 1763,-1);	-- �����еĻ�ʯ����
		if (n_flint > 0) then
			ConsumeItem(-1,1,6,1,1763,-1);	-- ɾ�����һ����ʯ
			ncount = 0;						-- ������ʳ��
			SetNpcParam(npcidx, 4, 0);
			delnpcsafe(npcidx);
			n_new_npcidx = sf_addgharry(ngharry_camp, n_gharry_x, n_gharry_y, 1);
			if (n_new_npcidx > 0) then
				AddNpcSkillState(n_new_npcidx, 705, 1,0, 10080)
				
				if (n_player_camp == 1) then
					Msg2MSAll(MISSIONID, format("<color=0x00FFFF>Phe T�ng <color=yellow>%s<color=0x00FFFF> t�i <color=yellow>%d, %d<color=0x00FFFF> �� thi�u h�y 1 Xe l��ng.",
												GetName(),X1,Y1));
				else
					Msg2MSAll(MISSIONID, format("<color=0x9BFF9B>Phe Kim <color=yellow>%s<color=0x9BFF9B> t�i <color=yellow>%d, %d<color=0x9BFF9B> �� thi�u h�y 1 Xe l��ng.",
												GetName(),X1,Y1));
				end
			end
			return 0;
		else
			Msg2Player("C�n c� <color=yellow>H�a th�ch<color> m�i c� th� thi�u h�y Xe l��ng.");
		end
	end
	
	if (ncount <= 0)  then
		delnpcsafe(npcidx);
	end
end;


-- ����
function OnDeath( nNpcIndex )
	local State = GetMissionV(MS_STATE) ;
	if (State ~= 2) then
		return
	end;
	
	--�������������Npc��ͳ������
	if (PlayerIndex == nil or PlayerIndex == 0) then
		return
	end;
	
	bt_addtotalpoint(BT_GetTypeBonus(PL_KILLRANK5, GetCurCamp()))-- �ӻ��� �ջ��൱��ɱһ����
	
	BT_SortLadder();
	BT_BroadSelf();
end;
