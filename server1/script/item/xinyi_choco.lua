IL("SETTING")
IL("LEAGUE")
Include("\\script\\lib\\gb_modulefuncs.lua")

TSK_VALENTINE = 1553
function main(nItemIdx)
if (gb_GetModule("L� v�t t�nh nh�n") == 1) then
	if (GetSex() == 0) then
		if (GetTask(TSK_VALENTINE) >= 99) then
			Say("<#> B�n �� �n <color=yellow>99 mi�ng S� c� la t�nh y�u<color>, ti�p t�c �n coi ch�ng s�u r�ng ��y!", 0)
			return 1
		end
		AddOwnExp(1000000)
		AddSkillState(440, 20, 1,32400)--30�����ڻ��˫������ʱ�䡣
		AddSkillState(450, 20, 1,32400)--����ֵ30����������20�㡣
		SetTask(TSK_VALENTINE, GetTask(TSK_VALENTINE) + 1)
		if (GetTask(TSK_VALENTINE) == 99) then
			Msg2Player("<#> B�n s� d�ng m�t ��a hoa h�ng t�nh � nh�n ���c 100 v�n �i�m kinh nghi�m, t�ng ��i kinh nghi�m + 20 �i�m may m�n trong n�a gi� ")
		else
			Msg2Player("<#> B�n �n m�t mi�ng S� c� la t�nh y�u nh�n ���c 100 v�n �i�m kinh nghi�m, kinh nghi�m t�ng ��i + 20 �i�m may m�n trong n�a ti�ng. B�n c�n c� th� s� d�ng"..(99 - GetTask(TSK_VALENTINE)).."mi�ng S� c� la t�nh y�u.")
		end
		return
	else
		Msg2Player("<#> Ch� c� tr�ng s� m�i ���c �n S� c� la t�nh y�u th�i!")
		return 1
	end
end
end