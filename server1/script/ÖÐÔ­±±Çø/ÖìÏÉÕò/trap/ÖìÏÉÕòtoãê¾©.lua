--��ԭ���� ������to�꾩
--TrapID����ԭ���� 59
-- Update: Dan_Deng(2003-08-21) ���ͳ���ȼ�Ҫ��Ϊ5��

function main(sel)

if (GetLevel() >= 5) then						--�ȼ��ﵽʮ��
	SetFightState(1);
	NewWorld(37, 1945, 3855)
else
	Talk(1,"","Ph�a tr��c nguy hi�m! Xin h�y quay v� r�n luy�n th�m!")
	SetPos(1506, 2860)						--�߳�Trap��
end

end;
