IncludeLib("SETTING"); --����SETTING�ű�ָ���

function main()
	p = random(0,99)
	if (p < 50) then
		AddItem(0,2,28,2,0,0,0)		-- �����
		Msg2Player("Gi�ng Sinh vui v�! Ch�c m�ng b�n nh�n ���c 'Giang h� t�nh l�' Kinh Thi�n Gi�p!")
		return 0
	else
		AddItem(0,2,28,5,0,0,0)		-- ����ȹ
		Msg2Player("Gi�ng Sinh vui v�! Ch�c m�ng b�n nh�n ���c 'Giang h� t�nh l�' Kh�p ��a Qu�n")
		return 0
	end
	
end