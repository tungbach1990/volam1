Include("\\script\\event\\wulin_2nd\\data.lua")
--Role Value--
WULIN_TASK_LOGIN = 1570

WULIN_TB_TIME = {
	register = {open = 03030000, close = 03162400},	--ȷ���ʸ�ʱ��
	elector = {open = 03100000, close = 03162400},		--��ѡʱ��
	leader = {open = 03162400, close = 03232400}		--Ʊѡ�����
}

function wulin_canInfo2Player()
	nClientID = WULIN_TB_ZONEID[GetGateWayClientID()]
	if (nClientID == nil or nClientID == 0) then
		return
	end
	local curdate = tonumber(date("%m%d%H%M"))
	if (curdate >= WULIN_TB_TIME.register.open and curdate <= WULIN_TB_TIME.register.close) then
		if (GetTask(WULIN_TASK_LOGIN) == 0) then
			if (WULIN_TB_ROLES[nClientID][GetName()]) then
				Msg2Player("���ڶ������ִ�ᡱ��ǰ��Χѡ���ʸ�ȷ���Ѿ���ʼ����������<color=yellow>�ٰ�-���ִ���Ա(202,202)<color>��ȷ�������ʸ�ȷ���ʸ����ڽ�ֹ<color=yellow>2006��3��17����ʱ<color>��")
			else
				SetTask(WULIN_TASK_LOGIN, -1)
			end
		end	
	end
end

if login_add then login_add(wulin_canInfo2Player, 2) end