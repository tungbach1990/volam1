Include("\\script\\missions\\citywar_city\\head.lua");
CityWarID = 221;--����ս�ĵ�ͼID
MSBegin = MS_TOOLBEGIN;
Count = g_nMaxToolCount;
NpcTempl = 527;
NpcLevel = 60;

function main()

--����ǰλ���Ƿ��ڹ���ս��ͼ��
W,X,Y = GetWorldPos();
nSubWorldID = SubWorldIdx2ID(SubWorld);

if (nSubWorldID ~= CityWarID) then 
	Msg2Player("B�n kh�ng th� s� d�ng V�n K� Binh ph� t�i ��y ")
	return 1;
end

if (GetCurCamp() ~= 1) then 
	Msg2Player("Ch� c� phe ph�ng th� m�i ���c s� d�ng V�n K� Binh ph� t�i ��y ")
	return 1
end;


bAdd = 0
for i  = 1, Count do 
	if (GetMissionV(MSBegin + i - 1) == 0) then 
		ToolIndex = AddNpc(NpcTempl, NpcLevel, SubWorld, X * 32, Y * 32, 1, GetName().." L�nh ��nh thu� ", 1);
		if (ToolIndex > 0) then
			SetNpcCurCamp(ToolIndex, 1);
			SetNpcDeathScript(ToolIndex, "\\script\\missions\\citywar_city\\tooldeath.lua");
			SetMissionV(MSBegin + i - 1, ToolIndex); 
			Msg2MSAll(MISSIONID, GetName().."Ph�i ��n m�t v� s� �� k�o c�, h� tr� chi�n ��u ");
			WriteLog(GetLoop()..GetName().."T�ng th�m m�t yaoqi"..ToolIndex)
			bAdd = 1
			return 0
		end;
	end;
end

if (bAdd == 0) then 
	Msg2Player("Tr��c m�t s� qu�n ph�i ��n h� tr� �� ��, t�m th�i kh�ng th� ph�i th�m n�a ")
	return 1
end;

return 0;
end;
