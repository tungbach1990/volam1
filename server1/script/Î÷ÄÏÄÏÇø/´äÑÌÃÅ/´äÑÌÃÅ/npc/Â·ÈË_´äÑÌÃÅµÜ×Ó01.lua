-- ������ �����ŵ���1 ��������
-- by��Dan_Deng(2003-07-25)

function main()
	UTask_cy = GetTask(6)
	Uworld36 = GetByte(GetTask(36),2)
	if (Uworld36 == 10) then		--�������������
		Talk(1,"U36_enter","Sau khi v�o tr�n, nh�n ���c Hoa T�nh, ��n <color=Red>l�i ra c�a Hoa Kh�i<color> giao cho S� t� l� ���c.")
	elseif (Uworld36 == 0) and (GetLevel() >=10) and (GetFaction() ~= "cuiyan") then		--��������
		Say("Theo m�n quy, mu�n tr� th�nh �� t� k� danh ph�i qua <color=Red>Hoa Kh�i tr�n<color>, d�a v�o s� d�ng c�m v� t�i tr� l�y ���c <color=Green>Hoa T�nh<color>, ng��i c� mu�n th� kh�ng?",2,"���c, �� ta th� /enroll_yes","Kh�ng, ta ch� ��n tham quan. /no")
	elseif (GetFaction() == "cuiyan") then			-- ͬ��
		Say("S� mu�i mu�n ��n Hoa Kh�i tr�n luy�n c�ng �?",2,"��ng v�y, xin t� h�y �� cho mu�i v�o /U36_enter","Ta ch� ��n th�m t� /no")
	elseif (UTask_cy == 70*256) then
		Talk(1,"","S� t� l�n n�y v� l� �� th�m vi�ng c�c t� mu�i, c� g� thay ��i kh�ng?")
	else
		Talk(1,"","Hoan ngh�nh t�n kh�ch gi� l�m, xin �i v�o con ���ng b�n c�nh Hoa Kh�i tr�n.")
	end
end;

function enroll_yes()
	Talk(1, "U36_enter", "� ��y l� <color=Red>c�ng v�o<color>. Sau khi v�o tr�n l�y ���c Hoa T�nh ��n Hoa Kh�i tr�n giao cho S� t� l� ���c.")
	Uworld36 = SetByte(GetTask(36),2,10)
	SetTask(36,Uworld36)
	AddNote("Ti�p nh�n nhi�m v� Hoa Kh�i tr�n ti�n v�o Hoa Kh�i tr�n v� l�y ���c Hoa T�nh mang giao cho �� t� Th�y Y�n m�n � l�i ra ")
	Msg2Player("Ti�p nh�n nhi�m v� Hoa Kh�i tr�n ti�n v�o Hoa Kh�i tr�n v� l�y ���c Hoa T�nh mang giao cho �� t� Th�y Y�n m�n � l�i ra ")
end;

function U36_enter()
--	SetPos(207,1693)
	SetPos(210,1622)
end

function no()
end;
