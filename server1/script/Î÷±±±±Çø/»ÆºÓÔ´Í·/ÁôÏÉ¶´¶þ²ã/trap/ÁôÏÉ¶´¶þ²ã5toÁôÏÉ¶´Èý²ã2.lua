--�������� ���ɶ�����5to���ɶ�����2
--TrapID���������� 29
--�ƺ�Դͷ�Թ� F2-F3 trap
-- by��Dan_Deng(2003-07-31)

function main(sel)
	Talk(1,"L60_q2","B�n nh�n th�y m�t c� quan, tr�n c� kh�c m�y d�ng ch�: ")
--	AddTermini(47)		--����ʲô������
end;

function L60_q2()
	Say("Vi�m �� v�n l� th�n Th�i D��ng, c�ng l� v� th�n n�ng nghi�p, �ng �y b�o m�t tr�i ph�t ra �nh s�ng, gi�p cho ng� c�c sinh tr��ng. T� �� con ng��i tr�n m�t ��t kh�ng ph�i lo mi�ng c�m manh �o, v� v�y m�i ng��i t�n x�ng �ng l� Th�n N�ng th�. Th�n N�ng th� c�n l� v� th�n v� y d��c, �ng �� v� ng��i ta n�m qua h�ng tr�m lo�i c�, cu�i c�ng tr�ng ��c m� ch�t. Th�n L�a c� m�t c� con g�i, trong l�c �i ch�i � ��ng h�i ch�ng may b� ch�t �u�i, t� �� bi�n th�nh m�t con chim nh�, mi�ng ng�m h�n �� c�nh c�y th� v�o ��ng H�i, mu�n l�p ��y bi�n l�n. B�n c� bi�t con chim nh� �� t�n g� kh�ng?",4,"Khoa Ph� /L60_S2_wrong","Ngu C�ng /L60_S2_wrong","H�u Ngh� /L60_S2_wrong","Tinh V� /L60_S2_correct")
end

function L60_S2_correct()
	UTask_kl = GetTask(9)
	if (GetFaction() == "kunlun") and ((UTask_kl >= 70*256) or ((UTask_kl == 60*256+20) and (HaveItem(12) == 1))) then
--	if ((UTask_kl == 60*256+20) and (HaveItem(12) == 1)) then
		Msg2Player("B�n nh�n v�o ��p �n th� t�, C� quan s� ��a b�n ��n t�ng th� ba. ")
		SetFightState(1);
		NewWorld(127, 1614, 3083);
	else
		Msg2Player("B�n �n lo�n x� v�o nh�ng k� t�, nh�ng kh�ng th�y ph�n �ng g� ")
	end
end;

function L60_S2_wrong()
	Msg2Player("B�n �n lo�n x� v�o nh�ng k� t�, nh�ng kh�ng th�y ph�n �ng g� ")
end;
