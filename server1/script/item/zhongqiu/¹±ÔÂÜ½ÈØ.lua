--Create by mengfan ,2004-9-14
--����ܽ��
--���ã�����߼��±�֮һ������ͬϴ�辭��80���������ʹ�ã�����5��Ǳ�ܵ㡣
--��������������ô���Ʒ����Ҫ�����е��֡�
--����˵��������ƷҪ������ȼ�80��ʱʹ����Ч��ÿ�����ʹ��3�Ρ�
--�������701��4λ��ʾʹ�ø���Ʒ�Ĵ���



function main(sel)
	times = GetTask(701)
        str ={
		"<#> B�n c�n th� m�t mi�ng C�ng Nguy�t Ph� Dung, k�t qu� kh�ng c� chuy�n g� x�y ra.: (",
		"<#> B�n c�n m�t mi�ng C�ng Nguy�t Ph� Dung, c�m th�y c� th� kh�e h�n, kinh m�ch l�u th�ng.",
		"<#> B�n �� �n 3 c�i C�ng Nguy�t Ph� Dung, kh�ng th� d�ng ti�p."
	        }
	level = GetLevel()
	if(level < 80) then     --�ȼ�̫�ͣ�����ʹ��
		Msg2Player(str[1])
		return 1
	end
	if(times > 2) then      --ʹ�ó�������
		Msg2Player(str[3])
		return 1
	end
	AddProp(5)              --Ǳ�ܵ�����5��
	time=date("%m%d%H%M%S")
        name=GetName()
	WriteLog("Ng��i ch�i"..name.."T�i"..time.."�n h�t m�t c�i B�nh Trung thu C�ng Nguy�t Ph� Dung")
	SetTask(701,times+1)
	Msg2Player(str[2])
	return 0
end	