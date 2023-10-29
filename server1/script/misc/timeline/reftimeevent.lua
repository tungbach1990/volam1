Include("\\script\\misc\\timeline\\timeevent.lua")
Include("\\script\\misc\\timeline\\timelinemanager.lua")

if not refTE then
	refTE = tbTimeEventClass:new({});
	refTE.strType = "RefTimeEvent";
	refTE.tbData = {};
	refTE.strName = "RefTimeEvent";
	refTE.strRefTimeLineName = "";--�����ñ��б���
	refTE.tbRefTL = nil;
	refTE.nRefEventTime = 0;
	refTE.bBeginOrEnd = 0; 	--ʱ���ߵĿ�ʼ�����, 0 ����ʱ���߿�ʼ��������ΪnRefEventTime; 1����ʱ���߽�����������ΪnRefEventTime
							--�����ñ��б���
end

function refTE:Load()
	if (self.strRefTimeLineName == nil or type(self.strRefTimeLineName) ~= "string" or self.strRefTimeLineName == "") then
		return 0;
	end
	
	return 1;
end

function refTE:DelayLoad()
	if (self.strRefTimeLineName == nil or type(self.strRefTimeLineName) ~= "string" or self.strRefTimeLineName == "") then
		return 0;
	end
	
	local tbTL = tbTimeLineManager:GetTimeLine(self.strRefTimeLineName);
	
	if (tbTL == nil) then
		return 0;
	end
	
	self.tbRefTL = tbTL;
	if (self.bBeginOrEnd == 0) then
		self.nRefEventTime = tbTL:GetOpenTime();
	else
		self.nRefEventTime = tbTL:GetEndTime();
	end
	
	return 1;
end

--�ݾ��¼����컹ʣ��� �������¼��Ѿ����� ��λ:��
function refTE:GetEventLeftDay()
	if (self.tbRefTL == nil) then
		self:DelayLoad();
	end
	
	return self:GetEventLeftTime()/(24 * 60 * 60);
end

--�ݾ��¼����컹ʣ��� �������¼��Ѿ����� ��λ:��
function refTE:GetEventLeftTime()
	if (self.tbRefTL == nil) then
		self:DelayLoad();
	end
	
	local nToday = tonumber(GetLocalDate("%Y%m%d"));
	local nNow = self:ConvertTMToTime(nToday);
	return self.nRefEventTime - nNow;
end

--��ȡ�¼�������20100512
function refTE:GetEventDay()
	if (self.tbRefTL == nil) then
		self:DelayLoad();
	end
	
	return self:ConvertTimeToTM(self.nRefEventTime);
end

--��ȡ�¼���ʱ��time_t
function refTE:GetEventTime()
	if (self.tbRefTL == nil) then
		self:DelayLoad();
	end
	
	return self.nRefEventTime;
end

tbTimeLineManager:RegEventTemplete(refTE);
