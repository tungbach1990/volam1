IncludeLib("SETTING")
--Create by yfeng ,2004-3-9
--���޺�������ϰ����������ʵս���飬
--��ÿ10��Ϊһ���Σ������ӵľ���Ϊ�ü����������������辭��
--���ܺ͵�ƽ��ֵ��1/10,����һ���ļ��ʻ����1/10�ľ��飬���򣬻���ٲ��־���
--���壺10������100%���1/10���飬100������5%���1/10����
--���������಻�ܻ�ó���1/10�����50%
--1�����°�1���㣬100�����ϣ���100����
--����Ʒ������ʹ�ô���������¼ʹ�õĴ���
--�������82���ڼ�¼����Ʒ��ʹ�ô���
--�������������֣�����ʹ�ø���Ʒ�ˡ�

TASKIDDAY 	= 2595;
TASKIDEXP	= 2596;
GETMAXEXP	= 150000000;	-- ÿ����Ի�õľ�������

function main(sel)
	exps={
		{430,100},
		{2960,90},
		{9490,80},
		{22515,70},
		{48190,50},
		{104980,30},
		{246310,20},
		{609360,15},
		{1511850,10},
		{3611636,5}
	}
	msg={
		"B�n ��u v�i Thi�t La H�n h�n n�a ng�y, k�t qu� �� thu ���c m�t s� kinh nghi�m th�c ti�n chi�n ��u ",
		"B�n ��u v�i Thi�t La H�n h�n n�a ng�y, k�t qu� �� thu ���c m�t s� kinh nghi�m th�c ti�n chi�n ��u ",
		"B�n c�ng v�i Thi�t La H�n ��i luy�n h�n n�a ng�y, k�t qu� kh�ng thu ���c hi�u qu� g� ",
		"��i hi�p �� thu ���c kinh nghi�m cao nh�t t� ho�t ��ng n�y.",
	}
	local nDate = tonumber(GetLocalDate("%m%d"))
	if ( GetTask(TASKIDDAY) ~= nDate ) then
		SetTask(TASKIDDAY, nDate)
		SetTask(TASKIDEXP, 0);
		SetTask(82,0)
	end
	num = GetTask(82) --ȡʹ�ô�������û������ʹ��40���ڴΰɣ�������������
	level = GetLevel()
	if(level <1) then 
		level =1
	end
	if(level > 130) then
		Msg2Player(msg[3])
		return 1
	end


	if (GetTask(82) >= 10) then
		Talk(1,"","M�i ng�y ch� ���c x� d�ng 10 quy�n")
		return 1
	end
	if(level >100) then
		level = 100
	end	
	levelseg = floor((level-1)/10)+1
	rnd = random(100)
	if(rnd > exps[levelseg][2]) then --���������
		nExp = floor(exps[levelseg][1]*rnd/200);
		if (nExp + GetTask(TASKIDEXP) > GETMAXEXP) then
			Msg2Player(msg[4]);
			return 1
		end
		AddOwnExp(nExp)
		Msg2Player(msg[1])
		SetTask(TASKIDEXP, GetTask(TASKIDEXP) + nExp);
		SetTask(82,num+1)
		return 0
	end
	--���ã���ò��پ���
	if (exps[levelseg][1] + GetTask(TASKIDEXP) > GETMAXEXP) then
		Msg2Player(msg[4]);
		return 1
	end
	AddOwnExp(exps[levelseg][1])
	Msg2Player(msg[2])
	SetTask(TASKIDEXP, GetTask(TASKIDEXP) + exps[levelseg][1]);
	SetTask(82,num+1)
	return 0
end