Include("\\script\\item\\shengdan_jieri\\200811\\head.lua");

function main()
	christmas_resettask();
	SetTask(christmas_bingjing_taskid, 300000);
	Say("��i hi�p c� th� thu ���c kinh nghi�m cao nh�t l� 3 t�.", 0);
end