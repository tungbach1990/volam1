-- �꾩 ·��NPC ��ʿ��������������
-- by��Dan_Deng(2003-08-01)

function main()
	Uworld38 = GetByte(GetTask(38),2)
	if ((Uworld38 == 10) and (HaveItem(218) == 0)) then		--�������������
		Say("Thi�u L�m? Th�n �ang � trong l�nh ��a c�a ��i Kim qu�c n�y m� v�n c�n t�m tr� ngh� ��n b�n Thi�u L�m x�o quy�t kia �? ",2,"Ki�n tr� /enroll_S3_step2","Ti�p t�c suy ngh� /enroll_S3_wrong")
	else
		Talk(1,"","Ch� c� ng��i n�o c� ���c ph�m ch�t ki�n tr� b�t bi�n th� m�i c� th� th�c hi�n l� t��ng c�a m�nh.")
	end
end;

function enroll_S3_step2()
	Talk(1,"enroll_S3_step3","H�o ti�u t�, c�n d�m ��ng ng�nh �?")
	Msg2Player("��nh cho ng��i m�t tr�n th�t �au ��n ")
end;

function enroll_S3_step3()
	Say("Ta cho ng��i th�m m�t c� h�i. N�i! Ng��i c� gh�t c�i b�n Thi�u L�m �� kh�ng?",2,"V�n c� ki�n tr� /enroll_S3_correct","Ti�p t�c suy ngh� /enroll_S3_wrong")
end;

function enroll_S3_correct()
	Talk(1,"","Kh� l�m! Ch� c� ng��i n�o c� ���c ph�m ch�t ki�n tr� b�t bi�n th� m�i c� t� c�ch l�m n�n ��i s�. T�ng ng�oi m�n n�y. ")
	AddEventItem(218)
	Msg2Player("Nh�n ���c Ki�n Tinh Th�ch ")
	AddNote("Ch�ng minh ���c s� ki�n quy�t c�a m�nh, nh�n ���c Ki�n Tinh Th�ch ")
end;

function enroll_S3_wrong()
	Talk(1,"","C�i t�n ngu ng�c n�y! ��ng c� l�m � nh�c b�n ch� 'Ki�n nh�n b�t b�t' �� nh�!")
end;
