--description: ������ͨ���� �񺣵�����
--author: yuanlan	
--date: 2003/3/10
-- Update: Dan_Deng(2003-08-13)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(10) == 1 then
		allbrother_0801_FindNpcTaskDialog(10)
		return 0;
	end
	UTask_tm = GetTask(2)
	Uworld37 = GetByte(GetTask(37),1)
	if (Uworld37 == 60) then					--��������
		if (HaveItem(33) == 0) then
			Talk(1,"","L�y ���c g�y tr�c m�u xanh r�i ��n t�m ta!")
		elseif (HaveItem(34) == 0) then
			Talk(1,"","L�y ���c g�y tr�c m�u tr�ng r�i ��n t�m ta!")
		else
			Talk(1,"enroll_V3_Q1","��p ��ng 3 qu� c�a ta, th� c� th� l�y ���c <color=Red>g�y tr�c m�u t�m<color>. Nghe k� ��y:")
		end
	elseif (Uworld37 == 80) then						--�Ѿ���������
		if (HaveItem(35) == 1) then
			Talk(1,"","Mu�n qua �i thu�n l�i, ng��i ph�i l�y �� 3 c�y tr�c, sau �� ��a cho ��ng m�n � l�i ra.")
		else
			AddEventItem(35)
			Talk(1,"","T�i sao ng��i l�i v�t g�y tr�c trong r�ng? Ta s� gi�p ng��i nh�t l�i, ��ng v�t lung tung n�a! ")
		end
	elseif (GetFaction() == "tangmen") then
		Talk(1,"","M�i ng��i ��u l� huynh �� ��ng m�n, ng��i kh�ng c�n x�ng v�o Tr�c H�i Tam Quan! ")
	else
		Talk(1,"","��ng ch�y lung tung, coi ch�ng b� kh� c�n!")
	end
end;

function enroll_V3_Q1()
	Say("Qu� th� nh�t l� 'Ch�nh Nam v� Ch�nh ��ng':", 3, "Li�t H�a Oanh L�i /enroll_V3_Q2", "Ngh�ch nh� n��c l�a /False1", "�� d�u v�o l�a /False1")
end;

function False1()
	Talk(1,"","Qu� th� nh�t ��p sai r�i, c� th� m�y con kh� �� s� n�i cho ng��i bi�t.")
end;

function enroll_V3_Q2()
	Say("��ng r�i! Qu� th� 2 l� '��ng Nam v� Ch�nh B�c':", 3, "N�i cao s�ng d�i /False2", "M�a gi� kh�i sinh /enroll_V3_Q3", "Th� nh� v� b�o /False2")
end;

function False2()
	Talk(1,"","Kh�ng ��ng! Sao kh�ng h�i m�y con kh�?")
end;

function enroll_V3_Q3()
	Say("��ng r�i! Qu� cu�i l� 'T�y B�c v� T�y Nam':", 3, "Phong H�nh Th�y Th��ng /False3", "Thi�n tai ��ch h�a /enroll_V3_prise", "Non s�ng g�m v�c /False3")
end;	

function False3()
	Talk(1,"","Sai r�i! ��ng t��ng ng��i th�ng minh h�n con kh�, kh�ng ch�ng n� bi�t nhi�u h�n ��y! ")
end;

function enroll_V3_prise()
	Talk(1,"","3 qu� ng��i ��u ��p ��ng, ��y l� g�y tr�c m�u t�m c�a ng��i. N�u l�y �� 3 c�y g�y tr�c giao cho ��ng m�n � l�i ra, s� thu�n l�i qua �i.")
	AddEventItem(35)
	Msg2Player("T�i �i th� 3 tr� l�i ���ng M�n tr�ng �inh c�u �� v� 8 qu� b�i, c� ���c g�y tr�c t�m. ")
	Uworld37 = SetByte(GetTask(37),1,80)
	SetTask(37,Uworld37)
	AddNote("T�i �i th� 3 tr� l�i ���ng M�n tr�ng �inh c�u �� v� 8 qu� b�i, c� ���c g�y tr�c t�m. ")
end;	
