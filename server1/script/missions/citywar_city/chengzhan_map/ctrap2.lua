
--����ս ��ת��ͼto��ս��ͼ���سǷ���
--Trap ID������ս
--211��1622��3249      211��1608��3235
Include("\\script\\missions\\citywar_city\\head.lua")

function main()
	ft = GetFightState();
	if (ft == 0) then 
		SetPos(1866,3547)
		SetFightState(1)
		bt_RankEffect(BT_GetData(PL_CURRANK))
	else
		if (GetCurCamp() ~= 2) then 
			Msg2Player("Kh�ng th� �i ���c, n�u �i s� ��n n�i ph�c k�ch c�a ��ch qu�n. ");
			SetPos(1866,3547)
		else
			SetPos(1875,3571)
			SetFightState(0)
		end;
	end;
end;
