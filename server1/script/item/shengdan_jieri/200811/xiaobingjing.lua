Include("\\script\\item\\shengdan_jieri\\200811\\head.lua");

function main()
	christmas_resettask();
	if (GetTask(christmas_bingjing_taskid) == 300000) then
		Say("��i hi�p �� s� d�ng ��i B�ng Tinh r�i, kh�ng th� ti�p t�c s� d�ng n�a.", 0);
		return 1;
	end
	SetTask(christmas_bingjing_taskid, 200000);
	Say("Hi�n t�i ��i hi�p c� th� thu ���c kinh nghi�m cao nh�t l� 2 t�.", 0);
end