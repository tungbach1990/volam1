-- �嶾 ·��NPC �嶾����1 ��������
-- by��Dan_Deng(2003-08-05)

function main()
	Uworld37 = GetByte(GetTask(37),2)
	if (Uworld37 == 10) then		-- ����������
		if ((HaveItem(227) == 1) and (HaveItem(223) == 1) and (HaveItem(225) == 1) and (HaveItem(226) == 1) and (HaveItem(227) == 1)) then
			Talk(1,"","Oa! T�i sao l�i Kh�ng t��c v� t�ng cho ta v�y. Ph�i mang ��n t�ng cho s� huynh � trong ��ng n�y m�i ��ng. ")
		else
			Talk(1,"","Th�i gian luy�n c�ng v�n ch�a ��, t�i sao ng��i l�i ra ��y? Xem c�i b� d�ng �� ��n c�a ng��i k�a. L�m sao c� th� tr� th�nh �� t� c�a b�n m�n? Su�t ��i ch� c� m� m� th�i. ")
		end
	elseif (Uworld37 == 0) and (GetLevel() >= 10) and (GetFaction ~= "wudu") then		--��������
		Say("Mu�n tr� th�nh �� t� k� danh c�a b�n m�n, c�n ph�i th� luy�n qua Ng� ��c ��ng n�y. Ng��i c� mu�n th� kh�ng",2,"D�! �� ta th� xem! /enroll_get_yes","Kh�ng, ta ch� ��n tham quan. /no")
	else							-- ����Ի�
		Talk(1,"","��ng c� ch�y lo�n nh� v�y. ��c tr�ng nu�i trong ��ng m� c�n th� ng��i v� ph��ng c�u ch�a. ")
	end
end;

function enroll_get_yes()
	Uworld37 = SetByte(GetTask(37),2,10)
	SetTask(37,Uworld37)
	AddNote("Nh�n nhi�m v� ��n Ng� ��c ��ng luy�n c�ng, �i v�o trong ��ng, b�n s� nh�n ���c 5 s�i l�ng mao chim Kh�mg T��c. ")
	Msg2Player("Nh�n nhi�m v� ��n Ng� ��c ��ng luy�n c�ng, �i v�o trong ��ng, b�n s� nh�n ���c 5 s�i l�ng mao chim Kh�mg T��c. ")
end;

function no()
end;
