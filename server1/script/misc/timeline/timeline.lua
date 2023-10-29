Include("\\script\\misc\\timeline\\head.lua")

if not tbTimeLineClass then
	tbTimeLineClass = tbBaseClass:new()
	
	tbTimeLineClass.strType = "BaseTimeLineType";
	tbTimeLineClass.tbData = {};
	tbTimeLineClass.strName = "BaseTimeLine";
	tbTimeLineClass.tbBeginEvent = nil;
	tbTimeLineClass.tbEndEvent = nil;
	tbTimeLineClass.nBeginDayLimit = 0; -- �ݿ�ʼ�¼������� ʱ���߿���
	tbTimeLineClass.nEndDayLimit = 0; -- �ݽ����¼������� ʱ���߹ر�
	tbTimeLineClass.strBeginEventType = "";
	tbTimeLineClass.strEndEventType = "";
	tbTimeLineClass.strBeginEventName = "";
	tbTimeLineClass.strEndEventName = "";
end

function tbTimeLineClass:_init(tbTimeLineData)
	if not tbTimeLineData then
		return 
	end
	for i,j in tbTimeLineData do
		self[i] = j
	end
end

--����
function tbTimeLineClass:Load()
	if (type(self.tbBeginEvent) == "table" and type(self.tbBeginEvent.Load) == "function" and self.tbBeginEvent:Load() ~= 1) then
		return 0;
	end
	
	if (type(self.tbEndEvent) == "table" and type(self.tbEndEvent.Load) == "function" and self.tbEndEvent:Load() ~= 1) then
		return 0;
	end
	
	return 1;
end

--�Ƿ�����
function tbTimeLineClass:IsBegin()
	-- ���û���趨ʱ���߿�ʼ�ͽ����¼� Ĭ���Զ�����
	if (self.tbBeginEvent == nil and self.tbEndEvent == nil) then
		return 1;
	end
	
	if (type(self.tbEndEvent) == "table" and type(self.tbEndEvent.GetEventLeftDay) == "function") then
		local nEventLeftDay = self.tbEndEvent:GetEventLeftDay();
		-- ����ر���
		if ((nEventLeftDay + self.nEndDayLimit) <= 0) then
			return 0;
		end
	end
	
	if (type(self.tbBeginEvent) == "table" and type(self.tbBeginEvent.GetEventLeftDay) == "function") then
		local nEventLeftDay = self.tbBeginEvent:GetEventLeftDay();
		-- ���������
		if ((nEventLeftDay + self.nBeginDayLimit) <= 0) then
			return 1;
		else
			return 0;
		end
	end
	
	return 1;
end

--�Ƿ�ر���
function tbTimeLineClass:IsEnd()
	if (self:IsBegin() == 0) then
		return 1;
	else
		return 0;
	end
end

--�ݿ�����ʣ���,����Ѿ���ʼ��Ϊ�������Ѿ��������
function tbTimeLineClass:GetOpenLeftDay()
	if (type(self.tbBeginEvent) == "table" and type(self.tbBeginEvent.GetEventLeftDay) == "function") then
		local nEventLeftDay = self.tbBeginEvent:GetEventLeftDay();
		return nEventLeftDay + self.nBeginDayLimit;
	end
	
	return 0;
end

--�ݿ�����ʣ���,����Ѿ���ʼ��Ϊ�������Ѿ��������
function tbTimeLineClass:GetOpenLeftTime()
	return self:GetOpenLeftDay()*24*60*60;
end

--��ȡ����������20100512
function tbTimeLineClass:GetOpenDay()
	if (type(self.tbBeginEvent) == "table" and type(self.tbBeginEvent.GetEventTime) == "function") then
		local nOpenTime = self.tbBeginEvent:GetEventTime() + self.nBeginDayLimit*24*60*60;
		return self:ConvertTimeToTM(nOpenTime);
	end
	
	return 0;
end

--��ȡ������ʱ��time_t
function tbTimeLineClass:GetOpenTime()
	if (type(self.tbBeginEvent) == "table" and type(self.tbBeginEvent.GetEventTime) == "function") then
		return self.tbBeginEvent:GetEventTime() + self.nBeginDayLimit*24*60*60;
	end
	
	return 0;
end

--��ȡ�رյ�����20100512
function tbTimeLineClass:GetEndDay()
	if (type(self.tbEndEvent) == "table" and type(self.tbEndEvent.GetEventTime) == "function") then
		local nEndTime = self.tbEndEvent:GetEventTime() + self.nEndDayLimit*24*60*60;
		return self:ConvertTimeToTM(nEndTime);
	end
	
	return 0;
end

--��ȡ�رյ�ʱ��time_t
function tbTimeLineClass:GetEndTime()
	if (type(self.tbEndEvent) == "table" and type(self.tbEndEvent.GetEventTime) == "function") then
		local nEndTime = self.tbEndEvent:GetEventTime() + self.nEndDayLimit*24*60*60;
		return nEndTime;
	end
	
	return 0;
end

--�ݹرջ�ʣ���,����Ѿ��ر���Ϊ�������Ѿ��ر��˶��
function tbTimeLineClass:GetEndLeftDay()
	if (type(self.tbEndEvent) == "table" and type(self.tbEndEvent.GetEventLeftDay) == "function") then
		local nEventLeftDay = self.tbEndEvent:GetEventLeftDay();
		return nEventLeftDay + self.nEndDayLimit;
	end
	
	-- ����ر�
	return 1;
end

--�ݹرջ�ʣ���,����Ѿ��ر���Ϊ�������Ѿ��ر��˶��
function tbTimeLineClass:GetEndLeftTime()
	return self:GetEndLeftDay()*24*60*60;
end

--20100512
function tbTimeLineClass:ConvertTMToTime(nDate)
	local nNowYear = (floor(nDate/10000));
	local nNowMon = floor(mod(nDate, 10000) / 100);
	local nNowDay = mod(nDate, 100);
	return Tm2Time(nNowYear, nNowMon, nNowDay);
end

function tbTimeLineClass:ConvertTimeToTM(nTime)
	local tbTM = Time2Tm(nTime);
	return tbTM[1]*10000 + tbTM[2]*100 + tbTM[3];
end