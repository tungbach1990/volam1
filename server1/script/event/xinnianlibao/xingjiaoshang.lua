-- �н����˽ű�
-- 2005-12-07 for newyear gift

function main()

	Say("Kh�ch quan c�n b�o v�t g� c� m� <color=yellow>K� Tr�n C�c<color> ch�n l� ���c. Cu�i c�ng l�o phu c�ng c� th� ngh� ng�i r�i!", 0);
	return

--	Say("�н����ˣ���λ�͹٣��������׼������ǰɣ�������½���һ�����<color=yellow>������Ũ��������<color>������ʵ�ݣ����״��ѻ��������Լ��ö����ʰ�����㿴���ɣ�", 
--	6,
--			"����Ԫ���������/buy_yuandan",
--			"����ͬ��������/buy_partnermask",
--			"��������������/buy_randomtask",
--			"����ͬ�鼼�������/buy_skillbook",
--			"����׾������/buy_baijuwan",
--			"�Ҿ��ǿ���/OnCancel")
end

function OnCancel()
end

function buy_partnermask()
	Sale(132, 3)
end

function buy_randomtask()
	Sale(133, 3)
end

function buy_skillbook()
	Sale(134, 3)
end

function buy_baijuwan()
	Sale(135, 3)
end

function buy_yuandan()
	Sale(137, 3)
end