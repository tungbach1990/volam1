--��Ѩ�Թ� ���γ��� trap
-- by��Dan_Deng(2003-07-31)

function main(sel)
	if (GetTask(9) == 50*256+128) and (HaveItem(10) == 1) then
		Msg2Player("B�n ra kh�i nh� lao v� ��ng c�a l�i ")
--		SetPos()
	else
		Msg2Player("N�u B�n kh�ng l�y ���c t�c c�a t�n cu�ng nh�n �� th� kh�ng th� �i ra! ")
	end
end;
