--Create by yfeng ,2004-3-9
--����֮�飬80���������ʹ��֮�󣬿��Ի��1��Ǳ��
--���ÿ��2�������Զ�һ��Ǳ�ܵ㣬������5��Ǳ�ܵ�
--����89���������ʹ�ÿ��Ի��5��Ǳ�ܵ�
--����Ʒͬһ���ֻ��ʹ��15��
--�������81��4λ��ʾʹ�ø���Ʒ�Ĵ���
function main(sel)
	times = mod(GetTask(81),16)
	point= {
		{pot=1,msg="M�t �i�m "},
		{pot=2,msg="Ch�a h�a "},
		{pot=3,msg="M�t s� "},
		{pot=4,msg="Kh�ng �t "},
		{pot=5,msg="H�i nhi�u "}
	}
	str ={
		"B�n �� xem k� quy�n T�y T�y kinhnh�ng kh�ng th� hi�u: ( ",
		"B�n �� ��c 'T�y T�y Kinh', nh�n ���c %s",
		"B�n �� xem k� quy�n T�y T�y kinhnh�ng kh�ng th� hi�u: ( "
	}
	level = GetLevel()
	if(level < 80) then  --�ȼ�̫�ͣ�����ʹ��
		Msg2Player(str[1])
		return 1
	end
	if(times > 14) then --ʹ�ó�������
		Msg2Player(str[3])
		return 1
	end
	if(level > 89) then --���ȼ�����Ǳ��
		level = 89
	end
	index = floor((level -80)/2) +1
	AddProp(point[index].pot)
	SetTask(81,times+1)
	Msg2Player(format(str[2],point[index].msg))
	return 0
end

