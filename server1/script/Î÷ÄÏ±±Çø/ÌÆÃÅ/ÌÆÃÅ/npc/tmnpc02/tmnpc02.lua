--description: ������ͨ���� �񺣵ڶ���
--author: yuanlan	
--date: 2003/3/10
-- Update: Dan_Deng(2003-08-13)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(9) == 1 then
		allbrother_0801_FindNpcTaskDialog(9)
		return 0;
	end
	UTask_tm = GetTask(2)
	Uworld37 = GetByte(GetTask(37),1)
	if (Uworld37 == 20) then					--��������
		if (HaveItem(33) == 1) then
			Talk(1,"enroll_V2_Q1","G�y tr�c n�y ��ng r�i! B�y gi� xin tr� l�i m�t v�n ��!")
		else
			Talk(1,"","C� ���c <color=Red>g�y tr�c m�u xanh<color> r�i ��n t�m ta!")
		end
	elseif (Uworld37 >= 60) and (Uworld37 < 127) then						--�Ѿ�������һ��
		if (HaveItem(34) == 1) then
			Talk(1,"","Mu�n qua �i thu�n l�i, ng��i ph�i l�y �� 3 c�y tr�c, sau �� ��a cho ��ng m�n � l�i ra.")
		else
			AddEventItem(34)
			Talk(1,"","T�i sao ng��i l�i v�t g�y tr�c trong r�ng? Ta s� gi�p ng��i nh�t l�i, ��ng v�t lung tung n�a! ")
		end
	else
		Talk(1,"","� ��y th�i gian d�i m�i bi�t th� ra ��i M� h�u n�y c�ng bi�t t�nh ng��i.")
	end
end;

function enroll_V2_Q1()
	Say("C�u cung tr�n c� 9 �, m�i � c� 1 s�, sau khi �i�n �� r�i, b�t lu�n ngang hay d�c c� 3 s� c�ng l�i c� t�ng l� 15, ng��i bi�t l�m kh�ng? H�ng th� nh�t l�:", 3, "4, 9, 2 /False1", "2, 4, 9 /False1", "2, 9, 4 /enroll_V2_Q2")
end;

function False1()
	Talk(1,"","Kh�ng ��ng! M�y con <color=Red>��i M� h�u, ��i D� h�u<color> xem ra c�n th�ng minh h�n ng��i!")
end;

function enroll_V2_Q2()
	Say("��p ��ng r�i! C�n h�ng th� 2 ���c ch�a?", 3, "7, 5, 3 /enroll_V2_Q3", "5, 3, 7 /False2", "5, 7, 3 /False2")
end;

function False2()
	Talk(1,"","Kh�ng ��ng! H�y �i h�i <color=Red>��i M� h�u, ��i D� h�u<color>�i! ")
end;

function enroll_V2_Q3()
	Say("��ng r�i! V�y h�ng cu�i c�ng �i�n th� n�o:", 3, "6, 8, 1 /False3", "8, 1, 6 /False3", "6, 1, 8 /enroll_V2_prise")
end;

function False3()
	Talk(1,"","Kh�ng ��ng! T�i sao kh�ng �i h�i <color=Red>��i M� h�u, ��i D� h�u<color> ch�?")
end;

function enroll_V2_prise()
	Talk(1,"","T�t l�m! G�y tr�c m�u tr�ng n�y c�a ng��i! Qua �i th� 3 t�m Tr�ng �inh l�y <color=Red>g�y tr�c m�u t�m<color> �i!")
	AddEventItem(34)
	Msg2Player("T�i �i th� 2 tr� l�i ���ng M�n tr�ng �inh v� c�u �� ma tr�n 9 s�, c� ���c g�y tr�c m�u tr�ng. ")
	Uworld37 = SetByte(GetTask(37),1,60)
	SetTask(37,Uworld37)
	AddNote("T�i �i th� 2 tr� l�i ���ng M�n tr�ng �inh v� c�u �� ma tr�n 9 s�, c� ���c g�y tr�c m�u tr�ng. ")
end;
