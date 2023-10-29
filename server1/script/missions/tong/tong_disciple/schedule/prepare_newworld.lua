Include([[\script\missions\tong\tong_disciple\head.lua]]);
Include("\\script\\maps\\newworldscript_default.lua")

function OnNewWorld(szParam)
	if (GetGlbValue(GLB_DIS_PHASE) ~= 1) then	--ʱ���ѹ�
		Say("<color=yellow>T�ng qu�n Ho�t ��ng ph��ng<color>: Th�t ��ng ti�c, ng��i ��n mu�n m�t r�i, ��i ��t ho�t ��ng sau v�y!", 0)
		NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY))
		return
	end
	
	local nPlayerCount = GetMSPlayerCount(DIS_PREPAREMISSIONID, 0);
	if (nPlayerCount >= DIS_ALL_MAXPLAYERCOUNT) then
		Talk(1, "", "<color=yellow>T�ng qu�n Ho�t ��ng ph��ng<color>: �� �� nh�n s� tham gia ho�t ��ng, ng��i h�y ��i ��t sau!");
		NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY))
		return
	end;
	
	setplayerreadystate();	--������ҽ�����Ϸ��״̬
	
	AddMSPlayer(DIS_PREPAREMISSIONID, 1);
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	setplayerleaverstate();
	OnLeaveWorldDefault(szParam)
end
