Include("\\script\\item\\newyear_2009\\head.lua");

function main()
	newyear0901_resettask();
	local ndate = tonumber(GetLocalDate("%Y%m%d"));
	if (ndate >= newyear0901_lazhu_expiredtime) then
		Msg2Player("V�t ph�m n�y �� qu� h�n.");
		return 0;
	end
	SetTask(newyear0901_TSK_GetExpUpLimit, 300000);
	Say("��i hi�p c� th� thu ���c kinh nghi�m cao nh�t l� 3 t�.", 0);
end