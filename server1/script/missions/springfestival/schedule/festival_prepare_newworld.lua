Include([[\script\missions\springfestival\festival_head.lua]]);
Include("\\script\\maps\\newworldscript_default.lua")

function OnNewWorld(szParam)
	if (GetGlbValue(GLB_FE_PHASE) ~= 1) then	--ʱ���ѹ�
		Say(FE_SIGNNPCNAME.."Xin l�i! B�n �� ��n tr�. Ho�t ��ng v�a m�i b�t ��u. ", 0)
		NewWorld(GetTask(TK_FE_LEAVERMAPID), GetTask(TK_FE_LEAVERPOSX), GetTask(TK_FE_LEAVERPOSY));
		return
	end
	
	local nPlayerCount = GetMSPlayerCount(FE_PREPAREMISSIONID, 0);
	if (nPlayerCount >= FE_ALL_MAXPLAYERCOUNT) then
		Say(FE_SIGNNPCNAME.."S� ng��i tham gia ho�t ��ng n�y �� ��, b�n h�y tham gia ��t sau!", 0);
		NewWorld(GetTask(TK_FE_LEAVERMAPID), GetTask(TK_FE_LEAVERPOSX), GetTask(TK_FE_LEAVERPOSY));
		return
	end;
	
	festival_setplayertoprepare();	--������ҽ�����Ϸ��״̬
	
	AddMSPlayer(FE_PREPAREMISSIONID, 1);
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	festival_setplayerleaverstate();
	OnLeaveWorldDefault(szParam)
end
