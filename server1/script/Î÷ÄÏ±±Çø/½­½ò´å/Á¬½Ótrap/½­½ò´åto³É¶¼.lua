--���ϱ��� �����to�ɶ�
--Trap ID�����ϱ��� 55
-- Update: Dan_Deng(2003-08-21) ���ͳ���ȼ�Ҫ��Ϊ5��

function main(sel)

if (GetLevel() >= 5) then						--�ȼ��ﵽʮ��
	SetFightState(1);
	NewWorld(11, 3407, 5295)
else
	Talk(1,"","Ph�a tr��c nguy hi�m! Xin h�y quay v� r�n luy�n th�m!")
	SetPos(3402, 6019)						--�߳�Trap��
end

end;
