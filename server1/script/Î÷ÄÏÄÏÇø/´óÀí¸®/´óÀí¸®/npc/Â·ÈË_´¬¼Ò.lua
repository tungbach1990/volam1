-- ���� ·��NPC ���ң�������30������
-- by��Dan_Deng(2003-07-26)

function main()
	UTask_cy = GetTask(6)
	if ((UTask_cy == 30*256+40) and (HaveItem(2) == 0)) then		--30�����������
		Talk(5,"L30_pay","H�m nay th�t l� b�i thu, ��nh b�t ���c nhi�u t�m c� qu�! ","Ng��i c� c� Ng�n Tuy�t kh�ng?","C� Ng�n Tuy�t? H�m nay ta b�t ���c m�y con.","Ng��i c� th� b�n cho ta m�t �t ���c kh�ng?","Ng��i c�n th� ta s� b�n cho m�t �t, nhi�u ��y t�nh cho ng��i 1000 l��ng th�i.")
	else
		Talk(1,"","Thuy�n Gia: ��p n��c ��i L� u�n quanh, anh em ng�n s�ng c�ch n�i, n�i s�ng mu�n tr�ng xa c�ch, mu�n g�p c�ng kh�ng th� g�p ���c.")
--		Talk(1,"","���ң����������Ǹ��Ѵ����������չ����Ǹ��Ѽҷ�����")
	end
end;

function L30_pay()
	if (GetCash() >= 1000) then
		Pay(1000)
		AddEventItem(2)
		AddNote("Mua ���c c� Ng�n Tuy�t ")
		Msg2Player("Mua ���c c� Ng�n Tuy�t c�a thuy�n gia � Nh� H�i ")
	else
		Talk(1,"","Kh�ng c� ti�n? V�y sao ���c ch�?")
	end
end;
