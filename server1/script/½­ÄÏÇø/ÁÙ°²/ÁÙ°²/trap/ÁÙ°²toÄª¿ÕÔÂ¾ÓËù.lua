
function main()
	Uworld43 = GetTask(43)
	if (Uworld43 == 90) and (HaveItem(381) == 1) and (HaveItem(382) == 1) then
		SetTask(43,100)
		DelItem(381)
		DelItem(382)
		Talk(7,"U43_go","C�u m�ng! Xin c�u m�ng!","D�ng tay!","To gan! D�m can thi�p v�o chuy�n c�a b�n c�ng t� �?","Ng��i l� m�t t�n b�n th�u gi� danh th�nh k� phong l�u! Ng��i c�n mu�n h�i th�m bao nhi�u ng��i n�a?","Ha! Ha! Ha! Tri�u ��nh th� th�i n�t. Chi�n lo�n x�y ra kh�p n�i. Ai c�ng ch� mu�n s�ng y�n th�n. Ngay c� Ho�ng Th��ng c�n kh�ng ch� � ��n ta. Ng��i l�i c� mu�n nh�ng tay?","��ng nhi�u l�i! ��nh �i!","H�m! Mu�n l�m anh h�ng �? �� xem ng��i c� b�n l�nh g�!")
	elseif (Uworld43 == 100) then
		Talk(1,"U43_go","Ha!Ha! B�n th� h� c�a ta c�n n��ng tay n�n m�i �� cho ng��i gi� ���c m�ng ��n ��y. ")
	elseif (Uworld43 == 90) then			-- �����У����߶��˲��ý�����ʾ
		Talk(1,"","B�n �� th� h�i l�u nh�ng c�nh c�a v�n kh�ng m�! Ch� nghe ���c ti�ng con g�i k�u la!")
		Msg2Player("Kh�ng c� hai chi�c ch�a kh�a V�n-L�i th� ng��i s� kh�ng th� v�o n�i c�a c�ng t� �� ch� ng� h�n. ")
	end
end

function U43_go()
	SetFightState(1)
	NewWorld(233, 1597,3207)
end
