--Create by yfeng 2004-3-9
--Modified by fangjieying 2003-5-16
--�䵱�ؼ�������80�����ϵ��䵱����ʹ��֮�󣬿��Լ�1�㼼�ܵ�
--������ʦ��������ת������ǰ��
--����Ʒ���ֻ��ʹ��15��
--�������80��4λ��ʾʹ�ø���Ʒ�Ĵ���
function main(sel)
	times = mod(GetTask(80),16)
	party = GetLastAddFaction()
	str={
		"B�n c�m quy�n V� �ang M�t T�ch nghi�n c�u c� n�a ng�y, k�t qu� c�ng kh�ng l�nh ng� ���c g�. ",
		"B�n c�m quy�n V� �ang M�t T�ch nghi�n c�u c� n�a ng�y, k�t qu� l�nh ng� ���c ch�t �t. ",
		"B�n c�m quy�n V� �ang M�t T�ch nghi�n c�u c� n�a ng�y, k�t qu� l�nh ng� ���c ch�t �t. ",
		"B�n �� nghi�n ng�m k� quy�n V� �ang M�t T�ch, nh�ng kh�ng thu ���c �i�u g� t�m ��c "
		}
	if(party ~= "wudang") then     -- �����䵱�� 
		Msg2Player(str[1])
		return 1
	elseif (GetLevel()<80) then    -- ���䵱�ɣ����ȼ�С��80
		Msg2Player(str[2])
		return 1
	elseif(times > 14) then        -- ʹ�ô����Ѵﵽ����
			Msg2Player(str[4])
		return 1
	else
		AddMagicPoint(1)            -- �Ӽ��ܵ�1
		SetTask(80,times+1)
		Msg2Player(str[3])
		return 0
	end
end