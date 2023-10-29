Include("\\script\\misc\\timeline\\timeevent.lua")
Include("\\script\\misc\\timeline\\timelinemanager.lua")

if not fixTE then
	fixTE = tbTimeEventClass:new({});
	fixTE.strType = "FixTimeEvent";
	fixTE.tbData = {};
	fixTE.strName = "FixTimeEvent";
	fixTE.nEventDate = 0;		--�����ñ��б���
	fixTE.nEventTime = 0;
end

function fixTE:Load()	
	if (self.nEventDate == nil or type(self.nEventDate) ~= "number" or self.nEventDate == 0) then
		return 0;
	end
	
	self.nEventTime = self:ConvertTMToTime(self.nEventDate);
	return 1;
end

--�ݾ��¼����컹ʣ��� �������¼��Ѿ����� ��λ:��
function fixTE:GetEventLeftDay()
	return self:GetEventLeftTime()/(24 * 60 * 60);
end

--�ݾ��¼����컹ʣ��� �������¼��Ѿ����� ��λ:��
function fixTE:GetEventLeftTime()
	local nToday = tonumber(GetLocalDate("%Y%m%d"));
	local nNow = self:ConvertTMToTime(nToday);
	return self.nEventTime - nNow;
end

--��ȡ�¼�������20100512
function fixTE:GetEventDay()
	return self.nEventDate;
end

--��ȡ�¼���ʱ��time_t
function fixTE:GetEventTime()
	return self.nEventTime;
end

tbTimeLineManager:RegEventTemplete(fixTE);
