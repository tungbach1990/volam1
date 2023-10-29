GLBID_GOLD_COUNT = 3;					--ȫ�ֱ���ID of ��һʱ���й��ӻ�õĽ�����
GLBID_SILVER_COUNT = 4;					--ȫ�ֱ���ID of ��һʱ���й��ӻ�õ�������
GLBID_BRONZE_COUNT = 5;					--ȫ�ֱ���ID of ��һʱ���й��ӻ�õ�������
EXTPOINT_LAST_AWARD_DATETIME = 6;		--��չ��ID of ����ϴ���ȡ��Ʒ��ʱ��

--�콱ʱ��� ( { ��ʼʱ�䣬 ����ʱ�� } ʱ���ʽΪHHMM )
aryAwardTime = { { 1000, 1400 }, { 1900, 2000 }, { 2300, 2400 } };

--"ȫ�ֱ���ID of ������"������
arynMedalCountGlbID = { GLBID_GOLD_COUNT, GLBID_SILVER_COUNT, GLBID_BRONZE_COUNT };

--��Ʒ����
aryAwardItem = {{ "Ti�n Th�o L� ", {6,1,71,1,0,0,0} },	--���ƽ�Ʒ
				{ "B�ch C�u ho�n", {6,1,74,1,0,0,0} },	--���ƽ�Ʒ
				{ "Ph�o Hoa", {6,0,11,1,0,0,0} }};	--ͭ�ƽ�Ʒ
				
--��������	����ֵ��3���� ����������������ͭ������ ��������Ϊ���� -1:δ�俨  -2:��ǰ�����콱ʱ��  -3:�������
function olympics_Award()
	--δ�俨
	if( IsCharged() ~= 1 ) then
		return -1;
	end
	
	local nCurrTime = tonumber( date( "%H%M" ) );
	local nAwardTimeCount = getn( aryAwardTime );
	local nCurrTimeIndex = -1;
	
	for i = 1, nAwardTimeCount do
		if( aryAwardTime[i][1] <= nCurrTime and nCurrTime < aryAwardTime[i][2] ) then
			nCurrTimeIndex = i;
			break;
		end
	end
	
	--��ǰ�����콱ʱ��
	if( nCurrTimeIndex == -1 ) then
		return -2;
	end	
	
	local nCurrAwardDateTime = tonumber( date( "%m%d" )..nCurrTimeIndex );
	local nLastAwardDateTime = GetExtPoint( EXTPOINT_LAST_AWARD_DATETIME );
	
	if( nCurrAwardDateTime == nLastAwardDateTime ) then
		--�������
		return -3;
	else
		local nMedalRankCount = getn( arynMedalCountGlbID );
		local arynMedalCount = {};
		
		for i = 1, nMedalRankCount do
			arynMedalCount[i] = GetGlbValue( arynMedalCountGlbID[i] );
			for j =1, arynMedalCount[i] do
				AddItem( aryAwardItem[i][2][1], aryAwardItem[i][2][2], aryAwardItem[i][2][3], aryAwardItem[i][2][4], aryAwardItem[i][2][5], aryAwardItem[i][2][6] , aryAwardItem[i][2][7]);
			end
			if( arynMedalCount[i] > 0 ) then
				Msg2Player( "B�n ��t ���c"..arynMedalCount[i].."c�i"..aryAwardItem[i][1] );
			end
		end		
		
		--�����콱��־
		if( nCurrAwardDateTime > nLastAwardDateTime and ( arynMedalCount[1] > 0 or arynMedalCount[2] > 0 or arynMedalCount[3] > 0 ) ) then
			AddExtPoint( EXTPOINT_LAST_AWARD_DATETIME, nCurrAwardDateTime - nLastAwardDateTime );
		else
			PayExtPoint( EXTPOINT_LAST_AWARD_DATETIME, nLastAwardDateTime - nCurrAwardDateTime );
		end
				
		return arynMedalCount[1], arynMedalCount[2], arynMedalCount[3];
	end	
end

--�ж�����Ƿ�����
function IsCharged()
	if( GetExtPoint( 0 ) >= 1 ) then
		return 1;
	else
		return 0;
	end
end