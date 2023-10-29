-- �ν����������
-- �� ����������������������

Include( "\\script\\item\\checkmapid.lua" )

function EatMedicine(nItemIdx)	-- ͨ���ж�ս���ĵȼ�����ҵ���Ӫ����NPC
	if (GetFightState() == 0) then
		Say("Kh�ng th� s� d�ng � tr�ng th�i phi chi�n ��u!", 0)
		return -1
	end;
	tbPK_MAP = {357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374} -- ������ͼ��ֹʹ�úŽ�
	for j = 1, getn(tbPK_MAP) do
		if ( nMapId == tbPK_MAP[j] ) then
			Msg2Player("Trong khu v�c ��n ��u kh�ng th� s� d�ng v�t ph�m n�y!");
			return -1
		end
	end

	for j = 1, getn(tbCD_MAP) do
		if ( nMapId == tbCD_MAP[j] ) then
			Msg2Player("V�t ph�m n�y ch� c� th� s� d�ng � Chi�n tr��ng T�ng Kim");
			return -1
		end
	end
	
	local szNpcName = "";
	local n_player_camp = GetCurCamp();
	
	if (n_player_camp == 1) then
		if (GetMissionV(MS_WUXINGZHUCNT_S) >= MAX_CALLWUXINGZHU) then
			Msg2Player("S� tr� hi�n c� � chi�n tr��ng �� ��t gi�i h�n, kh�ng th� s� d�ng n�a.")
			return -1
		else
			SetMissionV(MS_WUXINGZHUCNT_S, GetMissionV(MS_WUXINGZHUCNT_S) + 1)
			szNpcName = "Phe T�ng - 	";
		end
	elseif (n_player_camp == 2) then
		if (GetMissionV(MS_WUXINGZHUCNT_J) >= MAX_CALLWUXINGZHU) then
			Msg2Player("S� tr� hi�n c� � chi�n tr��ng �� ��t gi�i h�n, kh�ng th� s� d�ng n�a.")
			return -1
		else
			SetMissionV(MS_WUXINGZHUCNT_J, GetMissionV(MS_WUXINGZHUCNT_J) + 1)
			szNpcName = "Phe Kim -	";
		end
	end
	
	local n_level = check_pl_level(GetLevel);
	local _, _, n_part = GetItemProp(nItemIdx);
	local tb_npc_level = {50, 70, 90};
	local tb_npc_id = {	[1768] = {id = 1343, szname="H�a Tr�"},
						[1769] = {id = 1344, szname="B�ng Tr�"},
						[1770] = {id = 1345, szname="��c Tr�"},
						[1771] = {id = 1346, szname="L�i Tr�"},
						[1772] = {id = 1347, szname="Kim Tr�"},
						};
	
	if (not n_level or not tb_npc_id[n_part]) then	--�����ڵ��ν�ȼ� ���� �����޷����ٻ�NPC��Ӧ
		return -1;
	end
	
	local n_npcidex = AddNpc( tb_npc_id[n_part].id, tb_npc_level[n_level], SubWorldID2Idx(W), (X - 3) * 32, Y * 32, 1, szNpcName..tb_npc_id[n_part].szname, 0);
	SetNpcCurCamp(n_npcidex, n_player_camp);
	
end	

