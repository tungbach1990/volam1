-- \script\��������\��ɽ\npc\ս��_��������ж���.lua
-- by xiaoyang (2004\4\15) ����90������

function OnDeath()
Uworld122 = GetTask(122)
	if (Uworld122 == 55) then				-- ״̬�У��˴����������
		Talk(1,"","Ng��i l�i ph� h�ng ��i s� c�a Kim qu�c! Kim ch� nh�t ��nh kh�ng bu�ng tha ng��i!")
		SetTask(122,60)  -- �����������Ϊ60
		Msg2Player("Gi�t ch�t t��ng Th�c Nh� H�n n��c Kim, ti�n th�ng v�o doanh tr�i c�u Th��ng B�ch L� v� L� ��ch Phong. ")
		AddNote("Gi�t ch�t t��ng Th�c Nh� H�n n��c Kim, ti�n th�ng v�o doanh tr�i c�u Th��ng B�ch L� v� L� ��ch Phong. ")
	end
end
