--Create by yfeng 2004-3-9
--Modified by fangjieying 2003-5-16
--�����ؼ�������80�����ϵ����ʹ��֮�󣬿��Լ�1�㼼�ܵ�
--������ʦ��������ת������ǰ��
--����Ʒ���ֻ��ʹ��15��
--�������80��4λ��ʾʹ�ø���Ʒ�Ĵ���
function main(sel) 
	times = mod(GetTask(80),16)
	str={
		"B�n c�m quy�n V� L�m M�t T�ch nghi�n c�u c� n�a ng�y, k�t qu� c�ng kh�ng l�nh ng� ���c g�. ",
		"B�n c�m quy�n V� L�m M�t T�ch nghi�n c�u c� n�a ng�y, k�t qu� l�nh ng� ���c ch�t �t. ",
		"B�n c�m quy�n V� L�m M�t T�ch nghi�n c�u c� n�a ng�y, k�t qu� c�ng thu ���c m�t v�i �i�u t�m ��c li�n quan ��n v� c�ng ",
		"B�n �� nghi�n ng�m k� quy�n V� L�m M�t T�ch, nh�ng kh�ng thu ���c �i�u g� t�m ��c "
		}
	if(times >14) then                -- ʹ�ô����Ѵﵽ����
		Msg2Player(str[4])
		return 1
	elseif (GetLevel() < 80) then     -- �ȼ�С��80
		Msg2Player(str[2])
		return 1
	else                            	-- ����1�㼼�ܵ�
		AddMagicPoint(1)
		SetTask(80,times+1)
		Msg2Player(str[3])
		return 0
	end
end