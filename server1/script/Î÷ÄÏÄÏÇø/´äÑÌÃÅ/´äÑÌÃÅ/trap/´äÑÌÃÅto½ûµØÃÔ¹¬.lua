-- �������� ������to�����Թ�������60������
--Trap ID���������� 17
-- By: Dan_Deng(2003-09-09)

function main(sel)
	UTask_cy = GetTask(6)
	if (UTask_cy > 60*256) and (GetFaction() == "cuiyan") then
		SetFightState(1)
		NewWorld(158, 1584, 3191);
	elseif (UTask_cy <= 60*256) then
--		SetPos()
		Talk(1,"","Kh�ng ���c x�ng v�o c�m ��a b�n m�n!")
	else
--		SetPos()
		Talk(1,"","N�i n�y l� c�m ��a Th�y Y�n kh�ng ���c x�ng v�o!")
	end
end;
