--��ԭ���� �����to����
--TrapID����ԭ���� 73
-- Update: Dan_Deng(2003-08-21) ���ͳ���ȼ�Ҫ��Ϊ5��

function main(sel)

if (GetLevel() >= 5) then						--�ȼ��ﵽʮ��
	SetFightState(1);
	NewWorld(78, 1799, 3425)
else
	Talk(1,"","Ph�a tr��c nguy hi�m! Xin h�y quay v� r�n luy�n th�m!")
	SetPos(1335, 3397)						--�߳�Trap��
end

end;
