Include([[\script\missions\tong\collectgoods\head.lua]]);
Include("\\script\\maps\\newworldscript_default.lua")

function OnNewWorld(szParam)
	if (GetGlbValue(GLB_COLLG_PHASE) ~= 1) then	--ʱ���ѹ�
		Say("<color=yellow>T�ng qu�n Ho�t ��ng ph��ng<color>: Th�t ng�i qu�, ng��i d�n ���ng v�a ��a m�t s� hi�p kh�ch �i r�i, m�t l�c sau m�i quay v�, h�y ��i ��t sau v�y.", 0)
		Msg2Player("Ho�t ��ng �ang di�n ra, h�y ch� ��i ��t ho�t ��ng sau.");
		NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY))
		return
	end
	
	local nPlayerCount = GetMSPlayerCount(COLLG_PREPAREMISSIONID, 0);
	if (nPlayerCount >= COLLG_ALL_MAXPLAYERCOUNT) then
		Talk(1, "", "<color=yellow>T�ng qu�n Ho�t ��ng ph��ng<color>: �� �� nh�n s� tham gia ho�t ��ng, ng��i h�y ��i ��t sau!");
		NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY))
		return
	end;
	
	collg_setplayerreadystate();	--������ҽ�����Ϸ��״̬
	AddMSPlayer(COLLG_PREPAREMISSIONID, 1);
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	collg_setplayerleaverstate();
	OnLeaveWorldDefault(szParam)
end
