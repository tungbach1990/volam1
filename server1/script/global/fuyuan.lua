--��Եϵͳ
--2004.8.5

TASKID_FY = 151;								--�������ID of ��Ҹ�Եֵ
TASKID_FY_START_ONLINE_TIME = 152;				--�������ID of ������һ�ο�ʼ���ܸ�Եʱ������ʱ�䣨�룩��-1��ʾ��Ե�����ѱ���ͣ
TASKID_FY_ADDITIONAL_TIME = 153;				--�������ID of ��Ҹ�Ե����ͣǰ�ɻ���Ե������ʱ�䣨�룩
TASKID_GAIN_LAST_DATE = 154;					--�������ID of ������һ����ȡ��Ե����
TASKID_GAIN_TIMES_IN_DAY = 155;					--�������ID of ������һ����ȡ��Ե������ȡ��Ե�Ĵ���

TIME_UNIT = 3600;								--����ʱ�䵥λ��1Сʱ��
TIME_PER_FUYUAN = TIME_UNIT;					--1�㸣Ե��ȡ����ʱ�� ��1Сʱ��
TIME_FUYUAN_THRESHOLD1 = 2 * TIME_UNIT;			--��Ե��ȡ�����׼ʱ�� ��2Сʱ��
TIME_FUYUAN_THRESHOLD2 = 4 * TIME_UNIT;			--��Ե˥����ʼʱ�� ��4Сʱ��
FUYUAN_EXTRA = 2;								--�����ĸ�Ե��
TIMES_IN_DAY_EXTRA = 2;							--��ȡ��������һ����ȡ��Ե�Ĵ���

FUYUAN_MAX_GAIN = 100;							--һ�����ɻ�ȡ���ٵ㸣Ե


--������Ե����
function FuYuan_Start()
	--δ�俨
	if( IsCharged() ~= 1 ) then
		return 0;
	end
	SetTask( TASKID_FY_START_ONLINE_TIME, GetGameTime() );
	SetTask( TASKID_FY_ADDITIONAL_TIME, 0 );
	SetTask( TASKID_GAIN_LAST_DATE, date("%Y%m%d") );
	SetTask( TASKID_GAIN_TIMES_IN_DAY, 0 );	
end

--��ͣ��Ե����
function FuYuan_Pause()
	if( IsFuYuanAvailable() ~= 1 ) then
		return 0;
	end
	local nFYStartOnlineTime = GetTask( TASKID_FY_START_ONLINE_TIME );
	local nFYAdditionalTime = GetTask( TASKID_FY_ADDITIONAL_TIME );
	if( IsFuYuanPaused() ~= 1 ) then
		if (nFYAdditionalTime < 0) then
			nFYAdditionalTime = 0
		end		
		local nFYDiffer = GetGameTime() - nFYStartOnlineTime;
		if (nFYDiffer < 0) then
			nFYDiffer = 0
		end				
		local nFYTotalTime = nFYDiffer + nFYAdditionalTime;		
		SetTask( TASKID_FY_ADDITIONAL_TIME, nFYTotalTime );
		SetTask( TASKID_FY_START_ONLINE_TIME, -1 );
	end
end

--������Ե����
function FuYuan_Resume()
	if( IsFuYuanAvailable() ~= 1 or IsFuYuanPaused() ~= 1 ) then
		return 0;
	end
	SetTask( TASKID_FY_START_ONLINE_TIME, GetGameTime() );
end

--����ʱ�任ȡ��Ե ( ����ֵ 1:������ȡ, 0:����ʱ�䲻����ȡ��Ե, -1:δ�俨��Ե������δ���� )
function FuYuan_Gain()
	if( IsFuYuanAvailable() ~= 1 ) then
		return -1;
	end
	
	local nFuYuanGained = 0;			--��ȡ�ĸ�Ե��;
	local nFYStartOnlineTime;
	local nFYTotalTime, nFYValidTime = FuYuan_GetDepositTime();
	local nCurrentOnlineTime = GetGameTime();
	local nFYGainLastDate = GetTask( TASKID_GAIN_LAST_DATE );
	local nFYGainTimesInDay = GetTask( TASKID_GAIN_TIMES_IN_DAY )
	
	--����ʱ�䲻����ȡ��Ե
	if( nFYValidTime < TIME_FUYUAN_THRESHOLD1 ) then
		return 0;
	end
		
	nFuYuanGained = floor( nFYValidTime / TIME_PER_FUYUAN );
	nFYGainTimesInDay = nFYGainTimesInDay + 1;
	nFYStartOnlineTime = nCurrentOnlineTime - mod( nFYValidTime, TIME_UNIT );
	
	--һ������ȡ�㹻�θ�Ե,�����ٽ�����Ե
	if( tonumber(date("%Y%m%d")) == nFYGainLastDate ) then
		if( nFYGainTimesInDay == TIMES_IN_DAY_EXTRA ) then
			nFuYuanGained = nFuYuanGained + FUYUAN_EXTRA;
		end
	else
		nFYGainLastDate = date("%Y%m%d");
		nFYGainTimesInDay = 1;
	end
	
	if( nFuYuanGained >= FUYUAN_MAX_GAIN ) then
		FuYuan_Add( FUYUAN_MAX_GAIN );
		WriteLog( "["..date("%Y-%m-%d %X").."] "..GetAccount().."("..GetName()..") get over "..FUYUAN_MAX_GAIN.." FUYUAN. (Current OnlineTime: "..GetGameTime().." sec)" );
	else
		FuYuan_Add( nFuYuanGained );
	end
	SetTask( TASKID_FY_START_ONLINE_TIME, nFYStartOnlineTime );
	SetTask( TASKID_FY_ADDITIONAL_TIME, 0 );
	SetTask( TASKID_GAIN_LAST_DATE, nFYGainLastDate );
	SetTask( TASKID_GAIN_TIMES_IN_DAY, nFYGainTimesInDay );
	return 1;
end

--�����ҵ�ǰ�ɻ�ȡ��Ե���ۻ�����ʱ�䣨�룩 ��2������ֵ���ֱ�Ϊ��ȡ��Ե������ʱ�����Чʱ�䣩
function FuYuan_GetDepositTime()
	if( IsFuYuanAvailable() ~= 1 ) then
		return 0, 0;
	end
	local nCurrentOnlineTime = GetGameTime();
	local nFYStartOnlineTime = GetTask( TASKID_FY_START_ONLINE_TIME );
	local nFYAdditionalTime = GetTask( TASKID_FY_ADDITIONAL_TIME );
	local nFYTotalTime;
	local nFYValidTime;
	--��Ե�����ѱ���ͣ
	if( IsFuYuanPaused() == 1 ) then
		if( GetTeamSize() > 1 ) then
			return 0, 0;		--���״̬�²��ܼ�����Ե���ܣ���ֹ���ֱ����ڹһ������Ѵ��츣Ե���쳣����ʱ��������ͣ״̬�ƻ�
		else
			nFYStartOnlineTime = nCurrentOnlineTime;	--ֻ�ܻ�ȡ��֮ͣǰ���ܵ�����ʱ��
			FuYuan_Resume();	--������Ե����,��ֹ��ԵPause��δResume����ȡ��Ե���쳣����µ��µĸ�Ե��������
		end
	end
		
	if (nFYAdditionalTime < 0) then
		nFYAdditionalTime = 0;
		SetTask(TASKID_FY_ADDITIONAL_TIME, 0);
	end
	
	if ((nCurrentOnlineTime - nFYStartOnlineTime) < 0) then
		SetTask(TASKID_FY_START_ONLINE_TIME, nCurrentOnlineTime);				
		nFYStartOnlineTime = nCurrentOnlineTime;
	end
	
	nFYTotalTime = ( nCurrentOnlineTime - nFYStartOnlineTime ) + nFYAdditionalTime;	
			
	if( nFYTotalTime <= TIME_FUYUAN_THRESHOLD2 ) then
		nFYValidTime = nFYTotalTime;
	else
		local nHour = floor( nFYTotalTime / TIME_UNIT );
		nFYValidTime = ( nHour - floor( ( nFYTotalTime - TIME_FUYUAN_THRESHOLD2 ) / ( 2 * TIME_UNIT ) ) ) * TIME_UNIT + mod( nFYTotalTime, TIME_PER_FUYUAN );
	end
	return nFYTotalTime, nFYValidTime;
end

--�����ҵĸ�Եֵ
function FuYuan_Get()
	return GetTask( TASKID_FY );
end

--������ҵĸ�Եֵ
function FuYuan_Set( value )
	if( IsFuYuanAvailable() ~= 1 ) then
		return 0;
	end
	SetTask( TASKID_FY, value );
	SyncTaskValue( TASKID_FY );
	return 1;
end

--������ҵĸ�Եֵ
function FuYuan_Add( value )
	local nResult = FuYuan_Set( FuYuan_Get() + value );
	if(  nResult == 1 ) then
		Msg2Player( "<#> B�n nh�n ���c "..value.."<#> �i�m ph�c duy�n" );
	end
	return nResult;
end

--������ҵĸ�Եֵ
function FuYuan_Reduce( value )
	local nResult = FuYuan_Set( FuYuan_Get() - value );
	if(  nResult == 1 ) then
		Msg2Player( "<#> B�n �� t�n"..value.."<#> �i�m ph�c duy�n" );
	end
	return nResult;
end

--�ж�����Ƿ�����
function IsCharged()
	if( GetExtPoint( 0 ) >= 1 ) then
		return 1;
	else
		return 0;
	end
end

--�ж�����Ƿ��Ѿ�������Ե����
function IsFuYuanStarted()
	local nFYStartOnlineTime = GetTask( TASKID_FY_START_ONLINE_TIME );
	if( nFYStartOnlineTime == 0 ) then
		return 0;
	else
		return 1;
	end
end

--�ж���ҿɷ���и�Ե����
function IsFuYuanAvailable()
	--δ�俨��δ������Ե����
	if( IsCharged() ~= 1 or IsFuYuanStarted() ~= 1 ) then
		return 0;
	else
		return 1;
	end
end

--�ж���Ҹ�Ե�����Ƿ��ѱ���ͣ
function IsFuYuanPaused()
	local nFYStartOnlineTime = GetTask( TASKID_FY_START_ONLINE_TIME );
	if( nFYStartOnlineTime < 0 ) then
		return 1;
	else
		return 0;
	end
end
