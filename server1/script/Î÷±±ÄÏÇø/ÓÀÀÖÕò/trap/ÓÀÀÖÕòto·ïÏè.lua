--�������� ������to���踮
--TrapID���������� 28
-- Update: Dan_Deng(2003-08-21) ���ͳ���ȼ�Ҫ��Ϊ5��

function main(sel)

if (GetLevel() >= 5) then						--�ȼ��ﵽʮ��
	SetFightState(1);
	NewWorld(1, 1800 ,3603)
else
	Talk(1,"","Ph�a tr��c nguy hi�m! Xin h�y quay v� r�n luy�n th�m!")
	SetPos(1411, 2913)						--�߳�Trap��
end

end;
