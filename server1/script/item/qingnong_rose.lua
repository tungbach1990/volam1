IL("SETTING")
IL("LEAGUE")
Include("\\script\\lib\\gb_modulefuncs.lua")

TSK_VALENTINE = 1553
function main()
if (gb_GetModule("L� v�t t�nh nh�n") == 1) then
	if (GetSex() == 1) then
		if (GetTask(TSK_VALENTINE) >= 99) then
				Say("<#> B�n �� s� d�ng <color=yellow>99 ��a hoa h�ng t�nh �<color>, l�m �� trang s�c d� b� �� k� l�m ��!", 0)
				return 1
		end
		AddOwnExp(1000000)
		AddSkillState(440, 20, 1,32400)--30�����ڻ��˫������ʱ�䡣
		AddSkillState(450, 20, 1,32400)--����ֵ30����������20�㡣
		SetTask(TSK_VALENTINE, GetTask(TSK_VALENTINE) + 1)
		if (GetTask(TSK_VALENTINE) == 99) then
			Msg2Player("<#> B�n s� d�ng m�t ��a hoa h�ng t�nh � nh�n ���c 100 v�n �i�m kinh nghi�m, t�ng ��i kinh nghi�m + 20 �i�m may m�n trong n�a gi� ")
		else
			Msg2Player("<#> B�n �� s� d�ng m�t ��a hoa h�ng t�nh � nh�n ���c 100 v�n �i�m kinh nghi�m, ��ng th�i n�i trong n�a gi� t�ng ��i �i�m kinh nghi�m + 20 �i�m may m�n. B�n c�n c� th� s� d�ng"..(99 - GetTask(TSK_VALENTINE)).."��a hoa h�ng t�nh �.")
		end
		return
	else
		Msg2Player("<#> Ch� c� ph�i n� m�i s� d�ng ���c hoa h�ng t�nh � th�i!")
		return 1
	end
end
end