Include("\\script\\item\\shengdan_jieri\\200811\\head.lua");

function main()
	christmas_resettask();
	if (GetLevel() < 50 or GetExtPoint(0) < 1) then
		Say("Ng��i ch�i ph�i c� ��ng c�p t� 50 tr� l�n v� �� qua n�p th� m�i s� d�ng ���c Ho�ng Kim B�i.", 0);
	end
	if (GetTask(christmas_yupei_taskid) + 30000000 <= 200000000) then
		SetTask(christmas_yupei_taskid, GetTask(christmas_yupei_taskid) + 30000000);
		AddOwnExp(30000000);
	else
		Say("��i hi�p �� ��t ���c kinh nghi�m cao nh�t, v� v�y kh�ng th� ti�p t�c s� d�ng ho�ng kim b�i.", 0);
		return 1;
	end
end