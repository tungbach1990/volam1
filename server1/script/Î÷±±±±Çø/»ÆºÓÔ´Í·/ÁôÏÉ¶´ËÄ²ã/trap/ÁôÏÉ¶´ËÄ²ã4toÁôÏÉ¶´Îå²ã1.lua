--�������� ���ɶ��Ĳ�4to���ɶ����1
--TrapID���������� 37
--�ƺ�Դͷ�Թ� F4-F5 trap
-- by��Dan_Deng(2003-07-31)

function main(sel)
	Talk(1,"L60_q4","B�n nh�n th�y m�t c� quan, tr�n c� kh�c m�y d�ng ch�: ")
--	AddTermini(47)		--����ʲô������
end;

function L60_q4()
	Say("V� tr� l�c khai s�, ��t tr�i c�ch nhau kh�ng xa, lo�i ng��i c� th� b��c qua nh�ng b�c thang �� l�n Thi�n ��nh. Ng�c Ho�ng cho r�ng: ng��i ph�m v� thi�n th�n g�n g�i v�i nhau nh� v�y th�t l� h�n ��n, b�n l�nh c�c thi�n th�n l�m cho tr�i ��t c�ch xa nhau. Ng��ic� hi�u ���c � ngh�a huy�n b� c�a nh�ng c�u th�nh ng� ph�a d��i kh�ng?",4,"Tr�i hoang, ��t gi� /L60_S4_wrong","��t tr�i ph�n ��i /L60_S4_correct","Tr�i Nam, ��t B�c /L60_S4_wrong","Tr�i cao, ��t d�y /L60_S4_wrong")
end

function L60_S4_correct()
	UTask_kl = GetTask(9)
	if (GetFaction() == "kunlun") and ((UTask_kl >= 70*256) or ((UTask_kl == 60*256+20) and (HaveItem(14) == 1))) then
--	if ((UTask_kl == 60*256+20) and (HaveItem(14) == 1)) then
		Msg2Player("B�n h�y �n v�o ��p �n th� 2 ngay tr��c m�t, c� quan s� kh�i ��ng ��a ng��i l�n t�ng th� 5 ")
		SetFightState(1);
		NewWorld(129, 1694, 3143);
	else
		Msg2Player("B�n �n lo�n x� v�o nh�ng k� t�, nh�ng kh�ng th�y ph�n �ng g� ")
	end
end;

function L60_S4_wrong()
	Msg2Player("B�n �n lo�n x� v�o nh�ng k� t�, nh�ng kh�ng th�y ph�n �ng g� ")
end;
