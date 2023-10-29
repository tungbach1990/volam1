Include([[\script\missions\chrismas\ch_head.lua]]);
Include("\\script\\maps\\newworldscript_default.lua")

function OnNewWorld(szParam)
	if (GetGlbValue(GLB_CH_PHASE) ~= 1) then	--ʱ���ѹ�
		Say("<color=yellow>�ng gi� Noel<color>: Xin l�i! B�n ��n tr� r�i. Ho�t ��ng v�a b�t ��u. �� ta ti�n ng��i v� nh�!", 0)
		NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY))
		return
	end
	
	local nPlayerCount = GetMSPlayerCount(CH_PREPAREMISSIONID, 0);
	if (nPlayerCount >= CH_ALL_MAXPLAYERCOUNT) then
		Talk(1, "", "<color=yellow>�ng gi� Noel<color>: S� ng��i tham gia ho�t ��ng �� qu� nhi�u, vui l�ng ��i l�n sau!");
		NewWorld(GetTask(TK_LEAVERMAPID), GetTask(TK_LEAVERPOSX), GetTask(TK_LEAVERPOSY))
		return
	end;
	
	setplayerreadystate();	--������ҽ�����Ϸ��״̬
	
	AddMSPlayer(CH_PREPAREMISSIONID, 1);
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	setplayerleaverstate();
	OnLeaveWorldDefault(szParam)
end
