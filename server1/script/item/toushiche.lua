Include("\\script\\missions\\citywar_city\\head.lua");
CityWarID = 221;--����ս�ĵ�ͼID
MSBegin = MS_TSCBEGIN;
Count = g_nMaxTscPerDoor * g_nDoorCount;
NpcTempl = 525;
NpcLevel = 60;

function main()

--����ǰλ���Ƿ��ڹ���ս��ͼ��
W,X,Y = GetWorldPos();
nSubWorldID = SubWorldIdx2ID();

if (nSubWorldID ~= CityWarID) then 
	Msg2Player("B�n kh�ng th� s� d�ng H�n Th�ch Li�t t�i ��y ")
	return 1;
end

if (GetCurCamp() ~= 2) then 
	Msg2Player("Ch� c� phe C�ng Th�nh m�i ���c s� d�ng H�n Th�ch Li�t ")
	return 1
end;

PosId = GetNearstPos(X*32,Y*32, TscPos);

if (PosId == 0) then 
	Say("B�n ��ng c�ch H�n Th�ch Li�t qu� xa, kh�ng th� s� d�ng! ",0)
	return 1
end;

DoorId = floor( (PosId - 1) / g_nMaxTscPerDoor ) + 1;

if (GetMissionV(MS_DOORBEGIN + DoorId - 1)  ~= 0 and (mod(PosId, 3) == 2) ) then 
	Msg2Player("Th�nh m�n ngay ph�a tr��c m�t ng��i v�n ch�a b� c�ng ph�, v� tr� n�y ���ng nhi�n l� kh�ng th� d�ng ���c H�n Th�ch Li�t ")
	return 1
end;

if (GetMissionV(MSBegin + PosId - 1) == 0) then 
	ToolIndex = AddNpc(NpcTempl, NpcLevel, SubWorld, TscPos[PosId][1], TscPos[PosId][2], 1, "", 1);
	if (ToolIndex > 0) then
		SetNpcCurCamp(ToolIndex, 2);
		SetNpcDeathScript(ToolIndex, "\\script\\missions\\citywar_city\\tooldeath.lua");
		SetMissionV(MSBegin + PosId -1, ToolIndex); 
		Msg2MSAll(MISSIONID, GetName().."B� tr� th�m m�t c�i H�n Th�ch Li�t, h� tr� C�ng Th�nh ");
		SetMangonelParam(ToolIndex, TscPos[PosId][3], TscPos[PosId][4], 200);
		WriteLog(GetLoop()..GetName()..":AddHSL"..ToolIndex)
		return 0
	end;
else
	Msg2Player("��i di�n v�i b�n �� ���c b� tr� m�t c�i H�n Th�ch Li�t, t�m th�i kh�ng th� b� tr� th�m n�a ");
	return 1
end;

return 0;
end;
