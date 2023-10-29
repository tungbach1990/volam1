Include("\\script\\missions\\challengeoftime\\include.lua")
function main()
	if (GetLevel() < 90 or GetExtPoint(0) == 0) then
		Say("Ng��i ch�i ph�i c�p 90 tr� l�n v� �� n�p th� m�i s� d�ng ���c", 0);
		return 1
	end
	
	ndate = tonumber(GetLocalDate("%y%m%d"));
	if (ndate ~= GetTask(%TSK_Longxuewan_Date)) then
		SetTask(%TSK_Longxuewan_Date, ndate);
		SetTask(%TSK_Longxuewan_Use, 0);
		SetTask(%TSK_Longxuewan_avail, 0);
		if (ndate ~= GetTask(1551)) then
			SetTask(1551, ndate);
			SetTask(1550, 1);
		end
	end
		
	if(GetTask(%TSK_Longxuewan_Use) >= 2) then
		Say("M�i ng�y m�i ng��i ch� ���c s� dung 2 Long Huy�t Ho�n", 0);
		return 1
	end
	

	SetTask(1550, GetTask(1550) + 1);
	SetTask(%TSK_Longxuewan_Use, GetTask(%TSK_Longxuewan_Use) + 1);
	SetTask(%TSK_Longxuewan_avail, GetTask(%TSK_Longxuewan_avail) + 1);
	Say("Thu ���c th�m c� h�i 1 l�n tham gia ho�t ��ng <th�ch ��u th�i gian>!", 0);
end