--����ս ��ת��ͼto��ս��ͼ���سǷ���
--Trap ID������ս

Include("\\script\\missions\\citywar_city\\head.lua")

function main()
	ft = GetFightState();
	if (ft == 0) then 
		SetPos(1582,3227)
		SetFightState(1)
		bt_RankEffect(BT_GetData(PL_CURRANK))
	else
		if (GetCurCamp() ~= 1) then 
			Msg2Player("Kh�ng th� �i ���c, n�u �i s� ��n n�i ph�c k�ch c�a ��ch qu�n. ");
			SetPos(1582,3227)
		else
			SetPos(1577,3236)
			SetFightState(0)
		end;
	end;
end;
