--��ԭ���� �꾩�� ��¥�ϰ�Ի�������50������
-- Update: Dan_Deng(2003-10-25)

function main(sel)
	UTask_sl = GetTask(7)
	if (UTask_sl == 50*256+20) and (HaveItem(123) == 0) then		-- 50�����������
		Say("�� nh�t Thi�u K� t�u ��y! Kinh th�nh �� nh�t t�u ��y! Ch� c� 500 l��ng th�i!",2,"Mua/buy","Kh�ng m�ng /no")
	else
		Talk(1,"","Kh�ch quan mu�n u�ng r��u �? U�ng r��u th� ���c, nh�ng ta n�i tr��c, ��n ��y ch� ���c u�ng r��u, kh�ng n�i chuy�n qu�c s�. N�u nh� mu�n n�i chuy�n qu�c s� th� xin m�i ��n n�i kh�c! ")
	end
end;

function buy()
	if (GetCash() >= 500) then
		Pay(500)
		AddEventItem(123)
		Msg2Player("Mua ���c m�t con g� n��ng � t�u l�u ")
		AddNote("Mua ���c m�t con g� n��ng � t�u l�u ")
	else
		Talk(1,"","Kh�ch quan! G�i con g� n�y � ��y! Xin h�y v� mang ti�n ��n ��! ")
	end
end

function no()
end
