Include("\\script\\activitysys\\playerfunlib.lua");

huihuangzhiguo_advance = {}

huihuangzhiguo_advance.nDailyCountLimit = 5;
huihuangzhiguo_advance.nLevelLimit = 120;
huihuangzhiguo_advance.tbEXP =  --���Ӷ�Ӧ�����
{
	{15000000, "B�ch Ni�n Huy Ho�ng qu�"},
	{23000000, "Thi�n Ni�n Huy Ho�ng qu�"},
	{30000000, "V�n Ni�n Huy Ho�ng qu�"},
};

huihuangzhiguo_advance.tbZhenLuTSK =  --ʹ����¶TSKID�͸����Ӧ��Ʒ��
{
	{2669, {tbProp={6,1,2269,1,0,0}}, "B�ch Ni�n Tr�n L�", "B�ch Ni�n Huy Ho�ng qu�"},
	{2670, {tbProp={6,1,2270,1,0,0}}, "Thi�n Ni�n Tr�n L�", "Thi�n Ni�n Huy Ho�ng qu�"},
	{2671, {tbProp={6,1,2271,1,0,0}}, "V�n Ni�n Tr�n L�", "V�n Ni�n Huy Ho�ng qu�"},
};

function huihuangzhiguo_advance:UseGuoZi(nGuoziLevel)
	if (self:CheckLevelLimit() ~= 1) then
		return 0;
	end
	
	if (self:CheckCountLimit() ~= 1) then
		return 0;
	end
	
	if (self.tbEXP[nGuoziLevel] == nil) then
		return 0;
	end
	
	PlayerFunLib:AddExp(self.tbEXP[nGuoziLevel][1], 0, format("%s ph�n th��ng",self.tbEXP[nGuoziLevel][2]));
	SetTask(2313, GetTask(2313) + 1)
	return 1;
end

function huihuangzhiguo_advance:UseZhenLu(nZhenLuLevel)
	if (self:CheckLevelLimit() ~= 1) then
		return 0;
	end
	
	self:AddZhenLuCount(nZhenLuLevel);
	Msg2Player(format("��i hi�p �� s� d�ng %d %s, l�c nh�t qu� huy ho�ng c�n c� th� thu ���c %d %s, tr�ng th�i n�y s� m�t v�o 0 gi�", 
										PlayerFunLib:GetTaskDailyCount(self.tbZhenLuTSK[nZhenLuLevel][1]), self.tbZhenLuTSK[nZhenLuLevel][3], 
										PlayerFunLib:GetTaskDailyCount(self.tbZhenLuTSK[nZhenLuLevel][1]), self.tbZhenLuTSK[nZhenLuLevel][4]));
	return 1;
end

function huihuangzhiguo_advance:CheckLevelLimit()
	if (GetLevel() < self.nLevelLimit) then
		lib:ShowMessage(format("C�p %d tr� l�n (k� c� %d) m�i c� th� s� d�ng!", self.nLevelLimit, self.nLevelLimit));
		return 0;
	end
	
	return 1;
end

function huihuangzhiguo_advance:CheckCountLimit()
	local nDate = tonumber(GetLocalDate("%m%d"))
	if ( GetTask(2312) ~= nDate ) then
		SetTask(2312, nDate)
		SetTask(2313, 0)
	end
	
	if (GetTask(2313) >= self.nDailyCountLimit) then
		lib:ShowMessage(format("H�m nay c�c h� �� s� d�ng %d qu� huy ho�ng r�i, c�ng l�c t�ng qu� nhanh c�ng s� b� ph�n t�c d�ng ��. ��i ng�y mai r�i h�y d�ng nh�.", self.nDailyCountLimit));
		return 0;
	end
	
	return 1;
end

function huihuangzhiguo_advance:AddZhenLuCount(nZhenLuLevel)
	if (self.tbZhenLuTSK[nZhenLuLevel] ~= nil) then
		PlayerFunLib:AddTaskDaily(self.tbZhenLuTSK[nZhenLuLevel][1], 1);
	end
end

function huihuangzhiguo_advance:ReduceZhenLuCount(nZhenLuLevel)
	if (self.tbZhenLuTSK[nZhenLuLevel] ~= nil) then
		PlayerFunLib:AddTaskDaily(self.tbZhenLuTSK[nZhenLuLevel][1], -1);
	end
end

function huihuangzhiguo_advance:GetGuoZiAvd()
	local nCount = 0;
	for i=getn(self.tbZhenLuTSK),1,-1 do --�Ӹ߼����ͼ�����
		local nZhenLu = PlayerFunLib:GetTaskDailyCount(self.tbZhenLuTSK[i][1]);
		if (nZhenLu > 0) then
			tbAwardTemplet:GiveAwardByList(self.tbZhenLuTSK[i][2], "Nh�t qu� huy ho�ng");
			self:ReduceZhenLuCount(i);
			nCount = 1;
			break;
		end
	end
	
	return nCount;
end