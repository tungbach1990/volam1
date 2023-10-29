-- �ν����ʿ��֮�Ž�,�ٻ�������NPCʿ��2��
-- Liu Kuo
-- 2004.12.18
Include( "\\script\\item\\checkmapid.lua" )

function EatMedicine()	-- ͨ���ж�ս���ĵȼ�����ҵ���Ӫ����NPC
	if (GetFightState() == 0) then
		Say("Kh�ng th� s� d�ng trong t�nh tr�ng phi chi�n ��u!", 0)
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
	if (GetCurCamp() == 1) then
		if (GetMissionV(MS_CALLNPCCOUNT_S) >= MAX_CALLNPCCOUNT) then
			Msg2Player("Hi�n t�i s� l��ng hi�u gi�c Chi�n tr��ng s� d�ng �� v��t m�c, kh�ng th� s� d�ng ti�p n�a. ")
			return -1
		else
			SetMissionV(MS_CALLNPCCOUNT_S, GetMissionV(MS_CALLNPCCOUNT_S) + 1)
		end
	elseif (GetCurCamp() == 2) then
		if (GetMissionV(MS_CALLNPCCOUNT_J) >= MAX_CALLNPCCOUNT) then
			Msg2Player("Hi�n t�i s� l��ng hi�u gi�c Chi�n tr��ng s� d�ng �� v��t m�c, kh�ng th� s� d�ng ti�p n�a. ")
			return -1
		else
			SetMissionV(MS_CALLNPCCOUNT_J, GetMissionV(MS_CALLNPCCOUNT_J) + 1)		
		end
	end

	if ( GetLevel() >= 40 and GetLevel() <= 79) then	-- ����ս��
		if( GetCurCamp() == 1) then		-- �ٻ������ͬһ��Ӫ��NPC
			CallSjNpc( 682, 50, W, X, Y, " T�ng binh");
		elseif( GetCurCamp() == 2) then
			CallSjNpc( 688, 50, W, X, Y, "Kim binh");
		end
	elseif ( GetLevel() >= 80 and GetLevel() <= 119) then	-- �м�ս��
		if( GetCurCamp() == 1) then
			CallSjNpc( 682, 70, W, X, Y, " T�ng binh");
		elseif( GetCurCamp() == 2) then
			CallSjNpc( 688, 70, W, X, Y, "Kim binh");
		end
	else	-- �߼�ս��
		if( GetCurCamp() == 1) then
			CallSjNpc( 682, 90, W, X, Y, " T�ng binh");
		elseif( GetCurCamp() == 2) then
			CallSjNpc( 688, 90, W, X, Y, "Kim binh");
		end
	end
end	

function CallSjNpc(NpcId, NpcLevel, W, X, Y, Name)
	local playername = GetName();
	--for i = 1, 2 do
		AddNpc( NpcId, NpcLevel, SubWorldID2Idx(W), ( X -  3 ) * 32, Y * 32, 1, playername..Name, 0);
		AddNpc( NpcId, NpcLevel, SubWorldID2Idx(W), ( X +  3 ) * 32, Y * 32, 1, playername..Name, 0);
	--end
	--for j = 1, 2 do
		--AddNpc( NpcId, NpcLevel, SubWorldID2Idx(W), ( X - j * 3 ) * 32, Y * 32, 1, playername.."���ξ�ʿ��", 0);
	--end
	--AddNpc( NpcId, NpcLevel, SubWorldID2Idx(W), X * 32, ( Y + 3 ) * 32, 1, playername.."���ξ�ʿ��", 0);
end