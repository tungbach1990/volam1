Include([[\script\missions\libfestival\head.lua]]);
Include("\\script\\maps\\newworldscript_default.lua")

function OnNewWorld(szParam)
	if (GetGlbValue(GLB_CO_PHASE) ~= 1) then	--ʱ���ѹ�
		Say(CO_SIGNNPCNAME.."Xin l�i! B�n �� ��n tr�. Ho�t ��ng v�a m�i b�t ��u. ", 0)
		NewWorld(GetTask(TK_CO_LEAVERMAPID), GetTask(TK_CO_LEAVERPOSX), GetTask(TK_CO_LEAVERPOSY));
		return
	end
	
	local nPlayerCount = GetMSPlayerCount(CO_PREPAREMISSIONID, 0);
	if (nPlayerCount >= CO_ALL_MAXPLAYERCOUNT) then
		Say(CO_SIGNNPCNAME.."S� ng��i tham gia ho�t ��ng n�y �� ��, b�n h�y tham gia ��t sau!", 0);
		NewWorld(GetTask(TK_CO_LEAVERMAPID), GetTask(TK_CO_LEAVERPOSX), GetTask(TK_CO_LEAVERPOSY));
		return
	end;
	
	newworld_in_add();
	playergetinprepare();	--������ҽ�����Ϸ��״̬
	AddMSPlayer(CO_PREPAREMISSIONID, 1);
	OnNewWorldDefault(szParam)
end

function OnLeaveWorld(szParam)
	newworld_out_add();
	playerleave();
	OnLeaveWorldDefault(szParam)
end
