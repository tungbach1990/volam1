--Create by mengfan 2004-9-14
--���¹���
--���ã�����߼��±�֮һ������ͬ�����ؼ���80���������ʹ�ã�����һ���书���ܵ㡣
--��������������ô���Ʒ����Ҫ�����е��֡�
--����˵��������ƷҪ������ȼ�80��ʱʹ����Ч��ÿ�����ʹ��2�Ρ�
--�������700��4λ��ʾʹ�ø���Ʒ�Ĵ���

function main(sel) 
	times = GetTask(700)
	str={
		"<#> B�n th� c�n m�t mi�ng Ph�ng Nguy�t Qu� Dung, k�t qu� kh�ng c� chuy�n g� x�y ra.: (",
		"<#> B�n c�n m�t mi�ng Ph�ng Nguy�t Qu� Dung, k�t qu� ph�t hi�n v� c�ng kh�ng c� g� thay ��i.",
		"<#> B�n th� c�n m�t mi�ng Ph�ng Nguy�t Qu� Dung, k�t qu� ph�t hi�n c� lu�ng ch�n kh� trong ng��i �ang v�n chuy�n",
		"<#> B�n �� �n 2 c�i Ph�ng Nguy�t Qu� Dung, kh�ng th� d�ng ti�p."
		}
	if(times > 1) then                -- ʹ�ô����Ѵﵽ����
		Msg2Player(str[4])
		return 1
	elseif (GetLevel() < 80) then     -- �ȼ�С��80
		Msg2Player(str[2])
		return 1
	else                            	
		AddMagicPoint(1)          -- ����1�㼼�ܵ�
		time=date("%m%d%H%M%S")
	        name=GetName()
	    	WriteLog("Ng��i ch�i"..name.."T�i"..time.."�n h�t m�t c�i B�nh Trung thu Ph�ng Nguy�t Qu� Dung")
		SetTask(700,times+1)
		Msg2Player(str[3])
		return 0
	end
end