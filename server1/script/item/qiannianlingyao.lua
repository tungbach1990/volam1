IncludeLib("SETTING")

TSK_Lingyao_Date	= 2640

function main()
	if ((GetLevel() < 50 or GetExtPoint(0) == 0)and ST_IsTransLife() ~= 1) then
		Say("C�p 50 tr� l�n v� �� n�p th� m�i s� d�ng ���c", 0);
		return 1
	end
	
	ndate = tonumber(GetLocalDate("%y%m%d"));
	if (ndate ~= GetTask(TSK_Lingyao_Date)) then
		SetTask(TSK_Lingyao_Date, ndate);
		AddOwnExp(20000000);
	else
		Say("M�t ng�y ch� c� th� s� d�ng ���c 1 Thi�n Ni�n Linh D��c", 0);
		return 1
	end
	local nLastTime = FormatTime2Number(GetCurServerTime());
	Msg2Player(nLastTime)
end
