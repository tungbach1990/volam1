--�������� ���ɶ����3to���ɶ�����
--TrapID���������� 41
-- by��Dan_Deng(2003-07-31)

function main(sel)
	Talk(1,"L60_q5","B�n nh�n th�y m�t c� quan, tr�n c� kh�c m�y d�ng ch�: ")
--	AddTermini(47)		--����ʲô������
end;

function L60_q5()
	Say("Ho�ng �� � trong trung t�m Thi�n ��nh, ph� t� �ng c� th� th�n h�u th�. Ho�ng �� ki�n t�o ra chi�c xe, v� v�y g�i l� 'Hi�n Vi�n Th�'. Ng��i c� bi�t 'Hi�n' l� ch� b� ph�n n�o trong chi�c xe kh�ng? ",4,"B�nh xe /L60_S5_wrong","Tr�c xe /L60_S5_wrong","Hai b�c t��ng s�c v�t b�ng g� /L60_S5_correct","Kh�c g� sau xe /L60_S5_wrong")
end

function L60_S5_correct()
	UTask_kl = GetTask(9)
	if (GetFaction() == "kunlun") and ((UTask_kl >= 70*256) or ((UTask_kl == 60*256+20) and (HaveItem(15) == 1))) then
--	if ((UTask_kl == 60*256+20) and (HaveItem(15) == 1)) then
		Msg2Player("B�n h�y �n v�o ��p �n th� ba, c� quan s� kh�i ��ng ��a ng��i ��n m�t m�t th�t ")
		SetFightState(1);
		NewWorld(130, 1547, 3143);
	else
		Msg2Player("B�n �n lo�n x� v�o nh�ng k� t�, nh�ng kh�ng th�y ph�n �ng g� ")
	end
end;

function L60_S5_wrong()
	Msg2Player("B�n �n lo�n x� v�o nh�ng k� t�, nh�ng kh�ng th�y ph�n �ng g� ")
end;
