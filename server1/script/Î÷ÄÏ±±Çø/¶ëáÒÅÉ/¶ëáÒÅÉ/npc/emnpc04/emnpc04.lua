--description: �����ɺ���Ʈ
--author: yuanlan	
--date: 2003/3/3
-- Update: Dan_Deng(2003-08-12)

function main()
	UTask_em = GetTask(1);
	Uworld36 = GetByte(GetTask(36),1)
	if (Uworld36 == 40) then		--��������
		Msg2Player("Th� th�ch th� ba c�a H� Linh Phi�u l� ��i 3 c�u ��i. ")
		Say("Mu�i �� v��t qua 2 th� th�ch, c�ng c� ch�t b�n l�nh! Nh�ng n�u ��i ���c 3 v� ��i c�a ta, ta m�i ph�c mu�i. V� ��i th� nh�t l�: Nh�t ��n l�u th�y t�i ��n nguy�t.", 3, "B�n nh�p giang phong b�n nh�p v�n /True7", "Nh�t th�n t��ng t� nh�t th�n kh�i /False7", "B�n h�o xu�n th�y nh�t th�nh hoa /False7")
	elseif (Uworld == 60) then 					--���ǰ����
		Talk(1,"","Ch�c m�ng mu�i �� qua 3 c�a th� th�ch, h�y �i t�m S� mu�i <color=Red>T� V�n L�u<color>! C� ta �ang � <color=Red>l�i v�o To�n Thi�n Ph�<color>.")
--	elseif ((UTask_em > 5*256) and (UTask_em < 10*256)) then 					--��δ����
--		Talk(1,"","����Ʈ��Ҫ����뱾�ɣ�������ͨ��������Ŀ��飬Ȼ���ٴ������µõ��������⣬�㶼��������")
--	elseif (GetFaction() == "emei") then   				--�Ѿ����ţ���δ��ʦ
--		Talk(1,"","����Ʈ������������ͬ�źý����ˣ����濪�ģ�")
	elseif (UTask_em == 70*256) then							--�Ѿ���ʦ
		Talk(1,"","Tr�n ���ng phi�u b�t giang h�, nh� ��ng qu�n nh�ng t� mu�i n�i n�y! ")
	else
		Talk(1,"","Giang h� ��y hi�m �c, v� l�m ��y chuy�n th� phi!")
	end
end;

function False7()
Say("��i kh�ng ra �?", 3, "B�n nh�p giang phong b�n nh�p v�n /True7", "Nh�t th�n t��ng t� nh�t th�n kh�i /False7", "B�n h�o xu�n th�y nh�t th�nh hoa /False7");
end;

function True7()
Say("��i r�t ch�nh. V� ��i th� 2: T�c th�n thi�n ��a c�nh ho�i c� ", 3, "V�n l� bi thu th��ng t�c kh�ch /False8", "��n ��c Th��ng m�ng t� v�nh th� /True8", "Kh�ng m�nh tu� nguy�t d�ch tha �� /False8");
end;

function False8()
Say("Ch�u thua sao?", 3, "V�n l� bi thu th��ng t�c kh�ch /False8", "��n ��c Th��ng m�ng t� v�nh th� /True8", "Kh�ng m�nh tu� nguy�t d�ch tha �� /False8");
end;

function True8()
Say("Hay l�m! V� ��i th� 3 l�: Nh�t minh ph�n nh�t nguy�t", 3, "T� canh t�m th��ng �i�n /False9", "Nh�n khan m�n trung m�c /False9", "Ng� nh�c c�c kh�u s�n /True9");
end;

function False9()
Say("H�y ngh� l�i �i, ��ng ph� c�ng v� �ch! ", 3, "T� canh t�m th��ng �i�n /False9", "Nh�n khan m�n trung m�c /False9", "Ng� nh�c c�c kh�u s�n /True9");
end;

function True9()
	Talk(1,"","Ch�c m�ng mu�i �� qua 3 c�a th� th�ch, h�y �i t�m S� mu�i <color=Red>T� V�n L�u<color>! C� ta �ang � <color=Red>l�i v�o To�n Thi�n Ph�<color>.")
	Uworld36 = SetByte(GetTask(36),1,60)
	SetTask(36,Uworld36)
	AddNote("T�i B�n S�n y�u g�p H� Linh Phi�u, tr� l�i ch�nh x�c ba c�u ��i, qua c�a �i th� ba ")
	Msg2Player("T�i B�n S�n Y�u g�p H� Linh Phi�u, tr� l�i ch�nh x�c ba c�u ��i, qua c�a �i th� ba. V� To�n Thi�n Pha Nh�p Kh�u c�a B�n s�n Y�u t�m T� V�n La s� mu�i ti�p nh�n th� th�ch 'v� c�ng'. ")
end;
