--description: ���̽�С�к�
--author: yuanlan	
--date: 2003/5/18
-- Update: Dan_Deng(2003-08-14)

function main()
	UTask_tr = GetTask(4);
	if (UTask_tr == 20*256+30) then
		AddNote("T�m ���c ��a b� � khu r�ng ph�a ��ng qu�ng tr��ng, tr� l�i c�u �� c�a n�. ")
		Msg2Player("T�m ���c ��a b� � khu r�ng ph�a ��ng qu�ng tr��ng, tr� l�i c�u �� c�a n�. ")
		Talk(3, "L20_Q1", "Anh b�n nh�, tr� l�i Nh�t Nguy�t Song Lu�n cho ta, ���c kh�ng?", "Mu�n ta tr� l�i Nh�t Nguy�t Song Lu�n c�ng ���c!nh�ng �� xem huynh c� th�ng minh h�n ng��i v�a r�i kh�ng ��?","C�u �� l�n n�y c�a ta s� kh�c, nghe k� nh�:")
	elseif (UTask_tr == 20*256+40) then 
		L20_Q1()
	elseif (UTask_tr == 20*256+50) then
		if (HaveItem(125) == 1) and  (HaveItem(126) == 1) then
			Talk(1,"","A! Ti�u Ho�ng! Ti�u Kh�i! B�n ng��i ch�ng kh�n lanh g� c�, l�n sau kh�ng ���c ch�y lung tung n�a! Hai c�i b�nh xe n�y kh�ng �n ���c c�ng kh�ng m�c ���c,ch� ���c c�i ��p m�t ch�t ch� th�t v� d�ng, ch� c� m�y ng��i ngu ng�c n�y m�i cho l� c�a qu�, th�i c�m l�y �i.")
			DelItem(125)
			DelItem(126)
			AddEventItem(58)
			Msg2Player("�em con Ti�u Ho�ng c�u v� con Ti�u Kh�i la tr� l�i cho c�u b�, ��i l�i c�p Nh�t Nguy�t Song Lu�n. ")
			SetTask(4, 20*256+80)
			AddNote("�em con Ti�u Ho�ng c�u v� con Ti�u Kh�i la tr� l�i cho c�u b�, ��i l�i c�p Nh�t Nguy�t Song Lu�n. ")
		else							--�Ѿ��ش����⣬��δ�ҵ�С�ƹ���С��¿
			Talk(1,"","Huynh gi�p ta t�m l�i <color=Red>Ti�u Ho�ng c�u<color> v� <color=Red>Ti�u Kh�i l�<color>, ta s� tr� Nh�t Nguy�t Song Lu�n l�i cho.")
		end
	elseif (UTask_tr == 20*256+80) and (HaveItem(58) == 0) then
		AddEventItem(58)
		Talk(1,"","Th�i c�m l�i Nh�t Nguy�t Song Lu�n n�y �i.")
	else				-- ȱʡ�Ի�
		if (random(0,1) == 0) then
			Talk(1,"","Ti�u Ho�ng v� Ti�u Kh�i r�t ���c vi�c v� trung th�nh, c� th� n�i kh�ng th� con th� n�o h�n ���c ch�ng!")
		else
			Talk(1,"","Ta c� con ch� Ti�u Ho�ng v� con l�a Ti�u Kh�i, ch�ng n� r�t th�ng minh, l� b�n ���ng t�t nh�t c�a ta.")
		end
	end
end;

function L20_Q1()
	Say("M�t nh� c� 3 anh em, trong �� ch� m�t ng��i th�ch n�i th�t, anh C� n�i anh Hai n�i d�i, anh Hai n�i em �t n�i d�i. Ng��i em �t nghe ���c th� n�i c� anh C� v� anh Hai ��u n�i d�i, v�y trong ba ng��i ai l� ng��i n�i th�t?", 3, "Anh c� /no", "Anh hai /L20_Q1_true", "Em �t /no")
end;

function L20_Q1_true()
	Talk(1,"","�.....Tuy huynh c� th�ng minh h�n m�t ch�t, nh�ng ngo�i ra c�ng ph�i nh� huynh t�m gi�p <color=Red>Ti�u Ho�ng <color> v� <color=Red>Ti�u Kh�i<color> �i l�c, ta m�i tr� Nh�t Nguy�t Song Lu�n.")
	SetTask(4, 20*256+50)
	AddNote("Tr� l�i ch�nh x�c, c�u b� y�u c�u b�n gi�p t�m Ti�u Ho�ng c�u v� Ti�u Kh�i la �i l�c. ")
	Msg2Player("Sau khi ��p ��ng c�u �� c�a c�u b�, n� y�u c�u b�n gi�p t�m Ti�u Ho�ng c�u v� Ti�u Kh�i la �i l�c. ")
end;

function no()
	Talk(1,"","Huynh c�ng nh� �ng kia, to�n ng��i ngu ng�c c�!")
	SetTask(4, 20*256+40)
end;
