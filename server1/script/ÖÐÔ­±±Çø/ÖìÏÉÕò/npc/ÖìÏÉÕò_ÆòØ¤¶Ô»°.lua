--��ԭ���� ������ ·����ؤ�ĶԻ�
--��������������: ���ֻ�
--by Dan_Deng(2003-07-21)

--ʹ�ñ���: UTask_world40,GetTask(68)

function main()
	UTask_world40 = GetTask(68)
	if (UTask_world40 == 2) then
		Talk(6,"","Nghe n�i ng��i nh�t ���c chi�c nh�n. �� l� c�a Song Song c� n��ng trong th�n ��nh r�i, ng��i c� th� tr� l�i kh�ng?"," Ta ch�ng c� g� �n c�, ph�i cho ta c�i g� m�i ���c.","�.. (Ng��i ch�ng ph�i �n c�m sao?) ......Ng��i mu�n g�?","Ta mu�n �n m�t ph�n ��u h� Ng� H��ng.","Ng��i ��i h�i nhi�u qu� ��y.","Mu�n hay kh�ng mu�n, ng��i t� quy�t ��nh �i.")
		Msg2Player("Ng��i �n m�y mu�n ��i nh�n c�a Song Song c� n��ng l�y ��u ph� Ng� H��ng. ")
		AddNote("Ng��i �n m�y mu�n ��i nh�n c�a Song Song c� n��ng l�y ��u ph� Ng� H��ng. ")
		SetTask(68,3)
	elseif ((UTask_world40 == 3) and (HaveItem(187) == 1)) then
		Talk(3,"","��u h� Ng� H��ng c�a ng��i ��y.","A! ��ng l� ��u h� ch�nh t�ng Chu Ti�n r�i, th�m qu�!","���c! V�y ��a nh�n cho ta.")
		DelItem(187)
		AddEventItem(191)
		Msg2Player("L�y ���c nh�n c�a Song Song c� n��ng. ")
		AddNote("��a ��u ph� Ng� H��ng cho ng��i �n m�y, l�y ���c nh�n cho Song Song c� n��ng. ")
--		SetTask(68,5)
	else
		i = random(0,1)
		if (i == 0) then
			Talk(1,"","H�y b� th� cho k� ngh�o n�y b�t c�m ngu�i!")
		else
			Talk(1,"","N�m ph�i n�ng, b�t con r�n. Nh�ng l�c th� n�y, th�n ti�n c�ng kh�ng ��i!")
		end
	end
end;
