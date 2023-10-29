TASKTMPID_MEDAL_RANK = 153;			--��ʱ�������ID of ��ǰ�Ự�����е��Ľ��Ƶȼ� ��1��2��3��
TASKTMPID_MEDAL_RANGE = 154;		--��ʱ�������ID of ��ǰ�Ự�����е��Ľ�������Χ ��0��1��...��9��
TASKTMPID_MEDAL_ANSWER = 155;		--��ʱ�������ID of ��ǰ�Ự�����ѡ������Ŀ��� ��DWORD��
--TASKID_MEDAL_ANSWER = 2004;			--�������ID of ������ (test)
METALCHOOSE_ID = 1000;

aryszMedalRank = { "����", "����", "ͭ��" };

function onMedalmain()	
	SetTaskTemp( TASKTMPID_MEDAL_ANSWER, 0 );
	SetTaskTemp( TASKTMPID_MEDAL_RANK, 1 );
	showMedalRange();	
end

function showMedalRange()
	local aryszRange = {};
	local nRangeCount = 8;
	local szMedalRank = aryszMedalRank[ GetTaskTemp( TASKTMPID_MEDAL_RANK ) ];
		
	for i = 1, nRangeCount do
		aryszRange[ i ] = ( i - 1 ) * 10 .. "-".. ( i - 1 ) * 10 + 9 .. "ö/onRangeSelect";
	end
	aryszRange[ nRangeCount + 1 ] = "�˳�/onCancel";	
	
	Say( szMedalRank.."����Χ:", nRangeCount + 1, aryszRange );
end

function onRangeSelect( nSel )
	local aryszNumber = {};
	local nMedalRank = GetTaskTemp( TASKTMPID_MEDAL_RANK );
	
	for i = 1, 10 do
		aryszNumber[i] = ( nSel * 10 + i - 1 ).."ö/onNumberSelect";
	end
	aryszNumber[ 11 ] = "����/showMedalRange";
	
	SetTaskTemp( TASKTMPID_MEDAL_RANGE, nSel );
	Say( aryszMedalRank[ nMedalRank ].."��:", 11, aryszNumber );
end

function onNumberSelect( nSel )
	local nMedalRank = GetTaskTemp( TASKTMPID_MEDAL_RANK );
	local nMedalRange = GetTaskTemp( TASKTMPID_MEDAL_RANGE );
	local nMedalAnswer = GetTaskTemp( TASKTMPID_MEDAL_ANSWER );	
	local nMedalNumber = nMedalRange * 10 + nSel;
	nMedalAnswer = SetByte( nMedalAnswer, nMedalRank, nMedalNumber );
	SetTaskTemp( TASKTMPID_MEDAL_ANSWER, nMedalAnswer );
	if( nMedalRank < getn( aryszMedalRank ) ) then
		SetTaskTemp( TASKTMPID_MEDAL_RANK, nMedalRank + 1 );
		showMedalRange();
	else
		confirm();
	end
end

function confirm()
	local nRankCount = getn( aryszMedalRank );
	local szConfirmInfo = "��ѡ����";
	local nMedalAnswer = GetTaskTemp( TASKTMPID_MEDAL_ANSWER );
	
	for i = 1, nRankCount do
		szConfirmInfo = szConfirmInfo..GetByte( nMedalAnswer, i ).."ö"..aryszMedalRank[i];
	end
	szConfirmInfo = szConfirmInfo..",�����Ʊ��";
	
	Say( szConfirmInfo, 2, "ȷ��/onSubmit", "ȡ��/onCancel" );
end

function onSubmit()
	local nMedalAnswer = GetTaskTemp( TASKTMPID_MEDAL_ANSWER );	
	if (Pay(5000) > 0) then
		if (AddTicket(METALCHOOSE_ID , nMedalAnswer) == 1) then
			nItem = AddItem(6,1,75,1,0,0)
			SetSpecItemParam(nItem, 1, METALCHOOSE_ID )
			SetSpecItemParam(nItem, 2, nMedalAnswer);
			SetSpecItemParam(nItem, 3, GetByte(nMedalAnswer, 3))	
			SyncItem(nItem)
		else
			Earn(5000);
			Say("�Բ��𣬸����ƱĿǰ���޷��ٹ����ˡ�", 0)
		end;
	else
		Say("�Բ��������֧��5000�������Ʊ��", 0)
	end
end

function onCancel()
end
