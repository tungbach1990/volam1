-- ս��_�����ʹ.lua
-- By: Dan_Deng(2004-04-13)

function OnDeath()
	Uworld50 = GetTask(50)
	if ((Uworld50 == 32) or (Uworld50 == 40)) and (HaveItem(383) == 0) then			-- �����˶�����ˣ����Եõ�����
		SetTask(50,40)
		AddEventItem(383)
		Msg2Player("��nh b�i B�ch Doanh Doanh ")
		Talk(2,"","B�ch c� n��ng! ��y ch�nh l� l�i th� c�a c� ph�i kh�ng?","C�i t�n nh� r�i th�ch lo chuy�n c�a ng��i kh�c, ��i Kim qu�c s� kh�ng tha cho ng��i")
	elseif (Uworld50 == 30) then
		SetTask(50,31)
		Talk(1,"","B�ch ti�u th�! Mau ch�y!")
	end
end
