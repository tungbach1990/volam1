--�������� ���ɶ�����3to���ɶ��Ĳ�1
--TrapID���������� 33
--�ƺ�Դͷ�Թ� F3-F4 trap
-- by��Dan_Deng(2003-07-31)

function main(sel)
	Talk(1,"L60_q3","B�n nh�n th�y m�t c� quan, tr�n c� kh�c m�y d�ng ch�: ")
--	AddTermini(47)		--����ʲô������
end;

function L60_q3()
	Say("Cha c�a Thi�u Ng� l� Th�i B�ch Kim Tinh,�ng s�ng trong m�t th�n l�ng ngh�o kh�,v� v�y ���c g�i  l� C�ng Tang th�...Thi�u Ng� �� t�ng thi�t l�p v��ng qu�c chim � ��ng ph��ng,b�ch quan v�n v� trong n��c ��u l� chim. Trong ��,chim y�n l� m�t trong b�n l� quan,ng��ic� bi�t ch��ng quan c�a n� l� l� quan n�o kh�ng? ",4,"Xu�n /L60_S3_correct","H� /L60_S3_wrong","Thu/L60_S3_wrong","��ng /L60_S3_wrong")
end

function L60_S3_correct()
	UTask_kl = GetTask(9)
	if (GetFaction() == "kunlun") and ((UTask_kl >= 70*256) or ((UTask_kl == 60*256+20) and (HaveItem(13) == 1))) then
--	if ((UTask_kl == 60*256+20) and (HaveItem(13) == 1)) then
		Msg2Player("B�n nh�n v�o ��p �n th� nh�t, C� quan s� ��a b�n ��n t�ng th� t�. ")
		SetFightState(1);
		NewWorld(128, 1586, 3217);
	else
		Msg2Player("B�n �n lo�n x� v�o nh�ng k� t�, nh�ng kh�ng th�y ph�n �ng g� ")
	end
end;

function L60_S3_wrong()
	Msg2Player("B�n �n lo�n x� v�o nh�ng k� t�, nh�ng kh�ng th�y ph�n �ng g� ")
end;
