-- ս��_��ӨӨ.lua
-- By: Dan_Deng(2004-04-13)

function OnDeath()
	Uworld50 = GetTask(50)
	if (Uworld50 == 31) then			-- �����˶�����ˣ����Եõ�����
		SetTask(50,40)
		AddEventItem(383)
		Msg2Player("��nh b�i B�ch Doanh Doanh ")
		Talk(2,"","B�ch c� n��ng! ��y ch�nh l� l�i th� c�a c� ph�i kh�ng?","C�i t�n nh� r�i th�ch lo chuy�n c�a ng��i kh�c, ��i Kim qu�c s� kh�ng tha cho ng��i")
	elseif (Uworld50 == 30) then
		SetTask(50,32)
		Msg2Player("��nh b�i B�ch Doanh Doanh ")
		Talk(1,"","A! Ta b� th��ng r�i. M�t s� ��i nh�n, mau ch�y!")
	elseif (Uworld50 == 40) and (HaveItem(383) == 0) then			-- ���µõ�����
		SetTask(50,40)
		AddEventItem(383)
		Msg2Player("��nh b�i B�ch Doanh Doanh ")
		Talk(2,"","B�ch c� n��ng! ��y ch�nh l� l�i th� c�a c� ph�i kh�ng?","C�i t�n nh� r�i th�ch lo chuy�n c�a ng��i kh�c, ��i Kim qu�c s� kh�ng tha cho ng��i")
	end
end
