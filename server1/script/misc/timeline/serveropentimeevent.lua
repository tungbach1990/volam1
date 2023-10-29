Include("\\script\\misc\\timeline\\timeevent.lua")
Include("\\script\\misc\\timeline\\timelinemanager.lua")

if not serverOpenTE then
	serverOpenTE = tbTimeEventClass:new({});
	serverOpenTE.strType = "ServerOpenTimeEvent";
	serverOpenTE.SERVER_OPEN_TIME = 0;	--�����0����Է�������һ������ʱ��������Ϊ��������
	serverOpenTE._tbReveiList = {};
	
	serverOpenTE.tbData = {};
	serverOpenTE.strName = "ServerOpenTimeEvent";
end 

function serverOpenTE:Load_2nd(nIdx, nServerOpenTime)
	self.SERVER_OPEN_TIME = nServerOpenTime;
	if(self._tbReveiList[nIdx] ~= nil and type(self._tbReveiList[nIdx]) == "table") then
		self._tbReveiList[nIdx].SERVER_OPEN_TIME = nServerOpenTime;
		self._tbReveiList[nIdx]:Load();
	end
end

function serverOpenTE:Load()
	if (self.SERVER_OPEN_TIME == 0) then
		local nIdx = getn(self._tbReveiList) + 1;
		self._tbReveiList[nIdx] = self;
		RemoteExc("\\script\\misc\\timeline\\serveropentimeevent.lua", "GetServerOpenTime", {},
					"\\script\\misc\\timeline\\serveropentimeevent.lua", "serverOpenTE:Load_2nd", {nIdx});
	end
	
	return 1;
end

--�ݾ��¼����컹ʣ��� �������¼��Ѿ����� ��λ:��
function serverOpenTE:GetEventLeftDay()
	if (self.SERVER_OPEN_TIME == 0) then
		self:Load();
	end
	
	return self:GetEventLeftTime()/(24 * 60 * 60);
end

--�ݾ��¼����컹ʣ��� �������¼��Ѿ����� ��λ:��
function serverOpenTE:GetEventLeftTime()
	if (self.SERVER_OPEN_TIME == 0) then
		self:Load();
	end
	
	local nToday = tonumber(GetLocalDate("%Y%m%d"));
	local nNow = self:ConvertTMToTime(nToday);
	return self.SERVER_OPEN_TIME - nNow;
end

--��ȡ�¼�������20100512
function serverOpenTE:GetEventDay()
	if (self.SERVER_OPEN_TIME == 0) then
		self:Load();
	end
	
	return self:ConvertTimeToTM(self.SERVER_OPEN_TIME);
end

--��ȡ�¼���ʱ��time_t
function serverOpenTE:GetEventTime()
	if (self.SERVER_OPEN_TIME == 0) then
		self:Load();
	end
	
	return self.SERVER_OPEN_TIME;
end

tbTimeLineManager:RegEventTemplete(serverOpenTE);
