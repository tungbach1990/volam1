Include("\\script\\missions\\citywar_city\\head.lua");
CityWarID = 221;--����ս�ĵ�ͼID
MSBegin = MS_GCCBEGIN;
Count = g_nMaxGccPerDoor * g_nDoorCount;
NpcTempl = 524;
NpcLevel = 60;

function main()
--����ǰλ���Ƿ��ڹ���ս��ͼ��
W,X,Y = GetWorldPos();
nSubWorldID = SubWorldIdx2ID();

if (nSubWorldID ~= CityWarID) then 
	Msg2Player("B�n kh�ng th� s� d�ng Nghi�t Long Xung Xa t�i ��y! ")
	return 1;
end

if (GetCurCamp() ~= 2) then
	Msg2Player("Ch� c� phe C�ng Th�nh m�i c� th� s� d�ng Nghi�t Long Xung Xa! ")
	return 1;
end

PosId = GetNearstPos(X*32,Y*32, GccPos);
if (PosId == 0) then 
	Say("B�n ��ng c�ch Nghi�t Long Xung Xa qu� xa, kh�ng th� s� d�ng! ",0)
	return 1
end;



if (GetMissionV(MS_DOORBEGIN + PosId - 1)  == 0 ) then 
	Msg2Player("Th�nh m�n ph�a tr��c m�t ng��i �ang ��ng �� b� c�ng ph�, kh�ng th� s� d�ng Nghi�t Long Xung Xa ");
	return 1
end;

if (GetMissionV(MSBegin + PosId - 1) == 0) then 
	ToolIndex = AddNpc(NpcTempl, NpcLevel, SubWorld, GccPos[PosId][1], GccPos[PosId][2], 1, "", 1);
	if (ToolIndex > 0) then
		SetNpcCurCamp(ToolIndex, 2);
		SetNpcDeathScript(ToolIndex, "\\script\\missions\\citywar_city\\tooldeath.lua");
		SetMissionV(MSBegin + PosId -1, ToolIndex); 
		SetSiegeVoitureParam(ToolIndex, GetMissionV(MS_DOORBEGIN + PosId - 1))
		Msg2MSAll(MISSIONID, GetName().."S�p ��t th�m m�t chi�c Nghi�t Long Xung Xa, h� tr� C�ng Th�nh. ");
		WriteLog(GetLoop()..GetName()..":AddCC"..ToolIndex)
		return 0
	end;
else
	Msg2Player("Nghi�t Long Xung Xa m� b�n b� tr� tr��c ��y hi�n v�n c�n, t�m th�i kh�ng th� b� tr� th�m n�a ");
	return 1
end;

return 0;
end;
