--��ԭ���� �����to����
--TrapID����ԭ���� 75
-- Update: Dan_Deng(2003-08-21) ���ͳ���ȼ�Ҫ��Ϊ5��

function main(sel)

if (GetLevel() >= 5) then						--�ȼ��ﵽʮ��
	SetFightState(1);
	NewWorld(80, 1446, 3077)
else
	Talk(1,"","Ph�a tr��c nguy hi�m! Xin h�y quay v� r�n luy�n th�m!")
	SetPos(1911, 3211)						--�߳�Trap��
end

end;
