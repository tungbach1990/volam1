--�������� ���ɶ�һ��6to���ɶ�����3
--TrapID���������� 25
-- by��Dan_Deng(2003-07-31)

function main(sel)
	Talk(1,"L60_q1","B�n nh�n th�y m�t c� quan, tr�n c� kh�c m�y d�ng ch�: ")
--	AddTermini(47)		--����ʲô������
end;

function L60_q1()
	Say("Trong truy�n thuy�t Ph�c Hy l� con trai th�n S�m,�ng ta �� l�y ���c c�i chu�ng l�a t� trong l�a s�m t� nhi�n m� �em cho nh�n gian, sau th�i Ph�c Hy, l�i c� c�i khoan...c�ch th�c l�y l�a n�y do ai ph�t minh ra v�y? ",4,"M�c M�u /L60_S1_wrong","T�y Nh�n /L60_S1_correct","N� Oa /L60_S1_wrong","V��ng M�u /L60_S1_wrong")
end

function L60_S1_correct()
	UTask_kl = GetTask(9)
	if (GetFaction() == "kunlun") and ((UTask_kl >= 70*256) or ((UTask_kl == 60*256+20) and (HaveItem(11) == 1))) then
		Msg2Player("B�n nh�n th�y m�t C� quan, b�n tr�n c� kh�c m�y d�ng ch�: ")
		SetFightState(1);
		NewWorld(126,1483,3039)
	else
		Msg2Player("B�n �n lo�n x� v�o nh�ng k� t�, nh�ng kh�ng th�y ph�n �ng g� ")
	end
end;

function L60_S1_wrong()
	Msg2Player("B�n �n lo�n x� v�o nh�ng k� t�, nh�ng kh�ng th�y ph�n �ng g� ")
end;
