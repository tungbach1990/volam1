Include("\\script\\item\\newyear_2009\\head.lua");

function main()
	newyear0901_resettask();
	
	local n_date	= tonumber(GetLocalDate("%Y%m%d"));
	if (n_date >= 20090216) then
		Say("V�t ph�m n�y �� qu� h�n.", 0);
		return 0;
	end
	
	if (GetTask(newyear0901_TSK_GetExp_Yanhua) + 200 > 20000) then
		Say("��i hi�p �� ��t ��n kinh nghi�m cao nh�t, v� v�y kh�ng th� s� d�ng th�m Ph�o Hoa M�ng Xu�n.", 0);
		return 1;
	end
	SetTask(newyear0901_TSK_GetExp_Yanhua, GetTask(newyear0901_TSK_GetExp_Yanhua) + 200);
	AddOwnExp(2000000);
	CastSkill(932, 1);
end