-- ؤ�� ִ�������ϲ��� 20������
-- by��Dan_Deng(2003-07-28)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_gb = GetTask(8);
	if (GetSeries() == 3) and (GetFaction() == "gaibang") then
		if (UTask_gb == 20*256+20) then			--����20������
			Talk(2,"L20_prise","Ta v�a d�y cho M�nh Vi�n T�i m�t b�i h�c, c�nh c�o h�n sau n�y kh�ng ���c �c hi�p huynh �� trong bang, n�u nh� ta c� l�m sai, xin M�nh tr��ng l�o tr�ch ph�t!","Ng��i l�m r�t ��ng! Ch� t�i ta th��ng ng�y qu� nu�ng chi�u ��a ch�u n�y, l�n n�y ng��i cho n� m�t b�i h�c. R�t t�t! Ta c�ng t� ph�n minh. L�n n�y phogn ng��i l� �� t� c�p 20!")
		else
			Talk(1,"","M�nh Vi�n t�i ng�y c�ng k�u ng�o, ch� t�i v� ta �� qu� c�ng chi�u n�!")
		end
	else
		Talk(1,"","C�i Bang ch�ng ta ��i ��ch v�i Kim Qu�c, Kim Qu�c xem ch�ng ta nh� c�i gai trong m�t, to�n l�c gi�t �� t� C�i Bang.")
	end
end;

function L20_prise()
	SetTask(8,30*256)
	SetRank(39)
--	AddMagic(129)
	add_gb(30)			-- ����skills_table.lua�еĺ���������Ϊѧ�����ټ����ܡ�
	Msg2Player("Ch�c m�ng B�n!. �� ���c th�ng l�: C�i Bang Ch�p B�t �� t�. H�c ���cH�a hi�m Vi Di ")
	AddNote("Ch�c m�ng B�n!. �� ���c th�ng l�: C�i Bang  Ch�p B�t �� t�. H�c ���c H�a Hi�m Vi Di ")
end
