IncludeLib("TONG")
Include("\\script\\tong\\tong_header.lua")

function main()
	local szTongName, nTongID = GetTongName();
	local GREADSEED_SEEDID_TASKID = 2310;
	local GREADSEED_TIME_TASKID = 2311;
	local nTime = GetCurrentTime();
	local nNpcIdx = GetLastDiagNpc();
	
	if (GetNpcParam(nNpcIdx, 4) == 1) then
		return
	end
	
	
	
	if (GetNpcParam(nNpcIdx, 2) == GetTask(GREADSEED_SEEDID_TASKID)) then
		if (nTime >= GetTask(GREADSEED_TIME_TASKID) + 60) then
			SetTask(GREADSEED_TIME_TASKID, 0);
			SetTask(GREADSEED_SEEDID_TASKID, 0);
			SetNpcParam(nNpcIdx, 4, 1)
			DelNpc(nNpcIdx);
			if (nTongID ~= 0 and TONG_GetTaskValue(nTongID, TONGTSK_HEROLING) >= 120) then
				AddEventItem(1121);
				Msg2Player("Nh�n ���c 1 m�t th�");
				AddItem(6,1,1257,1,1,1);
				AddItem(6,1,1257,1,1,1);
				Msg2Player("Nh�n ���c 2 t�m l�nh b�i vinh d�");
				Msg2SubWorld("<color=white>"..szTongName.."<color> bang h�i - "..GetName().."nh�n ���c m�t th�.");
			else
				Talk(1, "", "Kh�ng t�m th�y!! (phong m�t th� c� qu�i �y ��t nhi�n b�c ch�y, trong nh�y m�t ch� c�n l�i n�m tro t�n.)");
				Msg2Player("Phong H�a Anh H�ng L�nh bang h�i t�ch l�y kh�ng �� 120 c�i, kh�ng th� ti�p nh�n m�t th�.");
				Msg2SubWorld("<color=white>"..GetName().."<color>Bang h�i kh�ng �� �i�u ki�n tham gia ho�t ��ng m�t th�, m�t th� b� ti�u h�y.");
			end;
		else	--ʱ��û��60����;
			Msg2Player("B�n �� ch�n b�c m�t th� n�y, "..(60 - (nTime - GetTask(GREADSEED_TIME_TASKID))) .." gi�y sau s� nh�n ���c!")
		end;
	else
		Msg2Player("B�n �� l�a ch�n m�t th� n�y! 60 gi�y sau s� nh�n ���c.")
		SetTask(GREADSEED_TIME_TASKID, nTime);
		SetTask(GREADSEED_SEEDID_TASKID, GetNpcParam(nNpcIdx, 2));
	end;
end;