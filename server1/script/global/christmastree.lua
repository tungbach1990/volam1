--  GetGlbValue(9)  ��¼ʱ��hour
--  GetGlbValue(8)  ��¼��ȡ����
--  GetTask(615)    ��¼һСʱ���Ƿ��������
--  ʥ����������ÿСʱÿ̨��������13�����ÿ��ÿСʱֻ����ȡһ��
--  �˻��12��22�ճ�����1��11��


function main()

	iRand = random(1,300)
	if ( iRand < 100 ) then
		Say("Ta c�u nguy�n b�n C�y Th�ng, ��t nhi�n ph�t hi�n tr�n c�y c� 1 v�t ph�t s�ng.",2,"Hay qu�! Th�t l� h�p d�n!/present","Ta s� chuy�n t�m h�n!/no")
	else
		Say("Ng��i ch�i: C�y Th�ng ��p qu�! C�u nguy�n � ch� n�y s� th�nh hi�n th�t!",0)
	end

end

function present()

	local nLastTime = GetGlbValue(9)
	local nQuantity = GetGlbValue(8)
	local Utask615 = GetTask(615)
	local nHour = tonumber( date( "%m%d%H" ) )
	local nMinute = tonumber( date( "%M") )
	
	if ( nLastTime == 0 and mod( nHour , 100 ) ~= 0 and nMinute < 30 ) then
		SetGlbValue(9,nHour - 1)
		SetGlbValue(8,0)
		AddLocalNews("***�ng gi� Noel �� nhi�u qu� tr�n C�y Th�ng, m�i ng��i mau ��n l�y �i!***")
	elseif ( nLastTime ~= nHour and nMinute >= 30 ) then
		SetGlbValue(9,nHour)
		SetGlbValue(8,0)
--		Msg2Player("New hour : ["..nHour.."o'clock] Reset")
		AddLocalNews("***�ng gi� Noel �� nhi�u qu� tr�n C�y Th�ng, m�i ng��i mau ��n l�y �i!***")
	end
	nLastTime = GetGlbValue(9)
	nQuantity = GetGlbValue(8)
	if ( Utask615 ~= nLastTime and nQuantity <= 14 ) then
		onTake()
		SetGlbValue(8,nQuantity + 1)
		SetTask(615,nLastTime)
--		Msg2Player("AddItem 1,total = "..nQuantity + 1)
	elseif ( Utask615 == nLastTime ) then
		Say("��ng c� tham th�! H�y nh��ng c� h�i cho ng��i kh�c v�i!",0)
	else
		Say("�� t�t ch�p m�t �� b� l�y h�t, 1 gi� sau h�y quay l�i th� v�n may �i!",0)
--		SetTask(615,nHour)
	end		

end

function onTake()

	i = random(1,100000)
	if ( i < 40000 ) then
		AddItem(6,0,20,1,0,0,0)
		Msg2Player("�! L� m�t ��a hoa h�ng! Ta mu�n t�ng n� cho ng��i y�u.")
	elseif ( i < 85000 ) then
		AddItem(6,0,11,1,0,0,0)
		Msg2Player("�! L� 1 c�y Ph�o hoa, ta s� b�n cho m�i ng��i xem.")
	elseif ( i < 90000 ) then
		AddItem(6,1,72,1,0,0,0)
		Msg2Player("�! L� 1 b�nh Thi�n S�n B�o L�! Hy v�ng n� s� �em l�i may m�n cho ta.")
	elseif ( i < 95000 ) then
		AddItem(6,1,73,1,0,0,0)
		Msg2Player("Ha! 1 b�nh B�ch Qu� L�, ta �ang c�n n� ��y!")
	else
		AddItem(6,1,125,1,0,0,0)
		Msg2Player("Ha? 1 b�nh Qu� Hoa t�u, ta mu�n t�m m�t ng��i b�n c�ng nhau ��i �m!")
	end

end

function no()
end
