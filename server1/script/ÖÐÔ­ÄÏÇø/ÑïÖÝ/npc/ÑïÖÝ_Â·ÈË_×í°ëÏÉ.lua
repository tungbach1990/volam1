-- ���� ·��NPC ����ɣ�ؤ��10������
-- by��Dan_Deng(2003-07-28)

function main()
	UTask_gb = GetTask(8)
	if (UTask_gb == 10*256+20) then		--10��������
		SetTask(8,10*256+30)
		Talk(5,"L10_question_1","H�o t�u ��y! Nu�t r�i v�n c�n ti�c ��y!...","Huynh l� T�y B�n Ti�n? ��y ch�ng ph�i l� Hu� Tuy�n t�u sao?","Kh�ng sai! Ta ch�nh l� T�y B�n Ti�n, ��y l� m� t�u Hu� Tuy�n t�u!","T�i h� l� �� t� C�i Bang, ng��ng m�t t�n huynh �� l�u! Kh�ng bi�t c� th� nh��ng cho t�i h� Hu� Tuy�n T�u ���c kh�ng?","N�u ng��i tr� l�i ��ng c�c c�u �� c�a ta, th� b�nh r��u n�y xin t�ng cho ng��i!")
	elseif (UTask_gb == 10*256+30) then		--���³���
		Talk(1,"L10_question_1","C�n ch�a ph�c? V�y ta s� th� ti�p!")
	elseif ((UTask_gb == 10*256+40) and (HaveItem(76) == 0)) then		--�����ҰѾ�Ū����
		Talk(3,"","C�i g�! Ng��i l�m m�t b�nh r��u r�i �!","�i! M� t�u c�a ta!","T�t l�m! Xem ra ng��i c�ng c� ch�t ki�n th�c v� r��u! T�ng ng��i ��y!")
		AddEventItem(76)
		Msg2Player("C� r��u Hu� tuy�n ")
	else
		Talk(1,"","C�n v�i ta 1 ly n�o! zd�!")
	end
end;

function L10_question_1()
	Say("C�u th� nh�t: ch� 'Hu� Tuy�n' trong hu� Tuy�n t�u l� ch� c�i g�?",4,"T�n ng��i /L10_wrong","T�n ��a danh /L10_wrong","N��c su�i /L10_question_2","T�n h� /L10_wrong")
end;

function L10_question_2()
	Say("C�u th� 2: 'C� ��u k�ch minh nguy�t, ��i �nh th�nh k� nh�n' l� c�i g�?",4,"Nhi�u ng��i /L10_wrong","3 ng��i /L10_question_3","2 ng��i /L10_wrong","1 ng��i /L10_wrong")
end;

function L10_question_3()
	Say("C�u th� 3: d��i ��y ch� n�o l� ch� t�n r��u:",4,"Ng�c D�ch /L10_wrong","Qu�nh nh��ng /L10_wrong","L�c ngh� /L10_wrong","Ph� th�y /L10_correct")
end;

function L10_wrong()
	Talk(1,"","sai r�i! Xem ra ng��i kh�ng c� duy�n v�i b�nh r��u n�y r�i!")
end;

function L10_correct()
	Talk(1,"","T�t l�m! Xem ra ng��i c�ng c� ch�t ki�n th�c v� r��u! T�ng ng��i ��y!")
	AddEventItem(76)
	SetTask(8,10*256+40)
	AddNote("C� r��u Hu� tuy�n ")
	Msg2Player("C� r��u Hu� tuy�n ")
end;
