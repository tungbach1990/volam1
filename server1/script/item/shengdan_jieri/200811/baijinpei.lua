Include("\\script\\item\\shengdan_jieri\\200811\\head.lua");

function main()
	christmas_resettask();
	if (GetLevel() < 50 or GetExtPoint(0) < 1) then
		Say("Ng��i ch�i ph�i qua n�p th� v� ��ng c�p t� 50 tr� l�n m�i c� th� s� d�ng B�ch Kim B�i", 0);
	end
	if (GetTask(christmas_yupei_taskid) + 40000000 <= 200000000) then	
		SetTask(christmas_yupei_taskid, GetTask(christmas_yupei_taskid) + 40000000);
		AddOwnExp(40000000);
	else
		Say("�� ��t ��n gi�i h�n kinh nghi�m cho ph�p, kh�ng th� s� d�ng th�m B�ch Kim  B�i.", 0);
		return 1;
	end
end